Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B72BC48297
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Feb 2024 16:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=awh4L/FvuKTUk4LCovxuQcQcm/YmAlMhgCuKLpIU3pA=; b=2PvqGEdY6wrXhBIeyNtFIa4G3l
	Vvpxx3JcpMmuvRJ0XTGeO5Z9Z7+WWlFrk8o/Zj5tbF2dCGke9rFOYqQjSNnSiWzJFZZiwj3v4sYWO
	2ORu0/o8+YKeIVRY8ibPtCE9Ml9cY8rFmN/1+E0H/IlLdi3ugIphvoXmtEZIQVXK73fN65msUwUIs
	dxp3qqNYaVIK2mjb9TPYhfToFJ+0d6N5D9RfiLmf0VJqLUsMDMlWjCOrEjLwqH0a2m+nJW9NByETm
	KW6gQB4Jiey2Jcb8lX/1msWqS6JUbokl+j46L7gT0r8w1xWZeJSrptxhY16TNR270YBte7MnX4z8A
	oKGKZuDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZZB1-000000068MG-40Ll;
	Mon, 12 Feb 2024 16:29:03 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZZAh-0000000686K-03XT;
	Mon, 12 Feb 2024 16:28:45 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41CGSbjh004152;
	Mon, 12 Feb 2024 10:28:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707755317;
	bh=awh4L/FvuKTUk4LCovxuQcQcm/YmAlMhgCuKLpIU3pA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=KhuSzMZZYFT9Ke/54Lqtd9TYN3hzuoQkiUVlJ2lrixh98IkZwXcgQvD8PZ+sqkVwv
	 XcyRVSoiFslc7QvGR/xbaGtbD+AzPY4tk3fqkoFnijfXcZ1Wrf+MUI4Ut3P3lpee2N
	 lBq15gp2HugbTofud/HgeBujqU7ml9dr56lCv91o=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41CGSb6v024867
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 Feb 2024 10:28:37 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 12
 Feb 2024 10:28:36 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 12 Feb 2024 10:28:36 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41CGSWR2090688;
	Mon, 12 Feb 2024 10:28:36 -0600
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
Subject: [PATCH v4 06/19] power: reset: tps65086-restart: Remove unneeded device data struct
Date: Mon, 12 Feb 2024 10:28:18 -0600
Message-ID: <20240212162831.67838-7-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240212162831.67838-1-afd@ti.com>
References: <20240212162831.67838-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_082843_156358_CD943138 
X-CRM114-Status: GOOD (  11.86  )
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

We only need one member of the struct tps65086_restart, pass that
tps65086_restart_notify() directly. Remove that struct and its
allocation.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/power/reset/tps65086-restart.c | 35 ++++++--------------------
 1 file changed, 8 insertions(+), 27 deletions(-)

diff --git a/drivers/power/reset/tps65086-restart.c b/drivers/power/reset/tps65086-restart.c
index 82d7a761a0385..6976dbcac74fa 100644
--- a/drivers/power/reset/tps65086-restart.c
+++ b/drivers/power/reset/tps65086-restart.c
@@ -9,19 +9,14 @@
 #include <linux/platform_device.h>
 #include <linux/reboot.h>
 
-struct tps65086_restart {
-	struct device *dev;
-};
-
 static int tps65086_restart_notify(struct sys_off_data *data)
 {
-	struct tps65086_restart *tps65086_restart = data->cb_data;
-	struct tps65086 *tps65086 = dev_get_drvdata(tps65086_restart->dev->parent);
+	struct tps65086 *tps65086 = data->cb_data;
 	int ret;
 
 	ret = regmap_write(tps65086->regmap, TPS65086_FORCESHUTDN, 1);
 	if (ret) {
-		dev_err(tps65086_restart->dev, "%s: error writing to tps65086 pmic: %d\n",
+		dev_err(tps65086->dev, "%s: error writing to tps65086 pmic: %d\n",
 			__func__, ret);
 		return NOTIFY_DONE;
 	}
@@ -36,27 +31,13 @@ static int tps65086_restart_notify(struct sys_off_data *data)
 
 static int tps65086_restart_probe(struct platform_device *pdev)
 {
-	struct tps65086_restart *tps65086_restart;
-	int ret;
-
-	tps65086_restart = devm_kzalloc(&pdev->dev, sizeof(*tps65086_restart), GFP_KERNEL);
-	if (!tps65086_restart)
-		return -ENOMEM;
-
-	tps65086_restart->dev = &pdev->dev;
-
-	ret = devm_register_sys_off_handler(&pdev->dev,
-					    SYS_OFF_MODE_RESTART,
-					    SYS_OFF_PRIO_HIGH,
-					    tps65086_restart_notify,
-					    tps65086_restart);
-	if (ret) {
-		dev_err(&pdev->dev, "%s: cannot register restart handler: %d\n",
-			__func__, ret);
-		return -ENODEV;
-	}
+	struct tps65086 *tps65086 = dev_get_drvdata(pdev->dev.parent);
 
-	return 0;
+	return devm_register_sys_off_handler(&pdev->dev,
+					     SYS_OFF_MODE_RESTART,
+					     SYS_OFF_PRIO_HIGH,
+					     tps65086_restart_notify,
+					     tps65086);
 }
 
 static const struct platform_device_id tps65086_restart_id_table[] = {
-- 
2.39.2


