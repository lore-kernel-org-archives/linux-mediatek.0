Return-Path: <SRS0=Rt7e=MF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF6BC11F67
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Jul 2021 20:16:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2EB161360
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Jul 2021 20:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2EB161360
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+OcIK6rCg9kufDxeiQzqISDttQ0k64Fj97nmDZ40lKI=; b=Y68yhvwgJcr51v
	EubrXb89lGKAsBHzg616+zcdPNvZRpIv3BjRsluOxG/XqaOX6ob4xhAFbTWhG+fD1xIDtOpfBBAKH
	TiMxVr5W4dMK69bHlqydUxDfd/Q4NkTQwZO8puj172KVTVfUpk1rbImr/JxNX5dUJRjg35GEnr+Ev
	HOKhQuN6blaOohKCoxljKtQ2QxN1oZyVB3Zk08cNaJF6ZhqHmP34PZVTiX1npN30jWOplXt/CNLA3
	zkYz1eOB/6DeXM+1dJ/Zy7VMBn0v8bbdrj0vmyiD87mwN4Bc18JrchnPI0dm+b5ocGcS1U8Pd8jUH
	aBdzuJ4SEj5MyYXr0B7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3OpI-00BI7U-H2; Tue, 13 Jul 2021 20:16:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3OpE-00BI65-A5
 for linux-mediatek@lists.infradead.org; Tue, 13 Jul 2021 20:16:17 +0000
X-UUID: c240df837aca47e3822593a9941dd41d-20210713
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=u3u+dqy9P1rscpK44zrg0iHFckHIVon5Z1gcX6Qq0KQ=; 
 b=kH8tRj7sbjnkri4s7GgnXuYGmZftxh56IFxL11c9c0GXYFJBCXqSMBjU6w5jdZ0dfv2eJLYIrTmipv+AST6LNBEgqvuyfUJQ+boyYMMXIFrotmBD0yWy6jwPx2v6ekO2wNUcix8N0jAXIIgw6fq0tKM850Ui7YvRNbYYrbhwtX4=;
X-UUID: c240df837aca47e3822593a9941dd41d-20210713
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1348886311; Tue, 13 Jul 2021 13:16:12 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Jul 2021 13:16:10 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Jul 2021 04:16:02 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 14 Jul 2021 04:16:02 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <Eric.Liang@mediatek.com>, <Stella.Chang@mediatek.com>, <jemele@google.com>,
 <yenlinlai@google.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH v3 1/4] mt76: fix mt76_rates for the multiple devices
Date: Wed, 14 Jul 2021 04:15:58 +0800
Message-ID: <92a8ecfdf198b34f98d5c1489a83adf151657760.1626207204.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_131616_381457_67CB81F3 
X-CRM114-Status: GOOD (  13.34  )
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

From: Sean Wang <sean.wang@mediatek.com>

PHY offset in either .hw_value or .hw_value_short for mt7615, mt7663,
mt7915 and mt7921 device all start at bit 6, not 8.

Suggested-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v2: splitted out from the patch ("mt76: mt7921: fix mgmt frame using unexpected bitrate")
    to cover more devices which have the same issue.
v3: no change.
---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 24 +++++++++----------
 drivers/net/wireless/mediatek/mt76/mt76.h     | 12 +++++-----
 .../net/wireless/mediatek/mt76/mt7603/init.c  | 19 +++++++++++++--
 .../net/wireless/mediatek/mt76/mt76x02_util.c | 16 ++++++-------
 4 files changed, 43 insertions(+), 28 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index d03aedc3286b..20b2423efc19 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -84,18 +84,18 @@ static const struct ieee80211_tpt_blink mt76_tpt_blink[] = {
 };
 
 struct ieee80211_rate mt76_rates[] = {
-	CCK_RATE(0, 10),
-	CCK_RATE(1, 20),
-	CCK_RATE(2, 55),
-	CCK_RATE(3, 110),
-	OFDM_RATE(11, 60),
-	OFDM_RATE(15, 90),
-	OFDM_RATE(10, 120),
-	OFDM_RATE(14, 180),
-	OFDM_RATE(9,  240),
-	OFDM_RATE(13, 360),
-	OFDM_RATE(8,  480),
-	OFDM_RATE(12, 540),
+	CCK_RATE(0, 10, 6),
+	CCK_RATE(1, 20, 6),
+	CCK_RATE(2, 55, 6),
+	CCK_RATE(3, 110, 6),
+	OFDM_RATE(11, 60, 6),
+	OFDM_RATE(15, 90, 6),
+	OFDM_RATE(10, 120, 6),
+	OFDM_RATE(14, 180, 6),
+	OFDM_RATE(9,  240, 6),
+	OFDM_RATE(13, 360, 6),
+	OFDM_RATE(8,  480, 6),
+	OFDM_RATE(12, 540, 6),
 };
 EXPORT_SYMBOL_GPL(mt76_rates);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 25c5ceef5257..e51ab917296d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -755,17 +755,17 @@ enum mt76_phy_type {
 	MT_PHY_TYPE_HE_MU,
 };
 
-#define CCK_RATE(_idx, _rate) {					\
+#define CCK_RATE(_idx, _rate, _offset) {			\
 	.bitrate = _rate,					\
 	.flags = IEEE80211_RATE_SHORT_PREAMBLE,			\
-	.hw_value = (MT_PHY_TYPE_CCK << 8) | (_idx),		\
-	.hw_value_short = (MT_PHY_TYPE_CCK << 8) | (4 + _idx),	\
+	.hw_value = (MT_PHY_TYPE_CCK << (_offset)) | (_idx),		\
+	.hw_value_short = (MT_PHY_TYPE_CCK << (_offset)) | (4 + _idx),	\
 }
 
-#define OFDM_RATE(_idx, _rate) {				\
+#define OFDM_RATE(_idx, _rate, _offset) {			\
 	.bitrate = _rate,					\
-	.hw_value = (MT_PHY_TYPE_OFDM << 8) | (_idx),		\
-	.hw_value_short = (MT_PHY_TYPE_OFDM << 8) | (_idx),	\
+	.hw_value = (MT_PHY_TYPE_OFDM << (_offset)) | (_idx),	\
+	.hw_value_short = (MT_PHY_TYPE_OFDM << (_offset)) | (_idx), \
 }
 
 extern struct ieee80211_rate mt76_rates[12];
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/init.c b/drivers/net/wireless/mediatek/mt76/mt7603/init.c
index 031d39a48a55..59f684b08c55 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/init.c
@@ -304,6 +304,21 @@ mt7603_init_hardware(struct mt7603_dev *dev)
 	return 0;
 }
 
+static struct ieee80211_rate mt7603_rates[] = {
+	CCK_RATE(0, 10, 8),
+	CCK_RATE(1, 20, 8),
+	CCK_RATE(2, 55, 8),
+	CCK_RATE(3, 110, 8),
+	OFDM_RATE(11, 60, 8),
+	OFDM_RATE(15, 90, 8),
+	OFDM_RATE(10, 120, 8),
+	OFDM_RATE(14, 180, 8),
+	OFDM_RATE(9,  240, 8),
+	OFDM_RATE(13, 360, 8),
+	OFDM_RATE(8,  480, 8),
+	OFDM_RATE(12, 540, 8),
+};
+
 static const struct ieee80211_iface_limit if_limits[] = {
 	{
 		.max = 1,
@@ -541,8 +556,8 @@ int mt7603_register_device(struct mt7603_dev *dev)
 
 	wiphy->reg_notifier = mt7603_regd_notifier;
 
-	ret = mt76_register_device(&dev->mt76, true, mt76_rates,
-				   ARRAY_SIZE(mt76_rates));
+	ret = mt76_register_device(&dev->mt76, true, mt7603_rates,
+				   ARRAY_SIZE(mt7603_rates));
 	if (ret)
 		return ret;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_util.c b/drivers/net/wireless/mediatek/mt76/mt76x02_util.c
index ccdbab341271..70a62bf16425 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_util.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_util.c
@@ -19,14 +19,14 @@ struct ieee80211_rate mt76x02_rates[] = {
 	MT76x02_CCK_RATE(1, 20),
 	MT76x02_CCK_RATE(2, 55),
 	MT76x02_CCK_RATE(3, 110),
-	OFDM_RATE(0, 60),
-	OFDM_RATE(1, 90),
-	OFDM_RATE(2, 120),
-	OFDM_RATE(3, 180),
-	OFDM_RATE(4, 240),
-	OFDM_RATE(5, 360),
-	OFDM_RATE(6, 480),
-	OFDM_RATE(7, 540),
+	OFDM_RATE(0, 60, 8),
+	OFDM_RATE(1, 90, 8),
+	OFDM_RATE(2, 120, 8),
+	OFDM_RATE(3, 180, 8),
+	OFDM_RATE(4, 240, 8),
+	OFDM_RATE(5, 360, 8),
+	OFDM_RATE(6, 480, 8),
+	OFDM_RATE(7, 540, 8),
 };
 EXPORT_SYMBOL_GPL(mt76x02_rates);
 
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
