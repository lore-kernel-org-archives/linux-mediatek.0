Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79944C77B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Apr 2023 02:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k/33bWMCjVTHkAxRL+jVkYpwhXgOAclT5cOzRfoL3E4=; b=Fvl/VnrjTMtALIHz7vUY1gN3rA
	ltRQX7usuCC4UEIHj47BU4+xQRpvLifuhuE3z12iUkdUZVbtkqiknx9bdmGKO6M7m6mjxGx4HPygk
	uJHQhq4MapQZgU61Hi4zrj/KXslnRT0H1GZ/MiT82sGvdlwa7rSknp3ev44jONwZNmSBrQp84wRZV
	U35LeXbSF2kZs96sOi/yBgO/PeWhndm9VGyZEzZE9p31eErby+66M7F+KyeTSr572tWUEWTyFPoJI
	nHIvNhX1f3LC7S7G1EjiFZpOkLTUi4HRzBRgFyYndGEdYsv3pTFKjOmYmufH5M7pp7bOHIvykPm9Z
	Z8wLDOBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poxHd-003kwr-1E;
	Wed, 19 Apr 2023 02:10:57 +0000
Received: from [202.114.0.240] (helo=hust.edu.cn)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poxHQ-003kuQ-1W;
	Wed, 19 Apr 2023 02:10:55 +0000
Received: from passwd123-ThinkStation-P920.. ([222.20.94.23])
	(user=void0red@hust.edu.cn mech=LOGIN bits=0)
	by mx1.hust.edu.cn  with ESMTP id 33J27wUg015429-33J27wUi015429
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 19 Apr 2023 10:08:00 +0800
From: Kang Chen <void0red@hust.edu.cn>
To: daniel.lezcano@linaro.org
Cc: amitk@kernel.org, angelogioacchino.delregno@collabora.com,
        bchihi@baylibre.com, daniel@makrotopia.org, dzm91@hust.edu.cn,
        error27@gmail.com, henry.yen@mediatek.com,
        hust-os-kernel-patches@googlegroups.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
        matthias.bgg@gmail.com, rafael@kernel.org, rdunlap@infradead.org,
        rui.zhang@intel.com, Kang Chen <void0red@hust.edu.cn>
Subject: [PATCH v5 2/2] thermal: mediatek: change clk_prepare_enable to devm_clk_get_enabled in mtk_thermal_probe
Date: Wed, 19 Apr 2023 10:07:49 +0800
Message-Id: <20230419020749.621257-2-void0red@hust.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230419020749.621257-1-void0red@hust.edu.cn>
References: <20230419020749.621257-1-void0red@hust.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FEAS-AUTH-USER: void0red@hust.edu.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_191044_861393_74B0CB6B 
X-CRM114-Status: GOOD (  12.98  )
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
v5 -> v4: use PTR_ERR to convert err ptr to err code
v4 -> v3: port to linux-next tree
v3 -> v2: remove some useles func calls.
v2 -> v1: init

 drivers/thermal/mediatek/auxadc_thermal.c | 44 +++++------------------
 1 file changed, 9 insertions(+), 35 deletions(-)

diff --git a/drivers/thermal/mediatek/auxadc_thermal.c b/drivers/thermal/mediatek/auxadc_thermal.c
index dcc64237ea60..a488e1797f3d 100644
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
@@ -1252,16 +1244,18 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(mt->clk_auxadc);
-	if (ret) {
+	mt->clk_auxadc = devm_clk_get_enabled(&pdev->dev, "auxadc");
+	if (IS_ERR(mt->clk_auxadc)) {
+		ret = PTR_ERR(mt->clk_auxadc);
 		dev_err(&pdev->dev, "Can't enable auxadc clk: %d\n", ret);
 		return ret;
 	}
 
-	ret = clk_prepare_enable(mt->clk_peri_therm);
-	if (ret) {
+	mt->clk_peri_therm = devm_clk_get_enabled(&pdev->dev, "therm");
+	if (IS_ERR(mt->clk_peri_therm)) {
+		ret = PTR_ERR(mt->clk_peri_therm);
 		dev_err(&pdev->dev, "Can't enable peri clk: %d\n", ret);
-		goto err_disable_clk_auxadc;
+		return ret;
 	}
 
 	mtk_thermal_turn_on_buffer(mt, apmixed_base);
@@ -1288,38 +1282,18 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 
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


