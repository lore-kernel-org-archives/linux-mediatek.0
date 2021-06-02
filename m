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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73D41C47080
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 03:05:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3913613C5
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 03:05:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3913613C5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NZTJveFo97Tr7vxnJiwEFioa+/LO+XXQdDzfQaPPdP0=; b=1EoiFw7BLqf/Wu
	GcivE2+wIY/eJ5BnCSWlMi7vml7NNGOfzGTvSO0khK5FDGDI6WbLyZlwFhhPzdWgv9GMO9mqkbM+9
	cj0LlrtPB9PqwlOTdC6oazEhvOSD7wHRjetLB+rpdC8Pv/TRo+xtx6HlDCVk8gXeS5Z+ZZwjThBnt
	ytBVG3iP+4ZSKz37u1Q3uALpg9glwihb8REVV9N/BS4OCx8CkImSwN8+OpRXjjl9Rc8+VC9tO7Pev
	BXusBYmJ6xe9vLeyH22adWI75YIvX2TgjHqPkhtNwl6PG6ehV98fVLv5+o2Lf7GgG/Egl26CElOXH
	LPL2dm986RRtzrNbBv7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loHBt-001fNj-BE; Wed, 02 Jun 2021 03:05:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loHBq-001fMd-5J
 for linux-mediatek@lists.infradead.org; Wed, 02 Jun 2021 03:05:07 +0000
X-UUID: 67b4f53f24494061a3f305a2d873a1c1-20210601
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=qyhOJqRYSxvouNa+fYZKPKKaldozX4v5hu0Bi5XCWxA=; 
 b=DmEnrPh1ph+M35bQ5NkPn3nRnBU3bdDwQoGnQdfTMo2eJ/ORfcVgccNlsrHF+W7PWoQoIaZquaKxWZS7oog4xALzlJkYPSe4w+jg0qahSJqUMAzJ3Y852rkeyYLIPbQVNlMsQbq+xoc3avrA6OdmLUI51Rzl1vp0CyUkZ3NHtBQ=;
X-UUID: 67b4f53f24494061a3f305a2d873a1c1-20210601
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 256695161; Tue, 01 Jun 2021 20:04:58 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Jun 2021 20:04:56 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Jun 2021 11:04:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 2 Jun 2021 11:04:06 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>
Subject: [PATCH v2] mt76: mt7615: update radar parameters
Date: Wed, 2 Jun 2021 11:04:03 +0800
Message-ID: <eb3defe02d970e7b2b0cce5841d7fb63b9239e06.1622599797.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_200506_236265_BD4B11D6 
X-CRM114-Status: GOOD (  15.49  )
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
change since v2 - fix return value
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
index 313f46b5eb50..7022b78062a6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -430,6 +430,10 @@ mt7615_mcu_rx_radar_detected(struct mt7615_dev *dev, struct sk_buff *skb)
 
 	r = (struct mt7615_mcu_rdd_report *)skb->data;
 
+	if (!dev->radar_pattern.n_pulses && !r->long_detected &&
+	    !r->constant_prf_detected && !r->staggered_prf_detected)
+		return;
+
 	if (r->band_idx && dev->mt76.phy2)
 		mphy = dev->mt76.phy2;
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
