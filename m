Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCEB4C9832F
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Sep 2026 21:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wVYAMJ2HjVn2tCxOSRJ4ZWdbKDa8f4E0sD/NwLApySM=; b=IOt+j89HA6/h7n/yfsNvbpy1LJ
	nCXkbab5utnDFiDSbHtMsumhrIg+CeMLnMQrhckZgYT7CIRCN7VOyxb7JEbM4ortkyDfVeQixnAfU
	PknY2T2G3bsdZE3p1Qlh34xKjlEN+g6n3UNkpnE2IkFnaZ7IP8E1FlaMfBUWpqAUusR0/xUHTK5F6
	pT9/ezWi9TjjXcl7QFSHpk48iDUZcTUrWRmEjtry7JecNuH/UgnyCZLDGOgb9NcesvP/X4q3vvZ6/
	eSzy1TXX7x0dFQUGRFVzqI4a35fceES9blRTQck7ya5Xv7Iq8NKPBVPvM5++L73nBjYXKNoygEjSY
	91Z4YsbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAw2k-0000000GraN-2pRa;
	Sun, 27 Sep 2026 21:04:18 +0000
Received: from mail-yx2-f31.google.com ([74.125.224.159])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAw2i-0000000Gra3-2ZA0
	for linux-mediatek@lists.infradead.org;
	Sun, 27 Sep 2026 21:04:17 +0000
Received: by mail-yx2-f31.google.com with SMTP id 00721157ae682-8659af7454eso26109137b3.1
        for <linux-mediatek@lists.infradead.org>; Sun, 27 Sep 2026 14:04:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790543055; x=1791147855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wVYAMJ2HjVn2tCxOSRJ4ZWdbKDa8f4E0sD/NwLApySM=;
        b=eYJ2gnriHHLiTfyTW19aQ39qlZUIC23ITaHRf21j5zEYDVbe7VCkmwei4DCdSkCFER
         jpf3iAAmQXy7/ai6Up6VUAaGVogByJ/cuzRbNVM3edf50+3Qc4HPzOlHxWTg4b8EEV5M
         WUAtcXNMhXj418mC2LyyBR35jKX5odmOvlpuBwaAB3PhI5JAVfSeko0lfKgh26qafYTp
         +PmHwt+SQ0p1zH3UZUkObjcS4YuWNwfzQZGZU5Eudk5tnpgcYLSXZN2qVDeB+TGX3WZu
         nUbavf8HirlzsvjQ1hPcTGWiRHLTRLQrFQkzSuZ5cCqAZeg82qjubXyXN6/ctKCu+pau
         DqqQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0rj89us2RmKN4fvbEmprl3f9Xc9A3RDCJTmggHf4ppOsmnxB18fv0FRlXoV/8lg/rRshelXTDgSZ2o+WJqg==@lists.infradead.org
X-Gm-Message-State: AFq9FYKvzmcEWesAZtv9GPu9v8XD35kLooC5gRS9MuI2C86lzP/i7LTg
	iL17U2uAKwS0TvMfnYE0QpKUA/SXOZ3RGd4Ku/hPTI3tCwwQSQpJHVfVomzT3XLp
X-Gm-Gg: AYBFou2+/6v6lXv5KhKvt+Uy2jWfJrZspWxocyycYw5t2567RT1PH7QkwSeds/A+iEt
	fwkdqRj3KVpTK+0eSBQAw31LTfxv14ERlmtkEtcgPtrNSCsmanp1i059C9B1PEHS62hsEQBOpQW
	3bTKs1pBeDVyo5w5pGr10tfSZvw9o54fkxtZ3SaHOGdrLLlHBZ6P8l9mFDoP9Pt9I1yEgtO3P3y
	DMKKVGgtvpZjBYyCC6D1Uj5pd9IcHRtqF11Xtm8a6qCa3YoZu1h4zDr8HIabJlo8th0/JV9G4/Z
	+wMQhIOt5XTunvZ6Sye230fANAk5Xnkmd0i3gzLlIIQc6HI9Quba0+0nC2bkyxthxIcOVV28iHg
	7qv/Owy91aoYd7KNMGqtgk2Zpu+Q+fzgP8Iatq6fyUlWB5qzccRrkEjVFbxRTD8RxkhrLL+PlPl
	FTeIaRLoETxVinqyreo9c26hp1sfDMjHhcnGmAOPsM9A6NSOBgIslRFS3J6YWX13oSWvqgnRT8h
	h1zF6MmslXIO2LRXih+voLmKLlbKvuo4V38+uCQyx8TbEt35SHjfSWRuKhe1cUUoF9mgg==
X-Received: by 2002:a05:690c:680d:b0:873:5c0f:293 with SMTP id 00721157ae682-8a64c3421e5mr54283007b3.61.1790543055310;
        Sun, 27 Sep 2026 14:04:15 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:5dd7:b9c7:1078:5394])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a86103149dsm35389017b3.40.2026.09.27.14.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:04:14 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	yu-ching.liu@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	Jacobs Wu <jacobs.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 17/23] wifi: mt76: mt7925: let TX status of DW-held NAN frames outlive the DW period
Date: Sun, 27 Sep 2026 16:02:59 -0500
Message-ID: <20260927210306.737669-18-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927210306.737669-1-sean.wang@kernel.org>
References: <20260927210306.737669-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_140416_653934_238C0BAA 
X-CRM114-Status: GOOD (  14.13  )
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
index 72a4bc505aed..4197b8221f73 100644
--- a/drivers/net/wireless/mediatek/mt76/tx.c
+++ b/drivers/net/wireless/mediatek/mt76/tx.c
@@ -185,11 +185,20 @@ mt76_tx_status_skb_get(struct mt76_dev *dev, struct mt76_wcid *wcid, int pktid,
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


