Return-Path: <SRS0=qO9d=GI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5630CC433E6
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 09:02:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC7CE22525
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 09:02:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC7CE22525
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AosZXiNNbyPzN/F8ewtxqfLcGkknVPsWWl9We8h+Dc4=; b=Xn35P0LX4UjUpVLmV2k3XxnGF
	F+tH0hlZd8drZewpMMOKqomiqPzJS7lRh6Vu2cfQgF7wtP2dY4/7sybvGa0Q7CKp7i/kaWS4zfcJv
	GEtZswvEbh9dR1QrcLCHL6YTu6hlt2OsKEwU5VzlmtSeyUuqzJPsNiNzjWFRRdXocxy6jbx0Lt3sw
	/7Gtn35pThMA1BtbodXqpgHjgHPlb8FoM1HijvxGeGdT6m57NH1bSEzciFUHAQbW31XQG7zmMZr0L
	HDqMv4itQX2sYLrFxhQChuTxym3KJSM0atMgED/N5Rq5dSA1KSqz+T1iiui0JiBQB8ETn5g23t/ZB
	t1dZDS21Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwiDq-0003wx-Jr; Tue, 05 Jan 2021 09:01:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwiDm-0003un-FL
 for linux-mediatek@lists.infradead.org; Tue, 05 Jan 2021 09:01:43 +0000
X-UUID: 70b5ad7194014645a2fff63173067db6-20210105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=3iqDxJPj3c6neIGlORe+DCwRMtB3bhWRXIlFPTDjV7Y=; 
 b=EE0cf4ZKz10mGYNluHCxwiLbrQHqYimrzeNu6OQiQhT7PYE1qL8V1LHl0omVL6X4ewnEzE7dUysaVz9et4PAsrpdHLVmhynmjGEIzFxX2nuSdAhm0PTTzOBv+UF03Hzn5Uv6WRDzfGXz37wdincwbRzELwzkRIS75FY8WDnfS+Y=;
X-UUID: 70b5ad7194014645a2fff63173067db6-20210105
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 768208760; Tue, 05 Jan 2021 01:01:38 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Jan 2021 00:56:14 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Jan 2021 16:56:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 5 Jan 2021 16:56:06 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH 5/6] mt76: mt7915: calculate new packet length when tx_time is
 set in testmode
Date: Tue, 5 Jan 2021 16:55:28 +0800
Message-ID: <20210105085529.14206-5-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210105085529.14206-1-shayne.chen@mediatek.com>
References: <20210105085529.14206-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_040142_754204_488EB03B 
X-CRM114-Status: GOOD (  13.12  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

If tx_time is set, calculate a new packet length based on tx time and
tx rate.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7915/testmode.c  | 96 ++++++++++++++++++-
 1 file changed, 93 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
index 748c9b55e498..a8e639ffe6de 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
@@ -237,6 +237,96 @@ mt7915_tm_set_ipg_params(struct mt7915_phy *phy, u32 ipg, u8 mode)
 				     aifsn, cw, cw, 0);
 }
 
+static int
+mt7915_tm_set_tx_len(struct mt7915_phy *phy, u32 tx_time)
+{
+	struct mt76_phy *mphy = phy->mt76;
+	struct mt76_testmode_data *td = &mphy->test;
+	struct sk_buff *old = td->tx_skb, *new;
+	struct ieee80211_supported_band *sband;
+	struct rate_info rate = {};
+	u16 flags = 0, tx_len;
+	u32 bitrate;
+
+	if (!tx_time || !old)
+		return 0;
+
+	rate.mcs = td->tx_rate_idx;
+	rate.nss = td->tx_rate_nss;
+
+	switch (td->tx_rate_mode) {
+	case MT76_TM_TX_MODE_CCK:
+	case MT76_TM_TX_MODE_OFDM:
+		if (mphy->chandef.chan->band == NL80211_BAND_5GHZ)
+			sband = &mphy->sband_5g.sband;
+		else
+			sband = &mphy->sband_2g.sband;
+
+		rate.legacy = sband->bitrates[rate.mcs].bitrate;
+		break;
+	case MT76_TM_TX_MODE_HT:
+		rate.mcs += rate.nss * 8;
+		flags |= RATE_INFO_FLAGS_MCS;
+
+		if (td->tx_rate_sgi)
+			flags |= RATE_INFO_FLAGS_SHORT_GI;
+		break;
+	case MT76_TM_TX_MODE_VHT:
+		flags |= RATE_INFO_FLAGS_VHT_MCS;
+
+		if (td->tx_rate_sgi)
+			flags |= RATE_INFO_FLAGS_SHORT_GI;
+		break;
+	case MT76_TM_TX_MODE_HE_SU:
+	case MT76_TM_TX_MODE_HE_EXT_SU:
+	case MT76_TM_TX_MODE_HE_TB:
+	case MT76_TM_TX_MODE_HE_MU:
+		rate.he_gi = td->tx_rate_sgi;
+		flags |= RATE_INFO_FLAGS_HE_MCS;
+		break;
+	default:
+		break;
+	}
+	rate.flags = flags;
+
+	switch (mphy->chandef.width) {
+	case NL80211_CHAN_WIDTH_160:
+	case NL80211_CHAN_WIDTH_80P80:
+		rate.bw = RATE_INFO_BW_160;
+		break;
+	case NL80211_CHAN_WIDTH_80:
+		rate.bw = RATE_INFO_BW_80;
+		break;
+	case NL80211_CHAN_WIDTH_40:
+		rate.bw = RATE_INFO_BW_40;
+		break;
+	default:
+		rate.bw = RATE_INFO_BW_20;
+		break;
+	}
+
+	bitrate = cfg80211_calculate_bitrate(&rate);
+	tx_len = bitrate * tx_time / 10 / 8;
+
+	if (tx_len < sizeof(struct ieee80211_hdr))
+		tx_len = sizeof(struct ieee80211_hdr);
+	else if (tx_len > IEEE80211_MAX_FRAME_LEN)
+		tx_len = IEEE80211_MAX_FRAME_LEN;
+
+	new = alloc_skb(tx_len, GFP_KERNEL);
+	if (!new)
+		return -ENOMEM;
+
+	skb_copy_header(new, old);
+	__skb_put_zero(new, tx_len);
+	memcpy(new->data, old->data, sizeof(struct ieee80211_hdr));
+
+	dev_kfree_skb(old);
+	td->tx_skb = new;
+
+	return 0;
+}
+
 static void
 mt7915_tm_reg_backup_restore(struct mt7915_phy *phy)
 {
@@ -312,7 +402,6 @@ mt7915_tm_set_tx_frames(struct mt7915_phy *phy, bool en)
 					 9, 8, 6, 10, 16, 12, 18, 0};
 	struct mt76_testmode_data *td = &phy->mt76->test;
 	struct mt7915_dev *dev = phy->dev;
-	struct sk_buff *skb = td->tx_skb;
 	struct ieee80211_tx_info *info;
 	u8 duty_cycle = td->tx_duty_cycle;
 	u32 tx_time = td->tx_time;
@@ -347,14 +436,15 @@ mt7915_tm_set_tx_frames(struct mt7915_phy *phy, bool en)
 	}
 
 	mt7915_tm_set_ipg_params(phy, ipg, td->tx_rate_mode);
+	mt7915_tm_set_tx_len(phy, tx_time);
 
 	if (ipg)
 		td->tx_queued_limit = MT76_TM_TIMEOUT * 1000000 / ipg / 2;
 
-	if (!en || !skb)
+	if (!en || !td->tx_skb)
 		return;
 
-	info = IEEE80211_SKB_CB(skb);
+	info = IEEE80211_SKB_CB(td->tx_skb);
 	info->control.vif = phy->monitor_vif;
 
 	mt7915_tm_set_trx(phy, TM_MAC_TX, en);
-- 
2.29.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
