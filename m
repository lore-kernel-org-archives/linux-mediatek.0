Return-Path: <SRS0=Nu0C=6Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA0DC47255
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 16:07:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6357206E6
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 16:07:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PJvQbxo6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="iSUrKVfH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6357206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hLnunf9OeXDWkhyn4YxORaQ9wOgrs1AIDyhbyQj0RG0=; b=PJvQbxo6Tl/qA+
	4OViaXWjD9LbKIQUT9vmJoSB2KePKGDXEemmelNFtK8NGcZUkkpRpcTtC4+3QH0w0Twp6vm4VwWsa
	3oM1SRDOO2i972cQmoNhRCSLiS+b9V0SRt7xveDDe9U8kQUFgznT33+wNOVYcndMyuz/LeUErqzYt
	OLP2+VMlGUDzeK1ozlSJVFME8mZcXx3ilq3th+5kllG1F3jZas8V21iVUgdIWiWfgiI8DOrl983fW
	yFKQiXgd+igC8R1pUMczmrxm1u/TG4mhndxKaUh/vXkhiRavISQvAdAjxoNLN02jTWggz+Cmxg3LC
	XKeSG487S70OeA7zWCZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYAxR-00058O-Md; Mon, 11 May 2020 16:07:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYAxM-0004x3-4W
 for linux-mediatek@lists.infradead.org; Mon, 11 May 2020 16:07:06 +0000
X-UUID: ee29c34aae624b0590638ddeda14eb9e-20200511
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=on1PuPTRZSxuW8kGOpKZcv+zhk/cDD70hk/j7tGKYkg=; 
 b=iSUrKVfHLhwjcXgeBIXZMvksi01ZQr3mEjrQTj3KM+I+i1Vcdj+SXzytaZMw9RcEaOPYgP/tyhscqp4f7FbB9f4InGnkxPHlAyJpWxy7dz2iU4ucv4j08LjSvwuX25q6MbC3Kiw9C51M65S680h+PFJBwU8N6NzDIzFy+43XBd0=;
X-UUID: ee29c34aae624b0590638ddeda14eb9e-20200511
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1247084942; Mon, 11 May 2020 08:06:26 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 May 2020 09:06:46 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 May 2020 00:06:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 12 May 2020 00:06:40 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH 3/7] mt76: mt7915: add Tx beamformee support
Date: Tue, 12 May 2020 00:06:34 +0800
Message-ID: <d762dec596764fe9697213b239f7596770fc965a.1589212457.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1589212457.git.ryder.lee@mediatek.com>
References: <cover.1589212457.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_090704_246058_F0C25519 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@mediatek.com>,
 linux-wireless@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Enable beamformee support.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Tested-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 54 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   |  9 ++++
 2 files changed, 63 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 58d0adca8b31..52e349b17246 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -67,6 +67,7 @@ struct mt7915_fw_region {
 #define MCU_PATCH_ADDRESS		0x200000
 
 #define MT_STA_BFER			BIT(0)
+#define MT_STA_BFEE			BIT(1)
 
 #define FW_FEATURE_SET_ENCRYPT		BIT(0)
 #define FW_FEATURE_SET_KEY_IDX		GENMASK(2, 1)
@@ -1768,6 +1769,35 @@ mt7915_mcu_sta_bfer_tlv(struct sk_buff *skb, struct ieee80211_sta *sta,
 	}
 }
 
+static void
+mt7915_mcu_sta_bfee_tlv(struct sk_buff *skb, struct ieee80211_sta *sta,
+			struct mt7915_phy *phy)
+{
+	struct sta_rec_bfee *bfee;
+	struct tlv *tlv;
+	int tx_ant = hweight8(phy->chainmask) - 1;
+	u8 nr = 0;
+
+	tlv = mt7915_mcu_add_tlv(skb, STA_REC_BFEE, sizeof(*bfee));
+	bfee = (struct sta_rec_bfee *)tlv;
+
+	if (sta->he_cap.has_he) {
+		struct ieee80211_he_cap_elem *pe = &sta->he_cap.he_cap_elem;
+
+		nr = HE_PHY(CAP5_BEAMFORMEE_NUM_SND_DIM_UNDER_80MHZ_MASK,
+			    pe->phy_cap_info[5]);
+	} else if (sta->vht_cap.vht_supported) {
+		struct ieee80211_sta_vht_cap *pc = &sta->vht_cap;
+
+		nr = FIELD_GET(IEEE80211_VHT_CAP_SOUNDING_DIMENSIONS_MASK,
+			       pc->cap);
+	}
+
+	/* reply with identity matrix to avoid 2x2 BF negative gain */
+	if (nr == 1 && tx_ant == 2)
+		bfee->fb_identity_matrix = true;
+}
+
 static u8
 mt7915_mcu_sta_txbf_type(struct mt7915_phy *phy, struct ieee80211_vif *vif,
 			 struct ieee80211_sta *sta)
@@ -1790,6 +1820,11 @@ mt7915_mcu_sta_txbf_type(struct mt7915_phy *phy, struct ieee80211_vif *vif,
 		vc = mt7915_get_he_phy_cap(phy, vif);
 		ve = &vc->he_cap_elem;
 
+		if ((HE_PHY(CAP3_SU_BEAMFORMER, pe->phy_cap_info[3]) ||
+		     HE_PHY(CAP4_MU_BEAMFORMER, pe->phy_cap_info[4])) &&
+		    HE_PHY(CAP4_SU_BEAMFORMEE, ve->phy_cap_info[4]))
+			type |= MT_STA_BFEE;
+
 		if ((HE_PHY(CAP3_SU_BEAMFORMER, ve->phy_cap_info[3]) ||
 		     HE_PHY(CAP4_MU_BEAMFORMER, ve->phy_cap_info[4])) &&
 		    HE_PHY(CAP4_SU_BEAMFORMEE, pe->phy_cap_info[4]))
@@ -1806,6 +1841,9 @@ mt7915_mcu_sta_txbf_type(struct mt7915_phy *phy, struct ieee80211_vif *vif,
 		ce = IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE |
 		     IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE;
 
+		if ((pc->cap & cr) && (vc->cap & ce))
+			type |= MT_STA_BFEE;
+
 		if ((vc->cap & cr) && (pc->cap & ce))
 			type |= MT_STA_BFER;
 	} else if (sta->ht_cap.ht_supported) {
@@ -1848,6 +1886,22 @@ mt7915_mcu_add_txbf(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 			return r;
 	}
 
+	/* starec bfee */
+	if (type & MT_STA_BFEE) {
+		len = sizeof(struct sta_req_hdr) + sizeof(struct sta_rec_bfee);
+
+		skb = mt7915_mcu_alloc_sta_req(dev, mvif, msta, len);
+		if (IS_ERR(skb))
+			return PTR_ERR(skb);
+
+		mt7915_mcu_sta_bfee_tlv(skb, sta, phy);
+
+		r = __mt76_mcu_skb_send_msg(&dev->mt76, skb,
+					    MCU_EXT_CMD_STA_REC_UPDATE, true);
+		if (r)
+			return r;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index 53d1e1f0cea9..cdeba5a0ef34 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -865,6 +865,14 @@ struct sta_rec_bf {
 	u8 rsv[2];
 } __packed;
 
+struct sta_rec_bfee {
+	__le16 tag;
+	__le16 len;
+	bool fb_identity_matrix;	/* 1: feedback identity matrix */
+	bool ignore_feedback;		/* 1: ignore */
+	u8 rsv[2];
+} __packed;
+
 enum {
 	STA_REC_BASIC,
 	STA_REC_RA,
@@ -886,6 +894,7 @@ enum {
 	STA_REC_KEY_V2,
 	STA_REC_MURU,
 	STA_REC_MUEDCA,
+	STA_REC_BFEE,
 	STA_REC_MAX_NUM
 };
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
