Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ED65C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 08:06:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E62561436
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 08:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E62561436
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=vivo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gChiciHqlPGEMsMDvIp26WnM/xkN/Ekt+AY7uTOk4jc=; b=CErhBk9x9ldyfzMaappHZT9hmU
	9pU5HeBNAsQieAY2PzbhNHGMF9RROdDrRuB/+PJoCApATtquUKzoxfN9Ub8OvuwZhnb18m8S+U8Uq
	qQsxCo2CHPH1Y0//CC2r1tLFdEMLso48GvXYDuHc7l7sxwBAvGhTczRFCwC8vtlUff0EJPNNVHBx3
	F3LpXGfi6l2LcxE6/0XKsiv7B9hwOK/wI0+wvXhx8JZ81ErJ0U1zHiPLGfzXwfLpUX2KaAWDHFbmZ
	OFRjacADETC2aRZy2+a9P5m8PO9liNc/bRX5kt2Qq6LGSD1aU4OTxIn2qn0YvpSHwqnhpOSbLBcS3
	ETPNQIVg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZ7rk-00Dwlz-CS; Wed, 21 Apr 2021 08:05:44 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ7rW-00Dwkl-Cc; Wed, 21 Apr 2021 08:05:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=i1Pmk3QjT5A2d7WiKTC9GTH9MuhVEyzNXz/X3m2gX48=; b=n+A22sKJ6utqOskMTovE4Cpoit
 +C4bb/BWH+7s87y2255PGEsEIQYkO2/mN9hxHIo/IsRLNiqD4j3b4VSynBNwn7nvx0PhQEitcdPur
 EYsjkNeRipdUNVVEY2AS5aPJ2I7fmsOBXgOP1Dj4cNO+Mh6nQsoUv7ya0Sn4DQJnKBnnGx49ftToH
 Q5DiOzuThl5OJx6+RdNbjxELqtQESh+jiLjhabYBEHtUfPeKTX+wGDYLClaPAkzir7SBC3HDgH2Th
 4IIKMD9CGORynWEcLrfV8yOrtys8JOC2ZrT/tZlBxZZXl0LY6tCclHTJ430cM9KE0mUHeT3wJW+ls
 fNA3hKig==;
Received: from mail-m121145.qiye.163.com ([115.236.121.145])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ7rN-00Ch6A-7D; Wed, 21 Apr 2021 08:05:25 +0000
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.232])
 by mail-m121145.qiye.163.com (Hmail) with ESMTPA id 90E7D8003C6;
 Wed, 21 Apr 2021 16:05:12 +0800 (CST)
From: Wang Qing <wangqing@vivo.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Wang Qing <wangqing@vivo.com>
Subject: [PATCH V5] watchdog: mtk: support dual mode when the bark irq is
 available
Date: Wed, 21 Apr 2021 16:05:04 +0800
Message-Id: <1618992304-18903-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZQkkaS1ZMSUNKTU1DQ01LHh5VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NEk6MRw6TT8SMAgjPEMLTh8S
 MBkKFBlVSlVKTUpDQkJJSEpISENCVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
 SU5KVUxPVUlISVlXWQgBWUFPQ05MNwY+
X-HM-Tid: 0a78f376321db03akuuu90e7d8003c6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_010521_448963_F7F2C512 
X-CRM114-Status: GOOD (  17.19  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Support using irq handling wdt bark first instead of directly resetting.

When the watchdog timer expires in dual mode, an interrupt will be
triggered first, then the timing restarts. The reset signal will be
initiated when the timer expires again.

The dual mode is disabled by default.

V2:
- panic() by default if WATCHDOG_PRETIMEOUT_GOV is not enabled.

V3:
- Modify the pretimeout behavior, manually reset after the pretimeout
- is processed and wait until timeout.

V4:
- Remove pretimeout related processing. 
- Add dual mode control separately.

V5:
- Fix some formatting and printing problems.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/watchdog/mtk_wdt.c | 36 ++++++++++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 97ca993..40122f8
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -25,6 +25,7 @@
 #include <linux/reset-controller.h>
 #include <linux/types.h>
 #include <linux/watchdog.h>
+#include <linux/interrupt.h>
 
 #define WDT_MAX_TIMEOUT		31
 #define WDT_MIN_TIMEOUT		1
@@ -57,6 +58,7 @@
 
 static bool nowayout = WATCHDOG_NOWAYOUT;
 static unsigned int timeout;
+static bool dual_mode;
 
 struct mtk_wdt_dev {
 	struct watchdog_device wdt_dev;
@@ -239,13 +241,23 @@ static int mtk_wdt_start(struct watchdog_device *wdt_dev)
 		return ret;
 
 	reg = ioread32(wdt_base + WDT_MODE);
-	reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
+	if (dual_mode)
+		reg |= (WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
+	else
+		reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
 	reg |= (WDT_MODE_EN | WDT_MODE_KEY);
 	iowrite32(reg, wdt_base + WDT_MODE);
 
 	return 0;
 }
 
+static irqreturn_t mtk_wdt_isr(int irq, void *arg)
+{
+	panic("wdt bark!\n");
+
+	return IRQ_HANDLED;
+}
+
 static const struct watchdog_info mtk_wdt_info = {
 	.identity	= DRV_NAME,
 	.options	= WDIOF_SETTIMEOUT |
@@ -267,7 +279,7 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct mtk_wdt_dev *mtk_wdt;
 	const struct mtk_wdt_data *wdt_data;
-	int err;
+	int err, irq;
 
 	mtk_wdt = devm_kzalloc(dev, sizeof(*mtk_wdt), GFP_KERNEL);
 	if (!mtk_wdt)
@@ -279,6 +291,19 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 	if (IS_ERR(mtk_wdt->wdt_base))
 		return PTR_ERR(mtk_wdt->wdt_base);
 
+	if (dual_mode) {
+		irq = platform_get_irq(pdev, 0);
+		if (irq > 0) {
+			err = devm_request_irq(&pdev->dev, irq, mtk_wdt_isr, 0, "wdt_bark",
+						&mtk_wdt->wdt_dev);
+			if (err)
+				return err;
+		} else {
+			dual_mode = 0;
+			dev_info(&pdev->dev, "couldn't get wdt irq, set dual_mode = 0\n");
+		}
+	}
+
 	mtk_wdt->wdt_dev.info = &mtk_wdt_info;
 	mtk_wdt->wdt_dev.ops = &mtk_wdt_ops;
 	mtk_wdt->wdt_dev.timeout = WDT_MAX_TIMEOUT;
@@ -299,8 +324,8 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 	if (unlikely(err))
 		return err;
 
-	dev_info(dev, "Watchdog enabled (timeout=%d sec, nowayout=%d)\n",
-		 mtk_wdt->wdt_dev.timeout, nowayout);
+	dev_info(dev, "Watchdog enabled (timeout=%d sec, nowayout=%d,
+		 dual_mode=%d)\n", mtk_wdt->wdt_dev.timeout, nowayout, dual_mode);
 
 	wdt_data = of_device_get_match_data(dev);
 	if (wdt_data) {
@@ -368,6 +393,9 @@ module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
 			__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 
+module_param(dual_mode, bool, 0);
+MODULE_PARM_DESC(dual_mode, "Dual mode triggers irq before reset (default=0)");
+
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Matthias Brugger <matthias.bgg@gmail.com>");
 MODULE_DESCRIPTION("Mediatek WatchDog Timer Driver");
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
