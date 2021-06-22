Return-Path: <SRS0=xI6Y=LQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96C72C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 17:36:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5943361108
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 17:36:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5943361108
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N42IRDeo6+9q+HmmHIoMDsxLsNOvDS85x5S09yUKoG0=; b=jpvxkiXBRaPJbc
	3c8AcoHtad0la/UnqpHjy+5/AnbfiydnrARFCUSybqAqS3lmgX0x6roy9pbqIGqM13k71EvJpkqw4
	1UF3n6KKLGVjtnHaxXijnyeM+CWkha5UIY8PGRNzwOvczBxrbPlI1AQCmSjh6JKs1hz4Hh9zzXzDu
	jtXXPlz8n/FHqmRBJuBx7mxTo5sQLptMRSm28XArwUiHgj5s/UJpHpnHh7thuOV71KYd1+VscD1Ut
	SU4FtIdt4EuPvjcT3fe0OGs9iaMhg/SPhsKphAJInL7LVfT3nCfNH3HOaxdu29MxQO9X6YnKj/Ssk
	beHgNkPfbnT2Fo4GdBRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvkJc-00847o-HS; Tue, 22 Jun 2021 17:36:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvkJY-00846G-7u
 for linux-mediatek@lists.infradead.org; Tue, 22 Jun 2021 17:35:59 +0000
X-UUID: 1ffef5341f8e4fbcb4d9bbb273deb747-20210622
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=34agn++iu+CVghtLTSDKfF4NDpSbSV3T480Xq6bLOgg=; 
 b=XLIRZm8ydDJkXbTfZu3QQIwHARRBn7brNcKRwu4uvagJr59GO+aaKJLSXNz28pZXaiONHvs9hbODY4IX6bnnMb/BbG+d8k+BSEsku5FTrqgq7YQApXOdgZMt2k1FweVzwD0F+US2UnqOMjfmhfJHH5uBNanwAEdAEoF/++elMGg=;
X-UUID: 1ffef5341f8e4fbcb4d9bbb273deb747-20210622
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 856433731; Tue, 22 Jun 2021 10:35:50 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Jun 2021 10:35:43 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 01:35:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 23 Jun 2021 01:35:41 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>
Subject: [PATCH] mt76: mt7915: report HE MU radiotap
Date: Wed, 23 Jun 2021 01:35:39 +0800
Message-ID: <5817c4efc0d8cfee10d5090f170f641458db282b.1624344033.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_103557_764859_822D1D8C 
X-CRM114-Status: GOOD (  12.49  )
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

Report HE MU/BF radiotap.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mac.c   | 66 +++++++++++++++----
 .../net/wireless/mediatek/mt76/mt7915/mac.h   |  8 +++
 2 files changed, 63 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 2462704094b0..47f042313341 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -228,12 +228,54 @@ mt7915_mac_decode_he_radiotap_ru(struct mt76_rx_status *status,
 				      IEEE80211_RADIOTAP_HE_DATA2_RU_OFFSET);
 }
 
+static void
+mt7915_mac_decode_he_mu_radiotap(struct sk_buff *skb,
+				 struct mt76_rx_status *status,
+				 __le32 *rxv)
+{
+	static const struct ieee80211_radiotap_he_mu mu_known = {
+		.flags1 = HE_BITS(MU_FLAGS1_SIG_B_MCS_KNOWN) |
+			  HE_BITS(MU_FLAGS1_SIG_B_DCM_KNOWN) |
+			  HE_BITS(MU_FLAGS1_CH1_RU_KNOWN) |
+			  HE_BITS(MU_FLAGS1_SIG_B_SYMS_USERS_KNOWN),
+		.flags2 = HE_BITS(MU_FLAGS2_BW_FROM_SIG_A_BW_KNOWN),
+	};
+	struct ieee80211_radiotap_he_mu *he_mu = NULL;
+
+	he_mu = skb_push(skb, sizeof(mu_known));
+	memcpy(he_mu, &mu_known, sizeof(mu_known));
+
+#define MU_PREP(f, v)	le16_encode_bits(v, IEEE80211_RADIOTAP_HE_MU_##f)
+
+	he_mu->flags1 |= MU_PREP(FLAGS1_SIG_B_MCS, status->rate_idx);
+	if (status->he_dcm)
+		he_mu->flags1 |= MU_PREP(FLAGS1_SIG_B_DCM, status->he_dcm);
+
+	he_mu->flags2 |= MU_PREP(FLAGS2_BW_FROM_SIG_A_BW, status->bw) |
+			 MU_PREP(FLAGS2_SIG_B_SYMS_USERS,
+				 le32_get_bits(rxv[2], MT_CRXV_HE_NUM_USER));
+
+	he_mu->ru_ch1[0] = FIELD_GET(MT_CRXV_HE_RU0, cpu_to_le32(rxv[3]));
+
+	if (status->bw >= RATE_INFO_BW_40) {
+		he_mu->flags1 |= HE_BITS(MU_FLAGS1_CH2_RU_KNOWN);
+		he_mu->ru_ch2[0] =
+			FIELD_GET(MT_CRXV_HE_RU1, cpu_to_le32(rxv[3]));
+	}
+
+	if (status->bw >= RATE_INFO_BW_80) {
+		he_mu->ru_ch1[1] =
+			FIELD_GET(MT_CRXV_HE_RU2, cpu_to_le32(rxv[3]));
+		he_mu->ru_ch2[1] =
+			FIELD_GET(MT_CRXV_HE_RU3, cpu_to_le32(rxv[3]));
+	}
+}
+
 static void
 mt7915_mac_decode_he_radiotap(struct sk_buff *skb,
 			      struct mt76_rx_status *status,
 			      __le32 *rxv, u32 phy)
 {
-	/* TODO: struct ieee80211_radiotap_he_mu */
 	static const struct ieee80211_radiotap_he known = {
 		.data1 = HE_BITS(DATA1_DATA_MCS_KNOWN) |
 			 HE_BITS(DATA1_DATA_DCM_KNOWN) |
@@ -241,6 +283,7 @@ mt7915_mac_decode_he_radiotap(struct sk_buff *skb,
 			 HE_BITS(DATA1_CODING_KNOWN) |
 			 HE_BITS(DATA1_LDPC_XSYMSEG_KNOWN) |
 			 HE_BITS(DATA1_DOPPLER_KNOWN) |
+			 HE_BITS(DATA1_SPTL_REUSE_KNOWN) |
 			 HE_BITS(DATA1_BSS_COLOR_KNOWN),
 		.data2 = HE_BITS(DATA2_GI_KNOWN) |
 			 HE_BITS(DATA2_TXBF_KNOWN) |
@@ -255,9 +298,12 @@ mt7915_mac_decode_he_radiotap(struct sk_buff *skb,
 
 	he->data3 = HE_PREP(DATA3_BSS_COLOR, BSS_COLOR, rxv[14]) |
 		    HE_PREP(DATA3_LDPC_XSYMSEG, LDPC_EXT_SYM, rxv[2]);
+	he->data4 = HE_PREP(DATA4_SU_MU_SPTL_REUSE, SR_MASK, rxv[11]);
 	he->data5 = HE_PREP(DATA5_PE_DISAMBIG, PE_DISAMBIG, rxv[2]) |
 		    le16_encode_bits(ltf_size,
 				     IEEE80211_RADIOTAP_HE_DATA5_LTF_SIZE);
+	if (cpu_to_le32(rxv[0]) & MT_PRXV_TXBF)
+		he->data5 |= HE_BITS(DATA5_TXBF);
 	he->data6 = HE_PREP(DATA6_TXOP, TXOP_DUR, rxv[14]) |
 		    HE_PREP(DATA6_DOPPLER, DOPPLER, rxv[14]);
 
@@ -265,12 +311,10 @@ mt7915_mac_decode_he_radiotap(struct sk_buff *skb,
 	case MT_PHY_TYPE_HE_SU:
 		he->data1 |= HE_BITS(DATA1_FORMAT_SU) |
 			     HE_BITS(DATA1_UL_DL_KNOWN) |
-			     HE_BITS(DATA1_BEAM_CHANGE_KNOWN) |
-			     HE_BITS(DATA1_SPTL_REUSE_KNOWN);
+			     HE_BITS(DATA1_BEAM_CHANGE_KNOWN);
 
 		he->data3 |= HE_PREP(DATA3_BEAM_CHANGE, BEAM_CHNG, rxv[14]) |
 			     HE_PREP(DATA3_UL_DL, UPLINK, rxv[2]);
-		he->data4 |= HE_PREP(DATA4_SU_MU_SPTL_REUSE, SR_MASK, rxv[11]);
 		break;
 	case MT_PHY_TYPE_HE_EXT_SU:
 		he->data1 |= HE_BITS(DATA1_FORMAT_EXT_SU) |
@@ -280,23 +324,20 @@ mt7915_mac_decode_he_radiotap(struct sk_buff *skb,
 		break;
 	case MT_PHY_TYPE_HE_MU:
 		he->data1 |= HE_BITS(DATA1_FORMAT_MU) |
-			     HE_BITS(DATA1_UL_DL_KNOWN) |
-			     HE_BITS(DATA1_SPTL_REUSE_KNOWN);
+			     HE_BITS(DATA1_UL_DL_KNOWN);
 
 		he->data3 |= HE_PREP(DATA3_UL_DL, UPLINK, rxv[2]);
-		he->data4 |= HE_PREP(DATA4_SU_MU_SPTL_REUSE, SR_MASK, rxv[11]);
+		he->data4 |= HE_PREP(DATA4_MU_STA_ID, MU_AID, rxv[7]);
 
 		mt7915_mac_decode_he_radiotap_ru(status, he, rxv);
 		break;
 	case MT_PHY_TYPE_HE_TB:
 		he->data1 |= HE_BITS(DATA1_FORMAT_TRIG) |
-			     HE_BITS(DATA1_SPTL_REUSE_KNOWN) |
 			     HE_BITS(DATA1_SPTL_REUSE2_KNOWN) |
 			     HE_BITS(DATA1_SPTL_REUSE3_KNOWN) |
 			     HE_BITS(DATA1_SPTL_REUSE4_KNOWN);
 
-		he->data4 |= HE_PREP(DATA4_TB_SPTL_REUSE1, SR_MASK, rxv[11]) |
-			     HE_PREP(DATA4_TB_SPTL_REUSE2, SR1_MASK, rxv[11]) |
+		he->data4 |= HE_PREP(DATA4_TB_SPTL_REUSE2, SR1_MASK, rxv[11]) |
 			     HE_PREP(DATA4_TB_SPTL_REUSE3, SR2_MASK, rxv[11]) |
 			     HE_PREP(DATA4_TB_SPTL_REUSE4, SR3_MASK, rxv[11]);
 
@@ -610,8 +651,11 @@ mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb)
 		status->flag |= RX_FLAG_8023;
 	}
 
-	if (rxv && status->flag & RX_FLAG_RADIOTAP_HE)
+	if (rxv && status->flag & RX_FLAG_RADIOTAP_HE) {
 		mt7915_mac_decode_he_radiotap(skb, status, rxv, mode);
+		if (status->flag & RX_FLAG_RADIOTAP_HE_MU)
+			mt7915_mac_decode_he_mu_radiotap(skb, status, rxv);
+	}
 
 	if (!status->wcid || !ieee80211_is_data_qos(fc))
 		return 0;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.h b/drivers/net/wireless/mediatek/mt76/mt7915/mac.h
index eb1885f4bd8e..ccce994dc07a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.h
@@ -117,6 +117,7 @@ enum rx_pkt_type {
 #define MT_PRXV_TX_DCM			BIT(4)
 #define MT_PRXV_TX_ER_SU_106T		BIT(5)
 #define MT_PRXV_NSTS			GENMASK(9, 7)
+#define MT_PRXV_TXBF			BIT(10)
 #define MT_PRXV_HT_AD_CODE		BIT(11)
 #define MT_PRXV_HE_RU_ALLOC_L		GENMASK(31, 28)
 #define MT_PRXV_HE_RU_ALLOC_H		GENMASK(3, 0)
@@ -133,7 +134,14 @@ enum rx_pkt_type {
 #define MT_CRXV_HE_LTF_SIZE		GENMASK(18, 17)
 #define MT_CRXV_HE_LDPC_EXT_SYM		BIT(20)
 #define MT_CRXV_HE_PE_DISAMBIG		BIT(23)
+#define MT_CRXV_HE_NUM_USER		GENMASK(30, 24)
 #define MT_CRXV_HE_UPLINK		BIT(31)
+#define MT_CRXV_HE_RU0			GENMASK(7, 0)
+#define MT_CRXV_HE_RU1			GENMASK(15, 8)
+#define MT_CRXV_HE_RU2			GENMASK(23, 16)
+#define MT_CRXV_HE_RU3			GENMASK(31, 24)
+
+#define MT_CRXV_HE_MU_AID		GENMASK(30, 20)
 
 #define MT_CRXV_HE_SR_MASK		GENMASK(11, 8)
 #define MT_CRXV_HE_SR1_MASK		GENMASK(16, 12)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
