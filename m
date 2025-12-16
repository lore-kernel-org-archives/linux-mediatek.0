Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE35D5B87A
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Dec 2025 00:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6hB6Rlz0TeuRm7o85h8oRkcQTqYWfoZxzRouu9O4pnA=; b=uIy8Y4PW0xvQI0L8WBwSkoKym1
	ulNNl7wvkzDBxBHmU5hnJ++Ci4MGSb6FiHUpHtVlyoGzPw7Xr79dZs4+ZFT3G3Vsx7UoGskiH6URz
	9PGWr8t5ogtwDNySvzA1+LAIE00y6UYjm4Bm1bXjDT4FJ9TBR3eh39IfyuoHmnxGGxqi+r4vudaDW
	Idhnb7paNzan9gCAkH1lFSgKlh45s3nTrSgZ67dHvQje6EWx+JfdjNju6IYEcSsB21d2o47Wc9yxN
	6bjJL+o8CXptF71WK/4oDpOYFMHxHxL04GUNWdQdVW8LrYBixpG3LcWlKMFe4EeMtzU6cQjNKuIyQ
	v3jkdNIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVJPl-00000004TLV-3LXS;
	Tue, 16 Dec 2025 00:59:45 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVJPj-00000004TKr-1kEU
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Dec 2025 00:59:44 +0000
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7c7bfba3996so2611553a34.0
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Dec 2025 16:59:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765846780; x=1766451580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6hB6Rlz0TeuRm7o85h8oRkcQTqYWfoZxzRouu9O4pnA=;
        b=rPNmzXCIRbBB6V9XglCFQSJMDTVaIq8vY3g41sQPn09+F287Ab/QYnnkUKRCRgG9M8
         0BXCM3rugfM/e1apQyVAIbE2K5A2A0u2P1bLUotL6z64VP+dT2yNwn2QfptAUHNschKp
         smDatlJlkS0C0ZQk6naVazge6AxNW5iCRe1rmMEmpvr7rtRfXOPrC3u0yR3gWxYUn6sZ
         WKya+FVqSW0m62X6Ip+NKnwL1e1fTR36GKPGdJzSTKFHWMY+ViWWUNnRwN69NdLNB8dP
         ptFMWA848wb7CsYXHbCQLK18JvhIoz69wr71/3S47EL64KTh80JJV0FWFbfA46imRhtC
         GNpw==
X-Forwarded-Encrypted: i=1; AJvYcCWD+QZQblXZMnnU6aCuwrDfOMwogW3YE1gYpeXU/f3r0Zfx0fWsfKHg1aDzN3fUcdD77BiD3i0JZ7sobhgrlA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwN3RCe/pOH+MHrswLuucqDrsAdok+i5kQtraaP0KnOnDsjKjmm
	N9GLT+CnDRgrPGsTsy05vorta/JV1WH3IRUxsJbT2WVHBbBTfm+QK++8
X-Gm-Gg: AY/fxX4NpyXRmBi0sxZ68izPsudDIIxxC1kKC1U1CV2mb/7ItLy6QLP5tHaf+9UQFcc
	jGsCB1+GBrVqLDJSbFAjWw/J2pCoVwLbC/FCoB1pADkA63RJq48n9XnCEW4PO7R9znWGM/1Ud/x
	cQYyXuaVgxP0G/53FcAmKSAIXRF64kPaBSy27Fmyd+605fOiwWXDN9daY6t6ukI85+SfsCYE8yf
	ZrYlB7N2Z/G5rmoAJG4iKGaN2aW38xhmleMPQRVvGJI1joOxqvdtKjrNaQkUkngDktWO0RcI35e
	V93zzxJZDWqib4P78/zsWz2L9qLlSJ/WK2tG3/caM+/gOLIe+ENONPPOLvPxQk5/0kddKPrApHK
	FiSD27aVY+JSV/7/ivCL20jTqb69JwjvLpFcTprCtInT7e52Ar+4FhCSGfLgIdGDoCXMAf9Sp5I
	MooJGqga5DPRi+LJET8Z992MOobhqnJksRQAc=
X-Google-Smtp-Source: AGHT+IFr+zNqBkl81MoHWp5u19ECMKiAxU3MfUjuUK8ZKOB8IYtwaHUFJOjVRGMGKHvM0opSoc26Hw==
X-Received: by 2002:a05:6820:2223:b0:65b:336f:f33a with SMTP id 006d021491bc7-65b45201660mr5590725eaf.38.1765846780331;
        Mon, 15 Dec 2025 16:59:40 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-65b4a581cf6sm6522696eaf.5.2025.12.15.16.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 16:59:39 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@kernel.org
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7921: Reset ampdu_state state in case of failure in mt76_connac2_tx_check_aggr()
Date: Mon, 15 Dec 2025 18:59:30 -0600
Message-ID: <20251216005930.9412-1-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_165943_480781_F3839584 
X-CRM114-Status: UNSURE (   8.02  )
X-CRM114-Notice: Please train this message.
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

Reset ampdu_state if ieee80211_start_tx_ba_session() fails in
mt76_connac2_tx_check_aggr(), otherwise the driver may incorrectly
assume aggregation is active and skip future BA setup attempts.

Fixes: 163f4d22c118 ("mt76: mt7921: add MAC support")
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
index 3304b5971be0..4ef44514d48d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
@@ -1152,8 +1152,10 @@ void mt76_connac2_tx_check_aggr(struct ieee80211_sta *sta, __le32 *txwi)
 		return;
 
 	wcid = (struct mt76_wcid *)sta->drv_priv;
-	if (!test_and_set_bit(tid, &wcid->ampdu_state))
-		ieee80211_start_tx_ba_session(sta, tid, 0);
+	if (!test_and_set_bit(tid, &wcid->ampdu_state)) {
+		if (ieee80211_start_tx_ba_session(sta, tid, 0))
+			clear_bit(tid, &wcid->ampdu_state);
+	}
 }
 EXPORT_SYMBOL_GPL(mt76_connac2_tx_check_aggr);
 
-- 
2.43.0


