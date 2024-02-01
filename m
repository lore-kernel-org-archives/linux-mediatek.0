Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851EBC48BF6
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Feb 2024 18:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NIThW8dvWRvWMprZfYkUcAv9QvAIjazC0Wh9+WTdW/k=; b=QAB+U9lxEQcr8WosoBwZ2wzMeX
	ExL2qXVZZ8z/FZYV1zx3vrTe1djvxum3VYOFqMvSbHj+jUzRAn5SOxk1Gy3rkpObfBmICEPdWcPBR
	fGmNQrqVRV+5q8ETFm646Eitk7qgGv6hRiFtiNyWUb7ERzDWV6uwQM8Nn+SUwHpmQooopetiknitP
	MGmP4QtB30P+8MJt0OzvpqnP/gFCn6tgjqf6DNC0/Oxa3JQjqlYbI5AbAMJCIqaFUkJ3Rd11bKsgz
	OumkHHMI2uxbjO4yP8YgdzFUJKjHGuDeWqzy0FwU+MN2sOvozCUoOeyB8AQhjWGrY2kLqnROuCpMx
	6Z9k6niQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVbOh-00000008uet-2l39;
	Thu, 01 Feb 2024 18:02:47 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVbNP-00000008tVL-2Avs;
	Thu, 01 Feb 2024 18:01:32 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 411I1ELM051733;
	Thu, 1 Feb 2024 12:01:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706810474;
	bh=NIThW8dvWRvWMprZfYkUcAv9QvAIjazC0Wh9+WTdW/k=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=rm1XIA5e4Rd+MaKMZD53SqGG1cTPvCemTrgkowPC2TgVVIYHMHHtJS0ad9yi9KOeb
	 +tfC+54rcrgXtKzhqOZN0rv/Uf5rfNYE5TuSras9Ff6Qljz95lgsORpI4ZRRY61NYW
	 4ov56vN26Wgga0dm5uhiXV/+HhxaKBnHfDrHFGHQ=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 411I1Ec2004657
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Feb 2024 12:01:14 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 Feb 2024 12:01:14 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 Feb 2024 12:01:14 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 411I12Gw117221;
	Thu, 1 Feb 2024 12:01:13 -0600
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
Subject: [PATCH 18/18] power: reset: syscon-poweroff: Use devm_register_sys_off_handler(POWER_OFF)
Date: Thu, 1 Feb 2024 12:01:02 -0600
Message-ID: <20240201180102.70395-19-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240201180102.70395-1-afd@ti.com>
References: <20240201180102.70395-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_100128_038194_75118E5C 
X-CRM114-Status: GOOD (  16.09  )
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
 drivers/power/reset/syscon-poweroff.c | 34 ++++++++++++---------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/drivers/power/reset/syscon-poweroff.c b/drivers/power/reset/syscon-poweroff.c
index 4899a019256e8..203936f4c544f 100644
--- a/drivers/power/reset/syscon-poweroff.c
+++ b/drivers/power/reset/syscon-poweroff.c
@@ -13,6 +13,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 
 struct syscon_poweroff_data {
@@ -22,23 +23,30 @@ struct syscon_poweroff_data {
 	u32 mask;
 };
 
-static struct syscon_poweroff_data *data;
-
-static void syscon_poweroff(void)
+static int syscon_poweroff(struct sys_off_data *off_data)
 {
+	struct syscon_poweroff_data *data = off_data->cb_data;
+
 	/* Issue the poweroff */
 	regmap_update_bits(data->map, data->offset, data->mask, data->value);
 
 	mdelay(1000);
 
 	pr_emerg("Unable to poweroff system\n");
+
+	return NOTIFY_DONE;
 }
 
 static int syscon_poweroff_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct syscon_poweroff_data *data;
 	int mask_err, value_err;
 
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
 	data->map = syscon_regmap_lookup_by_phandle(dev->of_node, "regmap");
 	if (IS_ERR(data->map)) {
 		data->map = syscon_node_to_regmap(dev->parent->of_node);
@@ -69,21 +77,10 @@ static int syscon_poweroff_probe(struct platform_device *pdev)
 		data->mask = 0xFFFFFFFF;
 	}
 
-	if (pm_power_off) {
-		dev_err(dev, "pm_power_off already claimed for %ps",
-			pm_power_off);
-		return -EBUSY;
-	}
-
-	pm_power_off = syscon_poweroff;
-
-	return 0;
-}
-
-static void syscon_poweroff_remove(struct platform_device *pdev)
-{
-	if (pm_power_off == syscon_poweroff)
-		pm_power_off = NULL;
+	return devm_register_sys_off_handler(&pdev->dev,
+					     SYS_OFF_MODE_POWER_OFF,
+					     SYS_OFF_PRIO_DEFAULT,
+					     syscon_poweroff, data);
 }
 
 static const struct of_device_id syscon_poweroff_of_match[] = {
@@ -93,7 +90,6 @@ static const struct of_device_id syscon_poweroff_of_match[] = {
 
 static struct platform_driver syscon_poweroff_driver = {
 	.probe = syscon_poweroff_probe,
-	.remove_new = syscon_poweroff_remove,
 	.driver = {
 		.name = "syscon-poweroff",
 		.of_match_table = syscon_poweroff_of_match,
-- 
2.39.2


