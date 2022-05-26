Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A63C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 May 2022 09:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L1dgHNDXXeLWB4XmaEKoSiH/kt3TKumQ0UXPMWoBIuM=; b=DhfHFY4geJ+XUC
	N99j+Lg7IgXG+Ilug+W371zPeythIKX+WjEjI1MmZBhQ7Fj2gw77F4Gy0HI2mwbuu3I0B1o1iSEpl
	rDmNWAvKXOCgoxc0eBBifvDkosLRCL09WmlL/AOU4AR3kR5MK/0nE/g/onedmkPctVgdGsshAO+hp
	zzXfxkXkNTKWSu3xPkFueqB2V116XQFgzEabJE9CNqrXB2wwJgFFWCMIox9RMCsbEP+88Fv9DB1Rh
	NXgradCa4Stv9ynnlDc8SfOEkheqXON490QfEOEb37U65w4uLUBl55qPN4iaszKScDdIiHGDFjLhD
	KQbbjK33+LEY3YKVsW2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu9eG-00ECNL-2B; Thu, 26 May 2022 09:19:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu9e7-00ECK6-E3
	for linux-mediatek@lists.infradead.org; Thu, 26 May 2022 09:19:09 +0000
X-UUID: 9f1ab3f2960244e2af0e1b69a5f9bb1d-20220526
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:da4f532d-1c7e-487e-81ff-641fa62c5916,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:ef2356b8-3c45-407b-8f66-25095432a27a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 9f1ab3f2960244e2af0e1b69a5f9bb1d-20220526
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1809950968; Thu, 26 May 2022 02:18:59 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 26 May 2022 02:08:57 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 26 May 2022 17:08:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 26 May 2022 17:08:56 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: <linux-wireless@vger.kernel.org>
CC: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
	<lorenzo.bianconi@redhat.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn
 Tsai <evelyn.tsai@mediatek.com>, <linux-mediatek@lists.infradead.org>, Ryder
 Lee <ryder.lee@mediatek.com>
Subject: [PATCH 1/2] mt76: mt7915: add more ethtool stats
Date: Thu, 26 May 2022 17:08:54 +0800
Message-ID: <53fffc4aad9d92f7ae5da7e3e9aa1f59033bb662.1653555432.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <1ef9b892cc93a36b1e62a6dda0e2e0a019f4e5f7.1653555361.git.ryder.lee@mediatek.com>
References: <1ef9b892cc93a36b1e62a6dda0e2e0a019f4e5f7.1653555361.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_021907_544119_4CF0694F 
X-CRM114-Status: GOOD (  11.31  )
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

Add channel time and MAC ready stats.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mac.c   | 52 ++++++++++++++++---
 .../net/wireless/mediatek/mt76/mt7915/main.c  | 14 +++++
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  7 +++
 .../net/wireless/mediatek/mt76/mt7915/regs.h  | 16 +++---
 4 files changed, 73 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 086244d9be76..f59662af3d9d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -2214,7 +2214,8 @@ void mt7915_mac_update_stats(struct mt7915_phy *phy)
 	u32 val;
 
 	cnt = mt76_rr(dev, MT_MIB_SDR3(phy->band_idx));
-	mib->fcs_err_cnt += is_mt7915(&dev->mt76) ? FIELD_GET(MT_MIB_SDR3_FCS_ERR_MASK, cnt) :
+	mib->fcs_err_cnt += is_mt7915(&dev->mt76) ?
+		FIELD_GET(MT_MIB_SDR3_FCS_ERR_MASK, cnt) :
 		FIELD_GET(MT_MIB_SDR3_FCS_ERR_MASK_MT7916, cnt);
 
 	cnt = mt76_rr(dev, MT_MIB_SDR4(phy->band_idx));
@@ -2227,19 +2228,28 @@ void mt7915_mac_update_stats(struct mt7915_phy *phy)
 	mib->channel_idle_cnt += FIELD_GET(MT_MIB_SDR6_CHANNEL_IDL_CNT_MASK, cnt);
 
 	cnt = mt76_rr(dev, MT_MIB_SDR7(phy->band_idx));
-	mib->rx_vector_mismatch_cnt += FIELD_GET(MT_MIB_SDR7_RX_VECTOR_MISMATCH_CNT_MASK, cnt);
+	mib->rx_vector_mismatch_cnt +=
+		FIELD_GET(MT_MIB_SDR7_RX_VECTOR_MISMATCH_CNT_MASK, cnt);
 
 	cnt = mt76_rr(dev, MT_MIB_SDR8(phy->band_idx));
-	mib->rx_delimiter_fail_cnt += FIELD_GET(MT_MIB_SDR8_RX_DELIMITER_FAIL_CNT_MASK, cnt);
+	mib->rx_delimiter_fail_cnt +=
+		FIELD_GET(MT_MIB_SDR8_RX_DELIMITER_FAIL_CNT_MASK, cnt);
+
+	cnt = mt76_rr(dev, MT_MIB_SDR10(phy->band_idx));
+	mib->rx_mrdy_cnt += is_mt7915(&dev->mt76) ?
+		FIELD_GET(MT_MIB_SDR10_MRDY_COUNT_MASK, cnt) :
+		FIELD_GET(MT_MIB_SDR10_MRDY_COUNT_MASK_MT7916, cnt);
 
 	cnt = mt76_rr(dev, MT_MIB_SDR11(phy->band_idx));
-	mib->rx_len_mismatch_cnt += FIELD_GET(MT_MIB_SDR11_RX_LEN_MISMATCH_CNT_MASK, cnt);
+	mib->rx_len_mismatch_cnt +=
+		FIELD_GET(MT_MIB_SDR11_RX_LEN_MISMATCH_CNT_MASK, cnt);
 
 	cnt = mt76_rr(dev, MT_MIB_SDR12(phy->band_idx));
 	mib->tx_ampdu_cnt += cnt;
 
 	cnt = mt76_rr(dev, MT_MIB_SDR13(phy->band_idx));
-	mib->tx_stop_q_empty_cnt += FIELD_GET(MT_MIB_SDR13_TX_STOP_Q_EMPTY_CNT_MASK, cnt);
+	mib->tx_stop_q_empty_cnt +=
+		FIELD_GET(MT_MIB_SDR13_TX_STOP_Q_EMPTY_CNT_MASK, cnt);
 
 	cnt = mt76_rr(dev, MT_MIB_SDR14(phy->band_idx));
 	mib->tx_mpdu_attempts_cnt += is_mt7915(&dev->mt76) ?
@@ -2251,6 +2261,29 @@ void mt7915_mac_update_stats(struct mt7915_phy *phy)
 		FIELD_GET(MT_MIB_SDR15_TX_MPDU_SUCCESS_CNT_MASK, cnt) :
 		FIELD_GET(MT_MIB_SDR15_TX_MPDU_SUCCESS_CNT_MASK_MT7916, cnt);
 
+	cnt = mt76_rr(dev, MT_MIB_SDR16(phy->band_idx));
+	mib->primary_cca_busy_time +=
+		FIELD_GET(MT_MIB_SDR16_PRIMARY_CCA_BUSY_TIME_MASK, cnt);
+
+	cnt = mt76_rr(dev, MT_MIB_SDR17(phy->band_idx));
+	mib->secondary_cca_busy_time +=
+		FIELD_GET(MT_MIB_SDR17_SECONDARY_CCA_BUSY_TIME_MASK, cnt);
+
+	cnt = mt76_rr(dev, MT_MIB_SDR18(phy->band_idx));
+	mib->primary_energy_detect_time +=
+		FIELD_GET(MT_MIB_SDR18_PRIMARY_ENERGY_DETECT_TIME_MASK, cnt);
+
+	cnt = mt76_rr(dev, MT_MIB_SDR19(phy->band_idx));
+	mib->cck_mdrdy_time += FIELD_GET(MT_MIB_SDR19_CCK_MDRDY_TIME_MASK, cnt);
+
+	cnt = mt76_rr(dev, MT_MIB_SDR20(phy->band_idx));
+	mib->ofdm_mdrdy_time +=
+		FIELD_GET(MT_MIB_SDR20_OFDM_VHT_MDRDY_TIME_MASK, cnt);
+
+	cnt = mt76_rr(dev, MT_MIB_SDR21(phy->band_idx));
+	mib->green_mdrdy_time +=
+		FIELD_GET(MT_MIB_SDR21_GREEN_MDRDY_TIME_MASK, cnt);
+
 	cnt = mt76_rr(dev, MT_MIB_SDR22(phy->band_idx));
 	mib->rx_ampdu_cnt += cnt;
 
@@ -2266,10 +2299,12 @@ void mt7915_mac_update_stats(struct mt7915_phy *phy)
 	mib->rx_ampdu_valid_subframe_bytes_cnt += cnt;
 
 	cnt = mt76_rr(dev, MT_MIB_SDR27(phy->band_idx));
-	mib->tx_rwp_fail_cnt += FIELD_GET(MT_MIB_SDR27_TX_RWP_FAIL_CNT_MASK, cnt);
+	mib->tx_rwp_fail_cnt +=
+		FIELD_GET(MT_MIB_SDR27_TX_RWP_FAIL_CNT_MASK, cnt);
 
 	cnt = mt76_rr(dev, MT_MIB_SDR28(phy->band_idx));
-	mib->tx_rwp_need_cnt += FIELD_GET(MT_MIB_SDR28_TX_RWP_NEED_CNT_MASK, cnt);
+	mib->tx_rwp_need_cnt +=
+		FIELD_GET(MT_MIB_SDR28_TX_RWP_NEED_CNT_MASK, cnt);
 
 	cnt = mt76_rr(dev, MT_MIB_SDR29(phy->band_idx));
 	mib->rx_pfdrop_cnt += is_mt7915(&dev->mt76) ?
@@ -2311,7 +2346,8 @@ void mt7915_mac_update_stats(struct mt7915_phy *phy)
 	if (is_mt7915(&dev->mt76)) {
 		for (i = 0, aggr1 = aggr0 + 4; i < 4; i++) {
 			val = mt76_rr(dev, MT_MIB_MB_SDR1(phy->band_idx, (i << 4)));
-			mib->ba_miss_cnt += FIELD_GET(MT_MIB_BA_MISS_COUNT_MASK, val);
+			mib->ba_miss_cnt +=
+				FIELD_GET(MT_MIB_BA_MISS_COUNT_MASK, val);
 			mib->ack_fail_cnt +=
 				FIELD_GET(MT_MIB_ACK_FAIL_COUNT_MASK, val);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 710ca757fb52..793498175372 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -1146,8 +1146,15 @@ static const char mt7915_gstrings_stats[][ETH_GSTRING_LEN] = {
 	"rx_fifo_full_cnt",
 	"rx_mpdu_cnt",
 	"channel_idle_cnt",
+	"primary_cca_busy_time",
+	"secondary_cca_busy_time",
+	"primary_energy_detect_time",
+	"cck_mdrdy_time",
+	"ofdm_mdrdy_time",
+	"green_mdrdy_time",
 	"rx_vector_mismatch_cnt",
 	"rx_delimiter_fail_cnt",
+	"rx_mrdy_cnt",
 	"rx_len_mismatch_cnt",
 	"rx_ampdu_cnt",
 	"rx_ampdu_bytes_cnt",
@@ -1287,8 +1294,15 @@ void mt7915_get_et_stats(struct ieee80211_hw *hw,
 	data[ei++] = mib->rx_fifo_full_cnt;
 	data[ei++] = mib->rx_mpdu_cnt;
 	data[ei++] = mib->channel_idle_cnt;
+	data[ei++] = mib->primary_cca_busy_time;
+	data[ei++] = mib->secondary_cca_busy_time;
+	data[ei++] = mib->primary_energy_detect_time;
+	data[ei++] = mib->cck_mdrdy_time;
+	data[ei++] = mib->ofdm_mdrdy_time;
+	data[ei++] = mib->green_mdrdy_time;
 	data[ei++] = mib->rx_vector_mismatch_cnt;
 	data[ei++] = mib->rx_delimiter_fail_cnt;
+	data[ei++] = mib->rx_mrdy_cnt;
 	data[ei++] = mib->rx_len_mismatch_cnt;
 	data[ei++] = mib->rx_ampdu_cnt;
 	data[ei++] = mib->rx_ampdu_bytes_cnt;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 4dcae6991669..bd985e6ce36a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -200,8 +200,15 @@ struct mib_stats {
 	/* rx stats */
 	u32 rx_fifo_full_cnt;
 	u32 channel_idle_cnt;
+	u32 primary_cca_busy_time;
+	u32 secondary_cca_busy_time;
+	u32 primary_energy_detect_time;
+	u32 cck_mdrdy_time;
+	u32 ofdm_mdrdy_time;
+	u32 green_mdrdy_time;
 	u32 rx_vector_mismatch_cnt;
 	u32 rx_delimiter_fail_cnt;
+	u32 rx_mrdy_cnt;
 	u32 rx_len_mismatch_cnt;
 	u32 rx_mpdu_cnt;
 	u32 rx_ampdu_cnt;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
index 4953be208c5e..77fd448beed7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
@@ -305,7 +305,7 @@ enum offs_rev {
 #define MT_MIB_SDR9_DNR(_band)		MT_WF_MIB(_band, __OFFS(MIB_SDR9))
 #define MT_MIB_SDR9_CCA_BUSY_TIME_MASK		GENMASK(23, 0)
 
-#define MT_MIB_SDR10_DNR(_band)		MT_WF_MIB(_band, __OFFS(MIB_SDR10))
+#define MT_MIB_SDR10(_band)		MT_WF_MIB(_band, __OFFS(MIB_SDR10))
 #define MT_MIB_SDR10_MRDY_COUNT_MASK		GENMASK(25, 0)
 #define MT_MIB_SDR10_MRDY_COUNT_MASK_MT7916	GENMASK(31, 0)
 
@@ -329,24 +329,24 @@ enum offs_rev {
 #define MT_MIB_SDR15_TX_MPDU_SUCCESS_CNT_MASK_MT7916	GENMASK(31, 0)
 
 /* in units of 'us' */
-#define MT_MIB_SDR16_DNR(_band)		MT_WF_MIB(_band, __OFFS(MIB_SDR16))
+#define MT_MIB_SDR16(_band)		MT_WF_MIB(_band, __OFFS(MIB_SDR16))
 #define MT_MIB_SDR16_PRIMARY_CCA_BUSY_TIME_MASK	GENMASK(23, 0)
 
-#define MT_MIB_SDR17_DNR(_band)		MT_WF_MIB(_band, __OFFS(MIB_SDR17))
+#define MT_MIB_SDR17(_band)		MT_WF_MIB(_band, __OFFS(MIB_SDR17))
 #define MT_MIB_SDR17_SECONDARY_CCA_BUSY_TIME_MASK	GENMASK(23, 0)
 
 #define MT_MIB_SDR18(_band)		MT_WF_MIB(_band, __OFFS(MIB_SDR18))
 #define MT_MIB_SDR18_PRIMARY_ENERGY_DETECT_TIME_MASK	GENMASK(23, 0)
 
 /* units are us */
-#define MT_MIB_SDR19_DNR(_band)		MT_WF_MIB(_band, __OFFS(MIB_SDR19))
+#define MT_MIB_SDR19(_band)		MT_WF_MIB(_band, __OFFS(MIB_SDR19))
 #define MT_MIB_SDR19_CCK_MDRDY_TIME_MASK	GENMASK(23, 0)
 
-#define MT_MIB_SDR20_DNR(_band)		MT_WF_MIB(_band, __OFFS(MIB_SDR20))
+#define MT_MIB_SDR20(_band)		MT_WF_MIB(_band, __OFFS(MIB_SDR20))
 #define MT_MIB_SDR20_OFDM_VHT_MDRDY_TIME_MASK	GENMASK(23, 0)
 
-#define MT_MIB_SDR21_DNR(_band)		MT_WF_MIB(_band, __OFFS(MIB_SDR21))
-#define MT_MIB_SDR20_GREEN_MDRDY_TIME_MASK	GENMASK(23, 0)
+#define MT_MIB_SDR21(_band)		MT_WF_MIB(_band, __OFFS(MIB_SDR21))
+#define MT_MIB_SDR21_GREEN_MDRDY_TIME_MASK	GENMASK(23, 0)
 
 /* rx ampdu count, 32-bit */
 #define MT_MIB_SDR22(_band)		MT_WF_MIB(_band, __OFFS(MIB_SDR22))
@@ -940,7 +940,7 @@ enum offs_rev {
 #define MT_ADIE_TYPE_MASK		BIT(1)
 
 /* FW MODE SYNC */
-#define MT_FW_EXCEPTION		__REG(FW_EXCEPTION_ADDR)
+#define MT_FW_EXCEPTION			__REG(FW_EXCEPTION_ADDR)
 
 #define MT_SWDEF_BASE			__REG(SWDEF_BASE_ADDR)
 
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
