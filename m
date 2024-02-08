Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B725C48260
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Feb 2024 17:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MeE+f3axegAXGv9AlMEePhEt4yt01moBec9QtZ5EkhI=; b=nz7hYhflxiti0qfT0ZadwM4q52
	jIVxCMJW1CUBnqR9e+OOOrak/7lyKlQg6uku7lapJXQCmSngUajr15Su4QZF356AcnDlQHZuOu3dR
	4y/fi8+oufTF47083u75qUsN1tBkF15VgbzHKgUoPRKL1NoJrv5qHqwOMGZ4C0yo99JhfstoTxVlo
	kEMNX1u/J6EzFWzk9S+TEE/5zJIkakyZeiYwEbvaAsWXAJe7yonEIPDtzSp3/nn2AKfpPPUXLxURT
	xyKKJvWY/KWVSnc5IVRAYpW8z1RVAHWCQaQjzvG9xh5L0I4LO9fYMKGiXJw4nDel77S6OzlI2B/wS
	qyBcc6Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY7tT-0000000EQVK-2vVg;
	Thu, 08 Feb 2024 17:08:59 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY7pE-0000000EOiX-1ML6;
	Thu, 08 Feb 2024 17:04:37 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 418H4Pki004982;
	Thu, 8 Feb 2024 11:04:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707411865;
	bh=MeE+f3axegAXGv9AlMEePhEt4yt01moBec9QtZ5EkhI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=DFuhy6dflnTf+UjeWx8yI7a/sW5DIr9cLsKU1BaqzpHDhkjA6wc8HK+LWwNcLBCAA
	 ZoPWVcawohUwdJDl/SoffeaAP/nXBcmWPtEb1qda/4tmc5fVZhuABwElmFoww1TQKf
	 72skFySYelSDo9drSgXwCbxsPIU3tuFgtBRmllFk=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 418H4PcI023458
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Feb 2024 11:04:25 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Feb 2024 11:04:24 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Feb 2024 11:04:24 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 418H4B6L091006;
	Thu, 8 Feb 2024 11:04:24 -0600
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
Subject: [PATCH v3 19/19] power: reset: syscon-poweroff: Use devm_register_sys_off_handler(POWER_OFF)
Date: Thu, 8 Feb 2024 11:04:10 -0600
Message-ID: <20240208170410.67975-20-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208170410.67975-1-afd@ti.com>
References: <20240208170410.67975-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_090436_629178_7233A575 
X-CRM114-Status: GOOD (  15.94  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


