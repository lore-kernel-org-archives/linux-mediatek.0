Return-Path: <SRS0=dq3f=KE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9871C433ED
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 May 2021 21:19:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1738C610A7
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 May 2021 21:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1738C610A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ee
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8DNXuPBdf3bzk1UjFCoJNeEZGFaiGaBdpsjtr74sUco=; b=huiGbLoCn2477SmiF59zZUv7i
	iIFJJPKcvMCipQgbxJEnUbd+vpJYZJF6AXOJMTAvf4peCa9BMPI/kJ58f6kJW/wsAyLrxPHPl7p/r
	QgZMR+J1J+61O2m7mLR3/ORe4B2JlS1Tup36JfOtgR4uuDlWpdBxnNVBbOeWUz/EF5CutBfab1FU2
	QR7HJcSw/nhXdO+3p8JkBUd/4e5Vd3TZrEI4+0aA0z/iDwREDtInmAcjk2dgujxiXQdYcFfNuWbld
	2/sM9G5gc2/2aSsmDyhrNqLScR5zb/PwHx97SAql4qoRCbFca63o4+WKOb7kOSxILSNLrPh7W9Qfo
	FKqGYLRfg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lfqpM-00CJg7-I6; Sun, 09 May 2021 21:19:04 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lfqnj-00CJTl-1P
 for linux-mediatek@desiato.infradead.org; Sun, 09 May 2021 21:17:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=To1Cek+/WdF7f8Ivyp9+1nRXblFH1FDHGE0Bc5q/DkM=; b=ata4MAQ+/F10cQHjNlkRUlguew
 CsnGq3/l6LwvTgmLNB4bMYdnAiHkfBsVMbXHsk3G364uq9WU5EwK6iPWc4LEhvnAeH2w+UT4Gl5ty
 8YVKHIEJGx4RKbjKUDKQ4IRsnSmVAcs2yhJLgwmo8N8b4cPv+ykt4yYSZIYG7sf4Smi0IEfa8D0r1
 1G1zVVDlOdhsSSsYEQP2pjEogLurZFXCCwGYSmH4o+6q6ku2Ar3kYSZaAoRSOk6r8+nQjrVIo6+4K
 BNF3ylpAECmWH/ZMbTaEKCP07blBpUeeLDEUhaCmr5ilUXryjILW/cd02Dr9Dcx4aeHSd6EmRGYCD
 VSh192LA==;
Received: from eu-shark2.inbox.eu ([195.216.236.82])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lfqne-0087W3-B9
 for linux-mediatek@lists.infradead.org; Sun, 09 May 2021 21:17:21 +0000
Received: from eu-shark2.inbox.eu (localhost [127.0.0.1])
 by eu-shark2-out.inbox.eu (Postfix) with ESMTP id B1BC41E0057E;
 Mon, 10 May 2021 00:17:08 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.ee; s=20150108;
 t=1620595028; bh=SuYsz0veiGXlp+godyVkxvpGt8/JrxQt7glIPqQHjkg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=aqPLccd75JJIpQ1/5PFgzqeAOFPFG82+gu0Ac7NsabMIIS643spAedj65uegR4pGZ
 3Z1VDs+t14D8pN7Lvv/3/DnxXNSkD58NsJDYitFSnlY1cJePJmpNDFXe8C7Yy+6eak
 RyvX2VjU3ttxfvMB8746rvO0Ns1X/WmOIaewieTA=
Received: from mail.inbox.eu (eu-pop1 [127.0.0.1])
 by eu-shark2-in.inbox.eu (Postfix) with ESMTP id 927831E0056A;
 Mon, 10 May 2021 00:17:08 +0300 (EEST)
Received: from localhost.localdomain (unknown [196.196.216.231])
 (Authenticated sender: arzamas-16@mail.ee)
 by mail.inbox.eu (Postfix) with ESMTPA id C78771BE009C;
 Mon, 10 May 2021 00:17:07 +0300 (EEST)
From: Boris Lysov <arzamas-16@mail.ee>
To: matthias.bgg@gmail.com,
	linux@roeck-us.net,
	robh+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/3] watchdog: mtk_wdt: Refactor code to support more SoCs
Date: Mon, 10 May 2021 00:17:00 +0300
Message-Id: <20210509211702.549-2-arzamas-16@mail.ee>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210509211702.549-1-arzamas-16@mail.ee>
References: <20210131234425.9773-1-arzamas-16@mail.ee>
 <20210509211702.549-1-arzamas-16@mail.ee>
MIME-Version: 1.0
X-Virus-Scanned: OK
X-ESPOL: 6NpmlY9HHDysjlqlQGenZQs2pixXXeTj5eW71gNbn3rmQl2JCz0RI2663TM2UR7LszoX
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210509_141718_724374_B03CB634 
X-CRM114-Status: GOOD (  18.38  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch makes some constants SoC-dependent to support more watchdogs
in the future. It adds shifts of WDT_MODE_KEY and SWSYSRST_KEY to
mtk_wdt_data struct. This is done to bring support for various Mediatek
watchdogs which use same register structure but slightly different field
offsets in the UNLOCK_KEY registers. For example, mt6577 watchdog has
WDT_MODE_KEY and SWSYSRST_KEY at [15:8] instead of currently (and only)
supported [31:24].
Moreover, this patch adds SWSYSRST_KEY value to mtk_wdt_data because this
value also depends on specific SoC watchdog, for example mt6577 uses 0x15
instead of 0x88.

Signed-off-by: Boris Lysov <arzamas-16@mail.ee>
---
 drivers/watchdog/mtk_wdt.c | 76 ++++++++++++++++++++++++++++----------
 1 file changed, 57 insertions(+), 19 deletions(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 97ca993bd009..9d3091b12c06 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -44,13 +44,27 @@
 #define WDT_MODE_IRQ_EN		(1 << 3)
 #define WDT_MODE_AUTO_START	(1 << 4)
 #define WDT_MODE_DUAL_EN	(1 << 6)
-#define WDT_MODE_KEY		0x22000000
+#define WDT_MODE_KEY		0x22
 
 #define WDT_SWRST		0x14
 #define WDT_SWRST_KEY		0x1209
-
 #define WDT_SWSYSRST		0x18U
-#define WDT_SWSYS_RST_KEY	0x88000000
+
+#define MT2712_WDT_MODE_KEY_SHIFT	24		// unlock_key [31:24]
+#define MT2712_SWSYSRST_KEY_SHIFT	24		// unlock_key [31:24]
+#define MT2712_SWSYSRST_KEY		0x88
+
+#define MT6589_WDT_MODE_KEY_SHIFT	24		// unlock_key [31:24]
+#define MT6589_SWSYSRST_KEY_SHIFT	24		// unlock_key [31:24]
+#define MT6589_SWSYSRST_KEY		0x88
+
+#define MT8183_WDT_MODE_KEY_SHIFT	24		// unlock_key [31:24]
+#define MT8183_SWSYSRST_KEY_SHIFT	24		// unlock_key [31:24]
+#define MT8183_SWSYSRST_KEY		0x88
+
+#define MT8192_WDT_MODE_KEY_SHIFT	24		// unlock_key [31:24]
+#define MT8192_SWSYSRST_KEY_SHIFT	24		// unlock_key [31:24]
+#define MT8192_SWSYSRST_KEY		0x88
 
 #define DRV_NAME		"mtk-wdt"
 #define DRV_VERSION		"1.0"
@@ -60,6 +74,7 @@ static unsigned int timeout;
 
 struct mtk_wdt_dev {
 	struct watchdog_device wdt_dev;
+	const struct mtk_wdt_data *data;
 	void __iomem *wdt_base;
 	spinlock_t lock; /* protects WDT_SWSYSRST reg */
 	struct reset_controller_dev rcdev;
@@ -67,18 +82,37 @@ struct mtk_wdt_dev {
 
 struct mtk_wdt_data {
 	int toprgu_sw_rst_num;
+	u8 wdt_mode_key_shift;
+	u8 wdt_swsys_rst_key;
+	u8 wdt_swsys_rst_key_shift;
 };
 
 static const struct mtk_wdt_data mt2712_data = {
-	.toprgu_sw_rst_num = MT2712_TOPRGU_SW_RST_NUM,
+	.toprgu_sw_rst_num =		MT2712_TOPRGU_SW_RST_NUM,
+	.wdt_mode_key_shift =		MT2712_WDT_MODE_KEY_SHIFT,
+	.wdt_swsys_rst_key_shift =	MT2712_SWSYSRST_KEY_SHIFT,
+	.wdt_swsys_rst_key =		MT2712_SWSYSRST_KEY,
+};
+
+static const struct mtk_wdt_data mt6589_data = {
+	.toprgu_sw_rst_num =		-1,
+	.wdt_mode_key_shift =		MT6589_WDT_MODE_KEY_SHIFT,
+	.wdt_swsys_rst_key_shift =	MT6589_SWSYSRST_KEY_SHIFT,
+	.wdt_swsys_rst_key =		MT6589_SWSYSRST_KEY,
 };
 
 static const struct mtk_wdt_data mt8183_data = {
-	.toprgu_sw_rst_num = MT8183_TOPRGU_SW_RST_NUM,
+	.toprgu_sw_rst_num =		MT8183_TOPRGU_SW_RST_NUM,
+	.wdt_mode_key_shift =		MT8183_WDT_MODE_KEY_SHIFT,
+	.wdt_swsys_rst_key_shift =	MT8183_SWSYSRST_KEY_SHIFT,
+	.wdt_swsys_rst_key =		MT8183_SWSYSRST_KEY,
 };
 
 static const struct mtk_wdt_data mt8192_data = {
-	.toprgu_sw_rst_num = MT8192_TOPRGU_SW_RST_NUM,
+	.toprgu_sw_rst_num =		MT8192_TOPRGU_SW_RST_NUM,
+	.wdt_mode_key_shift =		MT8192_WDT_MODE_KEY_SHIFT,
+	.wdt_swsys_rst_key_shift =	MT8192_SWSYSRST_KEY_SHIFT,
+	.wdt_swsys_rst_key =		MT8192_SWSYSRST_KEY,
 };
 
 static int toprgu_reset_update(struct reset_controller_dev *rcdev,
@@ -86,20 +120,20 @@ static int toprgu_reset_update(struct reset_controller_dev *rcdev,
 {
 	unsigned int tmp;
 	unsigned long flags;
-	struct mtk_wdt_dev *data =
+	struct mtk_wdt_dev *wdev =
 		 container_of(rcdev, struct mtk_wdt_dev, rcdev);
 
-	spin_lock_irqsave(&data->lock, flags);
+	spin_lock_irqsave(&wdev->lock, flags);
 
-	tmp = readl(data->wdt_base + WDT_SWSYSRST);
+	tmp = readl(wdev->wdt_base + WDT_SWSYSRST);
 	if (assert)
 		tmp |= BIT(id);
 	else
 		tmp &= ~BIT(id);
-	tmp |= WDT_SWSYS_RST_KEY;
-	writel(tmp, data->wdt_base + WDT_SWSYSRST);
+	tmp |= wdev->data->wdt_swsys_rst_key << wdev->data->wdt_swsys_rst_key_shift;
+	writel(tmp, wdev->wdt_base + WDT_SWSYSRST);
 
-	spin_unlock_irqrestore(&data->lock, flags);
+	spin_unlock_irqrestore(&wdev->lock, flags);
 
 	return 0;
 }
@@ -221,7 +255,7 @@ static int mtk_wdt_stop(struct watchdog_device *wdt_dev)
 
 	reg = readl(wdt_base + WDT_MODE);
 	reg &= ~WDT_MODE_EN;
-	reg |= WDT_MODE_KEY;
+	reg |= WDT_MODE_KEY << mtk_wdt->data->wdt_mode_key_shift;
 	iowrite32(reg, wdt_base + WDT_MODE);
 
 	return 0;
@@ -240,7 +274,7 @@ static int mtk_wdt_start(struct watchdog_device *wdt_dev)
 
 	reg = ioread32(wdt_base + WDT_MODE);
 	reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
-	reg |= (WDT_MODE_EN | WDT_MODE_KEY);
+	reg |= (WDT_MODE_EN | (WDT_MODE_KEY << mtk_wdt->data->wdt_mode_key_shift));
 	iowrite32(reg, wdt_base + WDT_MODE);
 
 	return 0;
@@ -266,7 +300,6 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mtk_wdt_dev *mtk_wdt;
-	const struct mtk_wdt_data *wdt_data;
 	int err;
 
 	mtk_wdt = devm_kzalloc(dev, sizeof(*mtk_wdt), GFP_KERNEL);
@@ -279,6 +312,12 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 	if (IS_ERR(mtk_wdt->wdt_base))
 		return PTR_ERR(mtk_wdt->wdt_base);
 
+	mtk_wdt->data = of_device_get_match_data(dev);
+	if (!mtk_wdt->data) {
+		dev_err(dev, "watchdog data is not defined\n");
+		return -EINVAL;
+	}
+
 	mtk_wdt->wdt_dev.info = &mtk_wdt_info;
 	mtk_wdt->wdt_dev.ops = &mtk_wdt_ops;
 	mtk_wdt->wdt_dev.timeout = WDT_MAX_TIMEOUT;
@@ -302,10 +341,9 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 	dev_info(dev, "Watchdog enabled (timeout=%d sec, nowayout=%d)\n",
 		 mtk_wdt->wdt_dev.timeout, nowayout);
 
-	wdt_data = of_device_get_match_data(dev);
-	if (wdt_data) {
+	if (mtk_wdt->data->toprgu_sw_rst_num > -1) {
 		err = toprgu_register_reset_controller(pdev,
-						       wdt_data->toprgu_sw_rst_num);
+						       mtk_wdt->data->toprgu_sw_rst_num);
 		if (err)
 			return err;
 	}
@@ -338,7 +376,7 @@ static int mtk_wdt_resume(struct device *dev)
 
 static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
-	{ .compatible = "mediatek,mt6589-wdt" },
+	{ .compatible = "mediatek,mt6589-wdt", .data = &mt6589_data },
 	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
 	{ .compatible = "mediatek,mt8192-wdt", .data = &mt8192_data },
 	{ /* sentinel */ }
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
