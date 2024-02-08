Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5AEC48260
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Feb 2024 17:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DM5F+CDTYAkATD9JuxoEYM5J5TLXMlR0cMppKdmlkcg=; b=TrVCJaGgrP/XMTjwWUOrsugkmm
	hSt7XeYzroy3pA3gV88mmtqoP0YK10vNdvOYASGPlR7XnuTVKjP+wM4eG/vUAXDSEjQu5Bh+8P0Wz
	Az0iG/RtGKAEbOPzxp8LHsnXaT8v8ilAuet0u2eblggIfknWLwTFUpgd5j8lqFBrXr8paZptcAwO3
	ihhRkPrGyBY50f5eLUhDMNHpkmCBJEBhUuE2WzeJJmdbSNyZawQW32ddwrhK0UebCMJT+AK32Sjvv
	Ouo9+DQGS5ikURzsnBX9oD52GjOcx9mbqIccjs6qOiZdoUGJ4vt4psjmPXeO90Znz40VrBYU+CXkq
	YGQSJ80w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY7sK-0000000EPp6-1rKG;
	Thu, 08 Feb 2024 17:07:48 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY7p1-0000000EOco-23PN;
	Thu, 08 Feb 2024 17:04:34 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 418H4ELp051751;
	Thu, 8 Feb 2024 11:04:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707411854;
	bh=DM5F+CDTYAkATD9JuxoEYM5J5TLXMlR0cMppKdmlkcg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=GUXPeyO+bMgIyzoRA4DNuzMmb2GvYNBZkAtVpx9T6Eo5ZhXpQt3jT8JkCdjdrVojD
	 BjMsS5vMKERPMJPrP4XyhT9J4xg8LaZtxFmzYMc9xVg3ZM1bl+/++udSoVVXYqrinI
	 Q1ApFsATvr3VJzKuaqd3wQMjOeisG0EVNXXyoCTs=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 418H4ErV042386
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Feb 2024 11:04:14 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Feb 2024 11:04:14 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Feb 2024 11:04:14 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 418H4B65091006;
	Thu, 8 Feb 2024 11:04:13 -0600
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
Subject: [PATCH v3 03/19] power: reset: xgene-reboot: Use devm_platform_ioremap_resource() helper
Date: Thu, 8 Feb 2024 11:03:54 -0600
Message-ID: <20240208170410.67975-4-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208170410.67975-1-afd@ti.com>
References: <20240208170410.67975-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_090426_721615_E45E6C30 
X-CRM114-Status: GOOD (  11.74  )
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

While here add __iomem to the returned pointer to fix a sparse warning.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/power/reset/xgene-reboot.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/power/reset/xgene-reboot.c b/drivers/power/reset/xgene-reboot.c
index c2e5a99940d37..6b545a83d8889 100644
--- a/drivers/power/reset/xgene-reboot.c
+++ b/drivers/power/reset/xgene-reboot.c
@@ -22,7 +22,7 @@
 
 struct xgene_reboot_context {
 	struct device *dev;
-	void *csr;
+	void __iomem *csr;
 	u32 mask;
 	struct notifier_block restart_handler;
 };
@@ -54,7 +54,7 @@ static int xgene_reboot_probe(struct platform_device *pdev)
 	if (!ctx)
 		return -ENOMEM;
 
-	ctx->csr = of_iomap(dev->of_node, 0);
+	ctx->csr = devm_platform_ioremap_resource(pdev, 0);
 	if (!ctx->csr) {
 		dev_err(dev, "can not map resource\n");
 		return -ENODEV;
@@ -67,10 +67,8 @@ static int xgene_reboot_probe(struct platform_device *pdev)
 	ctx->restart_handler.notifier_call = xgene_restart_handler;
 	ctx->restart_handler.priority = 128;
 	err = register_restart_handler(&ctx->restart_handler);
-	if (err) {
-		iounmap(ctx->csr);
+	if (err)
 		dev_err(dev, "cannot register restart handler (err=%d)\n", err);
-	}
 
 	return err;
 }
-- 
2.39.2


