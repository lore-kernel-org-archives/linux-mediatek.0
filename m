Return-Path: <SRS0=zTQl=5Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9CAAC43331
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Mar 2020 04:09:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CAE82072D
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Mar 2020 04:09:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LgL8aWop";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="EYfsIvCI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CAE82072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XF4ZPeDfyH1xOZcf0qOGT7TDq4uOdsw2hB4PdIueaBM=; b=LgL8aWopOLhJle
	s66SYPCOvo9tvqPVfnWNdpVTVmD/XjJNf/1IhNKE0DvTsTq6EMhQSqFWlI//Xbg3yrzPDPAFceWaG
	7JQK4QuYFMKqdoyir8zkLQl/QYuYJSan8K17Kr0Dez15n50R/hpnI49rJw9cFHMCgIPvF2QpNU2P4
	XBlUvbg20eFLwLRvZEDf8Uy50TRO2HPJ6/En9Xh/UlV9Wo1S88LBoeF6xQpdRlL0J0IXZG7WozBtk
	Sek0FQCv6q7E3Pk4Pj3HKqdcKcXHzWuplI12IbcIRRDS3WKQAO2ZG5rjdKvJQbRNtY4S24DU0/wVb
	1RMtSr6LcG8x7gBT9pHw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJ8De-0005Z4-R7; Tue, 31 Mar 2020 04:09:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJ8Br-0003ke-Px; Tue, 31 Mar 2020 04:07:53 +0000
X-UUID: 92c55c479f8a4f4cb1a81910a3dc1993-20200330
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=U6Q1mnGYOtg9IfYqJ21CXjqAm8LRNeM9DhjP0Pg/xQ0=; 
 b=EYfsIvCI9hHqNbvDNZW1zFIDluugQDmBoJEPJ0bwFfd+mk/Vt9NiC10K1L18MWEqM4X6Lk9nE1To/9ZOQCAS/YNV8H83OKULCSuRfMX0xSA/tbLFV0WrGNgnETWQZ1UCm7EUCcuMxrXiouuDqp8E5Zgt8xNy5BGmiAs5wtvC7jQ=;
X-UUID: 92c55c479f8a4f4cb1a81910a3dc1993-20200330
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1417924162; Mon, 30 Mar 2020 20:07:31 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 30 Mar 2020 21:07:40 -0700
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 31 Mar 2020 12:07:39 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 31 Mar 2020 12:07:40 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Subject: [PATCH v11 4/5] rtc: mt6397: Add support for the MediaTek MT6358 RTC
Date: Tue, 31 Mar 2020 12:07:36 +0800
Message-ID: <1585627657-3265-5-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1585627657-3265-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1585627657-3265-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200330_210751_912759_BAC4FB46 
X-CRM114-Status: GOOD (  14.88  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Alessandro Zummo <a.zummo@towertech.it>, Josef Friedl <josef.friedl@speed.at>,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Frank Wunderlich <frank-w@public-files.de>, Ran Bi <ran.bi@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, linux-rtc@vger.kernel.org,
 Sebastian Reichel <sre@kernel.org>, linux-kernel@vger.kernel.org, Richard
 Fontana <rfontana@redhat.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, linux-pm@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Eddie Huang <eddie.huang@mediatek.com>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Ran Bi <ran.bi@mediatek.com>

This add support for the MediaTek MT6358 RTC. Driver using
compatible data to store different RTC_WRTGR address offset.
This replace RTC_WRTGR to RTC_WRTGR_MT6323 in mt6323-poweroff
driver which only needed by armv7 CPU without ATF.

Signed-off-by: Ran Bi <ran.bi@mediatek.com>
Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
---
 drivers/power/reset/mt6323-poweroff.c |  2 +-
 drivers/rtc/rtc-mt6397.c              | 23 +++++++++++++++++++----
 include/linux/mfd/mt6397/rtc.h        |  9 ++++++++-
 3 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/power/reset/mt6323-poweroff.c b/drivers/power/reset/mt6323-poweroff.c
index 1caf43d..0532803 100644
--- a/drivers/power/reset/mt6323-poweroff.c
+++ b/drivers/power/reset/mt6323-poweroff.c
@@ -30,7 +30,7 @@ static void mt6323_do_pwroff(void)
 	int ret;
 
 	regmap_write(pwrc->regmap, pwrc->base + RTC_BBPU, RTC_BBPU_KEY);
-	regmap_write(pwrc->regmap, pwrc->base + RTC_WRTGR, 1);
+	regmap_write(pwrc->regmap, pwrc->base + RTC_WRTGR_MT6323, 1);
 
 	ret = regmap_read_poll_timeout(pwrc->regmap,
 					pwrc->base + RTC_BBPU, val,
diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index cda238d..7f3dfd2 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -9,6 +9,7 @@
 #include <linux/mfd/mt6397/core.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/rtc.h>
@@ -20,7 +21,7 @@ static int mtk_rtc_write_trigger(struct mt6397_rtc *rtc)
 	int ret;
 	u32 data;
 
-	ret = regmap_write(rtc->regmap, rtc->addr_base + RTC_WRTGR, 1);
+	ret = regmap_write(rtc->regmap, rtc->addr_base + rtc->data->wrtgr, 1);
 	if (ret < 0)
 		return ret;
 
@@ -269,6 +270,8 @@ static int mtk_rtc_probe(struct platform_device *pdev)
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	rtc->addr_base = res->start;
 
+	rtc->data = of_device_get_match_data(&pdev->dev);
+
 	rtc->irq = platform_get_irq(pdev, 0);
 	if (rtc->irq < 0)
 		return rtc->irq;
@@ -325,10 +328,22 @@ static int mt6397_rtc_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(mt6397_pm_ops, mt6397_rtc_suspend,
 			mt6397_rtc_resume);
 
+static const struct mtk_rtc_data mt6358_rtc_data = {
+	.wrtgr = RTC_WRTGR_MT6358,
+};
+
+static const struct mtk_rtc_data mt6397_rtc_data = {
+	.wrtgr = RTC_WRTGR_MT6397,
+};
+
 static const struct of_device_id mt6397_rtc_of_match[] = {
-	{ .compatible = "mediatek,mt6323-rtc", },
-	{ .compatible = "mediatek,mt6397-rtc", },
-	{ }
+	{ .compatible = "mediatek,mt6323-rtc",
+		.data = &mt6397_rtc_data, },
+	{ .compatible = "mediatek,mt6358-rtc",
+		.data = &mt6358_rtc_data, },
+	{ .compatible = "mediatek,mt6397-rtc",
+		.data = &mt6397_rtc_data, },
+	{}
 };
 MODULE_DEVICE_TABLE(of, mt6397_rtc_of_match);
 
diff --git a/include/linux/mfd/mt6397/rtc.h b/include/linux/mfd/mt6397/rtc.h
index 7dfb63b..6200f3b 100644
--- a/include/linux/mfd/mt6397/rtc.h
+++ b/include/linux/mfd/mt6397/rtc.h
@@ -18,7 +18,9 @@
 #define RTC_BBPU_CBUSY         BIT(6)
 #define RTC_BBPU_KEY            (0x43 << 8)
 
-#define RTC_WRTGR              0x003c
+#define RTC_WRTGR_MT6358       0x3a
+#define RTC_WRTGR_MT6397       0x3c
+#define RTC_WRTGR_MT6323       RTC_WRTGR_MT6397
 
 #define RTC_IRQ_STA            0x0002
 #define RTC_IRQ_STA_AL         BIT(0)
@@ -65,6 +67,10 @@
 #define MTK_RTC_POLL_DELAY_US  10
 #define MTK_RTC_POLL_TIMEOUT   (jiffies_to_usecs(HZ))
 
+struct mtk_rtc_data {
+	u32                     wrtgr;
+};
+
 struct mt6397_rtc {
 	struct device           *dev;
 	struct rtc_device       *rtc_dev;
@@ -74,6 +80,7 @@ struct mt6397_rtc {
 	struct regmap           *regmap;
 	int                     irq;
 	u32                     addr_base;
+	const struct mtk_rtc_data *data;
 };
 
 #endif /* _LINUX_MFD_MT6397_RTC_H_ */
-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
