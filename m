Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97010C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Dec 2021 16:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z/JiSWVgN8VpHVY1qqCFuKMAH+KFw2yZuGxloOB4xqQ=; b=s4XX/Z991DxUfd
	tJw7XHzIekEthlpj7RAJITgpsc2GKxPfGFp0/njjqWxUCsXQp7vKCrKbeC4Qsk8yv2ODbo8U2SwFl
	hS1lGgg9BZVVigCO6vM7zaFZTNs55iU1sUIGC3mAADKl0bwLNMe3ZKwknaogwU8Qh3+KxR8aSLk1b
	vBTJ4LHNXsaZi2vEqgxSn4nASEQPMmML8YKpP94RYKk91a7kZ78KwWF3Qqquqx1a3vIa4Jbc98oyz
	XoJzJTATsAn3MV8HxEkfzT4hLg54XWeRZ0NM7t2Y1md9j3CcNm8/UJJix2GFhcevCoU4DO/VCppUF
	fPBVaBmenZVcRV2/QMDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n04Hs-00Aqsl-Vi; Wed, 22 Dec 2021 16:16:20 +0000
Received: from relmlor1.renesas.com ([210.160.252.171]
 helo=relmlie5.idc.renesas.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n04HM-00AqhZ-2I; Wed, 22 Dec 2021 16:15:49 +0000
X-IronPort-AV: E=Sophos;i="5.88,226,1635174000"; d="scan'208";a="104375078"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 23 Dec 2021 01:15:47 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6E5D040A14AC;
 Thu, 23 Dec 2021 01:15:45 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/3] dmaengine: mediatek: mtk-hsdma: Use platform_get_irq() to
 get the interrupt
Date: Wed, 22 Dec 2021 16:15:33 +0000
Message-Id: <20211222161534.1263-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211222161534.1263-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211222161534.1263-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_081548_245340_CF5D770A 
X-CRM114-Status: GOOD (  10.91  )
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
 drivers/dma/mediatek/mtk-hsdma.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/mediatek/mtk-hsdma.c b/drivers/dma/mediatek/mtk-hsdma.c
index 6ad8afbb95f2..c0fffde7fe08 100644
--- a/drivers/dma/mediatek/mtk-hsdma.c
+++ b/drivers/dma/mediatek/mtk-hsdma.c
@@ -923,13 +923,10 @@ static int mtk_hsdma_probe(struct platform_device *pdev)
 		return PTR_ERR(hsdma->clk);
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	if (!res) {
-		dev_err(&pdev->dev, "No irq resource for %s\n",
-			dev_name(&pdev->dev));
-		return -EINVAL;
-	}
-	hsdma->irq = res->start;
+	err = platform_get_irq(pdev, 0);
+	if (err < 0)
+		return err;
+	hsdma->irq = err;
 
 	refcount_set(&hsdma->pc_refcnt, 0);
 	spin_lock_init(&hsdma->lock);
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
