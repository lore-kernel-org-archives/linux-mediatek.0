Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3792C4828D
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Feb 2024 19:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eDTJGp1LNK+YD1bJfvgjkV/rIr2yWhv+8KTb7j41Dpg=; b=OQkqmkUq+k1y5Pxxl5DdNITwFI
	Xj2rN0WyAdvTJdJl15T34dfYw7zx3hgyhb55ldc8+Uzp0iRrCV8gL4FxWjtbGVaEsb50iD3KbRzk7
	UJd4qE902hFWCkmq6vVTqOEoiVbOl7nnhPSm2oAeXpObMnjh8II+57iQTaeBnM2EZLYG5I69MsaHS
	Q1h+/bOA2I/IzMK8UyYb6pgExfWinvVbp3Ko3+PZLQsk3woHm/W4Zgv7ym8ewWuw4ceu27Yq4mu87
	3JPT+utyRtelt8vcKM7i4A+nzubLPq3EzVsvih6NiiUOIgKKYXzJa45Fbxs4J0ZXpELEEN+Oh7HXr
	V3WE1phA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX4uY-00000004qso-2IIY;
	Mon, 05 Feb 2024 19:45:46 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX4tk-00000004q7Y-0Q7b;
	Mon, 05 Feb 2024 19:44:58 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 415Jie0V101173;
	Mon, 5 Feb 2024 13:44:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707162280;
	bh=eDTJGp1LNK+YD1bJfvgjkV/rIr2yWhv+8KTb7j41Dpg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=KGtXTaIKNpTRCgWBMxGewdtW9tr/I49a7Z6K481Uik1P0I1jmVPDkLL4LC4RmiwSL
	 kbqjMOuV6A/o7E1vPAxfCQOecHNyXihZEC/UzRmE2nGNU1EY8C2LP6+VjYVJsqcqJZ
	 2Z5+sJAJ00dSOv36Teztbx8N5m0qnvRUl1yyo76E=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 415JielY090555
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 Feb 2024 13:44:40 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 Feb 2024 13:44:39 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 Feb 2024 13:44:39 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 415JicQO028467;
	Mon, 5 Feb 2024 13:44:39 -0600
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
Subject: [PATCH v2 01/19] power: reset: atc260x-poweroff: Use devm_register_sys_off_handler(RESTART)
Date: Mon, 5 Feb 2024 13:44:19 -0600
Message-ID: <20240205194437.180802-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240205194437.180802-1-afd@ti.com>
References: <20240205194437.180802-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_114456_436066_9ECECE3A 
X-CRM114-Status: GOOD (  12.31  )
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
 drivers/power/reset/atc260x-poweroff.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/power/reset/atc260x-poweroff.c b/drivers/power/reset/atc260x-poweroff.c
index b4aa50e9685e1..ce2748d3282c3 100644
--- a/drivers/power/reset/atc260x-poweroff.c
+++ b/drivers/power/reset/atc260x-poweroff.c
@@ -16,7 +16,6 @@
 struct atc260x_pwrc {
 	struct device *dev;
 	struct regmap *regmap;
-	struct notifier_block restart_nb;
 	int (*do_poweroff)(const struct atc260x_pwrc *pwrc, bool restart);
 };
 
@@ -172,11 +171,9 @@ static void atc260x_pwrc_pm_handler(void)
 	WARN_ONCE(1, "Unable to power off system\n");
 }
 
-static int atc260x_pwrc_restart_handler(struct notifier_block *nb,
-					unsigned long mode, void *cmd)
+static int atc260x_pwrc_restart_handler(struct sys_off_data *data)
 {
-	struct atc260x_pwrc *pwrc = container_of(nb, struct atc260x_pwrc,
-						 restart_nb);
+	struct atc260x_pwrc *pwrc = data->cb_data;
 	pwrc->do_poweroff(pwrc, true);
 
 	return NOTIFY_DONE;
@@ -194,8 +191,6 @@ static int atc260x_pwrc_probe(struct platform_device *pdev)
 
 	priv->dev = &pdev->dev;
 	priv->regmap = atc260x->regmap;
-	priv->restart_nb.notifier_call = atc260x_pwrc_restart_handler;
-	priv->restart_nb.priority = 192;
 
 	switch (atc260x->ic_type) {
 	case ATC2603C:
@@ -225,7 +220,11 @@ static int atc260x_pwrc_probe(struct platform_device *pdev)
 		dev_warn(priv->dev, "Poweroff callback already assigned\n");
 	}
 
-	ret = register_restart_handler(&priv->restart_nb);
+	ret = devm_register_sys_off_handler(priv->dev,
+					    SYS_OFF_MODE_RESTART,
+					    SYS_OFF_PRIO_HIGH,
+					    atc260x_pwrc_restart_handler,
+					    priv);
 	if (ret)
 		dev_err(priv->dev, "failed to register restart handler: %d\n",
 			ret);
@@ -241,8 +240,6 @@ static void atc260x_pwrc_remove(struct platform_device *pdev)
 		pm_power_off = NULL;
 		atc260x_pwrc_data = NULL;
 	}
-
-	unregister_restart_handler(&priv->restart_nb);
 }
 
 static struct platform_driver atc260x_pwrc_driver = {
-- 
2.39.2


