Return-Path: <SRS0=dK9R=IB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26F30C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 16:37:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C63864E6F
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 16:37:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C63864E6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JLoooyERP0cqXUJpqOtfY/w1yw1/JCRl8EX5ObzZNDY=; b=apSQWI7YARvrZtcePAma46LNg
	NJNb2i/9KbtgRgHgDV47ag2ZVObQaPW5euxVgipW1zNPIkRdt3aMDKeL/TqVBT14j+t2orYWqp8UE
	g1Bqvfjt/GtmJVPUZaN7QNFt1Njk2iOIwCYq+dKKQ6dxiLPqa+KRXsqgUDlOvA1S25OuCFGTQqsOw
	ZEpgUQ0qS3kArKxs+mh/3nkO2DarkD/aiVc0LaXLppCDC49vQGmMchd/KVNUZqRafR6lc2Gdh3QKz
	hL8wX+QXec5DA2yX4GlBjPcB74vH2KbYnqE3/XxGjZmEdhZNJBS8LhSI1sE6ZBC9U2vCRrAC+C6WJ
	oOsTvAdaw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHUVI-005dI1-6i; Wed, 03 Mar 2021 16:37:40 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSqI-005ECU-KY
 for linux-mediatek@desiato.infradead.org; Wed, 03 Mar 2021 14:51:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=/j0ip68oB4LLEC4yNMIE0iCMZ5ZkK2B7t3klSHfJSrI=; b=idCc0Vae5KoGscG1aiXZFyl26u
 WVI7lxmu6WFLrByzFYPRC+QklQrINBi8yCTibu7sHSP4j4xsCA5NemmQk7wOwocoo0pGOqIxoor6i
 T7uimaUqAbufVd/KVNmbvZd0tq5YbIWwnvm2QiYMsvwK0Xns+I5a6RR1mqnnJJ0j5ZIKoBQmriR2F
 KFlNIfbVtjNPPLjHUMLUhQM1Z3CTSrXugGeFrWRftb1207SKn8Rka7Ozng09xuNVTP2z3Y/NVhuKG
 vMdLaQfXIbWLfsDkreE0b1JzkfNs+lbkTo7X1edO8RoSrA9HnQtOIyHrME3cGy0fBZhhUuHmqwDiZ
 zvhsQE2Q==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHOtX-002Czm-LB
 for linux-mediatek@lists.infradead.org; Wed, 03 Mar 2021 10:38:23 +0000
X-UUID: 44a63ff726fd47b5bbceb5c37ca0c6a7-20210303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=/j0ip68oB4LLEC4yNMIE0iCMZ5ZkK2B7t3klSHfJSrI=; 
 b=fafBX3kXV9aTstDN/48FDhm8/Q7ADqqK+lnJVC7gR5P3+00TPfnOV0dQVFquXe5Mh5O6uOmh/h9bbtmxClEuBqsgf/e0kxqk1HO/Lj906AfB6YK1PAwdlS4AphLguRpXOmImEtPZFnSrhn0ZZESlauPZZNTbd7YDRX6q/UTtrrc=;
X-UUID: 44a63ff726fd47b5bbceb5c37ca0c6a7-20210303
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1685118730; Wed, 03 Mar 2021 02:38:07 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Mar 2021 02:38:05 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Mar 2021 18:38:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 3 Mar 2021 18:38:04 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Shayne Chen <shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>, 
 <linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 2/4] mt76: mt7915: fix txrate reporting
Date: Wed, 3 Mar 2021 18:38:00 +0800
Message-ID: <a64485b9e1cfb90b9514977f26b83b76236eafe2.1614753100.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <a379bb8534b2b8c24e30313b97aa8cfdf79c315b.1614753100.git.ryder.lee@mediatek.com>
References: <a379bb8534b2b8c24e30313b97aa8cfdf79c315b.1614753100.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_103823_341715_59852BE5 
X-CRM114-Status: GOOD (  10.72  )
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

Properly check rate_info to fix unexpected reporting.

[ 1215.161863] Call trace:
[ 1215.164307]  cfg80211_calculate_bitrate+0x124/0x200 [cfg80211]
[ 1215.170139]  ieee80211s_update_metric+0x80/0xc0 [mac80211]
[ 1215.175624]  ieee80211_tx_status_ext+0x508/0x838 [mac80211]
[ 1215.181190]  mt7915_mcu_get_rx_rate+0x28c/0x8d0 [mt7915e]
[ 1215.186580]  mt7915_mac_tx_free+0x324/0x7c0 [mt7915e]
[ 1215.191623]  mt7915_queue_rx_skb+0xa8/0xd0 [mt7915e]
[ 1215.196582]  mt76_dma_cleanup+0x7b0/0x11d0 [mt76]
[ 1215.201276]  __napi_poll+0x38/0xf8
[ 1215.204668]  napi_workfn+0x40/0x80
[ 1215.208062]  process_one_work+0x1fc/0x390
[ 1215.212062]  worker_thread+0x48/0x4d0
[ 1215.215715]  kthread+0x120/0x128
[ 1215.218935]  ret_from_fork+0x10/0x1c

Fixes: e57b7901469f ("mt76: add mac80211 driver for MT7915 PCIe-based chipsets")
Fixes: e4c5ead632ff ("mt76: mt7915: rename mt7915_mcu_get_rate_info to mt7915_mcu_get_tx_rate")
Reported-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 38 ++++++++++++-------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index b204c5dd7914..edb58f6f2640 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -364,54 +364,62 @@ mt7915_mcu_rx_radar_detected(struct mt7915_dev *dev, struct sk_buff *skb)
 	dev->hw_pattern++;
 }
 
-static void
+static int
 mt7915_mcu_tx_rate_parse(struct mt76_phy *mphy, struct mt7915_mcu_ra_info *ra,
 			 struct rate_info *rate, u16 r)
 {
 	struct ieee80211_supported_band *sband;
 	u16 ru_idx = le16_to_cpu(ra->ru_idx);
-	u16 flags = 0;
+	bool cck = false;
 
 	rate->mcs = FIELD_GET(MT_RA_RATE_MCS, r);
 	rate->nss = FIELD_GET(MT_RA_RATE_NSS, r) + 1;
 
 	switch (FIELD_GET(MT_RA_RATE_TX_MODE, r)) {
 	case MT_PHY_TYPE_CCK:
+		cck = true;
+		fallthrough;
 	case MT_PHY_TYPE_OFDM:
 		if (mphy->chandef.chan->band == NL80211_BAND_5GHZ)
 			sband = &mphy->sband_5g.sband;
 		else
 			sband = &mphy->sband_2g.sband;
 
+		rate->mcs = mt76_get_rate(mphy->dev, sband, rate->mcs, cck);
 		rate->legacy = sband->bitrates[rate->mcs].bitrate;
 		break;
 	case MT_PHY_TYPE_HT:
 	case MT_PHY_TYPE_HT_GF:
 		rate->mcs += (rate->nss - 1) * 8;
-		flags |= RATE_INFO_FLAGS_MCS;
+		if (rate->mcs > 31)
+			return -EINVAL;
 
+		rate->flags = RATE_INFO_FLAGS_MCS;
 		if (ra->gi)
-			flags |= RATE_INFO_FLAGS_SHORT_GI;
+			rate->flags |= RATE_INFO_FLAGS_SHORT_GI;
 		break;
 	case MT_PHY_TYPE_VHT:
-		flags |= RATE_INFO_FLAGS_VHT_MCS;
+		if (rate->mcs > 9)
+			return -EINVAL;
 
+		rate->flags = RATE_INFO_FLAGS_VHT_MCS;
 		if (ra->gi)
-			flags |= RATE_INFO_FLAGS_SHORT_GI;
+			rate->flags |= RATE_INFO_FLAGS_SHORT_GI;
 		break;
 	case MT_PHY_TYPE_HE_SU:
 	case MT_PHY_TYPE_HE_EXT_SU:
 	case MT_PHY_TYPE_HE_TB:
 	case MT_PHY_TYPE_HE_MU:
+		if (ra->gi > NL80211_RATE_INFO_HE_GI_3_2 || rate->mcs > 11)
+			return -EINVAL;
+
 		rate->he_gi = ra->gi;
 		rate->he_dcm = FIELD_GET(MT_RA_RATE_DCM_EN, r);
-
-		flags |= RATE_INFO_FLAGS_HE_MCS;
+		rate->flags = RATE_INFO_FLAGS_HE_MCS;
 		break;
 	default:
-		break;
+		return -EINVAL;
 	}
-	rate->flags = flags;
 
 	if (ru_idx) {
 		switch (ru_idx) {
@@ -448,6 +456,8 @@ mt7915_mcu_tx_rate_parse(struct mt76_phy *mphy, struct mt7915_mcu_ra_info *ra,
 			break;
 		}
 	}
+
+	return 0;
 }
 
 static void
@@ -478,12 +488,12 @@ mt7915_mcu_tx_rate_report(struct mt7915_dev *dev, struct sk_buff *skb)
 		mphy = dev->mt76.phy2;
 
 	/* current rate */
-	mt7915_mcu_tx_rate_parse(mphy, ra, &rate, curr);
-	stats->tx_rate = rate;
+	if(!mt7915_mcu_tx_rate_parse(mphy, ra, &rate, curr))
+		stats->tx_rate = rate;
 
 	/* probing rate */
-	mt7915_mcu_tx_rate_parse(mphy, ra, &prob_rate, probe);
-	stats->prob_rate = prob_rate;
+	if(!mt7915_mcu_tx_rate_parse(mphy, ra, &prob_rate, probe))
+		stats->prob_rate = prob_rate;
 
 	if (attempts) {
 		u16 success = le16_to_cpu(ra->success);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
