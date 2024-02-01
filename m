Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA16C48BC4
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Feb 2024 18:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+6oayEskVPsQjbi/C7/hq7hBkB4TpvJeAVLuE/xrEZs=; b=1Vj7AB8a8Z0IRjFcNBBdVya025
	q6zF7If1mrQL3A+zkAdfWDtWtzfXsFAVrlmGRjThBO7fPjQS9UWf4liGurE3WJMdCFxVW/eqrNxUt
	tf1BGB1atAIJx4egAL1nZWotzjjQb9bUExcy4zanE8Uv+jBcFMiTad87xULT8XfT3YmDful7Y9Ndf
	LihsuJNmvibOvqNBROGPNseProWC8gfjEVFYl+gNArRO5+JI83QsMMqAJrsGP9R/OCqJHlwWj8vhe
	wSN8ort+1FKp67QgMuxkg6U4TTnn7Hj8BJq4uxkF6r7xeoZplO1rOaq6vw4I8Y+k0Miazbxwr9ltr
	d9lADi1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVbNx-00000008tyt-1q3d;
	Thu, 01 Feb 2024 18:02:01 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVbNJ-00000008tNY-14xC;
	Thu, 01 Feb 2024 18:01:25 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 411I199X051703;
	Thu, 1 Feb 2024 12:01:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706810469;
	bh=+6oayEskVPsQjbi/C7/hq7hBkB4TpvJeAVLuE/xrEZs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=TkMHSo1BMyKoOIbCWU3HX8M28fj0T0x3o3StVz6DcodkPqNOgrTa8GWGnzto05G1T
	 it5cLq9uOej23dW0hC4TOpK3HF215DWpczQB7yt0qw4HW/KjMOwQpPQ6MXblpItdsC
	 gAMSfCetLVILORJaDa6kR2UokQIXzowQPIEi5RVI=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 411I19DL047540
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Feb 2024 12:01:09 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 Feb 2024 12:01:09 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 Feb 2024 12:01:09 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 411I12Gn117221;
	Thu, 1 Feb 2024 12:01:08 -0600
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
Subject: [PATCH 09/18] power: reset: rmobile-reset: Use devm_register_sys_off_handler(RESTART)
Date: Thu, 1 Feb 2024 12:00:53 -0600
Message-ID: <20240201180102.70395-10-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240201180102.70395-1-afd@ti.com>
References: <20240201180102.70395-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_100121_449284_52F90A33 
X-CRM114-Status: GOOD (  13.39  )
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
 drivers/power/reset/rmobile-reset.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/power/reset/rmobile-reset.c b/drivers/power/reset/rmobile-reset.c
index 29c17ed2d4de9..41e98ff33a3c3 100644
--- a/drivers/power/reset/rmobile-reset.c
+++ b/drivers/power/reset/rmobile-reset.c
@@ -19,12 +19,9 @@
 /* Reset Control Register 2 */
 #define RESCNT2_PRES	0x80000000	/* Soft power-on reset */
 
-static void __iomem *sysc_base2;
-
-static int rmobile_reset_handler(struct notifier_block *this,
-				 unsigned long mode, void *cmd)
+static int rmobile_reset_handler(struct sys_off_data *data)
 {
-	pr_debug("%s %lu\n", __func__, mode);
+	void __iomem *sysc_base2 = data->cb_data;
 
 	/* Let's assume we have acquired the HPB semaphore */
 	writel(RESCNT2_PRES, sysc_base2 + RESCNT2);
@@ -32,20 +29,20 @@ static int rmobile_reset_handler(struct notifier_block *this,
 	return NOTIFY_DONE;
 }
 
-static struct notifier_block rmobile_reset_nb = {
-	.notifier_call = rmobile_reset_handler,
-	.priority = 192,
-};
-
 static int rmobile_reset_probe(struct platform_device *pdev)
 {
+	void __iomem *sysc_base2;
 	int error;
 
 	sysc_base2 = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(sysc_base2))
 		return PTR_ERR(sysc_base2);
 
-	error = register_restart_handler(&rmobile_reset_nb);
+	error = devm_register_sys_off_handler(&pdev->dev,
+					      SYS_OFF_MODE_RESTART,
+					      SYS_OFF_PRIO_HIGH,
+					      rmobile_reset_handler,
+					      sysc_base2);
 	if (error) {
 		dev_err(&pdev->dev,
 			"cannot register restart handler (err=%d)\n", error);
@@ -55,11 +52,6 @@ static int rmobile_reset_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static void rmobile_reset_remove(struct platform_device *pdev)
-{
-	unregister_restart_handler(&rmobile_reset_nb);
-}
-
 static const struct of_device_id rmobile_reset_of_match[] = {
 	{ .compatible = "renesas,sysc-rmobile", },
 	{ /* sentinel */ }
@@ -68,7 +60,6 @@ MODULE_DEVICE_TABLE(of, rmobile_reset_of_match);
 
 static struct platform_driver rmobile_reset_driver = {
 	.probe = rmobile_reset_probe,
-	.remove_new = rmobile_reset_remove,
 	.driver = {
 		.name = "rmobile_reset",
 		.of_match_table = rmobile_reset_of_match,
-- 
2.39.2


