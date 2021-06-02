Return-Path: <SRS0=eP1B=K4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8278C4708F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 01:50:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66A34613BD
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 01:50:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66A34613BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=12haekWHivHtmdkbIwjx3Jdhu2j6OdFnpKxdF0/Jmxw=; b=yNKIrKiNyh0S5y
	HGdEKCNMQzkw2BymvlRiGbaek/BO8RiYuJGZJCM6f8YfoBmO2trIem7aQTAasdS1DfxHlOmsA/SSE
	aWJS2Iwi6gG+MZc6uv9ylDZuVeTJQsfpPV6vqsjioHrHeQsltJLE92AWtUWUwVK4H+6j8kNumO6de
	nqKbN74fwyKtkQg31sb5zHy0bbLpCwYBXhIuKeAgEGFFtMYHlkqLttPlNEM90L13LOv6yz8q+OINS
	NDSlROIGxotVoIrensqEBX8JKnk3shBsSoy3tqRyox+g1Uw1upzU/SPexllce68kfgpf2UaV30q+v
	qhyGCStoqpUZm8DhpjlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loG1Y-001WoF-Ns; Wed, 02 Jun 2021 01:50:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loG1V-001Wn4-5n
 for linux-mediatek@lists.infradead.org; Wed, 02 Jun 2021 01:50:23 +0000
X-UUID: 49f229e24eda447d995f5ba6fbf718d7-20210601
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=pqEY0sNlnYtQDRffb2f+8xsHtVGs+knY1MEC+eyXDLM=; 
 b=mS8jhrDTZ/aLDpZ+auGZTuYnKPEAw0XYlLbtifjobQb7pwbXfTbJ2mvtg7j30xGIvTaMDhYUZQPe9d7UcCEUgQB8beuC9Y9vR+AbbH++vE59Kmjab5TWYLCorhBRPHxz0qAMHqdeYX3qM7A2XxU8SHn/6R7Y+CQnXlhH569upHM=;
X-UUID: 49f229e24eda447d995f5ba6fbf718d7-20210601
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 763425192; Tue, 01 Jun 2021 18:50:12 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Jun 2021 18:50:10 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Jun 2021 09:50:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 2 Jun 2021 09:50:07 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>
Subject: [PATCH 1/2] mt76: mt7615: update radar parameters
Date: Wed, 2 Jun 2021 09:50:05 +0800
Message-ID: <56332dd6ef478da69d4a5319c3745116072e1949.1622591903.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_185021_247475_21EB37D8 
X-CRM114-Status: GOOD (  15.28  )
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

Patch radar parameters to match the SDK to avoid possible false alarms.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mac.c | 17 ++++++++++-------
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c |  4 ++++
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index 2ac7d0b0eff4..55b1694f8f9b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -20,7 +20,7 @@
 #define to_rssi(field, rxv)		((FIELD_GET(field, rxv) - 220) / 2)
 
 static const struct mt7615_dfs_radar_spec etsi_radar_specs = {
-	.pulse_th = { 40, -10, -80, 800, 3360, 128, 5200 },
+	.pulse_th = { 110, -10, -80, 40, 5200, 128, 5200 },
 	.radar_pattern = {
 		[5] =  { 1, 0,  6, 32, 28, 0, 17,  990, 5010, 1, 1 },
 		[6] =  { 1, 0,  9, 32, 28, 0, 27,  615, 5010, 1, 1 },
@@ -34,7 +34,7 @@ static const struct mt7615_dfs_radar_spec etsi_radar_specs = {
 };
 
 static const struct mt7615_dfs_radar_spec fcc_radar_specs = {
-	.pulse_th = { 40, -10, -80, 800, 3360, 128, 5200 },
+	.pulse_th = { 110, -10, -80, 40, 5200, 128, 5200 },
 	.radar_pattern = {
 		[0] = { 1, 0,  9,  32, 28, 0, 13, 508, 3076, 1,  1 },
 		[1] = { 1, 0, 12,  32, 28, 0, 17, 140,  240, 1,  1 },
@@ -45,7 +45,7 @@ static const struct mt7615_dfs_radar_spec fcc_radar_specs = {
 };
 
 static const struct mt7615_dfs_radar_spec jp_radar_specs = {
-	.pulse_th = { 40, -10, -80, 800, 3360, 128, 5200 },
+	.pulse_th = { 110, -10, -80, 40, 5200, 128, 5200 },
 	.radar_pattern = {
 		[0] =  { 1, 0,  8, 32, 28, 0, 13,  508, 3076, 1,  1 },
 		[1] =  { 1, 0, 12, 32, 28, 0, 17,  140,  240, 1,  1 },
@@ -2109,14 +2109,12 @@ mt7615_dfs_init_radar_specs(struct mt7615_phy *phy)
 {
 	const struct mt7615_dfs_radar_spec *radar_specs;
 	struct mt7615_dev *dev = phy->dev;
-	int err, i;
+	int err, i, lpn = 500;
 
 	switch (dev->mt76.region) {
 	case NL80211_DFS_FCC:
 		radar_specs = &fcc_radar_specs;
-		err = mt7615_mcu_set_fcc5_lpn(dev, 8);
-		if (err < 0)
-			return err;
+		lpn = 8;
 		break;
 	case NL80211_DFS_ETSI:
 		radar_specs = &etsi_radar_specs;
@@ -2128,6 +2126,11 @@ mt7615_dfs_init_radar_specs(struct mt7615_phy *phy)
 		return -EINVAL;
 	}
 
+	/* avoid FCC radar detection in non-FCC region */
+	err = mt7615_mcu_set_fcc5_lpn(dev, lpn);
+	if (err < 0)
+		return err;
+
 	for (i = 0; i < ARRAY_SIZE(radar_specs->radar_pattern); i++) {
 		err = mt7615_mcu_set_radar_th(dev, i,
 					      &radar_specs->radar_pattern[i]);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 313f46b5eb50..a9e8dc9fe3a1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -430,6 +430,10 @@ mt7615_mcu_rx_radar_detected(struct mt7615_dev *dev, struct sk_buff *skb)
 
 	r = (struct mt7615_mcu_rdd_report *)skb->data;
 
+	if (!dev->radar_pattern.n_pulses && !r->long_detected &&
+	    !r->constant_prf_detected && !r->staggered_prf_detected)
+		return 0;
+
 	if (r->band_idx && dev->mt76.phy2)
 		mphy = dev->mt76.phy2;
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
