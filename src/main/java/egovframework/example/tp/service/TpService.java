package egovframework.example.tp.service;

import java.util.List;

public interface TpService {
	void insertUser(UserVO vo) throws Exception;
	int checkUserLogin(UserVO vo) throws Exception;
	List<BoardVO> selectBoardList(TpDefaultVO searchVO) throws Exception;
	int selectBoardListTotCnt(TpDefaultVO searchVO) throws Exception;
	int findbNo() throws Exception;
	void insertArticle(BoardVO vo) throws Exception;
	BoardVO selectArticleOne(BoardVO vo) throws Exception;
	void selectArticleUpdate(BoardVO vo) throws Exception;
	void selectArticleDelete(BoardVO vo) throws Exception;
	void selectArticleHitUpdate(BoardVO vo) throws Exception;
	UserVO selectUserInfo(UserVO vo) throws Exception;
	List<BoardVO> selectNoticeArticleList() throws Exception;
	int idCheck(UserVO vo) throws Exception;
	void insertBoardReply(BoardVO vo) throws Exception;
	void updateBoardReplyOrder(BoardVO vo) throws Exception;
	void insertPosting(PostingVO vo) throws Exception;
	List<PostingVO> selectPostingList(BoardVO vo) throws Exception;
	int findpNo() throws Exception;
	void deletePosting(PostingVO vo) throws Exception;
	void updatePosting(PostingVO vo) throws Exception;
	List<UserVO> selectUserList(TpDefaultVO searchVO) throws Exception;
	int selectUserListTotCnt(TpDefaultVO searchVO) throws Exception;
	void updateUserAuth(UserVO vo) throws Exception;
	int boardPwCheck(BoardVO vo) throws Exception;
	List<BoardVO> selectBoardAlarmMessage(String id) throws Exception;
	void insertBoardLog(BoardVO voselectBoardAlarmMessage) throws Exception;
	int selectBoardAlarmMessageCnt(String id) throws Exception;
	List<BoardVO> selectBoardAlarmList(String id) throws Exception;
}
