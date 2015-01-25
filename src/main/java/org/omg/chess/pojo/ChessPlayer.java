package org.omg.chess.pojo;

/**
 * Created by lihongjun on 15/1/25.
 */
public class ChessPlayer {
    private String sessionId;
    private String userId;

    public String getSessionId() {
        return sessionId;
    }

    public void setSessionId(String sessionId) {
        this.sessionId = sessionId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }
}
