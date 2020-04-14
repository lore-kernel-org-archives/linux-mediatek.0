Return-Path: <SRS0=jJra=56=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4B10C2BB85
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 21:11:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82BBD2076A
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 21:11:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="orPk4kcW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="geLvcKpo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82BBD2076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=otdI5LDln2S5SWgVeJgXyEs6VV5l83m+djRkqajKOtY=; b=orPk4kcW5Vrd5L
	aCI2R8eWq0L3rNh609s6tGrFOw9VSJE4gOG2ufrKEepo4Y536jecfWi6KbFu14rygP/QaRGuLhGjd
	nOGZYguiJkOakTkp9G+hiMJmoA9L3TwhjFvSSNHBgHO4s4JW4GcctetOxwosPbKf3ii+heaufu0S9
	lgcBAnou83PvihMbPxVuDwdpxkUaXgX/NJQqY1btsXnfaRScTDo26kAqZvIcmE/rd68QCn2uI7BRK
	dkqDj9bNHreAQtAm/ugQ++1q4bAUeAtMX2l7jHeVxIRRAjgRktlg8qAfaT7bXUc+6WzVohEDZhrtA
	gsjsmG+vZ+MQcG6xA0hA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOSqP-0005NL-DW; Tue, 14 Apr 2020 21:11:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOSqK-0005Gb-K5
 for linux-mediatek@lists.infradead.org; Tue, 14 Apr 2020 21:11:42 +0000
X-UUID: f8dbd82597ec438b9d70f0581b946ba2-20200414
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=k6fjzf105fWosg5DgomFcxjxRaoxLb88SqarVCvmspw=; 
 b=geLvcKpoIEZnHzsYHQPe3KuUxkkPpCasEH3gvVxo22uZXKSohfd6ZXuSA6gpQ76Y+f2NbVjZBHniTm3jwhZSR9BbyDq+EAxIdG61c9qN8QEEjoSM/52Y6mWE/4K1ScCtbmAh2brnTiyQ34eQ91MwPmQlV6NEuVkBHzAQVwDSwik=;
X-UUID: f8dbd82597ec438b9d70f0581b946ba2-20200414
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 375630124; Tue, 14 Apr 2020 13:11:35 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Apr 2020 14:01:29 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 15 Apr 2020 05:01:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 15 Apr 2020 05:01:29 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v2 10/18] mt76: mt7915: add HE bss_conf support for interfaces
Date: Wed, 15 Apr 2020 05:01:08 +0800
Message-ID: <07a67d83660b21f225c085f031ef413626b013a1.1586895593.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1586895593.git.ryder.lee@mediatek.com>
References: <cover.1586895593.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_141140_664066_B179C272 
X-CRM114-Status: GOOD (  11.72  )
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
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 95 ++++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   | 10 ++
 2 files changed, 104 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 239cbc0a2ee9..7831d4f700d0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -744,6 +744,47 @@ mt7915_mcu_bss_omac_tlv(struct sk_buff *skb, struct ieee80211_vif *vif)
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
@@ -766,7 +807,20 @@ mt7915_mcu_bss_rfch_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
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
@@ -795,6 +849,42 @@ mt7915_mcu_bss_ra_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
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
+	struct ieee80211_supported_band *sband;
+	const struct ieee80211_sta_he_cap *cap;
+	struct bss_info_he *he;
+	struct tlv *tlv;
+
+	if (band == NL80211_BAND_2GHZ)
+		sband = &phy->mt76->sband_2g.sband;
+	else
+		sband = &phy->mt76->sband_5g.sband;
+
+	cap = ieee80211_get_he_iftype_cap(sband, vif->type);
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
 mt7915_mcu_bss_ext_tlv(struct sk_buff *skb, struct mt7915_vif *mvif)
 {
@@ -870,6 +960,9 @@ int mt7915_mcu_add_bss_info(struct mt7915_phy *phy,
 		mt7915_mcu_bss_bmc_tlv(skb, phy);
 		mt7915_mcu_bss_ra_tlv(skb, vif, phy);
 
+		if (vif->bss_conf.he_support)
+			mt7915_mcu_bss_he_tlv(skb, vif, phy);
+
 		if (mvif->omac_idx > HW_BSSID_MAX)
 			mt7915_mcu_bss_ext_tlv(skb, mvif);
 		else
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index c71161aec767..85ef1b35b265 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -396,6 +396,16 @@ struct bss_info_ra {
 	__le32 fast_interval;
 } __packed;
 
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
 struct bss_info_bcn {
 	__le16 tag;
 	__le16 len;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
