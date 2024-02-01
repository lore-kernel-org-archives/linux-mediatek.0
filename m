Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27EC9C4829B
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Feb 2024 18:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ngOnUmcKUfVk/SqAddQuFt8kMzihNR+9E3bjKI3tkA8=; b=Zk7+JPNb8COUODoZaGxFkKGgjo
	Fqy0lrGYRtTdxjaDjv2VdufnNpxu4Cq1CcrJuez0+xBeYXZUZRcWb7wCphB1sn/sV1uLZcv70/PZK
	X4wPzBAOzOzgLyIO1+YIfw0GUJ/O8L5lU5dfS+JNLzMijMe0TsOoDmBhhycf8KG7M2Ixk4Cwyvksj
	urR+mdwqK095VywmLWo9AKnWNqsgPh9NPCQ+nlHFoMciZKwxeM4btYQPhCv2ceueEnYmbMH9FA+Nf
	FXIMOWKrD8Ia9sJCdHeQbwW3HPigLG43DvW5AOQ2H21sw14nwZxbOn4nme+1s5RV1uNdQ8pC6Ii72
	nAGIKmyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVbNj-00000008tnP-1Xij;
	Thu, 01 Feb 2024 18:01:47 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVbNI-00000008tOo-3Jdr;
	Thu, 01 Feb 2024 18:01:23 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 411I19Yr049608;
	Thu, 1 Feb 2024 12:01:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706810470;
	bh=ngOnUmcKUfVk/SqAddQuFt8kMzihNR+9E3bjKI3tkA8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=wC8nhKc/6Xj7NXCKH5q2UKfbxE5WvY3T9C9I4VEKY3P/I8fabPJdzpFtaEtyqWQtk
	 AXbR8Q7WjCGp+oVKS/cpcuU5P3exGd+CpSMUScfzCUBg2v1Bl4Nj6dJ3Wi17nAor18
	 ZG8YIfrPCcSWImLKRGlX44Jae52pQALGR+2QeSuc=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 411I19j7047547
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Feb 2024 12:01:09 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 Feb 2024 12:01:09 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 Feb 2024 12:01:09 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 411I12Go117221;
	Thu, 1 Feb 2024 12:01:09 -0600
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
Subject: [PATCH 10/18] power: reset: mt6323-poweroff: Use devm_register_sys_off_handler(POWER_OFF)
Date: Thu, 1 Feb 2024 12:00:54 -0600
Message-ID: <20240201180102.70395-11-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240201180102.70395-1-afd@ti.com>
References: <20240201180102.70395-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_100120_946581_F9F3BF1C 
X-CRM114-Status: GOOD (  16.43  )
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
 drivers/power/reset/mt6323-poweroff.c | 28 ++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/power/reset/mt6323-poweroff.c b/drivers/power/reset/mt6323-poweroff.c
index 57a63c0ab7fb7..ca5d11b17ff03 100644
--- a/drivers/power/reset/mt6323-poweroff.c
+++ b/drivers/power/reset/mt6323-poweroff.c
@@ -14,6 +14,7 @@
 #include <linux/platform_device.h>
 #include <linux/mfd/mt6397/core.h>
 #include <linux/mfd/mt6397/rtc.h>
+#include <linux/reboot.h>
 
 struct mt6323_pwrc {
 	struct device *dev;
@@ -21,11 +22,9 @@ struct mt6323_pwrc {
 	u32 base;
 };
 
-static struct mt6323_pwrc *mt_pwrc;
-
-static void mt6323_do_pwroff(void)
+static int mt6323_do_pwroff(struct sys_off_data *data)
 {
-	struct mt6323_pwrc *pwrc = mt_pwrc;
+	struct mt6323_pwrc *pwrc = data->cb_data;
 	unsigned int val;
 	int ret;
 
@@ -44,6 +43,8 @@ static void mt6323_do_pwroff(void)
 	mdelay(1000);
 
 	WARN_ONCE(1, "Unable to power off system\n");
+
+	return NOTIFY_DONE;
 }
 
 static int mt6323_pwrc_probe(struct platform_device *pdev)
@@ -51,6 +52,7 @@ static int mt6323_pwrc_probe(struct platform_device *pdev)
 	struct mt6397_chip *mt6397_chip = dev_get_drvdata(pdev->dev.parent);
 	struct mt6323_pwrc *pwrc;
 	struct resource *res;
+	int ret;
 
 	pwrc = devm_kzalloc(&pdev->dev, sizeof(*pwrc), GFP_KERNEL);
 	if (!pwrc)
@@ -63,19 +65,20 @@ static int mt6323_pwrc_probe(struct platform_device *pdev)
 	pwrc->base = res->start;
 	pwrc->regmap = mt6397_chip->regmap;
 	pwrc->dev = &pdev->dev;
-	mt_pwrc = pwrc;
 
-	pm_power_off = &mt6323_do_pwroff;
+	ret = devm_register_sys_off_handler(pwrc->dev,
+					    SYS_OFF_MODE_POWER_OFF,
+					    SYS_OFF_PRIO_DEFAULT,
+					    mt6323_do_pwroff,
+					    pwrc);
+	if (ret) {
+		dev_err(pwrc->dev, "failed to register power-off handler: %d\n", ret);
+		return ret;
+	}
 
 	return 0;
 }
 
-static void mt6323_pwrc_remove(struct platform_device *pdev)
-{
-	if (pm_power_off == &mt6323_do_pwroff)
-		pm_power_off = NULL;
-}
-
 static const struct of_device_id mt6323_pwrc_dt_match[] = {
 	{ .compatible = "mediatek,mt6323-pwrc" },
 	{},
@@ -84,7 +87,6 @@ MODULE_DEVICE_TABLE(of, mt6323_pwrc_dt_match);
 
 static struct platform_driver mt6323_pwrc_driver = {
 	.probe          = mt6323_pwrc_probe,
-	.remove_new     = mt6323_pwrc_remove,
 	.driver         = {
 		.name   = "mt6323-pwrc",
 		.of_match_table = mt6323_pwrc_dt_match,
-- 
2.39.2


