Return-Path: <SRS0=47V3=CG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ED08C433E2
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 08:00:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D00BA205CB
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 08:00:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SsSvSyVJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Pv+5ikzl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D00BA205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MOmsrajtChbexc6X6eFxbEgMYm89fIUOQ/N1hZ08lk8=; b=SsSvSyVJOw1eaoS2sl7k3wAqy
	HMoPY7eZVhErvMsnIDcPj6lAN+VyL7GIrDauL/dgx1BkI31QXcU6HreXK8SEUERg4vFN1oCc0euxU
	whek/87tZcbMsjBZFWVqeI3M++oco02uZMMQ5NK9BPaFOs2Hs5xqzSCgcu+QAlyEvyMJJRjskCSzz
	QxlBjf8E7/wjLDRiW8Zs3b8NzamkEtC7lr1ybpNY3g68426FuLa5ylM9Ebfk7lmyGKzqwz8kHQhKy
	kQZDhPxbMI/13GxFYMTblPu5FOeEBk6rpxKL+23CsoqFXJmNkW5xB9jp4WuSoSIcOQR4NBmI/OYzQ
	urJgnsuHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBZJC-0001HW-BT; Fri, 28 Aug 2020 08:00:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBZJ7-0001G7-Ar; Fri, 28 Aug 2020 08:00:22 +0000
X-UUID: c97c4a564c51444580557ef88022beb7-20200828
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=3WgwFhaLMdkUWyelN9/5DI31mttcEviLuRyGT0q3ZCc=; 
 b=Pv+5ikzlk4lG+nEzdDOh6JhkrfGTWyyiM3BnFLMhYwQRJo7G3AYronxNHK8PDntyxMDurWZu21a6RlZn8qOa67bdVkLWdPkjwizTqXAxZLU04YWQE5o1POMzb+0tzHQV45xIJNYTMynxqCFJms5L/v6MkoPjAJ7dNxHXVkNESFo=;
X-UUID: c97c4a564c51444580557ef88022beb7-20200828
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <freddy.hsin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1858157802; Fri, 28 Aug 2020 00:00:01 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 28 Aug 2020 00:49:59 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 28 Aug 2020 15:49:56 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 28 Aug 2020 15:49:59 +0800
From: Freddy Hsin <freddy.hsin@mediatek.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v1 1/1] driver: watchdog: Add mtk_wdt_init for mediatek
 watchdog hw init
Date: Fri, 28 Aug 2020 15:49:28 +0800
Message-ID: <1598600968-28498-2-git-send-email-freddy.hsin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1598600968-28498-1-git-send-email-freddy.hsin@mediatek.com>
References: <1598600968-28498-1-git-send-email-freddy.hsin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_040021_569039_EB97F174 
X-CRM114-Status: GOOD (  15.63  )
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
Cc: kuohong.wang@mediatek.com, chun-hung.wu@mediatek.com,
 chang-an.chen@mediatek.com, wsd_upstream@mediatek.com,
 Freddy Hsin <freddy.hsin@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

1. add a hw initialization function
2. enable/disable the watchdog depends on the original hw setting
3. set WDOD_HW_RUNNING in start function in order to start
   kicker after driver probe and clear the bit in stop function

Change-Id: I25aa797f3b88288f26984455e499e599e27f09fa
Signed-off-by: Freddy Hsin <freddy.hsin@mediatek.com>
---
 drivers/watchdog/mtk_wdt.c |   22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index d6a6393..59b5061 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -57,6 +57,9 @@
 static bool nowayout = WATCHDOG_NOWAYOUT;
 static unsigned int timeout;
 
+static int mtk_wdt_start(struct watchdog_device *wdt_dev);
+static int mtk_wdt_stop(struct watchdog_device *wdt_dev);
+
 struct mtk_wdt_dev {
 	struct watchdog_device wdt_dev;
 	void __iomem *wdt_base;
@@ -148,6 +151,19 @@ static int toprgu_register_reset_controller(struct platform_device *pdev,
 	return ret;
 }
 
+static int mtk_wdt_init(struct watchdog_device *wdt_dev)
+{
+	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
+	void __iomem *wdt_base;
+
+	wdt_base = mtk_wdt->wdt_base;
+
+	if (readl(wdt_base + WDT_MODE) & WDT_MODE_EN)
+		mtk_wdt_start(wdt_dev);
+	else
+		mtk_wdt_stop(wdt_dev);
+}
+
 static int mtk_wdt_restart(struct watchdog_device *wdt_dev,
 			   unsigned long action, void *data)
 {
@@ -206,6 +222,8 @@ static int mtk_wdt_stop(struct watchdog_device *wdt_dev)
 	reg |= WDT_MODE_KEY;
 	iowrite32(reg, wdt_base + WDT_MODE);
 
+	clear_bit(WDOG_HW_RUNNING, &wdt_dev->status);
+
 	return 0;
 }
 
@@ -225,6 +243,8 @@ static int mtk_wdt_start(struct watchdog_device *wdt_dev)
 	reg |= (WDT_MODE_EN | WDT_MODE_KEY);
 	iowrite32(reg, wdt_base + WDT_MODE);
 
+	set_bit(WDOG_HW_RUNNING, &wdt_dev->status);
+
 	return 0;
 }
 
@@ -274,7 +294,7 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 
 	watchdog_set_drvdata(&mtk_wdt->wdt_dev, mtk_wdt);
 
-	mtk_wdt_stop(&mtk_wdt->wdt_dev);
+	mtk_wdt_init(&mtk_wdt->wdt_dev);
 
 	watchdog_stop_on_reboot(&mtk_wdt->wdt_dev);
 	err = devm_watchdog_register_device(dev, &mtk_wdt->wdt_dev);
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
