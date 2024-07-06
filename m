Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C15EC2BD09
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jul 2024 08:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AtLrHZs5XXJ5T1iBD9wtN1TtAgoimSM4Q0D5cGIf2QM=; b=Z3Ua3SLd9u5+DCgvWNdgU9zBAo
	lURkhvqW1PMXRlRO/Iiiv3Xk+7PsQI40Kip45BDp8aF4643CH4gcmegHFa2vL26x2fJ8JLdiUXAxr
	vM5ZdDqupU5ktguH9zuaZMTFfqbhCRl5kop36d/FTIAY6WL3ocvSLkeGb1pYTzaH2SwjJPhePYcbQ
	udtAH6ibHOZ3vQp1J7JtjAK2J8GyPncO/lyF4IB0OnEOV2w3yidI3T0BBFD8knddUa9jAA0AxrOHB
	K2hyo6KaLI7gnW/4cXeWj6IsIva+a/pLUovaIYkdKHQtXBuU78pynkXd/G5xguXuQcu3F+IlnzYXO
	s1qL2xyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0mn-0000000HXug-31n9;
	Sat, 06 Jul 2024 08:28:49 +0000
Received: from mail-oa1-f46.google.com ([209.85.160.46])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0mj-0000000HXrj-1O1M
	for linux-mediatek@lists.infradead.org;
	Sat, 06 Jul 2024 08:28:46 +0000
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-254925e6472so364167fac.0
        for <linux-mediatek@lists.infradead.org>; Sat, 06 Jul 2024 01:28:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720254524; x=1720859324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AtLrHZs5XXJ5T1iBD9wtN1TtAgoimSM4Q0D5cGIf2QM=;
        b=kRaD4QPmztIhX4T4IVDV8s24XIe21hOxlCykiLnW12HK0cEtM1LARQbJgbesD85ybO
         LBHCOf1YVZAuBjpgA0JILSZzBPoHZLzXZOj0VHcX9BghGuZOrwUWnYnMsZmA1pkbEY7x
         RlUG/fwaB+XLnnZbvTVbtF46f/MN3EsvUpTFV5LVydAZrpsA1JPdQb0MqBuvf52bhIc0
         nsa2O/OCidHP4eQxkHAsgYFmsb4/8WrLGJWU14lykAzUY5orV5dH/mV6MApR7vITnuxk
         dOHbGaifyFvx2kE8VTr6Tf8kvMqA2RIb65EFkqfHUECZdnuhH2q/ulSOzau+UD7ijBfW
         dYvg==
X-Forwarded-Encrypted: i=1; AJvYcCWDpNKX7fL/6so+ticKnKI/MSPxeIHPiRt0fcKNhI4yjjgKjzXeCRzQCP3JrUp2t8XISXDJBZDOq8MNm9FIWkp3lTn4LOXfh1qKS2Lnt+b4XYT5
X-Gm-Message-State: AOJu0Yz6/2NIrLPMkk92peJijUaCvpGtpbK9iptE5dI60cYDQ33Sj8Sc
	F4ogSS//CqWdhTp5ApZDfh4vStXcACrYd5Uob1dqpXYpjVBruHlX
X-Google-Smtp-Source: AGHT+IEXHNQhlSzAY8Tlzy3RmC8HaFoPtI9qwVs2TRhuyiPg31fh7q5+Usbvf2qGax22+0W9aOY6zw==
X-Received: by 2002:a05:6871:24d9:b0:254:affe:5a08 with SMTP id 586e51a60fabf-25e2ba1b287mr6406885fac.2.1720254524275;
        Sat, 06 Jul 2024 01:28:44 -0700 (PDT)
Received: from sean-ThinkPad-T450s.attlocal.net ([2600:1702:5083:7610:1e13:57ab:ecc5:1fd4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25e71070ba1sm10744fac.34.2024.07.06.01.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 01:28:43 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 13/37] wifi: mt76: mt7925: add link handling to mt7925_change_chanctx
Date: Sat,  6 Jul 2024 01:27:53 -0700
Message-Id: <49f2a2f8230979a4e123bc1dab70a8496875cc6c.1720248331.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720248331.git.sean.wang@kernel.org>
References: <cover.1720248331.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_012845_405726_C513DE44 
X-CRM114-Status: GOOD (  11.70  )
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

add link handling to mt7925_change_chanctx

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 22 +++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index a2cf05fdfc3a..957e6bcaf9c1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1571,13 +1571,15 @@ mt7925_change_chanctx(struct ieee80211_hw *hw,
 {
 	struct mt792x_chanctx *mctx = (struct mt792x_chanctx *)ctx->drv_priv;
 	struct mt792x_phy *phy = mt792x_hw_phy(hw);
+	struct mt792x_bss_conf *mconf;
 	struct ieee80211_vif *vif;
 	struct mt792x_vif *mvif;
 
 	if (!mctx->bss_conf)
 		return;
 
-	mvif = container_of(mctx->bss_conf, struct mt792x_vif, bss_conf);
+	mconf = mctx->bss_conf;
+	mvif = mconf->vif;
 	vif = container_of((void *)mvif, struct ieee80211_vif, drv_priv);
 
 	mt792x_mutex_acquire(phy->dev);
@@ -1585,8 +1587,24 @@ mt7925_change_chanctx(struct ieee80211_hw *hw,
 		mt7925_mcu_set_sniffer(mvif->phy->dev, vif, true);
 		mt7925_mcu_config_sniffer(mvif, ctx);
 	} else {
-		mt7925_mcu_set_chctx(mvif->phy->mt76, &mvif->bss_conf.mt76, ctx);
+		if (ieee80211_vif_is_mld(vif)) {
+			unsigned long valid = mvif->valid_links;
+			u8 i;
+
+			for_each_set_bit(i, &valid, IEEE80211_MLD_MAX_NUM_LINKS) {
+				mconf = mt792x_vif_to_link(mvif, i);
+				if (mconf && mconf->mt76.ctx == ctx)
+					break;
+			}
+
+		} else {
+			mconf = &mvif->bss_conf;
+		}
+
+		if (mconf)
+			mt7925_mcu_set_chctx(mvif->phy->mt76, &mconf->mt76, ctx);
 	}
+
 	mt792x_mutex_release(phy->dev);
 }
 
-- 
2.25.1


