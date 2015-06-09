using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.Web.Services;
using System.Data.SqlClient;
using FrogPond.Infrastructure;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using Newtonsoft.Json.Linq;


namespace FrogPond
{
    public partial class Main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           // For this project I used ado.net,although I know there are more efficient and practical tools like linq and entityframework 
            //but since I've never worked with them I was more convenient to use ADO.net,as you can see I created webmethod functions to communicate with my jquery ajax and transmitting data as json
        }

        [WebMethod]
        public static string getData()
        {
            
            List<Frogs> lfrog = new List<Frogs>();
            String data = string.Empty;
            using (SqlConnection con = new SqlConnection(DB.GetConnectionString()))
            {
                con.Open();
                using (SqlCommand com = new SqlCommand("Select * from Frogs Order by ID", con))
                {
                    SqlDataReader rd = com.ExecuteReader();
                    while (rd.Read())
                    {
                        Frogs frogs = new Frogs();
                        frogs.ID = rd["ID"].ToString();
                        frogs.Name = rd["Name"].ToString();
                        frogs.Gender = rd["Gender"].ToString();
                        frogs.Environment = rd["Environment"].ToString();
                        frogs.Birth = (rd["Birth"] == DBNull.Value || Convert.ToDateTime(rd["Birth"]) == DateTime.MinValue) ? "" : Convert.ToDateTime(rd["Birth"]).ToString("yyyy-MM-dd");
                        frogs.Death = (rd["Death"] == DBNull.Value || Convert.ToDateTime(rd["Death"]) == DateTime.MinValue) ? "" : Convert.ToDateTime(rd["Death"]).ToString("yyyy-MM-dd");

                        lfrog.Add(frogs);
                    }
                }
               
            }

            data = JsonConvert.SerializeObject(lfrog);


           return data;
        }

        [WebMethod]
        public static string deleteData(int id)
        {
            string data = "";
            using (SqlConnection con = new SqlConnection(DB.GetConnectionString()))
            {
                con.Open();
                using (SqlCommand com = new SqlCommand("Delete from Frogs where ID = @ID", con))
                {
                    com.Parameters.AddWithValue("@ID",id);
                    com.ExecuteNonQuery();
                    data = "success";
               
                }

            }

           return data;
        }


        [WebMethod]
        public static string addData(Frogs frog)
        {
            string data = "";

            using (SqlConnection con = new SqlConnection(DB.GetConnectionString()))
            {
                con.Open();
                using (SqlCommand com = new SqlCommand("Insert Into Frogs values(@Name,@Gender,@Environment,@Birth,@Death)", con))
                {
                    com.Parameters.AddWithValue("@Name", frog.Name);
                    com.Parameters.AddWithValue("@Gender", frog.Gender);
                    com.Parameters.AddWithValue("@Environment", frog.Environment);
                    com.Parameters.AddWithValue("@Birth", frog.Birth);
                    com.Parameters.AddWithValue("@Death", frog.Death);
                    com.ExecuteNonQuery();
                    data = "success";

                }

            }

            return data;
        }

        [WebMethod]
        public static string updateData(Frogs frog)
        {
            string data = "";

            using (SqlConnection con = new SqlConnection(DB.GetConnectionString()))
            {
                con.Open();
                using (SqlCommand com = new SqlCommand("Update Frogs set Name = @Name,Gender = @Gender,Environment = @Environment,Birth = @Birth,Death = @Death where ID = @ID", con))
                {
                    com.Parameters.AddWithValue("@ID", frog.ID);
                    com.Parameters.AddWithValue("@Name", frog.Name);
                    com.Parameters.AddWithValue("@Gender", frog.Gender);
                    com.Parameters.AddWithValue("@Environment", frog.Environment);
                    com.Parameters.AddWithValue("@Birth", (frog.Birth == "") ? DBNull.Value.ToString() : frog.Birth);
                    com.Parameters.AddWithValue("@Death", (frog.Death == "") ? DBNull.Value.ToString() : frog.Death);
                    com.ExecuteNonQuery();
                    data = "success";

                }

            }

            return data;
        }
    }
}