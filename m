Return-Path: <SRS0=cCBG=6I=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BBE5C54FD0
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Apr 2020 19:33:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 596262098B
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Apr 2020 19:33:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D4BT1cOE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="PItxsjAY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 596262098B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DJFXdU/IrJXef5dczG0ze0CQ976QjkHiJLxpjuyd8dM=; b=D4BT1cOE+xSbtg
	gK+NPskRnoIUT8/wwmafBDtMxoxaK1RU2L6luFyCFL14L0GG4auMv4E7Ewslp3Ybxcgo28CHebzTe
	dydLkzKrtsfY+pJXj0ahBmvIjJZPn4zVUKttM1RztE/ZmwPlr8fRBUdWftSXhgJVW4GYBE70y/ZAi
	0O1eOXGYe+2JM4l4GbYwFajKdaGmLAZSjbkH8dxoZ9Og0HwE3MGoezRLlqtitrG/DY3D5/kERvuZ/
	EukybOX58q80zAAVNL6Eqks6S5N4KHY1gMdJpjzDhoJKrIZGYY31URJhBrZT8cQpRwFhjuOwZbcFC
	+y6HlJzrISe3A+o8f6VA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jS44Q-0007kU-PN; Fri, 24 Apr 2020 19:33:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jS44N-0007iy-Kh
 for linux-mediatek@lists.infradead.org; Fri, 24 Apr 2020 19:33:05 +0000
X-UUID: 541cbb71983b4b2b9843b12ff8f55325-20200424
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=chXuOrwHh5hYrsCOMs+Oan8lRNozBmmkY4JoEsM4Cmg=; 
 b=PItxsjAYTvGXsfQjeh0CsRsC0CIFLPSOwIBQmb5SuWZofNZ8s9LTUFMvhvTUTmL50eOTl5MTU+u82xFIfcWe/sdtUMbiHJY2QTFWGGLdW7gQUhGbFUGOx1mSKmbD6EmVgz8xR/dQ68oOmVrMcdwTUDhKNIxH6g2Q1EwWhWVn8/I=;
X-UUID: 541cbb71983b4b2b9843b12ff8f55325-20200424
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 861475035; Fri, 24 Apr 2020 11:32:56 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Apr 2020 12:32:51 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 25 Apr 2020 03:32:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 25 Apr 2020 03:32:52 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v3 10/18] mt76: mt7915: add HE bss_conf support for interfaces
Date: Sat, 25 Apr 2020 03:32:31 +0800
Message-ID: <d76cc93695f34487ef209d9ae7973c30331bb16b.1587756404.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1587756404.git.ryder.lee@mediatek.com>
References: <cover.1587756404.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6BC6014C5866F70415E6ED55340AF1DD1B7BDE26DDB44987FC4D0214266596552000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200424_123303_687747_EF8286D7 
X-CRM114-Status: GOOD (  11.49  )
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
index 47c0ff8f41bf..61bab6bdcea0 100644
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
