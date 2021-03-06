package bitcamp.sodam.database;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import bitcamp.sodam.beans.Category;
import bitcamp.sodam.beans.Coupon;
import bitcamp.sodam.beans.FAQ;
import bitcamp.sodam.beans.Inquiry;
import bitcamp.sodam.beans.Notice;

public interface InquiryMapper {
    @Select("SELECT qno, uno, title, content, col, qtype, qstatus, answer from tmk_mtm")
    List<Inquiry> findAll();
    
    @Select("SELECT qno, uno, title, content, col, qtype, qstatus, answer from tmk_mtm where qno = #{qno}")
    Inquiry findByNo(int qno);
    
    @Update("UPDATE tmk_mtm SET answer = #{answer}, qstatus = #{qstatus} WHERE qno = #{qno}")
    void update(Inquiry inquiry);
    
    @Select("select u.uno, title, content, col, qtype, qstatus, answer from tmk_mtm m join tmk_user u on u.uno= m.uno where u.uno = #{uno} order by col desc")
    List<Inquiry> findQList(int uno);
    
    @Insert("insert into tmk_mtm(uno, title, content, qtype, qstatus) VALUES(#{uno}, #{title}, #{content}, #{qtype}, #{qstatus})")
    void addInquiry(Inquiry inquiry);
}