Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB9C3CD98DA
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2026 16:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QfKOVyRBVUkjlDsBRH3w7gLrWCYdWHEdVo3BiIjzYz4=; b=GIbbkuZ/J5OZAzaWKjtNZnsdts
	6Qaqh5PWGlClZPNTU5U6OR5uyK7PBZsYtltOCxnvVhxTJT+dVGk0SjHI8GppPa55rRuyN3i/PwM3n
	C27CYHP+hab0/rES9jPnkXQK70XmAk15R1f7hDaieXL/ki4ux5+j/1V08uszHU1KeKGBofzdMWI6W
	eTgNqE0v5syXYUOipOH/57OL2DG6OB9yoASCQi+Ficuntjs37AUgsKRgVHFQfC+8DW/5UbVPogPyv
	IQq1LU+g1hJE/r092vz3Jgif/FnkZW5x8Y1Q8yMg+8rYxTP1tDB1sJmabX/y9q4rLiyTRy88Pw2Jh
	sImiAX4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZWNA-0000000G5DA-2SnK;
	Tue, 16 Jun 2026 16:10:44 +0000
Received: from mail-pl1-f182.google.com ([209.85.214.182])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZWN6-0000000G5CC-3EMe
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Jun 2026 16:10:42 +0000
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c0c2d8b95bso37226865ad.1
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Jun 2026 09:10:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781626240; x=1782231040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfKOVyRBVUkjlDsBRH3w7gLrWCYdWHEdVo3BiIjzYz4=;
        b=mwjfALSjyRt/vUbbeWhfvYvAUYYSFHpsJ8/jSMzJfsix2tX27TeDf2LAji38B9f7XO
         uctS6nXr7V97nV+SvYlNWb8JGpkn6XbryZd6UykEe14k4ddY409snQt+SAD4jyhR3gWW
         l/7ObXSVxxnR0/kRaLvWFoW615tAlThAcFRm5rtJnvsUEZ8ur5scjJx88XQIOGa2OROp
         3UYPM9ycq0dVTEbz+xDOFWDKFzHyoD5F/vqop3me5zCWOxuAG0R6msonyHATE0Lp/NaN
         3Fr+4suoFCnfzwFMi5CHbIeDP7QCNpJqknmGR5vuPejAYXGWO7uyhpD9s//KikcipAA4
         hjQw==
X-Forwarded-Encrypted: i=1; AFNElJ9zpjPyOgCmMZk6y6TmNFQR1McezQGtU5k3zC9xVgErN8l7aqsNazT3siyMazPX1Fj0BbFN3AIoY3f6dsqMYg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8/R2RO7pSuwHZxFY9p6pNrZtUX39o5wXh8cUlkZErqo9SQAsr
	ijeXsX69hMhT+SlvF2fhN1nVnd1mBpLW5O3LMCvASEjPg7KvONp5FJue
X-Gm-Gg: Acq92OGf5ApQ4345PCWlH6sj65A5LssLrLPHNr5VG4H0oQJPgy7BId96GyxHsbiEQtv
	GhBjU7Gr/cWySD6TlX2SrvyUhSGPkZ7Tsq6gHCSBa8UUsuyM5AKghAbw2poXWLV6rFaSOPbtlxl
	ccsq9sIc8jin12mR46ioIMeqof0UNs/lGHvr6HwsbF9OD2LBhzIqfQQjjuVCig9aOb3V89XGNi3
	akobDgL2yto+ouwaQcERNp5Nbh0NrMG6wkDuEjb+pyDHIV4VfBZ4Bkr/f1w0f21PEwSCrZSQnuG
	FRaY4fWQIUu6ZPzt9FVvaneMsS+tOJ3MPKX+tL7NeSC6+vut7oaG97XL4j7cbmzXnhbJ4rcp6yh
	lkY9G/+NU87FJ7hy93j1LH09bFZwp2K0L75fjgZMnH31cLsn0BG4ikn2dhcBiStAdMAQ0bC+wyy
	P1y0l3ErSdPeZsjCX71hw4qhi+F9OXIunwhmYJn9Rt+HxfDKCgRhYOOQI+itJD5uIIT76jtm61J
	CzTTeJm0DvGz7S81YAlFHfEdIx5/PE+CXnK5AQ9hYYRzg9Z3VI=
X-Received: by 2002:a17:902:ea06:b0:2c0:e5ee:f56c with SMTP id d9443c01a7336-2c664271b0amr171763185ad.20.1781626239769;
        Tue, 16 Jun 2026 09:10:39 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.. (114-34-228-194.hinet-ip.hinet.net. [114.34.228.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c432f77479sm139360655ad.63.2026.06.16.09.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 09:10:39 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7925: fix crash in reset link replay
Date: Tue, 16 Jun 2026 11:10:16 -0500
Message-ID: <20260616161016.19346-1-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_091040_990647_CF124E8C 
X-CRM114-Status: UNSURE (   8.92  )
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

During reset recovery, mt7925_vif_connect_iter() replays firmware state
for links tracked in mvif->valid_links. After MLO link changes or MCU
timeout recovery, the driver bitmap can temporarily contain a link whose
mac80211 bss_conf has already gone away.

This can pass a NULL bss_conf to mt76_connac_mcu_uni_add_dev(), matching
the crash where x1, the second argument, is NULL:

pc : mt76_connac_mcu_uni_add_dev+0x8c/0x1f8 [mt76_connac_lib]
lr : mt7925_vif_connect_iter+0x9c/0x168 [mt7925_common]
x2 : ffffff80a77f6018 x1 : 0000000000000000 x0 : ffffff8099402080
Call trace:
mt76_connac_mcu_uni_add_dev+0x8c/0x1f8 [mt76_connac_lib]
mt7925_vif_connect_iter+0x9c/0x168 [mt7925_common]
mt7925_mac_reset_work+0x264/0x2f8 [mt7925_common]

Skip missing bss_conf entries before replaying the link. Non-MLO AP/STA
reset replay is unchanged because the helper still returns &vif->bss_conf
for the legacy link.

Fixes: 14061994184d ("wifi: mt76: mt7925: add link handling in mt7925_vif_connect_iter")
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index d7e4ebe92342..cee4e4b8ff41 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -1284,6 +1284,9 @@ mt7925_vif_connect_iter(void *priv, u8 *mac,
 
 	for_each_set_bit(i, &valid, IEEE80211_MLD_MAX_NUM_LINKS) {
 		bss_conf = mt792x_vif_to_bss_conf(vif, i);
+		if (!bss_conf)
+			continue;
+
 		mconf = mt792x_vif_to_link(mvif, i);
 
 		mt76_connac_mcu_uni_add_dev(&dev->mphy, bss_conf, &mconf->mt76,
-- 
2.43.0


