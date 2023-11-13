Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11EDCC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Nov 2023 07:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uyG05mE6RnhLnMn3cge95AIPXGfaD4SF7Jbusk7F+ek=; b=tkUPlEAIjjYTsEhQHCSb7P7ZdX
	66df3oAzj/y4TKYpQutOBjaJiXRS7sO9L9p25SuLGO6bIyjhIMpL4g6KFvLJJ5q4aiP7kZO6YAtm3
	6z9DHHXpEKkjmRTxO4Xja8yw5K1ywZMqy7UZPGQBbZ2rNhyGAWtTkTSBh0mmn3+4tXMwd/ypwheNX
	5ostJ/QmxSCom8B8+SSGdROWvy1nhSAtRUvvJ61tNpePTBXJGBhzXGzJsXhEgj+nbLNX2x5KT6fpS
	wULx4um7qRapnYJ9MMq7+5VCKZhhHO7Aobz3wgdEqx/u5GJcFWDtced1vpDyPh1MPDhXAJhT7cHTj
	Q0IUytjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2RMl-00DRH9-0C;
	Mon, 13 Nov 2023 07:28:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2RMi-00DRGj-0d
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Nov 2023 07:28:13 +0000
X-UUID: 318ebf4a81f611ee86758d4a7c00f3a0-20231113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=uyG05mE6RnhLnMn3cge95AIPXGfaD4SF7Jbusk7F+ek=;
	b=ZJZ9H16Ew/HP55YtkQHiCCbxuV/5DnglZnLZpBoi/AgEcn4YNfINplPztF8So7LQq2T3hlbeAXaDoXx6b/7SchTkdG8w29htL+SY+CW6FVKoHQZB58w1fPMzSPk0Ri9zhTJqYThbP3wYMn4Seas2iCPFWXLzVjRyW2geCG6s5iA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:2706d01c-b99e-4388-97af-5a99299823e6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:80819572-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 318ebf4a81f611ee86758d4a7c00f3a0-20231113
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 74945175; Mon, 13 Nov 2023 00:28:08 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 13 Nov 2023 15:07:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 13 Nov 2023 15:07:31 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, StanleyYP Wang
	<StanleyYP.Wang@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 6/8] wifi: mt76: mt7996: adjust interface num and wtbl size for mt7992
Date: Mon, 13 Nov 2023 15:06:17 +0800
Message-ID: <20231113070619.19964-7-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231113070619.19964-1-shayne.chen@mediatek.com>
References: <20231113070619.19964-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_232812_243535_072AC449 
X-CRM114-Status: GOOD (  11.42  )
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

From: StanleyYP Wang <StanleyYP.Wang@mediatek.com>

MT7992 chipsets support up to 32 interfaces (with maximum 19 per-band)
and 512 station entries.
This is a preliminary patch for mt7992 chipsets support.

Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c | 3 ++-
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h | 8 +++++---
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
index 9c3735bed50c..fc6a0c8efa42 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
@@ -112,7 +112,8 @@ static int mt7996_eeprom_parse_efuse_hw_cap(struct mt7996_dev *dev)
 		dev->wtbl_size_group = u32_get_bits(cap, WTBL_SIZE_GROUP);
 	}
 
-	if (dev->wtbl_size_group < 2 || dev->wtbl_size_group > 4)
+	if (dev->wtbl_size_group < 2 || dev->wtbl_size_group > 4 ||
+	    is_mt7992(&dev->mt76))
 		dev->wtbl_size_group = 2; /* set default */
 
 	return 0;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 5cdde28ce83f..bc73bcb47bf0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -13,6 +13,7 @@
 
 #define MT7996_MAX_INTERFACES		19	/* per-band */
 #define MT7996_MAX_WMM_SETS		4
+#define MT7996_WTBL_BMC_SIZE		(is_mt7992(&dev->mt76) ? 32 : 64)
 #define MT7996_WTBL_RESERVED		(mt7996_wtbl_size(dev) - 1)
 #define MT7996_WTBL_STA			(MT7996_WTBL_RESERVED - \
 					 mt7996_max_interface_num(dev))
@@ -512,13 +513,14 @@ int mt7996_mcu_wed_rro_reset_sessions(struct mt7996_dev *dev, u16 id);
 
 static inline u8 mt7996_max_interface_num(struct mt7996_dev *dev)
 {
-	return MT7996_MAX_INTERFACES * (1 + mt7996_band_valid(dev, MT_BAND1) +
-					mt7996_band_valid(dev, MT_BAND2));
+	return min(MT7996_MAX_INTERFACES * (1 + mt7996_band_valid(dev, MT_BAND1) +
+					    mt7996_band_valid(dev, MT_BAND2)),
+		   MT7996_WTBL_BMC_SIZE);
 }
 
 static inline u16 mt7996_wtbl_size(struct mt7996_dev *dev)
 {
-	return (dev->wtbl_size_group << 8) + 64;
+	return (dev->wtbl_size_group << 8) + MT7996_WTBL_BMC_SIZE;
 }
 
 void mt7996_dual_hif_set_irq_mask(struct mt7996_dev *dev, bool write_reg,
-- 
2.39.2


