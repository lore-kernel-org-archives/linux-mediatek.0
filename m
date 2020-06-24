Return-Path: <SRS0=bzTf=AF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00640C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2020 17:24:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0F2B2078D
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2020 17:24:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0Ua9XPy3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="L3CvgxgU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0F2B2078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nQrSt21259PUAL28Ig9JXEFEJtMNqDB2Yd5KF6DMfgc=; b=0Ua9XPy3plshQDo8Rb1nS28Su7
	IISQhD29NAUzC6ZTLH5GJ30NYEzgyvGHrAqssXfRvhVRcvBdjFvEENPyqJhqjKmzoilbKmXfMjXE0
	u+3DxkJXZqADBcsjycO/xtLGovLRW+wbWZwYkMoGl7YOFsu9xg6zOWgFNkJ6t2rQlX/g5toRg7KJX
	p/IxNKTE9FVreG7OQr6f5lD0Mdkv83MJwuHGEH/EN5M6E7m33KnsxIrVc1srJ37T6vN20BnM0f0Cb
	Od5Fe/1f6S/FBpBqF75lYGSICagLQSf39351rJCJjWCu0BnCCn8oA/b6CQnAFuEXAjuH6TKA3KtKz
	dWK/RN/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jo97n-0008DG-CT; Wed, 24 Jun 2020 17:23:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jo97k-0008Ai-1Z
 for linux-mediatek@lists.infradead.org; Wed, 24 Jun 2020 17:23:49 +0000
X-UUID: ae5ee4c709a2462ab2d6060acc696b7a-20200624
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=qMIjkuBy2HwPU4i8OcdE4zsIe65Zt8A7oOYCBZ5H/Zs=; 
 b=L3CvgxgUMZ/e5WdU66YA4ADgDagGEMMTGCX8XecWaG33TxyFk+2uycI8uPc7dYkx9/TUUjOTwEwelIH7jWDidueB1vHI0CilM3wcTxo2jy2mHMdgvai8bpSkkdJTFTmbyIqeV8ahfd/mSDyUvrVKVARWROELQPaZv9wwHZ0Okm0=;
X-UUID: ae5ee4c709a2462ab2d6060acc696b7a-20200624
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 969240656; Wed, 24 Jun 2020 09:23:37 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 24 Jun 2020 10:23:28 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Jun 2020 01:23:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 25 Jun 2020 01:23:15 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>, Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH] mt76: mt7915: update HE capabilities
Date: Thu, 25 Jun 2020 01:23:17 +0800
Message-ID: <23d21ba5b73b4f56cc22e8ae8988c0682d6a32b0.1592984153.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
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
Cc: linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>,
 linux-wireless@vger.kernel.org, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Sync from SDK to update HE capabilities.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/init.c  | 44 +++++++++++--------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 3a10bbe0e2de..d102d1765751 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -424,11 +424,6 @@ mt7915_init_he_caps(struct mt7915_phy *phy, enum nl80211_band band,
 
 		he_cap_elem->mac_cap_info[0] =
 			IEEE80211_HE_MAC_CAP0_HTC_HE;
-		he_cap_elem->mac_cap_info[1] =
-			IEEE80211_HE_MAC_CAP1_TF_MAC_PAD_DUR_0US |
-			IEEE80211_HE_MAC_CAP1_MULTI_TID_AGG_RX_QOS_1;
-		he_cap_elem->mac_cap_info[2] =
-			IEEE80211_HE_MAC_CAP2_BSR;
 		he_cap_elem->mac_cap_info[3] =
 			IEEE80211_HE_MAC_CAP3_OMI_CONTROL |
 			IEEE80211_HE_MAC_CAP3_MAX_AMPDU_LEN_EXP_RESERVED;
@@ -450,27 +445,27 @@ mt7915_init_he_caps(struct mt7915_phy *phy, enum nl80211_band band,
 			IEEE80211_HE_PHY_CAP2_STBC_TX_UNDER_80MHZ |
 			IEEE80211_HE_PHY_CAP2_STBC_RX_UNDER_80MHZ;
 
-		/* TODO: OFDMA */
-
 		switch (i) {
 		case NL80211_IFTYPE_AP:
 			he_cap_elem->mac_cap_info[0] |=
 				IEEE80211_HE_MAC_CAP0_TWT_RES;
+			he_cap_elem->mac_cap_info[2] |=
+				IEEE80211_HE_MAC_CAP2_BSR;
 			he_cap_elem->mac_cap_info[4] |=
 				IEEE80211_HE_MAC_CAP4_BQR;
+			he_cap_elem->mac_cap_info[5] |=
+				IEEE80211_HE_MAC_CAP5_OM_CTRL_UL_MU_DATA_DIS_RX;
 			he_cap_elem->phy_cap_info[3] |=
 				IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_TX_QPSK |
 				IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_RX_QPSK;
 			he_cap_elem->phy_cap_info[6] |=
 				IEEE80211_HE_PHY_CAP6_PPE_THRESHOLD_PRESENT;
-			he_cap_elem->phy_cap_info[9] |=
-				IEEE80211_HE_PHY_CAP9_RX_1024_QAM_LESS_THAN_242_TONE_RU;
 			break;
 		case NL80211_IFTYPE_STATION:
 			he_cap_elem->mac_cap_info[0] |=
 				IEEE80211_HE_MAC_CAP0_TWT_REQ;
-			he_cap_elem->mac_cap_info[3] |=
-				IEEE80211_HE_MAC_CAP3_FLEX_TWT_SCHED;
+			he_cap_elem->mac_cap_info[1] |=
+				IEEE80211_HE_MAC_CAP1_TF_MAC_PAD_DUR_16US;
 
 			if (band == NL80211_BAND_2GHZ)
 				he_cap_elem->phy_cap_info[0] |=
@@ -480,18 +475,31 @@ mt7915_init_he_caps(struct mt7915_phy *phy, enum nl80211_band band,
 					IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_RU_MAPPING_IN_5G;
 
 			he_cap_elem->phy_cap_info[1] |=
-				IEEE80211_HE_PHY_CAP1_DEVICE_CLASS_A;
+				IEEE80211_HE_PHY_CAP1_DEVICE_CLASS_A |
+				IEEE80211_HE_PHY_CAP1_HE_LTF_AND_GI_FOR_HE_PPDUS_0_8US;
+			he_cap_elem->phy_cap_info[3] |=
+				IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_TX_QPSK |
+				IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_RX_QPSK;
+			he_cap_elem->phy_cap_info[6] |=
+				IEEE80211_HE_PHY_CAP6_TRIG_CQI_FB |
+				IEEE80211_HE_PHY_CAP6_PARTIAL_BW_EXT_RANGE |
+				IEEE80211_HE_PHY_CAP6_PPE_THRESHOLD_PRESENT;
+			he_cap_elem->phy_cap_info[7] |=
+				IEEE80211_HE_PHY_CAP7_POWER_BOOST_FACTOR_AR |
+				IEEE80211_HE_PHY_CAP7_HE_SU_MU_PPDU_4XLTF_AND_08_US_GI;
 			he_cap_elem->phy_cap_info[8] |=
 				IEEE80211_HE_PHY_CAP8_20MHZ_IN_40MHZ_HE_PPDU_IN_2G |
 				IEEE80211_HE_PHY_CAP8_20MHZ_IN_160MHZ_HE_PPDU |
-				IEEE80211_HE_PHY_CAP8_80MHZ_IN_160MHZ_HE_PPDU;
+				IEEE80211_HE_PHY_CAP8_80MHZ_IN_160MHZ_HE_PPDU |
+				IEEE80211_HE_PHY_CAP8_DCM_MAX_RU_484;
 			he_cap_elem->phy_cap_info[9] |=
-				IEEE80211_HE_PHY_CAP9_TX_1024_QAM_LESS_THAN_242_TONE_RU;
+				IEEE80211_HE_PHY_CAP9_LONGER_THAN_16_SIGB_OFDM_SYM |
+				IEEE80211_HE_PHY_CAP9_NON_TRIGGERED_CQI_FEEDBACK |
+				IEEE80211_HE_PHY_CAP9_TX_1024_QAM_LESS_THAN_242_TONE_RU |
+				IEEE80211_HE_PHY_CAP9_RX_1024_QAM_LESS_THAN_242_TONE_RU |
+				IEEE80211_HE_PHY_CAP9_RX_FULL_BW_SU_USING_MU_WITH_COMP_SIGB |
+				IEEE80211_HE_PHY_CAP9_RX_FULL_BW_SU_USING_MU_WITH_NON_COMP_SIGB;
 			break;
-#ifdef CONFIG_MAC80211_MESH
-		case NL80211_IFTYPE_MESH_POINT:
-			break;
-#endif
 		}
 
 		he_mcs->rx_mcs_80 = cpu_to_le16(mcs_map);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
