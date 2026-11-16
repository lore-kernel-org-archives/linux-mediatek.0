Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90509606A330
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 23:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1g8a1LTX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=f3Z16Is7JJ5QNyB2RJKkWgILNYqi5rZnhGq+IeCbrE8=; b=1g8a1LTXtVK8z+
	K7neL3vCiWZVEWwc1yKNz7fcwk4aybhlmRp/Hz86hSbmVL+xb8FAF+v1H3XEe2BJ3g9t4toX5lpCI
	+Yxcsp/LrR/PVWnsmkbxLjsLE6Z4DrPAUUn4M0Wv6qPci8VBWvrwldCjzyCE90PauIL5VDJepWaH/
	FW0TeTG+rCbnN/GLNGYGLgw/mFLR6CJ7ENpX6sKFYJE2T5bDDLYdJqp4dFbCY5nNSbwEL4yLbM+qC
	NDor7Stg9L3o/bWrIZlVoPk0R7rD2XbbSuYSbtwTed184iSm+s+Uz3s2fRjFU72Hq98tvjgyzcy5+
	J1Zfa3A6TZMrUAXP+KJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5z7-000000049fO-1HW7;
	Mon, 16 Nov 2026 23:19:37 +0000
Received: from mail-oo1-f43.google.com ([209.85.161.43])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5z3-000000049ct-24nN
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Nov 2026 23:19:36 +0000
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6b19e291cc6so4644588eaf.2
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2026 15:19:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871172; x=1795475972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f3Z16Is7JJ5QNyB2RJKkWgILNYqi5rZnhGq+IeCbrE8=;
        b=eV5nBdaFHFlh+C8bDJZoWKBY13Ks7io8nrreGMFhWhYmgN9M+6fW7OzW25Xbb0udEW
         eI6ASThoSHPyKAqtH44wtLTR1XPyfW2gIsmemA6lEwIRL0tCe3nEWyA/C5mkMun4OM5G
         jK6wL+F27MAiWy+hCFtxvhKMI2u0s+gLIO65pjYEMO+e6/H9zJITTP5fnxnYA+uQ2e70
         /n6/QkDzS9x89I6TwB9Oi+nncbkUALEsZrW4l15Gfp8siR52YAQBtzKKbU52yZme+Jw8
         ZnEfDIGxP3Z/jfK0oSbWEqRo4kE+8R0VI7VZc+zlhdohMl1VGxQ73SQNs1dEqOdT0KYp
         3W3Q==
X-Forwarded-Encrypted: i=1; AL+hErHVJEBPPsJ1o6Pr9znhTtc8KvW0KkR8eSL3VxkLX1jUsDyJiZeImL+nRDfYD4CAFHcnIazX4AikXrEwR1I2/Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z+Qna4RPb76e/WOfqoXh3XL2VKbvSkKd3NduzIkcJoY1HXo5oxV
	5kGxd5NhLFdmuPvtYJKoJufB7Oy6o9YFPjrCwiblYcYFuDPXwQvFpVKt
X-Gm-Gg: AYBFou3LdPAIh1dUltJJGLU3TCsynZNqv1Hz1Lr6l7sFZIrzVDgcRfosLsXkgsOp2BU
	082mwcrighRKp4PKsbNIeieYnj6wkwcecBUkZo5vNLFWRIcXaGYGaV5eDHCo0ssvFT1SKv84SlL
	hI2D5bgwAZ5d1pOZs9V82DelbwdDv4bxssJocMMGHK8vSXRr2/IFFWHwlr9vEEm1fPvO3PJzkb9
	Dyab9y4ml9PSd7r3MUcmQUHrzza5/I+2oqxxqahvHdawn/GmOWxHfYWlKDNzuXooIPweWRUBx9U
	DvZrhvuC8osA9mONsxt3ly1WX14sIHlkFUGV64eUEy8ztbfiWMmE0qz54979o0rrq/PRH1wT9Nx
	rSCWpBK0QVQUdHrSP4V5VC+ukJrB4Ffr99D/tJLn88Rc/rj6D8mQoQQ1HXaxZ6m1t8Q0yiENvZh
	z2NwejXlFU642LCe/oU+cjfv52xR2owZGtvLP8JbFHlahnzIR+y02zRH4jROA1YRsq36Ymh7RTH
	qi53I0HabT4LbUGqMIJ+aO1haoD40gEBMtsEugGdYJfYg5Q8ul++Y2Ka1o7FAdEYjwy+W+kQYpQ
	MPezNm4J2yfARQYGpYjj3oiOuRsAioQxYvW9LaRm23/8jQEU3og6rccMna+bFRFPByP/qfTKSYf
	hi2nbZQGw
X-Received: by 2002:a05:6808:319b:b0:4f4:d7:b16d with SMTP id 5614622812f47-56e65c53555mr9526418b6e.60.1794871172475;
        Mon, 16 Nov 2026 15:19:32 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm10239635b6e.13.2026.11.16.15.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:19:30 -0800 (PST)
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
Subject: [PATCH v2 12/19] wifi: mt76: mt7925: let TX status of DW-held NAN frames outlive the DW period
Date: Mon, 16 Nov 2026 17:16:23 -0600
Message-ID: <20261116231630.1733906-13-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116231630.1733906-1-sean.wang@kernel.org>
References: <20261116231630.1733906-1-sean.wang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_151935_039768_6B656255 
X-CRM114-Status: GOOD (  14.33  )
X-Spam-Score: -0.4 (/)
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

Frames on the NAN DW-WTBL legitimately wait up to a full discovery
window period (524ms) in a paused queue before they air, but the TX
status tracking times a packet out MT_TX_STATUS_SKB_TIMEOUT (250ms)
after DMA completion and reports it as failed. wpa_supplicant treats
the false no-ack as a delivery failure and retransmits: a NIK follow-up
held to the DW is then re-queued every cycle, the peer receives one
copy per DW (56 copies measured over one 30s window), and the resulting
pairing-confirm storm poisons the pairing-verification state, which
never triggers and times out.

Extend the TX status lifetime for frames tracked on the DW wcid so the
status is reported from the actual transmission.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Jacobs Wu <jacobs.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/tx.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/tx.c b/drivers/net/wireless/mediatek/mt76/tx.c
index 08b04f092a0b..7e205412dae3 100644
--- a/drivers/net/wireless/mediatek/mt76/tx.c
+++ b/drivers/net/wireless/mediatek/mt76/tx.c
@@ -190,11 +190,20 @@ mt76_tx_status_skb_get(struct mt76_dev *dev, struct mt76_wcid *wcid, int pktid,
 		struct mt76_tx_cb *cb = mt76_tx_skb_cb(skb);
 
 		if (pktid >= 0) {
+			unsigned long timeout = MT_TX_STATUS_SKB_TIMEOUT;
+
 			if (!(cb->flags & MT_TX_CB_DMA_DONE))
 				continue;
 
-			if (time_is_after_jiffies(cb->jiffies +
-						   MT_TX_STATUS_SKB_TIMEOUT))
+			/* A frame held to the NAN DW legitimately waits up to
+			 * a full DW period (524ms) before it airs; timing its
+			 * status out earlier reports a false no-ack to the
+			 * one-shot NAN handshakes (PASN, NDP key install).
+			 */
+			if (wcid->nan_dw)
+				timeout = HZ;
+
+			if (time_is_after_jiffies(cb->jiffies + timeout))
 				continue;
 		}
 
-- 
2.43.0


