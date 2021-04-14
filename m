Return-Path: <SRS0=Strr=JL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CDDBC433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 11:49:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3761611B0
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 11:49:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3761611B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=vivo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZLf05ZXnISzIQkLLMH3TPaywx0EauxZMoC5NqbjKDJM=; b=ng79OTfW+MfJj6iorU/UTXvjqc
	3Wjt5xsdPSMCjFAK0Yvk091J1y78oZBLgov9wObe5jyKj1MPi3dx6iZTvRhjObTCZb09+5nIklPyu
	LBdFE0wCVd4/4apiENKMn7Fl9hzupwhDsCxHeuonQbmlOh/AesTLXMXRFmZ2BWuim9HtpZNzGQX5m
	knUpquyyXohQVGqOijEtj4pcDqD5OblpVR15LVtzwENcz5I14hvkgzF4MEUV5144rE5sLEHvY0OKr
	pYmPtZaqIMliFU56kz+Pg3L25Mv30BLawM9LfiiCAL6pwQDEGHrtUvPJOXa7U/ZTkBQ+jDu6BHhoz
	qZMPaIEQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWe1M-00CUuU-Ap; Wed, 14 Apr 2021 11:49:24 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWe13-00CUrS-0d; Wed, 14 Apr 2021 11:49:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=bEv/GxCxiv9wVrIM0Qh4dEAYnA7Pv5AN1drs0aLRSmA=; b=mhNGxCtXNvTYNPqbN8pRYHPEC3
 CkpA6Y9yKtFfiwscJImZEAIBDoeAowZH9Z1e++wUMNQX0EGlDMdF4luVKINn+BcytC9ZazHPZnI3u
 MnotsUUzMq1/qraEifTz4ltcNOX9sXL7C57A06Lz3iUBVzGH6xuUuRal2ZbXZYp7sH1mBn9vhTckE
 flrBR65TmxtcdC4uhmn3mNoI06yxJNadj0z/xfi3h0ij8RPEzuu+v/qJtDhae3N6JIIMEFboUTvv5
 EYxFzqxNL4jsh6lmHab0QQCuznVyzcZz0LDn23zBHDILbCasP/HTGQl4j5WcsTGCi+N3L7mYUtPYq
 QYqJy1wg==;
Received: from mail-m121145.qiye.163.com ([115.236.121.145])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWe0w-007ivZ-S9; Wed, 14 Apr 2021 11:49:01 +0000
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.232])
 by mail-m121145.qiye.163.com (Hmail) with ESMTPA id 04A988004B0;
 Wed, 14 Apr 2021 19:48:53 +0800 (CST)
From: Wang Qing <wangqing@vivo.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Wang Qing <wangqing@vivo.com>
Subject: [PATCH V3] watchdog: mtk: support pre-timeout when the bark irq is
 available
Date: Wed, 14 Apr 2021 19:48:49 +0800
Message-Id: <1618400929-17013-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGh9MSFZPHRkYQ0IYThhLSUxVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mwg6PDo4Ez8XFhNPAksqPzNR
 M0IaCyFVSlVKTUpDT0tLQkhPTU5PVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
 SU5KVUxPVUlISVlXWQgBWUFOSkNMNwY+
X-HM-Tid: 0a78d036799eb03akuuu04a988004b0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_044859_092804_081B2D39 
X-CRM114-Status: GOOD (  17.91  )
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

By default, the pretimeout notification shall occur one second earlier
than the timeout.

V2:
- panic() by default if WATCHDOG_PRETIMEOUT_GOV is not enabled.

V3:
- Modify the pretimeout behavior, manually reset after the pretimeout
- is processed and wait until timeout.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/watchdog/mtk_wdt.c | 62 ++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 57 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 97ca993..7bef1e3
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -25,6 +25,7 @@
 #include <linux/reset-controller.h>
 #include <linux/types.h>
 #include <linux/watchdog.h>
+#include <linux/interrupt.h>
 
 #define WDT_MAX_TIMEOUT		31
 #define WDT_MIN_TIMEOUT		1
@@ -234,18 +235,46 @@ static int mtk_wdt_start(struct watchdog_device *wdt_dev)
 	void __iomem *wdt_base = mtk_wdt->wdt_base;
 	int ret;
 
-	ret = mtk_wdt_set_timeout(wdt_dev, wdt_dev->timeout);
+	ret = mtk_wdt_set_timeout(wdt_dev, wdt_dev->timeout - wdt_dev->pretimeout);
 	if (ret < 0)
 		return ret;
 
 	reg = ioread32(wdt_base + WDT_MODE);
-	reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
+	reg &= ~WDT_MODE_IRQ_EN;
+	if (wdt_dev->pretimeout)
+		reg |= WDT_MODE_IRQ_EN;
+	else
+		reg &= ~WDT_MODE_IRQ_EN;
 	reg |= (WDT_MODE_EN | WDT_MODE_KEY);
 	iowrite32(reg, wdt_base + WDT_MODE);
 
 	return 0;
 }
 
+static int mtk_wdt_set_pretimeout(struct watchdog_device *wdd,
+				   unsigned int timeout)
+{
+	wdd->pretimeout = timeout;
+	return mtk_wdt_start(wdd);
+}
+
+static irqreturn_t mtk_wdt_isr(int irq, void *arg)
+{
+	struct watchdog_device *wdd = arg;
+	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdd);
+	void __iomem *wdt_base = mtk_wdt->wdt_base;
+
+	watchdog_notify_pretimeout(wdd);
+	/*
+	 * Guaranteed to be reset when the timeout
+	 * expires under any situations
+	 */
+	mdelay(1000*wdd->pretimeout);
+	writel(WDT_SWRST_KEY, wdt_base + WDT_SWRST);
+
+	return IRQ_HANDLED;
+}
+
 static const struct watchdog_info mtk_wdt_info = {
 	.identity	= DRV_NAME,
 	.options	= WDIOF_SETTIMEOUT |
@@ -253,12 +282,21 @@ static const struct watchdog_info mtk_wdt_info = {
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
 
@@ -267,7 +305,7 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct mtk_wdt_dev *mtk_wdt;
 	const struct mtk_wdt_data *wdt_data;
-	int err;
+	int err, irq;
 
 	mtk_wdt = devm_kzalloc(dev, sizeof(*mtk_wdt), GFP_KERNEL);
 	if (!mtk_wdt)
@@ -279,7 +317,22 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 	if (IS_ERR(mtk_wdt->wdt_base))
 		return PTR_ERR(mtk_wdt->wdt_base);
 
-	mtk_wdt->wdt_dev.info = &mtk_wdt_info;
+	irq = platform_get_irq(pdev, 0);
+	if (irq > 0) {
+		err = devm_request_irq(&pdev->dev, irq, mtk_wdt_isr, 0, "wdt_bark",
+							&mtk_wdt->wdt_dev);
+		if (err)
+			return err;
+
+		mtk_wdt->wdt_dev.info = &mtk_wdt_pt_info;
+		mtk_wdt->wdt_dev.pretimeout = 1;
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
@@ -360,7 +413,6 @@ static struct platform_driver mtk_wdt_driver = {
 };
 
 module_platform_driver(mtk_wdt_driver);
-
 module_param(timeout, uint, 0);
 MODULE_PARM_DESC(timeout, "Watchdog heartbeat in seconds");
 
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
