Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33936C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Mar 2022 07:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lb9hyvpHBdigkh0QP6GuZlhQ6Mk4lhmmQvcVy0YUwa8=; b=DOssuMsOZ4ASTj
	HL/znsNPI5GOrf2XLvUXFc8BAWW+J1MJtemwwqKtuJzkMyOKMwmR/OtKO0oWl0dzw9e6N7ijPvjf+
	D+RMUXefkx3Jj1O0lS+1rTU64Sd9mCdVXPtNPeaIUvJJV9uViTaePBAVy0EireiWGnjyhQzCG997q
	VB0g7glEXLcanGEEJ7bgtgU90CgoPVRQ7+QJOFasOYG/FNkC0HEDtAwiL6huIU+HOQQOszhJkJy+J
	QruKiwCr78M2Dn2o16QIVgdiCb9qWTpRu6gh4e/5Um1i9zhdLmGsnbZ2m5koGtn1j+RYVybGPiixS
	0R02C7Jjvk2FrvknAAFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZpi3-001AU5-GE; Thu, 31 Mar 2022 07:59:11 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZphL-001AGF-Jn; Thu, 31 Mar 2022 07:58:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 1BF7E1F463B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648713503;
 bh=QT8DT8RDSeHHXsqt2NV3aXetUMwY0wHmreLUWytxClw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XM6SE5kIFXvC2H6dUFPE2T69kpIzSAljRHXvK2edJsxdO6VQ5J8jg2lFDTc+u0Lj8
 CU/8d+xPaP1jeujGYypKNZndtRBzwntKcPxMKYA2y92ISObv7ubamGU5nIldeeVVsB
 7SuH1o8MuF1buDq3J+JRvlZ6XfYxjwSz40+kWh7E0tWBV1P/TmZWLAxkXrtIXUZM3S
 9ElylOwFFoeIOPxCEvxUFOXMWK8dfGI+EoncRDE4/5nBAS8wevbw+ERY/GZeZROfQ7
 h/f/GsFexaN2rSCzZn2mntkUJo5ipW75mbUXFn1xrllEBxXFhWsK2ytz48ESLokZ6v
 4VXCbPvhgXHEg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, nfraprado@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 2/3] soc: mediatek: pwrap: Switch to
 devm_platform_ioremap_resource_byname()
Date: Thu, 31 Mar 2022 09:58:16 +0200
Message-Id: <20220331075817.7122-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331075817.7122-1-angelogioacchino.delregno@collabora.com>
References: <20220331075817.7122-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_005827_805784_D05393EC 
X-CRM114-Status: GOOD (  10.96  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In order to simplify ioremapping resources, instead of calling
platform_get_resource_byname() and then devm_ioremap_resource(),
simply call devm_platform_ioremap_resource_byname().

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 54a5300ab72b..852514366f1f 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -2191,7 +2191,6 @@ static int pwrap_probe(struct platform_device *pdev)
 	struct pmic_wrapper *wrp;
 	struct device_node *np = pdev->dev.of_node;
 	const struct of_device_id *of_slave_id = NULL;
-	struct resource *res;
 
 	if (np->child)
 		of_slave_id = of_match_node(of_slave_match_tbl, np->child);
@@ -2211,8 +2210,7 @@ static int pwrap_probe(struct platform_device *pdev)
 	wrp->slave = of_slave_id->data;
 	wrp->dev = &pdev->dev;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "pwrap");
-	wrp->base = devm_ioremap_resource(wrp->dev, res);
+	wrp->base = devm_platform_ioremap_resource_byname(pdev, "pwrap");
 	if (IS_ERR(wrp->base))
 		return PTR_ERR(wrp->base);
 
@@ -2226,9 +2224,7 @@ static int pwrap_probe(struct platform_device *pdev)
 	}
 
 	if (HAS_CAP(wrp->master->caps, PWRAP_CAP_BRIDGE)) {
-		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-				"pwrap-bridge");
-		wrp->bridge_base = devm_ioremap_resource(wrp->dev, res);
+		wrp->bridge_base = devm_platform_ioremap_resource_byname(pdev, "pwrap-bridge");
 		if (IS_ERR(wrp->bridge_base))
 			return PTR_ERR(wrp->bridge_base);
 
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
