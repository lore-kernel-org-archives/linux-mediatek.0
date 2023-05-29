Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE51C77B7E
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 16:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ilrAA1wC/2lR7cmTwLpraXPfwi0Ne6pIsDBp9ANZIxA=; b=5GvNdqMtwZYOC9h5ZQ2tR7EnXJ
	5ceaNnMSLWFPIP+wAeS8j/cusghN/wWCj5SYsisvTJycF2SG3RYejDfdqiwlMjkGGjOveDy6F0ccb
	+Ain1HFlyBhgORZLDeVe7uLGXFCWW3Hu1+iqAdMWF/ik+IQItywmdz6/eAstgb0fnTCuTNzU8/xkQ
	gK99GGsBrhg/ZCaAroYppfjaBVroA38WfwSoNH/WC62JzkgB3+6KMd3P6+0as9U37ICRIjnD6t87v
	iGE/0XcmmZd3cvfl5F55Bu/PPy/YomZf43xsIoykfbtqX+1dSw9qUYoBWTc8iSgC/oEinhXtXCacS
	rv2TIn6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3fdh-00B64e-1d;
	Mon, 29 May 2023 16:22:33 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3fdX-00B60O-2d;
	Mon, 29 May 2023 16:22:25 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1685377291; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kJo0+4Nh6uTfjtAcHruO7UKi+Y+CK/sWFzpJcJ/UcKhkgCmDDl8jKEkTyHn3WKvtuFFBCESfKbf5pIrpeiewabdKNwmjMG9fFWprA96xkJXrKGw/4iOoR9LCJ9lFompQ0qoRTsflMudT0oqUrv2GmKFktPolAagpNh4G7L5lh4M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1685377291; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=ilrAA1wC/2lR7cmTwLpraXPfwi0Ne6pIsDBp9ANZIxA=; 
	b=YWlfiW6dExhNftSoyAwit80Pt6GR85YsCYOxH1q4EBTlD03CERJvxe+9CnZqPDaosGP2lSfB7IB9rdc21+Jo7PTxsXbpDJIlSztH/OtDL48foysIRFkixjKguTm8BamTpEOHbBV0BoswDzc+ghVjLN3YVjDET1DEXMBA857t0sQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1685377291;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=ilrAA1wC/2lR7cmTwLpraXPfwi0Ne6pIsDBp9ANZIxA=;
	b=qgv0OzOh3t0eJ4mfgJXlbms56WzoJYNoAyrZ/2maDsOOhBD5fRE6r5PdmClMqiN1
	xN6jbjcWhCDhTYd8+KZapgKtvhQqD2bhIRm9cQvWoEvXdRYPJA8IT3PHnVIzfzUmhuT
	l8b0MUQvh5U7BrX36wWLhtkJlwWAjyfxbNlaw3YzSLxfyqc+Aq2L/dS4RkAL2ivEMPU
	hwZTN71m1p0KOPOdRty8pl9J/kaov48y1a71zSqkD/1nysX5m/iJ3H1JeguajDGBRGp
	pPoe5MLoBd80nmxSalVmYfRv8jAVnaKGZRe4Ck8rYEqM2oKt7JWBP0eRGztHk0jz+3J
	RLMxeE9srA==
Received: from edelgard.fodlan.icenowy.me (120.85.97.71 [120.85.97.71]) by mx.zohomail.com
	with SMTPS id 1685377291110330.7646889379969; Mon, 29 May 2023 09:21:31 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kang Chen <void0red@hust.edu.cn>,
	Dongliang Mu <dzm91@hust.edu.cn>
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 2/2] thermal/drivers/mediatek: unmap foreign MMIO after probing
Date: Tue, 30 May 2023 00:20:56 +0800
Message-Id: <20230529162056.3786301-3-uwu@icenowy.me>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230529162056.3786301-1-uwu@icenowy.me>
References: <20230529162056.3786301-1-uwu@icenowy.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_092223_921858_FC915E96 
X-CRM114-Status: GOOD (  13.82  )
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

The MMIO space from auxadc and apmixedsys devices are only needed when
initializing the thermal sensors, so these memory regions could be
safely unmapped after the probing process to prevent resource leak.

Unmap them at the end of the probe method, and route the unmap codepath
to early exits of the probe method for preventing leak when error
handling.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 drivers/thermal/mediatek/auxadc_thermal.c | 32 ++++++++++++++++-------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/thermal/mediatek/auxadc_thermal.c b/drivers/thermal/mediatek/auxadc_thermal.c
index f59d36de20a0..c010a96f9aca 100644
--- a/drivers/thermal/mediatek/auxadc_thermal.c
+++ b/drivers/thermal/mediatek/auxadc_thermal.c
@@ -1229,13 +1229,15 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 
 	if (auxadc_phys_base == OF_BAD_ADDR) {
 		dev_err(&pdev->dev, "Can't get auxadc phys address\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto out_unmap_auxadc;
 	}
 
 	apmixedsys = of_parse_phandle(np, "mediatek,apmixedsys", 0);
 	if (!apmixedsys) {
 		dev_err(&pdev->dev, "missing apmixedsys node\n");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto out_unmap_auxadc;
 	}
 
 	apmixed_base = of_iomap(apmixedsys, 0);
@@ -1245,25 +1247,26 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 
 	if (apmixed_phys_base == OF_BAD_ADDR) {
 		dev_err(&pdev->dev, "Can't get auxadc phys address\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto out_unmap_apmixed;
 	}
 
 	ret = device_reset_optional(&pdev->dev);
 	if (ret)
-		return ret;
+		goto out_unmap_apmixed;
 
 	mt->clk_auxadc = devm_clk_get_enabled(&pdev->dev, "auxadc");
 	if (IS_ERR(mt->clk_auxadc)) {
 		ret = PTR_ERR(mt->clk_auxadc);
 		dev_err(&pdev->dev, "Can't enable auxadc clk: %d\n", ret);
-		return ret;
+		goto out_unmap_apmixed;
 	}
 
 	mt->clk_peri_therm = devm_clk_get_enabled(&pdev->dev, "therm");
 	if (IS_ERR(mt->clk_peri_therm)) {
 		ret = PTR_ERR(mt->clk_peri_therm);
 		dev_err(&pdev->dev, "Can't enable peri clk: %d\n", ret);
-		return ret;
+		goto out_unmap_apmixed;
 	}
 
 	mtk_thermal_turn_on_buffer(mt, apmixed_base);
@@ -1287,14 +1290,23 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 
 	tzdev = devm_thermal_of_zone_register(&pdev->dev, 0, mt,
 					      &mtk_thermal_ops);
-	if (IS_ERR(tzdev))
-		return PTR_ERR(tzdev);
+	if (IS_ERR(tzdev)) {
+		ret = PTR_ERR(tzdev);
+		goto out_unmap_apmixed;
+	}
 
 	ret = devm_thermal_add_hwmon_sysfs(&pdev->dev, tzdev);
-	if (ret)
+	if (ret) {
 		dev_warn(&pdev->dev, "error in thermal_add_hwmon_sysfs");
+		ret = 0;
+	}
 
-	return 0;
+out_unmap_apmixed:
+	iounmap(apmixed_base);
+out_unmap_auxadc:
+	iounmap(auxadc_base);
+
+	return ret;
 }
 
 static struct platform_driver mtk_thermal_driver = {
-- 
2.39.1


