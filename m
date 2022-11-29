Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75841C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Nov 2022 10:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vPZP8OXAsUHf4FSEg8/nwXU6njDiIjCMBp/8fZvopqI=; b=wDZftNuoIKt/7R9zA1v9V3Z7Pz
	6t7j29iuo3NnM86obaou+uuT+zLle+2zrpAnYS2vuRV+cuwav6aHunl1tVp2AAm/XvTy/3FvBnPOr
	zp72L+GgsXOMg4a+4qfckY6SaAHJt6P37T9kE4iZcbaLQQFxBPPcBD2sI1u99oir3cLt9bGJCD/YJ
	XRnLtfy83RDmZk/aQGd1Pw9cVXykuKNsat4ffS1zXLEUh2RqNL7X1Mec8FZOAgLYIuApuA2wOQefu
	qtluhnsJlhy7Hk7kg0xQkWWeeKtigDbG43fXi1wY5LyDWCm/etjHmG62ykCVelH8A6RCUHFPAatto
	rNjf4OdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozxgT-008A52-4q; Tue, 29 Nov 2022 10:17:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozxgP-008A3M-VS
	for linux-mediatek@lists.infradead.org; Tue, 29 Nov 2022 10:17:47 +0000
X-UUID: 13eda7d949b4495caa689759be31a696-20221129
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=vPZP8OXAsUHf4FSEg8/nwXU6njDiIjCMBp/8fZvopqI=;
	b=Kh8a4iLaWFBBw1W1JG/j113TLlO4YdsCdOydnClfdB9pZWxMfsTwLhvkdp0TYOoGN+gik/g+NCYbdTYP5kwZTdkQlm5fRPnOBcvUlWTbQbeKAde/JSyM0ZuQfdFII8fonH5hB7C3EzhcFy7oglUQ3oBWZxpi5MEbWTPe425O+L0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:352415a7-d18b-462f-b88b-505a09191b54,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:569a2330-2938-482e-aafd-98d66723b8a9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 13eda7d949b4495caa689759be31a696-20221129
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1157508718; Tue, 29 Nov 2022 03:17:40 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 29 Nov 2022 17:17:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 29 Nov 2022 17:17:00 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
	YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, Eric-SY
 Chang <Eric-SY.Chang@mediatek.com>, Deren Wu <Deren.Wu@mediatek.com>, KM Lin
	<km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
	<ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Stella Chang
	<Stella.Chang@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder
 Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
	linux-wireless <linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH v2 1/2] wifi: mt76: introduce reboot notifier support
Date: Tue, 29 Nov 2022 17:16:37 +0800
Message-ID: <d44631bcc74cce3f32a72f616a99d1bd2837690f.1669711916.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_021746_050944_1170D935 
X-CRM114-Status: GOOD (  13.47  )
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

Some combinations of hosts cannnot detect wifi chip after reboot. The
interoperability issue is caused by the status mismatch between host
and chip fw. In such cases, the driver should stop chip activities
and reset chip to default state before reboot.

This is a preliminary patch to add mt7921e reboot notifier support.

Reviewed-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 21 +++++++++++++++++++
 drivers/net/wireless/mediatek/mt76/mt76.h     |  2 ++
 2 files changed, 23 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index fc608b369b3c..a8515cb2527e 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -230,6 +230,22 @@ static void mt76_led_cleanup(struct mt76_dev *dev)
 	led_classdev_unregister(&dev->led_cdev);
 }
 
+static int mt76_notifier_init(struct mt76_dev *dev)
+{
+	if (!dev->reboot_nb.notifier_call)
+		return 0;
+
+	return register_reboot_notifier(&dev->reboot_nb);
+}
+
+static void mt76_notifier_cleanup(struct mt76_dev *dev)
+{
+	if (!dev->reboot_nb.notifier_call)
+		return;
+
+	unregister_reboot_notifier(&dev->reboot_nb);
+}
+
 static void mt76_init_stream_cap(struct mt76_phy *phy,
 				 struct ieee80211_supported_band *sband,
 				 bool vht)
@@ -658,6 +674,10 @@ int mt76_register_device(struct mt76_dev *dev, bool vht,
 			return ret;
 	}
 
+	ret = mt76_notifier_init(dev);
+	if (ret)
+		return ret;
+
 	ret = ieee80211_register_hw(hw);
 	if (ret)
 		return ret;
@@ -675,6 +695,7 @@ void mt76_unregister_device(struct mt76_dev *dev)
 
 	if (IS_ENABLED(CONFIG_MT76_LEDS))
 		mt76_led_cleanup(dev);
+	mt76_notifier_cleanup(dev);
 	mt76_tx_status_check(dev, true);
 	ieee80211_unregister_hw(hw);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 32a77a0ae9da..73a504016288 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -13,6 +13,7 @@
 #include <linux/leds.h>
 #include <linux/usb.h>
 #include <linux/average.h>
+#include <linux/reboot.h>
 #include <linux/soc/mediatek/mtk_wed.h>
 #include <net/mac80211.h>
 #include "util.h"
@@ -835,6 +836,7 @@ struct mt76_dev {
 		struct mt76_usb usb;
 		struct mt76_sdio sdio;
 	};
+	struct notifier_block reboot_nb;
 };
 
 struct mt76_power_limits {
-- 
2.18.0


