Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D63D5C0015E
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jul 2023 05:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D1lXYdyfOfRoaAcdJsP+/taOV2FLC2+fVs+lIM1Csuw=; b=cGKBOZfSVtLOioLTAtaPA0/S8W
	6pbXAINvGsYmhYcr/ZO+uwJLTlhrdWPd47w49UC2MVl9/faIXl0sp//YL5qQXlFS6r9L8SscqwDoI
	Per61yPZaHR2plliiiguSu633QdZRwkXiGu8bvTwUsiKYAq7KwTbremSDHNvQZxLyo6M/sw7R7eNv
	GUM+R8aJmJGL+/t/W7mvVAK5v7HMpcOuBDYVHSef15GNRdjrDGtFlyC7Gf2ohzCCeV1EYkUZrSQM3
	iLB0earUxbWGzUkZpoH4nb6nSmbbyWiBpSOb6jOesxHAC7NmZb/Glz+Rf8sz56prtxdFx6sh2OrxT
	jXwbZvXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHdzC-003bVn-2g;
	Fri, 07 Jul 2023 05:26:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHdz7-003bTE-0N;
	Fri, 07 Jul 2023 05:26:27 +0000
X-UUID: cca31d6c1c8611ee912e1518a6540028-20230706
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=D1lXYdyfOfRoaAcdJsP+/taOV2FLC2+fVs+lIM1Csuw=;
	b=Bz+j3YXqag27mf/JBj8XOhH5nAMUaYReRNt8phFWvkyYX871IqGsDUT47QFW2K8enKjZrAgDu9vz7hLX5pz8DiuuXUbjyRLymxlmlfdhdw973YS3nobEM+uakI+aVToznrOYg9WIIxaDp06x570AUJqSNMma3yfm6e2OCVr595s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27,REQID:6f14f3b8-304d-4612-b512-6565ced82bc8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.27,REQID:6f14f3b8-304d-4612-b512-6565ced82bc8,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:01c9525,CLOUDID:f06caa0d-26a8-467f-b838-f99719a9c083,B
	ulkID:230707132618O7AK9AKJ,BulkQuantity:1,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,
	TF_CID_SPAM_ASC
X-UUID: cca31d6c1c8611ee912e1518a6540028-20230706
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 350421132; Thu, 06 Jul 2023 22:26:17 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 7 Jul 2023 13:26:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 7 Jul 2023 13:26:15 +0800
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
Subject: [PATCH v14 07/12] remoteproc: mediatek: Remove dependency of MT8195 SCP L2TCM power control on dual-core SCP
Date: Fri, 7 Jul 2023 13:26:07 +0800
Message-ID: <20230707052612.27521-8-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230707052612.27521-1-tinghan.shen@mediatek.com>
References: <20230707052612.27521-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_222625_154341_3A3DEA01 
X-CRM114-Status: GOOD (  18.96  )
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

Previously, SCP core 0 controlled the power of L2TCM and dictated that
SCP core 1 could only boot after SCP core 0. To address this constraint,
extracted the power control flow of L2TCM and made it shared
between both cores, enabling support of arbitrary boot order.

The flow for controlling L2TCM power has been incorporated into the
mt8195_scp_before_load() and mt8195_scp_stop() APIs, which are
respectively invoked during the rproc->ops->start() and
rproc->ops->stop() operations. These APIs effectively serve the same
purpose as the rproc prepare()/unprepare() APIs."

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 drivers/remoteproc/mtk_common.h |  1 +
 drivers/remoteproc/mtk_scp.c    | 80 ++++++++++++++++++++++++++-------
 2 files changed, 66 insertions(+), 15 deletions(-)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index 56395e8664cb..41e1b4732b75 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -130,6 +130,7 @@ struct mtk_scp {
 	struct rproc_subdev *rpmsg_subdev;
 
 	struct list_head elem;
+	struct platform_device *cluster_pdev;
 };
 
 /**
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 3349488e5f21..94602272c05f 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -29,6 +29,10 @@ struct mtk_scp_of_cluster {
 	size_t l1tcm_size;
 	phys_addr_t l1tcm_phys;
 	struct list_head mtk_scp_list;
+
+	/* Prevent concurrent operations of L2TCM power control. */
+	struct mutex l2tcm_lock;
+	u32 l2tcm_refcnt;
 };
 
 /**
@@ -449,7 +453,7 @@ static int mt8192_scp_before_load(struct mtk_scp *scp)
 
 	writel(1, scp->reg_base + MT8192_CORE0_SW_RSTN_SET);
 
-	/* enable SRAM clock */
+	/* enable SRAM power */
 	scp_sram_power_on(scp->reg_base + MT8192_L2TCM_SRAM_PD_0, 0);
 	scp_sram_power_on(scp->reg_base + MT8192_L2TCM_SRAM_PD_1, 0);
 	scp_sram_power_on(scp->reg_base + MT8192_L2TCM_SRAM_PD_2, 0);
@@ -462,19 +466,38 @@ static int mt8192_scp_before_load(struct mtk_scp *scp)
 	return 0;
 }
 
-static int mt8195_scp_before_load(struct mtk_scp *scp)
+static int mt8195_scp_l2tcm_on(struct mtk_scp *scp)
 {
-	/* clear SPM interrupt, SCP2SPM_IPC_CLR */
-	writel(0xff, scp->reg_base + MT8192_SCP2SPM_IPC_CLR);
+	struct mtk_scp_of_cluster *scp_cluster = platform_get_drvdata(scp->cluster_pdev);
+
+	mutex_lock(&scp_cluster->l2tcm_lock);
+
+	if (scp_cluster->l2tcm_refcnt == 0) {
+		/* clear SPM interrupt, SCP2SPM_IPC_CLR */
+		writel(0xff, scp->reg_base + MT8192_SCP2SPM_IPC_CLR);
+
+		/* Power on L2TCM */
+		scp_sram_power_on(scp->reg_base + MT8192_L2TCM_SRAM_PD_0, 0);
+		scp_sram_power_on(scp->reg_base + MT8192_L2TCM_SRAM_PD_1, 0);
+		scp_sram_power_on(scp->reg_base + MT8192_L2TCM_SRAM_PD_2, 0);
+		scp_sram_power_on(scp->reg_base + MT8192_L1TCM_SRAM_PDN,
+				  MT8195_L1TCM_SRAM_PDN_RESERVED_RSI_BITS);
+	}
+
+	scp_cluster->l2tcm_refcnt += 1;
 
+	mutex_unlock(&scp_cluster->l2tcm_lock);
+
+	return 0;
+}
+
+static int mt8195_scp_before_load(struct mtk_scp *scp)
+{
 	writel(1, scp->reg_base + MT8192_CORE0_SW_RSTN_SET);
 
+	mt8195_scp_l2tcm_on(scp);
+
 	/* enable SRAM clock */
-	scp_sram_power_on(scp->reg_base + MT8192_L2TCM_SRAM_PD_0, 0);
-	scp_sram_power_on(scp->reg_base + MT8192_L2TCM_SRAM_PD_1, 0);
-	scp_sram_power_on(scp->reg_base + MT8192_L2TCM_SRAM_PD_2, 0);
-	scp_sram_power_on(scp->reg_base + MT8192_L1TCM_SRAM_PDN,
-			  MT8195_L1TCM_SRAM_PDN_RESERVED_RSI_BITS);
 	scp_sram_power_on(scp->reg_base + MT8192_CPU0_SRAM_PD, 0);
 
 	/* enable MPU for all memory regions */
@@ -487,6 +510,8 @@ static int mt8195_scp_c1_before_load(struct mtk_scp *scp)
 {
 	scp->data->scp_reset_assert(scp);
 
+	mt8195_scp_l2tcm_on(scp);
+
 	scp_sram_power_on(scp->reg_base + MT8195_CPU1_SRAM_PD, 0);
 
 	/* enable MPU for all memory regions */
@@ -653,14 +678,30 @@ static void mt8192_scp_stop(struct mtk_scp *scp)
 	writel(0, scp->reg_base + MT8192_CORE0_WDT_CFG);
 }
 
+static void mt8195_scp_l2tcm_off(struct mtk_scp *scp)
+{
+	struct mtk_scp_of_cluster *scp_cluster = platform_get_drvdata(scp->cluster_pdev);
+
+	mutex_lock(&scp_cluster->l2tcm_lock);
+
+	scp_cluster->l2tcm_refcnt -= 1;
+
+	if (scp_cluster->l2tcm_refcnt == 0) {
+		/* Power off L2TCM */
+		scp_sram_power_off(scp->reg_base + MT8192_L2TCM_SRAM_PD_0, 0);
+		scp_sram_power_off(scp->reg_base + MT8192_L2TCM_SRAM_PD_1, 0);
+		scp_sram_power_off(scp->reg_base + MT8192_L2TCM_SRAM_PD_2, 0);
+		scp_sram_power_off(scp->reg_base + MT8192_L1TCM_SRAM_PDN, 0);
+		scp_sram_power_off(scp->reg_base + MT8192_CPU0_SRAM_PD, 0);
+	}
+
+	mutex_unlock(&scp_cluster->l2tcm_lock);
+}
+
 static void mt8195_scp_stop(struct mtk_scp *scp)
 {
-	/* Disable SRAM clock */
-	scp_sram_power_off(scp->reg_base + MT8192_L2TCM_SRAM_PD_0, 0);
-	scp_sram_power_off(scp->reg_base + MT8192_L2TCM_SRAM_PD_1, 0);
-	scp_sram_power_off(scp->reg_base + MT8192_L2TCM_SRAM_PD_2, 0);
-	scp_sram_power_off(scp->reg_base + MT8192_L1TCM_SRAM_PDN,
-			   MT8195_L1TCM_SRAM_PDN_RESERVED_RSI_BITS);
+	mt8195_scp_l2tcm_off(scp);
+
 	scp_sram_power_off(scp->reg_base + MT8192_CPU0_SRAM_PD, 0);
 
 	/* Disable SCP watchdog */
@@ -669,6 +710,8 @@ static void mt8195_scp_stop(struct mtk_scp *scp)
 
 static void mt8195_scp_c1_stop(struct mtk_scp *scp)
 {
+	mt8195_scp_l2tcm_off(scp);
+
 	/* Power off CPU SRAM */
 	scp_sram_power_off(scp->reg_base + MT8195_CPU1_SRAM_PD, 0);
 
@@ -976,6 +1019,8 @@ static int scp_add_single_core(struct platform_device *pdev)
 	if (IS_ERR(scp))
 		return PTR_ERR(scp);
 
+	scp->cluster_pdev = pdev;
+
 	ret = rproc_add(scp->rproc);
 	if (ret) {
 		dev_err(dev, "Failed to add rproc\n");
@@ -1028,6 +1073,8 @@ static int scp_add_multi_core(struct platform_device *pdev)
 			goto init_fail;
 		}
 
+		scp->cluster_pdev = pdev;
+
 		ret = rproc_add(scp->rproc);
 		if (ret) {
 			dev_err(dev, "Failed to add rproc of core %d\n", core_id);
@@ -1114,6 +1161,7 @@ static int scp_probe(struct platform_device *pdev)
 	}
 
 	INIT_LIST_HEAD(&scp_cluster->mtk_scp_list);
+	mutex_init(&scp_cluster->l2tcm_lock);
 	platform_set_drvdata(pdev, scp_cluster);
 
 	ret = devm_of_platform_populate(dev);
@@ -1137,6 +1185,8 @@ static void scp_remove(struct platform_device *pdev)
 		rproc_del(scp->rproc);
 		scp_free(scp);
 	}
+
+	mutex_destroy(&scp_cluster->l2tcm_lock);
 }
 
 static const struct mtk_scp_of_data mt8183_of_data = {
-- 
2.18.0


