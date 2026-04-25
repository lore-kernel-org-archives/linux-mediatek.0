Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3794EFF8860
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Apr 2026 15:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l6d/GYUeSuSfXW+Ex6x7Idrw1Ep1oXeXemdte9T+WrE=; b=2ctAbUwH599s8YeE02SZaYurzz
	gtafZmbXRVyhDTwRd94Sxy4JCd0n70Vm8wXW/fi3G6G33i+ICPt6qmz9Za6dyDLm0oybtIlVT9E2I
	atS2a+7tNyDyqE6+yVb+en/kHPMwoSm55up0GFSAj02rCzjiDzuWIP+g2IKuz67OUgRqOLWUCIY7Y
	bGVnL34wnvxxXaWNfPdBqm+fIXtJISQ3AJ27H84qn03CDnlu0UxZ7q+oafKpgTU4wzCptSTFgCxWi
	yooASXGeEdLX21aFgk7E2zTaItVZe/7Bk4hG4HmY3Ez/oNrvRutcQA7lJEmU+pskSucS2xB1IAB9E
	VDI0norw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGfEL-0000000EYYG-3c6l;
	Sat, 25 Apr 2026 15:47:41 +0000
Received: from mail-oo1-f41.google.com ([209.85.161.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGfEJ-0000000EYXv-0rzi
	for linux-mediatek@lists.infradead.org;
	Sat, 25 Apr 2026 15:47:40 +0000
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6948ed7139eso3012550eaf.0
        for <linux-mediatek@lists.infradead.org>; Sat, 25 Apr 2026 08:47:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777132058; x=1777736858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6d/GYUeSuSfXW+Ex6x7Idrw1Ep1oXeXemdte9T+WrE=;
        b=VAQ93fEYbIDd22D4efa/xRFIDVZ/I6x+rTYxRA4zuGh3I9r4iH4tnfp9XQyquhibWr
         04/6M3v+wBkZFkeVCCEevv5BiI2h1D87eHdBvBUxnjB92E5Xpl42dHu6c7pAH3e8tIm5
         bwnZ5CDqGKU0rRM2B52Yjpt/J8K772e7OnBlomP0qZq+sNypuziWL6i0zebMpKtdesLQ
         j9QwsVoILP67Xo0HrJ+fVIGV6afdK3mL79Zb4uT5jKzPtlCQGJHvbEnma07g1h/JuJEl
         DRK5r78ncxYrcOXJJM8EbclomdUpHxFv30RNvRo1pJ3yivgGgH5u1MzBQaL5QQlHJwvg
         ry2g==
X-Forwarded-Encrypted: i=1; AFNElJ9C7dq57s3R4++HD7Yxt5lEJdwhhdC79ZcP/GwFytDerPyOtEtRwpkZPyWpgC2Jbruio9D7uxTB8mtAgw7GkA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzlRmgwY0vE8edeV0NNX1LGrs7xOvdGwEQeLIi24V4sVgOxiARC
	VZW0XJMDbCIZCEj+bs9+Pik1GvYcEurHX2JCLd3FLY0lvOWN/rlj9LAV
X-Gm-Gg: AeBDieu3mvox6790IejAnKvabo9ybI6cGLyxkWOvi4kff4NWUqPtyDZErpTCyj/LvCl
	U3jn14fHOjZiv5/8V8i4M6jSt3Nkz26I/I0oXKMGlvcrQNgnp6nfTwl0O6hDlW2e70Fdlx+y2Kr
	VpaJGqbyQNlEbG71XnHFr9EtHI062UZ6imdG0uHBuGDETFbb5Q0U/IRLJeXCZPMEJ24FnSBQR4k
	bvhNGfgYJsg0FeWf+kl5joMdkU3q8FKuid7NtqlW0I8kX7TD5hlabgt9343knSPCmCYm6Mnw6rb
	xyJMnvKXnF3fyTYb3o08/+V1ZuyDDbeiH6qakZKgX7OE+EUhTxB9hdEaW0OswlX+rY+4lVYsgQ9
	abdH2IfhgYA2ndx5uP6/hUeG5HCxHhK5C7il3LvT7UJDeFCQL93DBhYfqx8P/bFtrgDAXi4ygn7
	pVN6EAKHHfS/oFKU5uDkvSTNiy2rPW39osTDaosvLGbDXZFgPkgdyuCzhS97fjTpK4H/kwBS7+e
	w==
X-Received: by 2002:a05:6820:189a:b0:694:8f18:ccd3 with SMTP id 006d021491bc7-6948f18cf50mr14123914eaf.3.1777132057826;
        Sat, 25 Apr 2026 08:47:37 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:9f96:11d3:5f6c:5582])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69493183021sm10094808eaf.13.2026.04.25.08.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 08:47:36 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>,
	Yao Ting Hsieh <yao-ting.hsieh@mediatek.com>
Subject: [PATCH 1/3] wifi: mt76: mt7925: keep TX BA state in the primary WCID
Date: Sat, 25 Apr 2026 10:47:19 -0500
Message-ID: <20260425154721.738101-1-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_084739_271594_FF25F354 
X-CRM114-Status: GOOD (  11.78  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

For MLO, the same TID can run over different links. Keeping TX BA state in
a link WCID makes the state depend on which link starts aggregation first.

Store it in the primary WCID instead, so the BA state stays stable across
links.

Fixes: 44eb173bdd4f ("wifi: mt76: mt7925: add link handling in mt7925_txwi_free")
Tested-by: Yao Ting Hsieh <yao-ting.hsieh@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index c47bd812b66b..f025c0efeda2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -841,7 +841,6 @@ static void mt7925_tx_check_aggr(struct ieee80211_sta *sta, struct sk_buff *skb,
 {
 	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
 	struct ieee80211_link_sta *link_sta;
-	struct mt792x_link_sta *mlink;
 	struct mt792x_sta *msta;
 	bool is_8023;
 	u16 fc, tid;
@@ -880,14 +879,14 @@ static void mt7925_tx_check_aggr(struct ieee80211_sta *sta, struct sk_buff *skb,
 
 	msta = (struct mt792x_sta *)sta->drv_priv;
 
-	if (sta->mlo && msta->deflink_id != IEEE80211_LINK_UNSPECIFIED)
-		mlink = rcu_dereference(msta->link[msta->deflink_id]);
-	else
-		mlink = &msta->deflink;
-
-	if (!test_and_set_bit(tid, &mlink->wcid.ampdu_state)) {
+	/* Packets belonging to the same TID can be transmitted over multiple
+	 * links. Keep the TX BA session state in the primary link so all links
+	 * share the same AMPDU bookkeeping.
+	 */
+	if (!test_and_set_bit(tid, &msta->deflink.wcid.ampdu_state)) {
 		if (ieee80211_start_tx_ba_session(sta, tid, 0))
-			clear_bit(tid, &mlink->wcid.ampdu_state);
+			clear_bit(tid, &msta->deflink.wcid.ampdu_state);
+
 	}
 }
 

base-commit: e8c819df02436f2c2379766946735e1f06a7c923
-- 
2.43.0


