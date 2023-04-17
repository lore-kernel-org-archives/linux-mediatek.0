Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0760C77B7C
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Apr 2023 12:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b6nk80PWvKWeOEMlnYPz4wVRETF9Ho16eTolEB9uGqQ=; b=nBZOlwhVX3jUtq49GNvtj9bNtc
	V2Ypgm96pVYsYLwUzI4VzK6+0Aul7ogfpwfBRAw3RX0Nfnb+OkY1uxQnkysJplG6U8j73LY/wbB+i
	jkp7xFimL0dnRIEw5Vjsm70KoC/KRo8hvNbUI77ey0SVenOZ8QOvgORhlHiEy34BoX5eoNy+nnnO8
	4VdqYeXGqjh3ZAy00+b0kO/4U733lnzcC3OlQOFzHni4cnBCJC0dSXXD7CtB5ArftWXBZAaAmbGMo
	NtP4r5aeIjcv4DXLegjJVuXRrZxkU4BW7AtazJaGxmFklZdgb2+tCNrMu+SPxiWAzDL+m47+v1xf8
	iYoIEbPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poORP-00GFC5-2K;
	Mon, 17 Apr 2023 12:58:43 +0000
Received: from [202.114.0.240] (helo=hust.edu.cn)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poORA-00GEqP-0Q;
	Mon, 17 Apr 2023 12:58:39 +0000
Received: from passwd123-ThinkStation-P920.. ([222.20.94.23])
	(user=void0red@hust.edu.cn mech=LOGIN bits=0)
	by mx1.hust.edu.cn  with ESMTP id 33HCtsCs000971-33HCtsCu000971
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 17 Apr 2023 20:55:55 +0800
From: Kang Chen <void0red@hust.edu.cn>
To: error27@gmail.com
Cc: amitk@kernel.org, angelogioacchino.delregno@collabora.com,
        bchihi@baylibre.com, daniel.lezcano@linaro.org, daniel@makrotopia.org,
        dzm91@hust.edu.cn, henry.yen@mediatek.com,
        hust-os-kernel-patches@googlegroups.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
        matthias.bgg@gmail.com, rafael@kernel.org, rdunlap@infradead.org,
        rui.zhang@intel.com, void0red@gmail.com, void0red@hust.edu.cn
Subject: [PATCH v4 2/2] thermal: mediatek: change clk_prepare_enable to devm_clk_get_enabled in mtk_thermal_probe
Date: Mon, 17 Apr 2023 20:55:33 +0800
Message-Id: <20230417125533.3142236-2-void0red@hust.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230417125533.3142236-1-void0red@hust.edu.cn>
References: <48ae0e2e-257d-4ad2-afbc-2eb4b48e516b@kili.mountain>
 <20230417125533.3142236-1-void0red@hust.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FEAS-AUTH-USER: void0red@hust.edu.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_055828_543036_E04D806A 
X-CRM114-Status: GOOD (  12.71  )
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

use devm_clk_get_enabled to do automatic resource management.
Meanwhile, remove error handling labels in the probe function and
the whole remove function.

Signed-off-by: Kang Chen <void0red@hust.edu.cn>
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
---
v4 -> v3: port to linux-next tree
v3 -> v2: remove some useles func calls.
v2 -> v1: init

 drivers/thermal/mediatek/auxadc_thermal.c | 48 +++++------------------
 1 file changed, 10 insertions(+), 38 deletions(-)

diff --git a/drivers/thermal/mediatek/auxadc_thermal.c b/drivers/thermal/mediatek/auxadc_thermal.c
index dcc64237ea60..18c8cce960c3 100644
--- a/drivers/thermal/mediatek/auxadc_thermal.c
+++ b/drivers/thermal/mediatek/auxadc_thermal.c
@@ -1186,14 +1186,6 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 
 	mt->conf = of_device_get_match_data(&pdev->dev);
 
-	mt->clk_peri_therm = devm_clk_get(&pdev->dev, "therm");
-	if (IS_ERR(mt->clk_peri_therm))
-		return PTR_ERR(mt->clk_peri_therm);
-
-	mt->clk_auxadc = devm_clk_get(&pdev->dev, "auxadc");
-	if (IS_ERR(mt->clk_auxadc))
-		return PTR_ERR(mt->clk_auxadc);
-
 	mt->thermal_base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
 	if (IS_ERR(mt->thermal_base))
 		return PTR_ERR(mt->thermal_base);
@@ -1252,16 +1244,16 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(mt->clk_auxadc);
-	if (ret) {
-		dev_err(&pdev->dev, "Can't enable auxadc clk: %d\n", ret);
-		return ret;
+	mt->clk_auxadc = devm_clk_get_enabled(&pdev->dev, "auxadc");
+	if (IS_ERR(mt->clk_auxadc)) {
+		dev_err(&pdev->dev, "Can't enable auxadc clk: %d\n", mt->clk_auxadc);
+		return PTR_ERR(mt->clk_auxadc);
 	}
 
-	ret = clk_prepare_enable(mt->clk_peri_therm);
-	if (ret) {
-		dev_err(&pdev->dev, "Can't enable peri clk: %d\n", ret);
-		goto err_disable_clk_auxadc;
+	mt->clk_peri_therm = devm_clk_get_enabled(&pdev->dev, "therm");
+	if (IS_ERR(mt->clk_peri_therm)) {
+		dev_err(&pdev->dev, "Can't enable peri clk: %d\n", mt->clk_peri_therm);
+		return PTR_ERR(mt->clk_peri_therm);
 	}
 
 	mtk_thermal_turn_on_buffer(mt, apmixed_base);
@@ -1288,38 +1280,18 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 
 	tzdev = devm_thermal_of_zone_register(&pdev->dev, 0, mt,
 					      &mtk_thermal_ops);
-	if (IS_ERR(tzdev)) {
-		ret = PTR_ERR(tzdev);
-		goto err_disable_clk_peri_therm;
-	}
+	if (IS_ERR(tzdev))
+		return PTR_ERR(tzdev);
 
 	ret = devm_thermal_add_hwmon_sysfs(&pdev->dev, tzdev);
 	if (ret)
 		dev_warn(&pdev->dev, "error in thermal_add_hwmon_sysfs");
 
 	return 0;
-
-err_disable_clk_peri_therm:
-	clk_disable_unprepare(mt->clk_peri_therm);
-err_disable_clk_auxadc:
-	clk_disable_unprepare(mt->clk_auxadc);
-
-	return ret;
-}
-
-static int mtk_thermal_remove(struct platform_device *pdev)
-{
-	struct mtk_thermal *mt = platform_get_drvdata(pdev);
-
-	clk_disable_unprepare(mt->clk_peri_therm);
-	clk_disable_unprepare(mt->clk_auxadc);
-
-	return 0;
 }
 
 static struct platform_driver mtk_thermal_driver = {
 	.probe = mtk_thermal_probe,
-	.remove = mtk_thermal_remove,
 	.driver = {
 		.name = "mtk-thermal",
 		.of_match_table = mtk_thermal_of_match,
-- 
2.34.1


