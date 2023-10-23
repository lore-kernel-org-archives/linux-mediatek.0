Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D0EC25B44
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 15:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h1BKAdeDyo7lAKwf3L/9lQuBZpUyHbnGbXrwup1Y0tY=; b=yg4DPA0DC9/ltUjmfaAasvmGeH
	2PCHHjlX4JD5yIQr3v81UB2hi1odMPonvBkA6Y9xEfzgwdTkuAm+xQCCsrolbGK4o3LKLeHL+TSzS
	rWK2dRO3CkTyNlN1y2SvGynWr8puGclXXtQ+UeIx4WLzMAbrTmM5nU8ldILZ8z4QjgxYQBOmdJlmq
	mayCrkUn7/Qqv5Aq9TH0wX5OuNlLpM3z0txXq2hu1ugKRWD2kzPh89AfLpdBoXiMMACTIPxJu3QQk
	2+0RDO9JrT6+sT1gz2pka+BBp73grXB/WaUrNWnsVTjZ5aCRHF55QuSrjKXI+gqQT3L41mBhe1L1h
	VuohH9kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qux4H-007iXO-1z;
	Mon, 23 Oct 2023 15:42:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qux4E-007iVT-1x
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 15:42:12 +0000
X-UUID: b573b4f671ba11ee9b7791016c24628a-20231023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=h1BKAdeDyo7lAKwf3L/9lQuBZpUyHbnGbXrwup1Y0tY=;
	b=g9CyzvV+kS0Xi4WUenXFQx3YXK3athGc0xBgzqrCQNqQZSRMzt4MYox+rMAVftM3HUwTYPFlpSyJuLZJmwkoESSvamtgStWDDR9AicrOFByrWpfUo3aqzyQ8OM2PCu2DFE1GQbimbwJJ2yYjw1lidrMlpsW4YV7IyfjK9i9aYeE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:693f3f1d-4464-4b4e-9308-57a753700668,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:80388894-10ce-4e4b-85c2-c9b5229ff92b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b573b4f671ba11ee9b7791016c24628a-20231023
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2106654534; Mon, 23 Oct 2023 08:42:01 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 23 Oct 2023 23:41:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 23 Oct 2023 23:41:59 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Peter Chiu
	<chui-hao.chiu@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 10/11] wifi: mt76: mt7996: align the format of fixed rate command
Date: Mon, 23 Oct 2023 23:38:53 +0800
Message-ID: <20231023153854.10708-10-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231023153854.10708-1-shayne.chen@mediatek.com>
References: <20231023153854.10708-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.220300-8.000000
X-TMASE-MatchedRID: dTwHtQCOr38VAKRaMHqjDrMjW/sniEQKwx0jRRxcQfNcMMd+jCb9t3sN
	U677tWu5UEeV4U1o0G8HbUC3ubj+XZRMdwEiWk2Ndrnuu4cCcfFMkOX0UoduuQCGaccd4ae9MDP
	FcR5xz2R5rpsNj1PJk8YdhlZfQeHl4X8HWMSNX7pIcJTn2HkqsUb8lR3sG9JCNM9QGIWxRxsS99
	dUV0LYknq+9uqy4HnB/4qDTkxhw+UX/ky8TX34OmMdYzySsvg8BCny5lrY72ebKItl61J/yZ+in
	TK0bC9eKrauXd3MZDUal568aygjlyD9swBQE+k9jF/kji12h4CgSVj1NqrotrnE6OO0SanImEoy
	Uv4GC7iBfwb97ojO8WPTiIXeL/1Sd8Zi3goTm0jqtzWWHbJGHRdGg+ZY7eN6THB2Q+oKru8MTI3
	4nyF36MJL1aANdU8KftwZ3X11IV0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.220300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 0E0860BF277B5C50B51D37EEFB009E5D87FE67F67CE0EFF6149602B6319516E62000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_084210_681806_6A7772E9 
X-CRM114-Status: GOOD (  11.22  )
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

From: Peter Chiu <chui-hao.chiu@mediatek.com>

Use the new fixed rate command format to let the fixed field function
work normally.

Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 12 ++--
 .../net/wireless/mediatek/mt76/mt7996/mcu.h   | 71 ++++++++++++++++++-
 2 files changed, 75 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 8e2037671c9b..8097924d460b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -1805,8 +1805,8 @@ int mt7996_mcu_set_fixed_field(struct mt7996_dev *dev, struct ieee80211_vif *vif
 {
 	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
 	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
-	struct sta_phy *phy = data;
-	struct sta_rec_ra_fixed *ra;
+	struct sta_phy_uni *phy = data;
+	struct sta_rec_ra_fixed_uni *ra;
 	struct sk_buff *skb;
 	struct tlv *tlv;
 
@@ -1817,7 +1817,7 @@ int mt7996_mcu_set_fixed_field(struct mt7996_dev *dev, struct ieee80211_vif *vif
 		return PTR_ERR(skb);
 
 	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_RA_UPDATE, sizeof(*ra));
-	ra = (struct sta_rec_ra_fixed *)tlv;
+	ra = (struct sta_rec_ra_fixed_uni *)tlv;
 
 	switch (field) {
 	case RATE_PARAM_AUTO:
@@ -1849,7 +1849,7 @@ mt7996_mcu_add_rate_ctrl_fixed(struct mt7996_dev *dev, struct ieee80211_vif *vif
 	struct cfg80211_chan_def *chandef = &mvif->phy->mt76->chandef;
 	struct cfg80211_bitrate_mask *mask = &mvif->bitrate_mask;
 	enum nl80211_band band = chandef->chan->band;
-	struct sta_phy phy = {};
+	struct sta_phy_uni phy = {};
 	int ret, nrates = 0;
 
 #define __sta_phy_bitrate_mask_check(_mcs, _gi, _ht, _he)			\
@@ -1937,13 +1937,13 @@ mt7996_mcu_sta_rate_ctrl_tlv(struct sk_buff *skb, struct mt7996_dev *dev,
 	struct cfg80211_chan_def *chandef = &mphy->chandef;
 	struct cfg80211_bitrate_mask *mask = &mvif->bitrate_mask;
 	enum nl80211_band band = chandef->chan->band;
-	struct sta_rec_ra *ra;
+	struct sta_rec_ra_uni *ra;
 	struct tlv *tlv;
 	u32 supp_rate = sta->deflink.supp_rates[band];
 	u32 cap = sta->wme ? STA_CAP_WMM : 0;
 
 	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_RA, sizeof(*ra));
-	ra = (struct sta_rec_ra *)tlv;
+	ra = (struct sta_rec_ra_uni *)tlv;
 
 	ra->valid = true;
 	ra->auto_rate = true;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
index d3ac6ac0e5c9..a3eae32c8f10 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
@@ -494,6 +494,73 @@ struct sta_rec_sec_uni {
 	struct sec_key_uni key[2];
 } __packed;
 
+struct sta_phy_uni {
+	u8 type;
+	u8 flag;
+	u8 stbc;
+	u8 sgi;
+	u8 bw;
+	u8 ldpc;
+	u8 mcs;
+	u8 nss;
+	u8 he_ltf;
+	u8 rsv[3];
+};
+
+struct sta_rec_ra_uni {
+	__le16 tag;
+	__le16 len;
+
+	u8 valid;
+	u8 auto_rate;
+	u8 phy_mode;
+	u8 channel;
+	u8 bw;
+	u8 disable_cck;
+	u8 ht_mcs32;
+	u8 ht_gf;
+	u8 ht_mcs[4];
+	u8 mmps_mode;
+	u8 gband_256;
+	u8 af;
+	u8 auth_wapi_mode;
+	u8 rate_len;
+
+	u8 supp_mode;
+	u8 supp_cck_rate;
+	u8 supp_ofdm_rate;
+	__le32 supp_ht_mcs;
+	__le16 supp_vht_mcs[4];
+
+	u8 op_mode;
+	u8 op_vht_chan_width;
+	u8 op_vht_rx_nss;
+	u8 op_vht_rx_nss_type;
+
+	__le32 sta_cap;
+
+	struct sta_phy_uni phy;
+	u8 rx_rcpi[4];
+} __packed;
+
+struct sta_rec_ra_fixed_uni {
+	__le16 tag;
+	__le16 len;
+
+	__le32 field;
+	u8 op_mode;
+	u8 op_vht_chan_width;
+	u8 op_vht_rx_nss;
+	u8 op_vht_rx_nss_type;
+
+	struct sta_phy_uni phy;
+
+	u8 spe_idx;
+	u8 short_preamble;
+	u8 is_5g;
+	u8 mmps_mode;
+} __packed;
+
 struct sta_rec_hdrt {
 	__le16 tag;
 	__le16 len;
@@ -677,9 +744,9 @@ enum {
 					 sizeof(struct sta_rec_amsdu) +		\
 					 sizeof(struct sta_rec_bfee) +		\
 					 sizeof(struct sta_rec_phy) +		\
-					 sizeof(struct sta_rec_ra) +		\
+					 sizeof(struct sta_rec_ra_uni) +	\
 					 sizeof(struct sta_rec_sec) +		\
-					 sizeof(struct sta_rec_ra_fixed) +	\
+					 sizeof(struct sta_rec_ra_fixed_uni) +	\
 					 sizeof(struct sta_rec_he_6g_capa) +	\
 					 sizeof(struct sta_rec_eht) +		\
 					 sizeof(struct sta_rec_hdrt) +		\
-- 
2.39.2


