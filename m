Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 173FCC4828E
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Feb 2024 18:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=psW+zR+255VuGRBEiZa3qV2ZSoJCA9HDeWGIZlh4BNU=; b=Uu6OAIdlem04J/K2hxNOAy5Xyw
	VoZR/WXuYQsKI4uV11+woUxGWjD8uCW0Unl7OAOw18mJI9aA6oJiT7zEGssd0JhV73t3B3ZQXFlPy
	3ec3LILVG678QGDAw47gzfb3yO8HtDnI8t8PDfkcDTSuZsWjuV4ttWiP8CngLHI1EkHHbq5WS6M+h
	3zByNgVDV1ig2adx5mlj91cT+dybNepGw+HEjDR9QNx/P5+pE2NhQANT/25Zpo7ixwbGkETCCMUdw
	1V4wx6HeXTWmNC1RMBpJ1kgj43XRadREscU9PDzRkby9nyk3z/om0+K7h/eczTcWxrEA6hDBcQFiR
	84KTEeUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVbPD-00000008v7J-14ty;
	Thu, 01 Feb 2024 18:03:19 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVbNT-00000008tZI-0jCv;
	Thu, 01 Feb 2024 18:01:38 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 411I1C0e127793;
	Thu, 1 Feb 2024 12:01:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706810472;
	bh=psW+zR+255VuGRBEiZa3qV2ZSoJCA9HDeWGIZlh4BNU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=UyO5EnnDRngm9H5SGH1A+jEgO7wkevXIJJ227pxDcUetRFvBS9480xEhg15nfp+R+
	 nj4Su04MrkyrG0saepA77HVR2LW/DreMBTJ1KaHdr9Oo5AsU5avhRdjIixfbcnDmGI
	 snG8ICoQK2Ebi8klQh3Udfc9/3St+CDi3QE8n4v0=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 411I1Ctb047604
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Feb 2024 12:01:12 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 Feb 2024 12:01:12 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 Feb 2024 12:01:12 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 411I12Gs117221;
	Thu, 1 Feb 2024 12:01:11 -0600
From: Andrew Davis <afd@ti.com>
To: Sebastian Reichel <sre@kernel.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Cristian Ciocaltea
	<cristian.ciocaltea@gmail.com>,
        Florian Fainelli
	<florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden
	<sbranden@broadcom.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad
 Dybcio <konrad.dybcio@linaro.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-actions@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH 14/18] power: reset: as3722-poweroff: Use devm_register_sys_off_handler(POWER_OFF)
Date: Thu, 1 Feb 2024 12:00:58 -0600
Message-ID: <20240201180102.70395-15-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240201180102.70395-1-afd@ti.com>
References: <20240201180102.70395-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_100131_688880_9499046A 
X-CRM114-Status: GOOD (  14.57  )
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

Use device life-cycle managed register function to simplify probe and
exit paths.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/power/reset/as3722-poweroff.c | 30 ++++++++++-----------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/power/reset/as3722-poweroff.c b/drivers/power/reset/as3722-poweroff.c
index ab3350ce2d621..bb26fa6fa67ca 100644
--- a/drivers/power/reset/as3722-poweroff.c
+++ b/drivers/power/reset/as3722-poweroff.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/reboot.h>
 #include <linux/slab.h>
 
 struct as3722_poweroff {
@@ -18,22 +19,18 @@ struct as3722_poweroff {
 	struct as3722 *as3722;
 };
 
-static struct as3722_poweroff *as3722_pm_poweroff;
-
-static void as3722_pm_power_off(void)
+static int as3722_pm_power_off(struct sys_off_data *data)
 {
+	struct as3722_poweroff *as3722_pm_poweroff = data->cb_data;
 	int ret;
 
-	if (!as3722_pm_poweroff) {
-		pr_err("AS3722 poweroff is not initialised\n");
-		return;
-	}
-
 	ret = as3722_update_bits(as3722_pm_poweroff->as3722,
 		AS3722_RESET_CONTROL_REG, AS3722_POWER_OFF, AS3722_POWER_OFF);
 	if (ret < 0)
 		dev_err(as3722_pm_poweroff->dev,
 			"RESET_CONTROL_REG update failed, %d\n", ret);
+
+	return NOTIFY_DONE;
 }
 
 static int as3722_poweroff_probe(struct platform_device *pdev)
@@ -54,18 +51,14 @@ static int as3722_poweroff_probe(struct platform_device *pdev)
 
 	as3722_poweroff->as3722 = dev_get_drvdata(pdev->dev.parent);
 	as3722_poweroff->dev = &pdev->dev;
-	as3722_pm_poweroff = as3722_poweroff;
-	if (!pm_power_off)
-		pm_power_off = as3722_pm_power_off;
 
-	return 0;
-}
+	return devm_register_sys_off_handler(as3722_poweroff->dev,
+					     SYS_OFF_MODE_POWER_OFF,
+					     SYS_OFF_PRIO_DEFAULT,
+					     as3722_pm_power_off,
+					     as3722_poweroff);
 
-static void as3722_poweroff_remove(struct platform_device *pdev)
-{
-	if (pm_power_off == as3722_pm_power_off)
-		pm_power_off = NULL;
-	as3722_pm_poweroff = NULL;
+	return 0;
 }
 
 static struct platform_driver as3722_poweroff_driver = {
@@ -73,7 +66,6 @@ static struct platform_driver as3722_poweroff_driver = {
 		.name = "as3722-power-off",
 	},
 	.probe = as3722_poweroff_probe,
-	.remove_new = as3722_poweroff_remove,
 };
 
 module_platform_driver(as3722_poweroff_driver);
-- 
2.39.2


