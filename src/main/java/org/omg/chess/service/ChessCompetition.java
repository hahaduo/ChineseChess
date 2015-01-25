package org.omg.chess.service;

import org.omg.chess.common.ChessStatus;
import org.omg.chess.pojo.Chess;
import org.omg.chess.pojo.ChessPlayer;

/**
 * Created by lihongjun on 15/1/25.
 */
public  class ChessCompetition {
    private ChessBoard upBoard = null;
    private ChessBoard downBoard = null;
    private ChessPlayer player1 = null;
    private ChessPlayer player2 = null;

    private static ChessCompetition cc = null;

    private ChessCompetition() {
        upBoard = new ChessBoard();
        downBoard = new ChessBoard(true);
    }

    public static ChessCompetition getInstance() {

        if (cc == null) {
            cc = new ChessCompetition();
        }

        return cc;
    }

    public void setPlayer(ChessPlayer player) {

        if (player1 == null) {
            player1 = player;
        } else if(player2==null&&!player1.getSessionId().equals(player.getSessionId())) {
            player2 = player;
        }
    }

    public int checkPlayer() {
        if (player1 == null) {
            return 0;
        }

        if (player2 == null) {
            return 1;
        }

        return 2;
    }

    public ChessBoard getUpBoard() {
        return upBoard;
    }

    public void setUpBoard(ChessBoard upBoard) {
        this.upBoard = upBoard;
    }

    public ChessBoard getDownBoard() {
        return downBoard;
    }

    public void setDownBoard(ChessBoard downBoard) {
        this.downBoard = downBoard;
    }

    public void turnOver(int x, int y) {
        Chess chess = downBoard.getBoard()[x][y];
        chess.setStatus(ChessStatus.FRONT);
        downBoard.getBoard()[x][y]=chess;
    }
}
