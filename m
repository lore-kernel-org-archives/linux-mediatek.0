Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C05C05027
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 22:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yn49OeRKtLBCqlLz0CSSERhw4RtSaRiB79gvqZn8Z7U=; b=JZUZvA9XaVj5DyYtw3DTq3ipj9
	QOdekDTee2YdGeFBObaDqy6hvZ/Y93TpJ5EPPaViUpRY6foC2VsbMQpR73igT+4CX2Cyt4SwZzuRe
	F3z/yWSv+rZs8TgW6sKYDDR7VvD0hjT7Y+KjBSZCZLK+lm5Z6l2Am3P6KUmQsLtwWhORSLYtLwEMe
	XZdaaoWgKyO0d7EDaGrn9Gbgtm64KA/etUBDR8uRCMyPq2cNZzYxsP0gUNXEEanzkxnuYX6NhDa2K
	/KR1YjXSiwFbjaua8RaUSYlDY214RtKIG4YOy6/KE9lbKc5e8HiHOib/qdswOtEVYL2TAmmQA4Gfj
	VVPCcTFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPsd2-00H2zz-28; Wed, 08 Feb 2023 22:09:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPsd0-00H2yV-5k
	for linux-mediatek@lists.infradead.org; Wed, 08 Feb 2023 22:09:23 +0000
X-UUID: 34abcab6a7fd11eda08d4d6090ec5a5c-20230208
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=yn49OeRKtLBCqlLz0CSSERhw4RtSaRiB79gvqZn8Z7U=;
	b=UBV3g3knyrWmxHKgvLCqy5iabrHVRs4CXN4LuZIqY5E31TasM6y5gxdHUXTo6R4jOTH5bTHfg6pBxWGLmAjZOGAJijRjwSdeeY8eVuAQ1cKJrSEeeOy2lQER5aSNErxQVKV6b7ewoe7MJ8ewjk5XKjZ8dPVKVzpwX5gsPvlRRms=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.19,REQID:2f62d44b-5829-4d32-bafa-f675061f845b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:885ddb2,CLOUDID:d6f4b556-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 34abcab6a7fd11eda08d4d6090ec5a5c-20230208
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1422611951; Wed, 08 Feb 2023 15:09:07 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 9 Feb 2023 06:09:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 9 Feb 2023 06:09:04 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Johannes Berg <johannes.berg@intel.com>, <linux-wireless@vger.kernel.org>
CC: Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, <linux-mediatek@lists.infradead.org>, Ryder Lee
	<ryder.lee@mediatek.com>
Subject: [PATCH 1/2] wifi: mac80211: add EHT MU-MIMO related flags in ieee80211_bss_conf
Date: Thu, 9 Feb 2023 06:09:01 +0800
Message-ID: <c1a6ef2f42e26a6e0473d4fb2ce1b572f8448d87.1675893838.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_140922_236849_85907F18 
X-CRM114-Status: GOOD (  10.49  )
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

Simliar to VHT/HE. This is utilized to pass MU-MIMO configurations
from user space (i.e. hostap) to driver.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 include/net/mac80211.h |  9 +++++++++
 net/mac80211/cfg.c     | 14 ++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 2635e6de8101..943f2aec6042 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -670,6 +670,12 @@ struct ieee80211_fils_discovery {
  * @he_full_ul_mumimo: does this BSS support the reception (AP) or transmission
  *	(non-AP STA) of an HE TB PPDU on an RU that spans the entire PPDU
  *	bandwidth
+ * @eht_su_beamformer: in AP-mode, does this BSS support operation as an EHT SU
+ *	beamformer
+ * @eht_su_beamformee: in AP-mode, does this BSS support operation as an EHT SU
+ *	beamformee
+ * @eht_mu_beamformer: in AP-mode, does this BSS support operation as an EHT MU
+ *	beamformer
  */
 struct ieee80211_bss_conf {
 	const u8 *bssid;
@@ -752,6 +758,9 @@ struct ieee80211_bss_conf {
 	bool he_su_beamformee;
 	bool he_mu_beamformer;
 	bool he_full_ul_mumimo;
+	bool eht_su_beamformer;
+	bool eht_su_beamformee;
+	bool eht_mu_beamformer;
 };
 
 /**
diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index f5d43f42f6d8..6bf1cdf254f6 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -1296,6 +1296,20 @@ static int ieee80211_start_ap(struct wiphy *wiphy, struct net_device *dev,
 				IEEE80211_HE_PHY_CAP2_UL_MU_FULL_MU_MIMO;
 	}
 
+	if (params->eht_cap) {
+		link_conf->eht_su_beamformer =
+			params->eht_cap->fixed.phy_cap_info[0] &
+				IEEE80211_EHT_PHY_CAP0_SU_BEAMFORMER;
+		link_conf->eht_su_beamformee =
+			params->eht_cap->fixed.phy_cap_info[0] &
+				IEEE80211_EHT_PHY_CAP0_SU_BEAMFORMEE;
+		link_conf->eht_mu_beamformer =
+			params->eht_cap->fixed.phy_cap_info[7] &
+				(IEEE80211_EHT_PHY_CAP7_MU_BEAMFORMER_80MHZ |
+				 IEEE80211_EHT_PHY_CAP7_MU_BEAMFORMER_160MHZ |
+				 IEEE80211_EHT_PHY_CAP7_MU_BEAMFORMER_320MHZ);
+	}
+
 	if (sdata->vif.type == NL80211_IFTYPE_AP &&
 	    params->mbssid_config.tx_wdev) {
 		err = ieee80211_set_ap_mbssid_options(sdata,
-- 
2.18.0


