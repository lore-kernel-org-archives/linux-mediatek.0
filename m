Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC986C27C40
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Aug 2023 17:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ATrXCM7+qSOheR+SJgfPJ9Nees7z4bkd7+kSh3wvmIE=; b=bNHQSWhn2LVPCoDae0+GfwmpCj
	1CZgE5BKWw/fwd1/GjZ1efvV7lYtQtt0lkNX6nyTQz6TQRTmgZTfNZJgRLU8TQRsMuDdrHRQ0nGWv
	MB5qo6MVJTWV0AKGvbNR84OC0KCOKvPhCUuXMXAT9ERpglQc3jDJvsvB92AqF9Z1RwinkBSsTI8mb
	LuxoDtgibPKZjJ6b6IXlMdX04ATY3ilSgIcgZrVXxiIW0fQOcsmb0RPMGQ8jbt8N+PlERqKsHNS35
	Q/XkH8Jfd5d7L540XO1hT5T8Mxi2YW1mUWMuWLgYMfTwZhp5iwZh9PTrRA6UbD6Tndh0XbNnBSMti
	YuAvHFLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZDpB-003ViJ-2D;
	Thu, 24 Aug 2023 17:08:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZDp8-003VhN-0o
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Aug 2023 17:08:47 +0000
X-UUID: dfb86cf042a011ee912e1518a6540028-20230824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ATrXCM7+qSOheR+SJgfPJ9Nees7z4bkd7+kSh3wvmIE=;
	b=QBwSREAKif2TGXY/DJDuAcHsgOxxB2Md/Bioo7/JUezqWe0p29tkfQUQKaOIe4AhAfEFmW4zS3Jbd8NXkTkcVAcjaGJ5R6pmgC32Rbirr/v4uYdgrYgIH+B5lFUURuHd1AK0Bw8EpejJCRJzygUBmdOQfpkYgMCzjatxfks1WIQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:6ca6d9bd-4aa0-410b-9e58-2a8824a9ccf7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:1353e9ee-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: dfb86cf042a011ee912e1518a6540028-20230824
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1059683649; Thu, 24 Aug 2023 10:08:41 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 25 Aug 2023 01:08:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 25 Aug 2023 01:08:38 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>,
	"Alexey D . Filimonov" <alexey@filimonic.net>
Subject: [PATCH] wifi: mt76: add ability to explicitly forbid LED registration with DT
Date: Fri, 25 Aug 2023 01:08:37 +0800
Message-ID: <b08ef4d7c91c54e273c61784272e5c6f70c3c137.1692896654.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_100846_302703_D906337C 
X-CRM114-Status: GOOD (  11.25  )
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

Add ability to explicitly forbid LED registration using DT led\status = "disabled".

Tested-by: Alexey D. Filimonov <alexey@filimonic.net>
Signed-off-by: Alexey D. Filimonov <alexey@filimonic.net>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 39 ++++++++++++-------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index c0ff36a98bed..f768d9aed456 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -198,10 +198,33 @@ static int mt76_led_init(struct mt76_phy *phy)
 {
 	struct mt76_dev *dev = phy->dev;
 	struct ieee80211_hw *hw = phy->hw;
+	struct device_node *np = dev->dev->of_node;
 
 	if (!phy->leds.cdev.brightness_set && !phy->leds.cdev.blink_set)
 		return 0;
 
+	np = of_get_child_by_name(np, "led");
+	if (np) {
+		if (!of_device_is_available(np)) {
+			of_node_put(np);
+			dev_info(dev->dev,
+				"led registration was explicitly disabled by dts\n");
+			return 0;
+		}
+
+		if (phy == &dev->phy) {
+			int led_pin;
+
+			if (!of_property_read_u32(np, "led-sources", &led_pin))
+				phy->leds.pin = led_pin;
+
+			phy->leds.al =
+				of_property_read_bool(np, "led-active-low");
+		}
+
+		of_node_put(np);
+	}
+
 	snprintf(phy->leds.name, sizeof(phy->leds.name), "mt76-%s",
 		 wiphy_name(hw->wiphy));
 
@@ -212,20 +235,8 @@ static int mt76_led_init(struct mt76_phy *phy)
 					mt76_tpt_blink,
 					ARRAY_SIZE(mt76_tpt_blink));
 
-	if (phy == &dev->phy) {
-		struct device_node *np = dev->dev->of_node;
-
-		np = of_get_child_by_name(np, "led");
-		if (np) {
-			int led_pin;
-
-			if (!of_property_read_u32(np, "led-sources", &led_pin))
-				phy->leds.pin = led_pin;
-			phy->leds.al = of_property_read_bool(np,
-							     "led-active-low");
-			of_node_put(np);
-		}
-	}
+	dev_info(dev->dev,
+		"registering led '%s'\n", phy->leds.name);
 
 	return led_classdev_register(dev->dev, &phy->leds.cdev);
 }
-- 
2.18.0


