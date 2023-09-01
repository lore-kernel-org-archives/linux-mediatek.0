Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF2ECA0FE1
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Sep 2023 08:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E1I4y94JpFrj/cyXGPiYmWNT42ZTv2aJPznnViXrh1Y=; b=EvUcv55C+xygXCgKJWq3XsGvCu
	IQOVb9kJHxU9cfLcxn8rUP79YBe+7jz3pPG9woAEpvBWrNVW7RRSP7D42c6+660HW88New9GZYRG0
	wGsfYJd5+uHC9gZ1PiOYQk4fllY/5+8kqYjXTVKYRfx8rdbmFG1dSA5ygmBaSnl5uggPY2EG31M37
	YauZH2ioPmTm6rYclyGclcjm50/1aEMmWw7dDDUA0Ma/hZcHKkqwmjbSBXFTI2y9kSSrw20Is9fZy
	M4dYfbdxFyagNSkVIVpPajYXA8gXLvC+iLvMx/6cLcWDOAlncJkxWJq6bImhIaVppvmuflpPj+RdV
	us0cmc8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbzFC-00GfFR-2W;
	Fri, 01 Sep 2023 08:11:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbzF8-00GfD4-20;
	Fri, 01 Sep 2023 08:11:04 +0000
X-UUID: 13dd50d2489f11ee9b7791016c24628a-20230901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=E1I4y94JpFrj/cyXGPiYmWNT42ZTv2aJPznnViXrh1Y=;
	b=EgL6K11Y4tnOzUQeeyyzaJLIX2709x6Axwi2nf+BJzz6TSsC5XQQ8h/qayGwb04Nm+l4iow++F+ypJWOd7PHZrTat5vJCUpcUOYP5iSjjEh5tEkA3MgHID6SYXIKRpvWBiZgTCnLRUyjvBOHlr68NRTG8L+IZuiHy67iMWPRh2w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:ade45ad1-4c13-4ce8-a3a0-20c843b72625,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:926733ef-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 13dd50d2489f11ee9b7791016c24628a-20230901
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1610894827; Fri, 01 Sep 2023 01:10:56 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 1 Sep 2023 16:09:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 1 Sep 2023 16:09:52 +0800
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
Subject: [PATCH v17 07/14] remoteproc: mediatek: Probe SCP cluster on single-core SCP
Date: Fri, 1 Sep 2023 16:09:28 +0800
Message-ID: <20230901080935.14571-8-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230901080935.14571-1-tinghan.shen@mediatek.com>
References: <20230901080935.14571-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_011102_687918_20298296 
X-CRM114-Status: GOOD (  19.40  )
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

This is the 3rd preliminary step for probing multi-core SCP.
Rewrite the probing flow of single-core SCP to adapt with the 'cluster'
concept needed by the multi-core SCP. The SCP core object(s)
is maintained at the cluster list.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 drivers/remoteproc/mtk_common.h |  2 +
 drivers/remoteproc/mtk_scp.c    | 86 +++++++++++++++++++++++----------
 2 files changed, 63 insertions(+), 25 deletions(-)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index b04d71277c1f..1438159ae736 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -105,6 +105,7 @@ struct mtk_scp_of_cluster {
 	void __iomem *l1tcm_base;
 	size_t l1tcm_size;
 	phys_addr_t l1tcm_phys;
+	struct list_head mtk_scp_list;
 };
 
 struct mtk_scp {
@@ -132,6 +133,7 @@ struct mtk_scp {
 
 	struct rproc_subdev *rpmsg_subdev;
 
+	struct list_head elem;
 	struct mtk_scp_of_cluster *cluster;
 };
 
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 7a2ba1e1e95a..d67dcabdab9e 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -854,8 +854,8 @@ static void scp_remove_rpmsg_subdev(struct mtk_scp *scp)
 	}
 }
 
-static int scp_rproc_init(struct platform_device *pdev,
-			  struct mtk_scp_of_cluster *scp_cluster)
+static struct mtk_scp *scp_rproc_init(struct platform_device *pdev,
+				      struct mtk_scp_of_cluster *scp_cluster)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
@@ -867,11 +867,13 @@ static int scp_rproc_init(struct platform_device *pdev,
 
 	ret = rproc_of_parse_firmware(dev, 0, &fw_name);
 	if (ret < 0 && ret != -EINVAL)
-		return ret;
+		return ERR_PTR(ret);
 
 	rproc = devm_rproc_alloc(dev, np->name, &scp_ops, fw_name, sizeof(*scp));
-	if (!rproc)
-		return dev_err_probe(dev, -ENOMEM, "unable to allocate remoteproc\n");
+	if (!rproc) {
+		dev_err(dev, "unable to allocate remoteproc\n");
+		return ERR_PTR(-ENOMEM);
+	}
 
 	scp = rproc->priv;
 	scp->rproc = rproc;
@@ -882,20 +884,21 @@ static int scp_rproc_init(struct platform_device *pdev,
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sram");
 	scp->sram_base = devm_ioremap_resource(dev, res);
-	if (IS_ERR(scp->sram_base))
-		return dev_err_probe(dev, PTR_ERR(scp->sram_base),
-				     "Failed to parse and map sram memory\n");
+	if (IS_ERR(scp->sram_base)) {
+		dev_err(dev, "Failed to parse and map sram memory\n");
+		return ERR_CAST(scp->sram_base);
+	}
 
 	scp->sram_size = resource_size(res);
 	scp->sram_phys = res->start;
 
 	ret = scp->data->scp_clk_get(scp);
 	if (ret)
-		return ret;
+		return ERR_PTR(ret);
 
 	ret = scp_map_memory_region(scp);
 	if (ret)
-		return ret;
+		return ERR_PTR(ret);
 
 	mutex_init(&scp->send_lock);
 	for (i = 0; i < SCP_IPI_MAX; i++)
@@ -922,11 +925,7 @@ static int scp_rproc_init(struct platform_device *pdev,
 		goto remove_subdev;
 	}
 
-	ret = rproc_add(rproc);
-	if (ret)
-		goto remove_subdev;
-
-	return 0;
+	return scp;
 
 remove_subdev:
 	scp_remove_rpmsg_subdev(scp);
@@ -937,7 +936,43 @@ static int scp_rproc_init(struct platform_device *pdev,
 		mutex_destroy(&scp->ipi_desc[i].lock);
 	mutex_destroy(&scp->send_lock);
 
-	return ret;
+	return ERR_PTR(ret);
+}
+
+static void scp_free(struct mtk_scp *scp)
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
+static int scp_cluster_init(struct platform_device *pdev,
+			    struct mtk_scp_of_cluster *scp_cluster)
+{
+	struct device *dev = &pdev->dev;
+	struct list_head *scp_list = &scp_cluster->mtk_scp_list;
+	struct mtk_scp *scp;
+	int ret;
+
+	scp = scp_rproc_init(pdev, scp_cluster);
+	if (IS_ERR(scp))
+		return PTR_ERR(scp);
+
+	ret = rproc_add(scp->rproc);
+	if (ret) {
+		dev_err(dev, "Failed to add rproc\n");
+		scp_free(scp);
+		return ret;
+	}
+
+	list_add_tail(&scp->elem, scp_list);
+
+	return 0;
 }
 
 static int scp_probe(struct platform_device *pdev)
@@ -970,7 +1005,9 @@ static int scp_probe(struct platform_device *pdev)
 		scp_cluster->l1tcm_phys = res->start;
 	}
 
-	ret = scp_rproc_init(pdev, scp_cluster);
+	INIT_LIST_HEAD(&scp_cluster->mtk_scp_list);
+
+	ret = scp_cluster_init(pdev, scp_cluster);
 	if (ret)
 		return ret;
 
@@ -980,15 +1017,14 @@ static int scp_probe(struct platform_device *pdev)
 static void scp_remove(struct platform_device *pdev)
 {
 	struct mtk_scp *scp = platform_get_drvdata(pdev);
-	int i;
+	struct mtk_scp_of_cluster *scp_cluster = scp->cluster;
+	struct mtk_scp *temp;
 
-	rproc_del(scp->rproc);
-	scp_remove_rpmsg_subdev(scp);
-	scp_ipi_unregister(scp, SCP_IPI_INIT);
-	scp_unmap_memory_region(scp);
-	for (i = 0; i < SCP_IPI_MAX; i++)
-		mutex_destroy(&scp->ipi_desc[i].lock);
-	mutex_destroy(&scp->send_lock);
+	list_for_each_entry_safe_reverse(scp, temp, &scp_cluster->mtk_scp_list, elem) {
+		list_del(&scp->elem);
+		rproc_del(scp->rproc);
+		scp_free(scp);
+	}
 }
 
 static const struct mtk_scp_of_data mt8183_of_data = {
-- 
2.18.0


