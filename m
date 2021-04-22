Return-Path: <SRS0=s7tg=JT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA2FDC433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 02:53:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61DC861404
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 02:53:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61DC861404
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=vivo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4tzxp4XpLczSfXB/xAocbS7BeI2XIbNuWuzWqbcggK4=; b=hYL6+Dslp0VDf0lNRPiHefS9vH
	D6zVxoeSN3eSGeY1c50H0RK26PRKUJlfWEB2Dt41S6MnQG1gGkxT1wrBT6S5YIxIkhq8ydLSaOA44
	qknmBysEHN2dVfXSMDM0Byo3OenRJql3tt987SXaYG7+loddWi9fdvWZ49+GaBT4URSagMkO62tSM
	2f1lTt1pN4ZPpsJE72vQXSGzgOKgt0I8ENPXNZPYw41zU5khSrHdxF/BifmGaT8vin3b1otj2DKDC
	DTcKqIlQQ8Jz7MCQJekxlDoIjqyHk1wmBpoWzo5xUtuLgwsrvYNc8Uflqy7En5akFRJ9AD8t/cYOn
	FXo5I6ig==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZPSm-00FeKK-NI; Thu, 22 Apr 2021 02:53:12 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZPLi-00Fdv2-ID; Thu, 22 Apr 2021 02:46:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=y22qPiCaFBHD84LV8zB11jmj5l5iL3ZVhH98hN+4LSg=; b=0MhFgXkQPxYyBRj8hVWbM1cO3m
 fbXcfAiWJox2uwRGVGdRg2P1tsOxAvsEy3vnvl0NVtxsXP53ccXEHJsXkk9iPOiO7Liu8a105Zfic
 MEPoHFjKCdHgM848sHZ3Pf4VUoM1Q0GCEn6r7wVkaTs4aiw6bu4t0kPrhY3PkA4NWtBKiZuKm2PO1
 QiFKklMFWCoBVE347doic1svRFYmBVYLzeQWc78L3TXqqQQZ8Mwl+s3cIMSD1e9H0MMdMbPD3x8EI
 Dfp7Pp72g3JNV0bga6T12M2wcI40HJCI6Tg2TijrQT2UkCauQgJwZsLpfScCeU/5M1o0EMuNidCKT
 RWN7hcQg==;
Received: from mail-m121145.qiye.163.com ([115.236.121.145])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZPLd-00DKUw-Of; Thu, 22 Apr 2021 02:45:47 +0000
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.232])
 by mail-m121145.qiye.163.com (Hmail) with ESMTPA id CF2B2800221;
 Thu, 22 Apr 2021 10:45:41 +0800 (CST)
From: Wang Qing <wangqing@vivo.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Wang Qing <wangqing@vivo.com>
Subject: [PATCH V6 1/2] watchdog: mtk: support pre-timeout when the bark irq
 is available
Date: Thu, 22 Apr 2021 10:45:31 +0800
Message-Id: <1619059532-17805-2-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619059532-17805-1-git-send-email-wangqing@vivo.com>
References: <1619059532-17805-1-git-send-email-wangqing@vivo.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZQxhPTFZISx0fHR1MHU5LTk9VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nxg6Hyo6ED8WAg8JT0siFTor
 CE4aFE5VSlVKTUpCS05CTk9JTkJJVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
 SU5KVUxPVUlISVlXWQgBWUFOTUNNNwY+
X-HM-Tid: 0a78f77808a9b03akuuucf2b2800221
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_194545_978693_170E2B3F 
X-CRM114-Status: GOOD (  19.60  )
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

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/watchdog/mtk_wdt.c | 53 +++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 48 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 97ca993..ebc648b
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -25,6 +25,7 @@
 #include <linux/reset-controller.h>
 #include <linux/types.h>
 #include <linux/watchdog.h>
+#include <linux/interrupt.h>
 
 #define WDT_MAX_TIMEOUT		31
 #define WDT_MIN_TIMEOUT		1
@@ -184,15 +185,22 @@ static int mtk_wdt_set_timeout(struct watchdog_device *wdt_dev,
 {
 	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
 	void __iomem *wdt_base = mtk_wdt->wdt_base;
+	unsigned int timeout_interval;
 	u32 reg;
 
-	wdt_dev->timeout = timeout;
+	timeout_interval = wdt_dev->timeout = timeout;
+	/*
+	 * In dual mode, irq will be triggered at timeout/2
+	 * the real timeout occurs at timeout
+	 */
+	if (wdt_dev->pretimeout)
+		timeout_interval = wdt_dev->pretimeout = timeout/2;
 
 	/*
 	 * One bit is the value of 512 ticks
 	 * The clock has 32 KHz
 	 */
-	reg = WDT_LENGTH_TIMEOUT(timeout << 6) | WDT_LENGTH_KEY;
+	reg = WDT_LENGTH_TIMEOUT(timeout_interval << 6) | WDT_LENGTH_KEY;
 	iowrite32(reg, wdt_base + WDT_LENGTH);
 
 	mtk_wdt_ping(wdt_dev);
@@ -239,13 +247,25 @@ static int mtk_wdt_start(struct watchdog_device *wdt_dev)
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
@@ -253,6 +273,14 @@ static const struct watchdog_info mtk_wdt_info = {
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
@@ -267,7 +295,7 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct mtk_wdt_dev *mtk_wdt;
 	const struct mtk_wdt_data *wdt_data;
-	int err;
+	int err, irq;
 
 	mtk_wdt = devm_kzalloc(dev, sizeof(*mtk_wdt), GFP_KERNEL);
 	if (!mtk_wdt)
@@ -279,7 +307,22 @@ static int mtk_wdt_probe(struct platform_device *pdev)
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
+		mtk_wdt->wdt_dev.pretimeout = WDT_MAX_TIMEOUT/2;
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
