Return-Path: <SRS0=cpQ6=JW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50CFCC433B4
	for <linux-mediatek@archiver.kernel.org>; Sun, 25 Apr 2021 01:45:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E04F61207
	for <linux-mediatek@archiver.kernel.org>; Sun, 25 Apr 2021 01:45:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E04F61207
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=vivo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6qhtxEg1KrBAbP6h50s+AInLkRj/tHmz58gBbxMhqXY=; b=JsVpOv5Hiaa9c+A1CWyTbIM6aN
	gJZeTwD/BGdHztZKsRHCk18GFA4Ijf+oxbpcszgFYzxtxjG+XT4CyBYFhdrx1Bq8KHTyfHjVclSC4
	gJEPA8rB/92T23ymaE26UJdJN9t5PzMWrtilD64/qypfM8LHfeS8H/rJtTQXaPABZ9G6ybzeFhib+
	uZkuvwNgT3HnToUdfItr6uycNQ2yrlMNNmyCPm9UyAc6i/crrSEO301h+RSUSrPyTWTvQNtCo8aQP
	dHHm5qi+bcgqyEbUgYUWKPWqHCLBLec78yhP/h5Bde7qIObFih4LDRn710k+S84onxYCnBc5U+xze
	Qq+wNNBA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1laTpe-004neg-SA; Sun, 25 Apr 2021 01:45:10 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1laTot-004nbv-Q8; Sun, 25 Apr 2021 01:44:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=u2sot+SyP1QWsVISEKZPSGKQTXUfzv+y2Gi+M7KLj34=; b=TKBiXzZtHVnEkzdsnjSckaMDRe
 Ale20KbpdfTtyGdQBJzqjWRGSM/SD970v8KPMSr9VMpsMkK8P7n7eS9eaT1xm7BEfGS8uuxtxwEQ3
 MhO65k0UnNrCvrxNyTB67t3M5c5iu4GrW/VIKXNwpTcHMIoWShgavhBFji8Sl6yc8KOkTchzlfjCZ
 gsHhDk6arlJshOs4O4VXsGX/+982AVjhHMaqjUXHXsn3EMi/5U1g4OrJ6/Ve8FUcOHxJpXn0F6oKT
 CIVpmoUGGDTpYYkk1/7VmpPhR/MVSnFvp6KzOxyxdnD6jrL7RKUM4Lv1rm71fkI0ph0cEig4lHxoE
 wWZ+2UKA==;
Received: from mail-m17640.qiye.163.com ([59.111.176.40])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1laTop-00FE4k-4B; Sun, 25 Apr 2021 01:44:22 +0000
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown
 [58.250.176.229])
 by mail-m17640.qiye.163.com (Hmail) with ESMTPA id EEA0454018C;
 Sun, 25 Apr 2021 09:44:11 +0800 (CST)
From: Wang Qing <wangqing@vivo.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Wang Qing <wangqing@vivo.com>
Subject: [PATCH V8 1/2] watchdog: mtk: support pre-timeout when the bark irq
 is available
Date: Sun, 25 Apr 2021 09:44:02 +0800
Message-Id: <1619315043-1345-2-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619315043-1345-1-git-send-email-wangqing@vivo.com>
References: <1619315043-1345-1-git-send-email-wangqing@vivo.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZQ0wdGFZKSEtKTRhMHx5KGE1VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6N006Thw*Dz8cTwM8IjICCDcj
 SgwKFCJVSlVKTUpCSEpOS05JTUpKVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
 SU5LVUpMTVVJSUJZV1kIAVlBTU9MTDcG
X-HM-Tid: 0a7906b2ceead995kuwseea0454018c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210424_184419_519368_D0A55809 
X-CRM114-Status: GOOD (  20.05  )
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

Use the bark interrupt as the pretimeout notifier if available.

When the watchdog timer expires in dual mode, an interrupt will be
triggered first, then the timing restarts. The reset signal will be
initiated when the timer expires again.

The pretimeout notification shall occur at timeout-sec/2.

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

V6:
- Realize pretimeout processing through dualmode.

V7:
- Add set_pretimeout().

V8:
- Fix some formatting problems.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/watchdog/mtk_wdt.c | 76 +++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 71 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 97ca993..98a9b89
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -25,9 +25,10 @@
 #include <linux/reset-controller.h>
 #include <linux/types.h>
 #include <linux/watchdog.h>
+#include <linux/interrupt.h>
 
 #define WDT_MAX_TIMEOUT		31
-#define WDT_MIN_TIMEOUT		1
+#define WDT_MIN_TIMEOUT		2
 #define WDT_LENGTH_TIMEOUT(n)	((n) << 5)
 
 #define WDT_LENGTH		0x04
@@ -187,12 +188,19 @@ static int mtk_wdt_set_timeout(struct watchdog_device *wdt_dev,
 	u32 reg;
 
 	wdt_dev->timeout = timeout;
+	/*
+	 * In dual mode, irq will be triggered at timeout / 2
+	 * the real timeout occurs at timeout
+	 */
+	if (wdt_dev->pretimeout)
+		wdt_dev->pretimeout = timeout / 2;
 
 	/*
 	 * One bit is the value of 512 ticks
 	 * The clock has 32 KHz
 	 */
-	reg = WDT_LENGTH_TIMEOUT(timeout << 6) | WDT_LENGTH_KEY;
+	reg = WDT_LENGTH_TIMEOUT((timeout - wdt_dev->pretimeout) << 6)
+			| WDT_LENGTH_KEY;
 	iowrite32(reg, wdt_base + WDT_LENGTH);
 
 	mtk_wdt_ping(wdt_dev);
@@ -239,13 +247,47 @@ static int mtk_wdt_start(struct watchdog_device *wdt_dev)
 		return ret;
 
 	reg = ioread32(wdt_base + WDT_MODE);
-	reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
+	if (wdt_dev->pretimeout)
+		reg |= (WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
+	else
+		reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
 	reg |= (WDT_MODE_EN | WDT_MODE_KEY);
 	iowrite32(reg, wdt_base + WDT_MODE);
 
 	return 0;
 }
 
+static int mtk_wdt_set_pretimeout(struct watchdog_device *wdd,
+				  unsigned int timeout)
+{
+	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdd);
+	void __iomem *wdt_base = mtk_wdt->wdt_base;
+	u32 reg = ioread32(wdt_base + WDT_MODE);
+
+	if (timeout && !wdd->pretimeout) {
+		wdd->pretimeout = wdd->timeout / 2;
+		reg |= (WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
+	} else if (!timeout && wdd->pretimeout) {
+		wdd->pretimeout = 0;
+		reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
+	} else {
+		return 0;
+	}
+
+	iowrite32(reg, wdt_base + WDT_MODE);
+
+	return mtk_wdt_set_timeout(wdd, wdd->timeout);
+}
+
+static irqreturn_t mtk_wdt_isr(int irq, void *arg)
+{
+	struct watchdog_device *wdd = arg;
+
+	watchdog_notify_pretimeout(wdd);
+
+	return IRQ_HANDLED;
+}
+
 static const struct watchdog_info mtk_wdt_info = {
 	.identity	= DRV_NAME,
 	.options	= WDIOF_SETTIMEOUT |
@@ -253,12 +295,21 @@ static const struct watchdog_info mtk_wdt_info = {
 			  WDIOF_MAGICCLOSE,
 };
 
+static const struct watchdog_info mtk_wdt_pt_info = {
+	.identity	= DRV_NAME,
+	.options	= WDIOF_SETTIMEOUT |
+			  WDIOF_PRETIMEOUT |
+			  WDIOF_KEEPALIVEPING |
+			  WDIOF_MAGICCLOSE,
+};
+
 static const struct watchdog_ops mtk_wdt_ops = {
 	.owner		= THIS_MODULE,
 	.start		= mtk_wdt_start,
 	.stop		= mtk_wdt_stop,
 	.ping		= mtk_wdt_ping,
 	.set_timeout	= mtk_wdt_set_timeout,
+	.set_pretimeout	= mtk_wdt_set_pretimeout,
 	.restart	= mtk_wdt_restart,
 };
 
@@ -267,7 +318,7 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct mtk_wdt_dev *mtk_wdt;
 	const struct mtk_wdt_data *wdt_data;
-	int err;
+	int err, irq;
 
 	mtk_wdt = devm_kzalloc(dev, sizeof(*mtk_wdt), GFP_KERNEL);
 	if (!mtk_wdt)
@@ -279,7 +330,22 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 	if (IS_ERR(mtk_wdt->wdt_base))
 		return PTR_ERR(mtk_wdt->wdt_base);
 
-	mtk_wdt->wdt_dev.info = &mtk_wdt_info;
+	irq = platform_get_irq(pdev, 0);
+	if (irq > 0) {
+		err = devm_request_irq(&pdev->dev, irq, mtk_wdt_isr, 0, "wdt_bark",
+				       &mtk_wdt->wdt_dev);
+		if (err)
+			return err;
+
+		mtk_wdt->wdt_dev.info = &mtk_wdt_pt_info;
+		mtk_wdt->wdt_dev.pretimeout = WDT_MAX_TIMEOUT / 2;
+	} else {
+		if (irq == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+
+		mtk_wdt->wdt_dev.info = &mtk_wdt_info;
+	}
+
 	mtk_wdt->wdt_dev.ops = &mtk_wdt_ops;
 	mtk_wdt->wdt_dev.timeout = WDT_MAX_TIMEOUT;
 	mtk_wdt->wdt_dev.max_hw_heartbeat_ms = WDT_MAX_TIMEOUT * 1000;
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
