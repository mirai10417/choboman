package egovframework.example.tp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.tp.service.BoardVO;
import egovframework.example.tp.service.PostingVO;
import egovframework.example.tp.service.TpDefaultVO;
import egovframework.example.tp.service.TpService;
import egovframework.example.tp.service.UserVO;

@Service("tpService")
public class TpServiceImpl implements TpService {

	@Autowired
	TpDAO tpDAO;
	
	@Autowired
	TpService tpService;

	@Override
	public void insertUser(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		tpDAO.insertUser(vo);
	}

	@Override
	public int checkUserLogin(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return tpDAO.checkUserLogin(vo);
	}

	@Override
	public List<BoardVO> selectBoardList(TpDefaultVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return tpDAO.selectBoardList(searchVO);
	}

	@Override
	public int findbNo() throws Exception {
		// TODO Auto-generated method stub
		return tpDAO.findbNo();
	}

	@Override
	public void insertArticle(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		int n = tpService.findbNo();
		vo.setBno(n);
		vo.setRp(n);
		tpDAO.insertArticle(vo);
	}

	@Override
	public BoardVO selectArticleOne(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		tpService.selectArticleHitUpdate(vo);
		tpService.insertBoardLog(vo);
		return tpDAO.selectArticleOne(vo);
	}

	@Override
	public void selectArticleUpdate(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		tpDAO.selectArticleUpdate(vo);
	}

	@Override
	public void selectArticleDelete(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		tpDAO.selectArticleDelete(vo);
	}

	@Override
	public void selectArticleHitUpdate(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		tpDAO.selectArticleHitUpdate(vo);
	}

	@Override
	public int selectBoardListTotCnt(TpDefaultVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return tpDAO.selectBoardListTotCnt(searchVO);
	}

	@Override
	public UserVO selectUserInfo(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return tpDAO.selectUserInfo(vo);
	}

	@Override
	public List<BoardVO> selectNoticeArticleList() throws Exception {
		// TODO Auto-generated method stub
		return tpDAO.selectNoticeArticleList();
	}

	@Override
	public int idCheck(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return tpDAO.selectUserIdCheck(vo);
	}

	@Override
	public void insertBoardReply(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		int n = tpService.findbNo();
		vo.setBno(n);
		tpDAO.insertBoardReply(vo);
	}

	@Override
	public void updateBoardReplyOrder(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		tpDAO.updateBoardReplyOrder(vo);
	}

	@Override
	public void insertPosting(PostingVO vo) throws Exception {
		// TODO Auto-generated method stub
		int n = tpDAO.findpNo();
		vo.setPid(n);
		tpDAO.insertPosting(vo);
	}

	@Override
	public List<PostingVO> selectPostingList(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return tpDAO.selectPostingList(vo);
	}

	@Override
	public int findpNo() throws Exception {
		// TODO Auto-generated method stub
		return tpDAO.findpNo();
	}

	@Override
	public void deletePosting(PostingVO vo) throws Exception {
		// TODO Auto-generated method stub
		tpDAO.deletePosting(vo);
	}

	@Override
	public void updatePosting(PostingVO vo) throws Exception {
		// TODO Auto-generated method stub
		tpDAO.updatePosting(vo);
	}

	@Override
	public List<UserVO> selectUserList(TpDefaultVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return tpDAO.selectUserList(searchVO);
	}

	@Override
	public void updateUserAuth(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		tpDAO.updateUserAuth(vo);
	}

	@Override
	public int selectUserListTotCnt(TpDefaultVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return tpDAO.selectUserListTotCnt(searchVO);
	}

	@Override
	public int boardPwCheck(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return tpDAO.boardPwCheck(vo);
	}

	@Override
	public List<BoardVO> selectBoardAlarmMessage(String id) throws Exception {
		// TODO Auto-generated method stub
		return tpDAO.selectBoardAlarmMessage(id);
	}

	@Override
	public void insertBoardLog(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		tpDAO.insertBoardLog(vo);
	}

	@Override
	public int selectBoardAlarmMessageCnt(String id) throws Exception {
		// TODO Auto-generated method stub
		return tpDAO.selectBoardAlarmMessageCnt(id);
	}

	@Override
	public List<BoardVO> selectBoardAlarmList(String id) throws Exception {
		// TODO Auto-generated method stub
		return tpDAO.selectBoardAlarmList(id);
	}
	
}
