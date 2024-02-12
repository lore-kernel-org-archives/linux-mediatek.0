Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2525C4829C
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Feb 2024 16:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2cm9ruqVmpJKRpRfi1ywbymPKB5JK0jfSdZffEo1IXY=; b=Kwo+mImxTYI1spakqBAk6wmypt
	3OsKF+HojRoECAxaJcXxCre9UFPFt/xe7xPsjpKujZ+1dAwmu1mF/IzXXct+Gd8jcXlnM5WuuDWno
	A2NP250qTINrGEQogwyR1J/dWkQKJ+Rmkk+a7PrjknklChThTSpAbLdXVTj95Fymxvhb7ESQnqFTC
	dT3ZXy1xAIuqLyUwo3kfJXZeOS0XaJFb8YXCTnX1qI6fSkMJ+1OgqiRcB1dHSUAXDtvMEIUrSnJlD
	ozntVwq2IMxeuMTOV6XEWuVr0EnfA3m2NCHZkHd+Em9133rdObGb6C5GBk5icL3LWKUZmwP6s+P2Q
	dHnumcKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZZB2-000000068Ma-1b2a;
	Mon, 12 Feb 2024 16:29:04 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZZAf-00000006859-479E;
	Mon, 12 Feb 2024 16:28:44 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41CGSYv2004138;
	Mon, 12 Feb 2024 10:28:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707755314;
	bh=2cm9ruqVmpJKRpRfi1ywbymPKB5JK0jfSdZffEo1IXY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=c6jSXBVHtvnTWWCo724wItjQ8Y/gpXn7j/EbWFtPX6MrjgYdu5WCu/Xdoeed1Op19
	 qpbgtQDbVdnGysO2Sx9iNyZK4A1BhgWsaAuFYzTqJd11SCYrEUjah/QDaUKZSCfoC2
	 dkFIBQ6MKAh+Tf0M72HhnFNr2C9cLjx+1Zo/DLyU=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41CGSY2g024836
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 Feb 2024 10:28:34 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 12
 Feb 2024 10:28:34 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 12 Feb 2024 10:28:34 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41CGSWQw090688;
	Mon, 12 Feb 2024 10:28:33 -0600
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
Subject: [PATCH v4 02/19] power: reset: atc260x-poweroff: Use devm_register_sys_off_handler(POWER_OFF)
Date: Mon, 12 Feb 2024 10:28:14 -0600
Message-ID: <20240212162831.67838-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240212162831.67838-1-afd@ti.com>
References: <20240212162831.67838-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_082842_207219_6C11DEE7 
X-CRM114-Status: GOOD (  14.39  )
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
 drivers/power/reset/atc260x-poweroff.c | 38 ++++++++++----------------
 1 file changed, 14 insertions(+), 24 deletions(-)

diff --git a/drivers/power/reset/atc260x-poweroff.c b/drivers/power/reset/atc260x-poweroff.c
index ce2748d3282c3..e3e4621ccb1dd 100644
--- a/drivers/power/reset/atc260x-poweroff.c
+++ b/drivers/power/reset/atc260x-poweroff.c
@@ -19,9 +19,6 @@ struct atc260x_pwrc {
 	int (*do_poweroff)(const struct atc260x_pwrc *pwrc, bool restart);
 };
 
-/* Global variable needed only for pm_power_off */
-static struct atc260x_pwrc *atc260x_pwrc_data;
-
 static int atc2603c_do_poweroff(const struct atc260x_pwrc *pwrc, bool restart)
 {
 	int ret, deep_sleep = 0;
@@ -164,11 +161,15 @@ static int atc2609a_init(const struct atc260x_pwrc *pwrc)
 	return ret;
 }
 
-static void atc260x_pwrc_pm_handler(void)
+static int atc260x_pwrc_pm_handler(struct sys_off_data *data)
 {
-	atc260x_pwrc_data->do_poweroff(atc260x_pwrc_data, false);
+	struct atc260x_pwrc *pwrc = data->cb_data;
+
+	pwrc->do_poweroff(pwrc, false);
 
 	WARN_ONCE(1, "Unable to power off system\n");
+
+	return NOTIFY_DONE;
 }
 
 static int atc260x_pwrc_restart_handler(struct sys_off_data *data)
@@ -211,14 +212,14 @@ static int atc260x_pwrc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	platform_set_drvdata(pdev, priv);
-
-	if (!pm_power_off) {
-		atc260x_pwrc_data = priv;
-		pm_power_off = atc260x_pwrc_pm_handler;
-	} else {
-		dev_warn(priv->dev, "Poweroff callback already assigned\n");
-	}
+	ret = devm_register_sys_off_handler(priv->dev,
+					    SYS_OFF_MODE_POWER_OFF,
+					    SYS_OFF_PRIO_DEFAULT,
+					    atc260x_pwrc_pm_handler,
+					    priv);
+	if (ret)
+		dev_err(priv->dev, "failed to register power-off handler: %d\n",
+			ret);
 
 	ret = devm_register_sys_off_handler(priv->dev,
 					    SYS_OFF_MODE_RESTART,
@@ -232,19 +233,8 @@ static int atc260x_pwrc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static void atc260x_pwrc_remove(struct platform_device *pdev)
-{
-	struct atc260x_pwrc *priv = platform_get_drvdata(pdev);
-
-	if (atc260x_pwrc_data == priv) {
-		pm_power_off = NULL;
-		atc260x_pwrc_data = NULL;
-	}
-}
-
 static struct platform_driver atc260x_pwrc_driver = {
 	.probe = atc260x_pwrc_probe,
-	.remove_new = atc260x_pwrc_remove,
 	.driver = {
 		.name = "atc260x-pwrc",
 	},
-- 
2.39.2


