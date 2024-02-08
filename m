Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9151BC4828F
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Feb 2024 17:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iOS81LCWivcsA7Ov+uMTe+f7Pr/kqVip8XQZGb4u/UM=; b=aNXJXrGALx8yRw7hNmznlZzzSe
	MUvl7S9E1+KkmJdUtWbQsSO6/oBM7zvHWZtE6TjiF7SgNOz+96oWsb5bnH/eJEz4LlYyRILGpExJq
	xg58Y4tvt0jQnOLsnKfDmSiH+UCxKTyE0tN/nOEigdwfXSSvNXgQnuaJC4MkqnysMNVRkBTgD1dpm
	Cb4kxfqy8lgVb1ZUSW9fvOrPJT6zoZi1Rn89pMutZd+7fPh950V4n75Opf5lEoBeXvzz+SCWfs/MU
	YxccX3YIrjeWe0jXrNnrKU2pIwHXDRtt+3eqWKAEq9GzCnFpaQCrHRutcj/0iT6JVVCDrfi9Bo6tv
	38yo5sUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY7qj-0000000EPBX-3p8V;
	Thu, 08 Feb 2024 17:06:09 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY7p2-0000000EOdR-3VRb;
	Thu, 08 Feb 2024 17:04:32 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 418H4Hmg018151;
	Thu, 8 Feb 2024 11:04:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707411857;
	bh=iOS81LCWivcsA7Ov+uMTe+f7Pr/kqVip8XQZGb4u/UM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=aaDFaUJ5X7dqHsA2u6lxexH79wO6A5iNlyvbvHTVwOQCNNSAzqkUEZZyQjHekwOBi
	 pkAGk3+lK2TALD448I9OWXwcaQzSTELh8IFkg5WdoruDZRD6WwLwYjcv+nnSQ2QJFm
	 wv+6NWoTotqSoJBWhgjbMtEzRZXSKLaBuRJI2wRw=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 418H4HC4042403
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Feb 2024 11:04:17 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Feb 2024 11:04:16 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Feb 2024 11:04:17 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 418H4B69091006;
	Thu, 8 Feb 2024 11:04:16 -0600
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
Subject: [PATCH v3 07/19] power: reset: brcm-kona-reset: Use devm_register_sys_off_handler(RESTART)
Date: Thu, 8 Feb 2024 11:03:58 -0600
Message-ID: <20240208170410.67975-8-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208170410.67975-1-afd@ti.com>
References: <20240208170410.67975-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_090426_687688_5DF7DBCC 
X-CRM114-Status: GOOD (  11.46  )
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

Use device life-cycle managed register function to simplify probe.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/power/reset/brcm-kona-reset.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/power/reset/brcm-kona-reset.c b/drivers/power/reset/brcm-kona-reset.c
index d05728b1db097..ee3f1bb976530 100644
--- a/drivers/power/reset/brcm-kona-reset.c
+++ b/drivers/power/reset/brcm-kona-reset.c
@@ -15,8 +15,7 @@
 
 static void __iomem *kona_reset_base;
 
-static int kona_reset_handler(struct notifier_block *this,
-				unsigned long mode, void *cmd)
+static int kona_reset_handler(struct sys_off_data *data)
 {
 	/*
 	 * A soft reset is triggered by writing a 0 to bit 0 of the soft reset
@@ -31,18 +30,14 @@ static int kona_reset_handler(struct notifier_block *this,
 	return NOTIFY_DONE;
 }
 
-static struct notifier_block kona_reset_nb = {
-	.notifier_call = kona_reset_handler,
-	.priority = 128,
-};
-
 static int kona_reset_probe(struct platform_device *pdev)
 {
 	kona_reset_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(kona_reset_base))
 		return PTR_ERR(kona_reset_base);
 
-	return register_restart_handler(&kona_reset_nb);
+	return devm_register_sys_off_handler(&pdev->dev, SYS_OFF_MODE_RESTART,
+					     128, kona_reset_handler, NULL);
 }
 
 static const struct of_device_id of_match[] = {
-- 
2.39.2


