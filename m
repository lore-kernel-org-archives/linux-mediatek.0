Return-Path: <SRS0=dK9R=IB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 688A5C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 17:35:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E180464E60
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 17:35:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E180464E60
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T0TT7nl4N8WwAd8jwCwd6JELfTi+f73akhMduAspMJM=; b=mZHEoUkNImdAeUnBkTg4Y4RYUu
	6Q1Q7DtxZN2IvDSEjNdzLUatAF4RJKjx5T4AQFQV8ZMvYFYH1wU8GMUraoUt4UNvYcgdR/yAhVxxP
	icKc/MPcvyFuaaaUPCFZv6YLl/tNQc1OHAclIEtoWywJ++t64z2+dZO4P12GII1eyBlGwTv5ka42P
	qJxoMiTgLpLao1m8e1/9QaQEpcIazoDv+MyoYL7gowdZMv0hHHCgEcpxhz67HaWFnyJ/H3UMo7cJI
	+9PcL4TdHLwU/NjbjuTqZtMhe0O+9HJ2vRexeyxc76jr5w5191TuplMnFpwP5zeHKUzc+B2WRDYIZ
	3XGSE78A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHVP5-005pRS-7l; Wed, 03 Mar 2021 17:35:19 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSvf-005Fc6-7j
 for linux-mediatek@desiato.infradead.org; Wed, 03 Mar 2021 14:56:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=FPgVof0xVnAKdEHyLlmb0mOxZ6VIA76K9fTjIOtAuo4=; b=JqXcBYN9gw/VDHfAQk1tiUbsij
 7YvRdm1Rwg9+ohpFxEHqsT6XgsHAhW/ZdHcXDkaUJjfUZwW48elWB8bsFldmgazRhJbQ+2ixHjLq8
 mBuLnTSN0Azk3B73/FW2AzrEoQ7fP0GpS2HOQ6hJxIko/MnCQvLzR+BQwkPziILmW//WP4H88rF+U
 mzQcrg4elJLnQkHWfY1ax4Q5Pev66wDDbo6mIhSu3eoXY+shc/8htRcfJFnjppPg++OfuswC14vpi
 q1y/23dQP2kmuy52rsvX27FrBN3yEn7tsmfMOy9c19gRUl0UpiEFo6lVrf/2V50wyMxeaV+u60iNJ
 i6mS1UhA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHOta-002Czn-Rc
 for linux-mediatek@lists.infradead.org; Wed, 03 Mar 2021 10:38:24 +0000
X-UUID: cbd5931340a240be931cfe9e564531cb-20210303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=FPgVof0xVnAKdEHyLlmb0mOxZ6VIA76K9fTjIOtAuo4=; 
 b=GvrxR5axKhFNGnux/4fNE5PNDZT4mvwlddIcqhIvCOPOU98S/Df03MZW07GNfoO5eBoMd0UY6l81w724hzyyvhbTncV9PCEUKkTJC+fOEFpnTy64gLR6QmbySHkF/IIlUTPk9kN6iVsyYq75bWBQ+KwxUXPv1dqDGm+5l+1DvK0=;
X-UUID: cbd5931340a240be931cfe9e564531cb-20210303
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 864455014; Wed, 03 Mar 2021 02:38:08 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Mar 2021 02:38:07 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Mar 2021 18:38:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 3 Mar 2021 18:38:03 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Shayne Chen <shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>, 
 <linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 1/4] mt76: mt7915: fix rxrate reporting
Date: Wed, 3 Mar 2021 18:37:59 +0800
Message-ID: <a379bb8534b2b8c24e30313b97aa8cfdf79c315b.1614753100.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 43E5F3BEE6F3F98E75647AB33B32E3F3AE7269CA5AC11EC62DD68CEED2F3F8FE2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_103824_470263_6AE0DFD5 
X-CRM114-Status: GOOD (  11.85  )
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

Avoid directly updating sinfo->rxrate from firmware since rate_info might
be overwritten by wrong results even mt7915_mcu_get_rx_rate() fails check.

Add more error handlings accordingly.

Fixes: 11553d88d0b9 ("mt76: mt7915: query station rx rate from firmware")
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/main.c  |  5 +-
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 47 ++++++++++---------
 2 files changed, 30 insertions(+), 22 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index cacc9b6933ca..bb49ea9307e0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -839,9 +839,12 @@ static void mt7915_sta_statistics(struct ieee80211_hw *hw,
 	struct mt7915_phy *phy = mt7915_hw_phy(hw);
 	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
 	struct mt7915_sta_stats *stats = &msta->stats;
+	struct rate_info rxrate = {};
 
-	if (mt7915_mcu_get_rx_rate(phy, vif, sta, &sinfo->rxrate) == 0)
+	if (!mt7915_mcu_get_rx_rate(phy, vif, sta, &rxrate)) {
+		sinfo->rxrate = rxrate;
 		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_RX_BITRATE);
+	}
 
 	if (!stats->tx_rate.legacy && !stats->tx_rate.flags)
 		return;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index e0c03b7f278d..b204c5dd7914 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -3552,9 +3552,8 @@ int mt7915_mcu_get_rx_rate(struct mt7915_phy *phy, struct ieee80211_vif *vif,
 	struct ieee80211_supported_band *sband;
 	struct mt7915_mcu_phy_rx_info *res;
 	struct sk_buff *skb;
-	u16 flags = 0;
 	int ret;
-	int i;
+	bool cck = false;
 
 	ret = mt76_mcu_send_and_get_msg(&dev->mt76, MCU_EXT_CMD(PHY_STAT_INFO),
 					&req, sizeof(req), true, &skb);
@@ -3568,48 +3567,53 @@ int mt7915_mcu_get_rx_rate(struct mt7915_phy *phy, struct ieee80211_vif *vif,
 
 	switch (res->mode) {
 	case MT_PHY_TYPE_CCK:
+		cck = true;
+		fallthrough;
 	case MT_PHY_TYPE_OFDM:
 		if (mphy->chandef.chan->band == NL80211_BAND_5GHZ)
 			sband = &mphy->sband_5g.sband;
 		else
 			sband = &mphy->sband_2g.sband;
 
-		for (i = 0; i < sband->n_bitrates; i++) {
-			if (rate->mcs != (sband->bitrates[i].hw_value & 0xf))
-				continue;
-
-			rate->legacy = sband->bitrates[i].bitrate;
-			break;
-		}
+		rate->mcs = mt76_get_rate(&dev->mt76, sband, rate->mcs, cck);
+		rate->legacy = sband->bitrates[rate->mcs].bitrate;
 		break;
 	case MT_PHY_TYPE_HT:
 	case MT_PHY_TYPE_HT_GF:
-		if (rate->mcs > 31)
-			return -EINVAL;
-
-		flags |= RATE_INFO_FLAGS_MCS;
+		if (rate->mcs > 31) {
+			ret = -EINVAL;
+			goto out;
+		}
 
+		rate->flags = RATE_INFO_FLAGS_MCS;
 		if (res->gi)
-			flags |= RATE_INFO_FLAGS_SHORT_GI;
+			rate->flags |= RATE_INFO_FLAGS_SHORT_GI;
 		break;
 	case MT_PHY_TYPE_VHT:
-		flags |= RATE_INFO_FLAGS_VHT_MCS;
+		if (rate->mcs > 9) {
+			ret = -EINVAL;
+			goto out;
+		}
 
+		rate->flags = RATE_INFO_FLAGS_VHT_MCS;
 		if (res->gi)
-			flags |= RATE_INFO_FLAGS_SHORT_GI;
+			rate->flags |= RATE_INFO_FLAGS_SHORT_GI;
 		break;
 	case MT_PHY_TYPE_HE_SU:
 	case MT_PHY_TYPE_HE_EXT_SU:
 	case MT_PHY_TYPE_HE_TB:
 	case MT_PHY_TYPE_HE_MU:
+		if (res->gi > NL80211_RATE_INFO_HE_GI_3_2 || rate->mcs > 11) {
+			ret = -EINVAL;
+			goto out;
+		}
 		rate->he_gi = res->gi;
-
-		flags |= RATE_INFO_FLAGS_HE_MCS;
+		rate->flags = RATE_INFO_FLAGS_HE_MCS;
 		break;
 	default:
-		break;
+		ret = -EINVAL;
+		goto out;
 	}
-	rate->flags = flags;
 
 	switch (res->bw) {
 	case IEEE80211_STA_RX_BW_160:
@@ -3626,7 +3630,8 @@ int mt7915_mcu_get_rx_rate(struct mt7915_phy *phy, struct ieee80211_vif *vif,
 		break;
 	}
 
+out:
 	dev_kfree_skb(skb);
 
-	return 0;
+	return ret;
 }
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
