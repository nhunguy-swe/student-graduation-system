package dao;

import model.*;
import utils.DBContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SinhVienDAO {

    // Lấy dữ liệu cho ComboBox
    public List<Truong> getAllTruong() {
        List<Truong> list = new ArrayList<>();
        String sql = "SELECT * FROM Truong";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Truong(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    // Lưu thông tin Sinh viên & Tốt nghiệp (Dùng Transaction)
    public boolean saveInfo(SinhVien sv, TotNghiep tn) {
        String sqlSV = "INSERT INTO SinhVien VALUES (?,?,?,?,?)";
        String sqlTN = "INSERT INTO TotNghiep VALUES (?,?,?,?,?,?)";

        try (Connection conn = new DBContext().getConnection()) {
            conn.setAutoCommit(false); // Bắt đầu Transaction
            try (PreparedStatement ps1 = conn.prepareStatement(sqlSV);
                 PreparedStatement ps2 = conn.prepareStatement(sqlTN)) {

                // Set data cho SinhVien
                ps1.setString(1, sv.getSoCMND());
                ps1.setString(2, sv.getHoTen());
                ps1.setString(3, sv.getEmail());
                ps1.setString(4, sv.getSoDT());
                ps1.setString(5, sv.getDiaChi());
                ps1.executeUpdate();

                // Set data cho TotNghiep
                ps2.setString(1, tn.getSoCMND());
                ps2.setString(2, tn.getMaTruong());
                ps2.setString(3, tn.getMaNganh());
                ps2.setString(4, tn.getHeTN());
                ps2.setDate(5, tn.getNgayTN());
                ps2.setString(6, tn.getLoaiTN());
                ps2.executeUpdate();

                conn.commit();
                return true;
            } catch (Exception e) {
                conn.rollback();
                e.printStackTrace();
            }
        } catch (Exception e) { e.printStackTrace(); }
        return false;
    }

    // Tìm kiếm cơ bản
    public List<SinhVien> searchBasic(String keyword) {
        List<SinhVien> list = new ArrayList<>();
        String sql = "SELECT * FROM SinhVien WHERE HoTen LIKE ? OR SoCMND LIKE ?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new SinhVien(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    // Thêm vào trong file SinhVienDAO.java
    public List<Nganh> getAllNganh() {
        List<Nganh> list = new ArrayList<>();
        String sql = "SELECT * FROM Nganh";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                // Đảm bảo thứ tự cột: MaNganh, TenNganh, LoaiNganh
                list.add(new Nganh(rs.getString(1), rs.getString(2), rs.getString(3)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Thêm vào trong file SinhVienDAO.java
    public List<SearchResultDTO> searchAdvanced(String keyword) {
        List<SearchResultDTO> list = new ArrayList<>();
        // Câu lệnh SQL kết hợp thông tin từ 3 bảng: SinhVien, TotNghiep và CongViec
        String sql = "SELECT sv.SoCMND, sv.HoTen, tn.MaNganh as MaNganhTN, tn.MaTruong, " +
                "cv.MaNganh as MaNganhCV, cv.TenCongTy, cv.ThoiGianLamViec " +
                "FROM SinhVien sv " +
                "INNER JOIN TotNghiep tn ON sv.SoCMND = tn.SoCMND " +
                "LEFT JOIN CongViec cv ON sv.SoCMND = cv.SoCMND " +
                "WHERE sv.HoTen LIKE ? OR sv.SoCMND = ?";

        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + keyword + "%");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SearchResultDTO dto = new SearchResultDTO();
                dto.setSoCMND(rs.getString("SoCMND"));
                dto.setHoTen(rs.getString("HoTen"));
                dto.setMaNganhTN(rs.getString("MaNganhTN")); // Ngành tốt nghiệp
                dto.setMaTruongTN(rs.getString("MaTruong")); // Trường tốt nghiệp
                dto.setMaNganhCTy(rs.getString("MaNganhCV")); // Ngành tại công ty
                dto.setTenCongTy(rs.getString("TenCongTy"));
                dto.setThoiGianLamViec(rs.getString("ThoiGianLamViec"));

                list.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}