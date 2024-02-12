Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33838C4829B
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Feb 2024 16:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cEd9h6ts7ZA9SmxTtqXrV1X3OAdroJfb+pEHlYKYQq0=; b=QWSjPdKGu/fvnNV5G4WuqQTbW7
	fiJ9yRDUrNVav+utWhHtBQzgHD9b+UPBxyRVGfPvtz5mCYdJsiyjJakhLcydElh4p8Lr/jI244MZG
	x+h+EiJN79/LtNEOBmB8H6HZ7KKMiDXKu4eWtx2+Hr95J6NlpbgR4EArl1q5NF+ZuPDo1OFFUknVO
	nug9gx9MLND7r9Xb0DZXTdSCq7Q7xw15Jj6XOgftSbWXFbZ5n8BJ7O2tVmkrCp4lB6htElvr/n1AJ
	2enqXU0QjyQFa+mFR3RYrmEngwEa/PFb+EyMGXkkLYyHL3IFbv4mDxyDFHWfZJNtpNECbHIZA467O
	eegibpNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZZB6-000000068QC-2UiT;
	Mon, 12 Feb 2024 16:29:08 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZZAi-00000006874-1pIu;
	Mon, 12 Feb 2024 16:28:46 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41CGScF9045203;
	Mon, 12 Feb 2024 10:28:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707755318;
	bh=cEd9h6ts7ZA9SmxTtqXrV1X3OAdroJfb+pEHlYKYQq0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=PapxqZOB6kvuEwvbQTINsi/PPh8EPbOUy0zq8RtM/r/IfVt7ECAH0YZ5visw0xtnN
	 enqKz6wPiYR6JR5RpqoRDDC4mY4lRHTVryfphMygRXdk8Ohgvm1rBE3wO9eT1uTdYF
	 L1sYoPC4a/KddmxWCuGGx21VNjm1hWjKnwQdr81o=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41CGScbp046939
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 Feb 2024 10:28:38 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 12
 Feb 2024 10:28:38 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 12 Feb 2024 10:28:38 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41CGSWR5090688;
	Mon, 12 Feb 2024 10:28:38 -0600
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
Subject: [PATCH v4 09/19] power: reset: rmobile-reset: Use devm_platform_ioremap_resource() helper
Date: Mon, 12 Feb 2024 10:28:21 -0600
Message-ID: <20240212162831.67838-10-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240212162831.67838-1-afd@ti.com>
References: <20240212162831.67838-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_082844_612926_569DC71C 
X-CRM114-Status: GOOD (  11.33  )
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


