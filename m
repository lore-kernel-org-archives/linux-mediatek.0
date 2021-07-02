Return-Path: <SRS0=VpQz=L2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F70BC11F68
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 08:43:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAAA9613B5
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 08:43:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAAA9613B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S9ksnu1/MKs+NKJcxfRdj23MM7wGbA4LjnC6w2qmZQk=; b=yc3fH01WIgWDJN
	/bNskKK8WoCDh4hIVzfr9A0/bkBWJsvldUgwhkz4ycqNGJupKPxx7sNwNDTz/fygmiICvOhfixlI1
	IMHC2fcUav+nm3pcOYO+UxM8ogJy36T5DQaZTyZVijsOOwAwS+GPJ+EL0S3U7y/PHWBeus0/gqJ6T
	CCdkVWFpiRV19DTLyye6Ko9HSfegB6N0Iea98XUGwNvhJ50AUyQe4KtkGAXwMnfyNJA54H0ADtg1m
	z/ZL7XZayPO7JDLCZWMHSCFjmXhDXQBctgo1UAsNZ3PwtgDoj3uk5u8E3ikQoUKBamn0GUEGSQJqU
	anStnkOXHakwIpENr/5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzElC-002VAG-VE; Fri, 02 Jul 2021 08:42:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzEl9-002V8a-Vp
 for linux-mediatek@lists.infradead.org; Fri, 02 Jul 2021 08:42:53 +0000
X-UUID: db3606b268144f3ba5166ff4f681c679-20210702
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=1OnGl7xq3NOFK3e1GzhJyCLVnMWI/X73iPrxvmoKimg=; 
 b=rGcBqFz/mpIM8KXQQ9tSSx84OrIHihCS8FG/qi+MvvwJrqlKtCIiB3X3bhH0Ty0w6J2X813pwizq9CSAQPsfdZCkk3MR6NhaTwJJiqy7zCYx33hgwFjl78z3lrNBd7K28FtvAyETTjYy34x3BjMe22/OTWWOzFxy62wFR8E9l+k=;
X-UUID: db3606b268144f3ba5166ff4f681c679-20210702
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <bo.jiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2040673995; Fri, 02 Jul 2021 01:42:49 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 2 Jul 2021 01:40:01 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 2 Jul 2021 16:39:52 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 2 Jul 2021 16:39:52 +0800
From: Bo Jiao <bo.jiao@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>, Sujuan Chen
 <sujuan.chen@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Bo Jiao <Bo.Jiao@mediatek.com>
Subject: [PATCH] mt76: mt7915: cleanup miscellaneous errors and redundant codes
Date: Fri, 2 Jul 2021 16:39:49 +0800
Message-ID: <20210702083949.4431-1-bo.jiao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: E5970F82D679ACA60D60ABEF64347722AD57499F5300A5D1BA73B0C9D78891502000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_014252_081003_94EA7BA5 
X-CRM114-Status: GOOD (  11.64  )
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

cleanup miscellaneous errors and redundant codes.

Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/init.c |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c  | 10 +++-------
 drivers/net/wireless/mediatek/mt76/mt7915/main.c |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c  |  7 +------
 4 files changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 4798d6344305..1d2214519f5a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -480,7 +480,7 @@ static int mt7915_init_hardware(struct mt7915_dev *dev)
 	}
 
 	/* Beacon and mgmt frames should occupy wcid 0 */
-	idx = mt76_wcid_alloc(dev->mt76.wcid_mask, MT7915_WTBL_STA - 1);
+	idx = mt76_wcid_alloc(dev->mt76.wcid_mask, MT7915_WTBL_STA);
 	if (idx)
 		return -ENOSPC;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 2462704094b0..186a8f44abb8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -1377,13 +1377,9 @@ void mt7915_mac_reset_counters(struct mt7915_phy *phy)
 		mt76_rr(dev, MT_TX_AGG_CNT2(ext_phy, i));
 	}
 
-	if (ext_phy) {
-		dev->mt76.phy2->survey_time = ktime_get_boottime();
-		i = ARRAY_SIZE(dev->mt76.aggr_stats) / 2;
-	} else {
-		dev->mt76.phy.survey_time = ktime_get_boottime();
-		i = 0;
-	}
+	phy->mt76->survey_time = ktime_get_boottime();
+	i = ext_phy ? ARRAY_SIZE(dev->mt76.aggr_stats) / 2 : 0;
+
 	memset(&dev->mt76.aggr_stats[i], 0, sizeof(dev->mt76.aggr_stats) / 2);
 
 	/* reset airtime counters */
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index c25f8da590dd..d8abebcffe4b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -613,7 +613,7 @@ int mt7915_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
 	int ret, idx;
 
-	idx = mt76_wcid_alloc(dev->mt76.wcid_mask, MT7915_WTBL_STA - 1);
+	idx = mt76_wcid_alloc(dev->mt76.wcid_mask, MT7915_WTBL_STA);
 	if (idx < 0)
 		return -ENOSPC;
 
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
