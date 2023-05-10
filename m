Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6477FC77B7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 May 2023 06:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mFRMkL33UOETAVOWCaS6Si51BlFUJ5cVoWg7L4hvcaM=; b=WhHF+YON/C4KdKR0+XR2ZvcmRp
	U7CxsoLaIzKPlbiq0coVPJEiBcdKifVVVVMzOeZlztQJaTdmQse63d7P/Rjl/FUg03bHvzUeSWm57
	cXtLiYji3exLlWudzp3r2PWpXbRCkLuKOmy3lDucSAq0jqV/7rWNe+aHy89bPkCJF73Zthdfb9b/F
	ji3639Tpec0l/x1w49sUV2U0p2iXZoF0E8RM9DfwXYOIyQf8/LBGEwVGoy9voVDIuJ0U7anBhxCQy
	fhdLD/1FJeMEb/1eJblr7Zj6S7o3sxZArUoh0neSidFbJOfbcKiQ2GhI0QdJQUipGjkbhEOatYw4I
	Jef4CLgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwdTn-005Gzd-2S;
	Wed, 10 May 2023 06:39:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwdTg-005Gsk-1p;
	Wed, 10 May 2023 06:39:10 +0000
X-UUID: 5a8a5c06eefd11ed83ed1395ce914268-20230509
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=mFRMkL33UOETAVOWCaS6Si51BlFUJ5cVoWg7L4hvcaM=;
	b=UgbRFfj1hILivfNtZ0GWxCAKH9Yyouk3nRWhAJqZp+LO8hqKuqufN6dF9MM7e4W9j/I2PCjqFX0AsK+4Ex7TYB3k/MaYJMO8nj/iSOos1NSOdqmsewrbsCsAKBQoNXEx7xxVepK6MEjxScCIuAgrgaJRklFODXJEQwkBQeasjlA=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.24,REQID:63b77916-e3d0-40dd-a1b3-b7136256d7ca,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-INFO: VERSION:1.1.24,REQID:63b77916-e3d0-40dd-a1b3-b7136256d7ca,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:100
X-CID-META: VersionHash:178d4d4,CLOUDID:7a255dc0-e32c-4c97-918d-fbb3fc224d4e,B
	ulkID:2305101438280R9W1MDY,BulkQuantity:1,Recheck:0,SF:16|19|48|38|29|28,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 5a8a5c06eefd11ed83ed1395ce914268-20230509
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 719794550; Tue, 09 May 2023 23:39:03 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.194) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 10 May 2023 14:37:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 10 May 2023 14:37:57 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Tinghan
 Shen <tinghan.shen@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v11 06/11] remoteproc: mediatek: Probe multi-core SCP
Date: Wed, 10 May 2023 14:37:44 +0800
Message-ID: <20230510063749.5127-7-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230510063749.5127-1-tinghan.shen@mediatek.com>
References: <20230510063749.5127-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_233908_621091_C8C1CDF4 
X-CRM114-Status: GOOD (  24.25  )
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

Add the remoteproc instances of multi-core SCP to the SCP cluster list.
When the SCP driver is removed, it cleanup resources by walking
through the cluster list.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 drivers/remoteproc/mtk_scp.c | 135 ++++++++++++++++++++++++++++++-----
 1 file changed, 117 insertions(+), 18 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index ff73c6dd9637..87215a0e145e 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -864,7 +864,8 @@ static void scp_remove_rpmsg_subdev(struct mtk_scp *scp)
 }
 
 static struct mtk_scp *scp_rproc_init(struct platform_device *pdev,
-				      struct mtk_scp_of_cluster *scp_cluster)
+				      struct mtk_scp_of_cluster *scp_cluster,
+				      const struct mtk_scp_of_data *of_data)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
@@ -887,7 +888,7 @@ static struct mtk_scp *scp_rproc_init(struct platform_device *pdev,
 	scp = rproc->priv;
 	scp->rproc = rproc;
 	scp->dev = dev;
-	scp->data = of_device_get_match_data(dev);
+	scp->data = of_data;
 	platform_device_add_data(pdev, &scp, sizeof(scp));
 
 	scp->reg_base = scp_cluster->reg_base;
@@ -938,10 +939,6 @@ static struct mtk_scp *scp_rproc_init(struct platform_device *pdev,
 		goto remove_subdev;
 	}
 
-	ret = rproc_add(rproc);
-	if (ret)
-		goto remove_subdev;
-
 	return scp;
 
 remove_subdev:
@@ -956,19 +953,116 @@ static struct mtk_scp *scp_rproc_init(struct platform_device *pdev,
 	return ERR_PTR(ret);
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
 static int scp_cluster_init(struct platform_device *pdev)
 {
-	struct mtk_scp *scp;
+	struct mtk_scp *scp, *temp;
 	struct mtk_scp_of_cluster *scp_cluster = platform_get_drvdata(pdev);
 	struct list_head *cluster = &scp_cluster->mtk_scp_cluster;
 
-	scp = scp_rproc_init(pdev, scp_cluster);
-	if (IS_ERR(scp))
-		return PTR_ERR(scp);
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev_of_node(dev);
+	struct platform_device *cpdev;
+	struct device_node *child;
+	const struct mtk_scp_of_data **cluster_of_data;
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
+		scp = scp_rproc_init(pdev, scp_cluster, of_device_get_match_data(dev));
+		if (IS_ERR(scp))
+			return PTR_ERR(scp);
+
+		list_add_tail(&scp->elem, cluster);
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
+			scp = scp_rproc_init(cpdev, scp_cluster, cluster_of_data[core_id]);
+			if (IS_ERR(scp)) {
+				dev_err(dev, "Failed to initialize core %d rproc\n", core_id);
+				put_device(&cpdev->dev);
+				of_node_put(child);
+				goto init_fail;
+			}
+			list_add_tail(&scp->elem, cluster);
+			put_device(&cpdev->dev);
+
+			core_id++;
+		}
+	}
 
-	list_add_tail(&scp->elem, cluster);
+	list_for_each_entry_safe_reverse(scp, temp, cluster, elem) {
+		ret = rproc_add(scp->rproc);
+		if (ret)
+			goto add_fail;
+	}
 
 	return 0;
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
 }
 
 static int scp_probe(struct platform_device *pdev)
@@ -1005,6 +1099,10 @@ static int scp_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&scp_cluster->mtk_scp_cluster);
 	platform_set_drvdata(pdev, scp_cluster);
 
+	ret = devm_of_platform_populate(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to populate platform devices\n");
+
 	ret = scp_cluster_init(pdev);
 	if (ret)
 		return ret;
@@ -1016,17 +1114,11 @@ static int scp_remove(struct platform_device *pdev)
 {
 	struct mtk_scp_of_cluster *scp_cluster = platform_get_drvdata(pdev);
 	struct mtk_scp *scp, *temp;
-	int i;
 
 	list_for_each_entry_safe_reverse(scp, temp, &scp_cluster->mtk_scp_cluster, elem) {
 		list_del(&scp->elem);
 		rproc_del(scp->rproc);
-		scp_remove_rpmsg_subdev(scp);
-		scp_ipi_unregister(scp, SCP_IPI_INIT);
-		scp_unmap_memory_region(scp);
-		for (i = 0; i < SCP_IPI_MAX; i++)
-			mutex_destroy(&scp->ipi_desc[i].lock);
-		mutex_destroy(&scp->send_lock);
+		scp_rproc_free(scp);
 	}
 
 	return 0;
@@ -1106,12 +1198,19 @@ static const struct mtk_scp_of_data mt8195_of_data_c1 = {
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


