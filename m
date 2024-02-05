Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C373C48292
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Feb 2024 19:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WrDlA3MVIblMNMt/x1ENZcDUaj6UX9hq3LACckiD2VI=; b=sq8mnsGZ0DVE6KI6XvfYew994l
	ANKqlDibYbjRHEvGb+RPjfMDfW7f2skgzZVhFD2eXKjYP2fYOZSkn/U1zQFZVkpGkahU4xM3Z7iro
	Ii/t/cbAfKSqP98RHAr93ulRrIegxIfB+5/042V6+N91CJaiLZka+dYyME7iFXkdhtyLSHgOJW7Bj
	tb8QcAEMCk5nGTS5srZdRyQcDoN++SHslZ67iwGkgCxmhPFWaNOblUfHV0p1dw7njr8Q3ixZ9cltc
	Vdlo2Ipgwq4mCQhwSVnb5oPigJWqkjMGFNShHFd8zFNchycsyuK6RDc/QFE3+b8I68uWlKtSnRyoT
	KeXJJuqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX4uS-00000004qne-2Bsm;
	Mon, 05 Feb 2024 19:45:40 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX4tk-00000004q7q-0Osy;
	Mon, 05 Feb 2024 19:44:58 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 415JigZ2101183;
	Mon, 5 Feb 2024 13:44:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707162282;
	bh=WrDlA3MVIblMNMt/x1ENZcDUaj6UX9hq3LACckiD2VI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=I6Ct7cod9fsUB8kCs1mwpqH0/pAWuGaLzBldpsbL8vu/DN8d9j7tGIlqUitfv+yrG
	 O/G0XDX0vGXV6uM9AtNp7SNhzgUcP9Q64jQla20bYBHih+WuQswX1NdG4tXuEBaKD2
	 77oVBxhncT0d17q4/mSNnODnLw18Ebc1urZFLSAI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 415JigNI071017
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 Feb 2024 13:44:42 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 Feb 2024 13:44:42 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 Feb 2024 13:44:42 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 415JicQS028467;
	Mon, 5 Feb 2024 13:44:41 -0600
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
Subject: [PATCH v2 05/19] power: reset: tps65086-restart: Use devm_register_sys_off_handler(RESTART)
Date: Mon, 5 Feb 2024 13:44:23 -0600
Message-ID: <20240205194437.180802-6-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240205194437.180802-1-afd@ti.com>
References: <20240205194437.180802-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_114456_432947_AAC63D51 
X-CRM114-Status: GOOD (  15.53  )
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
 drivers/power/reset/tps65086-restart.c | 35 ++++++--------------------
 1 file changed, 7 insertions(+), 28 deletions(-)

diff --git a/drivers/power/reset/tps65086-restart.c b/drivers/power/reset/tps65086-restart.c
index ee8e9f4b837ea..82d7a761a0385 100644
--- a/drivers/power/reset/tps65086-restart.c
+++ b/drivers/power/reset/tps65086-restart.c
@@ -10,15 +10,12 @@
 #include <linux/reboot.h>
 
 struct tps65086_restart {
-	struct notifier_block handler;
 	struct device *dev;
 };
 
-static int tps65086_restart_notify(struct notifier_block *this,
-				   unsigned long mode, void *cmd)
+static int tps65086_restart_notify(struct sys_off_data *data)
 {
-	struct tps65086_restart *tps65086_restart =
-		container_of(this, struct tps65086_restart, handler);
+	struct tps65086_restart *tps65086_restart = data->cb_data;
 	struct tps65086 *tps65086 = dev_get_drvdata(tps65086_restart->dev->parent);
 	int ret;
 
@@ -46,13 +43,13 @@ static int tps65086_restart_probe(struct platform_device *pdev)
 	if (!tps65086_restart)
 		return -ENOMEM;
 
-	platform_set_drvdata(pdev, tps65086_restart);
-
-	tps65086_restart->handler.notifier_call = tps65086_restart_notify;
-	tps65086_restart->handler.priority = 192;
 	tps65086_restart->dev = &pdev->dev;
 
-	ret = register_restart_handler(&tps65086_restart->handler);
+	ret = devm_register_sys_off_handler(&pdev->dev,
+					    SYS_OFF_MODE_RESTART,
+					    SYS_OFF_PRIO_HIGH,
+					    tps65086_restart_notify,
+					    tps65086_restart);
 	if (ret) {
 		dev_err(&pdev->dev, "%s: cannot register restart handler: %d\n",
 			__func__, ret);
@@ -62,23 +59,6 @@ static int tps65086_restart_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static void tps65086_restart_remove(struct platform_device *pdev)
-{
-	struct tps65086_restart *tps65086_restart = platform_get_drvdata(pdev);
-	int ret;
-
-	ret = unregister_restart_handler(&tps65086_restart->handler);
-	if (ret) {
-		/*
-		 * tps65086_restart_probe() registered the restart handler. So
-		 * unregistering should work fine. Checking the error code
-		 * shouldn't be needed, still doing it for completeness.
-		 */
-		dev_err(&pdev->dev, "%s: cannot unregister restart handler: %d\n",
-			__func__, ret);
-	}
-}
-
 static const struct platform_device_id tps65086_restart_id_table[] = {
 	{ "tps65086-reset", },
 	{ /* sentinel */ }
@@ -90,7 +70,6 @@ static struct platform_driver tps65086_restart_driver = {
 		.name = "tps65086-restart",
 	},
 	.probe = tps65086_restart_probe,
-	.remove_new = tps65086_restart_remove,
 	.id_table = tps65086_restart_id_table,
 };
 module_platform_driver(tps65086_restart_driver);
-- 
2.39.2


