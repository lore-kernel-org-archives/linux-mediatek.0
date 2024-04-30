Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1419FC4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Apr 2024 01:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LLxRYIdG4byeUe7YRvcdsF59Il5GpB4WXpeCVA8AlCw=; b=cbdfyhoBbpizvhuSV85mKOMOhh
	+DrSGfktDsAN4NaadbiT3msU5/HeEK73ZbdIM8/LxamMSlWQy8kpetkkqkYnnQaRRFqDyHpyOYrfA
	z/TN1V2e93X61bDuRQmAtehdTlS0RnW5U1y7haXnYt4nX98PSN1sIZNWAL2RYVUUankMgVMmMNw6o
	uH7ISzAm0ZlyWRHL4G9/76m9OXasCF79JzX8fwxhBylCa9pUnHFrpkc/jNuOjIRwkWyj8t6tzGZzW
	yWwChoFv4B/4/jib0XgW9nPpuPrsmbcqNXvJ8uQHKtFcTuwAjPuBKmDW6+f0BBWvK8hWd43GowLvF
	dnUP25WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1c6G-00000004eG1-48du;
	Tue, 30 Apr 2024 01:16:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1c6D-00000004eEn-249P;
	Tue, 30 Apr 2024 01:16:02 +0000
X-UUID: 3126db28068f11ef9a78ddf43a9225dc-20240429
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=LLxRYIdG4byeUe7YRvcdsF59Il5GpB4WXpeCVA8AlCw=;
	b=fsTwDCUxgLx+k/2c4g7IyTHHNO+wvvmZVfYRj5STmE+SCLZFEysxU8NshiufA61d1xwy/Dr/EKz7OjvEYIKN3a76vf4oGW/4s6+hRcybSRMB98AYVdVIAi47tKDVGFqhhZAAuAJG2vAInhnhQVDnPsazhcaQsSdkD3fbzuHabmY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:a25404b0-c8c6-4bbe-9d16-4843e273fa5f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:82c5f88,CLOUDID:458ec386-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3126db28068f11ef9a78ddf43a9225dc-20240429
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <olivia.wen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1162475646; Mon, 29 Apr 2024 18:15:54 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 30 Apr 2024 09:15:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 30 Apr 2024 09:15:49 +0800
From: Olivia Wen <olivia.wen@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Tinghan Shen" <tinghan.shen@mediatek.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jason-ch.chen@mediatek.com>, <yaya.chang@mediatek.com>,
	<teddy.chen@mediatek.com>, <olivia.wen@mediatek.com>
Subject: [PATCH v4 2/4] remoteproc: mediatek: Support MT8188 SCP core 1
Date: Tue, 30 Apr 2024 09:15:32 +0800
Message-ID: <20240430011534.9587-3-olivia.wen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240430011534.9587-1-olivia.wen@mediatek.com>
References: <20240430011534.9587-1-olivia.wen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.919300-8.000000
X-TMASE-MatchedRID: MdQd6M758ujA2FXaM/gH8E3dRRsh/h6y6SXuwUgGH0j3dSKTMI31W/lY
	oV6p/cSxuPvdHZpPmaOaRqQaraDVcjeE3zHLyrsydOc7KAdVCk5Tes6dDCWUQ4KwF4K/wIz99sL
	viz6Gl1ecFASjLMO2zQgL/TDRGMDcG0yKTPD74mqTeuX4xo2DEIv8pidhVYOUnp9KgXcu34wRy3
	BVXCm1C6NoxI2frqLdPN27mbxf14+XBXaJoB9JZxRFJJyf5BJe3QfwsVk0UbvqwGfCk7KUsyfs0
	2t08IjS3M0GZz5gDcRdtAIV4YXNu5OSZq71EnrMDneun1xU7iYnBY2r6XT25JKCoKTfF32CQTmu
	zLWwn/KRWPCQLnhyxRdGg+ZY7eN6THB2Q+oKru8MTI34nyF36MJL1aANdU8KftwZ3X11IV0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.919300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 4203BB1A8283231480809987BC0415326B0074C013B16881C4EEA3844764019C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_181601_569729_94DC112C 
X-CRM114-Status: GOOD (  18.66  )
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

MT8188 SCP has two RISC-V cores which is similar to MT8195 but without
L1TCM. We've added MT8188-specific functions to configure L1TCM in
multicore setups.

Signed-off-by: Olivia Wen <olivia.wen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/remoteproc/mtk_scp.c | 146 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 143 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 6751829..6295148 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -471,6 +471,86 @@ static int mt8186_scp_before_load(struct mtk_scp *scp)
 	return 0;
 }
 
+static int mt8188_scp_l2tcm_on(struct mtk_scp *scp)
+{
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
+		scp_sram_power_on(scp->cluster->reg_base + MT8192_L1TCM_SRAM_PDN, 0);
+	}
+
+	scp_cluster->l2tcm_refcnt += 1;
+
+	mutex_unlock(&scp_cluster->cluster_lock);
+
+	return 0;
+}
+
+static int mt8188_scp_before_load(struct mtk_scp *scp)
+{
+	writel(1, scp->cluster->reg_base + MT8192_CORE0_SW_RSTN_SET);
+
+	mt8188_scp_l2tcm_on(scp);
+
+	scp_sram_power_on(scp->cluster->reg_base + MT8192_CPU0_SRAM_PD, 0);
+
+	/* enable MPU for all memory regions */
+	writel(0xff, scp->cluster->reg_base + MT8192_CORE0_MEM_ATT_PREDEF);
+
+	return 0;
+}
+
+static int mt8188_scp_c1_before_load(struct mtk_scp *scp)
+{
+	u32 sec_ctrl;
+	struct mtk_scp *scp_c0;
+	struct mtk_scp_of_cluster *scp_cluster = scp->cluster;
+
+	scp->data->scp_reset_assert(scp);
+
+	mt8188_scp_l2tcm_on(scp);
+
+	scp_sram_power_on(scp->cluster->reg_base + MT8195_CPU1_SRAM_PD, 0);
+
+	/* enable MPU for all memory regions */
+	writel(0xff, scp->cluster->reg_base + MT8195_CORE1_MEM_ATT_PREDEF);
+
+	/*
+	 * The L2TCM_OFFSET_RANGE and L2TCM_OFFSET shift the destination address
+	 * on SRAM when SCP core 1 accesses SRAM.
+	 *
+	 * This configuration solves booting the SCP core 0 and core 1 from
+	 * different SRAM address because core 0 and core 1 both boot from
+	 * the head of SRAM by default. this must be configured before boot SCP core 1.
+	 *
+	 * The value of L2TCM_OFFSET_RANGE is from the viewpoint of SCP core 1.
+	 * When SCP core 1 issues address within the range (L2TCM_OFFSET_RANGE),
+	 * the address will be added with a fixed offset (L2TCM_OFFSET) on the bus.
+	 * The shift action is tranparent to software.
+	 */
+	writel(0, scp->cluster->reg_base + MT8195_L2TCM_OFFSET_RANGE_0_LOW);
+	writel(scp->sram_size, scp->cluster->reg_base + MT8195_L2TCM_OFFSET_RANGE_0_HIGH);
+
+	scp_c0 = list_first_entry(&scp_cluster->mtk_scp_list, struct mtk_scp, elem);
+	writel(scp->sram_phys - scp_c0->sram_phys, scp->cluster->reg_base + MT8195_L2TCM_OFFSET);
+
+	/* enable SRAM offset when fetching instruction and data */
+	sec_ctrl = readl(scp->cluster->reg_base + MT8195_SEC_CTRL);
+	sec_ctrl |= MT8195_CORE_OFFSET_ENABLE_I | MT8195_CORE_OFFSET_ENABLE_D;
+	writel(sec_ctrl, scp->cluster->reg_base + MT8195_SEC_CTRL);
+
+	return 0;
+}
+
 static int mt8192_scp_before_load(struct mtk_scp *scp)
 {
 	/* clear SPM interrupt, SCP2SPM_IPC_CLR */
@@ -717,6 +797,47 @@ static void mt8183_scp_stop(struct mtk_scp *scp)
 	writel(0, scp->cluster->reg_base + MT8183_WDT_CFG);
 }
 
+static void mt8188_scp_l2tcm_off(struct mtk_scp *scp)
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
+		scp_sram_power_off(scp->cluster->reg_base + MT8192_L1TCM_SRAM_PDN, 0);
+	}
+
+	mutex_unlock(&scp_cluster->cluster_lock);
+}
+
+static void mt8188_scp_stop(struct mtk_scp *scp)
+{
+	mt8188_scp_l2tcm_off(scp);
+
+	scp_sram_power_off(scp->cluster->reg_base + MT8192_CPU0_SRAM_PD, 0);
+
+	/* Disable SCP watchdog */
+	writel(0, scp->cluster->reg_base + MT8192_CORE0_WDT_CFG);
+}
+
+static void mt8188_scp_c1_stop(struct mtk_scp *scp)
+{
+	mt8188_scp_l2tcm_off(scp);
+
+	/* Power off CPU SRAM */
+	scp_sram_power_off(scp->cluster->reg_base + MT8195_CPU1_SRAM_PD, 0);
+
+	/* Disable SCP watchdog */
+	writel(0, scp->cluster->reg_base + MT8195_CORE1_WDT_CFG);
+}
+
 static void mt8192_scp_stop(struct mtk_scp *scp)
 {
 	/* Disable SRAM clock */
@@ -1264,16 +1385,28 @@ static const struct mtk_scp_of_data mt8186_of_data = {
 
 static const struct mtk_scp_of_data mt8188_of_data = {
 	.scp_clk_get = mt8195_scp_clk_get,
-	.scp_before_load = mt8192_scp_before_load,
-	.scp_irq_handler = mt8192_scp_irq_handler,
+	.scp_before_load = mt8188_scp_before_load,
+	.scp_irq_handler = mt8195_scp_irq_handler,
 	.scp_reset_assert = mt8192_scp_reset_assert,
 	.scp_reset_deassert = mt8192_scp_reset_deassert,
-	.scp_stop = mt8192_scp_stop,
+	.scp_stop = mt8188_scp_stop,
 	.scp_da_to_va = mt8192_scp_da_to_va,
 	.host_to_scp_reg = MT8192_GIPC_IN_SET,
 	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
 };
 
+static const struct mtk_scp_of_data mt8188_of_data_c1 = {
+	.scp_clk_get = mt8195_scp_clk_get,
+	.scp_before_load = mt8188_scp_c1_before_load,
+	.scp_irq_handler = mt8195_scp_c1_irq_handler,
+	.scp_reset_assert = mt8195_scp_c1_reset_assert,
+	.scp_reset_deassert = mt8195_scp_c1_reset_deassert,
+	.scp_stop = mt8188_scp_c1_stop,
+	.scp_da_to_va = mt8192_scp_da_to_va,
+	.host_to_scp_reg = MT8192_GIPC_IN_SET,
+	.host_to_scp_int_bit = MT8195_CORE1_HOST_IPC_INT_BIT,
+};
+
 static const struct mtk_scp_of_data mt8192_of_data = {
 	.scp_clk_get = mt8192_scp_clk_get,
 	.scp_before_load = mt8192_scp_before_load,
@@ -1310,6 +1443,12 @@ static const struct mtk_scp_of_data mt8195_of_data_c1 = {
 	.host_to_scp_int_bit = MT8195_CORE1_HOST_IPC_INT_BIT,
 };
 
+static const struct mtk_scp_of_data *mt8188_of_data_cores[] = {
+	&mt8188_of_data,
+	&mt8188_of_data_c1,
+	NULL
+};
+
 static const struct mtk_scp_of_data *mt8195_of_data_cores[] = {
 	&mt8195_of_data,
 	&mt8195_of_data_c1,
@@ -1320,6 +1459,7 @@ static const struct of_device_id mtk_scp_of_match[] = {
 	{ .compatible = "mediatek,mt8183-scp", .data = &mt8183_of_data },
 	{ .compatible = "mediatek,mt8186-scp", .data = &mt8186_of_data },
 	{ .compatible = "mediatek,mt8188-scp", .data = &mt8188_of_data },
+	{ .compatible = "mediatek,mt8188-scp-dual", .data = &mt8188_of_data_cores },
 	{ .compatible = "mediatek,mt8192-scp", .data = &mt8192_of_data },
 	{ .compatible = "mediatek,mt8195-scp", .data = &mt8195_of_data },
 	{ .compatible = "mediatek,mt8195-scp-dual", .data = &mt8195_of_data_cores },
-- 
2.6.4


