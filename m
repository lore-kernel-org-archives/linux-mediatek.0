Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 320EFC4828F
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Feb 2024 17:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cEd9h6ts7ZA9SmxTtqXrV1X3OAdroJfb+pEHlYKYQq0=; b=QDX2qj5iHrAlco1N7oohUBQldz
	ZUXcs69xCgMyJuy7kcKMKmogs5MohCpAkVp1ZDXUT60U9G+SSnOjr9KKHOGs3lG5E/gsvzcDXGAxT
	YZncmT5M5SrY2kHB7m2zfuSphQ6RQn1jQGsMQoVbs8oxMpXVBf2f2THIFWRPcfVrZUxy+Fw+jgLca
	Bz8mbgPhSIB5KI9+PLZubVDc/nBzpzu4qlXtFyGq7/TAx4b1XziLDN9V4bXOfAkUPrInUe89Kj3da
	6BgxQE1FoSYSiKZMFwJYAdCnfC1gutZOTM1UlUnS8KOYtT8tQbPg6bgJRu8EQbuL3CsX6LLCD0vY9
	7RiFo7Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY7qP-0000000EP1o-2BKM;
	Thu, 08 Feb 2024 17:05:49 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY7p2-0000000EOdV-3W6W;
	Thu, 08 Feb 2024 17:04:27 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 418H4Iqe018156;
	Thu, 8 Feb 2024 11:04:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707411858;
	bh=cEd9h6ts7ZA9SmxTtqXrV1X3OAdroJfb+pEHlYKYQq0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=fiop7LMw7ffBSbbCssLAJojFB0aFGS+AO1EE2WSOkNsqY81lfdFJP/XnCbJYce+ws
	 Ona5r0f37PR4xu4kwARLKAo+t7Jbrq/m0okEVguRpw0UcwXk7UE4/wjncjZ6t578Mb
	 8T5jFSlJE7HW/OHLMOBLcTfb5YMWgWDX2CZhm3SA=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 418H4IKM023356
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Feb 2024 11:04:18 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Feb 2024 11:04:18 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Feb 2024 11:04:18 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 418H4B6B091006;
	Thu, 8 Feb 2024 11:04:17 -0600
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
Subject: [PATCH v3 09/19] power: reset: rmobile-reset: Use devm_platform_ioremap_resource() helper
Date: Thu, 8 Feb 2024 11:04:00 -0600
Message-ID: <20240208170410.67975-10-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208170410.67975-1-afd@ti.com>
References: <20240208170410.67975-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_090426_574642_DB472CB5 
X-CRM114-Status: GOOD (  11.30  )
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

Use device life-cycle managed ioremap function to simplify probe and
exit paths.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/power/reset/rmobile-reset.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/power/reset/rmobile-reset.c b/drivers/power/reset/rmobile-reset.c
index 5df9b41c68c79..29c17ed2d4de9 100644
--- a/drivers/power/reset/rmobile-reset.c
+++ b/drivers/power/reset/rmobile-reset.c
@@ -41,28 +41,23 @@ static int rmobile_reset_probe(struct platform_device *pdev)
 {
 	int error;
 
-	sysc_base2 = of_iomap(pdev->dev.of_node, 1);
-	if (!sysc_base2)
-		return -ENODEV;
+	sysc_base2 = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(sysc_base2))
+		return PTR_ERR(sysc_base2);
 
 	error = register_restart_handler(&rmobile_reset_nb);
 	if (error) {
 		dev_err(&pdev->dev,
 			"cannot register restart handler (err=%d)\n", error);
-		goto fail_unmap;
+		return error;
 	}
 
 	return 0;
-
-fail_unmap:
-	iounmap(sysc_base2);
-	return error;
 }
 
 static void rmobile_reset_remove(struct platform_device *pdev)
 {
 	unregister_restart_handler(&rmobile_reset_nb);
-	iounmap(sysc_base2);
 }
 
 static const struct of_device_id rmobile_reset_of_match[] = {
-- 
2.39.2


