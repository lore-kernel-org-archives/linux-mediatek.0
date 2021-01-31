Return-Path: <SRS0=AqdA=HC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3849EC433DB
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 23:45:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3FF764E22
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 23:45:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3FF764E22
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ee
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a6GHi4rZSS62pWBD5+ziccLoR/j8aUGgyox2/8L3Xow=; b=YMUtTtg2nBbwYfo151bXqmn1V
	RpVF/Qor5b3mRPQSgDa+odb/XFQVJ/CVhuVLpul0iegb5zGsCk9JhdPrya89uutOtPPNmgDMpTK6N
	h1tHu/fkS5b8myLPk9xI5aNDux9bzQVoAzAIMO+s0l+adkhAL0fqKR9QL6YCiO6XYljaCFR4VhFop
	/nMqcWf6m3lRPyqjRCpp+Qum4HRujQcgZk5K5lut9n7tgwPcBTSjKFEQOdvaCEuYBfV7C3xQB0ki8
	cyXK3Zy0W8I64pUlJIjijL06lQNy/BUYrfmP7EPO0qfwqQAyXlC06IeQAktCCcqyQOf3hdCzySTQn
	ScTc0n0PQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6MPG-0006RF-Co; Sun, 31 Jan 2021 23:45:26 +0000
Received: from eu-shark2.inbox.eu ([195.216.236.82])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6MPC-0006QH-Ht
 for linux-mediatek@lists.infradead.org; Sun, 31 Jan 2021 23:45:24 +0000
Received: from eu-shark2.inbox.eu (localhost [127.0.0.1])
 by eu-shark2-out.inbox.eu (Postfix) with ESMTP id 8AEB6455825;
 Mon,  1 Feb 2021 01:45:21 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.ee; s=20150108;
 t=1612136721; bh=saXZClH3bBueAJ08VV8oa600CvE1OgBd7t2cJ1O0HLQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=qcMTn67eqp8ZYHCM03MTRnybAiN1FsZgD7XIabl/NQITnOlVX+K07t+1b01TGjpip
 RbTwl99+A1FbZYksTvSZy6OwHuWjSiXBXbncOPiDptSDYIRsgG+wTqE67Nss0wyY8a
 KW96Q8GENqSuEOf6d9bYmfe5+dtRWvyW5NnTxibs=
Received: from mail.inbox.eu (eu-pop1 [127.0.0.1])
 by eu-shark2-in.inbox.eu (Postfix) with ESMTP id 7546A4557E5;
 Mon,  1 Feb 2021 01:45:21 +0200 (EET)
Received: from localhost.localdomain (unknown [165.231.161.4])
 (Authenticated sender: arzamas-16@mail.ee)
 by mail.inbox.eu (Postfix) with ESMTPA id B9A6E1BE00BA;
 Mon,  1 Feb 2021 01:45:20 +0200 (EET)
From: Boris Lysov <arzamas-16@mail.ee>
To: matthias.bgg@gmail.com,
	linux@roeck-us.net,
	robh+dt@kernel.org
Subject: [PATCH 2/3] watchdog: mtk_wdt: add support for 16-bit control
 registers
Date: Mon,  1 Feb 2021 02:44:24 +0300
Message-Id: <20210131234425.9773-3-arzamas-16@mail.ee>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210131234425.9773-1-arzamas-16@mail.ee>
References: <20210131234425.9773-1-arzamas-16@mail.ee>
MIME-Version: 1.0
X-Virus-Scanned: OK
X-ESPOL: +d1m4f9SY16pi1ikXXndBBg2qStXWPGWher6j11F/g/3MCuNeEoFVBSznnAUPnG+og==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210131_184522_792021_1B92BB9C 
X-CRM114-Status: GOOD (  12.23  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Boris Lysov <arzamas-16@mail.ee>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add support for 16-bit control registers.
Some old Mediatek SoCs such as mt6577 use 16-bit I/O operations
for controlling watchdog. This commit redefines read/write
functions and some values in mtk_wdt driver depending on the
16-bit register support flag in kernel configuration.
By default, driver still uses 32-bit values and I/O functions, so
currently supported devices are unaffected.

Signed-off-by: Boris Lysov <arzamas-16@mail.ee>
---
 drivers/watchdog/Kconfig   |  9 +++++++++
 drivers/watchdog/mtk_wdt.c | 34 ++++++++++++++++++++++++----------
 2 files changed, 33 insertions(+), 10 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 7ff941e71b79..83a4b57ede3f 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -865,6 +865,15 @@ config MEDIATEK_WATCHDOG
 	  To compile this driver as a module, choose M here: the
 	  module will be called mtk_wdt.
 
+config MEDIATEK_WATCHDOG_16BIT
+	bool "Support 16-bit control registers"
+	depends on MEDIATEK_WATCHDOG=y
+	help
+	  Some Mediatek SoCs such as mt6577 have 16-bit registers for
+	  controlling watchdog. Newer SoCs usually use 32-bit read/write
+	  operations.
+	  If in doubt, say N.
+
 config DIGICOLOR_WATCHDOG
 	tristate "Conexant Digicolor SoCs watchdog support"
 	depends on ARCH_DIGICOLOR || COMPILE_TEST
diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index d6a6393f609d..0ab3cbcf0d93 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -43,13 +43,27 @@
 #define WDT_MODE_IRQ_EN		(1 << 3)
 #define WDT_MODE_AUTO_START	(1 << 4)
 #define WDT_MODE_DUAL_EN	(1 << 6)
-#define WDT_MODE_KEY		0x22000000
 
 #define WDT_SWRST		0x14
 #define WDT_SWRST_KEY		0x1209
 
 #define WDT_SWSYSRST		0x18U
+
+#ifdef CONFIG_MEDIATEK_WATCHDOG_16BIT
+#define WDT_MODE_KEY		0x2200
+#define WDT_SWSYS_RST_KEY	0x8800
+#define mtk_wdt_read(a) readw(a)
+#define mtk_wdt_write(v, a) writew(v, a)
+#define mtk_wdt_ioread(a) ioread16(a)
+#define mtk_wdt_iowrite(v, a) iowrite16(v, a)
+#else
+#define WDT_MODE_KEY		0x22000000
 #define WDT_SWSYS_RST_KEY	0x88000000
+#define mtk_wdt_read(a) readl(a)
+#define mtk_wdt_write(v, a) writel(v, a)
+#define mtk_wdt_ioread(a) ioread32(a)
+#define mtk_wdt_iowrite(v, a) iowrite32(v, a)
+#endif
 
 #define DRV_NAME		"mtk-wdt"
 #define DRV_VERSION		"1.0"
@@ -86,13 +100,13 @@ static int toprgu_reset_update(struct reset_controller_dev *rcdev,
 
 	spin_lock_irqsave(&data->lock, flags);
 
-	tmp = readl(data->wdt_base + WDT_SWSYSRST);
+	tmp = mtk_wdt_read(data->wdt_base + WDT_SWSYSRST);
 	if (assert)
 		tmp |= BIT(id);
 	else
 		tmp &= ~BIT(id);
 	tmp |= WDT_SWSYS_RST_KEY;
-	writel(tmp, data->wdt_base + WDT_SWSYSRST);
+	mtk_wdt_write(tmp, data->wdt_base + WDT_SWSYSRST);
 
 	spin_unlock_irqrestore(&data->lock, flags);
 
@@ -157,7 +171,7 @@ static int mtk_wdt_restart(struct watchdog_device *wdt_dev,
 	wdt_base = mtk_wdt->wdt_base;
 
 	while (1) {
-		writel(WDT_SWRST_KEY, wdt_base + WDT_SWRST);
+		mtk_wdt_write(WDT_SWRST_KEY, wdt_base + WDT_SWRST);
 		mdelay(5);
 	}
 
@@ -169,7 +183,7 @@ static int mtk_wdt_ping(struct watchdog_device *wdt_dev)
 	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
 	void __iomem *wdt_base = mtk_wdt->wdt_base;
 
-	iowrite32(WDT_RST_RELOAD, wdt_base + WDT_RST);
+	mtk_wdt_iowrite(WDT_RST_RELOAD, wdt_base + WDT_RST);
 
 	return 0;
 }
@@ -188,7 +202,7 @@ static int mtk_wdt_set_timeout(struct watchdog_device *wdt_dev,
 	 * The clock has 32 KHz
 	 */
 	reg = WDT_LENGTH_TIMEOUT(timeout << 6) | WDT_LENGTH_KEY;
-	iowrite32(reg, wdt_base + WDT_LENGTH);
+	mtk_wdt_iowrite(reg, wdt_base + WDT_LENGTH);
 
 	mtk_wdt_ping(wdt_dev);
 
@@ -201,10 +215,10 @@ static int mtk_wdt_stop(struct watchdog_device *wdt_dev)
 	void __iomem *wdt_base = mtk_wdt->wdt_base;
 	u32 reg;
 
-	reg = readl(wdt_base + WDT_MODE);
+	reg = mtk_wdt_read(wdt_base + WDT_MODE);
 	reg &= ~WDT_MODE_EN;
 	reg |= WDT_MODE_KEY;
-	iowrite32(reg, wdt_base + WDT_MODE);
+	mtk_wdt_iowrite(reg, wdt_base + WDT_MODE);
 
 	return 0;
 }
@@ -220,10 +234,10 @@ static int mtk_wdt_start(struct watchdog_device *wdt_dev)
 	if (ret < 0)
 		return ret;
 
-	reg = ioread32(wdt_base + WDT_MODE);
+	reg = mtk_wdt_ioread(wdt_base + WDT_MODE);
 	reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
 	reg |= (WDT_MODE_EN | WDT_MODE_KEY);
-	iowrite32(reg, wdt_base + WDT_MODE);
+	mtk_wdt_iowrite(reg, wdt_base + WDT_MODE);
 
 	return 0;
 }
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
