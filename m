Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C808AC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 21:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ukrpjAtV5q41Z5KOBVuOWSW1ODCEyS4q5z+TXMdsO6k=; b=knFwYQQWW662cjAK0Mpi2A9OIJ
	URGvIAP/wnVjGg9pzVMTEOXejG8XVfOvjvhf3cGSuc0GBEEL8JbVXJGcNDhT60XUBVdm6SSpG+5CC
	mRU7mKMGSRQzjSGA75kFs0hCc7O+OJmgeiEbYg/YyVm85Tm3LCIiTQSlY7+SELCMgrKky2ctRBdR+
	Ghs+T+vRC/G24kcGC1Q3hBgXxpuGaNxpX2f7GOgXowuRUZgMq/VOTiCmNPRv/ZnZFTKmjpknm4GdH
	BDBVLB15+j542vFuzXloKj4CgGTaaOyhE+nxdbV97GH49D577dAeMeX8Br55bTuSvM/j6sBOiMRs1
	qO4PWZOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otFV1-00AZUn-LP; Thu, 10 Nov 2022 21:54:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otFUy-00AZTf-CA
	for linux-mediatek@lists.infradead.org; Thu, 10 Nov 2022 21:54:14 +0000
X-UUID: bec676558fac4b9ab246acdced64a33d-20221110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ukrpjAtV5q41Z5KOBVuOWSW1ODCEyS4q5z+TXMdsO6k=;
	b=LSQmGCGAOY2wxFEjSzWrEidAESF1tpFj+k8cdcL/tVu+Y5Ht4tY7XT1OJFtVJlT9kALiJT03LjYNn8xvvdYjct9ffCd2ccMVKNPlRUZS+3fn7X4lAGYW6VdZI5Z4MPiK2RdwcqlNAN6hv4fPyw44Tjgb/9hEUB8+/d+8RllU2oI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:dd620c81-be3e-43b0-aeb8-7b51a91885d1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:7b88375d-100c-4555-952b-a62c895efded,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: bec676558fac4b9ab246acdced64a33d-20221110
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <sean.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 304478577; Thu, 10 Nov 2022 14:54:06 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 11 Nov 2022 05:24:01 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 11 Nov 2022 05:24:01 +0800
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
	<linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Quan
 Zhou <quan.zhou@mediatek.com>, Deren Wu <deren.wu@mediatek.com>, Kaikai Hu
	<kaikai.hu@mediatek.com>
Subject: [PATCH v3 3/7] wifi: mt76: mt7921: add unified ROC cmd/event support
Date: Fri, 11 Nov 2022 05:23:45 +0800
Message-ID: <2ec5ef0995c23b02fdea46127d2ec44051c166ec.1668068326.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1668068326.git.objelf@gmail.com>
References: <cover.1668068326.git.objelf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_135412_452316_306AC042 
X-CRM114-Status: GOOD (  17.57  )
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

From: Quan Zhou <quan.zhou@mediatek.com>

Add unified ROC cmd/event which is only supported by the newer fw.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Co-developed-by: Kaikai Hu <kaikai.hu@mediatek.com>
Signed-off-by: Kaikai Hu <kaikai.hu@mediatek.com>
Signed-off-by: Quan Zhou <quan.zhou@mediatek.com>
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  10 +-
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 119 ++++++++++++++++++
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  19 +++
 3 files changed, 146 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index bc1c47daa81a..87c65d252d56 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -121,11 +121,13 @@ struct mt76_connac2_mcu_rxd {
 
 	u8 eid;
 	u8 seq;
-	u8 rsv[2];
-
+	u8 option;
+	u8 rsv;
 	u8 ext_eid;
 	u8 rsv1[2];
 	u8 s2d_index;
+
+	u8 tlv[0];
 };
 
 struct mt76_connac2_patch_hdr {
@@ -946,6 +948,9 @@ enum {
 	DEV_INFO_MAX_NUM
 };
 
+#define MCU_UNI_CMD_EVENT                       BIT(1)
+#define MCU_UNI_CMD_UNSOLICITED_EVENT           BIT(2)
+
 /* event table */
 enum {
 	MCU_EVENT_TARGET_ADDRESS_LEN = 0x01,
@@ -1152,6 +1157,7 @@ enum {
 	MCU_UNI_CMD_OFFLOAD = 0x06,
 	MCU_UNI_CMD_HIF_CTRL = 0x07,
 	MCU_UNI_CMD_SNIFFER = 0x24,
+	MCU_UNI_CMD_ROC = 0x27,
 };
 
 enum {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 67bf92969a7b..2b36c5f6eb40 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -302,6 +302,23 @@ mt7921_mcu_rx_unsolicited_event(struct mt7921_dev *dev, struct sk_buff *skb)
 	dev_kfree_skb(skb);
 }
 
+static void
+mt7921_mcu_uni_rx_unsolicited_event(struct mt7921_dev *dev,
+				    struct sk_buff *skb)
+{
+	struct mt76_connac2_mcu_rxd *rxd;
+
+	rxd = (struct mt76_connac2_mcu_rxd *)skb->data;
+
+	switch (rxd->eid) {
+	case MCU_UNI_EVENT_ROC:
+		break;
+	default:
+		break;
+	}
+	dev_kfree_skb(skb);
+}
+
 void mt7921_mcu_rx_event(struct mt7921_dev *dev, struct sk_buff *skb)
 {
 	struct mt76_connac2_mcu_rxd *rxd;
@@ -311,6 +328,11 @@ void mt7921_mcu_rx_event(struct mt7921_dev *dev, struct sk_buff *skb)
 
 	rxd = (struct mt76_connac2_mcu_rxd *)skb->data;
 
+	if (rxd->option & MCU_UNI_CMD_UNSOLICITED_EVENT) {
+		mt7921_mcu_uni_rx_unsolicited_event(dev, skb);
+		return;
+	}
+
 	if (rxd->eid == 0x6) {
 		mt76_mcu_rx_event(&dev->mt76, skb);
 		return;
@@ -636,6 +658,103 @@ int mt7921_mcu_set_tx(struct mt7921_dev *dev, struct ieee80211_vif *vif)
 				 &req_mu, sizeof(req_mu), false);
 }
 
+int mt7921_mcu_set_roc(struct mt7921_phy *phy, struct mt7921_vif *vif,
+		       struct ieee80211_channel *chan, int duration,
+		       enum mt7921_roc_req type, u8 token_id)
+{
+	int center_ch = ieee80211_frequency_to_channel(chan->center_freq);
+	struct mt7921_dev *dev = phy->dev;
+	struct {
+		struct {
+			u8 rsv[4];
+		} __packed hdr;
+		struct roc_acquire_tlv {
+			__le16 tag;
+			__le16 len;
+			u8 bss_idx;
+			u8 tokenid;
+			u8 control_channel;
+			u8 sco;
+			u8 band;
+			u8 bw;
+			u8 center_chan;
+			u8 center_chan2;
+			u8 bw_from_ap;
+			u8 center_chan_from_ap;
+			u8 center_chan2_from_ap;
+			u8 reqtype;
+			__le32 maxinterval;
+			u8 dbdcband;
+			u8 rsv[3];
+		} __packed roc;
+	} __packed req = {
+		.roc = {
+			.tag = cpu_to_le16(UNI_ROC_ACQUIRE),
+			.len = cpu_to_le16(sizeof(struct roc_acquire_tlv)),
+			.tokenid = token_id,
+			.reqtype = type,
+			.maxinterval = cpu_to_le32(duration),
+			.bss_idx = vif->mt76.idx,
+			.control_channel = chan->hw_value,
+			.bw = CMD_CBW_20MHZ,
+			.bw_from_ap = CMD_CBW_20MHZ,
+			.center_chan = center_ch,
+			.center_chan_from_ap = center_ch,
+			.dbdcband = 0xff, /* auto */
+		},
+	};
+
+	if (chan->hw_value < center_ch)
+		req.roc.sco = 1; /* SCA */
+	else if (chan->hw_value > center_ch)
+		req.roc.sco = 3; /* SCB */
+
+	switch (chan->band) {
+	case NL80211_BAND_6GHZ:
+		req.roc.band = 3;
+		break;
+	case NL80211_BAND_5GHZ:
+		req.roc.band = 2;
+		break;
+	default:
+		req.roc.band = 1;
+		break;
+	}
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_UNI_CMD(ROC),
+				 &req, sizeof(req), false);
+}
+
+int mt7921_mcu_abort_roc(struct mt7921_phy *phy, struct mt7921_vif *vif,
+			 u8 token_id)
+{
+	struct mt7921_dev *dev = phy->dev;
+	struct {
+		struct {
+			u8 rsv[4];
+		} __packed hdr;
+		struct roc_abort_tlv {
+			__le16 tag;
+			__le16 len;
+			u8 bss_idx;
+			u8 tokenid;
+			u8 dbdcband;
+			u8 rsv[5];
+		} __packed abort;
+	} __packed req = {
+		.abort = {
+			.tag = cpu_to_le16(UNI_ROC_ABORT),
+			.len = cpu_to_le16(sizeof(struct roc_abort_tlv)),
+			.tokenid = token_id,
+			.bss_idx = vif->mt76.idx,
+			.dbdcband = 0xff, /* auto*/
+		},
+	};
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_UNI_CMD(ROC),
+				 &req, sizeof(req), false);
+}
+
 int mt7921_mcu_set_chan_info(struct mt7921_phy *phy, int cmd)
 {
 	struct mt7921_dev *dev = phy->dev;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index eaba114a9c7e..d9d78f6b088e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -53,6 +53,20 @@
 #define MT7921_SDIO_HDR_TX_BYTES	GENMASK(15, 0)
 #define MT7921_SDIO_HDR_PKT_TYPE	GENMASK(17, 16)
 
+#define MCU_UNI_EVENT_ROC  0x27
+
+enum {
+	UNI_ROC_ACQUIRE,
+	UNI_ROC_ABORT,
+	UNI_ROC_NUM
+};
+
+enum mt7921_roc_req {
+	MT7921_ROC_REQ_JOIN,
+	MT7921_ROC_REQ_ROC,
+	MT7921_ROC_REQ_NUM
+};
+
 enum mt7921_sdio_pkt_type {
 	MT7921_SDIO_TXD,
 	MT7921_SDIO_DATA,
@@ -508,4 +522,9 @@ int mt7921_set_tx_sar_pwr(struct ieee80211_hw *hw,
 
 int mt7921_mcu_set_clc(struct mt7921_dev *dev, u8 *alpha2,
 		       enum environment_cap env_cap);
+int mt7921_mcu_set_roc(struct mt7921_phy *phy, struct mt7921_vif *vif,
+		       struct ieee80211_channel *chan, int duration,
+		       enum mt7921_roc_req type, u8 token_id);
+int mt7921_mcu_abort_roc(struct mt7921_phy *phy, struct mt7921_vif *vif,
+			 u8 token_id);
 #endif
-- 
2.25.1


