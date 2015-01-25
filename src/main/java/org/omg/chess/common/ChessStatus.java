package org.omg.chess.common;

/**
 * Created by lihongjun on 15/1/24.
 */
public enum ChessStatus {
    FRONT("翻开",0),BACK("未翻开",1),BLANK("空棋",3);

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    private String name;

    private int index;

    ChessStatus(String name, int index) {
        this.name = name;
        this.index=index;
    }

    public static String getName(int index) {
        for (ChessColor c : ChessColor.values()) {
            if (c.getIndex() == index) {
                return c.getName();
            }
        }

        return null;
    }

}
