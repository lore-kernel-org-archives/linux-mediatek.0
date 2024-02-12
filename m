Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35EF0C4829C
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Feb 2024 16:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LGLUxvVXiFpOwGVZHJ/g7QXxTLnfINRjy9wvFXeu9qc=; b=JJ3pJJXG7QEO3Xrp/E70q5ZV4u
	L8bxXCI4U1NrNluv+Jf2OIHyMkegy16sxyvZsBuy0Ru2YKqvzy41Xv0CgkCQYtA6M9X2tADLbQTZY
	k6I84uc8/BKHz1e6mXyiQMkQ6NMZEmVdidIItv+0BpvsBVXg5IbFXg1jsu/QZRBDCxBIc+Sd1jhsE
	SCiKdNGScJYLNhUdJoS0F+ZCS5PJ9xTsSJmeb5xswI3VdSEODV1r5BWGYFq8kwMhNu+Hjb1K+Biwe
	eboPFSpy56R9pahkuZr5TvMK1B+7ouZNtU9YHzohX7gOwYKfoNHcH7cALs9mvMPXRqxrryyNSLZ2g
	EF/RzKtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZZBN-000000068gS-2C67;
	Mon, 12 Feb 2024 16:29:25 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZZAl-00000006892-0Ke2;
	Mon, 12 Feb 2024 16:28:49 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41CGSb75068402;
	Mon, 12 Feb 2024 10:28:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707755317;
	bh=LGLUxvVXiFpOwGVZHJ/g7QXxTLnfINRjy9wvFXeu9qc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=RSwCipk5R38DDzp/u55eEnWAxlwX/BD2Q5vkm6IDwXHJ98sKM55hH4dKihPG6wM5H
	 XFAjWPy6fmVyDGWxFNadylLkif2metIsbfwf0GVS23zr0kf0I17t6W5QWQWNlxpwq/
	 XuPnQQN0e2CLcH43flzezGWpsYOKsIP3aTXfqpmw=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41CGSb7U046923
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 Feb 2024 10:28:37 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 12
 Feb 2024 10:28:37 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 12 Feb 2024 10:28:37 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41CGSWR3090688;
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
Subject: [PATCH v4 07/19] power: reset: brcm-kona-reset: Use devm_register_sys_off_handler(RESTART)
Date: Mon, 12 Feb 2024 10:28:19 -0600
Message-ID: <20240212162831.67838-8-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240212162831.67838-1-afd@ti.com>
References: <20240212162831.67838-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_082847_267691_7F8D02DC 
X-CRM114-Status: GOOD (  11.56  )
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
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
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


