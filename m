Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E885C636D6
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 22:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b4W6l6GF1VWjTkxn870nPiyBNx/kDR/5X/MNtznSwgw=; b=2sgW+HrBZVnQU1kC5FJU4W9/hu
	YAfzxo3EA0FaqXfuHqPRKmMBpKFeJ6SBQmlwCegM4P7fC1MDFsF/XP7ac9Kb9tPznxqpWioRreoOu
	tmKVbMzolswcnm49277Hsk3bdOi5vqxb9U+ANDE0qPoZhp4UwAA5/S4/zt2fjcVKbU0LXhOrMMRJs
	kShe+dp1Ogtjixn2W9OkWq4Vn9fcZmJBHkYBtNMHPrD618O5+XeqQM9Tvq2yhB4BYanL1maJTcLBG
	F0BGDYo2sDikcJQbi1CDlX6yRbMbE069jUSBTKCADlODQC42i7Fnd7OZS7dssdQXwwP15jnbbWbvf
	YUAdw5wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPscz-00H2zR-7N; Wed, 08 Feb 2023 22:09:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPscw-00H2yb-09
	for linux-mediatek@lists.infradead.org; Wed, 08 Feb 2023 22:09:20 +0000
X-UUID: 34fdf098a7fd11eda08d4d6090ec5a5c-20230208
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=b4W6l6GF1VWjTkxn870nPiyBNx/kDR/5X/MNtznSwgw=;
	b=FhoDrobwRIynPAwQjUBdpQ+k3cYMXKvYp07hnxfCUHpv0nsiWeXfS7DrqOD0URnLxmBaXDGpEFzyvBKmeC2yJnm4I7YmnaxTAkhh5DG5Sg0mbiDeyHVzhACy3+EBFHdX2VxnqiCL7ENYQvg8gErf26UqGYDaCRxZ+mBisUyO0Mg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.19,REQID:865d93d2-bebb-44a2-92b4-41f02b4eabbd,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:885ddb2,CLOUDID:9da4508e-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 34fdf098a7fd11eda08d4d6090ec5a5c-20230208
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 856044319; Wed, 08 Feb 2023 15:09:07 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 9 Feb 2023 06:09:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 9 Feb 2023 06:09:05 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Johannes Berg <johannes.berg@intel.com>, <linux-wireless@vger.kernel.org>
CC: Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, <linux-mediatek@lists.infradead.org>, Ryder Lee
	<ryder.lee@mediatek.com>
Subject: [PATCH 2/2] wifi: mac80211: add LDPC related flags in ieee80211_bss_conf
Date: Thu, 9 Feb 2023 06:09:02 +0800
Message-ID: <4e5cff1c538cbd9ecca171e0e4d6fddd87c3dfa0.1675893838.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <c1a6ef2f42e26a6e0473d4fb2ce1b572f8448d87.1675893838.git.ryder.lee@mediatek.com>
References: <c1a6ef2f42e26a6e0473d4fb2ce1b572f8448d87.1675893838.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_140918_202174_F56C0126 
X-CRM114-Status: GOOD (  11.55  )
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

This is utilized to pass LDPC configurations from user space (i.e. hostap) to driver.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 include/net/mac80211.h |  6 ++++++
 net/mac80211/cfg.c     | 12 ++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 943f2aec6042..76a12bec71d5 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -653,6 +653,9 @@ struct ieee80211_fils_discovery {
  *	write-protected by sdata_lock and local->mtx so holding either is fine
  *	for read access.
  * @color_change_color: the bss color that will be used after the change.
+ * @ht_ldpc: in AP mode, indicates interface owns HT LDPC capability.
+ * @vht_ldpc: in AP mode, indicates interface owns VHT LDPC capability.
+ * @he_ldpc: in AP mode, indicates interface owns HE LDPC capability.
  * @vht_su_beamformer: in AP mode, does this BSS support operation as an VHT SU
  *	beamformer
  * @vht_su_beamformee: in AP mode, does this BSS support operation as an VHT SU
@@ -750,6 +753,9 @@ struct ieee80211_bss_conf {
 	bool color_change_active;
 	u8 color_change_color;
 
+	bool ht_ldpc;
+	bool vht_ldpc;
+	bool he_ldpc;
 	bool vht_su_beamformer;
 	bool vht_su_beamformee;
 	bool vht_mu_beamformer;
diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 6bf1cdf254f6..a080010da8fb 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -1252,7 +1252,16 @@ static int ieee80211_start_ap(struct wiphy *wiphy, struct net_device *dev,
 	prev_beacon_int = link_conf->beacon_int;
 	link_conf->beacon_int = params->beacon_interval;
 
+	if (params->ht_cap) {
+		link_conf->ht_ldpc =
+			params->ht_cap->cap_info &
+				cpu_to_le16(IEEE80211_HT_CAP_LDPC_CODING);
+	}
+
 	if (params->vht_cap) {
+		link_conf->vht_ldpc =
+			params->vht_cap->vht_cap_info &
+				cpu_to_le32(IEEE80211_VHT_CAP_RXLDPC);
 		link_conf->vht_su_beamformer =
 			params->vht_cap->vht_cap_info &
 				cpu_to_le32(IEEE80211_VHT_CAP_SU_BEAMFORMER_CAPABLE);
@@ -1282,6 +1291,9 @@ static int ieee80211_start_ap(struct wiphy *wiphy, struct net_device *dev,
 	}
 
 	if (params->he_cap) {
+		link_conf->he_ldpc =
+			params->he_cap->phy_cap_info[1] &
+				IEEE80211_HE_PHY_CAP1_LDPC_CODING_IN_PAYLOAD;
 		link_conf->he_su_beamformer =
 			params->he_cap->phy_cap_info[3] &
 				IEEE80211_HE_PHY_CAP3_SU_BEAMFORMER;
-- 
2.18.0


