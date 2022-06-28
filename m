Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63ABBC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jun 2022 19:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/GI374m8HDyCwdRV9NoEhzKp27nBp7VJRaI366errsU=; b=o46d9jCloA6t0dQMMWnkrK9OdV
	Nfw/hyCot2JveDItu+aHWedmVEksdCBjQPBVjJiYXjqK31muyLQJiYIZw6CC2aHGKakQRHmyATftn
	i3TEs/nNmQFhrq1/QrVJEgTNxFXuCWupijUulTH+idiOZ9UyXg63LI6FlJHsoCJ3bz3yLmJ2CVjZ9
	Ux0/ds3/7/ZpF43ja8VpQDokLX0zmcxgg3zK9BK3oRT6dUYP24Z6/0cv2WKadWAdSwgWyrqC00p8P
	k2YPQuqNsMUsI/3emjRtCSlh/raUmmCLQdOYHmjUfdX4+9vJKjFbCkekWyHELyhBAmdgEQrtOIlK9
	IbI3NcoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Gzc-007qbM-Uc; Tue, 28 Jun 2022 19:35:24 +0000
Received: from aposti.net ([89.234.176.197])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6GzS-007qYi-Fw; Tue, 28 Jun 2022 19:35:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1656444900; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/GI374m8HDyCwdRV9NoEhzKp27nBp7VJRaI366errsU=;
	b=p7rTsOWcNTHZTUBI7z3YWWtV7ohh/U/HWHk17ujuwERuHi/S8y79XmvLRCPp4X0g3KIW7t
	G59QoOpMFS+Kv4D3x6t/MIm8veKuYGDqVqvzC5xsW8dLUX8xhPpUF1sHFQugpXfL4nT1MA
	XbQEX4Zx7cqYVgHw8unZAoq6JtO2P00=
From: Paul Cercueil <paul@crapouillou.net>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Cercueil <paul@crapouillou.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 3/8] watchdog: mtk_wdt: Remove #ifdef guards for PM related functions
Date: Tue, 28 Jun 2022 20:34:44 +0100
Message-Id: <20220628193449.160585-4-paul@crapouillou.net>
In-Reply-To: <20220628193449.160585-1-paul@crapouillou.net>
References: <20220628193449.160585-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_123514_775730_A32EF9F6 
X-CRM114-Status: GOOD (  14.35  )
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

Use the new DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr() macros to
handle the .suspend/.resume callbacks.

These macros allow the suspend and resume functions to be automatically
dropped by the compiler when CONFIG_SUSPEND is disabled, without having
to use #ifdef guards. Not using #ifdef guards means that the code is
always compiled independently of any Kconfig option, and thanks to that
bugs and regressions are easier to catch.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
---
 drivers/watchdog/mtk_wdt.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index f0d4e3cc7459..e97787536792 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -401,7 +401,6 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int mtk_wdt_suspend(struct device *dev)
 {
 	struct mtk_wdt_dev *mtk_wdt = dev_get_drvdata(dev);
@@ -423,7 +422,6 @@ static int mtk_wdt_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
@@ -437,16 +435,14 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, mtk_wdt_dt_ids);
 
-static const struct dev_pm_ops mtk_wdt_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(mtk_wdt_suspend,
-				mtk_wdt_resume)
-};
+static DEFINE_SIMPLE_DEV_PM_OPS(mtk_wdt_pm_ops,
+				mtk_wdt_suspend, mtk_wdt_resume);
 
 static struct platform_driver mtk_wdt_driver = {
 	.probe		= mtk_wdt_probe,
 	.driver		= {
 		.name		= DRV_NAME,
-		.pm		= &mtk_wdt_pm_ops,
+		.pm		= pm_sleep_ptr(&mtk_wdt_pm_ops),
 		.of_match_table	= mtk_wdt_dt_ids,
 	},
 };
-- 
2.35.1


