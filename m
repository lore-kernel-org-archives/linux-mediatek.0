Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7280AC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 11:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4bu6YTo+tt5u5v9xEYp7vBjjQ9u13lLt2k1kwKDl2yY=; b=Vms+3PDg7A/ykognF78Sc/TNc9
	KBHal16NoGBDS7lsHIo+M/XTVMTf8PKadTzkQ7Zk+68vy45M2yMT67n5MOYDV+ZTd8pmCrQst/pWl
	qV0E4BjLnshWdzVAe4q+LfhOieQ3z/VJ2d73N4nd7Ho9TC1FaJOHPxyvBzlicmVjPRY+zj1N87dEU
	0veroGFHrbXezhEtx8z2IETL0q9sfnxdlhgddyzLKP39p9k+QOBwcgHKMdbVLF8BuWWdBM3FmunCj
	EAp+UtLOtC6s2+c39mew8DqqXw20ygSH+MPNTfUCj3Iu4eKVjhlZ3QiJkyTolD1SpjVmsy6E7ITPw
	yt88P9WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68Yg-00ELIQ-4T; Fri, 16 Dec 2022 11:07:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68Yd-00ELFy-BY
	for linux-mediatek@lists.infradead.org; Fri, 16 Dec 2022 11:07:17 +0000
X-UUID: db4e3c60dbb14a038e0e1f1ee9b9c7ab-20221216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=4bu6YTo+tt5u5v9xEYp7vBjjQ9u13lLt2k1kwKDl2yY=;
	b=f0YhY5Fx2Bjf4NFnRUvhU+OuOIUCl8RzxYVuo+ZCftPrGbVlIlcmycvlLqE+R3R3yeTihcPnUogNCyWnuIyYazK4D6w/7bVLD9KHV1yRvjEtLwipVnVc6QJzMf9C0oudfCCgcgsEJiaS2O7Ca7T4qHJEbogNIIJOqtLiswAsE7E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:11d8fb46-0b4f-4599-bb0b-29d4aba11878,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:5d338e89-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: db4e3c60dbb14a038e0e1f1ee9b9c7ab-20221216
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1395484710; Fri, 16 Dec 2022 04:07:04 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 16 Dec 2022 19:06:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 16 Dec 2022 19:06:27 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
	YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, "Eric-SY
 Chang" <Eric-SY.Chang@mediatek.com>, Deren Wu <Deren.Wu@mediatek.com>, KM Lin
	<km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
	<ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Stella Chang
	<Stella.Chang@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, "Ryder
 Lee" <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
	linux-wireless <linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7921: fix channel switch fail in monitor mode
Date: Fri, 16 Dec 2022 19:04:38 +0800
Message-ID: <4de0968684f385c7b7f03ae43b17160ec92aebda.1671172366.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_030715_431244_64A67DDF 
X-CRM114-Status: GOOD (  14.22  )
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

When the chanctx enabled, IEEE80211_CONF_CHANGE_CHANNEL in .config()
would not be called anymore. mt76 cannot control RF channel for monitor.
Add monitor type set-channel flow in .change_chanctx().

Fixes: 41ac53c899bd ("wifi: mt76: mt7921: introduce chanctx support")
Reviewed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7921/main.c  |  5 +-
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 68 +++++++++++++++++++
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  2 +
 3 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 76ac5069638f..ef1ab818e69c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -1711,7 +1711,10 @@ static void mt7921_ctx_iter(void *priv, u8 *mac,
 	if (ctx != mvif->ctx)
 		return;
 
-	mt76_connac_mcu_uni_set_chctx(mvif->phy->mt76, &mvif->mt76, ctx);
+	if (vif->type & NL80211_IFTYPE_MONITOR)
+		mt7921_mcu_config_sniffer(mvif, ctx);
+	else
+		mt76_connac_mcu_uni_set_chctx(mvif->phy->mt76, &mvif->mt76, ctx);
 }
 
 static void
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 8930b5a4467c..c4ca6905f050 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -1093,6 +1093,74 @@ int mt7921_mcu_set_sniffer(struct mt7921_dev *dev, struct ieee80211_vif *vif,
 				 true);
 }
 
+int mt7921_mcu_config_sniffer(struct mt7921_vif *vif,
+			      struct ieee80211_chanctx_conf *ctx)
+{
+	struct cfg80211_chan_def *chandef = &ctx->def;
+	int freq1 = chandef->center_freq1, freq2 = chandef->center_freq2;
+	const u8 ch_band[] = {
+		[NL80211_BAND_2GHZ] = 1,
+		[NL80211_BAND_5GHZ] = 2,
+		[NL80211_BAND_6GHZ] = 3,
+	};
+	const u8 ch_width[] = {
+		[NL80211_CHAN_WIDTH_20_NOHT] = 0,
+		[NL80211_CHAN_WIDTH_20] = 0,
+		[NL80211_CHAN_WIDTH_40] = 0,
+		[NL80211_CHAN_WIDTH_80] = 1,
+		[NL80211_CHAN_WIDTH_160] = 2,
+		[NL80211_CHAN_WIDTH_80P80] = 3,
+		[NL80211_CHAN_WIDTH_5] = 4,
+		[NL80211_CHAN_WIDTH_10] = 5,
+		[NL80211_CHAN_WIDTH_320] = 6,
+	};
+	struct {
+		struct {
+			u8 band_idx;
+			u8 pad[3];
+		} __packed hdr;
+		struct config_tlv {
+			__le16 tag;
+			__le16 len;
+			u16 aid;
+			u8 ch_band;
+			u8 bw;
+			u8 control_ch;
+			u8 sco;
+			u8 center_ch;
+			u8 center_ch2;
+			u8 drop_err;
+			u8 pad[3];
+		} __packed tlv;
+	} __packed req = {
+		.hdr = {
+			.band_idx = vif->mt76.band_idx,
+		},
+		.tlv = {
+			.tag = cpu_to_le16(1),
+			.len = cpu_to_le16(sizeof(req.tlv)),
+			.control_ch = chandef->chan->hw_value,
+			.center_ch = ieee80211_frequency_to_channel(freq1),
+			.drop_err = 1,
+		},
+	};
+	if (chandef->chan->band < ARRAY_SIZE(ch_band))
+		req.tlv.ch_band = ch_band[chandef->chan->band];
+	if (chandef->width < ARRAY_SIZE(ch_width))
+		req.tlv.bw = ch_width[chandef->width];
+
+	if (freq2)
+		req.tlv.center_ch2 = ieee80211_frequency_to_channel(freq2);
+
+	if (req.tlv.control_ch < req.tlv.center_ch)
+		req.tlv.sco = 1; /* SCA */
+	else if (req.tlv.control_ch > req.tlv.center_ch)
+		req.tlv.sco = 3; /* SCB */
+
+	return mt76_mcu_send_msg(vif->phy->mt76->dev, MCU_UNI_CMD(SNIFFER),
+				 &req, sizeof(req), true);
+}
+
 int
 mt7921_mcu_uni_add_beacon_offload(struct mt7921_dev *dev,
 				  struct ieee80211_hw *hw,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index efff4d43d796..edfaeb7ce3d6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -529,6 +529,8 @@ void mt7921_set_ipv6_ns_work(struct work_struct *work);
 
 int mt7921_mcu_set_sniffer(struct mt7921_dev *dev, struct ieee80211_vif *vif,
 			   bool enable);
+int mt7921_mcu_config_sniffer(struct mt7921_vif *vif,
+			      struct ieee80211_chanctx_conf *ctx);
 
 int mt7921_usb_sdio_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 				   enum mt76_txq_id qid, struct mt76_wcid *wcid,
-- 
2.18.0


