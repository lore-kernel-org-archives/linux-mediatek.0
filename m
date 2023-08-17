Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D58C2FC18
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Aug 2023 08:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=35RsuwsRgKIMIZu+oVUCnueoPyLNnhvnHPtjk0veQVg=; b=EmvrXg0p8jnhock11cLksaIVie
	rO0QCgCM//EcuWi9VmLe9dlQA35jNr5bHh5jcTbuWrC2sU2HmkjiRpEG5/HYiT84NX4Mtkr6GB0Es
	JFtQvBqw1SA8Mu/n5VGHY7hYsddg3oLCzMPkSAWTl1GSOxDOlB861q3DUeSAZE84i0u1Lkyv9Q/34
	G+0eyRYBl7Tt7cYObAgPiPT2LptxSR5vx7QyyrB6o/91deJ7J87Qb/RRZfHvAvD3t51IO7HeEm2u8
	YsUiSKEKnSUCEJGHDkR3KV2HAhkJkvU3RXERq3/gj+4drP5KozKRd/syh824NokXgwnxY8WmdX5dm
	tCOrsDPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWXxd-005mLA-04;
	Thu, 17 Aug 2023 08:02:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWXxX-005mH9-04
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Aug 2023 08:02:25 +0000
X-UUID: 6084f6503cd411ee83ed1395ce914268-20230817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=35RsuwsRgKIMIZu+oVUCnueoPyLNnhvnHPtjk0veQVg=;
	b=o30remYyR5+awzWoDWxFjjqOAIK9JSnKmwIS6YJ6/dD7zhl5cJe/bnGmN/UR0NBc08zXXMvLU3n5EOVtt2k84Dry4mayWp8j4NeO3l7EBfm5m5A+PqlWx6rJlDlqU6aikh3NQA5wvuEeodne7B6t2/Vrue6trtlnWBBfhTVRT44=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:5989c145-01dc-4930-a1ff-2a7cd426cea8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-INFO: VERSION:1.1.31,REQID:5989c145-01dc-4930-a1ff-2a7cd426cea8,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:100
X-CID-META: VersionHash:0ad78a4,CLOUDID:424ddf12-4929-4845-9571-38c601e9c3c9,B
	ulkID:230817160217VACVTKNZ,BulkQuantity:0,Recheck:0,SF:29|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,TF_CID_SPAM_FAS,
	TF_CID_SPAM_FSD,TF_CID_SPAM_ULN
X-UUID: 6084f6503cd411ee83ed1395ce914268-20230817
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1152039152; Thu, 17 Aug 2023 01:02:14 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 17 Aug 2023 16:02:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 17 Aug 2023 16:02:12 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Jen-Hao Cheng
	<jen-hao.cheng@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 9/9] wifi: mt76: mt7996: support per-band LED control
Date: Thu, 17 Aug 2023 16:01:54 +0800
Message-ID: <20230817080154.16475-9-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230817080154.16475-1-shayne.chen@mediatek.com>
References: <20230817080154.16475-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_010223_064032_5FB395DE 
X-CRM114-Status: GOOD (  12.97  )
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

From: Jen-Hao Cheng <jen-hao.cheng@mediatek.com>

Extend settings of LED registers to support per-band configuration.

Signed-off-by: Jen-Hao Cheng <jen-hao.cheng@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7996/init.c  | 34 ++++++++++++-------
 .../net/wireless/mediatek/mt76/mt7996/regs.h  |  1 +
 2 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index de090416c19d..f16f738e30db 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -53,23 +53,31 @@ static void mt7996_led_set_config(struct led_classdev *led_cdev,
 	dev = container_of(mphy->dev, struct mt7996_dev, mt76);
 
 	/* select TX blink mode, 2: only data frames */
-	mt76_rmw_field(dev, MT_TMAC_TCR0(0), MT_TMAC_TCR0_TX_BLINK, 2);
+	mt76_rmw_field(dev, MT_TMAC_TCR0(mphy->band_idx), MT_TMAC_TCR0_TX_BLINK, 2);
 
 	/* enable LED */
-	mt76_wr(dev, MT_LED_EN(0), 1);
+	mt76_wr(dev, MT_LED_EN(mphy->band_idx), 1);
 
 	/* set LED Tx blink on/off time */
 	val = FIELD_PREP(MT_LED_TX_BLINK_ON_MASK, delay_on) |
 	      FIELD_PREP(MT_LED_TX_BLINK_OFF_MASK, delay_off);
-	mt76_wr(dev, MT_LED_TX_BLINK(0), val);
+	mt76_wr(dev, MT_LED_TX_BLINK(mphy->band_idx), val);
+
+	/* turn LED off */
+	if (delay_off == 0xff && delay_on == 0x0) {
+		val = MT_LED_CTRL_POLARITY | MT_LED_CTRL_KICK;
+	} else {
+		/* control LED */
+		val = MT_LED_CTRL_BLINK_MODE | MT_LED_CTRL_KICK;
+		if (mphy->band_idx == MT_BAND1)
+			val |= MT_LED_CTRL_BLINK_BAND_SEL;
+	}
 
-	/* control LED */
-	val = MT_LED_CTRL_BLINK_MODE | MT_LED_CTRL_KICK;
 	if (mphy->leds.al)
 		val |= MT_LED_CTRL_POLARITY;
 
-	mt76_wr(dev, MT_LED_CTRL(0), val);
-	mt76_clear(dev, MT_LED_CTRL(0), MT_LED_CTRL_KICK);
+	mt76_wr(dev, MT_LED_CTRL(mphy->band_idx), val);
+	mt76_clear(dev, MT_LED_CTRL(mphy->band_idx), MT_LED_CTRL_KICK);
 }
 
 static int mt7996_led_set_blink(struct led_classdev *led_cdev,
@@ -222,6 +230,12 @@ mt7996_init_wiphy(struct ieee80211_hw *hw)
 		ieee80211_hw_set(hw, SUPPORTS_VHT_EXT_NSS_BW);
 	}
 
+	/* init led callbacks */
+	if (IS_ENABLED(CONFIG_MT76_LEDS)) {
+		phy->mt76->leds.cdev.brightness_set = mt7996_led_set_brightness;
+		phy->mt76->leds.cdev.blink_set = mt7996_led_set_blink;
+	}
+
 	mt76_set_stream_caps(phy->mt76, true);
 	mt7996_set_stream_vht_txbf_caps(phy);
 	mt7996_set_stream_he_eht_caps(phy);
@@ -870,12 +884,6 @@ int mt7996_register_device(struct mt7996_dev *dev)
 
 	mt7996_init_wiphy(hw);
 
-	/* init led callbacks */
-	if (IS_ENABLED(CONFIG_MT76_LEDS)) {
-		dev->mphy.leds.cdev.brightness_set = mt7996_led_set_brightness;
-		dev->mphy.leds.cdev.blink_set = mt7996_led_set_blink;
-	}
-
 	ret = mt76_register_device(&dev->mt76, true, mt76_rates,
 				   ARRAY_SIZE(mt76_rates));
 	if (ret)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/regs.h b/drivers/net/wireless/mediatek/mt76/mt7996/regs.h
index 97beab924517..57022906216c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/regs.h
@@ -509,6 +509,7 @@ enum base_rev {
 
 #define MT_LED_CTRL(_n)				MT_LED_PHYS(0x00 + ((_n) * 4))
 #define MT_LED_CTRL_KICK			BIT(7)
+#define MT_LED_CTRL_BLINK_BAND_SEL		BIT(4)
 #define MT_LED_CTRL_BLINK_MODE			BIT(2)
 #define MT_LED_CTRL_POLARITY			BIT(1)
 
-- 
2.39.2


