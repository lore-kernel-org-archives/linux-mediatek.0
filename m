Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 889F2C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Mar 2022 15:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q1R0z08AQFGuVpUXPjm2Q/2dvFwRaoNRKnbZbKBaLjM=; b=V7tnjIdsxPN0aJ
	UxufE0oooeyy0ThtFH79DULm94scAolFbatEkgwYFBwMElmOz9bP7jnQjg5eTluN4lfeIbOk5vR4O
	uJgY1aLmC+nrV858M9lsG55ga4PGMqbmkU8mknqD0Xg4HLvL/YSV53RF6stu/AFxv5rQV5hMqH7Qz
	NM5o4HJeGXzsIchR3rdtc0k1x2M9WC83MhIzUvkmqldqdErp4Jsj3Msb7fBxAfRO/f/hi7MGHkBfF
	jeFwMnMpoj+Pur0TzXv0Iy2qBOtLvHwHCslhNZQXkrwpmHU6FGoqbsYMKr5ktOMgqm02QTVeLt35p
	hXyk3XXZqpNpzao6Gwaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSgs1-00H1uu-39; Fri, 11 Mar 2022 15:07:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSgWt-00GstZ-E8
 for linux-mediatek@lists.infradead.org; Fri, 11 Mar 2022 14:46:08 +0000
X-UUID: a2cd6dc2d0f54603aa936e88f5c1a106-20220311
X-UUID: a2cd6dc2d0f54603aa936e88f5c1a106-20220311
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1083592268; Fri, 11 Mar 2022 07:46:04 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Mar 2022 06:46:03 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 11 Mar 2022 22:45:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 11 Mar 2022 22:45:55 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
 <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
 <evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Peter Chiu
 <chui-hao.chiu@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH v2 3/3] mt76: mt7915: fix phy cap in
 mt7915_set_stream_he_txbf_caps()
Date: Fri, 11 Mar 2022 22:44:27 +0800
Message-ID: <20220311144427.16018-3-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220311144427.16018-1-shayne.chen@mediatek.com>
References: <20220311144427.16018-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_064607_536019_9CDB13F4 
X-CRM114-Status: GOOD (  13.23  )
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

From: Peter Chiu <chui-hao.chiu@mediatek.com>

This patch fixes performance issue of beamforming tx on
bandwidth 160MHz.

Fixes: 99ad32a4ca3a ("mt76: mt7915: add support for MT7986")
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/init.c  | 25 +++++++++++++++----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 553d1f5..94a5ea6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -727,11 +727,18 @@ void mt7915_set_stream_vht_txbf_caps(struct mt7915_phy *phy)
 }
 
 static void
-mt7915_set_stream_he_txbf_caps(struct ieee80211_sta_he_cap *he_cap,
+mt7915_set_stream_he_txbf_caps(struct mt7915_dev *dev,
+			       struct ieee80211_sta_he_cap *he_cap,
 			       int vif, int nss)
 {
 	struct ieee80211_he_cap_elem *elem = &he_cap->he_cap_elem;
-	u8 c;
+	u8 c, nss_160;
+
+	/* Can do 1/2 of NSS streams in 160Mhz mode for mt7915 */
+	if (is_mt7915(&dev->mt76) && !dev->dbdc_support)
+		nss_160 = nss / 2;
+	else
+		nss_160 = nss;
 
 #ifdef CONFIG_MAC80211_MESH
 	if (vif == NL80211_IFTYPE_MESH_POINT)
@@ -785,13 +792,21 @@ mt7915_set_stream_he_txbf_caps(struct ieee80211_sta_he_cap *he_cap,
 	/* num_snd_dim
 	 * for mt7915, max supported nss is 2 for bw > 80MHz
 	 */
-	c = (nss - 1) |
-	    IEEE80211_HE_PHY_CAP5_BEAMFORMEE_NUM_SND_DIM_ABOVE_80MHZ_2;
+	c = FIELD_PREP(IEEE80211_HE_PHY_CAP5_BEAMFORMEE_NUM_SND_DIM_UNDER_80MHZ_MASK,
+		       nss - 1) |
+	    FIELD_PREP(IEEE80211_HE_PHY_CAP5_BEAMFORMEE_NUM_SND_DIM_ABOVE_80MHZ_MASK,
+		       nss_160 - 1);
 	elem->phy_cap_info[5] |= c;
 
 	c = IEEE80211_HE_PHY_CAP6_TRIG_SU_BEAMFORMING_FB |
 	    IEEE80211_HE_PHY_CAP6_TRIG_MU_BEAMFORMING_PARTIAL_BW_FB;
 	elem->phy_cap_info[6] |= c;
+
+	if (!is_mt7915(&dev->mt76)) {
+		c = IEEE80211_HE_PHY_CAP7_STBC_TX_ABOVE_80MHZ |
+		    IEEE80211_HE_PHY_CAP7_STBC_RX_ABOVE_80MHZ;
+		elem->phy_cap_info[7] |= c;
+	}
 }
 
 static void
@@ -953,7 +968,7 @@ mt7915_init_he_caps(struct mt7915_phy *phy, enum nl80211_band band,
 		he_mcs->rx_mcs_80p80 = cpu_to_le16(mcs_map_160);
 		he_mcs->tx_mcs_80p80 = cpu_to_le16(mcs_map_160);
 
-		mt7915_set_stream_he_txbf_caps(he_cap, i, nss);
+		mt7915_set_stream_he_txbf_caps(dev, he_cap, i, nss);
 
 		memset(he_cap->ppe_thres, 0, sizeof(he_cap->ppe_thres));
 		if (he_cap_elem->phy_cap_info[6] &
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
