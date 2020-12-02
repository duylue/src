<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 01/12/2020
  Time: 9:26 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>List Customer</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css">

</head>
<body>
<%--body--%>
<div class="container-fluid">
    <h1><a href="/homepage">Home</a></h1>
</div>
<div class="card mb-4">
    <div class="card-header">
        <i class="fas fa-table mr-1"></i>
        <h2>User Management</h2>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table id="example" class="table table-striped table-bordered" style="width:100%" cellspacing="0">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>User Name</th>
                    <th>Firstname</th>
                    <th>Surname</th>
                    <th>Birthday</th>
                    <th>PhoneNumber</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th>TypeAccountId</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tfoot>
                <tr>
                    <th>ID</th>
                    <th>User Name</th>
                    <th>Firstname</th>
                    <th>Surname</th>
                    <th>Birthday</th>
                    <th>PhoneNumber</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th>TypeAccountId</th>
                    <th>Actions</th>
                </tr>
                </tfoot>

                <tbody>
                <c:forEach var="customer" items="${listCustomer}">
                    <tr>
                        <td>${customer.customerID}</td>
                        <td>${customer.username}</td>
                        <td>${customer.firstname}</td>
                        <td>${customer.surname}</td>
                        <td>${customer.birthDay}</td>
                        <td>${customer.phoneNumber}</td>
                        <td>${customer.address}</td>
                        <td>${customer.email}</td>
                        <td>${customer.typeAccountId}</td>
                        <td>
                            <button class="btn btn-primary" data-toggle="modal"
                                    data-target="#editModal${customer.customerID}">Edit
                            </button>
                            <a class="btn btn-danger" type="submit"
                               href="/admin/customer?action=delete&customerId=${customer.customerID}">Delete
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>


<!-- Modal Edit Customer -->
<form method="post" action="/customer">
    <div class="row justify-content-center">
        <div class="modal fade" id="editModal${customer.customerID}" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="text-center modal-title" id="exampleModalLabel">Edit Customer</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-row">
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label class="small mb-1">Account</label>
                                    <input readonly class="form-control py-4" type="text"
                                           name="userName"
                                           value="${customer.username}"/>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="small mb-1">ID</label>
                                    <input readonly class="form-control py-4" type="text"
                                           name="customerID"
                                           value="${customer.customerID}"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="small mb-1">Password</label>
                            <input class="form-control py-4" type="password" name="password"
                                   value="${customer.password}"/>
                        </div>

                        <div class="form-group">
                            <label class="small mb-1">Email</label>
                            <input class="form-control py-4" type="email"
                                   aria-describedby="emailHelp"
                                   name="email"
                                   value="${customer.email}"/>
                        </div>

                        <div class="form-row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="small mb-1">First Name</label>
                                    <input class="form-control py-4" type="text" name="firstName"
                                           value="${customer.firstname}"/>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="small mb-1">Sur Name</label>
                                    <input class="form-control py-4" type="text" name="surName"
                                           value="${customer.surname}"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="small mb-1">Address</label>
                            <input class="form-control py-4" type="text" name="address"
                                   value="${customer.address}"/>
                        </div>
                        <div class="form-row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="small mb-1">Phone Number</label>
                                    <input class="form-control py-4" type="text" name="phoneNumber"
                                           value="${customer.phoneNumber}"/>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="small mb-1">Birthday</label>
                                    <input class="form-control py-4" type="date" name="birthDay"
                                           value="${customer.birthDay}"/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="small mb-1">Type Account</label>
                            <select class="form-control required" name="typeAccountId">
                                <c:forEach items='${requestScope["typeAccountList"]}'
                                           var="typeAccountEdit">
                                    <option
                                            value="${typeAccountEdit.getTypeAccountId()}">${typeAccountEdit.getTypeOfAccount()}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <input type="text" name="action" value="edit" hidden/>
                        <input type="submit" class="btn btn-primary" value="Save"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>


<div id="layoutError_footer">
    <footer class="py-4 bg-light mt-auto">
        <div class="container-fluid">
            <div class="d-flex align-items-center justify-content-between small">
                <div class="text-muted">Copyright &copy; Your Website 2020</div>
                <div>
                    <a href="#">Privacy Policy</a>
                    &middot;
                    <a href="#">Terms &amp; Conditions</a>
                </div>
            </div>
        </div>
    </footer>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
<script>
    $(document).ready(function() {
        $('#example').DataTable();
    } );
</script>
</body>
</html>
