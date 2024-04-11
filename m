Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E2DCD129A
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 03:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UvMG50Z3NH/sSS5y+Dr9wRb2N8963RLCoZFyqfPOd9k=; b=MeScye6/4cXr5ptBbbUa4kgtiI
	8tiAiWCmoSCSWv1tXquzxbwsrnfGoI9qCrdCFRkj71Qo/72YkoyXda4ZwZ8XjV+igK2Cy0s1YcTfJ
	sBI00W5eYKYLEAJSNKdXY5cl0hANqxwgoE9j+RsA9BWEKe79jvzTp2mdHljI/Z3HFHFPEPonHrgtO
	ytLZhn3Uxr5bppMzsSoS9HP5yA13np1Dxm8m5D4olFv/Kae9SNik2oJgKODHWYO/sLHLXtPDJ1Ujc
	+tQ4HIZ7Mbc/orHDJyb8Ks5fHOS7eSjDXIotrCizVs/R6cjhcIb+p+4eJKKAi1vYpcplJBMs0Oloh
	BWdBLwSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rulGy-0000000ABzx-0lQe;
	Thu, 11 Apr 2024 03:38:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rulGm-0000000ABrr-1our;
	Thu, 11 Apr 2024 03:38:38 +0000
X-UUID: f5a23e64f7b411ee96d5dfc950b7243d-20240410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=UvMG50Z3NH/sSS5y+Dr9wRb2N8963RLCoZFyqfPOd9k=;
	b=QKBn912vvyp1NWRim6rtNs9/aDQCIjrqkkwu2O/9qyRatyTLWEfxtPILqNCSBLKEW0zHW1rg2xgE2BlAKIC/PFw2Dxd16IgyKHXTTwSTg//E8djnOovhEJAEVFrRXcTKxd09KDYWpMGeWQsG4o/SLrFkTB2AStgPVookk3BYUAs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:f5bedc74-cfae-49bf-b903-161dfe9c7f41,IP:0,U
	RL:0,TC:0,Content:-5,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-30
X-CID-META: VersionHash:6f543d0,CLOUDID:1a0e7191-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:1,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f5a23e64f7b411ee96d5dfc950b7243d-20240410
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <olivia.wen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1723307167; Wed, 10 Apr 2024 20:38:28 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 10 Apr 2024 20:37:54 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 11 Apr 2024 11:37:54 +0800
From: olivia.wen <olivia.wen@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Tinghan
 Shen <tinghan.shen@mediatek.com>, <linux-remoteproc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jason-ch.chen@mediatek.com>, <yaya.chang@mediatek.com>,
	<teddy.chen@mediatek.com>, <olivia.wen@mediatek.com>
Subject: [PATCH 2/2] remoteproc: mediatek: Support MT8188 SCP core 1
Date: Thu, 11 Apr 2024 11:37:50 +0800
Message-ID: <20240411033750.6476-3-olivia.wen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240411033750.6476-1-olivia.wen@mediatek.com>
References: <20240411033750.6476-1-olivia.wen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_203836_536823_9F61D53B 
X-CRM114-Status: GOOD (  19.11  )
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

To Support MT8188 SCP core 1 for ISP driver.
The SCP on different chips will require different code sizes
 and IPI buffer sizes based on varying requirements.

Signed-off-by: olivia.wen <olivia.wen@mediatek.com>
---
 drivers/remoteproc/mtk_common.h    |  5 +--
 drivers/remoteproc/mtk_scp.c       | 62 +++++++++++++++++++++++++++++++-------
 drivers/remoteproc/mtk_scp_ipi.c   |  9 ++++--
 include/linux/remoteproc/mtk_scp.h |  1 +
 4 files changed, 62 insertions(+), 15 deletions(-)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index 6d7736a..8f37f65 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -78,7 +78,6 @@
 #define MT8195_L2TCM_OFFSET			0x850d0
 
 #define SCP_FW_VER_LEN			32
-#define SCP_SHARE_BUFFER_SIZE		288
 
 struct scp_run {
 	u32 signaled;
@@ -110,6 +109,8 @@ struct mtk_scp_of_data {
 	u32 host_to_scp_int_bit;
 
 	size_t ipi_buf_offset;
+	u32 ipi_buffer_size;
+	u32 max_code_size;
 };
 
 struct mtk_scp_of_cluster {
@@ -162,7 +163,7 @@ struct mtk_scp {
 struct mtk_share_obj {
 	u32 id;
 	u32 len;
-	u8 share_buf[SCP_SHARE_BUFFER_SIZE];
+	u8 *share_buf;
 };
 
 void scp_memcpy_aligned(void __iomem *dst, const void *src, unsigned int len);
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 6751829..270718d 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -20,7 +20,6 @@
 #include "mtk_common.h"
 #include "remoteproc_internal.h"
 
-#define MAX_CODE_SIZE 0x500000
 #define SECTION_NAME_IPI_BUFFER ".ipi_buffer"
 
 /**
@@ -94,14 +93,14 @@ static void scp_ipi_handler(struct mtk_scp *scp)
 {
 	struct mtk_share_obj __iomem *rcv_obj = scp->recv_buf;
 	struct scp_ipi_desc *ipi_desc = scp->ipi_desc;
-	u8 tmp_data[SCP_SHARE_BUFFER_SIZE];
+	u8 *tmp_data;
 	scp_ipi_handler_t handler;
 	u32 id = readl(&rcv_obj->id);
 	u32 len = readl(&rcv_obj->len);
 
-	if (len > SCP_SHARE_BUFFER_SIZE) {
+	if (len > scp->data->ipi_buffer_size) {
 		dev_err(scp->dev, "ipi message too long (len %d, max %d)", len,
-			SCP_SHARE_BUFFER_SIZE);
+			scp->data->ipi_buffer_size);
 		return;
 	}
 	if (id >= SCP_IPI_MAX) {
@@ -109,6 +108,10 @@ static void scp_ipi_handler(struct mtk_scp *scp)
 		return;
 	}
 
+	tmp_data = kzalloc(len, GFP_KERNEL);
+	if (!tmp_data)
+		return;
+
 	scp_ipi_lock(scp, id);
 	handler = ipi_desc[id].handler;
 	if (!handler) {
@@ -123,6 +126,7 @@ static void scp_ipi_handler(struct mtk_scp *scp)
 
 	scp->ipi_id_ack[id] = true;
 	wake_up(&scp->ack_wq);
+	kfree(tmp_data);
 }
 
 static int scp_elf_read_ipi_buf_addr(struct mtk_scp *scp,
@@ -133,6 +137,7 @@ static int scp_ipi_init(struct mtk_scp *scp, const struct firmware *fw)
 {
 	int ret;
 	size_t buf_sz, offset;
+	size_t share_buf_offset;
 
 	/* read the ipi buf addr from FW itself first */
 	ret = scp_elf_read_ipi_buf_addr(scp, fw, &offset);
@@ -154,10 +159,12 @@ static int scp_ipi_init(struct mtk_scp *scp, const struct firmware *fw)
 
 	scp->recv_buf = (struct mtk_share_obj __iomem *)
 			(scp->sram_base + offset);
+	share_buf_offset = sizeof(scp->recv_buf->id)
+		+ sizeof(scp->recv_buf->len) + scp->data->ipi_buffer_size;
 	scp->send_buf = (struct mtk_share_obj __iomem *)
-			(scp->sram_base + offset + sizeof(*scp->recv_buf));
-	memset_io(scp->recv_buf, 0, sizeof(*scp->recv_buf));
-	memset_io(scp->send_buf, 0, sizeof(*scp->send_buf));
+			(scp->sram_base + offset + share_buf_offset);
+	memset_io(scp->recv_buf, 0, share_buf_offset);
+	memset_io(scp->send_buf, 0, share_buf_offset);
 
 	return 0;
 }
@@ -891,7 +898,7 @@ static int scp_map_memory_region(struct mtk_scp *scp)
 	}
 
 	/* Reserved SCP code size */
-	scp->dram_size = MAX_CODE_SIZE;
+	scp->dram_size = scp->data->max_code_size;
 	scp->cpu_addr = dma_alloc_coherent(scp->dev, scp->dram_size,
 					   &scp->dma_addr, GFP_KERNEL);
 	if (!scp->cpu_addr)
@@ -1247,6 +1254,8 @@ static const struct mtk_scp_of_data mt8183_of_data = {
 	.host_to_scp_reg = MT8183_HOST_TO_SCP,
 	.host_to_scp_int_bit = MT8183_HOST_IPC_INT_BIT,
 	.ipi_buf_offset = 0x7bdb0,
+	.max_code_size = 0x500000,
+	.ipi_buffer_size = 288,
 };
 
 static const struct mtk_scp_of_data mt8186_of_data = {
@@ -1260,18 +1269,22 @@ static const struct mtk_scp_of_data mt8186_of_data = {
 	.host_to_scp_reg = MT8183_HOST_TO_SCP,
 	.host_to_scp_int_bit = MT8183_HOST_IPC_INT_BIT,
 	.ipi_buf_offset = 0x3bdb0,
+	.max_code_size = 0x500000,
+	.ipi_buffer_size = 288,
 };
 
 static const struct mtk_scp_of_data mt8188_of_data = {
 	.scp_clk_get = mt8195_scp_clk_get,
-	.scp_before_load = mt8192_scp_before_load,
-	.scp_irq_handler = mt8192_scp_irq_handler,
+	.scp_before_load = mt8195_scp_before_load,
+	.scp_irq_handler = mt8195_scp_irq_handler,
 	.scp_reset_assert = mt8192_scp_reset_assert,
 	.scp_reset_deassert = mt8192_scp_reset_deassert,
-	.scp_stop = mt8192_scp_stop,
+	.scp_stop = mt8195_scp_stop,
 	.scp_da_to_va = mt8192_scp_da_to_va,
 	.host_to_scp_reg = MT8192_GIPC_IN_SET,
 	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
+	.max_code_size = 0x500000,
+	.ipi_buffer_size = 600,
 };
 
 static const struct mtk_scp_of_data mt8192_of_data = {
@@ -1284,6 +1297,8 @@ static const struct mtk_scp_of_data mt8192_of_data = {
 	.scp_da_to_va = mt8192_scp_da_to_va,
 	.host_to_scp_reg = MT8192_GIPC_IN_SET,
 	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
+	.max_code_size = 0x500000,
+	.ipi_buffer_size = 288,
 };
 
 static const struct mtk_scp_of_data mt8195_of_data = {
@@ -1296,6 +1311,8 @@ static const struct mtk_scp_of_data mt8195_of_data = {
 	.scp_da_to_va = mt8192_scp_da_to_va,
 	.host_to_scp_reg = MT8192_GIPC_IN_SET,
 	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
+	.max_code_size = 0x500000,
+	.ipi_buffer_size = 288,
 };
 
 static const struct mtk_scp_of_data mt8195_of_data_c1 = {
@@ -1308,6 +1325,22 @@ static const struct mtk_scp_of_data mt8195_of_data_c1 = {
 	.scp_da_to_va = mt8192_scp_da_to_va,
 	.host_to_scp_reg = MT8192_GIPC_IN_SET,
 	.host_to_scp_int_bit = MT8195_CORE1_HOST_IPC_INT_BIT,
+	.max_code_size = 0x500000,
+	.ipi_buffer_size = 288,
+};
+
+static const struct mtk_scp_of_data mt8188_of_data_c1 = {
+	.scp_clk_get = mt8195_scp_clk_get,
+	.scp_before_load = mt8195_scp_c1_before_load,
+	.scp_irq_handler = mt8195_scp_c1_irq_handler,
+	.scp_reset_assert = mt8195_scp_c1_reset_assert,
+	.scp_reset_deassert = mt8195_scp_c1_reset_deassert,
+	.scp_stop = mt8195_scp_c1_stop,
+	.scp_da_to_va = mt8192_scp_da_to_va,
+	.host_to_scp_reg = MT8192_GIPC_IN_SET,
+	.host_to_scp_int_bit = MT8195_CORE1_HOST_IPC_INT_BIT,
+	.max_code_size = 0xA00000,
+	.ipi_buffer_size = 600,
 };
 
 static const struct mtk_scp_of_data *mt8195_of_data_cores[] = {
@@ -1316,6 +1349,12 @@ static const struct mtk_scp_of_data *mt8195_of_data_cores[] = {
 	NULL
 };
 
+static const struct mtk_scp_of_data *mt8188_of_data_cores[] = {
+	&mt8188_of_data,
+	&mt8188_of_data_c1,
+	NULL
+};
+
 static const struct of_device_id mtk_scp_of_match[] = {
 	{ .compatible = "mediatek,mt8183-scp", .data = &mt8183_of_data },
 	{ .compatible = "mediatek,mt8186-scp", .data = &mt8186_of_data },
@@ -1323,6 +1362,7 @@ static const struct of_device_id mtk_scp_of_match[] = {
 	{ .compatible = "mediatek,mt8192-scp", .data = &mt8192_of_data },
 	{ .compatible = "mediatek,mt8195-scp", .data = &mt8195_of_data },
 	{ .compatible = "mediatek,mt8195-scp-dual", .data = &mt8195_of_data_cores },
+	{ .compatible = "mediatek,mt8188-scp-dual", .data = &mt8188_of_data_cores },
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_scp_of_match);
diff --git a/drivers/remoteproc/mtk_scp_ipi.c b/drivers/remoteproc/mtk_scp_ipi.c
index cd0b601..4ef5491 100644
--- a/drivers/remoteproc/mtk_scp_ipi.c
+++ b/drivers/remoteproc/mtk_scp_ipi.c
@@ -162,10 +162,12 @@ int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
 	struct mtk_share_obj __iomem *send_obj = scp->send_buf;
 	u32 val;
 	int ret;
+	size_t share_buf_offset;
+	void __iomem *share_buf_io_address;
 
 	if (WARN_ON(id <= SCP_IPI_INIT) || WARN_ON(id >= SCP_IPI_MAX) ||
 	    WARN_ON(id == SCP_IPI_NS_SERVICE) ||
-	    WARN_ON(len > sizeof(send_obj->share_buf)) || WARN_ON(!buf))
+	    WARN_ON(len > scp->data->ipi_buffer_size) || WARN_ON(!buf))
 		return -EINVAL;
 
 	ret = clk_prepare_enable(scp->clk);
@@ -184,7 +186,10 @@ int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
 		goto unlock_mutex;
 	}
 
-	scp_memcpy_aligned(send_obj->share_buf, buf, len);
+	share_buf_offset = offsetof(struct mtk_share_obj, share_buf);
+	share_buf_io_address = (void __iomem *)((uintptr_t)scp->send_buf + share_buf_offset);
+
+	scp_memcpy_aligned(share_buf_io_address, buf, len);
 
 	writel(len, &send_obj->len);
 	writel(id, &send_obj->id);
diff --git a/include/linux/remoteproc/mtk_scp.h b/include/linux/remoteproc/mtk_scp.h
index 7c2b7cc9..344ff41 100644
--- a/include/linux/remoteproc/mtk_scp.h
+++ b/include/linux/remoteproc/mtk_scp.h
@@ -43,6 +43,7 @@ enum scp_ipi_id {
 	SCP_IPI_CROS_HOST_CMD,
 	SCP_IPI_VDEC_LAT,
 	SCP_IPI_VDEC_CORE,
+	SCP_IPI_IMGSYS_CMD,
 	SCP_IPI_NS_SERVICE = 0xFF,
 	SCP_IPI_MAX = 0x100,
 };
-- 
2.6.4


