Return-Path: <SRS0=hvzu=52=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEE47C2BA2B
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 09:03:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83C2A206F7
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 09:03:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GtlsV8zE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="dgwleGzT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83C2A206F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yIPSOjPHRbfs9o5NHnaqjjmv3C81ltQchAALd751kzQ=; b=GtlsV8zEOQzEXX
	vwBWqmxGivkaWflFTvCIeHs3R0Kf6E2KJwxU3OGOYxOSVo6qhrXMkiOE45zWdmkyGNpMsad6AzTjq
	JR6UWDAaz89MbcjXUoAh9auSUsoHbrDBcOKWmLIKHITLtAx9pvezu4yRVlKvOzOlkf3quwQa2h7IK
	n+18manjk4E6THpZXq6mdmgi8nWN41e+OyO8Rxy2LKKB5E/MWeWgPz6lCDe+79Muz3Q3+qtbe7p9g
	jHHEov4wD2yLNFdsdRqDq6772/vXEZH+dUcb9svlQ7DCxC8skjY08wo4+GBOoFvbF06lRy9YwS3Id
	jeRFXRA0mUk46fvkOXDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMpYy-00050x-CQ; Fri, 10 Apr 2020 09:03:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMpYt-0004sI-IN
 for linux-mediatek@lists.infradead.org; Fri, 10 Apr 2020 09:02:57 +0000
X-UUID: 08e86aae15d14273a54509f04888d249-20200410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=BsM8817neNBiTX9urNe5/f/vX/dLg2sfaMNigNb9qw0=; 
 b=dgwleGzTwHgTDdpxgNxT9ukArRB8vRb3Cn9Wfl/RSiGcZglw0j7EZmvnu66pmPvoowBFfNLTmQ8HifzQnxZctOvRMVoO7Doc+b7SRxYcRQ3fpU/haQljNaErQAe7ONuIhQN9U3jx97Wg3etwBun/sLxme2Gehici4QPXMttCLc0=;
X-UUID: 08e86aae15d14273a54509f04888d249-20200410
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1415623941; Fri, 10 Apr 2020 01:02:47 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Apr 2020 01:55:03 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Apr 2020 16:55:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 10 Apr 2020 16:55:00 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH 10/16] mt76: mt7915: add HE bss_conf support for interfaces
Date: Fri, 10 Apr 2020 16:54:47 +0800
Message-ID: <4c91a0ccab5d3738e2a1313b449d8bcfdc204925.1586507878.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1586507878.git.ryder.lee@mediatek.com>
References: <cover.1586507878.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: CF1E86DD2669DABF03E97C68CCA4289B00A9028C444DB0FA8640293D4BFC39C02000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200410_020255_648055_BBF2DE1C 
X-CRM114-Status: GOOD (  11.41  )
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
Cc: YF Luo <yf.luo@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless@vger.kernel.org, Sean
 Wang <sean.wang@mediatek.com>, Chih-Min Chen <chih-min.chen@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Yiwei Chung <yiwei.chung@mediatek.com>,
 linux-mediatek@lists.infradead.org, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add basic HE BSS's info for interfaces. As for the advanced features
will be added gradually in the future patches.
(i.e. BSS color, TWT, spatial reuse and OFDMA)

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Tested-by: Shayne Chen <shayne.chen@mediatek.com>
Tested-by: Chih-Min Chen <chih-min.chen@mediatek.com>
Tested-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
Acked-by: Yiwei Chung <yiwei.chung@mediatek.com>
Acked-by: YF Luo <yf.luo@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 89 ++++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   | 11 +++
 2 files changed, 99 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 3cc7b9234e9d..549e1460b184 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -746,6 +746,47 @@ mt7915_mcu_bss_omac_tlv(struct sk_buff *skb, struct ieee80211_vif *vif)
 	omac->hw_bss_idx = idx;
 }
 
+struct mt7915_he_obss_narrow_bw_ru_data {
+	bool tolerated;
+};
+
+static void mt7915_check_he_obss_narrow_bw_ru_iter(struct wiphy *wiphy,
+						   struct cfg80211_bss *bss,
+						   void *_data)
+{
+	struct mt7915_he_obss_narrow_bw_ru_data *data = _data;
+	const struct element *elem;
+
+	elem = cfg80211_find_elem(WLAN_EID_EXT_CAPABILITY, bss->ies->data,
+				  bss->ies->len);
+
+	if (!elem || elem->datalen < 10 ||
+	    !(elem->data[10] &
+	      WLAN_EXT_CAPA10_OBSS_NARROW_BW_RU_TOLERANCE_SUPPORT))
+		data->tolerated = false;
+}
+
+static bool mt7915_check_he_obss_narrow_bw_ru(struct ieee80211_hw *hw,
+					      struct ieee80211_vif *vif)
+{
+	struct mt7915_he_obss_narrow_bw_ru_data iter_data = {
+		.tolerated = true,
+	};
+
+	if (!(vif->bss_conf.chandef.chan->flags & IEEE80211_CHAN_RADAR))
+		return false;
+
+	cfg80211_bss_iter(hw->wiphy, &vif->bss_conf.chandef,
+			  mt7915_check_he_obss_narrow_bw_ru_iter,
+			  &iter_data);
+
+	/*
+	 * If there is at least one AP on radar channel that cannot
+	 * tolerate 26-tone RU UL OFDMA transmissions using HE TB PPDU.
+	 */
+	return !iter_data.tolerated;
+}
+
 static void
 mt7915_mcu_bss_rfch_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
 			struct mt7915_phy *phy)
@@ -768,7 +809,20 @@ mt7915_mcu_bss_rfch_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
 		ch->center_ch1 = ieee80211_frequency_to_channel(freq2);
 	}
 
-	ch->he_all_disable = true;
+	if (vif->bss_conf.he_support && vif->type == NL80211_IFTYPE_STATION) {
+		struct mt7915_dev *dev = phy->dev;
+		struct mt76_phy *mphy = &dev->mt76.phy;
+		bool ext_phy = phy != &dev->phy;
+
+		if (ext_phy && dev->mt76.phy2)
+			mphy = dev->mt76.phy2;
+
+		ch->he_ru26_block =
+			mt7915_check_he_obss_narrow_bw_ru(mphy->hw, vif);
+		ch->he_all_disable = false;
+	} else {
+		ch->he_all_disable = true;
+	}
 }
 
 static void
@@ -797,6 +851,36 @@ mt7915_mcu_bss_ra_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
 	ra->fast_interval = cpu_to_le32(100);
 }
 
+static void
+mt7915_mcu_bss_he_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
+		      struct mt7915_phy *phy)
+{
+#define DEFAULT_HE_PE_DURATION		4
+#define DEFAULT_HE_DURATION_RTS_THRES	1023
+	struct cfg80211_chan_def *chandef = &phy->mt76->chandef;
+	enum nl80211_band band = chandef->chan->band;
+	struct ieee80211_sta_he_cap *cap;
+	struct bss_info_he *he;
+	struct tlv *tlv;
+
+	cap = &phy->dev->iftype[band][vif->type].he_cap;
+
+	tlv = mt7915_mcu_add_tlv(skb, BSS_INFO_HE_BASIC, sizeof(*he));
+
+	he = (struct bss_info_he *)tlv;
+	he->he_pe_duration = vif->bss_conf.htc_trig_based_pkt_ext * 4;
+	if (!he->he_pe_duration)
+		he->he_pe_duration = DEFAULT_HE_PE_DURATION;
+
+	he->he_rts_thres = cpu_to_le16(vif->bss_conf.frame_time_rts_th * 32);
+	if (!he->he_rts_thres)
+		he->he_rts_thres = cpu_to_le16(DEFAULT_HE_DURATION_RTS_THRES);
+
+	he->max_nss_mcs[CMD_HE_MCS_BW80] = cap->he_mcs_nss_supp.tx_mcs_80;
+	he->max_nss_mcs[CMD_HE_MCS_BW160] = cap->he_mcs_nss_supp.tx_mcs_160;
+	he->max_nss_mcs[CMD_HE_MCS_BW8080] = cap->he_mcs_nss_supp.tx_mcs_80p80;
+}
+
 static void
 mt7915_mcu_bss_hw_amsdu_tlv(struct sk_buff *skb)
 {
@@ -889,6 +973,9 @@ int mt7915_mcu_add_bss_info(struct mt7915_phy *phy,
 		mt7915_mcu_bss_bmc_tlv(skb, phy);
 		mt7915_mcu_bss_ra_tlv(skb, vif, phy);
 
+		if (vif->bss_conf.he_support)
+			mt7915_mcu_bss_he_tlv(skb, vif, phy);
+
 		if (phy->dev->hw_tx_amsdu)
 			mt7915_mcu_bss_hw_amsdu_tlv(skb);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index 0563e9321175..b2f37b87117c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -396,6 +396,17 @@ struct bss_info_ra {
 	__le32 fast_interval;
 } __packed;
 
+
+struct bss_info_he {
+	__le16 tag;
+	__le16 len;
+	u8 he_pe_duration;
+	u8 vht_op_info_present;
+	__le16 he_rts_thres;
+	__le16 max_nss_mcs[CMD_HE_MCS_BW_NUM];
+	u8 rsv[6];
+} __packed;
+
 struct bss_info_hw_amsdu {
 	__le16 tag;
 	__le16 len;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
