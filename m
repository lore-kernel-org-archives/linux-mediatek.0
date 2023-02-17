Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBBCC05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Feb 2023 17:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mVnTocHQiiTL5C+NkFkIOH4zRxnyLpTv9jQKgqKpk3o=; b=wW97wg/G9B/Qk67AqD6+SifesO
	eeXn+uS0rnyv0prPU5nionS/kK5NsWW9+Q3bJhglwwhE6MzQlDl/tvwPbUdY6rZZeUv9433Kq/5ba
	P0uGPOgXztpLW7DFISANFBrh4lMRdr3D8LYMrmr1Qali9Ccnl1CUoxPZ+6EYgfJPuwgowLSHx7ke+
	6y7y27Fflw5/hBeljji7SCOgQi9crfs2U6yJL6R+xJVF/TjO4+/9N/fc9AB/tscvl1fVKbz1tDTG2
	XDuaxwzc3c0I0D7xY1Aa06iCLY4AvW8ZrvG5EBbr2kOEI9fZNPYIEiYOyOvRGlWu2qPZksT6phJC8
	DUZGbY/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT4rc-00FK8Q-70; Fri, 17 Feb 2023 17:49:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT4rZ-00FK7O-Fa
	for linux-mediatek@lists.infradead.org; Fri, 17 Feb 2023 17:49:38 +0000
X-UUID: 6db6cca8aeeb11eda08d4d6090ec5a5c-20230217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=mVnTocHQiiTL5C+NkFkIOH4zRxnyLpTv9jQKgqKpk3o=;
	b=kAw9q07yDGPVv4COhEy2IVKegpVkZy2VJv8iMCetENANGG1UZYyUhBp3gx6lrS7yz/3RSXxrkL9AjF4Jf68QAipb3U4UWa6JLEzuO28y7VVboe7GJ+j0pAhELGxA6R53Ac2iGJRPSH/SknXhqJNPNIUAmSSsgerQ5tcMLcoO7wE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.19,REQID:0f65b2df-118c-4cf7-8490-80f43ae008e1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:885ddb2,CLOUDID:dba858f3-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 6db6cca8aeeb11eda08d4d6090ec5a5c-20230217
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1612584682; Fri, 17 Feb 2023 10:49:29 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Sat, 18 Feb 2023 01:49:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Sat, 18 Feb 2023 01:49:27 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Johannes Berg <johannes@sipsolutions.net>
CC: Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v2 2/2] wifi: mac80211: add LDPC related flags in ieee80211_bss_conf
Date: Sat, 18 Feb 2023 01:49:25 +0800
Message-ID: <1de696aaa34efd77a926eb657b8c0fda05aaa177.1676628065.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <8d9966c4c1e77cb1ade77d42bdc49905609192e9.1676628065.git.ryder.lee@mediatek.com>
References: <8d9966c4c1e77cb1ade77d42bdc49905609192e9.1676628065.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_094937_540981_D0B6EC5B 
X-CRM114-Status: GOOD (  11.76  )
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

This is utilized to pass LDPC configurations from user space
(i.e. hostapd) to driver.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
changes since v2
- fix typo of commit logs.
- revise statement of newly added members in ieee80211_bss_conf.
---
 include/net/mac80211.h |  6 ++++++
 net/mac80211/cfg.c     | 11 +++++++++++
 2 files changed, 17 insertions(+)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 879fc14ebd2a..5f0902b4f8ea 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -653,6 +653,9 @@ struct ieee80211_fils_discovery {
  *	write-protected by sdata_lock and local->mtx so holding either is fine
  *	for read access.
  * @color_change_color: the bss color that will be used after the change.
+ * @ht_ldpc: in AP mode, indicates interface has HT LDPC capability.
+ * @vht_ldpc: in AP mode, indicates interface has VHT LDPC capability.
+ * @he_ldpc: in AP mode, indicates interface has HE LDPC capability.
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
index 6bf1cdf254f6..b02cd0acc4e3 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -1252,7 +1252,15 @@ static int ieee80211_start_ap(struct wiphy *wiphy, struct net_device *dev,
 	prev_beacon_int = link_conf->beacon_int;
 	link_conf->beacon_int = params->beacon_interval;
 
+	if (params->ht_cap)
+		link_conf->ht_ldpc =
+			params->ht_cap->cap_info &
+				cpu_to_le16(IEEE80211_HT_CAP_LDPC_CODING);
+
 	if (params->vht_cap) {
+		link_conf->vht_ldpc =
+			params->vht_cap->vht_cap_info &
+				cpu_to_le32(IEEE80211_VHT_CAP_RXLDPC);
 		link_conf->vht_su_beamformer =
 			params->vht_cap->vht_cap_info &
 				cpu_to_le32(IEEE80211_VHT_CAP_SU_BEAMFORMER_CAPABLE);
@@ -1282,6 +1290,9 @@ static int ieee80211_start_ap(struct wiphy *wiphy, struct net_device *dev,
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


