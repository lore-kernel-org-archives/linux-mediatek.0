Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22ADCC4829E
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Feb 2024 18:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b1ggeAlqOeW6cDM2I0g1Lrz7ya2O6mo0S8OfUg915BU=; b=dGNIUr68Ja6GiRSWVGQOMJKFc7
	KF/nJDpOD+TBTm5gPYt6PH+4rPCAzHg4zLxvVTOG5DbveYhXEvFFiQJwslxdplgAF3eHsnvdQtwU+
	a6iLCvjQMgRDCT/7SEYbjhn1SCdeYUGZsvzlFsOkA1X/HBETbw03C36vcvzE8PGgrHlZXdcaB1odF
	X/C2HQsqVoYh1ePQffJG/qYc9F5cxL3xt+AkCl61v1b85P/YsV2DhZQmbQYfe9f9LMsOmbZaxhZeZ
	mCIajacllmom9U9HsBjhITfRnIykgStj6w2iWDjZdiT6IZi/bVX381QdedxKlymn5eTVNoAdsA9DO
	4AzhLHWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVbNk-00000008tny-0kux;
	Thu, 01 Feb 2024 18:01:48 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVbNI-00000008tOs-3gxN;
	Thu, 01 Feb 2024 18:01:23 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 411I17wO049584;
	Thu, 1 Feb 2024 12:01:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706810467;
	bh=b1ggeAlqOeW6cDM2I0g1Lrz7ya2O6mo0S8OfUg915BU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=BhjY8BIDCh34TqTsuxsNCp59BD1rh4Iiu3NvrhnJGpkouoZ0xzRgSAoNY4vAPZdPZ
	 gs+ymMss+pkmQL/x6MLDYhVTdPO2FLT5r0jJqXPVt4NO3l0ep76M+kHielPchllER4
	 fMTgVca4uiNbwX7Om2ggWGKxfTBw0mKtGGw4C28g=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 411I17n2029189
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Feb 2024 12:01:07 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 Feb 2024 12:01:07 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 Feb 2024 12:01:07 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 411I12Gk117221;
	Thu, 1 Feb 2024 12:01:06 -0600
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
Subject: [PATCH 06/18] power: reset: brcm-kona-reset: Use devm_register_sys_off_handler(RESTART)
Date: Thu, 1 Feb 2024 12:00:50 -0600
Message-ID: <20240201180102.70395-7-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240201180102.70395-1-afd@ti.com>
References: <20240201180102.70395-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_100121_064676_4648074C 
X-CRM114-Status: GOOD (  12.20  )
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
 drivers/power/reset/brcm-kona-reset.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/power/reset/brcm-kona-reset.c b/drivers/power/reset/brcm-kona-reset.c
index d05728b1db097..4bb956c8f24f8 100644
--- a/drivers/power/reset/brcm-kona-reset.c
+++ b/drivers/power/reset/brcm-kona-reset.c
@@ -13,11 +13,10 @@
 #define RSTMGR_WR_PASSWORD_SHIFT	8
 #define RSTMGR_WR_ACCESS_ENABLE		1
 
-static void __iomem *kona_reset_base;
-
-static int kona_reset_handler(struct notifier_block *this,
-				unsigned long mode, void *cmd)
+static int kona_reset_handler(struct sys_off_data *data)
 {
+	void __iomem *kona_reset_base = data->cb_data;
+
 	/*
 	 * A soft reset is triggered by writing a 0 to bit 0 of the soft reset
 	 * register. To write to that register we must first write the password
@@ -31,18 +30,17 @@ static int kona_reset_handler(struct notifier_block *this,
 	return NOTIFY_DONE;
 }
 
-static struct notifier_block kona_reset_nb = {
-	.notifier_call = kona_reset_handler,
-	.priority = 128,
-};
-
 static int kona_reset_probe(struct platform_device *pdev)
 {
+	void __iomem *kona_reset_base;
+
 	kona_reset_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(kona_reset_base))
 		return PTR_ERR(kona_reset_base);
 
-	return register_restart_handler(&kona_reset_nb);
+	return devm_register_sys_off_handler(&pdev->dev, SYS_OFF_MODE_RESTART,
+					     128, kona_reset_handler,
+					     kona_reset_base);
 }
 
 static const struct of_device_id of_match[] = {
-- 
2.39.2


