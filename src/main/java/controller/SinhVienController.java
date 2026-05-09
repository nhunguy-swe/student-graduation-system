package controller;

import dao.SinhVienDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.*;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet(name = "SinhVienController", urlPatterns = {"/student"})
public class SinhVienController extends HttpServlet {

    private SinhVienDAO dao = new SinhVienDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "home";

        switch (action) {
            case "showForm":
                // Đổ dữ liệu vào ComboBox
                request.setAttribute("listTruong", dao.getAllTruong());
                request.setAttribute("listNganh", dao.getAllNganh());
                request.getRequestDispatcher("add-student.jsp").forward(request, response);
                break;
            case "searchBasic":
                List<SinhVien> allSV = dao.searchBasic("");
                request.setAttribute("listSV", allSV);
                request.getRequestDispatcher("search-basic.jsp").forward(request, response);
                break;
            case "searchAdvanced":
                List<SearchResultDTO> allResult = dao.searchAdvanced("");
                request.setAttribute("listResult", allResult);
                request.getRequestDispatcher("search-advanced.jsp").forward(request, response);
                break;
            default:
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("insert".equals(action)) {
            // 1. Lấy dữ liệu từ Form
            String soCMND = request.getParameter("soCMND");
            String hoTen = request.getParameter("hoTen");
            String email = request.getParameter("email");
            String soDT = request.getParameter("soDT");
            String diaChi = request.getParameter("diaChi");

            String maTruong = request.getParameter("maTruong");
            String maNganh = request.getParameter("maNganh");
            String heTN = request.getParameter("heTN");
            String ngayTNStr = request.getParameter("ngayTN");
            String loaiTN = request.getParameter("loaiTN");

            // 2. Kiểm tra bắt buộc nhập
            if (soCMND.isEmpty() || maTruong.isEmpty() || maNganh.isEmpty()) {
                request.setAttribute("error", "Số CMND, Trường và Ngành là bắt buộc!");
                doGet(request, response); // Quay lại form
                return;
            }

            // 3. Kiểm tra ngày tốt nghiệp hợp lệ
            Date ngayTN = Date.valueOf(ngayTNStr);
            if (ngayTN.after(new java.util.Date())) {
                request.setAttribute("error", "Ngày tốt nghiệp không được lớn hơn ngày hiện tại!");
                doGet(request, response);
                return;
            }

            // 4. Lưu vào DB
            SinhVien sv = new SinhVien(soCMND, hoTen, email, soDT, diaChi);
            TotNghiep tn = new TotNghiep(soCMND, maTruong, maNganh, heTN, ngayTN, loaiTN);

            if (dao.saveInfo(sv, tn)) {
                response.sendRedirect("student?action=home&msg=Success");
            } else {
                request.setAttribute("error", "Lỗi khi lưu dữ liệu!");
                doGet(request, response);
            }

        } else if ("search1".equals(action)) {
            // Tìm kiếm cơ bản
            String keyword = request.getParameter("keyword");
            List<SinhVien> list = dao.searchBasic(keyword);
            request.setAttribute("listSV", list);
            request.getRequestDispatcher("search-basic.jsp").forward(request, response);

        } else if ("search2".equals(action)) {
            // Tìm kiếm nâng cao
            String keyword = request.getParameter("keyword");
            List<SearchResultDTO> list = dao.searchAdvanced(keyword);
            request.setAttribute("listResult", list);
            request.getRequestDispatcher("search-advanced.jsp").forward(request, response);
        }
    }
}