Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C47C531DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Aug 2024 09:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=24jn+2XjF5n77zOBbC+cxREac59bDjesd7lQidAAOVI=; b=rOVBYlRbX3UN0JCkv28Q/xQFti
	+p7ar/b4CrLmxZOzPFAg5bNg2uBnjYMLWeJqDLyXe9Su06OcJjSGnYZT/o2TjPOYCn7MsMeUuQSbw
	751v4KzBWymvbK9iL72GDEsmh/n4wUeq19KE4lkSVRrAvuodAr/pq1b5BPjFWON/rBNPg9pnwnoyB
	mekMZYLEWgiOyreEASVDwVKRPZnRrv2m9Z+Uc+23CdDLxSzcucNGAJWIYXPMiaCty7ujv/RkF04Bn
	dZ1l+9sXxGgfmlJYhXUvlQoW7mg2SpmcbYe1RUIhYTiaXpHv8xzx2f2wPcssP2OPCyROEjBf6gZdb
	D3sINsmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1setdt-0000000CV4x-45aG;
	Fri, 16 Aug 2024 09:53:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1setbB-0000000CUMQ-2vDs
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Aug 2024 09:50:22 +0000
X-UUID: f1b1f6505bb411efba0aef63c0775dbf-20240816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=24jn+2XjF5n77zOBbC+cxREac59bDjesd7lQidAAOVI=;
	b=l10yip0cehYerwrvZ44LdvIAoJCOG7twyFa1/iUimXvULgvH6vHIVtZ3rEBBd4u7cqone3Yo7r16y/Y6V/Ko/KkVgIW5eK8qUU7NlxLzSOTBJFESc2X92HInP0nHsZFum7pD9RiSC3CqfxuHvTpEaYTKDmUqbHfV5XGVAO2UNFw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:e5b0aadc-7b89-4d65-9c66-25ab4efb1a7e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:2dad403f-6019-4002-9080-12f7f4711092,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f1b1f6505bb411efba0aef63c0775dbf-20240816
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 880803309; Fri, 16 Aug 2024 02:50:17 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 16 Aug 2024 02:50:15 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 16 Aug 2024 17:50:15 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Howard Hsu
	<howard-yh.hsu@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 07/12] wifi: mt76: mt7996: set correct beamformee SS capability
Date: Fri, 16 Aug 2024 17:46:30 +0800
Message-ID: <20240816094635.2391-6-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240816094635.2391-1-shayne.chen@mediatek.com>
References: <20240816094635.2391-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_025021_773209_369B52D1 
X-CRM114-Status: GOOD (  11.33  )
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

From: Howard Hsu <howard-yh.hsu@mediatek.com>

According to IEEE P802.11be/D6.0 Table 9-417n, beamformee SS field stands
for the maximum number of spatial streams that the STA can receive in an
EHT sounding NDP minus 1, and the minimum value of this field is 3.

This value indicates the decoding capability of a beamformee, which is
independent of current antenna settings. Correct the value for mt7996
and mt7992 chipsets based on their HW capability.

Signed-off-by: Howard Hsu <howard-yh.hsu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7996/init.c  | 23 ++++++++++++++-----
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index 7e7e42b54c2e..5e96973226bb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -942,8 +942,12 @@ void mt7996_set_stream_vht_txbf_caps(struct mt7996_phy *phy)
 	cap = &phy->mt76->sband_5g.sband.vht_cap.cap;
 
 	*cap |= IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE |
-		IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE |
-		FIELD_PREP(IEEE80211_VHT_CAP_BEAMFORMEE_STS_MASK, sts - 1);
+		IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE;
+
+	if (is_mt7996(phy->mt76->dev))
+		*cap |= FIELD_PREP(IEEE80211_VHT_CAP_BEAMFORMEE_STS_MASK, 3);
+	else
+		*cap |= FIELD_PREP(IEEE80211_VHT_CAP_BEAMFORMEE_STS_MASK, 4);
 
 	*cap &= ~(IEEE80211_VHT_CAP_SOUNDING_DIMENSIONS_MASK |
 		  IEEE80211_VHT_CAP_SU_BEAMFORMER_CAPABLE |
@@ -988,9 +992,15 @@ mt7996_set_stream_he_txbf_caps(struct mt7996_phy *phy,
 	    IEEE80211_HE_PHY_CAP2_UL_MU_PARTIAL_MU_MIMO;
 	elem->phy_cap_info[2] |= c;
 
-	c = IEEE80211_HE_PHY_CAP4_SU_BEAMFORMEE |
-	    IEEE80211_HE_PHY_CAP4_BEAMFORMEE_MAX_STS_UNDER_80MHZ_4 |
-	    IEEE80211_HE_PHY_CAP4_BEAMFORMEE_MAX_STS_ABOVE_80MHZ_4;
+	c = IEEE80211_HE_PHY_CAP4_SU_BEAMFORMEE;
+
+	if (is_mt7996(phy->mt76->dev))
+		c |= IEEE80211_HE_PHY_CAP4_BEAMFORMEE_MAX_STS_UNDER_80MHZ_4 |
+		     IEEE80211_HE_PHY_CAP4_BEAMFORMEE_MAX_STS_ABOVE_80MHZ_4;
+	else
+		c |= IEEE80211_HE_PHY_CAP4_BEAMFORMEE_MAX_STS_UNDER_80MHZ_5 |
+		     IEEE80211_HE_PHY_CAP4_BEAMFORMEE_MAX_STS_ABOVE_80MHZ_5;
+
 	elem->phy_cap_info[4] |= c;
 
 	/* do not support NG16 due to spec D4.0 changes subcarrier idx */
@@ -1187,7 +1197,8 @@ mt7996_init_eht_caps(struct mt7996_phy *phy, enum nl80211_band band,
 		IEEE80211_EHT_PHY_CAP0_SU_BEAMFORMER |
 		IEEE80211_EHT_PHY_CAP0_SU_BEAMFORMEE;
 
-	val = max_t(u8, sts - 1, 3);
+	/* Set the maximum capability regardless of the antenna configuration. */
+	val = is_mt7992(phy->mt76->dev) ? 4 : 3;
 	eht_cap_elem->phy_cap_info[0] |=
 		u8_encode_bits(u8_get_bits(val, BIT(0)),
 			       IEEE80211_EHT_PHY_CAP0_BEAMFORMEE_SS_80MHZ_MASK);
-- 
2.39.2


