Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31517C04A94
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jul 2023 02:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gCXptct4zh+YQA4m9nWJVUuUtokpQ+rir1ZuA1N23OY=; b=dJnfjyRWi69U3IPprcNQJOBfjk
	mIzRoBydbkbKTEAzsjErzXjylwLkAyiWN2A9WtX7cuFoPqUkX9s9JnDI5s4M5a6M4pxdpjncT1clq
	FXdAgAFFrmJ4WdnIMwUdR/tFGBhjpgc+B95rlgFzBtU4HzbDCLqOVwBKKFWJ1czICI76fX7FG+EcQ
	Gdu6y9OagYrI4WgrAXkhLFtN+EhvOaLiNUCVBqg5chAXQl2wGCHELHbdRJxnJgQi8E1YGToYQIbfb
	ZqozTsUN3aagkC/zgexXmWB7Z8+BCKK8iAu1Io/xC1ZuHHTGOVZCWeCTU/kuUdsuhL+u3l8IElshS
	Ajo5ffkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPDOp-001KBW-05;
	Fri, 28 Jul 2023 02:40:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPDOm-001KAI-1B;
	Fri, 28 Jul 2023 02:40:13 +0000
X-UUID: 0f74b1e02cf011ee912e1518a6540028-20230727
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=gCXptct4zh+YQA4m9nWJVUuUtokpQ+rir1ZuA1N23OY=;
	b=PLAWtdO1xzyPlYEHc6C0f4Vg7KcYYCZ2Rni+Nxbb5s95Z9stuAeuBh0VYad8lXpsFiPYybkj8fwoQvFWzQExd72r33G9zDII9tU/xSgw9feLaynymEiSH+9exMcTgR8dtYSCIwsfKyD5XfFcm18OClPwd7YxlFUD+9mavAL4/ng=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:603fedf7-fede-49cc-b60b-85f4c09580bd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.30,REQID:603fedf7-fede-49cc-b60b-85f4c09580bd,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:1fcc6f8,CLOUDID:0f036ad2-cd77-4e67-bbfd-aa4eaace762f,B
	ulkID:2307281040073XG845NG,BulkQuantity:0,Recheck:0,SF:19|48|38|29|28|17,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,
	TF_CID_SPAM_ASC
X-UUID: 0f74b1e02cf011ee912e1518a6540028-20230727
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 286458563; Thu, 27 Jul 2023 19:40:05 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 28 Jul 2023 10:40:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 28 Jul 2023 10:40:02 +0800
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
Subject: [PATCH v16 09/14] remoteproc: mediatek: Remove dependency of MT8195 SCP L2TCM power control on dual-core SCP
Date: Fri, 28 Jul 2023 10:39:54 +0800
Message-ID: <20230728023959.12293-10-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230728023959.12293-1-tinghan.shen@mediatek.com>
References: <20230728023959.12293-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_194012_412980_9C1A9FED 
X-CRM114-Status: GOOD (  17.52  )
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
between both cores, enabling support for arbitrary boot order.

The flow for controlling L2TCM power has been incorporated into the
mt8195_scp_before_load() and mt8195_scp_stop() APIs, which are
respectively invoked during the rproc->ops->start() and
rproc->ops->stop() operations. These APIs effectively serve the same
purpose as the rproc prepare()/unprepare() APIs."

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 drivers/remoteproc/mtk_common.h |  3 ++
 drivers/remoteproc/mtk_scp.c    | 71 ++++++++++++++++++++++++++-------
 2 files changed, 59 insertions(+), 15 deletions(-)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index 1438159ae736..fea05bbba9aa 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -106,6 +106,9 @@ struct mtk_scp_of_cluster {
 	size_t l1tcm_size;
 	phys_addr_t l1tcm_phys;
 	struct list_head mtk_scp_list;
+	/* Prevent concurrent operations of this structure and L2TCM power control. */
+	struct mutex cluster_lock;
+	u32 l2tcm_refcnt;
 };
 
 struct mtk_scp {
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index d9242c3eb0d7..d0a44f82579e 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -454,19 +454,37 @@ static int mt8192_scp_before_load(struct mtk_scp *scp)
 	return 0;
 }
 
-static int mt8195_scp_before_load(struct mtk_scp *scp)
+static int mt8195_scp_l2tcm_on(struct mtk_scp *scp)
 {
-	/* clear SPM interrupt, SCP2SPM_IPC_CLR */
-	writel(0xff, scp->cluster->reg_base + MT8192_SCP2SPM_IPC_CLR);
+	struct mtk_scp_of_cluster *scp_cluster = scp->cluster;
+
+	mutex_lock(&scp_cluster->cluster_lock);
+
+	if (scp_cluster->l2tcm_refcnt == 0) {
+		/* clear SPM interrupt, SCP2SPM_IPC_CLR */
+		writel(0xff, scp->cluster->reg_base + MT8192_SCP2SPM_IPC_CLR);
+
+		/* Power on L2TCM */
+		scp_sram_power_on(scp->cluster->reg_base + MT8192_L2TCM_SRAM_PD_0, 0);
+		scp_sram_power_on(scp->cluster->reg_base + MT8192_L2TCM_SRAM_PD_1, 0);
+		scp_sram_power_on(scp->cluster->reg_base + MT8192_L2TCM_SRAM_PD_2, 0);
+		scp_sram_power_on(scp->cluster->reg_base + MT8192_L1TCM_SRAM_PDN,
+				  MT8195_L1TCM_SRAM_PDN_RESERVED_RSI_BITS);
+	}
+
+	scp_cluster->l2tcm_refcnt += 1;
 
+	mutex_unlock(&scp_cluster->cluster_lock);
+
+	return 0;
+}
+
+static int mt8195_scp_before_load(struct mtk_scp *scp)
+{
 	writel(1, scp->cluster->reg_base + MT8192_CORE0_SW_RSTN_SET);
 
-	/* enable SRAM clock */
-	scp_sram_power_on(scp->cluster->reg_base + MT8192_L2TCM_SRAM_PD_0, 0);
-	scp_sram_power_on(scp->cluster->reg_base + MT8192_L2TCM_SRAM_PD_1, 0);
-	scp_sram_power_on(scp->cluster->reg_base + MT8192_L2TCM_SRAM_PD_2, 0);
-	scp_sram_power_on(scp->cluster->reg_base + MT8192_L1TCM_SRAM_PDN,
-			  MT8195_L1TCM_SRAM_PDN_RESERVED_RSI_BITS);
+	mt8195_scp_l2tcm_on(scp);
+
 	scp_sram_power_on(scp->cluster->reg_base + MT8192_CPU0_SRAM_PD, 0);
 
 	/* enable MPU for all memory regions */
@@ -479,6 +497,8 @@ static int mt8195_scp_c1_before_load(struct mtk_scp *scp)
 {
 	scp->data->scp_reset_assert(scp);
 
+	mt8195_scp_l2tcm_on(scp);
+
 	scp_sram_power_on(scp->cluster->reg_base + MT8195_CPU1_SRAM_PD, 0);
 
 	/* enable MPU for all memory regions */
@@ -645,14 +665,31 @@ static void mt8192_scp_stop(struct mtk_scp *scp)
 	writel(0, scp->cluster->reg_base + MT8192_CORE0_WDT_CFG);
 }
 
+static void mt8195_scp_l2tcm_off(struct mtk_scp *scp)
+{
+	struct mtk_scp_of_cluster *scp_cluster = scp->cluster;
+
+	mutex_lock(&scp_cluster->cluster_lock);
+
+	if (scp_cluster->l2tcm_refcnt > 0)
+		scp_cluster->l2tcm_refcnt -= 1;
+
+	if (scp_cluster->l2tcm_refcnt == 0) {
+		/* Power off L2TCM */
+		scp_sram_power_off(scp->cluster->reg_base + MT8192_L2TCM_SRAM_PD_0, 0);
+		scp_sram_power_off(scp->cluster->reg_base + MT8192_L2TCM_SRAM_PD_1, 0);
+		scp_sram_power_off(scp->cluster->reg_base + MT8192_L2TCM_SRAM_PD_2, 0);
+		scp_sram_power_off(scp->cluster->reg_base + MT8192_L1TCM_SRAM_PDN,
+				   MT8195_L1TCM_SRAM_PDN_RESERVED_RSI_BITS);
+	}
+
+	mutex_unlock(&scp_cluster->cluster_lock);
+}
+
 static void mt8195_scp_stop(struct mtk_scp *scp)
 {
-	/* Disable SRAM clock */
-	scp_sram_power_off(scp->cluster->reg_base + MT8192_L2TCM_SRAM_PD_0, 0);
-	scp_sram_power_off(scp->cluster->reg_base + MT8192_L2TCM_SRAM_PD_1, 0);
-	scp_sram_power_off(scp->cluster->reg_base + MT8192_L2TCM_SRAM_PD_2, 0);
-	scp_sram_power_off(scp->cluster->reg_base + MT8192_L1TCM_SRAM_PDN,
-			   MT8195_L1TCM_SRAM_PDN_RESERVED_RSI_BITS);
+	mt8195_scp_l2tcm_off(scp);
+
 	scp_sram_power_off(scp->cluster->reg_base + MT8192_CPU0_SRAM_PD, 0);
 
 	/* Disable SCP watchdog */
@@ -661,6 +698,8 @@ static void mt8195_scp_stop(struct mtk_scp *scp)
 
 static void mt8195_scp_c1_stop(struct mtk_scp *scp)
 {
+	mt8195_scp_l2tcm_off(scp);
+
 	/* Power off CPU SRAM */
 	scp_sram_power_off(scp->cluster->reg_base + MT8195_CPU1_SRAM_PD, 0);
 
@@ -1103,6 +1142,7 @@ static int scp_probe(struct platform_device *pdev)
 	}
 
 	INIT_LIST_HEAD(&scp_cluster->mtk_scp_list);
+	mutex_init(&scp_cluster->cluster_lock);
 
 	ret = devm_of_platform_populate(dev);
 	if (ret)
@@ -1126,6 +1166,7 @@ static void scp_remove(struct platform_device *pdev)
 		rproc_del(scp->rproc);
 		scp_free(scp);
 	}
+	mutex_destroy(&scp_cluster->cluster_lock);
 }
 
 static const struct mtk_scp_of_data mt8183_of_data = {
-- 
2.18.0


