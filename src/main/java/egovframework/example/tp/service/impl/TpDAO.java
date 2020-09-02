package egovframework.example.tp.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.example.tp.service.BoardVO;
import egovframework.example.tp.service.PostingVO;
import egovframework.example.tp.service.TpDefaultVO;
import egovframework.example.tp.service.UserVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("tpDAO")
public class TpDAO extends EgovAbstractDAO{
	
	public void insertUser(UserVO vo) throws Exception{
		insert("tpDAO.insertUser", vo);
	}
	
	public int checkUserLogin(UserVO vo) throws Exception{
		return (int) select("tpDAO.checkUserLogin", vo);
	}
	
	@SuppressWarnings("unchecked")
	public List<BoardVO> selectBoardList(TpDefaultVO searchVO) throws Exception{
		return (List<BoardVO>) list("tpDAO.selectBoardList", searchVO);
	}
	
	public int findbNo() throws Exception{
		return (int) select("tpDAO.findbNo");
	}
	
	public void insertArticle(BoardVO vo) throws Exception{
		insert("tpDAO.insertArticle", vo);
	}
	
	public BoardVO selectArticleOne(BoardVO vo) throws Exception{
		return (BoardVO) select("tpDAO.selectArticleOne", vo);
	}
	
	public void selectArticleUpdate(BoardVO vo) throws Exception{
		update("tpDAO.selectArticleUpdate", vo);
	}
	
	public void selectArticleDelete(BoardVO vo) throws Exception{
		delete("tpDAO.selectArticleDelete", vo);
	}
	
	public void selectArticleHitUpdate(BoardVO vo) throws Exception{
		update("tpDAO.selectArticleHitUpdate",vo);
	}
	
	public int selectBoardListTotCnt(TpDefaultVO searchVO) {
		return (int) select("tpDAO.selectBoardListTotCnt", searchVO);
	}
	
	public UserVO selectUserInfo(UserVO vo) {
		return (UserVO) select("tpDAO.selectUserInfo", vo);
	}
	
	@SuppressWarnings("unchecked")
	public List<BoardVO> selectNoticeArticleList() {
		return (List<BoardVO>) list("tpDAO.selectNoticeArticleList");
	}
	
	public int selectUserIdCheck(UserVO vo) {
		return (int) select("tpDAO.idCheck", vo);
	}
	
	public void insertBoardReply(BoardVO vo) {
		insert("tpDAO.insertBoardReply", vo);
	}
	
	public void updateBoardReplyOrder(BoardVO vo) {
		update("tpDAO.updateBoardReplyOrder", vo);
	}
	
	public void insertPosting(PostingVO vo) {
		insert("tpDAO.insertPosting", vo);
	}
	
	@SuppressWarnings("unchecked")
	public List<PostingVO> selectPostingList(BoardVO vo) throws Exception{
		return (List<PostingVO>) list("tpDAO.selectPostingList", vo);
	}
	
	public int findpNo() throws Exception{
		return (int) select("tpDAO.findpNo");
	}
	
	public void deletePosting(PostingVO vo) throws Exception{
		delete("tpDAO.deletePosting", vo);
	}
	
	public void updatePosting(PostingVO vo) throws Exception{
		update("tpDAO.updatePosting", vo);
	}
	
	@SuppressWarnings("unchecked")
	public List<UserVO> selectUserList(TpDefaultVO searchVO) throws Exception{
		return (List<UserVO>) list("tpDAO.selectUserList", searchVO);
	}
	
	public void updateUserAuth(UserVO vo) throws Exception{
		update("tpDAO.updateUserAuth", vo);
	}
	
	public int selectUserListTotCnt(TpDefaultVO searchVO) {
		return (int) select("tpDAO.selectUserListTotCnt", searchVO);
	}
	
	public int boardPwCheck(BoardVO vo) {
		return (int) select("tpDAO.boardPwCheck", vo);
	}
	
	@SuppressWarnings("unchecked")
	public List<BoardVO> selectBoardAlarmMessage(String id) {
		return (List<BoardVO>) list("tpDAO.selectBoardAlarmMessage", id);
	}
	
	public void insertBoardLog(BoardVO vo) throws Exception{
		insert("tpDAO.insertBoardLog", vo);
	}
	
	public int selectBoardAlarmMessageCnt(String id) throws Exception{
		return (int) select("tpDAO.selectBoardAlarmMessageCnt", id);
	}
	
	@SuppressWarnings("unchecked")
	public List<BoardVO> selectBoardAlarmList(String id) throws Exception{
		return (List<BoardVO>) list("tpDAO.selectBoardAlarmList", id);
	}
}
