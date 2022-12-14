Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB01FC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Dec 2022 02:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qAl+m1OTr5en6yAHBXyL88TpRTYUyea0S1uSD/4DSXE=; b=Wey9RA9tgXKXWxXiUFQlfaMjm1
	7tnxj18pDAX+2U92HCyt/WOeo8/a9IPYXS7qG8PpFh9tbmy1uptXFiUGnG35x4+nvvAjlaIMW4XDP
	AC8C5qoq9ge+fYsCvzecaRV080ydiUNesGG1qz+p55oeIWd0lwRnSSNXZYps9ASeRKIJYH9XHDWT3
	vHfV9NmJy7ufZI/yBSDR3PgnUgVcdGgIWo/CaN/RBPInpHvp/LjaD/IvIhRh7zqw+TPl/U6cqEIWf
	CL7/zRU/pxFTULIyhGtIM7qCYAN3F90ze30vPopJ+3qSm/qx+kvonh8cEj0vDt36Javy4FiZphmkp
	VLmZHgng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5HzI-00B1ir-8G; Wed, 14 Dec 2022 02:59:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5HzG-00B1co-1k
	for linux-mediatek@lists.infradead.org; Wed, 14 Dec 2022 02:59:15 +0000
X-UUID: 6cd6de19e1a8488a8d39003b07d3a305-20221213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=qAl+m1OTr5en6yAHBXyL88TpRTYUyea0S1uSD/4DSXE=;
	b=vBzqekjkuFQbKIc5ALOS5OjaaPKfDPIRe5h89BnAaK0besoWChudU39KOMMfIbeZH8A+NjN8iPOqeWwoKJIQjiezpkm+JWXxgUrxls8Swvy9rjkCz0EV+a4GFr8Qt/AtnlaEGmENIGg+w74/Rc8HhUbF75ySvpsNULXd9mVLhjI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:00874169-b9fc-46b4-870d-d4aa744b8158,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:dcaaed0,CLOUDID:c5127217-b863-49f8-8228-cbdfeedd1fa4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 6cd6de19e1a8488a8d39003b07d3a305-20221213
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <howard-yh.hsu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2107839933; Tue, 13 Dec 2022 19:59:02 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 14 Dec 2022 10:28:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 14 Dec 2022 10:28:24 +0800
From: Howard Hsu <howard-yh.hsu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
	<ryder.Lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Howard Hsu
	<howard-yh.hsu@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v3 4/4] wifi: mt76: mt7915: add error message in mt7915_thermal_set_cur_throttle_state()
Date: Wed, 14 Dec 2022 10:28:09 +0800
Message-ID: <20221214022809.32087-5-howard-yh.hsu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221214022809.32087-1-howard-yh.hsu@mediatek.com>
References: <20221214022809.32087-1-howard-yh.hsu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_185914_128461_4AF21734 
X-CRM114-Status: GOOD (  13.25  )
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

Add dev_err so that it is easier to see invalid setting while looking at
dmesg.

Co-developed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Howard Hsu <howard-yh.hsu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/init.c   | 12 +++++++-----
 drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h |  2 ++
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 0ab9e1320fac..a89b37a320c0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -145,8 +145,11 @@ mt7915_thermal_set_cur_throttle_state(struct thermal_cooling_device *cdev,
 	u8 throttling = MT7915_THERMAL_THROTTLE_MAX - state;
 	int ret;
 
-	if (state > MT7915_CDEV_THROTTLE_MAX)
+	if (state > MT7915_CDEV_THROTTLE_MAX) {
+		dev_err(phy->dev->mt76.dev,
+			"please specify a valid throttling state\n");
 		return -EINVAL;
+	}
 
 	if (state == phy->cdev_state)
 		return 0;
@@ -175,7 +178,7 @@ static void mt7915_unregister_thermal(struct mt7915_phy *phy)
 	struct wiphy *wiphy = phy->mt76->hw->wiphy;
 
 	if (!phy->cdev)
-	    return;
+		return;
 
 	sysfs_remove_link(&wiphy->dev.kobj, "cooling_device");
 	thermal_cooling_device_unregister(phy->cdev);
@@ -209,8 +212,8 @@ static int mt7915_thermal_init(struct mt7915_phy *phy)
 		return PTR_ERR(hwmon);
 
 	/* initialize critical/maximum high temperature */
-	phy->throttle_temp[MT7915_CRIT_TEMP_IDX] = 110;
-	phy->throttle_temp[MT7915_MAX_TEMP_IDX] = 120;
+	phy->throttle_temp[MT7915_CRIT_TEMP_IDX] = MT7915_CRIT_TEMP;
+	phy->throttle_temp[MT7915_MAX_TEMP_IDX] = MT7915_MAX_TEMP;
 
 	return 0;
 }
@@ -1182,7 +1185,6 @@ static void mt7915_stop_hardware(struct mt7915_dev *dev)
 		mt7986_wmac_disable(dev);
 }
 
-
 int mt7915_register_device(struct mt7915_dev *dev)
 {
 	struct mt7915_phy *phy2;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index e58650bbbd14..942d70c53825 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -72,6 +72,8 @@
 
 #define MT7915_CRIT_TEMP_IDX		0
 #define MT7915_MAX_TEMP_IDX		1
+#define MT7915_CRIT_TEMP		110
+#define MT7915_MAX_TEMP			120
 
 struct mt7915_vif;
 struct mt7915_sta;
-- 
2.18.0


