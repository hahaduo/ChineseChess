package org.omg.chess.pojo;

import org.omg.chess.common.ChessColor;
import org.omg.chess.common.ChessName;
import org.omg.chess.common.ChessStatus;

/**
 * Created by lihongjun on 15/1/24.
 */
public class Chess {
    private int num;
    private ChessColor color;
    private ChessName name;
    private ChessStatus status;

    public Chess(ChessStatus cs) {
        status = cs;
    }

    public Chess(int num,ChessColor color,ChessName name,ChessStatus status) {
          this.num=num;
        this.color=color;
        this.name=name;
        this.status=status;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public ChessColor getColor() {
        return color;
    }

    public void setColor(ChessColor color) {
        this.color = color;
    }

    public ChessName getName() {
        return name;
    }

    public void setName(ChessName name) {
        this.name = name;
    }

    public ChessStatus getStatus() {
        return status;
    }

    public void setStatus(ChessStatus status) {
        this.status = status;
    }
}
