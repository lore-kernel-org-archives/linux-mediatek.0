Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC063FF885C
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Apr 2026 19:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wlbgcyHHgMJ+HRdBcG0VPI5pwKjamNrjevADSB1tt3A=; b=dIHM3lnGPjPjvJkX0xgpLFJpRz
	xXhtNqggTPEx2SX5q9pNbfg+BZX1YoJRYZ6WVZNmkQo1C8pjLwy593H+bUp1cXoS1NEV96EKn0tHW
	/qQyHf/8wlF10NLcyCLOKdtcCCI+GRI0JtU99/ZuWfxl93hrQ3NkUV4UF2FqpEECtARLdFRo7BU+2
	iOzA041D+pLStBkAQ/cTRihRBlZVeF+qMhRYxyFTR0HUGcCKLWhA3TK566/8bBQaKuGi80zZScR2o
	90oc5D0uAEvHza/X4j31cx90vQ9ern02eAu9Ld2xp1JQ7wBvfZ+2W7hwqGnRTceWwsJMmHorKgu6y
	Dvshk3bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGj1W-0000000EmCG-33ja;
	Sat, 25 Apr 2026 19:50:42 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGj1V-0000000EmBv-0fyg
	for linux-mediatek@lists.infradead.org;
	Sat, 25 Apr 2026 19:50:42 +0000
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7dcdd1b492eso4789655a34.1
        for <linux-mediatek@lists.infradead.org>; Sat, 25 Apr 2026 12:50:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777146640; x=1777751440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wlbgcyHHgMJ+HRdBcG0VPI5pwKjamNrjevADSB1tt3A=;
        b=joQkRcHKwfwKF1Jb3RXOWURMZXbOaeSmYKndIjxBBZ25Abxez//OjhHJ8NhRwgaN7d
         BCtnP5qU1fIt8CScrRe8dW6ygdu6dwy8TPU78sOVUfgxREoK+LStDq2EIEYfxUcA7ipz
         WnE57SK1hb5VWiXFFfKuWTWF+wRq/UIDRnFvPnbugysWGJBOgBkJ9gYDqEPJXJztOVUj
         Mhqamb1xLGXbhLjt5o03O9A8QtlAkiaRPNcDxss5PdT+Vt2F4cPHITJUon54UBGKdDCa
         gxAAmYHlsXBKwKJlv2HfyZK4E6sAXqEQ49afe++5IA57gRgmWTPVhecR/VaKLE8qpAa6
         Yocw==
X-Forwarded-Encrypted: i=1; AFNElJ9lI+6G4GmhoPBiuxsAgjy8DLgrF2k7rol6C67sdEKz8V2bll9334QkHP6cxMK/2DbvZAT0t6vZRqp+S8F3iQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2ylOeVbBWiiDar4ISHZMVtgv3jLksWJDPKqe0QB0kAouN6Xey
	+D+UgbUBSt+JiItAeSeZOGqP9RPSFGRBioe6q0BSRlCW64+zS8wmBWz0
X-Gm-Gg: AeBDiesrYaMSG+yGST+3BHJQm9mnkvOt7Uf3/Kh1mSijbWlkyOqknYKbkWg+Lz+71mw
	qCko81Dvks7oeuTzftQ8a9gri+Gq71Fbq4sxao4nw1fKKpALvmDfk+fqGcgcBbEF8Q3O3nZgSB3
	+AT3uIfDliCYB87Xfi5XMHsp44lZwG26ggDCqkt1KninJoqev/S2/HBxb5asgqLDq6BZojscHgj
	U1fQyLiV3XYS4FqG5WNlDGR7SMEjRKiP8glc/glsVsStZ9ogb8/9LnnEglRPq8V0kN+Boy+LAdD
	64xOwqrTAsEsxeD/Fuk8jT469FY8BQ/KJc+x8TAUqWxrXB+VB3+OAWu9hhoOTdqGtax9po39dhn
	v/l2NzDIZ4x9WB+fg5wpAsHHsipUdqIINVNbrKbUv3rbwJrdum38VCOqENT5T3Fht+f1aZZZ7we
	307vFplGo3TVcD16t1yCOv3Y453lwbTlpmPFjcWjezT18GwRpqd2M3N7rSkdsVuskLAv7z/sHnh
	FOgbNOST697
X-Received: by 2002:a05:6830:3811:b0:7dc:e3ad:6088 with SMTP id 46e09a7af769-7dce3ad67f9mr10380486a34.0.1777146640247;
        Sat, 25 Apr 2026 12:50:40 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:2e29:c3c3:de27:ce76])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dcd164d2c3sm13987624a34.24.2026.04.25.12.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 12:50:38 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Javier Tia <floss@jetm.me>,
	Marcin FM <marcin@lgic.pl>,
	Cristian-Florin Radoi <radoi.chris@gmail.com>,
	George Salukvadze <giosal90@gmail.com>,
	Evgeny Kapusta <3193631@gmail.com>,
	Samu Toljamo <samu.toljamo@gmail.com>,
	Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>,
	Chapuis Dario <chapuisdario4@gmail.com>,
	=?UTF-8?q?Thibaut=20Fran=C3=A7ois?= <tibo@humeurlibre.fr>,
	=?UTF-8?q?=E5=BC=A0=E6=97=AD=E6=B6=B5?= <Loong.0x00@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v5 03/21] wifi: mt76: mt7925: handle 320MHz bandwidth in RXV and TXS
Date: Sat, 25 Apr 2026 14:49:53 -0500
Message-ID: <20260425195011.790265-4-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260425195011.790265-1-sean.wang@kernel.org>
References: <20260425195011.790265-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_125041_201744_DBFCEB8F 
X-CRM114-Status: UNSURE (   8.37  )
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

From: Javier Tia <floss@jetm.me>

The RX vector (RXV) and TX status (TXS) parsing in mac.c lack handling
for 320MHz channel width. When the hardware reports 320MHz in the
bandwidth field, mt7925_mac_fill_rx_rate() returns -EINVAL and
mt7925_mac_add_txs_skb() records no bandwidth stats.

Add IEEE80211_STA_RX_BW_320 cases to both functions. The RXV parser
also handles BW_320+1 since the hardware can report 320MHz in two
adjacent encoding positions.

Tested-by: Marcin FM <marcin@lgic.pl>
Tested-by: Cristian-Florin Radoi <radoi.chris@gmail.com>
Tested-by: George Salukvadze <giosal90@gmail.com>
Tested-by: Evgeny Kapusta <3193631@gmail.com>
Tested-by: Samu Toljamo <samu.toljamo@gmail.com>
Tested-by: Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>
Tested-by: Chapuis Dario <chapuisdario4@gmail.com>
Tested-by: Thibaut François <tibo@humeurlibre.fr>
Tested-by: 张旭涵 <Loong.0x00@gmail.com>
Reviewed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Javier Tia <floss@jetm.me>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index c47bd812b66b..d681005cc6ff 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -339,6 +339,11 @@ mt7925_mac_fill_rx_rate(struct mt792x_dev *dev,
 	case IEEE80211_STA_RX_BW_160:
 		status->bw = RATE_INFO_BW_160;
 		break;
+	/* RXV can report 320 in two positions */
+	case IEEE80211_STA_RX_BW_320:
+	case IEEE80211_STA_RX_BW_320 + 1:
+		status->bw = RATE_INFO_BW_320;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -997,6 +1002,10 @@ mt7925_mac_add_txs_skb(struct mt792x_dev *dev, struct mt76_wcid *wcid,
 	stats->tx_mode[mode]++;
 
 	switch (FIELD_GET(MT_TXS0_BW, txs)) {
+	case IEEE80211_STA_RX_BW_320:
+		rate.bw = RATE_INFO_BW_320;
+		stats->tx_bw[4]++;
+		break;
 	case IEEE80211_STA_RX_BW_160:
 		rate.bw = RATE_INFO_BW_160;
 		stats->tx_bw[3]++;
-- 
2.43.0


