Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AAA2C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 15:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oeGtZ9PAst3+jtVOB7fD8m6J5m3ZzOOccwMwscJjsZE=; b=hnrUTWUSq9Ss1dI8iAiYMNUI8m
	BONHHj5X7KwrkdSLtWBkPa4gACi74qi1+1abdl1xx5NzyhjJ4PLOa3uU9mFfUxpJ0T6Ekdlo9yVni
	S2EOMkAkbfkzgni3rreHOiv8zTHR8q38p8vPa0Bfj/uywyiPDbhR/fKGVN1JYvrdgBaIPJMLuXXNf
	7Lw+WxB76q9K0/Zo2lhGvEdzCiDEA6khuhDpCgH+h+I401LZ68f8rDmHidGUh4UfbNxx/jieH98+0
	kkT4VXD7AtFMESDqw0Kq8FBT35RrW2Yarrp/6pcKnb4yZDUpfJIyIKF+bQQLepjNpVF1vr/YC/1+g
	ay5spa3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeHjD-00A5ne-P8; Fri, 30 Sep 2022 15:15:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeHiO-00A5MO-Mi
	for linux-mediatek@lists.infradead.org; Fri, 30 Sep 2022 15:14:16 +0000
X-UUID: e3c9577aeb984a6191deccbf2bd2b6cb-20220930
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=oeGtZ9PAst3+jtVOB7fD8m6J5m3ZzOOccwMwscJjsZE=;
	b=l2Qe/R8RoeVgeJOKQHm73CM40bmtMoEyO6lvT3M19KXtuY1rxpgMzEP6Yav4f2pFwQSCLlIC7OvHlEBn5MtrEkaiosDhgxQsXVBcGNkXDZrI1VZ9fOOtBAGL6O558J8AyfJKDKa2m3a9rqB3GptCBFvnhF6tyWvkx5u7087s9So=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:698f5429-b621-470c-826c-e3335b13a241,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:5ec49807-1cee-4c38-b21b-a45f9682fdc0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: e3c9577aeb984a6191deccbf2bd2b6cb-20220930
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 783065217; Fri, 30 Sep 2022 08:14:06 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 30 Sep 2022 23:13:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 30 Sep 2022 23:13:40 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 4/6] wifi: mt76: connac: introduce mt76_connac_spe_idx()
Date: Fri, 30 Sep 2022 23:13:13 +0800
Message-ID: <20220930151315.19012-4-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220930151315.19012-1-shayne.chen@mediatek.com>
References: <20220930151315.19012-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_081412_798029_99B1805B 
X-CRM114-Status: GOOD (  11.54  )
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

Add mt76_connac_spe_idx() for antenna mask to spatial extension
index conversion. This is used to support flexible control of
tx antenna.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac.h     | 11 +++++++++++
 drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c | 11 ++++++++---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h |  2 +-
 3 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
index 635192c878cb..0915eb579539 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
@@ -261,6 +261,17 @@ mt76_connac_txwi_to_txp(struct mt76_dev *dev, struct mt76_txwi_cache *t)
 	return (void *)(txwi + MT_TXD_SIZE);
 }
 
+static inline u8 mt76_connac_spe_idx(u8 antenna_mask)
+{
+	static const u8 ant_to_spe[] = {0, 0, 1, 0, 3, 2, 4, 0,
+					9, 8, 6, 10, 16, 12, 18, 0};
+
+	if (antenna_mask >= sizeof(ant_to_spe))
+		return 0;
+
+	return ant_to_spe[antenna_mask];
+}
+
 int mt76_connac_pm_wake(struct mt76_phy *phy, struct mt76_connac_pm *pm);
 void mt76_connac_power_save_sched(struct mt76_phy *phy,
 				  struct mt76_connac_pm *pm);
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
index 34ac3d81a510..8b7ec64abc95 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
@@ -417,9 +417,6 @@ mt76_connac2_mac_write_txwi_80211(struct mt76_dev *dev, __le32 *txwi,
 	if (ieee80211_is_beacon(fc)) {
 		txwi[3] &= ~cpu_to_le32(MT_TXD3_SW_POWER_MGMT);
 		txwi[3] |= cpu_to_le32(MT_TXD3_REM_TX_COUNT);
-		if (!is_mt7921(dev))
-			txwi[7] |= cpu_to_le32(FIELD_PREP(MT_TXD7_SPE_IDX,
-							  0x18));
 	}
 
 	if (info->flags & IEEE80211_TX_CTL_INJECTED) {
@@ -550,6 +547,14 @@ void mt76_connac2_mac_write_txwi(struct mt76_dev *dev, __le32 *txwi,
 		val |= FIELD_PREP(MT_TXD6_TX_RATE, rate);
 		txwi[6] |= cpu_to_le32(val);
 		txwi[3] |= cpu_to_le32(MT_TXD3_BA_DISABLE);
+
+		if (!is_mt7921(dev)) {
+			u8 spe_idx = mt76_connac_spe_idx(mphy->antenna_mask);
+
+			if (!spe_idx)
+				spe_idx = 24 + phy_idx;
+			txwi[7] |= cpu_to_le32(FIELD_PREP(MT_TXD7_SPE_IDX, spe_idx));
+		}
 	}
 }
 EXPORT_SYMBOL_GPL(mt76_connac2_mac_write_txwi);
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 718f427d8f6b..cf4ce3b1fc21 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -580,7 +580,7 @@ struct sta_rec_ra_fixed {
 
 	struct sta_phy phy;
 
-	u8 spe_en;
+	u8 spe_idx;
 	u8 short_preamble;
 	u8 is_5g;
 	u8 mmps_mode;
-- 
2.25.1


