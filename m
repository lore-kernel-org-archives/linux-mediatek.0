Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A48BC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 12:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OfnYf6yHic9mEWKxIT6VmEPe13W61CK9M45GBto9wTI=; b=1VzghoFbyASlsrCd6hRRbs8/NX
	wJkcA2z0KgoTK1cplVBFqmRYHl3n8tkfM2tT0KaOq6Of+jf1Dy2Rzlha1IgKHtVmj7t8FnLHeW56x
	bq2z3dLaw1km9E5bM8tNNpMR7f5WCWoPHTlAFKYuQAkcs4UHPQ1CEtU+OxSYU9qFAN+rNWMs2pceI
	qcqSk0xf7pIiVmRZxbTu+C5hr8QHMeHJYobeqlLJWRy9wJTCu5gZT1ufdMIuK64AVxx7zUwoISyUt
	5mMwQg3C5BbvwjegzgPUPVJeTleT6lZH8i8O1tzr6W47Hf3PHrpRizFg8Le1Er0VKi4mEXPIVt8ya
	j4CToCWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Lor-00Eydx-DU; Thu, 23 Jun 2022 12:20:21 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Llo-00ExGZ-5f; Thu, 23 Jun 2022 12:17:15 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 22D4C6601796;
	Thu, 23 Jun 2022 13:17:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655986627;
	bh=IFxufIm2FN/Q4bUBSE7JH5HyUplkq4cWqYjYWUmz20M=;
	h=From:To:Cc:Subject:Date:From;
	b=ROs6d7MIaj5c/U6ziom9OyNz9w3oikPjy1ayTFI6lXxRWmI8671R+xv4V+GoGzGcL
	 r8CuiCx9aFTf9IBTy0B/WRYm2c2JN+sM/7gA9xfXbEv3fpkvHtAjP6F/7rMYalNVYT
	 VFz9pmSyNg8JsDXsGt6EqQgygBKDdiUIVyMR/rVp23lo58DVG3yhzj4SBl7N2GiEA8
	 JLM25ZrH3UJcx0EDgXx1XIsIGzyjwgjomA4AyGrm4eP0amXSNDvE8TJnDfga4P63Dn
	 Shmvn47gjUDD7Ei1ReFjP0o95eDYzP7hyQmJpILTsXgHQhnCq/1URBu9IMZlM07S0d
	 8jOXdt3mP//8A==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] soc: mediatek: mutex: Simplify with devm_platform_get_and_ioremap_resource()
Date: Thu, 23 Jun 2022 14:17:01 +0200
Message-Id: <20220623121701.107512-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_051712_422267_533DBC64 
X-CRM114-Status: GOOD (  12.36  )
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

Convert platform_get_resource(), devm_ioremap_resource() to a single
call to devm_platform_get_and_ioremap_resource(), as this is exactly
what this function does.

While at it, also remove a redundant call to of_address_to_resource(),
as this was getting the address of the same resource index 0: we can
as well get the iostart from the 'regs' pointer.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-mutex.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 60cbafea577e..ca8440fb48cd 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -787,7 +787,7 @@ static int mtk_mutex_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mtk_mutex_ctx *mtx;
-	struct resource *regs, addr;
+	struct resource *regs;
 	int i;
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	int ret;
@@ -811,11 +811,12 @@ static int mtk_mutex_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (of_address_to_resource(dev->of_node, 0, &addr) < 0) {
-		dev_err(dev, "Failed to get addr\n");
-		return -EINVAL;
+	mtx->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &regs);
+	if (IS_ERR(mtx->regs)) {
+		dev_err(dev, "Failed to map mutex registers\n");
+		return PTR_ERR(mtx->regs);
 	}
-	mtx->addr = addr.start;
+	mtx->addr = regs->start;
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	ret = cmdq_dev_get_client_reg(dev, &mtx->cmdq_reg, 0);
@@ -823,13 +824,6 @@ static int mtk_mutex_probe(struct platform_device *pdev)
 		dev_dbg(dev, "No mediatek,gce-client-reg!\n");
 #endif
 
-	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	mtx->regs = devm_ioremap_resource(dev, regs);
-	if (IS_ERR(mtx->regs)) {
-		dev_err(dev, "Failed to map mutex registers\n");
-		return PTR_ERR(mtx->regs);
-	}
-
 	platform_set_drvdata(pdev, mtx);
 
 	return 0;
-- 
2.35.1


