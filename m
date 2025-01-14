Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3568EE77188
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jan 2025 10:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q+c2MhT89qEjJlctyTYAhCyMaZdM58ZDb6cLw8yaOhM=; b=AGbZHQ3zWo79Sa/tJxd4W4DU1v
	x5sfn9jFHMY7BZ1jTl1SFCJPRVTVeUMVY7zUK9ZFmlG2RQeKYgCKfsGTHNV+C8Hjlpf4RvcuhjVuh
	/Ep2ZsUxP1IVu0fhGbAagdYy4pY2Dbkf4ehKAKkzkl4BeopUqhPnBcvpdqCDMTcBu9meXxknoKuqW
	Z4ZCRFENH8EtthoGL0DE8fkgh7hT/1G328StU4q8JQfLbUHbM66wjaC/59uI5RKW42MX4XlGS6H4s
	s+tjXdrIS5oUtyDDvWFU0HStPylm4JffwP8S2BucJgtTL6EQwAu0o7QrWMMc+rv1JSLVE684XecJh
	ozrmmQZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXdtz-0000000831p-3hRE;
	Tue, 14 Jan 2025 10:12:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXdtk-000000082xO-3srm
	for linux-mediatek@lists.infradead.org;
	Tue, 14 Jan 2025 10:11:50 +0000
X-UUID: f3824efed25f11ef9048ed6ed365623b-20250114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=q+c2MhT89qEjJlctyTYAhCyMaZdM58ZDb6cLw8yaOhM=;
	b=LwWRXXZ8wrHHjt3xbfrAXZpYsXIZ5dj2nWZPkyEO9834mtdztiuHiHoOeTapyejAXt80twRPBsCh9jjhn/jr6ceWiyScqJDhIsSQph2mPy+w4QsfXfvJlLg2+hTae4u/5ykubYVuAP23NkkIpBNg+TkueZUc3Xf99IZsARHzayg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:cc9abb39-aff1-4758-98d3-51d1b2341929,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:d5d9de0e-078a-483b-8929-714244d25c49,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f3824efed25f11ef9048ed6ed365623b-20250114
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 329225784; Tue, 14 Jan 2025 03:11:42 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 14 Jan 2025 18:11:39 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 14 Jan 2025 18:11:39 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Howard Hsu
	<howard-yh.hsu@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 3/9] wifi: mt76: mt7996: fix HE Phy capability
Date: Tue, 14 Jan 2025 18:10:20 +0800
Message-ID: <20250114101026.3587702-3-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250114101026.3587702-1-shayne.chen@mediatek.com>
References: <20250114101026.3587702-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_021148_964247_EAAF87F2 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
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

Set HE SU PPDU And HE MU PPDU With 4x HE-LTF And 0.8 us GI within HE PHY
Capabilities element as 1 since hardware can support.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Signed-off-by: Howard Hsu <howard-yh.hsu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/init.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index 5ce0226a3900..f93f6e30c784 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -1200,6 +1200,9 @@ mt7996_init_he_caps(struct mt7996_phy *phy, enum nl80211_band band,
 	he_cap_elem->phy_cap_info[2] = IEEE80211_HE_PHY_CAP2_STBC_TX_UNDER_80MHZ |
 				       IEEE80211_HE_PHY_CAP2_STBC_RX_UNDER_80MHZ;
 
+	he_cap_elem->phy_cap_info[7] =
+			IEEE80211_HE_PHY_CAP7_HE_SU_MU_PPDU_4XLTF_AND_08_US_GI;
+
 	switch (iftype) {
 	case NL80211_IFTYPE_AP:
 		he_cap_elem->mac_cap_info[0] |= IEEE80211_HE_MAC_CAP0_TWT_RES;
@@ -1239,8 +1242,7 @@ mt7996_init_he_caps(struct mt7996_phy *phy, enum nl80211_band band,
 			IEEE80211_HE_PHY_CAP6_PARTIAL_BW_EXT_RANGE |
 			IEEE80211_HE_PHY_CAP6_PPE_THRESHOLD_PRESENT;
 		he_cap_elem->phy_cap_info[7] |=
-			IEEE80211_HE_PHY_CAP7_POWER_BOOST_FACTOR_SUPP |
-			IEEE80211_HE_PHY_CAP7_HE_SU_MU_PPDU_4XLTF_AND_08_US_GI;
+			IEEE80211_HE_PHY_CAP7_POWER_BOOST_FACTOR_SUPP;
 		he_cap_elem->phy_cap_info[8] |=
 			IEEE80211_HE_PHY_CAP8_20MHZ_IN_40MHZ_HE_PPDU_IN_2G |
 			IEEE80211_HE_PHY_CAP8_20MHZ_IN_160MHZ_HE_PPDU |
-- 
2.39.2


