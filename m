Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F18C5C7618E
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Apr 2023 09:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wWf3GUFYmwSl1J62g2cxIVVBIwDNb1QbOpyYFvMvIFQ=; b=s70f8oVtrhysU+vblXNF+8lIA4
	+PpvpHqhxBV5uiKecCU7VNUpJqNtB2X6DWFR9yn1P78cFVF8m576WsxQ7GXdMQqvNtERhD3VZuiTd
	02IUoGXXflM22cX+v2IjtWs0557pHWDIibkhtYU2u877t83Yu5kcB/7Loe5eKns5bP0pZeqFUh+PI
	irkbMFEuBhEkwjzz5bpAPd3n+rF0NgnUGX30uYnPCh+QRsXZAxzVq69xiVA5sjKE4+KTVg1BcFYvy
	eRYgGjpGJya4DxyXt1Lva+bqnwqgc8pp+7FIc4umtZuW9l20lrXccZuV8BB1SFA/V6Yhk6GgHwnU9
	ocQ2/G2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prbS1-003Iuf-2x;
	Wed, 26 Apr 2023 09:28:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prbRy-003ItZ-2A;
	Wed, 26 Apr 2023 09:28:36 +0000
X-UUID: 9b02700ce41211ed8687db9d93187ff1-20230426
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=wWf3GUFYmwSl1J62g2cxIVVBIwDNb1QbOpyYFvMvIFQ=;
	b=Az0b17l1mA5LcGTLSYiSLieHEN01zhC5INzIE5FMnv1ISVaml1nXF+4cNxJwaRLKS+NFf3lHXr1y5LqNnCMiGZ9m2jsjiNelNvnvM44UMRIhuUnOAfKEr0FjZjBkQtx2VZSPU3p3fQaLiBpuEJMAEHX2xnPr/H9Z2QEbUBh8SDQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:d672b9ee-8242-4c7b-af43-0f42bdd18737,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:120426c,CLOUDID:202f4e85-cd9c-45f5-8134-710979e3df0e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 9b02700ce41211ed8687db9d93187ff1-20230426
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 240922171; Wed, 26 Apr 2023 02:13:27 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 26 Apr 2023 17:12:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Wed, 26 Apr 2023 17:12:25 +0800
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
Subject: [PATCH v10 06/11] remoteproc: mediatek: Probe multi-core SCP
Date: Wed, 26 Apr 2023 17:12:06 +0800
Message-ID: <20230426091211.21557-7-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230426091211.21557-1-tinghan.shen@mediatek.com>
References: <20230426091211.21557-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_022834_715099_B21E6FF1 
X-CRM114-Status: GOOD (  26.30  )
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

The difference of single-core SCP and multi-core SCP device tree is
the presence of child device nodes described SCP cores. The SCP
driver populates the platform device and checks the child nodes
to identify whether it's a single-core SCP or a multi-core SCP.

Add the remoteproc instances for single-core SCP and multi-core SCP to
the new added SCP cluster list. When the SCP driver is removed, it
cleanup resources by walking through the cluster list.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 drivers/remoteproc/mtk_common.h |   3 +
 drivers/remoteproc/mtk_scp.c    | 188 ++++++++++++++++++++++++++++----
 2 files changed, 172 insertions(+), 19 deletions(-)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index c0905aec3b4b..b73b60c22ea1 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -128,6 +128,9 @@ struct mtk_scp {
 	size_t dram_size;
 
 	struct rproc_subdev *rpmsg_subdev;
+
+	struct list_head elem;
+	struct list_head *cluster;
 };
 
 /**
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 5e4982f4d5dc..0b052b0acf2e 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -28,6 +28,7 @@ struct mtk_scp_of_cluster {
 	void __iomem *l1tcm_base;
 	size_t l1tcm_size;
 	phys_addr_t l1tcm_phys;
+	struct list_head mtk_scp_cluster;
 };
 
 /**
@@ -862,21 +863,31 @@ static void scp_remove_rpmsg_subdev(struct mtk_scp *scp)
 	}
 }
 
-static int scp_rproc_init(struct platform_device *pdev)
+static int scp_rproc_init(struct platform_device *cluster_pdev,
+			  struct platform_device *core_pdev,
+			  const struct mtk_scp_of_data *of_data)
 {
-	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node;
-	struct mtk_scp_of_cluster *of_cluster = platform_get_drvdata(pdev);
+	struct platform_device *pdev;
+	struct device *dev;
+	struct device_node *np;
+	struct mtk_scp_of_cluster *of_cluster = platform_get_drvdata(cluster_pdev);
 	struct mtk_scp *scp;
 	struct rproc *rproc;
 	struct resource *res;
 	const char *fw_name = "scp.img";
 	int ret, i;
 
+	if (core_pdev)
+		pdev = core_pdev;
+	else
+		pdev = cluster_pdev;
+
+	dev = &pdev->dev;
 	ret = rproc_of_parse_firmware(dev, 0, &fw_name);
 	if (ret < 0 && ret != -EINVAL)
 		return ret;
 
+	np = dev->of_node;
 	rproc = devm_rproc_alloc(dev, np->name, &scp_ops, fw_name, sizeof(*scp));
 	if (!rproc)
 		return dev_err_probe(dev, -ENOMEM, "unable to allocate remoteproc\n");
@@ -884,7 +895,7 @@ static int scp_rproc_init(struct platform_device *pdev)
 	scp = rproc->priv;
 	scp->rproc = rproc;
 	scp->dev = dev;
-	scp->data = of_device_get_match_data(dev);
+	scp->data = of_data;
 	platform_set_drvdata(pdev, scp);
 
 	scp->reg_base = of_cluster->reg_base;
@@ -934,10 +945,6 @@ static int scp_rproc_init(struct platform_device *pdev)
 		goto remove_subdev;
 	}
 
-	ret = rproc_add(rproc);
-	if (ret)
-		goto remove_subdev;
-
 	return 0;
 
 remove_subdev:
@@ -952,6 +959,121 @@ static int scp_rproc_init(struct platform_device *pdev)
 	return ret;
 }
 
+static void scp_rproc_free(struct mtk_scp *scp)
+{
+	int i;
+
+	scp_remove_rpmsg_subdev(scp);
+	scp_ipi_unregister(scp, SCP_IPI_INIT);
+	scp_unmap_memory_region(scp);
+	for (i = 0; i < SCP_IPI_MAX; i++)
+		mutex_destroy(&scp->ipi_desc[i].lock);
+	mutex_destroy(&scp->send_lock);
+}
+
+static int scp_is_single_core(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev_of_node(dev);
+	struct device_node *child;
+
+	child = of_get_next_available_child(np, NULL);
+	if (!child)
+		return dev_err_probe(dev, -ENODEV, "No child node\n");
+
+	of_node_put(child);
+	return of_node_name_eq(child, "cros-ec-rpmsg");
+}
+
+static int scp_cluster_init(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev_of_node(dev);
+	struct platform_device *cpdev;
+	struct device_node *child;
+	struct mtk_scp_of_cluster *of_cluster = platform_get_drvdata(pdev);
+	const struct mtk_scp_of_data **cluster_of_data;
+	struct list_head *cluster = &of_cluster->mtk_scp_cluster;
+	struct mtk_scp *scp, *temp;
+	int core_id = 0;
+	int ret;
+
+	ret = scp_is_single_core(pdev);
+	if (ret < 0)
+		return ret;
+
+	if (ret) {
+		dev_dbg(dev, "single-core scp\n");
+
+		/* When using the SCP node phandle on exported SCP APIs, the drvdata
+		 * is expected to be the mtk_scp object, and as a result, it is intended
+		 * to be overwritten for single-core SCP usage.
+		 */
+		ret = scp_rproc_init(pdev, NULL, of_device_get_match_data(dev));
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to initialize single-core scp\n");
+
+		scp = platform_get_drvdata(pdev);
+		list_add_tail(&scp->elem, cluster);
+		scp->cluster = cluster;
+	} else {
+		dev_dbg(dev, "multi-core scp\n");
+
+		cluster_of_data = (const struct mtk_scp_of_data **)of_device_get_match_data(dev);
+
+		for_each_available_child_of_node(np, child) {
+			if (!cluster_of_data[core_id]) {
+				ret = -EINVAL;
+				dev_err(dev, "Not support core %d\n", core_id);
+				of_node_put(child);
+				goto init_fail;
+			}
+
+			cpdev = of_find_device_by_node(child);
+			if (!cpdev) {
+				ret = -ENODEV;
+				dev_err(dev, "Not found platform device for core %d\n", core_id);
+				of_node_put(child);
+				goto init_fail;
+			}
+
+			ret = scp_rproc_init(pdev, cpdev, cluster_of_data[core_id]);
+			if (ret) {
+				dev_err(dev, "Failed to initialize core %d rproc\n", core_id);
+				put_device(&cpdev->dev);
+				of_node_put(child);
+				goto init_fail;
+			}
+			scp = platform_get_drvdata(cpdev);
+			list_add_tail(&scp->elem, cluster);
+			scp->cluster = cluster;
+			put_device(&cpdev->dev);
+
+			core_id++;
+		}
+	}
+
+	list_for_each_entry_safe_reverse(scp, temp, cluster, elem) {
+		ret = rproc_add(scp->rproc);
+		if (ret)
+			goto add_fail;
+	}
+
+	return 0;
+
+add_fail:
+	list_for_each_entry_continue(scp, cluster, elem) {
+		rproc_del(scp->rproc);
+	}
+init_fail:
+	list_for_each_entry_safe_reverse(scp, temp, cluster, elem) {
+		list_del(&scp->elem);
+		scp_rproc_free(scp);
+	}
+
+	return ret;
+}
+
 static int scp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -983,23 +1105,44 @@ static int scp_probe(struct platform_device *pdev)
 		of_cluster->l1tcm_phys = res->start;
 	}
 
+	INIT_LIST_HEAD(&of_cluster->mtk_scp_cluster);
 	platform_set_drvdata(pdev, of_cluster);
 
-	return scp_rproc_init(pdev);
+	ret = devm_of_platform_populate(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to populate platform devices\n");
+
+	ret = scp_cluster_init(pdev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to initialize scp cluster\n");
+
+	return 0;
 }
 
 static int scp_remove(struct platform_device *pdev)
 {
-	struct mtk_scp *scp = platform_get_drvdata(pdev);
-	int i;
+	struct mtk_scp *scp, *temp;
+	struct mtk_scp_of_cluster *of_cluster;
+	struct list_head *cluster;
+	int ret;
 
-	rproc_del(scp->rproc);
-	scp_remove_rpmsg_subdev(scp);
-	scp_ipi_unregister(scp, SCP_IPI_INIT);
-	scp_unmap_memory_region(scp);
-	for (i = 0; i < SCP_IPI_MAX; i++)
-		mutex_destroy(&scp->ipi_desc[i].lock);
-	mutex_destroy(&scp->send_lock);
+	ret = scp_is_single_core(pdev);
+	if (ret < 0)
+		return ret;
+
+	if (ret) {
+		scp = platform_get_drvdata(pdev);
+		cluster = scp->cluster;
+	} else {
+		of_cluster = platform_get_drvdata(pdev);
+		cluster = &of_cluster->mtk_scp_cluster;
+	}
+
+	list_for_each_entry_safe_reverse(scp, temp, cluster, elem) {
+		list_del(&scp->elem);
+		rproc_del(scp->rproc);
+		scp_rproc_free(scp);
+	}
 
 	return 0;
 }
@@ -1078,12 +1221,19 @@ static const struct mtk_scp_of_data mt8195_of_data_c1 = {
 	.host_to_scp_int_bit = MT8195_CORE1_HOST_IPC_INT_BIT,
 };
 
+static const struct mtk_scp_of_data *mt8195_of_data_cores[] = {
+	&mt8195_of_data,
+	&mt8195_of_data_c1,
+	NULL
+};
+
 static const struct of_device_id mtk_scp_of_match[] = {
 	{ .compatible = "mediatek,mt8183-scp", .data = &mt8183_of_data },
 	{ .compatible = "mediatek,mt8186-scp", .data = &mt8186_of_data },
 	{ .compatible = "mediatek,mt8188-scp", .data = &mt8188_of_data },
 	{ .compatible = "mediatek,mt8192-scp", .data = &mt8192_of_data },
 	{ .compatible = "mediatek,mt8195-scp", .data = &mt8195_of_data },
+	{ .compatible = "mediatek,mt8195-scp-dual", .data = &mt8195_of_data_cores },
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_scp_of_match);
-- 
2.18.0


