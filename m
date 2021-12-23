Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44250C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Dec 2021 17:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7MjU9ojvbqIwnJHEnZMyxcgUpkt/bSJjaG0uluaSS04=; b=g4fB9EEG98vXW5
	aSGokFXMRUiYbAOEXVnL7bjsfKQN2dvMhmuOmq88iBvejTuHHSx8gBiVSB3RqF+wma5Va6Kyi/F09
	FgZY7rCnJiRjGQ5nsbz7tG3aah5XkM1fW9T4FuLJOp40dIGuQqyTzfXTVUH9CCY6k4jWqX1niT6+L
	9GcAJDtWPMQC+2ufosgS8RIyxdSIiPuWHPURjp0Qdu1i2Tq2fF9gTBPqtAMTnKJJMEmIrO9fCEbiV
	BFOVivJPziCbfKzkClQp3/w8z8R4Cs0mEhwmZxOPc8VMXGw69okjT2S0PWE0wwDrGra/Xy9AQ6Kcw
	7EjbBCAVQ6FfR9xLM2uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0Rx5-00DCzG-Oy; Thu, 23 Dec 2021 17:32:27 +0000
Received: from relmlor1.renesas.com ([210.160.252.171]
 helo=relmlie5.idc.renesas.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0Rvs-00DCNb-BD; Thu, 23 Dec 2021 17:31:13 +0000
X-IronPort-AV: E=Sophos;i="5.88,230,1635174000"; d="scan'208";a="104503626"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 24 Dec 2021 02:31:10 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 800B040C4DD0;
 Fri, 24 Dec 2021 02:31:07 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: linux-media@vger.kernel.org, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 linux-renesas-soc@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH 12/13] media: mtk-vpu: Drop unnecessary call to
 platform_get_resource()
Date: Thu, 23 Dec 2021 17:30:13 +0000
Message-Id: <20211223173015.22251-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211223173015.22251-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211223173015.22251-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211223_093112_533061_93C2A648 
X-CRM114-Status: GOOD (  11.25  )
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

mtk_vpu_probe() calls platform_get_resource(pdev, IORESOURCE_IRQ, ..)
to check if IRQ resource exists and later calls
platform_get_irq(pdev, ..) to get the actual IRQ.

This patch drops an unnecessary call to platform_get_resource() and
checks the return value of platform_get_irq(pdev, ..) to make sure the
IRQ line is valid.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/platform/mtk-vpu/mtk_vpu.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
index 7bd715fc844d..47b684b92f81 100644
--- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
+++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
@@ -810,7 +810,6 @@ static int mtk_vpu_probe(struct platform_device *pdev)
 {
 	struct mtk_vpu *vpu;
 	struct device *dev;
-	struct resource *res;
 	int ret = 0;
 
 	dev_dbg(&pdev->dev, "initialization\n");
@@ -908,13 +907,10 @@ static int mtk_vpu_probe(struct platform_device *pdev)
 	init_waitqueue_head(&vpu->run.wq);
 	init_waitqueue_head(&vpu->ack_wq);
 
-	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	if (!res) {
-		dev_err(dev, "get IRQ resource failed.\n");
-		ret = -ENXIO;
+	ret = platform_get_irq(pdev, 0);
+	if (ret < 0)
 		goto free_p_mem;
-	}
-	vpu->reg.irq = platform_get_irq(pdev, 0);
+	vpu->reg.irq = ret;
 	ret = devm_request_irq(dev, vpu->reg.irq, vpu_irq_handler, 0,
 			       pdev->name, vpu);
 	if (ret) {
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
