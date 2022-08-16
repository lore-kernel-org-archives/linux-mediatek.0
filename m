Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B30C00140
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Aug 2022 01:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZX+wKp/IIXoRfRh4xDRHSuz3ilvjnJ4jzIP0pOHYwmY=; b=bAWWbzzc1AGYprESjgdpYnSSan
	Jds32ZW6A3Y3hNswdkOtfOp88Z8h15LHrIZw66/IXwc73GUROS0ojdkPnzjAG8rJ8iliKsO58/6xV
	TFxfUNEYx78JhUG8pCP+zwRqBAGDMM7LvCHT+SgJjJyLCHCB7wHapHFQRFrjF+teh5WpJhT2YefHn
	P7o7R73u7yiIlrAb0Oo0fEZRAMqibeLM4IEGwCj/E8+gXBD8jyLNElIlnXgGE86j8kyJ/BnFkU7mq
	2Vzu8yB0qrSNvJTS/culdMvPpsc0cA2K3QVBNikSCk+k8RZ+JKYG2OdCn32X3LnlbzIHbi+gglaE1
	1HWUZRDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNl0r-008Q56-JF; Tue, 16 Aug 2022 01:04:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNl0o-008Q23-G4
	for linux-mediatek@lists.infradead.org; Tue, 16 Aug 2022 01:04:56 +0000
X-UUID: 6a4c3df8ace24f55a416a8fc44b29143-20220815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ZX+wKp/IIXoRfRh4xDRHSuz3ilvjnJ4jzIP0pOHYwmY=;
	b=dpSvip9vtoy90Ck586XlG2o92xxIaj5xt/qFLlEgNz3Ckv4bsTCHNV7Z9cwds5EgcJ8ALA7StAinri+IBfwVMDSWMlpP/Fge/gr+Yz4+YWhfym/Dn2AbJGEprruaVTtEMujiAT88mj02l/Et82khZTyHUNTFEZRF83uDOhDbu9Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:c50d7abd-8746-439d-baad-70a2d9019435,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_H
	am,ACTION:release,TS:5
X-CID-META: VersionHash:3d8acc9,CLOUDID:c9a564fd-9e71-4a0f-ba6b-417998daea35,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 6a4c3df8ace24f55a416a8fc44b29143-20220815
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <sean.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1068903067; Mon, 15 Aug 2022 18:04:48 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 16 Aug 2022 08:04:12 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 16 Aug 2022 08:04:12 +0800
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
Subject: [PATCH 5/9] wifi: mt76: mt7921: add unified ROC cmd/event support
Date: Tue, 16 Aug 2022 08:03:43 +0800
Message-ID: <31abc0972859270b619b098bdcd02d4b8d5fdaa0.1660606893.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1660606893.git.objelf@gmail.com>
References: <cover.1660606893.git.objelf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_180454_574072_8B783273 
X-CRM114-Status: GOOD (  17.02  )
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
 3 files changed, 147 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 1fcc3e8c5380..f3c1e1dc574a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -114,11 +114,15 @@ struct mt76_connac2_mcu_rxd {
 
 	u8 eid;
 	u8 seq;
-	u8 rsv[2];
+	u8 option;
+	u8 __rsv;
+
 
 	u8 ext_eid;
 	u8 rsv1[2];
 	u8 s2d_index;
+
+	u8 tlv[0];
 };
 
 struct mt76_connac2_patch_hdr {
@@ -938,6 +942,9 @@ enum {
 	DEV_INFO_MAX_NUM
 };
 
+#define MCU_UNI_CMD_EVENT                       BIT(1)
+#define MCU_UNI_CMD_UNSOLICITED_EVENT           BIT(2)
+
 /* event table */
 enum {
 	MCU_EVENT_TARGET_ADDRESS_LEN = 0x01,
@@ -1144,6 +1151,7 @@ enum {
 	MCU_UNI_CMD_OFFLOAD = 0x06,
 	MCU_UNI_CMD_HIF_CTRL = 0x07,
 	MCU_UNI_CMD_SNIFFER = 0x24,
+	MCU_UNI_CMD_ROC = 0x27,
 };
 
 enum {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index da12d0ae0835..76c8afc00c24 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -275,6 +275,23 @@ mt7921_mcu_rx_unsolicited_event(struct mt7921_dev *dev, struct sk_buff *skb)
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
@@ -284,6 +301,11 @@ void mt7921_mcu_rx_event(struct mt7921_dev *dev, struct sk_buff *skb)
 
 	rxd = (struct mt76_connac2_mcu_rxd *)skb->data;
 
+	if (rxd->option & MCU_UNI_CMD_UNSOLICITED_EVENT) {
+		mt7921_mcu_uni_rx_unsolicited_event(dev, skb);
+		return;
+	}
+
 	if (rxd->eid == 0x6) {
 		mt76_mcu_rx_event(&dev->mt76, skb);
 		return;
@@ -521,6 +543,103 @@ int mt7921_mcu_set_tx(struct mt7921_dev *dev, struct ieee80211_vif *vif)
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
index c161031ac62a..c9044d546e94 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -51,6 +51,20 @@
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
@@ -479,4 +493,9 @@ mt7921_init_acpi_sar_power(struct mt7921_phy *phy, bool set_default)
 #endif
 int mt7921_set_tx_sar_pwr(struct ieee80211_hw *hw,
 			  const struct cfg80211_sar_specs *sar);
+int mt7921_mcu_set_roc(struct mt7921_phy *phy, struct mt7921_vif *vif,
+		       struct ieee80211_channel *chan, int duration,
+		       enum mt7921_roc_req type, u8 token_id);
+int mt7921_mcu_abort_roc(struct mt7921_phy *phy, struct mt7921_vif *vif,
+			 u8 token_id);
 #endif
-- 
2.25.1


