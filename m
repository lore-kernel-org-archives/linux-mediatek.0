Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F6A9C4828D
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Feb 2024 19:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5a2BDxvry/mDEJhidMjtTRkucrmFZYMP54rfoZVMxFg=; b=0bwneEHP+IPM5Q7NxJ488JDmPY
	VTm18vRX0s7l//5EfHyBY30rzaeALYwtK/wkv+Eoy0okGWLjTRfSIeVIC0YhW3WGzG5pn+gDfMv7q
	6aoUX7W/bM3x/5cpf4UvgCNl0maYBl/2X7nJXdkj1zhcDfBFzYVwmMsTrfV99p+cDZ50uuS27STuQ
	c9YVKV3pALMe3arC+ImpecSQ2aHiD5GXNfmkcECYhHbfULn/qazYU927eG+oWfNCzshp0+nc12IH3
	LubmswfOmzySqj0fusM6FJkDUIr2/loPG0FbGiciJv2BZUMkLGUM5xi86XeSfNMU5Jw4shGwbXWCk
	ns0Q5RTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX4v1-00000004rFI-0qrN;
	Mon, 05 Feb 2024 19:46:15 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX4tm-00000004qBJ-2WFn;
	Mon, 05 Feb 2024 19:45:00 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 415JilnK101200;
	Mon, 5 Feb 2024 13:44:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707162287;
	bh=5a2BDxvry/mDEJhidMjtTRkucrmFZYMP54rfoZVMxFg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Qw5q5B3keTde63yHWlZpQ7EVk4tQF9AphT2TKbB0uVKzxcP46i9J1hxwiPkvnhfU6
	 yx3v/eLF1zvt5mKdeJM+rw+fQHl9Lon2LkZyUxz6YoDK+bNLBBZrYfXipnLDENW0Ig
	 9naCSq3dVPMP2uMY58c+MhSsfrUKANATzLTuHB0w=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 415JilEK073197
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 Feb 2024 13:44:47 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 Feb 2024 13:44:47 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 Feb 2024 13:44:47 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 415JicQa028467;
	Mon, 5 Feb 2024 13:44:46 -0600
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
Subject: [PATCH v2 13/19] power: reset: msm-poweroff: Use devm_register_sys_off_handler(RESTART)
Date: Mon, 5 Feb 2024 13:44:31 -0600
Message-ID: <20240205194437.180802-14-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240205194437.180802-1-afd@ti.com>
References: <20240205194437.180802-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_114458_953464_BBF9F080 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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


