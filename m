Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61723C4828D
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Feb 2024 18:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+yoH0oyAcvSMYuuy/HNbc6iZw+avNZNinJT/iIL/4IE=; b=JDaCZX8Q6spkHsVA01FzEvvucw
	5zOCCjUStWQZcqzyeTF9/6clk45qVJccEWsIVuDEG1Xo5KOTBSnY6PbGaOiom1k2X4CTyhqmKc7Vz
	a1GuIwpqaUoGFgEcojqXJV5Z0V7kgYDwEjc0KNrHCLPdNMHxMg+2PZTU4fVPgZ6TVvhRoudUWMBtl
	cEe1qh6fkye0Sfa8vPZBKVUOz7iX2uNR+8pxwZ0irjObUG3BNwWNwBTDGyW7Dx9Pncveme6gdibj0
	kqRVa/Kp+aOgO8zCFz8RIKHvHNpBGiDWf4pkyEPlBSyzoRTu9u74E8q5dGHPnog4Ij1FPKE+0dfHs
	73ySmOdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVbP4-00000008uyW-1F2x;
	Thu, 01 Feb 2024 18:03:10 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVbNP-00000008tVY-3DZY;
	Thu, 01 Feb 2024 18:01:34 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 411I1BFn127788;
	Thu, 1 Feb 2024 12:01:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706810471;
	bh=+yoH0oyAcvSMYuuy/HNbc6iZw+avNZNinJT/iIL/4IE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=TEdRKWAS68vhJJnd9EvHzfpDNDUtaYTLUff5lKyt45xraFCOzBhWFWWDs6v686NP2
	 JOCvYzpgpUi/mgq0ZWXBUyM+qKVCJ5kDjTsxt+FfOzRKdJfKEk7xPbGKA8ms77Ds+H
	 VvV1Jgk+88Xd8XmBSqPY1fo4wyAmLT4a7eaGPGtM=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 411I1Bso120468
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Feb 2024 12:01:11 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 Feb 2024 12:01:11 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 Feb 2024 12:01:11 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 411I12Gr117221;
	Thu, 1 Feb 2024 12:01:10 -0600
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
Subject: [PATCH 13/18] power: reset: regulator-poweroff: Use devm_register_sys_off_handler(POWER_OFF)
Date: Thu, 1 Feb 2024 12:00:57 -0600
Message-ID: <20240201180102.70395-14-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240201180102.70395-1-afd@ti.com>
References: <20240201180102.70395-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_100128_485216_C39ECCFA 
X-CRM114-Status: GOOD (  16.41  )
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
 drivers/power/reset/regulator-poweroff.c | 36 +++++++++---------------
 1 file changed, 13 insertions(+), 23 deletions(-)

diff --git a/drivers/power/reset/regulator-poweroff.c b/drivers/power/reset/regulator-poweroff.c
index 15160809c423a..fed4978e38580 100644
--- a/drivers/power/reset/regulator-poweroff.c
+++ b/drivers/power/reset/regulator-poweroff.c
@@ -13,18 +13,15 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
+#include <linux/reboot.h>
 #include <linux/regulator/consumer.h>
 
 #define TIMEOUT_MS 3000
 
-/*
- * Hold configuration here, cannot be more than one instance of the driver
- * since pm_power_off itself is global.
- */
-static struct regulator *cpu_regulator;
-
-static void regulator_poweroff_do_poweroff(void)
+static int regulator_poweroff_do_poweroff(struct sys_off_data *data)
 {
+	struct regulator *cpu_regulator = data->cb_data;
+
 	if (cpu_regulator && regulator_is_enabled(cpu_regulator))
 		regulator_force_disable(cpu_regulator);
 
@@ -32,30 +29,24 @@ static void regulator_poweroff_do_poweroff(void)
 	mdelay(TIMEOUT_MS);
 
 	WARN_ON(1);
+
+	return NOTIFY_DONE;
 }
 
 static int regulator_poweroff_probe(struct platform_device *pdev)
 {
-	/* If a pm_power_off function has already been added, leave it alone */
-	if (pm_power_off != NULL) {
-		dev_err(&pdev->dev,
-			"%s: pm_power_off function already registered\n",
-			__func__);
-		return -EBUSY;
-	}
+	struct regulator *cpu_regulator;
 
 	cpu_regulator = devm_regulator_get(&pdev->dev, "cpu");
 	if (IS_ERR(cpu_regulator))
 		return PTR_ERR(cpu_regulator);
 
-	pm_power_off = &regulator_poweroff_do_poweroff;
-	return 0;
-}
-
-static void regulator_poweroff_remove(struct platform_device *pdev)
-{
-	if (pm_power_off == &regulator_poweroff_do_poweroff)
-		pm_power_off = NULL;
+	/* Set this handler to low priority to not override an existing handler */
+	return devm_register_sys_off_handler(&pdev->dev,
+					     SYS_OFF_MODE_POWER_OFF,
+					     SYS_OFF_PRIO_LOW,
+					     regulator_poweroff_do_poweroff,
+					     cpu_regulator);
 }
 
 static const struct of_device_id of_regulator_poweroff_match[] = {
@@ -66,7 +57,6 @@ MODULE_DEVICE_TABLE(of, of_regulator_poweroff_match);
 
 static struct platform_driver regulator_poweroff_driver = {
 	.probe = regulator_poweroff_probe,
-	.remove_new = regulator_poweroff_remove,
 	.driver = {
 		.name = "poweroff-regulator",
 		.of_match_table = of_regulator_poweroff_match,
-- 
2.39.2


