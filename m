Return-Path: <SRS0=QAkp=PD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 782C9C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 03:42:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33596611BD
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 03:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 33596611BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9ebFHGbd29GXhgsxUAPFA79CKZpmF1ztUtgAVZ49I5A=; b=ZYCojDYfnS/KiK
	ewWSHQ8dVBM6Hd3W8n/+NvsEzLIACjk7MqcZy9xcG+gT3dpidUSsr5Bx978Pxi3xaLu+hdeTmEkpK
	fItQzLZWhH745vewI2M+XNnbmGtf1nWDbJZG9vVFkDpjbHUleni/tvCfHrxxMNfyRCQ0yail1VlPW
	Ckkult09O+XpaBpbXOqIUnZ8BoxSg/sSbOn3/pILZ8HYZv7YRsa/wVBOWjQscAyQTMpSaCGzFRyO0
	p72eaRnK+uT4Td24V7eZtrwDdr5v6Id9PQFQT9tV5KiKdMCyn60HeE4MmthNPVdMkUKlM8hse00tZ
	JZHQWjUEB4qoNiQN/AXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbE6f-005Kpo-AD; Fri, 15 Oct 2021 03:42:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbE6c-005KpN-Eq
 for linux-mediatek@lists.infradead.org; Fri, 15 Oct 2021 03:42:04 +0000
X-UUID: a68f71e53da847f1b2b8c8aaee985e2a-20211014
X-UUID: a68f71e53da847f1b2b8c8aaee985e2a-20211014
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1844308515; Thu, 14 Oct 2021 20:42:00 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 Oct 2021 20:31:58 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 15 Oct 2021 11:31:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 15 Oct 2021 11:31:56 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>, Ryder Lee <ryder.lee@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH v2 1/2] mt76: mt7915: enable HE UL MU-MIMO
Date: Fri, 15 Oct 2021 11:31:44 +0800
Message-ID: <20211015033145.8738-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_204202_600577_77E96034 
X-CRM114-Status: GOOD (  15.21  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Enable HE UL MU-MIMO in sta_rec_muru, which works on both ap and station
mode.

For sending trigger frames, one of the conditions fw uses is to check if
mib rx airtime meets the threshold.
There's a main control of mib rx airtime report register in fw, so we
need to enable the register by mcu cmd instead of directly writing it,
otherwise it will still be disabled by fw.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
v2: refine mt7915_mcu_sta_muru_tlv()
---
 .../net/wireless/mediatek/mt76/mt7915/init.c  |  2 -
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 79 +++++++++++++++----
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   |  1 +
 .../net/wireless/mediatek/mt76/mt7915/regs.h  |  1 -
 4 files changed, 63 insertions(+), 20 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index a269808..7f76907 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -389,8 +389,6 @@ mt7915_mac_init_band(struct mt7915_dev *dev, u8 band)
 	      FIELD_PREP(MT_MDP_RCFR1_RX_DROPPED_MCAST, MT_MDP_TO_HIF);
 	mt76_rmw(dev, MT_MDP_BNRCFR1(band), mask, set);
 
-	mt76_set(dev, MT_WF_RMAC_MIB_AIRTIME0(band), MT_WF_RMAC_MIB_RXTIME_EN);
-
 	mt76_rmw_field(dev, MT_DMA_DCR0(band), MT_DMA_DCR0_MAX_RX_LEN, 1536);
 	/* disable rx rate report by default due to hw issues */
 	mt76_clear(dev, MT_DMA_DCR0(band), MT_DMA_DCR0_RXD_G5_EN);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 92e4f9d..e4da804 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -1520,13 +1520,12 @@ mt7915_mcu_sta_muru_tlv(struct sk_buff *skb, struct ieee80211_sta *sta,
 	struct sta_rec_muru *muru;
 	struct tlv *tlv;
 
-	if (!sta->vht_cap.vht_supported && !sta->he_cap.has_he)
+	if (!sta->vht_cap.vht_supported)
 		return;
 
 	tlv = mt7915_mcu_add_tlv(skb, STA_REC_MURU, sizeof(*muru));
 
 	muru = (struct sta_rec_muru *)tlv;
-	muru->cfg.ofdma_dl_en = true;
 
 	/* A non-AP HE station must support MU beamformee */
 	muru->cfg.mimo_dl_en = (vif->type == NL80211_IFTYPE_STATION &&
@@ -1535,6 +1534,22 @@ mt7915_mcu_sta_muru_tlv(struct sk_buff *skb, struct ieee80211_sta *sta,
 			       mvif->cap.vht_mu_ebfer ||
 			       mvif->cap.vht_mu_ebfee;
 
+	muru->mimo_dl.vht_mu_bfee =
+		!!(sta->vht_cap.cap & IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE);
+
+	if (!sta->he_cap.has_he)
+		return;
+
+	muru->mimo_dl.partial_bw_dl_mimo =
+		HE_PHY(CAP6_PARTIAL_BANDWIDTH_DL_MUMIMO, elem->phy_cap_info[6]);
+
+	muru->cfg.mimo_ul_en = true;
+	muru->mimo_ul.full_ul_mimo =
+		HE_PHY(CAP2_UL_MU_FULL_MU_MIMO, elem->phy_cap_info[2]);
+	muru->mimo_ul.partial_ul_mimo =
+		HE_PHY(CAP2_UL_MU_PARTIAL_MU_MIMO, elem->phy_cap_info[2]);
+
+	muru->cfg.ofdma_dl_en = true;
 	muru->ofdma_dl.punc_pream_rx =
 		HE_PHY(CAP1_PREAMBLE_PUNC_RX_MASK, elem->phy_cap_info[1]);
 	muru->ofdma_dl.he_20m_in_40m_2g =
@@ -1543,9 +1558,6 @@ mt7915_mcu_sta_muru_tlv(struct sk_buff *skb, struct ieee80211_sta *sta,
 		HE_PHY(CAP8_20MHZ_IN_160MHZ_HE_PPDU, elem->phy_cap_info[8]);
 	muru->ofdma_dl.he_80m_in_160m =
 		HE_PHY(CAP8_80MHZ_IN_160MHZ_HE_PPDU, elem->phy_cap_info[8]);
-	muru->ofdma_dl.lt16_sigb = 0;
-	muru->ofdma_dl.rx_su_comp_sigb = 0;
-	muru->ofdma_dl.rx_su_non_comp_sigb = 0;
 
 	muru->ofdma_ul.t_frame_dur =
 		HE_MAC(CAP1_TF_MAC_PAD_DUR_MASK, elem->mac_cap_info[1]);
@@ -1553,18 +1565,6 @@ mt7915_mcu_sta_muru_tlv(struct sk_buff *skb, struct ieee80211_sta *sta,
 		HE_MAC(CAP2_MU_CASCADING, elem->mac_cap_info[2]);
 	muru->ofdma_ul.uo_ra =
 		HE_MAC(CAP3_OFDMA_RA, elem->mac_cap_info[3]);
-	muru->ofdma_ul.he_2x996_tone = 0;
-	muru->ofdma_ul.rx_t_frame_11ac = 0;
-
-	muru->mimo_dl.vht_mu_bfee =
-		!!(sta->vht_cap.cap & IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE);
-	muru->mimo_dl.partial_bw_dl_mimo =
-		HE_PHY(CAP6_PARTIAL_BANDWIDTH_DL_MUMIMO, elem->phy_cap_info[6]);
-
-	muru->mimo_ul.full_ul_mimo =
-		HE_PHY(CAP2_UL_MU_FULL_MU_MIMO, elem->phy_cap_info[2]);
-	muru->mimo_ul.partial_ul_mimo =
-		HE_PHY(CAP2_UL_MU_PARTIAL_MU_MIMO, elem->phy_cap_info[2]);
 }
 
 static void
@@ -2922,6 +2922,47 @@ int mt7915_mcu_set_muru_ctrl(struct mt7915_dev *dev, u32 cmd, u32 val)
 				 sizeof(req), false);
 }
 
+static int
+mt7915_mcu_init_rx_airtime(struct mt7915_dev *dev)
+{
+#define RX_AIRTIME_FEATURE_CTRL		1
+#define RX_AIRTIME_BITWISE_CTRL		2
+#define RX_AIRTIME_CLEAR_EN	1
+	struct {
+		__le16 field;
+		__le16 sub_field;
+		__le32 set_status;
+		__le32 get_status;
+		u8 _rsv[12];
+
+		bool airtime_en;
+		bool mibtime_en;
+		bool earlyend_en;
+		u8 _rsv1[9];
+
+		bool airtime_clear;
+		bool mibtime_clear;
+		u8 _rsv2[98];
+	} __packed req = {
+		.field = cpu_to_le16(RX_AIRTIME_BITWISE_CTRL),
+		.sub_field = cpu_to_le16(RX_AIRTIME_CLEAR_EN),
+		.airtime_clear = true,
+	};
+	int ret;
+
+	ret = mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(RX_AIRTIME_CTRL), &req,
+				sizeof(req), true);
+	if (ret)
+		return ret;
+
+	req.field = cpu_to_le16(RX_AIRTIME_FEATURE_CTRL);
+	req.sub_field = cpu_to_le16(RX_AIRTIME_CLEAR_EN);
+	req.airtime_en = true;
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(RX_AIRTIME_CTRL), &req,
+				 sizeof(req), true);
+}
+
 int mt7915_mcu_init(struct mt7915_dev *dev)
 {
 	static const struct mt76_mcu_ops mt7915_mcu_ops = {
@@ -2956,6 +2997,10 @@ int mt7915_mcu_init(struct mt7915_dev *dev)
 	if (ret)
 		return ret;
 
+	ret = mt7915_mcu_init_rx_airtime(dev);
+	if (ret)
+		return ret;
+
 	return mt7915_mcu_wa_cmd(dev, MCU_WA_PARAM_CMD(SET),
 				 MCU_WA_PARAM_RED, 0, 0);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index bc9f350..91bf421 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -271,6 +271,7 @@ enum {
 	MCU_EXT_CMD_MAC_INIT_CTRL = 0x46,
 	MCU_EXT_CMD_RX_HDR_TRANS = 0x47,
 	MCU_EXT_CMD_MUAR_UPDATE = 0x48,
+	MCU_EXT_CMD_RX_AIRTIME_CTRL = 0x4a,
 	MCU_EXT_CMD_SET_RX_PATH = 0x4e,
 	MCU_EXT_CMD_TX_POWER_FEATURE_CTRL = 0x58,
 	MCU_EXT_CMD_GET_MIB_INFO = 0x5a,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
index 6c487c4..99574ed 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
@@ -364,7 +364,6 @@
 
 #define MT_WF_RMAC_MIB_AIRTIME0(_band)	MT_WF_RMAC(_band, 0x0380)
 #define MT_WF_RMAC_MIB_RXTIME_CLR	BIT(31)
-#define MT_WF_RMAC_MIB_RXTIME_EN	BIT(30)
 
 /* WFDMA0 */
 #define MT_WFDMA0_BASE			0xd4000
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
