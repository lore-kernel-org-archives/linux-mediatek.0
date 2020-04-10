Return-Path: <SRS0=hvzu=52=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 135D3C2BB55
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 23:02:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2EB22084D
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 23:02:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VnNK5g1X";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZR2qfrFa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2EB22084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=npks8sLoaRKxi/uLooWzhPTfFEqJTwhDhqIiYIpHCIw=; b=VnNK5g1XfHLQAU
	tZit+bI7l7/RPBtn0Xm2vgOfTKePzvT8Rp+z4I1LuZgJAsHhFlG/LexlZMqY2uX6u/5vXi6Fx9vPR
	srXQvyXhZJx+11zleJeyt+aCDM40sUXFl9otV23Xn2OkBhUAQQngFdmIlVyguEbvthQIO/8lJZNwk
	vT6kCwxlBSrFnW2TySGnluWtlFKP1nOD/VL1VdwvFbJTc0MwxUuan2GBudfgg+1PbxKAqZZIW49ks
	+HlamkTYFvcQoxZQfz409AJbRIm8I8Z6yOFEy3owlLjkF6yD9XEtH0TjrGeJ/+iNAyyQgum/SIkT4
	L3SfL3uzyUVQkHTENoxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jN2f3-0000Qc-CI; Fri, 10 Apr 2020 23:02:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jN2ev-0000Ct-7Z
 for linux-mediatek@lists.infradead.org; Fri, 10 Apr 2020 23:02:03 +0000
X-UUID: 19a574a36d2a4d4a8a239bbb6f3c114a-20200410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=kMviKavCOsX8gur5c7tWf2U+ehF2WKXNYxhd1Xqcm0A=; 
 b=ZR2qfrFat5ZEicFvh7qQz5Z3DotiA3WPvrk/9KKIw+gooTI11V0TDg9O7KACOENMTIPVCXc6BB04p3nhjR5Tvu79ZASP4v/oiAaX3MWYTppHvx/CMm9U84C3Pv4A3r4xj30rfYYiuZHOmnObvuDY8KDJkeI5TJ+kuKP6MxYdFXY=;
X-UUID: 19a574a36d2a4d4a8a239bbb6f3c114a-20200410
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1615693918; Fri, 10 Apr 2020 15:01:58 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Apr 2020 15:51:57 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 11 Apr 2020 06:51:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 11 Apr 2020 06:51:49 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v1 12/16] mt76: mt7915: add Rx radiotap header support
Date: Sat, 11 Apr 2020 06:51:27 +0800
Message-ID: <5cb6b2d96cb2964bf9212d05e32163231441c8f7.1586558901.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1586558901.git.ryder.lee@mediatek.com>
References: <cover.1586558901.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: E881C99AB818AA54AB80BDFF40CB5E2B3B591743C83968E755C003BE88CD14082000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200410_160201_278294_DBEF6516 
X-CRM114-Status: UNSURE (   9.28  )
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
Cc: YF Luo <yf.luo@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless@vger.kernel.org, Sean
 Wang <sean.wang@mediatek.com>, Chih-Min Chen <chih-min.chen@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Yiwei Chung <yiwei.chung@mediatek.com>,
 linux-mediatek@lists.infradead.org, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mac80211 expects the definition of what HE rate info is available
inside astruct prepended to the skb.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mac.c   | 141 ++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7915/mac.h   |  16 ++
 2 files changed, 157 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index a9efee42dce2..43186673d324 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -9,6 +9,10 @@
 
 #define to_rssi(field, rxv)	((FIELD_GET(field, rxv) - 220) / 2)
 
+#define HE_BITS(f)		cpu_to_le16(IEEE80211_RADIOTAP_HE_##f)
+#define HE_PREP(f, m, v)	le16_encode_bits(le32_get_bits(v, MT_CRXV_HE_##m),\
+						 IEEE80211_RADIOTAP_HE_##f)
+
 static const struct mt7915_dfs_radar_spec etsi_radar_specs = {
 	.pulse_th = { 110, -10, -80, 40, 5200, 128, 5200 },
 	.radar_pattern = {
@@ -172,6 +176,138 @@ void mt7915_mac_sta_poll(struct mt7915_dev *dev)
 	rcu_read_unlock();
 }
 
+static void
+mt7915_mac_decode_he_radiotap_ru(struct mt76_rx_status *status,
+				 struct mt7915_rxv *rxv,
+				 struct ieee80211_radiotap_he *he)
+{
+	u32 ru_h, ru_l;
+	u8 ru, offs = 0;
+
+	ru_l = FIELD_GET(MT_PRXV_HE_RU_ALLOC_L, le32_to_cpu(rxv->v[0]));
+	ru_h = FIELD_GET(MT_PRXV_HE_RU_ALLOC_H, le32_to_cpu(rxv->v[1]));
+	ru = (u8)(ru_l | ru_h << 4);
+
+	status->bw = RATE_INFO_BW_HE_RU;
+
+	switch (ru) {
+	case 0 ... 36:
+		status->he_ru = NL80211_RATE_INFO_HE_RU_ALLOC_26;
+		offs = ru;
+		break;
+	case 37 ... 52:
+		status->he_ru = NL80211_RATE_INFO_HE_RU_ALLOC_52;
+		offs = ru - 37;
+		break;
+	case 53 ... 60:
+		status->he_ru = NL80211_RATE_INFO_HE_RU_ALLOC_106;
+		offs = ru - 53;
+		break;
+	case 61 ... 64:
+		status->he_ru = NL80211_RATE_INFO_HE_RU_ALLOC_242;
+		offs = ru - 61;
+		break;
+	case 65 ... 66:
+		status->he_ru = NL80211_RATE_INFO_HE_RU_ALLOC_484;
+		offs = ru - 65;
+		break;
+	case 67:
+		status->he_ru = NL80211_RATE_INFO_HE_RU_ALLOC_996;
+		break;
+	case 68:
+		status->he_ru = NL80211_RATE_INFO_HE_RU_ALLOC_2x996;
+		break;
+	}
+
+	he->data1 |= HE_BITS(DATA1_BW_RU_ALLOC_KNOWN);
+	he->data2 |= HE_BITS(DATA2_RU_OFFSET_KNOWN) |
+		     le16_encode_bits(offs,
+				      IEEE80211_RADIOTAP_HE_DATA2_RU_OFFSET);
+}
+
+static void
+mt7915_mac_decode_he_radiotap(struct sk_buff *skb,
+			      struct mt76_rx_status *status,
+			      struct mt7915_rxv *rxv)
+{
+	/* TODO: struct ieee80211_radiotap_he_mu */
+	static const struct ieee80211_radiotap_he known = {
+		.data1 = HE_BITS(DATA1_DATA_MCS_KNOWN) |
+			 HE_BITS(DATA1_DATA_DCM_KNOWN) |
+			 HE_BITS(DATA1_STBC_KNOWN) |
+			 HE_BITS(DATA1_CODING_KNOWN),
+		.data2 = HE_BITS(DATA2_GI_KNOWN) |
+			 HE_BITS(DATA2_TXBF_KNOWN),
+	};
+	struct ieee80211_radiotap_he *he = NULL;
+	__le32 v2 = rxv->v[2];
+	__le32 v11 = rxv->v[11];
+	__le32 v14 = rxv->v[14];
+	u32 ltf_size = le32_get_bits(v2, MT_CRXV_HE_LTF_SIZE) + 1;
+
+	he = skb_push(skb, sizeof(known));
+	memcpy(he, &known, sizeof(known));
+
+	he->data1 = HE_BITS(DATA1_LDPC_XSYMSEG_KNOWN) |
+		    HE_BITS(DATA1_DOPPLER_KNOWN) |
+		    HE_BITS(DATA1_BSS_COLOR_KNOWN);
+	he->data2 = HE_BITS(DATA2_PE_DISAMBIG_KNOWN) |
+		    HE_BITS(DATA2_TXOP_KNOWN);
+
+	he->data3 = HE_PREP(DATA3_BSS_COLOR, BSS_COLOR, v14) |
+		    HE_PREP(DATA3_LDPC_XSYMSEG, LDPC_EXT_SYM, v2);
+	he->data5 = HE_PREP(DATA5_PE_DISAMBIG, PE_DISAMBIG, v2) |
+		    le16_encode_bits(ltf_size,
+				     IEEE80211_RADIOTAP_HE_DATA5_LTF_SIZE);
+	he->data6 = HE_PREP(DATA6_TXOP, TXOP_DUR, v14) |
+		    HE_PREP(DATA6_DOPPLER, DOPPLER, v14);
+
+	switch (rxv->phy) {
+	case MT_PHY_TYPE_HE_SU:
+		he->data1 |= HE_BITS(DATA1_FORMAT_SU) |
+			     HE_BITS(DATA1_UL_DL_KNOWN) |
+			     HE_BITS(DATA1_BEAM_CHANGE_KNOWN) |
+			     HE_BITS(DATA1_SPTL_REUSE_KNOWN);
+
+		he->data3 |= HE_PREP(DATA3_BEAM_CHANGE, BEAM_CHNG, v14) |
+			     HE_PREP(DATA3_UL_DL, UPLINK, v2);
+		he->data4 |= HE_PREP(DATA4_SU_MU_SPTL_REUSE, SR_MASK, v11);
+		break;
+	case MT_PHY_TYPE_HE_EXT_SU:
+		he->data1 |= HE_BITS(DATA1_FORMAT_EXT_SU) |
+			     HE_BITS(DATA1_UL_DL_KNOWN);
+
+		he->data3 |= HE_PREP(DATA3_UL_DL, UPLINK, v2);
+		break;
+	case MT_PHY_TYPE_HE_MU:
+		he->data1 |= HE_BITS(DATA1_FORMAT_MU) |
+			     HE_BITS(DATA1_UL_DL_KNOWN) |
+			     HE_BITS(DATA1_SPTL_REUSE_KNOWN);
+
+		he->data3 |= HE_PREP(DATA3_UL_DL, UPLINK, v2);
+		he->data4 |= HE_PREP(DATA4_SU_MU_SPTL_REUSE, SR_MASK, v11);
+
+		mt7915_mac_decode_he_radiotap_ru(status, rxv, he);
+		break;
+	case MT_PHY_TYPE_HE_TB:
+		he->data1 |= HE_BITS(DATA1_FORMAT_TRIG) |
+			     HE_BITS(DATA1_SPTL_REUSE_KNOWN) |
+			     HE_BITS(DATA1_SPTL_REUSE2_KNOWN) |
+			     HE_BITS(DATA1_SPTL_REUSE3_KNOWN) |
+			     HE_BITS(DATA1_SPTL_REUSE4_KNOWN);
+
+		he->data4 = HE_PREP(DATA4_TB_SPTL_REUSE1, SR_MASK, v11) |
+			    HE_PREP(DATA4_TB_SPTL_REUSE2, SR1_MASK, v11) |
+			    HE_PREP(DATA4_TB_SPTL_REUSE3, SR2_MASK, v11) |
+			    HE_PREP(DATA4_TB_SPTL_REUSE4, SR3_MASK, v11);
+
+		mt7915_mac_decode_he_radiotap_ru(status, rxv, he);
+		break;
+	default:
+		break;
+	}
+}
+
 int mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb)
 {
 	struct mt76_rx_status *status = (struct mt76_rx_status *)skb->cb;
@@ -348,6 +484,7 @@ int mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb)
 					return -EINVAL;
 				break;
 			case MT_PHY_TYPE_HE_MU:
+				status->flag |= RX_FLAG_RADIOTAP_HE_MU;
 				/* fall through */
 			case MT_PHY_TYPE_HE_SU:
 			case MT_PHY_TYPE_HE_EXT_SU:
@@ -355,6 +492,7 @@ int mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb)
 				status->nss =
 					FIELD_GET(MT_PRXV_NSTS, rxv.v[0]) + 1;
 				status->encoding = RX_ENC_HE;
+				status->flag |= RX_FLAG_RADIOTAP_HE;
 				i &= GENMASK(3, 0);
 
 				if (gi <= NL80211_RATE_INFO_HE_GI_3_2)
@@ -405,6 +543,9 @@ int mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb)
 		mt76_insert_ccmp_hdr(skb, key_id);
 	}
 
+	if (status->flag & RX_FLAG_RADIOTAP_HE)
+		mt7915_mac_decode_he_radiotap(skb, status, &rxv);
+
 	hdr = mt76_skb_get_hdr(skb);
 	if (!status->wcid || !ieee80211_is_data_qos(hdr->frame_control))
 		return 0;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.h b/drivers/net/wireless/mediatek/mt76/mt7915/mac.h
index 712753484aee..b9bc8b25b031 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.h
@@ -101,6 +101,8 @@ enum rx_pkt_type {
 #define MT_PRXV_TX_ER_SU_106T		BIT(5)
 #define MT_PRXV_NSTS			GENMASK(9, 7)
 #define MT_PRXV_HT_AD_CODE		BIT(11)
+#define MT_PRXV_HE_RU_ALLOC_L		GENMASK(31, 28)
+#define MT_PRXV_HE_RU_ALLOC_H		GENMASK(3, 0)
 #define MT_PRXV_RCPI3			GENMASK(31, 24)
 #define MT_PRXV_RCPI2			GENMASK(23, 16)
 #define MT_PRXV_RCPI1			GENMASK(15, 8)
@@ -111,6 +113,20 @@ enum rx_pkt_type {
 #define MT_CRXV_TX_MODE			GENMASK(7, 4)
 #define MT_CRXV_FRAME_MODE		GENMASK(10, 8)
 #define MT_CRXV_HT_SHORT_GI		GENMASK(14, 13)
+#define MT_CRXV_HE_LTF_SIZE		GENMASK(18, 17)
+#define MT_CRXV_HE_LDPC_EXT_SYM		BIT(20)
+#define MT_CRXV_HE_PE_DISAMBIG		BIT(23)
+#define MT_CRXV_HE_UPLINK		BIT(31)
+
+#define MT_CRXV_HE_SR_MASK		GENMASK(11, 8)
+#define MT_CRXV_HE_SR1_MASK		GENMASK(16, 12)
+#define MT_CRXV_HE_SR2_MASK             GENMASK(20, 17)
+#define MT_CRXV_HE_SR3_MASK             GENMASK(24, 21)
+
+#define MT_CRXV_HE_BSS_COLOR		GENMASK(5, 0)
+#define MT_CRXV_HE_TXOP_DUR		GENMASK(12, 6)
+#define MT_CRXV_HE_BEAM_CHNG		BIT(13)
+#define MT_CRXV_HE_DOPPLER		BIT(16)
 
 struct mt7915_rxv {
 	u32 phy;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
