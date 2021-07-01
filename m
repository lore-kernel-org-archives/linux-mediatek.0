Return-Path: <SRS0=jcdg=LZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CEB8C11F64
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 13:58:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 040B4613F4
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 13:58:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 040B4613F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=utktukg4MlnnveK2QjGmN2l35D9PeOXxAZ9X/PdwEiQ=; b=C0wiwYIyydYKoN
	hT5JdKSG5WHnpJQIp49XQvnGVOQU8+p/Vr87hgY3y9OGP4YSM7zWtcGEN/UztYja3mLFmJDNRBkUB
	AUkF5tDLvf1H35pk33Z0V25DsVjVMrwnc08lUYDj6ooEMNBnsg5Xb6m066LWGo5Zg5h25mlHsHetv
	jzFk6Avlpsj2TYcnHe7OQaE11cIcjhCRzH5dpmO1z3003O+gkvy831PRn8RroeqMiHskkBRwBmT+0
	NZBtg7SVAhQIoqaoP3imrnsvNyRjg6ixeQMjSoQ2pL1BFQ3zS6RPa8FU6M7NqzByqIwAqfntiVKbX
	XruiEv8H+jBSwmkBvYSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyxCT-00HYxo-Uu; Thu, 01 Jul 2021 13:57:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyxCQ-00HYxG-3y
 for linux-mediatek@lists.infradead.org; Thu, 01 Jul 2021 13:57:52 +0000
X-UUID: db296ca83d6545aa8a816c1c4cd597b0-20210701
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=wrr14FaHA4wIpogTu+JZgWa70h6eH+v2ahZhpbnIll4=; 
 b=HllfMRmwvhcKaL18P5msXr8k1jLqsupSckDVcT7uxZABh8KiZOPrVEGdr2fdIt/5TVdPxZOSUvhiQp9LXcVlHXzT7c5KdtHK/jkPp/AhhPe/YTFNwKlnERG4RNakX9Y0+u0sfbN8Zy8xaXnCl2P6wFPzn3qETDOVWBm9qImTsxo=;
X-UUID: db296ca83d6545aa8a816c1c4cd597b0-20210701
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <bo.jiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1762548151; Thu, 01 Jul 2021 06:57:43 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 1 Jul 2021 06:57:42 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 1 Jul 2021 21:57:35 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 1 Jul 2021 21:57:34 +0800
From: Bo Jiao <bo.jiao@mediatek.com>
To: Bo Jiao <bo.jiao@mediatek.com>
CC: Ryder Lee <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>,
 Sujuan Chen <sujuan.chen@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Bo Jiao <Bo.Jiao@mediatek.com>
Subject: [PATCH] mt76: mt7915: remove the redundant code
Date: Thu, 1 Jul 2021 21:57:07 +0800
Message-ID: <20210701135707.4890-1-bo.jiao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0DF1C406BB4126187228194D36F4B3440EBD8C2B8B2EAD8C87A0C3A0514CFEA82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_065751_013172_973A8024 
X-CRM114-Status: GOOD (  10.31  )
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

From: Bo Jiao <Bo.Jiao@mediatek.com>

remove the redundant code.

Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 11 ++++-------
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c |  7 +------
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 2462704094b0..6f5f9540d8d2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -1370,20 +1370,17 @@ void mt7915_mac_reset_counters(struct mt7915_phy *phy)
 {
 	struct mt7915_dev *dev = phy->dev;
 	bool ext_phy = phy != &dev->phy;
-	int i;
+	int i = 0;
 
 	for (i = 0; i < 4; i++) {
 		mt76_rr(dev, MT_TX_AGG_CNT(ext_phy, i));
 		mt76_rr(dev, MT_TX_AGG_CNT2(ext_phy, i));
 	}
 
-	if (ext_phy) {
-		dev->mt76.phy2->survey_time = ktime_get_boottime();
+	phy->mt76->survey_time = ktime_get_boottime();
+	if (ext_phy)
 		i = ARRAY_SIZE(dev->mt76.aggr_stats) / 2;
-	} else {
-		dev->mt76.phy.survey_time = ktime_get_boottime();
-		i = 0;
-	}
+
 	memset(&dev->mt76.aggr_stats[i], 0, sizeof(dev->mt76.aggr_stats) / 2);
 
 	/* reset airtime counters */
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 863aa18b3024..62160ca721b8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -975,12 +975,7 @@ mt7915_mcu_bss_rfch_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
 	}
 
 	if (vif->bss_conf.he_support && vif->type == NL80211_IFTYPE_STATION) {
-		struct mt7915_dev *dev = phy->dev;
-		struct mt76_phy *mphy = &dev->mt76.phy;
-		bool ext_phy = phy != &dev->phy;
-
-		if (ext_phy && dev->mt76.phy2)
-			mphy = dev->mt76.phy2;
+		struct mt76_phy *mphy = phy->mt76;
 
 		ch->he_ru26_block =
 			mt7915_check_he_obss_narrow_bw_ru(mphy->hw, vif);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
