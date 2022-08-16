Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CE8C00140
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Aug 2022 00:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y1TfFH3jtfX6Q9k1FmFE1fiosdTLINVaH0VtwjxFk3c=; b=EDMZNvnCfXCmgFU4UV7dB9j6w2
	ZeILvdsVR+VR4tHMnioRheBKpp68gZ5rePAFcLP94MWHMZGXa8aeO50ruX7ZEX/4Pqr8VtJgl6jFy
	vWKXs8pFiAhUBmy0BVNg9Uk1xap3cdJJwoXl0q3uT5PYuzWviEfR3TpFFy/zjXuuGG/M+JnPq3HoK
	MsssiFXFX1aW6yzpoaUMfMw7VQMNvjRLbKszY09u0AYKK2oyLgBQZECEFhkBQ2GNRuqKJ52mM7b2L
	aH4oOo5FHpxCfzFUyTVjV+QP2OlmRAxW++N8EUZ/H3DAnWNBt+dvSH0pgobh0BfYg0VebAvbINI+c
	Femt/p7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNkr1-008IvL-Ip; Tue, 16 Aug 2022 00:54:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNkqx-008Ira-Qo
	for linux-mediatek@lists.infradead.org; Tue, 16 Aug 2022 00:54:45 +0000
X-UUID: 9048cf5741984318816103b8f6551d5d-20220815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=y1TfFH3jtfX6Q9k1FmFE1fiosdTLINVaH0VtwjxFk3c=;
	b=SnfRBDybXfJmOkqG3nJ2il8hVCQInDpQ8wY1hEO102Pold31tgSjMs72epdtJh+JessAqRpEfqazREdOE6LKRScjR5mZBf//UEwfMYI8iIZXXSiEUNGXR6JJMngdeRoNttnnfnG5Ia4Ml2TkwLs5jHQBRvZXxQ0t4Y0KlLceJOc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:aa53b690-14e0-40d4-aeff-9984cd3c21fe,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_H
	am,ACTION:release,TS:5
X-CID-META: VersionHash:3d8acc9,CLOUDID:3140bf9c-da39-4e3b-a854-56c7d2111b46,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 9048cf5741984318816103b8f6551d5d-20220815
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <sean.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1092247073; Mon, 15 Aug 2022 17:54:38 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Tue, 16 Aug 2022 08:04:02 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 16 Aug 2022 08:04:02 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
	<YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>,
	<jenhao.yang@mediatek.com>, <robin.chiu@mediatek.com>,
	<Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
	<ted.huang@mediatek.com>, <Stella.Chang@mediatek.com>,
	<Tom.Chou@mediatek.com>, <steve.lee@mediatek.com>, <jsiuda@google.com>,
	<frankgor@google.com>, <kuabhs@google.com>, <druth@google.com>,
	<abhishekpandit@google.com>, <shawnku@google.com>,
	<linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 3/9] wifi: mt76: connac: rely on mt76_connac_mcu_uni_set_chctx
Date: Tue, 16 Aug 2022 08:03:41 +0800
Message-ID: <40d95ad10621c248a9129ef73158adfa9ffd6d17.1660606893.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1660606893.git.objelf@gmail.com>
References: <cover.1660606893.git.objelf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_175443_939901_12D6A099 
X-CRM114-Status: GOOD (  10.84  )
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

Reuse mt76_connac_mcu_uni_set_chctx to avoid the dupicated code.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 73 +------------------
 1 file changed, 1 insertion(+), 72 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 3d5c70765d4f..3e473a409790 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -1401,7 +1401,6 @@ int mt76_connac_mcu_uni_add_bss(struct mt76_phy *phy,
 {
 	struct mt76_vif *mvif = (struct mt76_vif *)vif->drv_priv;
 	struct cfg80211_chan_def *chandef = &phy->chandef;
-	int freq1 = chandef->center_freq1, freq2 = chandef->center_freq2;
 	enum nl80211_band band = chandef->chan->band;
 	struct mt76_dev *mdev = phy->dev;
 	struct {
@@ -1432,43 +1431,6 @@ int mt76_connac_mcu_uni_add_bss(struct mt76_phy *phy,
 			.qos = vif->bss_conf.qos,
 		},
 	};
-	struct {
-		struct {
-			u8 bss_idx;
-			u8 pad[3];
-		} __packed hdr;
-		struct rlm_tlv {
-			__le16 tag;
-			__le16 len;
-			u8 control_channel;
-			u8 center_chan;
-			u8 center_chan2;
-			u8 bw;
-			u8 tx_streams;
-			u8 rx_streams;
-			u8 short_st;
-			u8 ht_op_info;
-			u8 sco;
-			u8 band;
-			u8 pad[2];
-		} __packed rlm;
-	} __packed rlm_req = {
-		.hdr = {
-			.bss_idx = mvif->idx,
-		},
-		.rlm = {
-			.tag = cpu_to_le16(UNI_BSS_INFO_RLM),
-			.len = cpu_to_le16(sizeof(struct rlm_tlv)),
-			.control_channel = chandef->chan->hw_value,
-			.center_chan = ieee80211_frequency_to_channel(freq1),
-			.center_chan2 = ieee80211_frequency_to_channel(freq2),
-			.tx_streams = hweight8(phy->antenna_mask),
-			.ht_op_info = 4, /* set HT 40M allowed */
-			.rx_streams = phy->chainmask,
-			.short_st = true,
-			.band = band,
-		},
-	};
 	int err, conn_type;
 	u8 idx, basic_phy;
 
@@ -1555,40 +1517,7 @@ int mt76_connac_mcu_uni_add_bss(struct mt76_phy *phy,
 			return err;
 	}
 
-	switch (chandef->width) {
-	case NL80211_CHAN_WIDTH_40:
-		rlm_req.rlm.bw = CMD_CBW_40MHZ;
-		break;
-	case NL80211_CHAN_WIDTH_80:
-		rlm_req.rlm.bw = CMD_CBW_80MHZ;
-		break;
-	case NL80211_CHAN_WIDTH_80P80:
-		rlm_req.rlm.bw = CMD_CBW_8080MHZ;
-		break;
-	case NL80211_CHAN_WIDTH_160:
-		rlm_req.rlm.bw = CMD_CBW_160MHZ;
-		break;
-	case NL80211_CHAN_WIDTH_5:
-		rlm_req.rlm.bw = CMD_CBW_5MHZ;
-		break;
-	case NL80211_CHAN_WIDTH_10:
-		rlm_req.rlm.bw = CMD_CBW_10MHZ;
-		break;
-	case NL80211_CHAN_WIDTH_20_NOHT:
-	case NL80211_CHAN_WIDTH_20:
-	default:
-		rlm_req.rlm.bw = CMD_CBW_20MHZ;
-		rlm_req.rlm.ht_op_info = 0;
-		break;
-	}
-
-	if (rlm_req.rlm.control_channel < rlm_req.rlm.center_chan)
-		rlm_req.rlm.sco = 1; /* SCA */
-	else if (rlm_req.rlm.control_channel > rlm_req.rlm.center_chan)
-		rlm_req.rlm.sco = 3; /* SCB */
-
-	return mt76_mcu_send_msg(mdev, MCU_UNI_CMD(BSS_INFO_UPDATE), &rlm_req,
-				 sizeof(rlm_req), true);
+	return mt76_connac_mcu_uni_set_chctx(phy, mvif, NULL);
 }
 EXPORT_SYMBOL_GPL(mt76_connac_mcu_uni_add_bss);
 
-- 
2.25.1


