Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D13C7618E
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Apr 2023 09:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SZjevMFr3hN/VIx2NgbZTpSz9vi5eily31NZvHvjAig=; b=xsQygwXslEQf2mitHnN824gd2O
	EqK42E22jlbkxg4X/SBdEFqdNWMGlSG2JvkO1M3OR7uEyprY8jG2Rc1Ww9GtyKm7nQzLKV6L1e9Mr
	It0FbgNzSVVB5x0J1MAOLXeZ03QO0co3vgG75L+beDkAAG1chDGLZ4Rb1IUMQoMEN9DPC3GfXWMaf
	LLAlErOvi1MKQZmEX3aDYAjS3QD+d2sij0U/nPsfCz3Q1qe+8Fes8qRBfRFNJFSkl1BfbRqiBfUz8
	8MMMlAVWm6LZoCu4UfMY8ZE6h0dTkPXUjN5EgizBByPH/GTN7vXlN3qIOLxEEu5GH5BO7YQsVrpTD
	t4ZsiS/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prbVv-003Jlk-09;
	Wed, 26 Apr 2023 09:32:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prbVs-003Jkp-1K;
	Wed, 26 Apr 2023 09:32:37 +0000
X-UUID: 4317977ae41511edb7d8d11f642b8e78-20230426
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=SZjevMFr3hN/VIx2NgbZTpSz9vi5eily31NZvHvjAig=;
	b=d/0MolekIkgFlmOmm5bJ2M+OSdPC9FkFyNk4pqDESxM3fzXAW3VpfN/vThpze4z6Y1vW4xCi3SRW1oRP3Pt+rqMQj0RA1q1nE/5McTeecgG9zg+WO7V9k1LMKny5P2fU7gNp03I5HP5lH1kaUCIhjZsw/enkTRS6mVG3QOkssrc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:8cb11450-c5d5-4e85-a763-6c42e06cc768,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:120426c,CLOUDID:34e04e85-cd9c-45f5-8134-710979e3df0e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 4317977ae41511edb7d8d11f642b8e78-20230426
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 140149241; Wed, 26 Apr 2023 02:32:28 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Wed, 26 Apr 2023 17:12:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Wed, 26 Apr 2023 17:12:24 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Tinghan Shen
	<tinghan.shen@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v10 05/11] remoteproc: mediatek: Extract remoteproc initialization flow
Date: Wed, 26 Apr 2023 17:12:05 +0800
Message-ID: <20230426091211.21557-6-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230426091211.21557-1-tinghan.shen@mediatek.com>
References: <20230426091211.21557-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_023236_451343_A294C1F9 
X-CRM114-Status: GOOD (  17.04  )
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

This is the preparation for probing multi-core SCP. The remoteproc
initialization flow is similar on cores and is reused to avoid
redundant code.

The registers of config and l1tcm are shared for multi-core
SCP. Reuse the mapped addresses for all cores.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/remoteproc/mtk_scp.c | 69 ++++++++++++++++++++++++++----------
 1 file changed, 50 insertions(+), 19 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 2bf66b1a8d80..5e4982f4d5dc 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -23,6 +23,13 @@
 #define MAX_CODE_SIZE 0x500000
 #define SECTION_NAME_IPI_BUFFER ".ipi_buffer"
 
+struct mtk_scp_of_cluster {
+	void __iomem *reg_base;
+	void __iomem *l1tcm_base;
+	size_t l1tcm_size;
+	phys_addr_t l1tcm_phys;
+};
+
 /**
  * scp_get() - get a reference to SCP.
  *
@@ -855,10 +862,11 @@ static void scp_remove_rpmsg_subdev(struct mtk_scp *scp)
 	}
 }
 
-static int scp_probe(struct platform_device *pdev)
+static int scp_rproc_init(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
+	struct mtk_scp_of_cluster *of_cluster = platform_get_drvdata(pdev);
 	struct mtk_scp *scp;
 	struct rproc *rproc;
 	struct resource *res;
@@ -879,6 +887,11 @@ static int scp_probe(struct platform_device *pdev)
 	scp->data = of_device_get_match_data(dev);
 	platform_set_drvdata(pdev, scp);
 
+	scp->reg_base = of_cluster->reg_base;
+	scp->l1tcm_base = of_cluster->l1tcm_base;
+	scp->l1tcm_size = of_cluster->l1tcm_size;
+	scp->l1tcm_phys = of_cluster->l1tcm_phys;
+
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sram");
 	scp->sram_base = devm_ioremap_resource(dev, res);
 	if (IS_ERR(scp->sram_base))
@@ -888,24 +901,6 @@ static int scp_probe(struct platform_device *pdev)
 	scp->sram_size = resource_size(res);
 	scp->sram_phys = res->start;
 
-	/* l1tcm is an optional memory region */
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "l1tcm");
-	scp->l1tcm_base = devm_ioremap_resource(dev, res);
-	if (IS_ERR(scp->l1tcm_base)) {
-		ret = PTR_ERR(scp->l1tcm_base);
-		if (ret != -EINVAL) {
-			return dev_err_probe(dev, ret, "Failed to map l1tcm memory\n");
-		}
-	} else {
-		scp->l1tcm_size = resource_size(res);
-		scp->l1tcm_phys = res->start;
-	}
-
-	scp->reg_base = devm_platform_ioremap_resource_byname(pdev, "cfg");
-	if (IS_ERR(scp->reg_base))
-		return dev_err_probe(dev, PTR_ERR(scp->reg_base),
-				     "Failed to parse and map cfg memory\n");
-
 	ret = scp->data->scp_clk_get(scp);
 	if (ret)
 		return ret;
@@ -957,6 +952,42 @@ static int scp_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static int scp_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_scp_of_cluster *of_cluster;
+	struct resource *res;
+	int ret;
+
+	of_cluster = devm_kzalloc(&pdev->dev, sizeof(*of_cluster), GFP_KERNEL);
+	if (!of_cluster)
+		return -ENOMEM;
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cfg");
+	of_cluster->reg_base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(of_cluster->reg_base))
+		return dev_err_probe(dev, PTR_ERR(of_cluster->reg_base),
+				     "Failed to parse and map cfg memory\n");
+
+	/* l1tcm is an optional memory region */
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "l1tcm");
+	of_cluster->l1tcm_base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(of_cluster->l1tcm_base)) {
+		ret = PTR_ERR(of_cluster->l1tcm_base);
+		if (ret != -EINVAL)
+			return dev_err_probe(dev, ret, "Failed to map l1tcm memory\n");
+
+		of_cluster->l1tcm_base = NULL;
+	} else {
+		of_cluster->l1tcm_size = resource_size(res);
+		of_cluster->l1tcm_phys = res->start;
+	}
+
+	platform_set_drvdata(pdev, of_cluster);
+
+	return scp_rproc_init(pdev);
+}
+
 static int scp_remove(struct platform_device *pdev)
 {
 	struct mtk_scp *scp = platform_get_drvdata(pdev);
-- 
2.18.0


