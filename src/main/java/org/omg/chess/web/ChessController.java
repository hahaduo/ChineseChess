package org.omg.chess.web;

import org.omg.chess.common.ChessStatus;
import org.omg.chess.pojo.Chess;
import org.omg.chess.pojo.ChessPlayer;
import org.omg.chess.service.ChessBoard;
import org.omg.chess.service.ChessCompetition;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

import static org.springframework.web.bind.annotation.RequestMethod.*;

/**
 * Created by lihongjun on 15/1/23.
 */


@Controller
@RequestMapping(value = "/")
public class ChessController {


    @RequestMapping(value = "index.do")
    public String index(HttpServletRequest request,Model model) {
        ChessCompetition cc = ChessCompetition.getInstance();

        Map downMap = cc.getDownBoard().buildBoardMap("down");
        Map upMap = cc.getUpBoard().buildBoardMap("up");
        model.mergeAttributes(upMap);
        model.mergeAttributes(downMap);

        return "index.jsp";
    }

    @RequestMapping(value = "refresh.do")
    public String refresh(HttpServletRequest request,Model model) {
        ChessCompetition cc = ChessCompetition.getInstance();

        Map downMap = cc.getDownBoard().buildBoardMap("down");
        Map upMap = cc.getUpBoard().buildBoardMap("up");
        model.mergeAttributes(upMap);
        model.mergeAttributes(downMap);

        return "ChessBoard.ftl";
    }

    @RequestMapping(value = "checkPlayer.do")
    @ResponseBody
    public String checkPlayer(HttpSession session,Model model) {
        ChessCompetition cc = ChessCompetition.getInstance();
        String sessionId = session.getId();
        int playCnt = cc.checkPlayer();
        if (playCnt < 2) {
            ChessPlayer player = new ChessPlayer();
            player.setSessionId(sessionId);
            cc.setPlayer(player);
        }

        return cc.checkPlayer()+"";
    }

    @RequestMapping(value = "turnOver/{x}/{y}")
    public String turnOver(@PathVariable int x,@PathVariable int y,Model model) {

        ChessCompetition cc = ChessCompetition.getInstance();
        cc.turnOver(x,y);
        Map downMap = cc.getDownBoard().buildBoardMap("down");
        Map upMap = cc.getUpBoard().buildBoardMap("up");
        model.mergeAttributes(upMap);
        model.mergeAttributes(downMap);

        return "ChessBoard.ftl";
    }

    @RequestMapping(value = "restartGame")
    public String restartGame(Model model) {

        ChessCompetition cc = ChessCompetition.getInstance();
        cc.restart();
        Map downMap = cc.getDownBoard().buildBoardMap("down");
        Map upMap = cc.getUpBoard().buildBoardMap("up");
        model.mergeAttributes(upMap);
        model.mergeAttributes(downMap);

        return "ChessBoard.ftl";
    }

    @RequestMapping(value = "moveChess/{from}/{to}")
    public String moveChess(@PathVariable String from,@PathVariable String to,Model model) {

        ChessCompetition cc = ChessCompetition.getInstance();
        cc.moveChess(from,to);
        Map downMap = cc.getDownBoard().buildBoardMap("down");
        Map upMap = cc.getUpBoard().buildBoardMap("up");
        model.mergeAttributes(upMap);
        model.mergeAttributes(downMap);

        return "ChessBoard.ftl";
    }
}
