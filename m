Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F45BC04FDF
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Aug 2023 14:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Gm3jRkI5Tyulat+xb+vBzoM4ttkjEMWLiEXnAQ5r8Y=; b=pa+cElmn6jB7qpxoeOkUXYI4B6
	7+MHSTylM+AhQDh5eRyonUYHoVGtCpb1IPi5j8X8Z9VGhztLMckM6dabFu3/DTwgd2MwtAj9A1taT
	QhFiHUimpRzNTIZ+hjzPuHB+tx+igkJmZsf37JIzIu0wDhzQD/g+/MYrFB4uP9BXnTQERokmQCSGp
	vQ/tKQ9mMhplQo251XptVbWEVatCrR+JWsnxTcFL6dPXdSHBfRUHABNhR6VeGMPUP0S+T9egDtI24
	tKwJas5fzdSdLUXx01uOGhCbjH8CHRODCroSFVfOn3b7KF38jOJO+ad7l2XgXiZKshTPOfDpCRpZC
	XL5p6G3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQqRr-002be0-1y;
	Tue, 01 Aug 2023 14:34:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQqRl-002bYR-2Z
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Aug 2023 14:34:04 +0000
X-UUID: 70f86c96307811ee83ed1395ce914268-20230801
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=5Gm3jRkI5Tyulat+xb+vBzoM4ttkjEMWLiEXnAQ5r8Y=;
	b=n5Mqhi5tBRS4dHfSV1JrAs2coNYTmwRopZUNje8ns8y9T+CiejyYVGpNEOqdS3FPKGixzEMSx2cmgCXftxUN78bHfC1WeayTKvAndEEhBunNwqpoKobsUk/4yQNGBgg0jP4bhZ2KXXHYC+bdHWrrIFAb0aeKBom0RzpEt5JEFHg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:6f15c0cd-9987-42db-bb91-8c3b15d65f08,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.30,REQID:6f15c0cd-9987-42db-bb91-8c3b15d65f08,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:1fcc6f8,CLOUDID:2ffbc5a0-0933-4333-8d4f-6c3c53ebd55b,B
	ulkID:2308012233551577E9YR,BulkQuantity:0,Recheck:0,SF:17|19|48|38|29|28,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_ULN,TF_CID_SPAM_SNR,
	TF_CID_SPAM_SDM,TF_CID_SPAM_ASC
X-UUID: 70f86c96307811ee83ed1395ce914268-20230801
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 915446612; Tue, 01 Aug 2023 07:33:54 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 1 Aug 2023 22:33:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 1 Aug 2023 22:33:51 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>, linux-wireless
	<linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH 5/8] wifi: mt76: connac: add eht support for tx power
Date: Tue, 1 Aug 2023 22:30:29 +0800
Message-ID: <850be4060d309c6a632c98d22197a4306482ee96.1690863143.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1690863143.git.deren.wu@mediatek.com>
References: <cover.1690863143.git.deren.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_073401_866442_D51BD368 
X-CRM114-Status: GOOD (  16.43  )
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

Add eht field in struct mt76_power_limits for 802.11be power config.
The function stack size would be too big by eht adding in structure,
we also refactor mt76_connac_mcu_rate_txpower_band() to take dynamic
allocated memory instead.

This is a preliminary patch to support mt7925 driver.

Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76.h     |  1 +
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 26 ++++++++++++-------
 2 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 878087257ea7..281f7f8d5266 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -966,6 +966,7 @@ struct mt76_power_limits {
 	s8 ofdm[8];
 	s8 mcs[4][10];
 	s8 ru[7][12];
+	s8 eht[16][16];
 };
 
 struct mt76_ethtool_worker_info {
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index c0f129dd8aef..32512066e3aa 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -2177,11 +2177,15 @@ mt76_connac_mcu_rate_txpower_band(struct mt76_phy *phy,
 		209, 211, 213, 215, 217, 219, 221,
 		225, 227, 229, 233
 	};
-	int i, n_chan, batch_size, idx = 0, tx_power, last_ch;
+	int i, n_chan, batch_size, idx = 0, tx_power, last_ch, err = 0;
 	struct mt76_connac_sku_tlv sku_tlbv;
-	struct mt76_power_limits limits;
+	struct mt76_power_limits *limits;
 	const u8 *ch_list;
 
+	limits = devm_kmalloc(dev->dev, sizeof(*limits), GFP_KERNEL);
+	if (!limits)
+		return -ENOMEM;
+
 	sku_len = is_mt7921(dev) ? sizeof(sku_tlbv) : sizeof(sku_tlbv) - 92;
 	tx_power = 2 * phy->hw->conf.power_level;
 	if (!tx_power)
@@ -2208,14 +2212,16 @@ mt76_connac_mcu_rate_txpower_band(struct mt76_phy *phy,
 
 	for (i = 0; i < batch_size; i++) {
 		struct mt76_connac_tx_power_limit_tlv tx_power_tlv = {};
-		int j, err, msg_len, num_ch;
+		int j, msg_len, num_ch;
 		struct sk_buff *skb;
 
 		num_ch = i == batch_size - 1 ? n_chan % batch_len : batch_len;
 		msg_len = sizeof(tx_power_tlv) + num_ch * sizeof(sku_tlbv);
 		skb = mt76_mcu_msg_alloc(dev, NULL, msg_len);
-		if (!skb)
-			return -ENOMEM;
+		if (!skb) {
+			err = -ENOMEM;
+			goto out;
+		}
 
 		skb_reserve(skb, sizeof(tx_power_tlv));
 
@@ -2246,14 +2252,14 @@ mt76_connac_mcu_rate_txpower_band(struct mt76_phy *phy,
 							     tx_power);
 			sar_power = mt76_get_sar_power(phy, &chan, reg_power);
 
-			mt76_get_rate_power_limits(phy, &chan, &limits,
+			mt76_get_rate_power_limits(phy, &chan, limits,
 						   sar_power);
 
 			tx_power_tlv.last_msg = ch_list[idx] == last_ch;
 			sku_tlbv.channel = ch_list[idx];
 
 			mt76_connac_mcu_build_sku(dev, sku_tlbv.pwr_limit,
-						  &limits, band);
+						  limits, band);
 			skb_put_data(skb, &sku_tlbv, sku_len);
 		}
 		__skb_push(skb, sizeof(tx_power_tlv));
@@ -2263,10 +2269,12 @@ mt76_connac_mcu_rate_txpower_band(struct mt76_phy *phy,
 					    MCU_CE_CMD(SET_RATE_TX_POWER),
 					    false);
 		if (err < 0)
-			return err;
+			goto out;
 	}
 
-	return 0;
+out:
+	devm_kfree(dev->dev, limits);
+	return err;
 }
 
 int mt76_connac_mcu_set_rate_txpower(struct mt76_phy *phy)
-- 
2.18.0


