Return-Path: <SRS0=HztP=GC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6521DC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Dec 2020 08:16:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB32421973
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Dec 2020 08:16:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB32421973
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z9kd1H7pt0PozoGD1YvLbZHJqYfPqBcsvQIjJrafQQE=; b=HeoJ46VnrnPL+IhukYtcsCIfZW
	bIZa+VhHmhcW4pQmTL3TPRNNp1/22R7RUmtY0bhGC5xkI59qy/3x8U/DsN+BjHBG6rtzJIk1fW16m
	M0dpgVsFYQoDogtHzpnpndByDQVNFJvZKVxPpSQRzToiAvl+Nqq5lJuzIXWjkL6mpmJ6hQnLmZqnt
	2mfEr27HV3dobX/MtGi2EfJNBE7xKQ8dw8+zG+D9WzxfIYGVtHJbjxl017lMoSZEKJ9hPrjyTd3/U
	n5jyKADkI/J54RMk8SIss5/KQ4IC014hR096tNRGTNsX2isKZNifxO3O66K1hNRjzeXRAsdBliZ7s
	Dv3BSKNQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kuWeR-0007sJ-Sl; Wed, 30 Dec 2020 08:16:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kuWeN-0007rf-Kg; Wed, 30 Dec 2020 08:16:10 +0000
X-UUID: a3542b71724c4e29aa5cea5887c889f2-20201230
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=WsI1mRW7iFZMxLKu32soFCqdJRbkOXAw73m+ygbVIMo=; 
 b=g5KNewTtWPnb1/XPnhTb18bQjDqDxUslqO23gQTAAHadW2rrSPcDuRusP5gICsrQtr/TDknx7zyiDbV+f2wRvq3nUScieMToahxS4J8S31lAwtYG89CD/toxK4nZG3NEXDpaAv/sOLA+64Dy1vUknLjWFK6YZGfZ4XzN0x3bTy4=;
X-UUID: a3542b71724c4e29aa5cea5887c889f2-20201230
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <freddy.hsin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1439848455; Wed, 30 Dec 2020 00:16:02 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Dec 2020 00:16:01 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Dec 2020 16:15:58 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 30 Dec 2020 16:15:59 +0800
From: Freddy Hsin <freddy.hsin@mediatek.com>
To: Freddy Hsin <freddy.hsin@mediatek.com>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <linux-watchdog@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/1] watchdog: mtk_wdt: Remove mtk_wdt_stop() in probe() to
 prevent the system freeze and it doesn't reboot by watchdog problem
Date: Wed, 30 Dec 2020 16:15:57 +0800
Message-ID: <1609316157-3748-1-git-send-email-freddy.hsin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: D94B9C579622140CEE92807ED8F0662EE7B3DEE939D9028A2890F17DB13BB2692000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201230_031608_433961_FBF3DE6F 
X-CRM114-Status: GOOD (  15.08  )
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
Cc: kuohong.wang@mediatek.com, chang-an.chen@mediatek.com,
 wsd_upstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "freddy.hsin" <freddy.hsin@mediatek.com>

Before user space daemon start to access the watchdog device,
there is a time interval that watchdog is disabled in the
original flow. If the system freezing at this interval, it
cannot be rebooted by watchdog hardware automatically.

In order to solve this problem, the watchdog hardware should be
kept working, and start hrtimer in framework to ping it by
setting max_hw_heartbeat_ms and HW_RUNNING used in
watchdog_need_worker to determine whether the worker should be
started or not. Besides the redundant setting of max_timeout is
also removed.

Signed-off-by: freddy.hsin <freddy.hsin@mediatek.com>
---
 drivers/watchdog/mtk_wdt.c |   17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index d6a6393..0c869b7 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -195,6 +195,19 @@ static int mtk_wdt_set_timeout(struct watchdog_device *wdt_dev,
 	return 0;
 }
 
+static void mtk_wdt_init(struct watchdog_device *wdt_dev)
+{
+	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
+	void __iomem *wdt_base;
+
+	wdt_base = mtk_wdt->wdt_base;
+
+	if (readl(wdt_base + WDT_MODE) & WDT_MODE_EN) {
+		set_bit(WDOG_HW_RUNNING, &wdt_dev->status);
+		mtk_wdt_set_timeout(wdt_dev, wdt_dev->timeout);
+	}
+}
+
 static int mtk_wdt_stop(struct watchdog_device *wdt_dev)
 {
 	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
@@ -264,7 +277,7 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 	mtk_wdt->wdt_dev.info = &mtk_wdt_info;
 	mtk_wdt->wdt_dev.ops = &mtk_wdt_ops;
 	mtk_wdt->wdt_dev.timeout = WDT_MAX_TIMEOUT;
-	mtk_wdt->wdt_dev.max_timeout = WDT_MAX_TIMEOUT;
+	mtk_wdt->wdt_dev.max_hw_heartbeat_ms = WDT_MAX_TIMEOUT * 1000;
 	mtk_wdt->wdt_dev.min_timeout = WDT_MIN_TIMEOUT;
 	mtk_wdt->wdt_dev.parent = dev;
 
@@ -274,7 +287,7 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 
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
