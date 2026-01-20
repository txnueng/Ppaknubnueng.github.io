// ฟังก์ชันสลับหน้า (SPA Look)
function showPage(pageId) {
    // ซ่อนทุก Section
    const sections = document.querySelectorAll('.page-section');
    sections.forEach(sec => sec.classList.remove('active'));

    // ลบ Active class จากเมนูทั้งหมด
    const navLinks = document.querySelectorAll('.nav-links li a');
    navLinks.forEach(link => link.classList.remove('active'));

    // แสดง Section ที่เลือก
    document.getElementById(pageId).classList.add('active');
    
    // ไฮไลท์เมนูที่เลือก
    // ค้นหาลิงก์ที่มี href ตรงกับ pageId
    const activeLink = document.querySelector(`.nav-links li a[href="#${pageId}"]`);
    if(activeLink) activeLink.classList.add('active');

    // ปิดเมนูมือถือถ้าเปิดอยู่
    const navMenu = document.querySelector('.nav-links');
    navMenu.classList.remove('active');
    
    // เลื่อนขึ้นบนสุด
    window.scrollTo(0, 0);
}

// ฟังก์ชันเปิด/ปิดเมนูมือถือ
function toggleMenu() {
    const navMenu = document.querySelector('.nav-links');
    navMenu.classList.toggle('active');
}

// สร้างข้อมูลสมาชิก 10 คน อัตโนมัติ (Mock Data)
const membersData = [
    { name: "นายสมชาย ใจดี", role: "ประธานพรรค", contact: "FB: Somchai JD" },
    { name: "น.ส.สมหญิง จริงใจ", role: "รองประธาน", contact: "IG: @ying_jing" },
    { name: "นายกล้าหาญ ชาญชัย", role: "เหรัญญิก", contact: "Line: klahan007" },
    { name: "น.ส.มานี มีตา", role: "เลขานุการ", contact: "IG: @manee.m" },
    { name: "นายปิติ ยินดี", role: "ฝ่ายกิจกรรม", contact: "FB: Piti Happy" },
    { name: "น.ส.ชูใจ ใฝ่เรียน", role: "ฝ่ายวิชาการ", contact: "Line: chujai.edu" },
    { name: "นายวีระ กล้าแกร่ง", role: "ฝ่ายกีฬา", contact: "IG: @weera_sport" },
    { name: "น.ส.แก้วตา น่ารัก", role: "ฝ่ายประชาสัมพันธ์", contact: "FB: Kaewta PR" },
    { name: "นายรักชาติ ยิ่งชีพ", role: "ฝ่ายอาคารสถานที่", contact: "Line: rukchat.b" },
    { name: "น.ส.ใจใส ไร้มลทิน", role: "ฝ่ายสวัสดิการ", contact: "IG: @jaisai_clr" }
];

// ฟังก์ชัน Render สมาชิก
function renderMembers() {
    const grid = document.getElementById('membersGrid');
    grid.innerHTML = ""; // ล้างค่าเก่า

    membersData.forEach((member, index) => {
        // ใช้รูป Placeholder ตามเพศ (แบบสุ่มคร่าวๆ)
        const imgUrl = `https://api.dicebear.com/7.x/avataaars/svg?seed=${index}&backgroundColor=b6e3f4`;

        const card = `
            <div class="member-card">
                <img src="${imgUrl}" alt="${member.name}" class="member-img">
                <div class="member-info">
                    <div class="member-name">${member.name}</div>
                    <div style="color: #888; margin-bottom: 5px;">${member.role}</div>
                    <div class="member-contact">
                        <i class="fas fa-address-book"></i> ${member.contact}
                    </div>
                </div>
            </div>
        `;
        grid.innerHTML += card;
    });
}

// เรียกใช้เมื่อโหลดหน้าเว็บ
document.addEventListener('DOMContentLoaded', () => {
    renderMembers();
    // เริ่มต้นที่หน้า Home
    showPage('home');
});

