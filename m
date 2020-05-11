Return-Path: <SRS0=Nu0C=6Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07B20C54E90
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 16:07:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDC5A20708
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 16:07:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ayJsEbYI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Y/pQrYPa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDC5A20708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ynqcqjg2Z6a/QTOr7k9SHuvRrslbJs6R8D8Kfplf990=; b=ayJsEbYI3cCmFW
	CbJOn7+UuYJlaZB2eDKiT00yPxzMv7PkUxUBLFIErWmhNYU6rwDQ1hYYv23uF9xUZUgTLfn4sYkgn
	3JRTQ1STTUCToV8RWuijIaWGaLGyBu19HWtafM/9RLWMxUVdqucdncCGVaU4NTxKaKuAq+FjDO6HR
	HlqaXJnGYfA74ctrFlKKP8lj2TVlKfcloM/uwYbIy9vSOsGxcBU/jZ1U+3DYTsoCEPYyD5XgWqNzn
	O+uCymMGjyIdiq6o+1taoHMUBjlDuZTIWIJ2PRoz7lDg4Kkp8I1j2/8nql1DQdR0D6I+VzZWWIREJ
	UOGnuhRZqRRbgYLX0jEw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYAxT-0005Aq-98; Mon, 11 May 2020 16:07:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYAxM-00050Z-3j
 for linux-mediatek@lists.infradead.org; Mon, 11 May 2020 16:07:06 +0000
X-UUID: 7bcbf6c796c1484c8430f7073d3eebd5-20200511
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=KdEJCbD2s9K+W/vcfNTp8drNRu/seK7PZMooYFxkvME=; 
 b=Y/pQrYPaXu8+OHLklpJczXGvPNPppCusQf+OkbbPPK9s6v5kgch7/sxnu3q7yj+fXgmT2UvBou7/23gLxGv7YKTqSpTXQr7uJ4E6lzLs1uIh8LW3bOdFdMIVrd6KJcxmfGwPUe3w853MURjM+GN+UaVPkjTBg+4O6tRfikg6nvw=;
X-UUID: 7bcbf6c796c1484c8430f7073d3eebd5-20200511
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1314837966; Mon, 11 May 2020 08:06:36 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 May 2020 09:06:55 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 May 2020 00:06:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 12 May 2020 00:06:40 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH 4/7] mt76: mt7915: add TxBF capabilities
Date: Tue, 12 May 2020 00:06:35 +0800
Message-ID: <6b21733f3d01759ca71cc6c7b018b59482be879c.1589212457.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1589212457.git.ryder.lee@mediatek.com>
References: <cover.1589212457.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 058D4E69D12599D3E898DA4ED4C7F5626ACAE910ADCFE90931D59D34A91244622000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_090704_249133_BFAD28FC 
X-CRM114-Status: GOOD (  10.96  )
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

This allows to set HE TxBF runtime stream capabilities

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Tested-by: Evelyn Tsai <evelyn.tsai@mediatek.com
---
 .../net/wireless/mediatek/mt76/mt7915/init.c  | 95 ++++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7915/main.c  |  1 +
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  1 +
 3 files changed, 95 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 3721bd632b4d..e2b0ea33053c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -259,6 +259,94 @@ mt7915_init_wiphy(struct ieee80211_hw *hw)
 	hw->max_tx_fragments = 4;
 }
 
+void mt7915_set_stream_vht_txbf_caps(struct mt7915_phy *phy)
+{
+	int nss = hweight8(phy->chainmask);
+	u32 *cap = &phy->mt76->sband_5g.sband.vht_cap.cap;
+
+	*cap |= IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE |
+		IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE |
+		(3 << IEEE80211_VHT_CAP_BEAMFORMEE_STS_SHIFT);
+
+	*cap &= ~(IEEE80211_VHT_CAP_SOUNDING_DIMENSIONS_MASK |
+		  IEEE80211_VHT_CAP_SU_BEAMFORMER_CAPABLE |
+		  IEEE80211_VHT_CAP_MU_BEAMFORMER_CAPABLE);
+
+	if (nss < 2)
+		return;
+
+	*cap |= IEEE80211_VHT_CAP_SU_BEAMFORMER_CAPABLE |
+		IEEE80211_VHT_CAP_MU_BEAMFORMER_CAPABLE |
+		FIELD_PREP(IEEE80211_VHT_CAP_SOUNDING_DIMENSIONS_MASK,
+			   nss - 1);
+}
+
+static void
+mt7915_set_stream_he_txbf_caps(struct ieee80211_sta_he_cap *he_cap,
+			       int vif, int nss)
+{
+	struct ieee80211_he_cap_elem *elem = &he_cap->he_cap_elem;
+	struct ieee80211_he_mcs_nss_supp *mcs = &he_cap->he_mcs_nss_supp;
+	u8 c;
+
+#ifdef CONFIG_MAC80211_MESH
+	if (vif == NL80211_IFTYPE_MESH_POINT)
+		return;
+#endif
+
+	elem->phy_cap_info[3] &= ~IEEE80211_HE_PHY_CAP3_SU_BEAMFORMER;
+	elem->phy_cap_info[4] &= ~IEEE80211_HE_PHY_CAP4_MU_BEAMFORMER;
+
+	c = IEEE80211_HE_PHY_CAP5_BEAMFORMEE_NUM_SND_DIM_UNDER_80MHZ_MASK |
+	    IEEE80211_HE_PHY_CAP5_BEAMFORMEE_NUM_SND_DIM_ABOVE_80MHZ_MASK;
+	elem->phy_cap_info[5] &= ~c;
+
+	c = IEEE80211_HE_PHY_CAP6_TRIG_SU_BEAMFORMER_FB |
+	    IEEE80211_HE_PHY_CAP6_TRIG_MU_BEAMFORMER_FB;
+	elem->phy_cap_info[6] &= ~c;
+
+	elem->phy_cap_info[7] &= ~IEEE80211_HE_PHY_CAP7_MAX_NC_MASK;
+
+	c = IEEE80211_HE_PHY_CAP2_NDP_4x_LTF_AND_3_2US |
+	    IEEE80211_HE_PHY_CAP2_UL_MU_FULL_MU_MIMO |
+	    IEEE80211_HE_PHY_CAP2_UL_MU_PARTIAL_MU_MIMO;
+	elem->phy_cap_info[2] |= c;
+
+	c = IEEE80211_HE_PHY_CAP4_SU_BEAMFORMEE |
+	    IEEE80211_HE_PHY_CAP4_BEAMFORMEE_MAX_STS_UNDER_80MHZ_4 |
+	    IEEE80211_HE_PHY_CAP4_BEAMFORMEE_MAX_STS_ABOVE_80MHZ_4;
+	elem->phy_cap_info[4] |= c;
+
+	/* do not support NG16 due to spec D4.0 changes subcarrier idx */
+	c = IEEE80211_HE_PHY_CAP6_CODEBOOK_SIZE_42_SU |
+	    IEEE80211_HE_PHY_CAP6_CODEBOOK_SIZE_75_MU;
+
+	if (vif == NL80211_IFTYPE_STATION)
+		c |= IEEE80211_HE_PHY_CAP6_PARTIAL_BANDWIDTH_DL_MUMIMO;
+
+	elem->phy_cap_info[6] |= c;
+
+	if (nss < 2)
+		return;
+
+	if (vif != NL80211_IFTYPE_AP)
+		return;
+
+	elem->phy_cap_info[3] |= IEEE80211_HE_PHY_CAP3_SU_BEAMFORMER;
+	elem->phy_cap_info[4] |= IEEE80211_HE_PHY_CAP4_MU_BEAMFORMER;
+
+	/* num_snd_dim */
+	c = (nss - 1) | (max_t(int, mcs->tx_mcs_160, 1) << 3);
+	elem->phy_cap_info[5] |= c;
+
+	c = IEEE80211_HE_PHY_CAP6_TRIG_SU_BEAMFORMER_FB |
+	    IEEE80211_HE_PHY_CAP6_TRIG_MU_BEAMFORMER_FB;
+	elem->phy_cap_info[6] |= c;
+
+	/* the maximum cap is 4 x 3, (Nr, Nc) = (3, 2) */
+	elem->phy_cap_info[7] |= min_t(int, nss - 1, 2) << 3;
+}
+
 static void
 mt7915_gen_ppe_thresh(u8 *he_ppet)
 {
@@ -352,11 +440,10 @@ mt7915_init_he_caps(struct mt7915_phy *phy, enum nl80211_band band,
 		he_cap_elem->phy_cap_info[1] =
 			IEEE80211_HE_PHY_CAP1_LDPC_CODING_IN_PAYLOAD;
 		he_cap_elem->phy_cap_info[2] =
-			IEEE80211_HE_PHY_CAP2_NDP_4x_LTF_AND_3_2US |
 			IEEE80211_HE_PHY_CAP2_STBC_TX_UNDER_80MHZ |
 			IEEE80211_HE_PHY_CAP2_STBC_RX_UNDER_80MHZ;
 
-		/* TODO: TxBF & MU & MESH */
+		/* TODO: OFDMA */
 
 		switch (i) {
 		case NL80211_IFTYPE_AP:
@@ -407,6 +494,8 @@ mt7915_init_he_caps(struct mt7915_phy *phy, enum nl80211_band band,
 		he_mcs->rx_mcs_80p80 = cpu_to_le16(mcs_map);
 		he_mcs->tx_mcs_80p80 = cpu_to_le16(mcs_map);
 
+		mt7915_set_stream_he_txbf_caps(he_cap, i, nss);
+
 		memset(he_cap->ppe_thres, 0, sizeof(he_cap->ppe_thres));
 		if (he_cap_elem->phy_cap_info[6] &
 		    IEEE80211_HE_PHY_CAP6_PPE_THRESHOLD_PRESENT) {
@@ -464,6 +553,7 @@ mt7915_cap_dbdc_enable(struct mt7915_dev *dev)
 	dev->mphy.hw->wiphy->available_antennas_tx = dev->phy.chainmask;
 
 	mt76_set_stream_caps(&dev->mphy, true);
+	mt7915_set_stream_vht_txbf_caps(&dev->phy);
 	mt7915_set_stream_he_caps(&dev->phy);
 }
 
@@ -480,6 +570,7 @@ mt7915_cap_dbdc_disable(struct mt7915_dev *dev)
 	dev->mphy.hw->wiphy->available_antennas_tx = dev->chainmask;
 
 	mt76_set_stream_caps(&dev->mphy, true);
+	mt7915_set_stream_vht_txbf_caps(&dev->phy);
 	mt7915_set_stream_he_caps(&dev->phy);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index f3a373fc07e5..147ab7da7aa9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -745,6 +745,7 @@ mt7915_set_antenna(struct ieee80211_hw *hw, u32 tx_ant, u32 rx_ant)
 	phy->chainmask = tx_ant;
 
 	mt76_set_stream_caps(phy->mt76, true);
+	mt7915_set_stream_vht_txbf_caps(phy);
 	mt7915_set_stream_he_caps(phy);
 
 	mutex_unlock(&dev->mt76.mutex);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 0d5b448292b5..537fc126289f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -454,6 +454,7 @@ void mt7915_txp_skb_unmap(struct mt76_dev *dev,
 int mt76_dfs_start_rdd(struct mt7915_dev *dev, bool force);
 int mt7915_dfs_init_radar_detector(struct mt7915_phy *phy);
 void mt7915_set_stream_he_caps(struct mt7915_phy *phy);
+void mt7915_set_stream_vht_txbf_caps(struct mt7915_phy *phy);
 void mt7915_update_channel(struct mt76_dev *mdev);
 int mt7915_init_debugfs(struct mt7915_dev *dev);
 #ifdef CONFIG_MAC80211_DEBUGFS
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
