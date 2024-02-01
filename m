Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D98C48297
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Feb 2024 18:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5a2BDxvry/mDEJhidMjtTRkucrmFZYMP54rfoZVMxFg=; b=SUyJbzKkHULd6x84EgYn5n996F
	oDOKF8jkeIxljNCRzY1CLausjcvU2cxRVsksCGyZAt40nsKBAmNu+7J24t2TVXRBi47KtKxRHFXMC
	tuk7JmV29kR2Fk/qLXheXPd2f+GPB4ROBmNyjLTOb8R6sXcrBsNpIoHaqoJpnIdZKFdb9HziVp69o
	6eVDlJyb/PwDZIHqFyXVYYi6yHDGzccBqt1pQGiVGV0DnWayeC45EsB4LUlV4Di3yZ2UgulfIJu9X
	ZkdFYjquKxvnPXNSIBuFJOxdOHsfVopoiukIeqfD8A61TPD43x0HC8s8pYS2o8n/+k56i3RVir8sj
	hLyjQJ/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVbOc-00000008uZw-173d;
	Thu, 01 Feb 2024 18:02:42 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVbNP-00000008tVC-1C5d;
	Thu, 01 Feb 2024 18:01:30 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 411I1Bdm127784;
	Thu, 1 Feb 2024 12:01:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706810471;
	bh=5a2BDxvry/mDEJhidMjtTRkucrmFZYMP54rfoZVMxFg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=LAT0O6phzzkUn0u9DiUYG23YLkVnG+TYgkm1qnbGo9sMFLwGt67eUqB8AlcsG1llS
	 yVaoHeX+MzXx51esdmGSVer69TG9Dkc6nEIvp9WQDn8I9Ipua4LBephbsEfUNnpJKC
	 f5WBxZGqByyxHtY6vjigb4NrNXXZt0YZwMX0cJG8=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 411I1Bll120465
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Feb 2024 12:01:11 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 Feb 2024 12:01:11 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 Feb 2024 12:01:10 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 411I12Gq117221;
	Thu, 1 Feb 2024 12:01:10 -0600
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
Subject: [PATCH 12/18] power: reset: msm-poweroff: Use devm_register_sys_off_handler(RESTART)
Date: Thu, 1 Feb 2024 12:00:56 -0600
Message-ID: <20240201180102.70395-13-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240201180102.70395-1-afd@ti.com>
References: <20240201180102.70395-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_100127_829541_4B927D82 
X-CRM114-Status: GOOD (  10.04  )
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
 drivers/power/reset/msm-poweroff.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/power/reset/msm-poweroff.c b/drivers/power/reset/msm-poweroff.c
index bcf04491e7022..c5831c46f69e2 100644
--- a/drivers/power/reset/msm-poweroff.c
+++ b/drivers/power/reset/msm-poweroff.c
@@ -13,35 +13,24 @@
 #include <linux/reboot.h>
 #include <linux/pm.h>
 
-static void __iomem *msm_ps_hold;
-static int deassert_pshold(struct notifier_block *nb, unsigned long action,
-			   void *data)
+static int do_msm_poweroff(struct sys_off_data *data)
 {
+	void __iomem *msm_ps_hold = data->cb_data;
+
 	writel(0, msm_ps_hold);
 	mdelay(10000);
 
 	return NOTIFY_DONE;
 }
 
-static struct notifier_block restart_nb = {
-	.notifier_call = deassert_pshold,
-	.priority = 128,
-};
-
-static int do_msm_poweroff(struct sys_off_data *data)
-{
-	deassert_pshold(&restart_nb, 0, NULL);
-
-	return NOTIFY_DONE;
-}
-
 static int msm_restart_probe(struct platform_device *pdev)
 {
-	msm_ps_hold = devm_platform_ioremap_resource(pdev, 0);
+	void __iomem *msm_ps_hold = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(msm_ps_hold))
 		return PTR_ERR(msm_ps_hold);
 
-	register_restart_handler(&restart_nb);
+	devm_register_sys_off_handler(&pdev->dev, SYS_OFF_MODE_RESTART,
+				      128, do_msm_poweroff, msm_ps_hold);
 
 	devm_register_sys_off_handler(&pdev->dev, SYS_OFF_MODE_POWER_OFF,
 				      SYS_OFF_PRIO_DEFAULT, do_msm_poweroff,
-- 
2.39.2


