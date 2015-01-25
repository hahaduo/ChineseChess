package org.omg.chess.common;

/**
 * Created by lihongjun on 15/1/24.
 */
public enum ChessName {
//    SHUAI("帅",10),JIANG("将",11),CHE("车",1),MA("马",2),PAO("炮",3),XIANGR("相",40),XIANGB("象",41),
//    SHIR("仕",50),SHIB("士",51),BING("兵",60),ZU("卒",61);
    SHUAI("SHUAI",10),JIANG("JIANG",11),CHE("CHE",1),MA("MA",2),PAO("PAO",3),XIANGR("XIANGR",40),XIANGB("XIANGB",41),
    SHIR("SHIR",50),SHIB("SHIB",51),BING("BING",60),ZU("ZU",61);

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

    ChessName(String name, int index) {
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
