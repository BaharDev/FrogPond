<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="FrogPond.Main" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%--I used bootstrap since it's has nice design with nice components(table,modals,interactive buttons,...)--%>
    <link type="text/css" rel="Stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" />
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
    <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/2.1.0/mustache.min.js"></script>
    <script id="Itemtpl" type="text/template">
//    For this project I decided to use Mustache.js since I worked with it before and it's quite flexible and easy use
    {{#.}}
     <tr>
    <td id="idtd">{{ID}}</td>
    <td id="nametd">{{Name}}</td>
    <td id="gendertd">{{Gender}}</td>
    <td id="environtd">{{Environment}}</td>
    <td id="birthtd">{{Birth}}</td>
    <td id="deathtd">{{Death}}</td>
    <td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs edit" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></p></td>
    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs delete" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
    </tr>
    {{/.}}
    </script>
    <script type="text/javascript" src="Scripts/frog.js"></script>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h4>
                    Frog Pond</h4>
                <div class="table-responsive">
                <input type="hidden" id="hidid" />
                    <table id="mytable" class="table table-bordred table-striped">
                        <thead>
                            <!--<th><input type="checkbox" id="checkall" /></th>-->
                            <tr>
                                <th>
                                    ID
                                </th>
                                <th>
                                    Name
                                </th>
                                <th>
                                    Gender
                                </th>
                                <th>
                                    Environment
                                </th>
                                <th>
                                    Birth
                                </th>
                                <th>
                                    Death
                                </th>
                                <th>
                                    Edit
                                </th>
                                <th>
                                    Delete
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                    <div class="clearfix">
                        <div class="pull-right">
                            <button id="addbtn" class="btn btn-primary" data-toggle="modal" data-target="#add">
                                Add Frog
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="edit"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                    </button>
                    <h4 class="modal-title custom_align" id="H1">
                        Add New Frog</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <div class="col-md-2">
                            Name:</div>
                        <div class="col-md-10">
                            <input class="form-control " id="name" type="text" placeholder="Name"></div>
                    </div>
                    <br />
                    <div style="margin-top: 10px;" class="form-group">
                        <div class="col-md-2">
                            Gender:</div>
                        <div class="col-md-10">
                            <input id="gender1" name="gender" type="radio" checked>F&nbsp;<input id="gender2"
                                name="gender" type="radio">M</div>
                    </div>
                    <br />
                    <div style="margin-top: 20px;" class="form-group">
                        <div class="col-md-2">
                            Envrionment:</div>
                        <div class="col-md-10">
                            <input type="text" class="form-control" id="environ"></div>
                    </div>
                    <br />
                    <div style="margin-top: 20px;" class="form-group">
                        <div class="col-md-2">
                            Birth</div>
                        <div class="col-md-10">
                            <input type="date" class="form-control" id="birth" /></div>
                    </div>
                    <br />
                    <div style="margin-top: 20px;" class="form-group">
                        <div class="col-md-2">
                            Death</div>
                        <div class="col-md-10">
                            <input type="date" class="form-control" id="death" /></div>
                    </div>
                </div>
                <div class="modal-footer" style="margin-top: 20px;">
                    <button type="button" id="addfrog" class="btn btn-primary btn-lg" style="width: 100%;">
                        <span class="glyphicon glyphicon-ok-sign"></span>Add New</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="edit"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                    </button>
                    <h4 class="modal-title custom_align" id="Heading">
                        Edit Your Detail</h4>
                </div>
               <div class="modal-body">
                    <div class="form-group">
                        <div class="col-md-2">
                            Name:</div>
                        <div class="col-md-10">
                            <input class="form-control " id="ename" type="text" placeholder="Name"></div>
                    </div>
                    <br />
                    <div style="margin-top: 10px;" class="form-group">
                        <div class="col-md-2">
                            Gender:</div>
                        <div class="col-md-10">
                            <input id="egender1" name="gender" type="radio"/>F&nbsp;<input id="egender2"
                                name="gender" type="radio"/>M</div>
                    </div>
                    <br />
                    <div style="margin-top: 20px;" class="form-group">
                        <div class="col-md-2">
                            Envrionment:</div>
                        <div class="col-md-10">
                            <input type="text" class="form-control" id="eenviron"></div>
                    </div>
                    <br />
                    <div style="margin-top: 20px;" class="form-group">
                        <div class="col-md-2">
                            Birth</div>
                        <div class="col-md-10">
                            <input type="date" class="form-control" id="ebirth" /></div>
                    </div>
                    <br />
                    <div style="margin-top: 20px;" class="form-group">
                        <div class="col-md-2">
                            Death</div>
                        <div class="col-md-10">
                            <input type="date" class="form-control" id="edeath" /></div>
                    </div>
                </div>
                <div class="modal-footer " style="margin-top: 20px;">
                    <button type="button" class="btn btn-warning btn-lg"  id="updatebtn"
     style="width: 100%;">
                        <span class="glyphicon glyphicon-ok-sign"></span>Update</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="edit"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                    </button>
                    <h4 class="modal-title custom_align" id="Heading">
                        Delete this entry</h4>
                </div>
                <div class="modal-body">
                    <div class="alert alert-danger">
                        <span class="glyphicon glyphicon-warning-sign"></span>Are you sure you want to delete
                        this Record?</div>
                </div>
                <div class="modal-footer ">
                    <button type="button" id="deletebtn" class="btn btn-success">
                        <span class="glyphicon glyphicon-ok-sign"></span>Yes</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        <span class="glyphicon
    glyphicon-remove"></span>No</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
</body>
</html>
