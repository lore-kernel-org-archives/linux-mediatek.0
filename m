Return-Path: <SRS0=3/N7=7X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C001C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2020 17:56:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F37C2070B
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2020 17:56:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B3kWdo8F";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Lf7N0VH+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F37C2070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r8qu6LoM8wMJ68aLvanSPKoWAa2n+vi2LT6p3I2ksS4=; b=B3kWdo8FT2hwoN
	wxpq4e1viX6uyvdvrLg4Daa0+A6241U4ii2w7PcqGRV1RWoCx4ic0I4Pu/NUVomfL7QYPEaw/Ku6G
	Jc8WTojb7ohGKYouyRx41jpCKNvsmp8npl0VOav3aGvYlT80h2TrCpHuNtJe7UfA/G4G/7YQbhjlr
	zKFmOfmeKHvfHTJBXRm8PdOL566Ij5UbSy7kVHbvgsXYnRLhc2pGdAt/4AC+lR7fJq4Ctr8EHD1jK
	mFzLqPTWXxQe7NV7mwL1u5lWMDMkENcmk5SDBzviDJvW04pomREi1xwd1Ngg/heI3ayAEmAtUOhl8
	cFpArK5jteEYG6ANvx2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jj4xZ-0007W2-8f; Wed, 10 Jun 2020 17:56:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jj4xV-0007Uh-D8
 for linux-mediatek@lists.infradead.org; Wed, 10 Jun 2020 17:56:19 +0000
X-UUID: c7333e245c7d4c36b0c616f4696d17eb-20200610
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=47yyi6m4fUgnEDPphiLhl4rOwR2Ga/hhnAODjXGkp+A=; 
 b=Lf7N0VH++ZZOYH7iWue97OxKbZppsUqsUrfDVoYFFRx3TlpdU9fINztxYpA/iBGXBk4CxX3cFnnlqc4EjfUtTTQsIaTu8RWTrMmiTHq90O83E0x+KWb8oZQGl9lE7jlrGa3/30qKJtJEGMfeq2IAY8bJG+IsUF3jQ/uQ9HkZv1s=;
X-UUID: c7333e245c7d4c36b0c616f4696d17eb-20200610
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1732749412; Wed, 10 Jun 2020 09:55:44 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Jun 2020 10:56:05 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 11 Jun 2020 01:55:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 11 Jun 2020 01:55:51 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH 2/2] mt76: mt7915: add MU-MIMO support
Date: Thu, 11 Jun 2020 01:55:51 +0800
Message-ID: <e3b0d3afe8e6f327631cbf483998979ee000e5e0.1591809100.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <8464fdd2191d8d77e51441474e5c99e18b64185b.1591809100.git.ryder.lee@mediatek.com>
References: <8464fdd2191d8d77e51441474e5c99e18b64185b.1591809100.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200610_105617_449591_EE14AF90 
X-CRM114-Status: GOOD (  11.78  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@mediatek.com>,
 linux-wireless@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Enable MU-MIMO and add relative counters in debugfs.

Currently MU modules read WTBL first to notify BA changes to
other cross modules, so adjust mt7915_mcu_sta_ba() accordingly.

Tested-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7915/debugfs.c   | 11 ++-
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 72 ++++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   |  5 +-
 .../net/wireless/mediatek/mt76/mt7915/regs.h  |  5 ++
 4 files changed, 88 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index 5278bee812f1..38f473d587c9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -178,7 +178,14 @@ mt7915_txbf_stat_read_phy(struct mt7915_phy *phy, struct seq_file *s)
 	seq_printf(s, "Tx Beamformee feedback triggered counts: %ld\n",
 		   FIELD_GET(MT_ETBF_TX_FB_TRI, cnt));
 
-	/* Tx SU counters */
+	/* Tx SU & MU counters */
+	cnt = mt76_rr(dev, MT_MIB_SDR34(ext_phy));
+	seq_printf(s, "Tx multi-user Beamforming counts: %ld\n",
+		   FIELD_GET(MT_MIB_MU_BF_TX_CNT, cnt));
+	cnt = mt76_rr(dev, MT_MIB_DR8(ext_phy));
+	seq_printf(s, "Tx multi-user MPDU counts: %d\n", cnt);
+	cnt = mt76_rr(dev, MT_MIB_DR9(ext_phy));
+	seq_printf(s, "Tx multi-user successful MPDU counts: %d\n", cnt);
 	cnt = mt76_rr(dev, MT_MIB_DR11(ext_phy));
 	seq_printf(s, "Tx single-user successful MPDU counts: %d\n", cnt);
 
@@ -384,6 +391,7 @@ int mt7915_init_debugfs(struct mt7915_dev *dev)
 	return 0;
 }
 
+#ifdef CONFIG_MAC80211_DEBUGFS
 /** per-station debugfs **/
 
 /* usage: <tx mode> <ldpc> <stbc> <bw> <gi> <nss> <mcs> */
@@ -461,3 +469,4 @@ void mt7915_sta_add_debugfs(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	debugfs_create_file("fixed_rate", 0600, dir, sta, &fops_fixed_rate);
 	debugfs_create_file("stats", 0400, dir, sta, &fops_sta_stats);
 }
+#endif
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 8460cd453213..9e3490dfdf86 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -1166,19 +1166,31 @@ mt7915_mcu_sta_ba(struct mt7915_dev *dev,
 	struct wtbl_req_hdr *wtbl_hdr;
 	struct tlv *sta_wtbl;
 	struct sk_buff *skb;
+	int ret;
 
 	skb = mt7915_mcu_alloc_sta_req(dev, mvif, msta,
 				       MT7915_STA_UPDATE_MAX_SIZE);
 	if (IS_ERR(skb))
 		return PTR_ERR(skb);
 
-	mt7915_mcu_sta_ba_tlv(skb, params, enable, tx);
 	sta_wtbl = mt7915_mcu_add_tlv(skb, STA_REC_WTBL, sizeof(struct tlv));
 
 	wtbl_hdr = mt7915_mcu_alloc_wtbl_req(dev, msta, WTBL_SET, sta_wtbl,
 					     &skb);
 	mt7915_mcu_wtbl_ba_tlv(skb, params, enable, tx, sta_wtbl, wtbl_hdr);
 
+	ret = __mt76_mcu_skb_send_msg(&dev->mt76, skb,
+				      MCU_EXT_CMD_STA_REC_UPDATE, true);
+	if (ret)
+		return ret;
+
+	skb = mt7915_mcu_alloc_sta_req(dev, mvif, msta,
+				       MT7915_STA_UPDATE_MAX_SIZE);
+	if (IS_ERR(skb))
+		return PTR_ERR(skb);
+
+	mt7915_mcu_sta_ba_tlv(skb, params, enable, tx);
+
 	return __mt76_mcu_skb_send_msg(&dev->mt76, skb,
 				       MCU_EXT_CMD_STA_REC_UPDATE, true);
 }
@@ -1466,16 +1478,38 @@ mt7915_mcu_sta_muru_tlv(struct sk_buff *skb, struct ieee80211_sta *sta)
 		HE_PHY(CAP2_UL_MU_PARTIAL_MU_MIMO, elem->phy_cap_info[2]);
 }
 
+static int
+mt7915_mcu_add_mu(struct mt7915_dev *dev, struct ieee80211_vif *vif,
+		  struct ieee80211_sta *sta)
+{
+	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
+	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
+	struct sk_buff *skb;
+	int len = sizeof(struct sta_req_hdr) + sizeof(struct sta_rec_muru);
+
+	if (!sta->vht_cap.vht_supported && !sta->he_cap.has_he)
+		return 0;
+
+	skb = mt7915_mcu_alloc_sta_req(dev, mvif, msta, len);
+	if (IS_ERR(skb))
+		return PTR_ERR(skb);
+
+	mt7915_mcu_sta_muru_tlv(skb, sta);
+
+	return __mt76_mcu_skb_send_msg(&dev->mt76, skb,
+				       MCU_EXT_CMD_STA_REC_UPDATE, true);
+}
+
 static void
 mt7915_mcu_sta_tlv(struct mt7915_dev *dev, struct sk_buff *skb,
 		   struct ieee80211_sta *sta)
 {
 	struct tlv *tlv;
 
+	/* starec ht */
 	if (sta->ht_cap.ht_supported) {
 		struct sta_rec_ht *ht;
 
-		/* starec ht */
 		tlv = mt7915_mcu_add_tlv(skb, STA_REC_HT, sizeof(*ht));
 		ht = (struct sta_rec_ht *)tlv;
 		ht->ht_cap = cpu_to_le16(sta->ht_cap.cap);
@@ -2067,6 +2101,32 @@ int mt7915_mcu_add_rate_ctrl(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 				       MCU_EXT_CMD_STA_REC_UPDATE, true);
 }
 
+static int
+mt7915_mcu_add_group(struct mt7915_dev *dev, struct ieee80211_vif *vif,
+		     struct ieee80211_sta *sta)
+{
+#define MT_STA_BSS_GROUP		1
+	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
+	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
+	struct {
+		__le32 action;
+		u8 wlan_idx_lo;
+		u8 status;
+		u8 wlan_idx_hi;
+		u8 rsv0[5];
+		__le32 val;
+		u8 rsv1[8];
+	} __packed req = {
+		.action = cpu_to_le32(MT_STA_BSS_GROUP),
+		.wlan_idx_lo = to_wcid_lo(msta->wcid.idx),
+		.wlan_idx_hi = to_wcid_hi(msta->wcid.idx),
+		.val = cpu_to_le32(mvif->idx),
+	};
+
+	return __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_SET_DRR_CTRL,
+				   &req, sizeof(req), true);
+}
+
 int mt7915_mcu_add_sta_adv(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 			   struct ieee80211_sta *sta, bool enable)
 {
@@ -2076,10 +2136,18 @@ int mt7915_mcu_add_sta_adv(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 		return 0;
 
 	/* must keep the order */
+	ret = mt7915_mcu_add_group(dev, vif, sta);
+	if (ret)
+		return ret;
+
 	ret = mt7915_mcu_add_txbf(dev, vif, sta, enable);
 	if (ret)
 		return ret;
 
+	ret = mt7915_mcu_add_mu(dev, vif, sta);
+	if (ret)
+		return ret;
+
 	if (enable)
 		return mt7915_mcu_add_rate_ctrl(dev, vif, sta);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index c241dd7c4c36..981dd3fcdb41 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -201,6 +201,7 @@ enum {
 	MCU_EXT_CMD_EDCA_UPDATE = 0x27,
 	MCU_EXT_CMD_DEV_INFO_UPDATE = 0x2A,
 	MCU_EXT_CMD_THERMAL_CTRL = 0x2c,
+	MCU_EXT_CMD_SET_DRR_CTRL = 0x36,
 	MCU_EXT_CMD_SET_RDD_CTRL = 0x3a,
 	MCU_EXT_CMD_PROTECT_CTRL = 0x3e,
 	MCU_EXT_CMD_MAC_INIT_CTRL = 0x46,
@@ -653,7 +654,7 @@ struct sta_rec_muru {
 		bool ofdma_ul_en;
 		bool mimo_dl_en;
 		bool mimo_ul_en;
-		bool rsv[4];
+		u8 rsv[4];
 	} cfg;
 
 	struct {
@@ -664,7 +665,7 @@ struct sta_rec_muru {
 		bool lt16_sigb;
 		bool rx_su_comp_sigb;
 		bool rx_su_non_comp_sigb;
-		bool rsv;
+		u8 rsv;
 	} ofdma_dl;
 
 	struct {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
index c121715f8bff..e0989141d9da 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
@@ -117,11 +117,16 @@
 #define MT_MIB_SDR16(_band)		MT_WF_MIB(_band, 0x048)
 #define MT_MIB_SDR16_BUSY_MASK		GENMASK(23, 0)
 
+#define MT_MIB_SDR34(_band)		MT_WF_MIB(_band, 0x090)
+#define MT_MIB_MU_BF_TX_CNT		GENMASK(15, 0)
+
 #define MT_MIB_SDR36(_band)		MT_WF_MIB(_band, 0x098)
 #define MT_MIB_SDR36_TXTIME_MASK	GENMASK(23, 0)
 #define MT_MIB_SDR37(_band)		MT_WF_MIB(_band, 0x09c)
 #define MT_MIB_SDR37_RXTIME_MASK	GENMASK(23, 0)
 
+#define MT_MIB_DR8(_band)		MT_WF_MIB(_band, 0x0c0)
+#define MT_MIB_DR9(_band)		MT_WF_MIB(_band, 0x0c4)
 #define MT_MIB_DR11(_band)		MT_WF_MIB(_band, 0x0cc)
 
 #define MT_MIB_MB_SDR0(_band, n)	MT_WF_MIB(_band, 0x100 + ((n) << 4))
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
