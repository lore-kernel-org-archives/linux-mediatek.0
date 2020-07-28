Return-Path: <SRS0=uiJf=BH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE7C8C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 10:48:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC8A220775
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 10:48:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IjCbTJ8e";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="L08uOlwa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC8A220775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6By+ZHwIfP1ERTfMP3NqwnOzcpVW1/sPi0A+5j3qRZA=; b=IjCbTJ8e3MmdNJDPDBCWLyOMY4
	khlhZkGco2s2P7NWm3TfNS0bN7e4LY4MJmV6UDKXZJIJFw8NUzikW8AEEaFkakueolqiuNVN+a/tx
	Btf3eVrjxMr4KUJS9JpyW8UvgMNuqMXUCfbU4yRX30cB/oqMK7++KE8RdteeX3mKHKNErT8qRogBG
	bltxBHugfmDiWb4OKu8J6mhAFs1VJeCXFyHb0VbW8+8xSmeV2A25MGxRgQ3Yl1L4w/WcI/VLabB+g
	NYKdRr4NVOi5YKtfa+5fhcK5PI0wsxJBsP5NTo7tcsvZvAZnc9rKKpMs1rJ/Hes8yxhYD2D+443cs
	Y3otq8DA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0N9Z-0001SF-1c; Tue, 28 Jul 2020 10:48:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0N9U-0001PM-0D; Tue, 28 Jul 2020 10:48:09 +0000
X-UUID: bf6da57d1eb74ef1be318b8d7c44033a-20200728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=fGh635YPSKDx8TpTukFSxvqdKrdqDpycLk2vh1BFhDc=; 
 b=L08uOlwa8o0OzVxkLlQNxVJCWRJ/nuGiMBlG0ISqkQ1S/9aaI3tqoqJdaOtkCQCRHC5/nyY2ay8Oj0ODUVN5D/PT5k/swk659JtO7TY+GYUc5ySgZaRXNrXaVaXFu+Ijr/V3a0+bI7X+LTJ3i7B0WmZVcy87hZbNWEPC1wHn0rI=;
X-UUID: bf6da57d1eb74ef1be318b8d7c44033a-20200728
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 903675529; Tue, 28 Jul 2020 02:48:07 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Jul 2020 03:43:17 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Jul 2020 18:43:16 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 28 Jul 2020 18:43:14 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: <linux@roeck-us.net>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
Subject: [PATCH 1/3] watchdog: mtk_wdt: remove mt8xxx-resets.h
Date: Tue, 28 Jul 2020 18:42:27 +0800
Message-ID: <1595932949-7033-1-git-send-email-crystal.guo@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: 71B9F2D85162E9CD930E185F74479062C12A56CDD28885323C9E66983C5603302000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_064808_181809_8613CEA3 
X-CRM114-Status: GOOD (  16.06  )
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
Cc: linux-watchdog@vger.kernel.org, srv_heupstream@mediatek.com,
 seiya.wang@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Crystal Guo <crystal.guo@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mt8xxx-resets.h actually just used to define TOPRGU_SW_RST_NUM.
Instead of resubmit the mt8xxx-reset.h for a new IC, get the number
of reset bits from dtsi is more easier to maintain.

Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
---
 drivers/watchdog/mtk_wdt.c | 26 +++++---------------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index d6a6393..adc88c2 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -9,8 +9,6 @@
  * Based on sunxi_wdt.c
  */
 
-#include <dt-bindings/reset-controller/mt2712-resets.h>
-#include <dt-bindings/reset-controller/mt8183-resets.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/init.h>
@@ -64,18 +62,6 @@ struct mtk_wdt_dev {
 	struct reset_controller_dev rcdev;
 };
 
-struct mtk_wdt_data {
-	int toprgu_sw_rst_num;
-};
-
-static const struct mtk_wdt_data mt2712_data = {
-	.toprgu_sw_rst_num = MT2712_TOPRGU_SW_RST_NUM,
-};
-
-static const struct mtk_wdt_data mt8183_data = {
-	.toprgu_sw_rst_num = MT8183_TOPRGU_SW_RST_NUM,
-};
-
 static int toprgu_reset_update(struct reset_controller_dev *rcdev,
 			       unsigned long id, bool assert)
 {
@@ -248,7 +234,7 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mtk_wdt_dev *mtk_wdt;
-	const struct mtk_wdt_data *wdt_data;
+	u32 toprgu_sw_rst_num;
 	int err;
 
 	mtk_wdt = devm_kzalloc(dev, sizeof(*mtk_wdt), GFP_KERNEL);
@@ -284,10 +270,10 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 	dev_info(dev, "Watchdog enabled (timeout=%d sec, nowayout=%d)\n",
 		 mtk_wdt->wdt_dev.timeout, nowayout);
 
-	wdt_data = of_device_get_match_data(dev);
-	if (wdt_data) {
-		err = toprgu_register_reset_controller(pdev,
-						       wdt_data->toprgu_sw_rst_num);
+	err = of_property_read_u32(pdev->dev.of_node, "rst-num",
+				&toprgu_sw_rst_num);
+	if (!err) {
+		err = toprgu_register_reset_controller(pdev, toprgu_sw_rst_num);
 		if (err)
 			return err;
 	}
@@ -319,9 +305,7 @@ static int mtk_wdt_resume(struct device *dev)
 #endif
 
 static const struct of_device_id mtk_wdt_dt_ids[] = {
-	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
 	{ .compatible = "mediatek,mt6589-wdt" },
-	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mtk_wdt_dt_ids);
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
