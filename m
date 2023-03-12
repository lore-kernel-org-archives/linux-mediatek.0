Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F5EC6FA99
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Mar 2023 06:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UpWrqzJtjnV3b9TA3AdJJfz5fDe0IeOdNHGAdv239Hw=; b=aFlVXhn19kpYSnzFKzFfoZm0sx
	GWYMSE7NCH4kcHdnTBVFmNsBOMyJs+BbdMlQu69SiGnzpqG4O0elc3Jl+45EXOdpEpwIB79m38ka1
	M9ktaJd2rNSyPIW68geAXlvDHyilcoS84EC8DjiLvyIp3y6+dCVxqsPfNkFq50UuLYfvbQnQIqXQh
	EdxM2SyjBV/JXjDKw5t8dXtqo4tEnF7kApa9cExRSu8UezrbUtEyA4jPyeDHB706uSRrITnyJZHVt
	NTQ+8NR8gBo+ckzauxlDs7aYfteiMjUvCOqBH2bYTjcDlb51Jgb8+8KiQNubgf4V91bBUNsovTAUl
	g0cwolfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbEwI-001rIK-WC; Sun, 12 Mar 2023 06:12:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbEwF-001rHn-Gw
	for linux-mediatek@lists.infradead.org; Sun, 12 Mar 2023 06:12:13 +0000
X-UUID: cf250762c09c11eda799af78a38f2b8e-20230311
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=UpWrqzJtjnV3b9TA3AdJJfz5fDe0IeOdNHGAdv239Hw=;
	b=g1f4a1+A+V2dTlbIDdMx2YygAcjkyu29fYCMXsqYGF2Bc5T91KLuuNzMCRNpSYiLAz8EC9mHplsiqQMkdfK28LrtD7EikyuIS/Usi0zzKmNOVN/18lGlAkscyBWoa08XEb4XEEN1bJWdj3A/hG+dXDSud3pv9OeVUhtXd5Nagk4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:eb912e2f-ea1c-43cb-b22d-b34847d7d90b,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:25b5999,CLOUDID:242e84f5-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:5,IP:nil,UR
	L:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: cf250762c09c11eda799af78a38f2b8e-20230311
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 81036160; Sat, 11 Mar 2023 23:12:04 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Sun, 12 Mar 2023 14:11:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Sun, 12 Mar 2023 14:11:28 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>, Bo
 Jiao <bo.jiao@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7996: enable mesh HW amsdu/de-amsdu support
Date: Sun, 12 Mar 2023 14:11:25 +0800
Message-ID: <e2c0fadf54ce06cb37df53f765e6fe168e0ec311.1678601023.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_221211_622113_40986269 
X-CRM114-Status: GOOD (  16.65  )
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

This enables HW offloading amsdu/de-amsdu support for 802.11s mesh
interface.

Co-developed-by: Bo Jiao <bo.jiao@mediatek.com>
Signed-off-by: Bo Jiao <bo.jiao@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7996/mac.c   | 24 ++++++++++++-------
 .../net/wireless/mediatek/mt76/mt7996/mac.h   |  2 ++
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   |  7 ++++++
 .../net/wireless/mediatek/mt76/mt7996/mcu.h   |  2 +-
 .../net/wireless/mediatek/mt76/mt7996/mmio.c  |  1 +
 5 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 3c3506c7c87a..3d8332d502b3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -632,6 +632,8 @@ mt7996_mac_fill_rx(struct mt7996_dev *dev, struct sk_buff *skb)
 	u32 rxd4 = le32_to_cpu(rxd[4]);
 	u32 csum_mask = MT_RXD0_NORMAL_IP_SUM | MT_RXD0_NORMAL_UDP_TCP_SUM;
 	u32 csum_status = *(u32 *)skb->cb;
+	u32 mesh_mask = MT_RXD0_MESH | MT_RXD0_MHCP;
+	bool is_mesh = (rxd0 & mesh_mask) == mesh_mask;
 	bool unicast, insert_ccmp_hdr = false;
 	u8 remove_pad, amsdu_info, band_idx;
 	u8 mode = 0, qos_ctl = 0;
@@ -823,19 +825,16 @@ mt7996_mac_fill_rx(struct mt7996_dev *dev, struct sk_buff *skb)
 		int pad_start = 0;
 
 		skb_pull(skb, hdr_gap);
-		if (!hdr_trans && status->amsdu) {
+		if (!hdr_trans && status->amsdu && !(ieee80211_has_a4(fc) && is_mesh)) {
 			pad_start = ieee80211_get_hdrlen_from_skb(skb);
-		} else if (hdr_trans && (rxd2 & MT_RXD2_NORMAL_HDR_TRANS_ERROR)) {
+		} else if (hdr_trans && (rxd2 & MT_RXD2_NORMAL_HDR_TRANS_ERROR) &&
+			   get_unaligned_be16(skb->data + pad_start) == ETH_P_8021Q) {
 			/* When header translation failure is indicated,
 			 * the hardware will insert an extra 2-byte field
 			 * containing the data length after the protocol
 			 * type field.
 			 */
-			pad_start = 12;
-			if (get_unaligned_be16(skb->data + pad_start) == ETH_P_8021Q)
-				pad_start += 4;
-			else
-				pad_start = 0;
+			pad_start = 16;
 		}
 
 		if (pad_start) {
@@ -856,8 +855,17 @@ mt7996_mac_fill_rx(struct mt7996_dev *dev, struct sk_buff *skb)
 		hdr = mt76_skb_get_hdr(skb);
 		fc = hdr->frame_control;
 		if (ieee80211_is_data_qos(fc)) {
+			u8 *qos = ieee80211_get_qos_ctl(hdr);
+
 			seq_ctrl = le16_to_cpu(hdr->seq_ctrl);
-			qos_ctl = *ieee80211_get_qos_ctl(hdr);
+			qos_ctl = *qos;
+
+			/* Mesh DA/SA/Length will be stripped after hardware
+			 * de-amsdu, so here needs to clear amsdu present bit
+			 * to mark it as a normal mesh frame.
+			 */
+			if (ieee80211_has_a4(fc) && is_mesh && status->amsdu)
+				*qos &= ~IEEE80211_QOS_CTL_A_MSDU_PRESENT;
 		}
 	} else {
 		status->flag |= RX_FLAG_8023;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.h b/drivers/net/wireless/mediatek/mt76/mt7996/mac.h
index 2cc218f735d8..d6b1ee994b54 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.h
@@ -12,6 +12,8 @@
 #define MT_RXD0_LENGTH			GENMASK(15, 0)
 #define MT_RXD0_PKT_TYPE		GENMASK(31, 27)
 
+#define MT_RXD0_MESH			BIT(18)
+#define MT_RXD0_MHCP			BIT(19)
 #define MT_RXD0_NORMAL_ETH_TYPE_OFS	GENMASK(22, 16)
 #define MT_RXD0_NORMAL_IP_SUM		BIT(23)
 #define MT_RXD0_NORMAL_UDP_TCP_SUM	BIT(24)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 8ad51cbfdbe8..b5ce335056e8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -1022,6 +1022,7 @@ mt7996_mcu_sta_amsdu_tlv(struct mt7996_dev *dev, struct sk_buff *skb,
 	struct tlv *tlv;
 
 	if (vif->type != NL80211_IFTYPE_STATION &&
+	    vif->type != NL80211_IFTYPE_MESH_POINT &&
 	    vif->type != NL80211_IFTYPE_AP)
 		return;
 
@@ -1471,6 +1472,12 @@ mt7996_mcu_sta_hdr_trans_tlv(struct mt7996_dev *dev, struct sk_buff *skb,
 		hdr_trans->to_ds = true;
 		hdr_trans->from_ds = true;
 	}
+
+	if (vif->type == NL80211_IFTYPE_MESH_POINT) {
+		hdr_trans->to_ds = true;
+		hdr_trans->from_ds = true;
+		hdr_trans->mesh = true;
+	}
 }
 
 static enum mcu_mmps_mode
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
index dd0c5ac52703..009f5f06042e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
@@ -396,7 +396,7 @@ struct sta_rec_hdr_trans {
 	u8 from_ds;
 	u8 to_ds;
 	u8 dis_rx_hdr_tran;
-	u8 rsv;
+	u8 mesh;
 } __packed;
 
 struct hdr_trans_en {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
index 902370a2a639..61e42d71810d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
@@ -320,6 +320,7 @@ struct mt7996_dev *mt7996_mmio_probe(struct device *pdev,
 		/* txwi_size = txd size + txp size */
 		.txwi_size = MT_TXD_SIZE + sizeof(struct mt76_connac_fw_txp),
 		.drv_flags = MT_DRV_TXWI_NO_FREE |
+			     MT_DRV_AMSDU_OFFLOAD |
 			     MT_DRV_HW_MGMT_TXQ,
 		.survey_flags = SURVEY_INFO_TIME_TX |
 				SURVEY_INFO_TIME_RX |
-- 
2.18.0


