Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0465DC76196
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 10:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t6XLS59r617m9tj5k/2pybEW7bWVwDqvjV5epULTB+M=; b=vv20/qNWWY1WuwgY9a7pJ7JZTa
	XGtm38l8fio19nB0qcKDrBO1ayyQXGFemHPYgdKX5Cax5tZuz/8EPC1Zb7WOzX7Wr2kzijd7UyNsQ
	aBfqAy1N6A9S1Qt5Re1lpsHuBM9eJkwY6YzebKeBaqq5F8U07K1rddBRNn2K9SxRpwgECARZt24g2
	GKgE096RH0OQQcB22BLwZflkepVXVVkTpyfRTIF1Ki2nfv1O+eYlP+XyjPewaJWF1dioxLTlKzFjM
	DbXL645csInm0OePSU8njrO2zvGFRfZbs/wrvQbSsmYqvCoXjAix2ozPS5+929kmOV6D4c53biVGE
	Eku0RwaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjHce-00EyR9-2G;
	Mon, 03 Apr 2023 10:41:12 +0000
Received: from mail.hust.edu.cn ([202.114.0.240] helo=hust.edu.cn)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjHcb-00EyOV-15;
	Mon, 03 Apr 2023 10:41:11 +0000
Received: from passwd123-ThinkStation-P920.. ([222.20.94.23])
	(user=void0red@hust.edu.cn mech=LOGIN bits=0)
	by mx1.hust.edu.cn  with ESMTP id 333Ad1oW026913-333Ad1oX026913
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 3 Apr 2023 18:39:01 +0800
From: Kang Chen <void0red@hust.edu.cn>
To: dzm91@hust.edu.cn
Cc: rafael@kernel.org, daniel.lezcano@linaro.org, amitk@kernel.org,
        rui.zhang@intel.com, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com, daniel@makrotopia.org,
        rdunlap@infradead.org, bchihi@baylibre.com, henry.yen@mediatek.com,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        hust-os-kernel-patches@googlegroups.com, void0red@gmail.com,
        error27@gmail.com, Kang Chen <void0red@hust.edu.cn>
Subject: [PATCH] drivers: thermal: mediatek: fix of_iomap leak in mtk_thermal_probe
Date: Mon,  3 Apr 2023 18:38:55 +0800
Message-Id: <20230403103855.3601901-1-void0red@hust.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FEAS-AUTH-USER: void0red@hust.edu.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_034109_739131_77121AED 
X-CRM114-Status: GOOD (  11.45  )
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

Smatch reports:
1. mtk_thermal_probe() warn: 'apmixed_base' from of_iomap() not released.
2. mtk_thermal_probe() warn: 'auxadc_base' from of_iomap() not released.

The original code forgets to release iomap resource when handling errors,
fix it through unified error handling code at the end of mtk_thermal_probe.

Fixes: 89945047b166 ("thermal: mediatek: Add tsensor support for V2 thermal system")
Signed-off-by: Kang Chen <void0red@hust.edu.cn>
---
I think the this should be released on the success path but I was too
scared of breaking things. Let me know and I will resend if people want
me to do that.

 drivers/thermal/mediatek/auxadc_thermal.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/thermal/mediatek/auxadc_thermal.c b/drivers/thermal/mediatek/auxadc_thermal.c
index ab730f9552d0..741c7d8151bd 100644
--- a/drivers/thermal/mediatek/auxadc_thermal.c
+++ b/drivers/thermal/mediatek/auxadc_thermal.c
@@ -1149,13 +1149,15 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 
 	if (auxadc_phys_base == OF_BAD_ADDR) {
 		dev_err(&pdev->dev, "Can't get auxadc phys address\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_iounmap_auxadc;
 	}
 
 	apmixedsys = of_parse_phandle(np, "mediatek,apmixedsys", 0);
 	if (!apmixedsys) {
 		dev_err(&pdev->dev, "missing apmixedsys node\n");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto err_iounmap_auxadc;
 	}
 
 	apmixed_base = of_iomap(apmixedsys, 0);
@@ -1165,17 +1167,18 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 
 	if (apmixed_phys_base == OF_BAD_ADDR) {
 		dev_err(&pdev->dev, "Can't get auxadc phys address\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_iounmap_apmixed;
 	}
 
 	ret = device_reset_optional(&pdev->dev);
 	if (ret)
-		return ret;
+		goto err_iounmap_apmixed;
 
 	ret = clk_prepare_enable(mt->clk_auxadc);
 	if (ret) {
 		dev_err(&pdev->dev, "Can't enable auxadc clk: %d\n", ret);
-		return ret;
+		goto err_iounmap_apmixed;
 	}
 
 	ret = clk_prepare_enable(mt->clk_peri_therm);
@@ -1220,7 +1223,10 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 	clk_disable_unprepare(mt->clk_peri_therm);
 err_disable_clk_auxadc:
 	clk_disable_unprepare(mt->clk_auxadc);
-
+err_iounmap_apmixed:
+	iounmap(apmixed_base);
+err_iounmap_auxadc:
+	iounmap(auxadc_base);
 	return ret;
 }
 
-- 
2.34.1


