Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2633FC30653
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Jul 2024 05:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FvLLOujG+sispkldk5d/JDkLg6rmUGJQxZZpGjk6N1k=; b=A6ZcTvXjth8iWNlEj2FO3lEzf3
	7CnuR/CosvmTRse2cjctjHuaqGdjiv8uDLIro17+NHDf4va3eO9iNUvlOKqdmACxbasBG6uN+d7Da
	5SyHWTZ/e+B4WfAuZbQz87B1kP1jxWzliM2yk6D9hCrDjSh58TWMhf2h+WLaBq9GN5r1ze2GcmSNs
	K7LoygdXQee+df5Al+FDyqzMpzBeQEi9d3WdUjxSmtha66dwGoVd0CIAH9XQvRkn23e4auYUELBEw
	KnlJulEcNJNjEVtRWQW4g4xnfGu57PFvi6YGOIw8//CeK1OqwHRILnrX/F0qzpquCmaVPd71hwVhY
	x1klBDyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQKl0-00000001NiD-3WbI;
	Sun, 07 Jul 2024 05:48:18 +0000
Received: from smtp-16.smtpout.orange.fr ([80.12.242.16] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQKke-00000001NaV-0TqA
	for linux-mediatek@lists.infradead.org;
	Sun, 07 Jul 2024 05:47:57 +0000
Received: from fedora.home ([86.243.222.230])
	by smtp.orange.fr with ESMTPA
	id QKkEsyOxChEtDQKkbs8JM4; Sun, 07 Jul 2024 07:47:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1720331273;
	bh=FvLLOujG+sispkldk5d/JDkLg6rmUGJQxZZpGjk6N1k=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Arkbqk/rF+Qeh3EggStejlIIk3UciOU5fL6zikw24a2IdLk4qT25osFZD504bpcep
	 2lkJqWweuMb4mBZuvA2HmcywNHtfO+B3q/CN+cYw4nLX/aYiPBLS4Y06xzxPjca5lN
	 VyGVifdfCrycNyHKvTHmeVZkXGpwogetdPFAUKTyBw3r/OWoTZE9YSwURqlgrGv0IQ
	 S+bNubKoxCX67GSF2UFLfazn7lj9Y0NNvPwI/2upmI0BNJrdeH8xlLGfmyWqRMQP7b
	 faYxIn5wIPaZHJxv3JRX6Sl2+Saa92UVTbfKRMbgSTPwgxvetuR31bxZNmrmnvcQo/
	 6OB0tKyPRfkCg==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 07 Jul 2024 07:47:53 +0200
X-ME-IP: 86.243.222.230
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	fchiby@baylibre.com,
	fparent@baylibre.com,
	s.hauer@pengutronix.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2 3/3] soc: mediatek: pwrap: Use devm_clk_bulk_get_all_enable()
Date: Sun,  7 Jul 2024 07:47:22 +0200
Message-ID: <5b1114c538dd5230728592855f89942aec8ef83b.1720331018.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1720331018.git.christophe.jaillet@wanadoo.fr>
References: <cover.1720331018.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_224756_456282_060D3C83 
X-CRM114-Status: GOOD (  18.06  )
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

Use devm_clk_bulk_get_all_enable() to simplify the code and to make sure
that clk_disable_unprepare() is called if the driver is unloaded.

Fixes: 55924157da8c ("soc: mediatek: pwrap: add support for sys & tmr clocks")
Fixes: 1f022d84bd19 ("soc: mediatek: Add PMIC wrapper for MT8135 and MT8173 SoCs")
Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only.
I don't know this function, so I fully trust Angelo's analysis. :)

Changes in v2:
   - Add a Suggested-by tag
   - Use devm_clk_bulk_get_all_enable()

v1: https://lore.kernel.org/all/07b3745819c8ba818d4508ed12e93f14f29b80a2.1719652155.git.christophe.jaillet@wanadoo.fr/
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 82 ++++------------------------
 1 file changed, 12 insertions(+), 70 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index d57553486383..9fdc0ef79202 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -1366,10 +1366,6 @@ struct pmic_wrapper {
 	struct regmap *regmap;
 	const struct pmic_wrapper_type *master;
 	const struct pwrap_slv_type *slave;
-	struct clk *clk_spi;
-	struct clk *clk_wrap;
-	struct clk *clk_sys;
-	struct clk *clk_tmr;
 	struct reset_control *rstc;
 
 	struct reset_control *rstc_bridge;
@@ -2472,6 +2468,7 @@ static int pwrap_probe(struct platform_device *pdev)
 	int ret, irq;
 	u32 mask_done;
 	struct pmic_wrapper *wrp;
+	struct clk_bulk_data *clk;
 	struct device_node *np = pdev->dev.of_node;
 	const struct of_device_id *of_slave_id = NULL;
 
@@ -2521,49 +2518,10 @@ static int pwrap_probe(struct platform_device *pdev)
 		}
 	}
 
-	wrp->clk_spi = devm_clk_get(wrp->dev, "spi");
-	if (IS_ERR(wrp->clk_spi)) {
-		dev_dbg(wrp->dev, "failed to get clock: %ld\n",
-			PTR_ERR(wrp->clk_spi));
-		return PTR_ERR(wrp->clk_spi);
-	}
-
-	wrp->clk_wrap = devm_clk_get(wrp->dev, "wrap");
-	if (IS_ERR(wrp->clk_wrap)) {
-		dev_dbg(wrp->dev, "failed to get clock: %ld\n",
-			PTR_ERR(wrp->clk_wrap));
-		return PTR_ERR(wrp->clk_wrap);
-	}
-
-	wrp->clk_sys = devm_clk_get_optional(wrp->dev, "sys");
-	if (IS_ERR(wrp->clk_sys)) {
-		return dev_err_probe(wrp->dev, PTR_ERR(wrp->clk_sys),
-				     "failed to get clock: %pe\n",
-				     wrp->clk_sys);
-	}
-
-	wrp->clk_tmr = devm_clk_get_optional(wrp->dev, "tmr");
-	if (IS_ERR(wrp->clk_tmr)) {
-		return dev_err_probe(wrp->dev, PTR_ERR(wrp->clk_tmr),
-				     "failed to get clock: %pe\n",
-				     wrp->clk_tmr);
-	}
-
-	ret = clk_prepare_enable(wrp->clk_spi);
-	if (ret)
-		return ret;
-
-	ret = clk_prepare_enable(wrp->clk_wrap);
+	ret = devm_clk_bulk_get_all_enable(wrp->dev, &clk);
 	if (ret)
-		goto err_out1;
-
-	ret = clk_prepare_enable(wrp->clk_sys);
-	if (ret)
-		goto err_out2;
-
-	ret = clk_prepare_enable(wrp->clk_tmr);
-	if (ret)
-		goto err_out3;
+		return dev_err_probe(wrp->dev, ret,
+				     "failed to get clocks\n");
 
 	/* Enable internal dynamic clock */
 	if (HAS_CAP(wrp->master->caps, PWRAP_CAP_DCM)) {
@@ -2579,7 +2537,7 @@ static int pwrap_probe(struct platform_device *pdev)
 		ret = pwrap_init(wrp);
 		if (ret) {
 			dev_dbg(wrp->dev, "init failed with %d\n", ret);
-			goto err_out4;
+			return ret;
 		}
 	}
 
@@ -2592,8 +2550,7 @@ static int pwrap_probe(struct platform_device *pdev)
 
 	if (!(pwrap_readl(wrp, PWRAP_WACS2_RDATA) & mask_done)) {
 		dev_dbg(wrp->dev, "initialization isn't finished\n");
-		ret = -ENODEV;
-		goto err_out4;
+		return -ENODEV;
 	}
 
 	/* Initialize watchdog, may not be done by the bootloader */
@@ -2622,42 +2579,27 @@ static int pwrap_probe(struct platform_device *pdev)
 		pwrap_writel(wrp, wrp->master->int1_en_all, PWRAP_INT1_EN);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		ret = irq;
-		goto err_out2;
-	}
+	if (irq < 0)
+		return irq;
 
 	ret = devm_request_irq(wrp->dev, irq, pwrap_interrupt,
 			       IRQF_TRIGGER_HIGH,
 			       "mt-pmic-pwrap", wrp);
 	if (ret)
-		goto err_out4;
+		return ret;
 
 	wrp->regmap = devm_regmap_init(wrp->dev, NULL, wrp, wrp->slave->regops->regmap);
-	if (IS_ERR(wrp->regmap)) {
-		ret = PTR_ERR(wrp->regmap);
-		goto err_out2;
-	}
+	if (IS_ERR(wrp->regmap))
+		return PTR_ERR(wrp->regmap);
 
 	ret = of_platform_populate(np, NULL, NULL, wrp->dev);
 	if (ret) {
 		dev_dbg(wrp->dev, "failed to create child devices at %pOF\n",
 				np);
-		goto err_out4;
+		return ret;
 	}
 
 	return 0;
-
-err_out4:
-	clk_disable_unprepare(wrp->clk_tmr);
-err_out3:
-	clk_disable_unprepare(wrp->clk_sys);
-err_out2:
-	clk_disable_unprepare(wrp->clk_wrap);
-err_out1:
-	clk_disable_unprepare(wrp->clk_spi);
-
-	return ret;
 }
 
 static struct platform_driver pwrap_drv = {
-- 
2.45.2


