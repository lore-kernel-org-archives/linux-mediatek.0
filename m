Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A8E3C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Apr 2022 15:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3IdtZ1YbGaZ2s5fY79YygRGq96kRfwdQKt89aJgwTJs=; b=cxc13eqRSiiyzz
	ZW0u9eVUoD+Kx9+tKmhm2sqU6eeN6pRwF09YvxbYZUEAKV/Q5EKFDkhWMIwYetQfceaoyqbDU+i7l
	YzCiLYcY3yUjdJwmx6TxiDa8UtAUDXcnmtit661kQq0l9CshJreJntlYY7RgAvSDhTFaptJQGcDia
	7ha/dWIxc/RSIFXcUUmxklkvZ5V0JlUW8a9WTKmsaBbV7+HHRUTqeDpcY2Gs6vTOnSQeGybALjXj+
	Op3Ie6ywz4P3wnPjvZf1itEEVoYfrlPhpmXp9U9TUqqTv61vZRtQhcnMe82dTV/8Z/O4UJ4spbxl1
	ODIYfsYR4BhK048A5v/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbP4Q-00FdQv-BZ; Mon, 04 Apr 2022 15:56:46 +0000
Received: from relmlor2.renesas.com ([210.160.252.172]
 helo=relmlie6.idc.renesas.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbP44-00FdIB-7q; Mon, 04 Apr 2022 15:56:26 +0000
X-IronPort-AV: E=Sophos;i="5.90,234,1643641200"; d="scan'208";a="116706764"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 05 Apr 2022 00:56:21 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 81701400941E;
 Tue,  5 Apr 2022 00:56:19 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, dmaengine@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 1/3] dmaengine: nbpfaxi: Use platform_get_irq_optional() to
 get the interrupt
Date: Mon,  4 Apr 2022 16:55:55 +0100
Message-Id: <20220404155557.27316-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220404155557.27316-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220404155557.27316-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_085624_431670_CFA28B08 
X-CRM114-Status: GOOD (  14.29  )
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
code use platform_get_irq_optional().

There are no non-DT users for this driver so interrupt range
(irq_res->start-irq_res->end) is no longer required and with DT we will
be sure it will be a single IRQ resource for each index.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/dma/nbpfaxi.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/nbpfaxi.c b/drivers/dma/nbpfaxi.c
index 9c52c57919c6..a7063e9cd551 100644
--- a/drivers/dma/nbpfaxi.c
+++ b/drivers/dma/nbpfaxi.c
@@ -1294,7 +1294,7 @@ static int nbpf_probe(struct platform_device *pdev)
 	struct device_node *np = dev->of_node;
 	struct nbpf_device *nbpf;
 	struct dma_device *dma_dev;
-	struct resource *iomem, *irq_res;
+	struct resource *iomem;
 	const struct nbpf_config *cfg;
 	int num_channels;
 	int ret, irq, eirq, i;
@@ -1335,13 +1335,11 @@ static int nbpf_probe(struct platform_device *pdev)
 	nbpf->config = cfg;
 
 	for (i = 0; irqs < ARRAY_SIZE(irqbuf); i++) {
-		irq_res = platform_get_resource(pdev, IORESOURCE_IRQ, i);
-		if (!irq_res)
-			break;
-
-		for (irq = irq_res->start; irq <= irq_res->end;
-		     irq++, irqs++)
-			irqbuf[irqs] = irq;
+		irq = platform_get_irq_optional(pdev, i);
+		if (irq < 0 && irq != -ENXIO)
+			return irq;
+		if (irq > 0)
+			irqbuf[irqs++] = irq;
 	}
 
 	/*
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
