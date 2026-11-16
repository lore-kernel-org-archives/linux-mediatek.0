Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB947606A331
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 23:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q0d3tYDV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=i+izZmq3PYV8lmj4s7PUZ89GCKURmk/0VoVafPgoYXk=; b=q0d3tYDVaKGYyV
	J7LXRSql2a1IQyJ2CTbu8HreD31ZHYzefK2REQNFYE74Ma6mtVWiLnIMDHmZefwXP9Qu08QEtIEY+
	e6HH3q29WBcKVduTLndGMrwpcMtDKDA2NPK6Pyt14a7uoH372iaNbpltkXuPtUoWBtLM/yuMkIY36
	3uOB+piS5K5R+1m//1FXg2Kt5LLNpo4Af3bMbgvogwAFTq5KnJnrMbDsNQLS/zX7DsLAQveIBvBZM
	KXhkthJiXq0aSPo6FREXa3g9JKdUUBZTa1YpMLBnK0mYlNgo1GKm2KIoPiWrms4NKHUSIZa4eGEj7
	T4h7hwW4zqiN4NOrDm8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5zc-000000049uZ-2mkb;
	Mon, 16 Nov 2026 23:20:08 +0000
Received: from mail-oa1-f44.google.com ([209.85.160.44])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5zV-000000049qg-2wA5
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Nov 2026 23:20:04 +0000
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-490d838b425so2645015fac.3
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2026 15:20:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871201; x=1795476001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i+izZmq3PYV8lmj4s7PUZ89GCKURmk/0VoVafPgoYXk=;
        b=1AEWkRD+Fb0twV5BVVVvBR69nV2Q9OJMIfquuNUCn1YbAJNGSdc4FAPnKm2UX7vibG
         h/JA102S8gGlDvSRMW21Z+4v33a/O3vPeXumDVjjriJwbYQWrGLl6QQ4Ki+SipMri2Bk
         3WsxLtlKvzSQo9qCWZjB/mTAujZ+V+nLm9W2peO4Pv2997Xb7fYKCFBqL8a8FQSv85n1
         oIb3Q6ZT9kBHof/rIcmeNakc40QUgF+/P+N2oaokvRfe3tk9JGqKO0m49CKRMaYV9qdi
         jFwhcESo+cSOB/nmjPwkFngcEyog3O/pwhkjEwCfs+wsfbP54HvfHBzMomiKj8L1cEqs
         Layg==
X-Forwarded-Encrypted: i=1; AL+hErGMHuUWjRVVXa+jyX6AYACBcRUzcXCtzDjDSJHGmyAW9DpzzceiHwv5bRrmewyYBpQUCyxt1J8fWTrGuFfOrA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+9RGgRFaYqWBxvQnWeRr4TkQI282l1QtEC0t3Z+iw7L2eMyeI2
	NiT1BCGEtmBPsTfYGg56I5klALi2vmvglMY5+J4sU2Z4f7Fdvg01oeJk
X-Gm-Gg: AYBFou1dNho0YuFkH53Sv22Dhl8yaoqiqsxTiA1JxwYpAwmlxYeA+dydQ6aVRHnsxwD
	KLmL95XKK9XIhK32ViR9tPhG4gqkN4PQ2l9p4hjq8x9eYpQOVr/aSlT2scu3vbfEaCwXBn2LK0n
	zGU7fbH7153uOP0M4o47Wd7tXAECT8Sud/GVS77yG6keErPrlIOWCq5q9wRVj9bd8mBnBOV3/ng
	qYSIusXQv5F26reK5d7ddGjJNp10gfRFRGRp6/MuAKBDGXOmZ9meDurh+kr5uux0WyHWJOB2die
	6V/v00LuI+7dUbp1kBcvlHiG+mqSgzOLhk+RVmv+S41WmwVFVv5N+TkVZVhe9sfO/vmdlXaNF8H
	5vnlPxad1ICz51Pmg0ZWuaIibwLfpSkALo13oE7zNTWcbqZh3loCy47fw0erRRt6L10ZiYOfoDA
	saCcqP0hJsS2hR7vvPOOd/2qUAyIETUIZ6v1QZX2W3bN6EJrLadLYZ7BWirsR7OeWFBgIgxjNGB
	QXzFluUDhMjSKdHirBXlVqpzlrGlrc9C5t+hfWmBBhwvFjGNybBAJX2dhyB3NdxNUgUnN9f4r8F
	/ht/olud90k8Kl5fXqbA2MMmdR5oo3vDrwI7AGj2RvFaUV1QcWs+kP6i1tgkxkoPPO2lxo0eMUD
	P43VNJZGu
X-Received: by 2002:a05:6808:2388:b0:564:4f93:709f with SMTP id 5614622812f47-56e65a43c27mr9649496b6e.67.1794871200673;
        Mon, 16 Nov 2026 15:20:00 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm10239635b6e.13.2026.11.16.15.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:19:59 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@kernel.org
Cc: yu-ching.liu@mediatek.com,
	chengwei.yu@mediatek.com,
	jacobs.wu@mediatek.com,
	posh.sun@mediatek.com,
	clifford.hsu@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v2 17/19] wifi: mt76: mt7925: bound the lifetime of NAN unicast management frames
Date: Mon, 16 Nov 2026 17:16:28 -0600
Message-ID: <20261116231630.1733906-18-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116231630.1733906-1-sean.wang@kernel.org>
References: <20261116231630.1733906-1-sean.wang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_152003_254280_A2D15E59 
X-CRM114-Status: GOOD (  16.97  )
X-Spam-Score: -0.5 (/)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jacobs Wu <jacobs.wu@mediatek.com>

A NAN unicast management frame sent to a peer that has disappeared never
comes back to the host. The frame sits on the gated DW-WTBL queue, the
gate opens at every discovery window and the hardware retransmits, but
the retry budget is re-armed each time the queue is released, so it
never runs out and no TX status is ever generated. The host keeps the
skb in its status table indefinitely, the supplicant waits for a TX
status that does not arrive, and every later management frame on that
queue lines up behind the dead one. In practice a single lost peer stalls
all further NAN handshakes on the interface.

Set MAX_TX_TIME in the TXD for these frames so the hardware bounds them
in time rather than in attempts. When the limit expires the frame is
dropped with the lifetime-expired bit set, the host sees a no-ACK
status, and the queue drains. Forty-six units of 64 TU is about 3 s, six
discovery windows, which is beyond the 2 s NDP handshake deadline so a
frame that still has a chance to be delivered is never cut short.

Fixes: 0f3605e4f8de ("wifi: mt76: mt7925: wire up NAN operations")
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Jacobs Wu <jacobs.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c    | 12 +++++++++++-
 drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h |  3 +++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index 9837018ba193..686efd16f1dd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -836,8 +836,18 @@ mt7925_mac_write_txwi(struct mt76_dev *dev, __le32 *txwi,
 		struct ieee80211_hdr *nan_hdr = (struct ieee80211_hdr *)skb->data;
 
 		if (ieee80211_is_mgmt(nan_hdr->frame_control) &&
-		    !is_multicast_ether_addr(nan_hdr->addr1))
+		    !is_multicast_ether_addr(nan_hdr->addr1)) {
 			val = FIELD_PREP(MT_TXD3_REM_TX_COUNT, 31);
+
+			/* The retry budget alone never finalises a frame whose
+			 * peer has gone: the DW-WTBL gate re-arms it every DW,
+			 * so firmware holds the frame indefinitely and the host
+			 * never gets a TX status. Bound it in time instead -
+			 * about six DWs, beyond the 2 s handshake deadline.
+			 */
+			txwi[2] |= cpu_to_le32(FIELD_PREP(MT_TXD2_MAX_TX_TIME,
+							  NAN_MGMT_MAX_TX_TIME));
+		}
 	}
 
 	if (key)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
index 1c20b4ae7497..e58eab5a43e9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
@@ -31,6 +31,9 @@
 #define MT7925_SKU_MAX_DELTA_IDX	MT7925_SKU_RATE_NUM
 #define MT7925_SKU_TABLE_SIZE		(MT7925_SKU_RATE_NUM + 1)
 
+/* NAN unicast mgmt TXD MAX_TX_TIME, units of 64 TU: 46 is about 3 s */
+#define NAN_MGMT_MAX_TX_TIME		46
+
 #define MCU_UNI_EVENT_ROC  0x27
 
 #define HIF_TRAFFIC_IDLE 0x2
-- 
2.43.0


