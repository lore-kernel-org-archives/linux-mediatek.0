Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 111FEC4828F
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Feb 2024 17:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2C083AYY3Dbpmc6BgF2r63gVH+xSPvAPWXFMl2z3vuQ=; b=ElfxeyBhMs5w5Dw1c1CaA05GRE
	CxAXgNeWF6A6q/849VXkbvVlurUJD/Z+KToi+mpKhyjVA4YN64pdf6LBTUNxw/Z61oTPjsj7DnKM0
	nAD0slP6ScB9R/UpJqZdxhL+S6qdKPbCvPFGJhXwMFkIy+15BOII1KsRq0d4oaZi0NpQ7I0rM6Cy4
	hb7PPiEsWgY2siPTIIcrakYN/rIeqiX12WphKZ5lKfjrRw23T6wOdeKJmeXsCsbNPbRwvfBX+Qr4f
	qg6hjWuhPeqQw+jYBrZ/OAcR6NjAq2DGrGkB/mV7ULUHY/G/U5I4KD+o8vK/vztwcRVc9qk3DeEO2
	VEWXFQDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY7tF-0000000EQJj-3zg2;
	Thu, 08 Feb 2024 17:08:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY7pE-0000000EOkd-2wVD;
	Thu, 08 Feb 2024 17:04:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2C083AYY3Dbpmc6BgF2r63gVH+xSPvAPWXFMl2z3vuQ=; b=UwU9Q5FhWAC74jGNrGYmm2M+Ui
	rSzB6mvz/cRfZdIrA4JCCkmYY9JHYbUD+6311OARekdlJdmhXidRoHDPhDo1UXqeFuNwq6FXidIpj
	8EvCub7mfVjjbNy6NVJiXXkYzC3gb2NV5sHcDX9m+gx8Ns29Uzr16Sqb9vonudsseZRL+KksIPg83
	BXkTVNHoNnj7Hi5RsJIJB8JAfuU5plcATSU1avi9CwOsij2PSgK9kOglpqU0UoyT8jDpLF2XWzQAD
	CGiHWa5pQ23a70jcCT7/GK0EMm9BhWbH3PrLkci6jhAH7P9nZNesqb6DJM3et3BfEEnXwRHtYzSMQ
	yIvLkTvQ==;
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY7pB-0000000DWrv-0QfZ;
	Thu, 08 Feb 2024 17:04:35 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 418H4NOq095472;
	Thu, 8 Feb 2024 11:04:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707411863;
	bh=2C083AYY3Dbpmc6BgF2r63gVH+xSPvAPWXFMl2z3vuQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=pgZTtn8NJlV0+dB9SwwTSwSa1JvlqZnW2jnZ3iqGBkKRHMuphFlSSlO8yyLJ/2/iu
	 q2sBAYKRUQadeOenL9a0m7I2YK0y7K/rmbai3JqS4CH1ywoR6vtbhbKit1fl53Xx/3
	 T7wWgV0MhCe9r2KEij3BPsD5m4kYrbzt7/76IM74=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 418H4NJK035416
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Feb 2024 11:04:23 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Feb 2024 11:04:23 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Feb 2024 11:04:23 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 418H4B6J091006;
	Thu, 8 Feb 2024 11:04:22 -0600
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
Subject: [PATCH v3 17/19] power: reset: restart-poweroff: Use devm_register_sys_off_handler(POWER_OFF)
Date: Thu, 8 Feb 2024 11:04:08 -0600
Message-ID: <20240208170410.67975-18-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208170410.67975-1-afd@ti.com>
References: <20240208170410.67975-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_170433_569149_4979EB7B 
X-CRM114-Status: GOOD (  13.57  )
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
 drivers/power/reset/restart-poweroff.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/power/reset/restart-poweroff.c b/drivers/power/reset/restart-poweroff.c
index f4d6004793d3a..fcd588f9ae9d3 100644
--- a/drivers/power/reset/restart-poweroff.c
+++ b/drivers/power/reset/restart-poweroff.c
@@ -14,29 +14,21 @@
 #include <linux/module.h>
 #include <linux/reboot.h>
 
-static void restart_poweroff_do_poweroff(void)
+static int restart_poweroff_do_poweroff(struct sys_off_data *data)
 {
 	reboot_mode = REBOOT_HARD;
 	machine_restart(NULL);
+	return NOTIFY_DONE;
 }
 
 static int restart_poweroff_probe(struct platform_device *pdev)
 {
-	/* If a pm_power_off function has already been added, leave it alone */
-	if (pm_power_off != NULL) {
-		dev_err(&pdev->dev,
-			"pm_power_off function already registered");
-		return -EBUSY;
-	}
-
-	pm_power_off = &restart_poweroff_do_poweroff;
-	return 0;
-}
-
-static void restart_poweroff_remove(struct platform_device *pdev)
-{
-	if (pm_power_off == &restart_poweroff_do_poweroff)
-		pm_power_off = NULL;
+	/* Set this handler to low priority to not override an existing handler */
+	return devm_register_sys_off_handler(&pdev->dev,
+					     SYS_OFF_MODE_POWER_OFF,
+					     SYS_OFF_PRIO_LOW,
+					     restart_poweroff_do_poweroff,
+					     NULL);
 }
 
 static const struct of_device_id of_restart_poweroff_match[] = {
@@ -47,7 +39,6 @@ MODULE_DEVICE_TABLE(of, of_restart_poweroff_match);
 
 static struct platform_driver restart_poweroff_driver = {
 	.probe = restart_poweroff_probe,
-	.remove_new = restart_poweroff_remove,
 	.driver = {
 		.name = "poweroff-restart",
 		.of_match_table = of_restart_poweroff_match,
-- 
2.39.2


