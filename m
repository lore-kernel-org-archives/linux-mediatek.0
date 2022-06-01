Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0855C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 11:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z3CRWWjvqOdSH3+EYbhrV8u2/IvCv+EX+kuwenSTB14=; b=TWbWtm5VBSB1Mn
	uF3FUApVaMEtpZ/t9eYDfEj0VYQRbSNrrZP521lrCnLLE/aYffpnYcnK1xpPW5fsvwN8DMXH3o1GI
	lbhyqOrtOsRpPNiqAwSI6vj1wDD7xriaMIKG2HGOTcm0YaXstgnUMue4FwlcgYcT6gAhO+6yg2mya
	sKn7z7an6D9opfTO8GdeTvmnFx89EBzFKlmKa+45OtHka1zUzWef47ChRD+8tDXbvMdPJmIDy7+OI
	JkEu3YNk5QW+95wvs129ZFg9/M4adp0/OvgMBahXwG0zgUUSB5yGQ5Xzxj40+mlJi+dWgTgBPF5O5
	IBGlvU8yeXjk4YWCKrcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwMbG-00Fdg2-F5; Wed, 01 Jun 2022 11:33:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwMaE-00FdDi-50; Wed, 01 Jun 2022 11:32:16 +0000
X-UUID: b675c96efa544aaf816e0c2e43999e09-20220601
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:4fa74643-13e2-4611-b7fa-7675b0418a73,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:a0ac8f14-f88c-475e-badf-d9ee54230b8f,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: b675c96efa544aaf816e0c2e43999e09-20220601
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 217592412; Wed, 01 Jun 2022 04:32:08 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jun 2022 04:22:07 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 1 Jun 2022 19:22:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 1 Jun 2022 19:22:05 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>, Benson Leung
	<bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, Daisuke Nojiri
	<dnojiri@chromium.org>, Sebastian Reichel <sebastian.reichel@collabora.com>,
	"Dustin L. Howett" <dustin@howett.net>, Tzung-Bi Shih <tzungbi@kernel.org>,
	Tinghan Shen <tinghan.shen@mediatek.com>, "Gustavo A. R. Silva"
	<gustavoars@kernel.org>, Prashant Malani <pmalani@chromium.org>, "Enric
 Balletbo i Serra" <enric.balletbo@collabora.com>, Brian Norris
	<briannorris@chromium.org>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <chrome-platform@lists.linux.dev>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <weishunc@google.com>
Subject: [PATCH v1 10/15] remoteproc: mediatek: Add chip dependent operations for SCP core 1
Date: Wed, 1 Jun 2022 19:21:56 +0800
Message-ID: <20220601112201.15510-11-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220601112201.15510-1-tinghan.shen@mediatek.com>
References: <20220601112201.15510-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_043214_234333_EF916B89 
X-CRM114-Status: GOOD (  20.71  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The SCP rproc operations has chip dependent callbacks. Implement a
version of these callbacks for MT8195 SCP core 1.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 drivers/remoteproc/mtk_common.h   |   1 +
 drivers/remoteproc/mtk_scp.c      |   3 +-
 drivers/remoteproc/mtk_scp_dual.c | 121 +++++++++++++++++++++++++++++-
 3 files changed, 123 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index 04f7ee590f96..7b363411ec99 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -171,4 +171,5 @@ int scp_parse_fw(struct rproc *rproc, const struct firmware *fw);
 int scp_map_memory_region(struct mtk_scp *scp);
 void scp_unmap_memory_region(struct mtk_scp *scp);
 irqreturn_t scp_irq_handler(int irq, void *priv);
+void scp_ipi_handler(struct mtk_scp *scp);
 #endif
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index c67883c28a43..55bc4e9d1a6f 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -84,7 +84,7 @@ static void scp_init_ipi_handler(void *data, unsigned int len, void *priv)
 	wake_up_interruptible(&scp->run.wq);
 }
 
-static void scp_ipi_handler(struct mtk_scp *scp)
+void scp_ipi_handler(struct mtk_scp *scp)
 {
 	struct mtk_share_obj __iomem *rcv_obj = scp->recv_buf;
 	struct scp_ipi_desc *ipi_desc = scp->ipi_desc;
@@ -118,6 +118,7 @@ static void scp_ipi_handler(struct mtk_scp *scp)
 	scp->ipi_id_ack[id] = true;
 	wake_up(&scp->ack_wq);
 }
+EXPORT_SYMBOL_GPL(scp_ipi_handler);
 
 static int scp_elf_read_ipi_buf_addr(struct mtk_scp *scp,
 				     const struct firmware *fw,
diff --git a/drivers/remoteproc/mtk_scp_dual.c b/drivers/remoteproc/mtk_scp_dual.c
index d4cc15e22640..16cf9d2628c8 100644
--- a/drivers/remoteproc/mtk_scp_dual.c
+++ b/drivers/remoteproc/mtk_scp_dual.c
@@ -12,6 +12,124 @@
 #include "mtk_common.h"
 #include "remoteproc_internal.h"
 
+static void mt8195_power_on_sram(void __iomem *addr)
+{
+	int i;
+
+	for (i = 31; i >= 0; i--)
+		writel(GENMASK(i, 0), addr);
+	writel(0, addr);
+}
+
+static void mt8195_power_off_sram(void __iomem *addr)
+{
+	int i;
+
+	writel(0, addr);
+	for (i = 0; i < 32; i++)
+		writel(GENMASK(i, 0), addr);
+}
+
+static int mt8195_scp_dual_before_load(struct mtk_scp *scp)
+{
+	u32 sec_ctrl;
+
+	mt8195_power_on_sram(scp->reg_base + MT8195_CPU1_SRAM_PD);
+
+	/* hold SCP in reset while loading FW. */
+	scp->data->scp_reset_assert(scp);
+
+	/* enable MPU for all memory regions */
+	writel(0xff, scp->reg_base + MT8195_CORE1_MEM_ATT_PREDEF);
+
+	return 0;
+}
+
+static void mt8195_scp_dual_irq_handler(struct mtk_scp *scp)
+{
+	u32 scp_to_host;
+
+	scp_to_host = readl(scp->reg_base + MT8195_SSHUB2APMCU_IPC_SET);
+
+	if (scp_to_host & MT8192_SCP_IPC_INT_BIT) {
+		scp_ipi_handler(scp);
+
+		/*
+		 * SCP won't send another interrupt until we clear
+		 * MT8195_SSHUB2APMCU_IPC_CLR.
+		 */
+		writel(MT8192_SCP_IPC_INT_BIT,
+		       scp->reg_base + MT8195_SSHUB2APMCU_IPC_CLR);
+	}
+}
+
+static void mt8195_scp_dual_reset_assert(struct mtk_scp *scp)
+{
+	writel(1, scp->reg_base + MT8195_CORE1_SW_RSTN_SET);
+}
+
+static void mt8195_scp_dual_reset_deassert(struct mtk_scp *scp)
+{
+	writel(1, scp->reg_base + MT8195_CORE1_SW_RSTN_CLR);
+}
+
+static void *mt8195_scp_dual_da_to_va(struct mtk_scp *scp, u64 da, size_t len)
+{
+	int offset;
+
+	if (da >= scp->sram_phys &&
+	    (da + len) <= scp->sram_phys + scp->sram_size) {
+		offset = da - scp->sram_phys;
+		return (void __force *)scp->sram_base + offset;
+	}
+
+	/* optional memory region */
+	if (scp->l1tcm_size &&
+	    da >= scp->l1tcm_phys &&
+	    (da + len) <= scp->l1tcm_phys + scp->l1tcm_size) {
+		offset = da - scp->l1tcm_phys;
+		return (void __force *)scp->l1tcm_base + offset;
+	}
+
+	/* optional memory region */
+	if (scp->dram_size &&
+	    da >= scp->dma_addr &&
+	    (da + len) <= scp->dma_addr + scp->dram_size) {
+		offset = da - scp->dma_addr;
+		return scp->cpu_addr + offset;
+	}
+
+	return NULL;
+}
+
+static void mt8195_scp_dual_stop(struct mtk_scp *scp)
+{
+	/* Power off CPU SRAM */
+	mt8195_power_off_sram(scp->reg_base + MT8195_CPU1_SRAM_PD);
+
+	/* Disable SCP watchdog */
+	writel(0, scp->reg_base + MT8195_CORE1_WDT_CFG);
+}
+
+static int mt8195_scp_dual_clk_get(struct mtk_scp *scp)
+{
+	scp->clk = NULL;
+
+	return 0;
+}
+
+static const struct mtk_scp_of_data mt8195_scp_dual_of_data = {
+	.scp_clk_get = mt8195_scp_dual_clk_get,
+	.scp_before_load = mt8195_scp_dual_before_load,
+	.scp_irq_handler = mt8195_scp_dual_irq_handler,
+	.scp_reset_assert = mt8195_scp_dual_reset_assert,
+	.scp_reset_deassert = mt8195_scp_dual_reset_deassert,
+	.scp_stop = mt8195_scp_dual_stop,
+	.scp_da_to_va = mt8195_scp_dual_da_to_va,
+	.host_to_scp_reg = MT8192_GIPC_IN_SET,
+	.host_to_scp_int_bit = MT8195_HOST_IPC_INT_BIT,
+};
+
 static const struct rproc_ops scp_ops = {
 	.start		= scp_start,
 	.stop		= scp_stop,
@@ -53,6 +171,7 @@ static int scp_dual_probe(struct platform_device *pdev)
 	scp = (struct mtk_scp *)rproc->priv;
 	scp->rproc = rproc;
 	scp->dev = dev;
+	scp->data = of_device_get_match_data(dev);
 	platform_set_drvdata(pdev, scp);
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sram");
@@ -125,7 +244,7 @@ static int scp_dual_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id mtk_scp_dual_of_match[] = {
-	{ .compatible = "mediatek,mt8195-scp-dual" },
+	{ .compatible = "mediatek,mt8195-scp-dual", .data = &mt8195_scp_dual_of_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_scp_dual_of_match);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
