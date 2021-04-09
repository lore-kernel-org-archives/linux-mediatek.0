Return-Path: <SRS0=HbKG=JG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8493DC433ED
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 09:56:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D05061205
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 09:56:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D05061205
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=vivo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NzuqvQpjTe8QFiXGgj1K177Fe5Xm8j/1EJvCec3PWrc=; b=ncIuYmfdjxhtJVRtwxhfYG01r9
	UyG/0kZt8ctnHGAF0F5XU0uX/G/eDV4cdKrsEDvbHKOHHlnyozM56NcL6FAKVIsdBlTf5oS+qfl5t
	XxgKdhfO2v+rIgCsJMHfjwo/A2lyOJuSnr72Gck+CG84aLC3/2moJKpcAI74onTYx989VXRr/t7jS
	pmhlzB5+dh7jXEvKDeRYv12/L8xXBdyDhDaZvnHXLX61xEiPQJX++4ivoSS6BNzk0CfxiR+hj8yjF
	2YnjnEJJkHSBO6d8ucZrE5VDkaW8pcCTqGWLck1FIjmXrNJ0BOFHBUz/6G70OjplQFmNUSYbPKuyo
	0MszN2/Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUnsN-000L0g-VN; Fri, 09 Apr 2021 09:56:32 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUns9-000KxS-7q; Fri, 09 Apr 2021 09:56:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=SsAWEm0CdQzvrlDjOzpU5/TAZPSREwdHBqnCvEJkzfQ=; b=azwwUq+TVnbDMIgtXgVXA1gJ9e
 i158+9gLwAHaRDpZjmjucJQGxYEi7Y0Vg6JumEDa+uHvSsTauwBLK90vwI77X1mEF+5A3djv+781i
 z4mAyxZjOJg8qUwOJia5wpI4Hm4WPv2G+HHqEL/I+r6zEG62uLE/ZlVoZc/Wcwi/XBvFpuoL7d73m
 tAZEt0e6e6MvczhX3YSJJyYnHK7n9ZUJk7zkrrPhU7P+KtbCJgCS7qQArLgIsfi9ADJtcJq9Z3Tlk
 bo6lg1JoxLu4azm3S/T8Z3HZmSdk0IEcKvtIYOnpAzjFeIt/EC8TaOLu9F4l5P1I+IqARrDgjG8lD
 xAklrVXQ==;
Received: from mail-m121145.qiye.163.com ([115.236.121.145])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUns3-00459x-TM; Fri, 09 Apr 2021 09:56:13 +0000
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown
 [58.250.176.229])
 by mail-m121145.qiye.163.com (Hmail) with ESMTPA id 4634F8001A9;
 Fri,  9 Apr 2021 17:56:01 +0800 (CST)
From: Wang Qing <wangqing@vivo.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Wang Qing <wangqing@vivo.com>
Subject: [PATCH] watchdog: mtk: support pre-timeout when the bark irq is
 available
Date: Fri,  9 Apr 2021 17:55:42 +0800
Message-Id: <1617962142-28795-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZQ01CGFYeH0kaHktIGUMaGkhVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NDI6Nzo5ET8TFhoTCQIuKike
 CE8KCRVVSlVKTUpMQk1JSk1KQ0NDVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
 SU5LVUpMTVVJSUJZV1kIAVlBT09LQjcG
X-HM-Tid: 0a78b60f5596b03akuuu4634f8001a9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_025612_160082_C4C99477 
X-CRM114-Status: GOOD (  15.10  )
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

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/watchdog/mtk_wdt.c | 47 +++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 44 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 97ca993..8b919cc
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -25,6 +25,7 @@
 #include <linux/reset-controller.h>
 #include <linux/types.h>
 #include <linux/watchdog.h>
+#include <linux/interrupt.h>
 
 #define WDT_MAX_TIMEOUT		31
 #define WDT_MIN_TIMEOUT		1
@@ -234,18 +235,35 @@ static int mtk_wdt_start(struct watchdog_device *wdt_dev)
 	void __iomem *wdt_base = mtk_wdt->wdt_base;
 	int ret;
 
-	ret = mtk_wdt_set_timeout(wdt_dev, wdt_dev->timeout);
+	ret = mtk_wdt_set_timeout(wdt_dev, wdt_dev->timeout - wdt_dev->pretimeout);
 	if (ret < 0)
 		return ret;
 
 	reg = ioread32(wdt_base + WDT_MODE);
 	reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
+	if (wdt_dev->pretimeout)
+		reg |= WDT_MODE_IRQ_EN;
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
+	watchdog_notify_pretimeout(wdd);
+
+	return IRQ_HANDLED;
+}
+
 static const struct watchdog_info mtk_wdt_info = {
 	.identity	= DRV_NAME,
 	.options	= WDIOF_SETTIMEOUT |
@@ -253,12 +271,21 @@ static const struct watchdog_info mtk_wdt_info = {
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
 
@@ -267,7 +294,7 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct mtk_wdt_dev *mtk_wdt;
 	const struct mtk_wdt_data *wdt_data;
-	int err;
+	int err,irq;
 
 	mtk_wdt = devm_kzalloc(dev, sizeof(*mtk_wdt), GFP_KERNEL);
 	if (!mtk_wdt)
@@ -279,7 +306,21 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 	if (IS_ERR(mtk_wdt->wdt_base))
 		return PTR_ERR(mtk_wdt->wdt_base);
 
-	mtk_wdt->wdt_dev.info = &mtk_wdt_info;
+	irq = platform_get_irq(pdev, 0);
+	if (irq > 0) {
+		err = devm_request_irq(&pdev->dev, irq, mtk_wdt_isr, 0, "wdt_bark", &mtk_wdt->wdt_dev);
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
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
