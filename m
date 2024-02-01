Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D63E0C48BF5
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Feb 2024 18:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=COOyqqru2hxz+S/Tw5V0x98XNKrZiamgLSe8wHDYh14=; b=Mh5ywsDMnwaCE/9LLm7SEhZNmi
	k4y+S36DOxRtJkDQ2pxtOMtY8XNee/8OupxBHliGQrTySzWKDGmrnywqviIpMglrxCQ37XdC1Rs1V
	iomOynVTgqznxtdVl3xVnaeYXh4l97AQVNhwOLOuoWr+fG1zEILgwh+GXm0mXY7tEoYonbQe0OxGK
	FUBJzvYHSAfAmthFC8chxepO6U4jZepnHlKekUs9/JyrpY1gKdTp9T3V9f2Zelo3Ktr9RWZYdSuH7
	sXmqvjLupQuFB/IOGXFvjqj0RJ+7lHA41a2dXqtuDvxl/Qy/lBAeQkk3CWspifRRXlAAxyyBE7JNx
	9ZHfI7Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVbOU-00000008uST-1LPU;
	Thu, 01 Feb 2024 18:02:34 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVbNO-00000008tSf-0RWc;
	Thu, 01 Feb 2024 18:01:30 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 411I15Ww127741;
	Thu, 1 Feb 2024 12:01:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706810465;
	bh=COOyqqru2hxz+S/Tw5V0x98XNKrZiamgLSe8wHDYh14=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ZUTao+ON9CWb0zgC3QleK6FgjoBGaePcjIH1rqYG741ILwUOVJ5EPuu1x7fRDozW/
	 KhssLyZRFRkz13rNM4UuQXysuBo7g2w11hWdsMcXYClMGnNT0NipIfMZb9m6AteHwX
	 AgYM+Q18l6fGcV0NnJi889mkmA7JSH1MPJe2wSok=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 411I151w120338
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Feb 2024 12:01:05 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 Feb 2024 12:01:05 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 Feb 2024 12:01:05 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 411I12Gh117221;
	Thu, 1 Feb 2024 12:01:04 -0600
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
Subject: [PATCH 03/18] power: reset: xgene-reboot: Use devm_register_sys_off_handler(RESTART)
Date: Thu, 1 Feb 2024 12:00:47 -0600
Message-ID: <20240201180102.70395-4-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240201180102.70395-1-afd@ti.com>
References: <20240201180102.70395-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_100126_525770_D5FA31D2 
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

Use device life-cycle managed register function to simplify probe.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/power/reset/xgene-reboot.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/power/reset/xgene-reboot.c b/drivers/power/reset/xgene-reboot.c
index c2e5a99940d37..5c923ab838a55 100644
--- a/drivers/power/reset/xgene-reboot.c
+++ b/drivers/power/reset/xgene-reboot.c
@@ -24,15 +24,11 @@ struct xgene_reboot_context {
 	struct device *dev;
 	void *csr;
 	u32 mask;
-	struct notifier_block restart_handler;
 };
 
-static int xgene_restart_handler(struct notifier_block *this,
-				 unsigned long mode, void *cmd)
+static int xgene_restart_handler(struct sys_off_data *data)
 {
-	struct xgene_reboot_context *ctx =
-		container_of(this, struct xgene_reboot_context,
-			     restart_handler);
+	struct xgene_reboot_context *ctx = data->cb_data;
 
 	/* Issue the reboot */
 	writel(ctx->mask, ctx->csr);
@@ -64,9 +60,8 @@ static int xgene_reboot_probe(struct platform_device *pdev)
 		ctx->mask = 0xFFFFFFFF;
 
 	ctx->dev = dev;
-	ctx->restart_handler.notifier_call = xgene_restart_handler;
-	ctx->restart_handler.priority = 128;
-	err = register_restart_handler(&ctx->restart_handler);
+	err = devm_register_sys_off_handler(dev, SYS_OFF_MODE_RESTART, 128,
+					    xgene_restart_handler, ctx);
 	if (err) {
 		iounmap(ctx->csr);
 		dev_err(dev, "cannot register restart handler (err=%d)\n", err);
-- 
2.39.2


