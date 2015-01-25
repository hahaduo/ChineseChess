package org.omg.chess.common;

/**
 * Created by lihongjun on 15/1/24.
 */
public enum ChessColor {
    RED("RED",0),BLACK("BLACK",1);

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

    ChessColor(String name, int index) {
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
