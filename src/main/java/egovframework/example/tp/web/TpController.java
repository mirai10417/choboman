package egovframework.example.tp.web;

import java.util.List;
import java.util.Map;

import javax.json.JsonObject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import egovframework.example.tp.service.BoardVO;
import egovframework.example.tp.service.PostingVO;
import egovframework.example.tp.service.TpDefaultVO;
import egovframework.example.tp.service.TpService;
import egovframework.example.tp.service.UserVO;
import egovframework.example.tp.service.impl.TpDAO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class TpController {

	@Autowired
	TpService tpService;
	
	@RequestMapping(value = "/newIndex.do")
	public String newIndex(ModelMap model, HttpServletRequest request) {
		return "tp/newIndex";
	}
	
	@RequestMapping(value = "/joinForm.do")
	public String joinForm(ModelMap model) {
		return "tp/joinForm";
	}
	
	@RequestMapping(value = "/insertUser.do")
	public String insertUser(ModelMap model, UserVO uvo, RedirectAttributes ra) throws Exception {
		tpService.insertUser(uvo);
		return "redirect:newIndex.do";
	}
	
	@RequestMapping(value = "/loginUser.do")
	public ModelAndView loginUser(ModelMap model, UserVO uvo, HttpServletRequest request, RedirectAttributes ra) throws Exception {
		ModelAndView mav = new ModelAndView();
		int n = tpService.checkUserLogin(uvo);
		if(n == 1) {
			UserVO checkUvo = tpService.selectUserInfo(uvo);
			request.getSession().setAttribute("whoSession", checkUvo);
			mav.setViewName("redirect:mainPage.do");
		}else if(n == 0){
			mav.setViewName("redirect:newIndex.do");
			ra.addFlashAttribute("fail", "fail");
		}
		return mav;
	}
	
	@RequestMapping(value = "/mainPage.do")
	public String mainPage(@ModelAttribute("searchVO") TpDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<BoardVO> checkBvo = tpService.selectBoardList(searchVO);
		model.addAttribute("boardList",checkBvo);
		
		List<BoardVO> nCheckY = tpService.selectNoticeArticleList();
		model.addAttribute("boardNoticeList",nCheckY);
		
		UserVO sessionVo = (UserVO) request.getSession().getAttribute("whoSession");
		String id = sessionVo.getId();
		int n = tpService.selectBoardAlarmMessageCnt(id);
		model.addAttribute("alarmCnt", n);
		
		int totCnt = tpService.selectBoardListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "tp/mainPage";
	}
	
	@RequestMapping(value = "/insertArticlePage.do")
	public String insertArticlePage(ModelMap model, HttpServletRequest request) throws Exception {
		return "tp/insertArticlePage";
	}
	
	@ResponseBody
	@RequestMapping(value = "/insertArticle.do")
	public void insertArticle(ModelMap model, BoardVO bvo, HttpServletRequest request) throws Exception {
		UserVO uvo = (UserVO)request.getSession().getAttribute("whoSession");
		bvo.setId(uvo.getId());
		tpService.insertArticle(bvo);
	}
	
	@RequestMapping(value = "/selectArticleOne.do")
	public String selectArticleOne(ModelMap model, BoardVO bvo, HttpServletRequest request) throws Exception {
		BoardVO checkBvo = tpService.selectArticleOne(bvo);
		model.addAttribute("boardList", checkBvo);
		
		List<PostingVO> checkPvo = tpService.selectPostingList(bvo);
		model.addAttribute("PostingList", checkPvo);
		
		UserVO sessionCheck = (UserVO) request.getSession().getAttribute("whoSession");
		model.addAttribute("sessionCheck", sessionCheck);
		return "tp/selectArticleOne";
	}
	 
	@ResponseBody
	@RequestMapping(value = "/selectArticleUpdate.do")
	public void selectArticleUpdate(ModelMap model, BoardVO bvo) throws Exception{
		tpService.selectArticleUpdate(bvo);
	}
	
	@ResponseBody
	@RequestMapping(value = "/selectArticleDelete.do")
	public void selectArticleDelete(ModelMap model, BoardVO bvo) throws Exception{
		tpService.selectArticleDelete(bvo);
	}
	
	@RequestMapping(value = "/logout.do")
	public String logout(ModelMap model, HttpServletRequest request) {
		request.getSession().removeAttribute("whoSession");
		return "redirect:newIndex.do";
	}
	
	@RequestMapping(value = "/functionSubmit.do")
	public String functionSubmit(@ModelAttribute("searchVO") TpDefaultVO searchVO,ModelMap model) throws Exception {
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<BoardVO> checkBvo = tpService.selectBoardList(searchVO);
		model.addAttribute("boardList",checkBvo);
		
		List<BoardVO> nCheckY = tpService.selectNoticeArticleList();
		model.addAttribute("boardNoticeList",nCheckY);
		
		int totCnt = tpService.selectBoardListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "tp/functionSubmit";
	}
	
	@RequestMapping(value = "/cookieTest.do")
	public String cookieTest(ModelMap model, BoardVO bvo) throws Exception{
		model.addAttribute("noticeVo", bvo);
		return "tp/cookieTest";
	}
	
	@ResponseBody
	@RequestMapping(value = "/idCheck.do")
	public String idCheck(ModelMap model, UserVO uvo) throws Exception{
		int n = tpService.idCheck(uvo);
		return Integer.toString(n);
	}
	
	@RequestMapping(value = "/boardReplyInsertPage.do")
	public String boardReplyInsertPage(ModelMap model, BoardVO bvo) throws Exception{
		model.addAttribute("toReplyBoard",bvo);
		return "tp/boardReplyInsertPage";
	}
	
	@ResponseBody
	@RequestMapping(value = "/boardReplyInsert.do")
	public void boardReplyInsert(ModelMap model, BoardVO bvo) throws Exception{
		tpService.insertBoardReply(bvo);
	}
	
	@ResponseBody
	@RequestMapping(value = "/sessionCheck.do")
	public UserVO sessionCheck(ModelMap model, HttpServletRequest request, UserVO uvo) throws Exception{
		UserVO checkUvo = tpService.selectUserInfo(uvo);
		return checkUvo;
	}
	
	@ResponseBody
	@RequestMapping(value = "/insertPosting.do")
	public void insertPosting(ModelMap model, HttpServletRequest request, PostingVO pvo) throws Exception{
		tpService.insertPosting(pvo);
	}	 
	
	@ResponseBody
	@RequestMapping(value = "/deletePosting.do")
	public void deletePosting(ModelMap model, HttpServletRequest request, PostingVO pvo) throws Exception{
		tpService.deletePosting(pvo);
	}
	
	@ResponseBody
	@RequestMapping(value = "/updatePosting.do")
	public void updatePosting(ModelMap model, HttpServletRequest request, PostingVO pvo) throws Exception{
		tpService.updatePosting(pvo);
	}
	
	@RequestMapping(value = "/UserAuthManagePage.do")
	public String UserAuthManagePage(@ModelAttribute("searchVO") TpDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception{
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		int totCnt = tpService.selectUserListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		List<UserVO> checkUlist = tpService.selectUserList(searchVO);
		model.addAttribute("userList", checkUlist);
		return "tp/UserAuthManagePage";
	}
	
	@RequestMapping(value = "/updateUserAuthPage.do")
	public String updateUserAuthPage(ModelMap model, HttpServletRequest request, UserVO uvo) throws Exception{
		UserVO checkUvo = tpService.selectUserInfo(uvo);
		model.addAttribute("UserVO",checkUvo);
		return "tp/updateUserAuthPage";
	}
	
	@ResponseBody
	@RequestMapping(value = "/updateUserAuth.do")
	public void updateUserAuth(ModelMap model, HttpServletRequest request, UserVO uvo) throws Exception{
		tpService.updateUserAuth(uvo);
	}
	
	@RequestMapping(value = "/boardPwCheckPage.do")
	public String boardPwCheckPage(ModelMap model, HttpServletRequest request, BoardVO bvo) throws Exception{
		model.addAttribute("bvo", bvo);
		return "tp/boardPwCheckPage";
	}
	
	@ResponseBody
	@RequestMapping(value = "/boardPwCheck.do")
	public String boardPwCheck(ModelMap model, HttpServletRequest request, BoardVO bvo) throws Exception{
		int n = tpService.boardPwCheck(bvo);
		return Integer.toString(n);
	}
	
	@RequestMapping(value = "/alarmBoardListPage.do")
	public String alarmBoardListPage(ModelMap model, HttpServletRequest request) throws Exception{
		UserVO sessionVo = (UserVO) request.getSession().getAttribute("whoSession");
		String id = sessionVo.getId();
		List<BoardVO> alarmBoardList = tpService.selectBoardAlarmList(id);
		
		model.addAttribute("alarmBoardList",alarmBoardList);
		return "tp/alarmBoardListPage";
	}
	
}
