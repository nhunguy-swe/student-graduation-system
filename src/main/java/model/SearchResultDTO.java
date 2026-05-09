package model;

public class SearchResultDTO {

    private String soCMND;
    private String hoTen;
    private String maNganhTN;
    private String maTruongTN;
    private String maNganhCTy;
    private String tenCongTy;
    private String thoiGianLamViec;

    public SearchResultDTO() {}

    public SearchResultDTO(String soCMND, String hoTen, String maNganhTN, String maTruongTN, String maNganhCTy, String tenCongTy, String thoiGianLamViec) {
        this.soCMND = soCMND;
        this.hoTen = hoTen;
        this.maNganhTN = maNganhTN;
        this.maTruongTN = maTruongTN;
        this.maNganhCTy = maNganhCTy;
        this.tenCongTy = tenCongTy;
        this.thoiGianLamViec = thoiGianLamViec;
    }

    public String getSoCMND() {
        return soCMND;
    }

    public void setSoCMND(String soCMND) {
        this.soCMND = soCMND;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public String getMaNganhTN() {
        return maNganhTN;
    }

    public void setMaNganhTN(String maNganhTN) {
        this.maNganhTN = maNganhTN;
    }

    public String getMaTruongTN() {
        return maTruongTN;
    }

    public void setMaTruongTN(String maTruongTN) {
        this.maTruongTN = maTruongTN;
    }

    public String getMaNganhCTy() {
        return maNganhCTy;
    }

    public void setMaNganhCTy(String maNganhCTy) {
        this.maNganhCTy = maNganhCTy;
    }

    public String getTenCongTy() {
        return tenCongTy;
    }

    public void setTenCongTy(String tenCongTy) {
        this.tenCongTy = tenCongTy;
    }

    public String getThoiGianLamViec() {
        return thoiGianLamViec;
    }

    public void setThoiGianLamViec(String thoiGianLamViec) {
        this.thoiGianLamViec = thoiGianLamViec;
    }
}