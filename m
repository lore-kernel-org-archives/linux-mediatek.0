Return-Path: <SRS0=jUzJ=FH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20DE0C64E8A
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 11:57:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CC702086A
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 11:57:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CC702086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5KBJZqAAc0wr+EiMPQ8nyOF/MHsVMYLY8/rxytixLqM=; b=BEas8e7ucIAjL1yqh9145+FZg9
	vSgeSc0ZpdyoYJC+yZ68J63x+3xmOmGDBqxm7+7/EQbM+o23Rennrd0Kxrla2b/Owv88KaI7hlGtz
	ycOE+/pMbu1pT985HSDJIkh1FhLUJZbdBcmHcP9DGgFFokMJOlX8BM15Ez6Rd324qg8xrnI9+MtXe
	mfRDf1gFUM3cur9qw5H+N4ktl24e8lqGCAVIPtJSnr4KY1mBgis4USphzz0/slEROBwsnFK2ELruH
	bjMDKgQQOClxD9DmnUNkXUR4Cu46DVByLS1t+XwoPyzfQEF866dYfP0tBXj/k53WiX3BSfRN8mvqC
	81v8yzpw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kknEC-000729-7d; Thu, 03 Dec 2020 11:56:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kknE8-00070s-H2
 for linux-mediatek@lists.infradead.org; Thu, 03 Dec 2020 11:56:50 +0000
X-UUID: b599dba0aa8142e29eeb4dbeb4e0fe19-20201203
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=HSHxG8q1H4egF4YXnlRz4M+YmKMMhxA4qznWJn6PoOA=; 
 b=g5qz2m9+UtlhY8/ZcN94NKhP6UJ1rmkiURnPIg8C57V9iQ5NCY4gw2ZJSfVjnCyM+afJ6j+s2mqbeVjS0Umcp7HbMV8wD8liU4hVIL/LVcAwDZVERrCvznpTIrBkkd2dp4TgH5FwgcfGn0Zd1DHg4PKQUIuifJzbbSafQLZDHDI=;
X-UUID: b599dba0aa8142e29eeb4dbeb4e0fe19-20201203
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 759370121; Thu, 03 Dec 2020 03:41:41 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Dec 2020 03:32:17 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Dec 2020 19:32:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 3 Dec 2020 19:32:15 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH] mt76: mt7915: fix "defined but not used" compiler warning
Date: Thu, 3 Dec 2020 19:32:10 +0800
Message-ID: <20201203113210.16354-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_065648_803380_DBB87CEB 
X-CRM114-Status: GOOD (  12.72  )
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
Cc: linux-mediatek <linux-mediatek@lists.infradead.org>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Ryder Lee <ryder.lee@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

If CONFIG_NL80211_TESTMODE is not set, the following compiler warning
appears:

warning: 'mt7915_mac_tx_rate_val' defined but not used [-Wunused-function]

Since mt7915_mac_tx_rate_val() is only used by
mt7915_mac_write_txwi_tm(), merge them to get rid of this warning.

Fixes: 3ac860a ("mt76: mt7915: implement testmode tx support")
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mac.c   | 68 ++++++++-----------
 1 file changed, 28 insertions(+), 40 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index d93d5ba..21005be 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -600,51 +600,16 @@ void mt7915_mac_fill_rx_vector(struct mt7915_dev *dev, struct sk_buff *skb)
 }
 #endif
 
-static u16
-mt7915_mac_tx_rate_val(struct mt76_phy *mphy, u8 mode, u8 rate_idx,
-		       u8 nss, u8 stbc, u8 *bw)
-{
-	u16 rateval = 0;
-
-	switch (mphy->chandef.width) {
-	case NL80211_CHAN_WIDTH_40:
-		*bw = 1;
-		break;
-	case NL80211_CHAN_WIDTH_80:
-		*bw = 2;
-		break;
-	case NL80211_CHAN_WIDTH_80P80:
-	case NL80211_CHAN_WIDTH_160:
-		*bw = 3;
-		break;
-	default:
-		*bw = 0;
-		break;
-	}
-
-	if (mode == MT_PHY_TYPE_HT || mode == MT_PHY_TYPE_HT_GF)
-		nss = 1 + (rate_idx >> 3);
-
-	if (stbc && nss == 1) {
-		nss++;
-		rateval |= MT_TX_RATE_STBC;
-	}
-
-	rateval |= FIELD_PREP(MT_TX_RATE_IDX, rate_idx) |
-		   FIELD_PREP(MT_TX_RATE_MODE, mode) |
-		   FIELD_PREP(MT_TX_RATE_NSS, nss - 1);
-
-	return rateval;
-}
-
 static void
 mt7915_mac_write_txwi_tm(struct mt7915_dev *dev, struct mt76_phy *mphy,
 			 __le32 *txwi, struct sk_buff *skb)
 {
 #ifdef CONFIG_NL80211_TESTMODE
 	struct mt76_testmode_data *td = &dev->mt76.test;
+	u8 rate_idx = td->tx_rate_idx;
+	u8 nss = td->tx_rate_nss;
 	u8 bw, mode;
-	u16 rateval;
+	u16 rateval = 0;
 	u32 val;
 
 	if (skb != dev->mt76.test.tx_skb)
@@ -655,6 +620,7 @@ mt7915_mac_write_txwi_tm(struct mt7915_dev *dev, struct mt76_phy *mphy,
 		mode = MT_PHY_TYPE_CCK;
 		break;
 	case MT76_TM_TX_MODE_HT:
+		nss = 1 + (rate_idx >> 3);
 		mode = MT_PHY_TYPE_HT;
 		break;
 	case MT76_TM_TX_MODE_VHT:
@@ -678,8 +644,30 @@ mt7915_mac_write_txwi_tm(struct mt7915_dev *dev, struct mt76_phy *mphy,
 		break;
 	}
 
-	rateval = mt7915_mac_tx_rate_val(mphy, mode, td->tx_rate_idx,
-					 td->tx_rate_nss, td->tx_rate_stbc, &bw);
+	switch (mphy->chandef.width) {
+	case NL80211_CHAN_WIDTH_40:
+		bw = 1;
+		break;
+	case NL80211_CHAN_WIDTH_80:
+		bw = 2;
+		break;
+	case NL80211_CHAN_WIDTH_80P80:
+	case NL80211_CHAN_WIDTH_160:
+		bw = 3;
+		break;
+	default:
+		bw = 0;
+		break;
+	}
+
+	if (td->tx_rate_stbc && nss == 1) {
+		nss++;
+		rateval |= MT_TX_RATE_STBC;
+	}
+
+	rateval |= FIELD_PREP(MT_TX_RATE_IDX, rate_idx) |
+		   FIELD_PREP(MT_TX_RATE_MODE, mode) |
+		   FIELD_PREP(MT_TX_RATE_NSS, nss - 1);
 
 	txwi[2] |= cpu_to_le32(MT_TXD2_FIX_RATE);
 
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
