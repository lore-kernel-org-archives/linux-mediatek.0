Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F41C77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 04:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hma6p26rQIyIThKNfeXF5jdshZtrw3Y5qqlbj4TWwLU=; b=hvGMeqIzL7YkICxEyUMgDpj+O4
	qHq6A/1vihbHdROgcqY7sIoFkf8RXbcjN+Tq+MpOul9lBckxXsDDvQaw10VDyERyBJWGRUQbhasLE
	Z4Ja2XmuZwr1L7GNtJ/fwvI+ARopuGujZqvgmxFd92c0R9FWdAH1lw3Ifk/qZaLA5n6Qz3Tdjnryx
	o0c+Obq96NexqZaDtq7Eaa4mXrTFD8u5uT42rwuVSf0rZF7JsOWSKp37TSCeBjHAx/DDuNNcmzCfI
	CXDqra0eMoFy5hl61lVMH4ttGzkH+I3e737AdFt3hYQjayfKc/af6Fc1rRlEIOy/FO0AmMBbhPM9c
	9UC2TYaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pz8tc-0088Fl-0l;
	Wed, 17 May 2023 04:36:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pz8tW-0088Bc-2j;
	Wed, 17 May 2023 04:36:12 +0000
X-UUID: 57f46ed6f46c11ed83ed1395ce914268-20230516
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Hma6p26rQIyIThKNfeXF5jdshZtrw3Y5qqlbj4TWwLU=;
	b=tvYig92/t9jTNhppiElsYlRQfVz9dfjKnwtLVz+g9ifKWid+yXHK1jMycMzT2vDzwalj4Fb/Aa3YfNo15/Yk8LWfiAuihj0ABb2hM+OOl5nUj7nrSXO5NOZpUAtcwk5yNTvwDSLxw2rrd7rtw0KjovWfvyzaAgBwADApfxyQJI8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:a01e6291-e672-470d-9458-47235d81b259,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:d5b0ae3,CLOUDID:0c60116c-2f20-4998-991c-3b78627e4938,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 57f46ed6f46c11ed83ed1395ce914268-20230516
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 941447617; Tue, 16 May 2023 21:36:08 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 17 May 2023 12:35:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 17 May 2023 12:35:33 +0800
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
Subject: [PATCH v12 06/11] remoteproc: mediatek: Probe multi-core SCP
Date: Wed, 17 May 2023 12:34:44 +0800
Message-ID: <20230517043449.26352-7-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230517043449.26352-1-tinghan.shen@mediatek.com>
References: <20230517043449.26352-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_213610_916478_1026D0E2 
X-CRM114-Status: GOOD (  21.84  )
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
 drivers/remoteproc/mtk_scp.c | 115 +++++++++++++++++++++++++++++++++--
 1 file changed, 111 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index c8fc6b46f82b..d644e232dfec 100644
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
@@ -964,14 +965,15 @@ static void scp_free(struct mtk_scp *scp)
 	mutex_destroy(&scp->send_lock);
 }
 
-static int scp_cluster_init(struct platform_device *pdev)
+static int scp_add_single_core(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct mtk_scp_of_cluster *scp_cluster = platform_get_drvdata(pdev);
 	struct list_head *cluster = &scp_cluster->mtk_scp_list;
 	struct mtk_scp *scp;
 	int ret;
 
-	scp = scp_rproc_init(pdev, scp_cluster);
+	scp = scp_rproc_init(pdev, scp_cluster, of_device_get_match_data(dev));
 	if (IS_ERR(scp))
 		return PTR_ERR(scp);
 
@@ -987,6 +989,100 @@ static int scp_cluster_init(struct platform_device *pdev)
 	return 0;
 }
 
+static int scp_add_multi_core(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev_of_node(dev);
+	struct platform_device *cpdev;
+	struct device_node *child;
+	struct mtk_scp_of_cluster *scp_cluster = platform_get_drvdata(pdev);
+	struct list_head *cluster = &scp_cluster->mtk_scp_list;
+	const struct mtk_scp_of_data **cluster_of_data;
+	struct mtk_scp *scp, *temp;
+	int core_id = 0;
+	int ret;
+
+	cluster_of_data = (const struct mtk_scp_of_data **)of_device_get_match_data(dev);
+
+	for_each_available_child_of_node(np, child) {
+		if (!cluster_of_data[core_id]) {
+			ret = -EINVAL;
+			dev_err(dev, "Not support core %d\n", core_id);
+			of_node_put(child);
+			goto init_fail;
+		}
+
+		cpdev = of_find_device_by_node(child);
+		if (!cpdev) {
+			ret = -ENODEV;
+			dev_err(dev, "Not found platform device for core %d\n", core_id);
+			of_node_put(child);
+			goto init_fail;
+		}
+
+		scp = scp_rproc_init(cpdev, scp_cluster, cluster_of_data[core_id]);
+		put_device(&cpdev->dev);
+		if (IS_ERR(scp)) {
+			ret = PTR_ERR(scp);
+			dev_err(dev, "Failed to initialize core %d rproc\n", core_id);
+			of_node_put(child);
+			goto init_fail;
+		}
+
+		ret = rproc_add(scp->rproc);
+		if (ret) {
+			dev_err(dev, "Failed to add rproc of core %d\n", core_id);
+			of_node_put(child);
+			scp_free(scp);
+			goto init_fail;
+		}
+
+		list_add_tail(&scp->elem, cluster);
+		core_id++;
+	}
+
+	return 0;
+
+init_fail:
+	list_for_each_entry_safe_reverse(scp, temp, cluster, elem) {
+		list_del(&scp->elem);
+		rproc_del(scp->rproc);
+		scp_free(scp);
+	}
+
+	return ret;
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
+	int ret;
+
+	ret = scp_is_single_core(pdev);
+	if (ret < 0)
+		return ret;
+
+	if (ret)
+		ret = scp_add_single_core(pdev);
+	else
+		ret = scp_add_multi_core(pdev);
+
+	return ret;
+}
+
 static int scp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1021,6 +1117,10 @@ static int scp_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&scp_cluster->mtk_scp_list);
 	platform_set_drvdata(pdev, scp_cluster);
 
+	ret = devm_of_platform_populate(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to populate platform devices\n");
+
 	ret = scp_cluster_init(pdev);
 	if (ret)
 		return ret;
@@ -1114,12 +1214,19 @@ static const struct mtk_scp_of_data mt8195_of_data_c1 = {
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


