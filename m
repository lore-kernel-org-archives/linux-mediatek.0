Return-Path: <SRS0=J4iI=27=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D222C33C99
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jan 2020 07:09:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B2812072E
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jan 2020 07:09:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q83rkmbE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ofMOTP7U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B2812072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZBwvPerqKN+M2mOnwygrIpY4voZGdi/hnPHO6hhbuCg=; b=Q83rkmbERnHbPa
	IoNZk7l4hV8AH+0qegvOPSJsG9c0AB0c50CpI134ZfwmmSymkV3mXwayMRwW6BePmjgcY1mMcJ+Wr
	3GFMrPA8wqjU270zo8/4+AkOuyefow0KZUdRCa1ABQlL8a0kp/vy9idYCxlXrfA03cwxB9w1coIcB
	Tdp4gxXOSQJWe5K5AAGkk8W0qwuS8ODyWCdhheFpt3rFjTsIaT0JYghe/hh7fvw/cJ8sqDOLlpTOL
	+Roerh7QXTODQStDAA2ArZotdTWSkppjEZSKTA+O1BTEGmuS7P/7tUWJPFVnl4xi5IHFX6HMdFjTQ
	9/ZhPSTqFPMtmrDpd5gg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipoPk-0006vJ-9S; Fri, 10 Jan 2020 07:09:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipoPT-0006dW-Ik; Fri, 10 Jan 2020 07:08:45 +0000
X-UUID: 76c0f4d330904b8caa22b5f7c95f56d5-20200109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=UBU/JotGyaVC80F/EKU+cYPfez0p2KHHBLk51Y3ha+c=; 
 b=ofMOTP7UQLwQXfSpLDUtl6xTgUGDVUqgVJlJJDTCSxup5tMl5k3lRqmmqPtKArlU9ycecI1+Fxd+G/mjFLUjdh8HYW3X3qTwVAKFIHV+4RMPSgMpm3SLIy41fLr51vzClyUDukp1s7t7QzC8Qm+z3bN9SUY/cgak8OL5lyz2wrc=;
X-UUID: 76c0f4d330904b8caa22b5f7c95f56d5-20200109
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 887693095; Thu, 09 Jan 2020 23:08:40 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 9 Jan 2020 23:05:09 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 10 Jan 2020 15:04:01 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 10 Jan 2020 15:03:57 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <yong.liang@mediatek.com>, <wim@linux-watchdog.org>, <linux@roeck-us.net>, 
 <p.zabel@pengutronix.de>, <matthias.bgg@gmail.com>,
 <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <devicetree@vger.kernel.org>, <chang-an.chen@mediatek.com>,
 <freddy.hsin@mediatek.com>
Subject: [PATCH v11 2/3] watchdog: mtk_wdt: mt8183: Add reset controller
Date: Fri, 10 Jan 2020 15:04:21 +0800
Message-ID: <1578639862-14480-3-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1578639862-14480-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1578639862-14480-1-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_230843_622040_E3721458 
X-CRM114-Status: GOOD (  12.44  )
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
Cc: sboyd@kernel.org, yingjoe.chen@mediatek.com,
 Jiaxin Yu <jiaxin.yu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add reset controller API in watchdog driver.
Besides watchdog, MTK toprgu module alsa provide sub-system (eg, audio,
camera, codec and connectivity) software reset functionality.

Signed-off-by: yong.liang <yong.liang@mediatek.com>
Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Guenter Roeck <groeck7@gmail.com>
---
 drivers/watchdog/mtk_wdt.c | 99 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 98 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 9c3d0033260d..e88aacb0404d 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -9,6 +9,8 @@
  * Based on sunxi_wdt.c
  */
 
+#include <dt-bindings/reset-controller/mt8183-resets.h>
+#include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/io.h>
@@ -16,10 +18,11 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/reset-controller.h>
 #include <linux/types.h>
 #include <linux/watchdog.h>
-#include <linux/delay.h>
 
 #define WDT_MAX_TIMEOUT		31
 #define WDT_MIN_TIMEOUT		1
@@ -44,6 +47,9 @@
 #define WDT_SWRST		0x14
 #define WDT_SWRST_KEY		0x1209
 
+#define WDT_SWSYSRST		0x18U
+#define WDT_SWSYS_RST_KEY	0x88000000
+
 #define DRV_NAME		"mtk-wdt"
 #define DRV_VERSION		"1.0"
 
@@ -53,8 +59,90 @@ static unsigned int timeout;
 struct mtk_wdt_dev {
 	struct watchdog_device wdt_dev;
 	void __iomem *wdt_base;
+	spinlock_t lock; /* protects WDT_SWSYSRST reg */
+	struct reset_controller_dev rcdev;
+};
+
+struct mtk_wdt_data {
+	int toprgu_sw_rst_num;
 };
 
+static const struct mtk_wdt_data mt8183_data = {
+	.toprgu_sw_rst_num = MT8183_TOPRGU_SW_RST_NUM,
+};
+
+static int toprgu_reset_update(struct reset_controller_dev *rcdev,
+			       unsigned long id, bool assert)
+{
+	unsigned int tmp;
+	unsigned long flags;
+	struct mtk_wdt_dev *data =
+		 container_of(rcdev, struct mtk_wdt_dev, rcdev);
+
+	spin_lock_irqsave(&data->lock, flags);
+
+	tmp = readl(data->wdt_base + WDT_SWSYSRST);
+	if (assert)
+		tmp |= BIT(id);
+	else
+		tmp &= ~BIT(id);
+	tmp |= WDT_SWSYS_RST_KEY;
+	writel(tmp, data->wdt_base + WDT_SWSYSRST);
+
+	spin_unlock_irqrestore(&data->lock, flags);
+
+	return 0;
+}
+
+static int toprgu_reset_assert(struct reset_controller_dev *rcdev,
+			       unsigned long id)
+{
+	return toprgu_reset_update(rcdev, id, true);
+}
+
+static int toprgu_reset_deassert(struct reset_controller_dev *rcdev,
+				 unsigned long id)
+{
+	return toprgu_reset_update(rcdev, id, false);
+}
+
+static int toprgu_reset(struct reset_controller_dev *rcdev,
+			unsigned long id)
+{
+	int ret;
+
+	ret = toprgu_reset_assert(rcdev, id);
+	if (ret)
+		return ret;
+
+	return toprgu_reset_deassert(rcdev, id);
+}
+
+static const struct reset_control_ops toprgu_reset_ops = {
+	.assert = toprgu_reset_assert,
+	.deassert = toprgu_reset_deassert,
+	.reset = toprgu_reset,
+};
+
+static int toprgu_register_reset_controller(struct platform_device *pdev,
+					    int rst_num)
+{
+	int ret;
+	struct mtk_wdt_dev *mtk_wdt = platform_get_drvdata(pdev);
+
+	spin_lock_init(&mtk_wdt->lock);
+
+	mtk_wdt->rcdev.owner = THIS_MODULE;
+	mtk_wdt->rcdev.nr_resets = rst_num;
+	mtk_wdt->rcdev.ops = &toprgu_reset_ops;
+	mtk_wdt->rcdev.of_node = pdev->dev.of_node;
+	ret = devm_reset_controller_register(&pdev->dev, &mtk_wdt->rcdev);
+	if (ret != 0)
+		dev_err(&pdev->dev,
+			"couldn't register wdt reset controller: %d\n", ret);
+	return ret;
+}
+
 static int mtk_wdt_restart(struct watchdog_device *wdt_dev,
 			   unsigned long action, void *data)
 {
@@ -155,6 +243,7 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mtk_wdt_dev *mtk_wdt;
+	const struct mtk_wdt_data *wdt_data;
 	int err;
 
 	mtk_wdt = devm_kzalloc(dev, sizeof(*mtk_wdt), GFP_KERNEL);
@@ -190,6 +279,13 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 	dev_info(dev, "Watchdog enabled (timeout=%d sec, nowayout=%d)\n",
 		 mtk_wdt->wdt_dev.timeout, nowayout);
 
+	wdt_data = of_device_get_match_data(dev);
+	if (wdt_data) {
+		err = toprgu_register_reset_controller(pdev,
+						       wdt_data->toprgu_sw_rst_num);
+		if (err)
+			return err;
+	}
 	return 0;
 }
 
@@ -219,6 +315,7 @@ static int mtk_wdt_resume(struct device *dev)
 
 static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt6589-wdt" },
+	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mtk_wdt_dt_ids);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
