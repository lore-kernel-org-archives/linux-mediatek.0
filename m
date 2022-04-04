Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E8AC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Apr 2022 15:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1FYqUCUHGUEgYBQda3i/dkx5/r6EUvIkQ85fU25XQrA=; b=hR97D+c4Djh4wV
	Efd6A1luo3CHbk+9EpMjCqUK8/UnKEnv0AEGqNRFh6U/69HKYJXGhiKccGBAIIllES5Se9M2n1rDp
	Y8O2GUMpFZDtcK2olmABfrkZ+iXhESoKy35qfgmAYd85K4gmBYzpH9Z+YW6bhZZGg3cHYdgWIdI2h
	PXLauJTjX4fHtVlhQERZWdpNoCYWhGxZQ8fDm6RWavVDn3XJnqHdM5UgVJ2ZL2wGBYftRJMH0QtQm
	PQoQ6WILf+Io4PEqFqco83UW/q8b0kORZ4aoRZSleOZ9r89tbXsFLhJpptgAnkL/6KfKIXm8yW7jg
	pPnFf101EmIawNItgfhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbP4l-00FdcL-TW; Mon, 04 Apr 2022 15:57:07 +0000
Received: from relmlor1.renesas.com ([210.160.252.171]
 helo=relmlie5.idc.renesas.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbP48-00FdJE-CM; Mon, 04 Apr 2022 15:56:30 +0000
X-IronPort-AV: E=Sophos;i="5.90,234,1643641200"; d="scan'208";a="115683064"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 05 Apr 2022 00:56:25 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0584B40037EF;
 Tue,  5 Apr 2022 00:56:23 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, dmaengine@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 3/3] dmaengine: mediatek-cqdma: Use platform_get_irq() to
 get the interrupt
Date: Mon,  4 Apr 2022 16:55:57 +0100
Message-Id: <20220404155557.27316-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220404155557.27316-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220404155557.27316-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_085628_576901_EA90A875 
X-CRM114-Status: GOOD (  12.17  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
allocation of IRQ resources in DT core code, this causes an issue
when using hierarchical interrupt domains using "interrupts" property
in the node as this bypasses the hierarchical setup and messes up the
irq chaining.

In preparation for removal of static setup of IRQ resource from DT core
code use platform_get_irq().

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/dma/mediatek/mtk-cqdma.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/mediatek/mtk-cqdma.c b/drivers/dma/mediatek/mtk-cqdma.c
index 41ef9f15d3d5..f8847c48ba03 100644
--- a/drivers/dma/mediatek/mtk-cqdma.c
+++ b/drivers/dma/mediatek/mtk-cqdma.c
@@ -751,7 +751,6 @@ static int mtk_cqdma_probe(struct platform_device *pdev)
 	struct mtk_cqdma_device *cqdma;
 	struct mtk_cqdma_vchan *vc;
 	struct dma_device *dd;
-	struct resource *res;
 	int err;
 	u32 i;
 
@@ -824,13 +823,10 @@ static int mtk_cqdma_probe(struct platform_device *pdev)
 			return PTR_ERR(cqdma->pc[i]->base);
 
 		/* allocate IRQ resource */
-		res = platform_get_resource(pdev, IORESOURCE_IRQ, i);
-		if (!res) {
-			dev_err(&pdev->dev, "No irq resource for %s\n",
-				dev_name(&pdev->dev));
-			return -EINVAL;
-		}
-		cqdma->pc[i]->irq = res->start;
+		err = platform_get_irq(pdev, i);
+		if (err < 0)
+			return err;
+		cqdma->pc[i]->irq = err;
 
 		err = devm_request_irq(&pdev->dev, cqdma->pc[i]->irq,
 				       mtk_cqdma_irq, 0, dev_name(&pdev->dev),
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
