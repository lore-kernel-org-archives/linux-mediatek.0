Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDCC0C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Dec 2021 16:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5in4XY+iWwdQRB3pRWO5KX/W5OhJsLl6v+FTO46UxuQ=; b=Cq0TvxaDvTdqnA
	x/gTRnifzEyJQFQU68IhFUi6rpITIp4xcFbozaGxre72mXkdQFgzkKqGg+vXmQTylU5tTB765aJV1
	9S6YR3QUB1nnefBEUM/2I7oocbSbG6Am48r6eF8eQXsEWqddGmsuCtKpTJsG2z13npcW4NxihZhRL
	W22zGNyCsdqpWilSPuBR24SB6GpZ/3H3AtGdo8BRc9ZaC+/ahrHoNN0yqVBITksTKURj/N9hkUqr1
	Y0RCU3Hak/E16LURfbn2h2zI+qI8ArPQfgBtF7oqsBWnfWvucjj646fUC+1FdUS004weX8wwyTNik
	v7Ua2E6HircjymeCV1aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n04I4-00AqyO-6s; Wed, 22 Dec 2021 16:16:32 +0000
Received: from relmlor2.renesas.com ([210.160.252.172]
 helo=relmlie6.idc.renesas.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n04HO-00Aqhr-My; Wed, 22 Dec 2021 16:15:52 +0000
X-IronPort-AV: E=Sophos;i="5.88,226,1635174000"; d="scan'208";a="104850912"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 23 Dec 2021 01:15:50 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 07A0440A14AC;
 Thu, 23 Dec 2021 01:15:47 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/3] dmaengine: mediatek-cqdma: Use platform_get_irq() to get
 the interrupt
Date: Wed, 22 Dec 2021 16:15:34 +0000
Message-Id: <20211222161534.1263-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211222161534.1263-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211222161534.1263-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_081550_887412_0117D828 
X-CRM114-Status: GOOD (  11.60  )
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
