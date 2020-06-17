Return-Path: <SRS0=3SR4=76=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDD58C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2020 03:01:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AE752073E
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2020 03:01:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="koMienrv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="XUem+kjR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AE752073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cGaEqNNfFt0A/kh3ZIk4C5IiUtyYDdRBQ2y0YsXOPbk=; b=koMienrv4KOVIr
	TgmL2148vP14Iv9enwkRDzXHzuUc59GO5e0wAolVhm3SpygfR7pgJMpzh7YKtVdO71yr4f2RqG0BD
	+T+es1S61Yk9/ozqu6SJ2MaSQeDPKsX4NcnonljcpNAIxQE6hb5rRyPQTgY1D+/8Mwsmy7sS6Hyny
	VJhlyB+4m66Dgu106gjfi/tY5wwSYjsdCFlEY95cXBRNMR3h5mvAObi6JT2sSRpf+vS/cvRPNJk9d
	obSvk61XRpI3PSK88FcumbUUv/cv1fsL9valaRhyenVuh9PEUVUsaW+xcifTQbb1gwWPXbMN35EU2
	Z2OY6XvCZqL38vEBDyDg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlOK9-0001au-2x; Wed, 17 Jun 2020 03:01:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlOK5-0001ZV-Rm; Wed, 17 Jun 2020 03:01:11 +0000
X-UUID: d5d573c5807240249114a5d2f8109934-20200616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=RcPWBly9Brhf3kkCuL9ETcuxvZPWE+hTVzOXjcRdvgk=; 
 b=XUem+kjRzl3mXzzELmfofKZkWFUyGJB3+dGAhM/mp74L5heeJvAgxOWU+83J49P3/lSxaE6rRNiC5pIORfNT0M1rdvUVj7OLNUZ9Bg6luZ6pWzcVqOlsU/M49HbwOKKiFCi0YpEikbqTs1Nf3IH//lIj9Rdr5NpE/Ngi+XSmIo4=;
X-UUID: d5d573c5807240249114a5d2f8109934-20200616
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chao.hao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 176433272; Tue, 16 Jun 2020 19:01:02 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Jun 2020 20:00:58 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 17 Jun 2020 11:00:56 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 17 Jun 2020 11:00:54 +0800
From: Chao Hao <chao.hao@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>
Subject: [PATCH v4 2/7] iommu/mediatek: Rename the register
 STANDARD_AXI_MODE(0x48) to MISC_CTRL
Date: Wed, 17 Jun 2020 11:00:24 +0800
Message-ID: <20200617030029.4082-3-chao.hao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200617030029.4082-1-chao.hao@mediatek.com>
References: <20200617030029.4082-1-chao.hao@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 188D1A00A826EE5799AC19EF941DCB135E73C224925AD649618F2E108CC3D7702000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_200109_902831_3EA7B903 
X-CRM114-Status: GOOD (  12.73  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, FY Yang <fy.yang@mediatek.com>,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Chao Hao <chao.hao@mediatek.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Yong Wu <yong.wu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

For iommu offset=0x48 register, only the previous mt8173/mt8183 use the
name STANDARD_AXI_MODE, all the latest SoC extend the register more
feature by different bits, for example: axi_mode, in_order_en, coherent_en
and so on. So rename REG_MMU_MISC_CTRL may be more proper.

This patch only rename the register name, no functional change.

Signed-off-by: Chao Hao <chao.hao@mediatek.com>
Reviewed-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 14 +++++++-------
 drivers/iommu/mtk_iommu.h |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 2be96f1cdbd2..88d3df5b91c2 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -41,7 +41,7 @@
 #define F_INVLD_EN0				BIT(0)
 #define F_INVLD_EN1				BIT(1)
 
-#define REG_MMU_STANDARD_AXI_MODE		0x048
+#define REG_MMU_MISC_CTRL			0x048
 #define REG_MMU_DCM_DIS				0x050
 
 #define REG_MMU_CTRL_REG			0x110
@@ -573,8 +573,10 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
 	}
 	writel_relaxed(0, data->base + REG_MMU_DCM_DIS);
 
-	if (data->plat_data->reset_axi)
-		writel_relaxed(0, data->base + REG_MMU_STANDARD_AXI_MODE);
+	if (data->plat_data->reset_axi) {
+		/* The register is called STANDARD_AXI_MODE in this case */
+		writel_relaxed(0, data->base + REG_MMU_MISC_CTRL);
+	}
 
 	if (devm_request_irq(data->dev, data->irq, mtk_iommu_isr, 0,
 			     dev_name(data->dev), (void *)data)) {
@@ -718,8 +720,7 @@ static int __maybe_unused mtk_iommu_suspend(struct device *dev)
 	struct mtk_iommu_suspend_reg *reg = &data->reg;
 	void __iomem *base = data->base;
 
-	reg->standard_axi_mode = readl_relaxed(base +
-					       REG_MMU_STANDARD_AXI_MODE);
+	reg->misc_ctrl = readl_relaxed(base + REG_MMU_MISC_CTRL);
 	reg->dcm_dis = readl_relaxed(base + REG_MMU_DCM_DIS);
 	reg->ctrl_reg = readl_relaxed(base + REG_MMU_CTRL_REG);
 	reg->int_control0 = readl_relaxed(base + REG_MMU_INT_CONTROL0);
@@ -743,8 +744,7 @@ static int __maybe_unused mtk_iommu_resume(struct device *dev)
 		dev_err(data->dev, "Failed to enable clk(%d) in resume\n", ret);
 		return ret;
 	}
-	writel_relaxed(reg->standard_axi_mode,
-		       base + REG_MMU_STANDARD_AXI_MODE);
+	writel_relaxed(reg->misc_ctrl, base + REG_MMU_MISC_CTRL);
 	writel_relaxed(reg->dcm_dis, base + REG_MMU_DCM_DIS);
 	writel_relaxed(reg->ctrl_reg, base + REG_MMU_CTRL_REG);
 	writel_relaxed(reg->int_control0, base + REG_MMU_INT_CONTROL0);
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index ea949a324e33..1b6ea839b92c 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -18,7 +18,7 @@
 #include <soc/mediatek/smi.h>
 
 struct mtk_iommu_suspend_reg {
-	u32				standard_axi_mode;
+	u32				misc_ctrl;
 	u32				dcm_dis;
 	u32				ctrl_reg;
 	u32				int_control0;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
