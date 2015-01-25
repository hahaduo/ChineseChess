package org.omg.chess.service;

import org.omg.chess.common.ChessColor;
import org.omg.chess.common.ChessName;
import org.omg.chess.common.ChessStatus;
import org.omg.chess.pojo.Chess;

import java.util.*;

/**
 * Created by lihongjun on 15/1/24.
 */
public class ChessBoard {

    private Chess[][] board;

    public Chess[][] getBoard() {
        return board;
    }

    public void setBoard(Chess[][] board) {
        this.board = board;
    }

    public ChessBoard() {
        board = new Chess[4][8];
        init();
    }

    public ChessBoard(boolean shuffle) {
        board = new Chess[4][8];
        if (shuffle) {
            initShuffle();
        }
    }


    public void init() {

        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 8; j++) {
                board[i][j] = new Chess(ChessStatus.BLANK);
            }
        }
    }

    public void initShuffle() {
        List<Chess> chesses = Arrays.asList(
                new Chess(1, ChessColor.RED, ChessName.SHUAI, ChessStatus.BACK),
                new Chess(1, ChessColor.RED, ChessName.CHE, ChessStatus.BACK),
                new Chess(2, ChessColor.RED, ChessName.CHE, ChessStatus.BACK),
                new Chess(1, ChessColor.RED, ChessName.MA, ChessStatus.BACK),
                new Chess(2, ChessColor.RED, ChessName.MA, ChessStatus.BACK),
                new Chess(1, ChessColor.RED, ChessName.PAO, ChessStatus.BACK),
                new Chess(2, ChessColor.RED, ChessName.PAO, ChessStatus.BACK),
                new Chess(1, ChessColor.RED, ChessName.XIANGR, ChessStatus.BACK),
                new Chess(2, ChessColor.RED, ChessName.XIANGR, ChessStatus.BACK),
                new Chess(1, ChessColor.RED, ChessName.SHIR, ChessStatus.BACK),
                new Chess(2, ChessColor.RED, ChessName.SHIR, ChessStatus.BACK),
                new Chess(1, ChessColor.RED, ChessName.BING, ChessStatus.BACK),
                new Chess(2, ChessColor.RED, ChessName.BING, ChessStatus.BACK),
                new Chess(3, ChessColor.RED, ChessName.BING, ChessStatus.BACK),
                new Chess(4, ChessColor.RED, ChessName.BING, ChessStatus.BACK),
                new Chess(5, ChessColor.RED, ChessName.BING, ChessStatus.BACK),

                new Chess(1, ChessColor.BLACK, ChessName.JIANG, ChessStatus.BACK),
                new Chess(1, ChessColor.BLACK, ChessName.CHE, ChessStatus.BACK),
                new Chess(2, ChessColor.BLACK, ChessName.CHE, ChessStatus.BACK),
                new Chess(1, ChessColor.BLACK, ChessName.MA, ChessStatus.BACK),
                new Chess(2, ChessColor.BLACK, ChessName.MA, ChessStatus.BACK),
                new Chess(1, ChessColor.BLACK, ChessName.PAO, ChessStatus.BACK),
                new Chess(2, ChessColor.BLACK, ChessName.PAO, ChessStatus.BACK),
                new Chess(1, ChessColor.BLACK, ChessName.XIANGB, ChessStatus.BACK),
                new Chess(2, ChessColor.BLACK, ChessName.XIANGB, ChessStatus.BACK),
                new Chess(1, ChessColor.BLACK, ChessName.SHIB, ChessStatus.BACK),
                new Chess(2, ChessColor.BLACK, ChessName.SHIB, ChessStatus.BACK),
                new Chess(1, ChessColor.BLACK, ChessName.ZU, ChessStatus.BACK),
                new Chess(2, ChessColor.BLACK, ChessName.ZU, ChessStatus.BACK),
                new Chess(3, ChessColor.BLACK, ChessName.ZU, ChessStatus.BACK),
                new Chess(4, ChessColor.BLACK, ChessName.ZU, ChessStatus.BACK),
                new Chess(5, ChessColor.BLACK, ChessName.ZU, ChessStatus.BACK)
        );

        Collections.shuffle(chesses);


        Iterator<Chess> it = chesses.iterator();
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 8; j++) {
                if (it.hasNext()) {
                    board[i][j] = it.next();
                }
            }
        }
    }

    public Map buildBoardMap(String pos) {
        if (board == null) {
            return null;
        }

        Map map = new HashMap();
        String picName = "";
        String img = "";
        int i = 0, j = 0;
        for (Chess[] rChess : board) {
            j=0;
            for (Chess cChess : rChess) {
                if(cChess.getStatus() == ChessStatus.BLANK) {
                    img = "";
                }
                else if (cChess.getStatus() == ChessStatus.BACK) {
                    picName = "CHESS_BLANK";
                    img = "<img id=\"chess_"+pos+"_"+i+"_"+j+"\" src=\"resources/Images/chess/" + picName + ".gif\" alt=\"\"/>";
                } else {
                    String chessColor = cChess.getColor().getName();
                    String chessName = cChess.getName().getName();
                    picName = chessColor + "_" + chessName;
                    img = "<img id=\"chess_"+pos+"_"+i+"_"+j+"\" src=\"resources/Images/chess/" + picName + ".gif\" alt=\"\"/>";
                }


                map.put("chess_" + pos + "_" + i + "" + j, img);
                j++;
            }
            i++;
        }

        return map;
    }

    public Map buildBoardMap(Chess[][] board) {
        if (board == null) {
            return null;
        }

        Map map = new HashMap();
        String chessName = "";
        String picName = "";
        int i = 0, j = 0;
        for (Chess[] rChess : board) {
            j=0;
            for (Chess cChess : rChess) {
                String chessColor = cChess.getColor().getName();
                if (cChess.getStatus() == ChessStatus.BACK) {
                    picName = "CHESS_BLANK";
                } else {
                    picName = chessColor + "_" + chessName;
                }

                String ss = "<img src=\"resources/Images/chess/" + picName + ".gif\" alt=\"\"/>";
                map.put("chess_down_" + i + "" + j, ss);
                j++;
            }
            i++;
        }

        return map;
    }


}
