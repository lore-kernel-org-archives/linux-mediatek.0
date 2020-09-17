Return-Path: <SRS0=Tto8=C2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D517FC43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2020 06:31:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33EA02083B
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2020 06:31:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JAXm4Z0u";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NCaqyKxg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33EA02083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7KXvSyQl503+7dLOsaEFPJHVSc1DNyBsaxirbq5giYA=; b=JAXm4Z0u5CuSUCo6P+Hnjr5e70
	y0A1fHsT30vfeiKRjnFdZwpHgJ5en4Fb2yFwfBhnztYww5noeL4DiE/R2optFePLcsaZDEC8jezK3
	zATn5XwrcwPJtyI/iAWJ+xWbx0KwhU+U7CdBuXbfkppBvLVj853LvNz+O9RhBJZfps9UG3QEj6SgP
	VDNdSOww0hZTTyA8ZXTh64LU8XXIpiqodf45QZMwr9SBaWHsKdXAtXMayFCBVKdbTJ4tzyL3y3/5O
	EY+9Y2+HEODNX5IjFX1LZ6gh7FzLFss9onmKRYh6ZYuphtk0C49NkhupxfWV+LlAwGgbsvUv0TOEE
	zrFpwINA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kInRk-0004Ex-Kn; Thu, 17 Sep 2020 06:31:08 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kInRg-0004E9-9P
 for linux-mediatek@lists.infradead.org; Thu, 17 Sep 2020 06:31:07 +0000
Received: by mail-pj1-x1044.google.com with SMTP id t7so730365pjd.3
 for <linux-mediatek@lists.infradead.org>; Wed, 16 Sep 2020 23:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8LJqHaZG77fVWL6ik2TsLqs7JTaASfLYfXz0+2POUkY=;
 b=NCaqyKxgK9JKSFvP4wYT27OPCoBji9+pDEUrNDzkHOwL3nS8ptRuiVTQJefbsyPFyj
 M6WTJlfaVh0Awvdvt5pYFUZ2bH3SuDNIYJxnSt51lp6oDF6eDCEBgbINC9e3knhsHK2e
 muZB8opmLm1KEZvdS0ZI4COsg1M8JIxs3LbQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8LJqHaZG77fVWL6ik2TsLqs7JTaASfLYfXz0+2POUkY=;
 b=YTZt/eB2goxaru/9hs6lr32/555FIDyCGMVeywTnOPenk02F2s4wPEpR9vKz7etYfn
 uzzepYaZLpZ20WvD+h9dBW1Tha+Rk7NGGiOMxhgLzwWQiBb+nQ/mB0rUD+tYxpp2WTRN
 UjHzWVbUUENQWAl36c0Hxpm/frOM+6WssXwTXI1gsXY+Z21l5UEgo61MTQ/RKAtyR4p4
 hpEJW9lAWYcuoQX0WSAXy3pmodI7cz48hr8mLfb+RRLqtHA7TVYgm+CtCKvz94YxPU19
 cQtmIVVI+Tj9HS6rnubgPEPp37bVK8QP6nZTAxYxPp7na/tZPW4SNfJJhcgqiBk6kmcm
 gn3g==
X-Gm-Message-State: AOAM533CFnuMgykDCafBkvsSIMlEAvHeIM7C0/liGDYmDuwAzRKBWXH+
 cfCoB7XnghivDliTYklsH6+p0g==
X-Google-Smtp-Source: ABdhPJzMKgV2AXLVbNhGrwxspyPJZp1jjO1B6zsQp09hLLgnn/3vtKdflZANYG4R3mDNLtkgxyKtRQ==
X-Received: by 2002:a17:90a:a016:: with SMTP id
 q22mr6688148pjp.99.1600324261131; 
 Wed, 16 Sep 2020 23:31:01 -0700 (PDT)
Received: from kafuu-chino.c.googlers.com.com
 (105.219.229.35.bc.googleusercontent.com. [35.229.219.105])
 by smtp.googlemail.com with ESMTPSA id ev19sm4445335pjb.42.2020.09.16.23.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 23:31:00 -0700 (PDT)
From: Pi-Hsun Shih <pihsun@chromium.org>
To: 
Subject: [PATCH] remoteproc/mediatek: Add support for mt8192 SCP
Date: Thu, 17 Sep 2020 14:30:47 +0800
Message-Id: <20200917063047.2875693-1-pihsun@chromium.org>
X-Mailer: git-send-email 2.28.0.618.gf4bc123cb7-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_023104_395200_1220A4C3 
X-CRM114-Status: GOOD (  23.88  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Tzung-Bi Shih <tzungbi@chromium.org>,
 "open list:REMOTE PROCESSOR REMOTEPROC SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Pi-Hsun Shih <pihsun@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add support for mt8192 SCP.

Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
---
 drivers/remoteproc/mtk_common.h  |  34 +++++
 drivers/remoteproc/mtk_scp.c     | 207 ++++++++++++++++++++++++++-----
 drivers/remoteproc/mtk_scp_ipi.c |   5 +-
 3 files changed, 213 insertions(+), 33 deletions(-)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index 0066c83636d0..eaad1a40cd6a 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -32,6 +32,25 @@
 #define MT8183_SCP_CACHESIZE_8KB	BIT(8)
 #define MT8183_SCP_CACHE_CON_WAYEN	BIT(10)
 
+#define MT8192_L2TCM_SRAM_PD_0		0x210C0
+#define MT8192_L2TCM_SRAM_PD_1		0x210C4
+#define MT8192_L2TCM_SRAM_PD_2		0x210C8
+#define MT8192_L1TCM_SRAM_PDN		0x2102C
+#define MT8192_CPU0_SRAM_PD		0x21080
+
+#define MT8192_SCP2APMCU_IPC_SET	0x24080
+#define MT8192_SCP2APMCU_IPC_CLR	0x24084
+#define MT8192_SCP_IPC_INT_BIT		BIT(0)
+#define MT8192_SCP2SPM_IPC_CLR		0x24094
+#define MT8192_GIPC_IN_SET		0x24098
+#define MT8192_HOST_IPC_INT_BIT		BIT(0)
+
+#define MT8192_CORE0_SW_RSTN_CLR	0x30000
+#define MT8192_CORE0_SW_RSTN_SET	0x30004
+#define MT8192_CORE0_WDT_CFG		0x30034
+#define MT8192_CORE0_R_GPR1		0x30044
+#define MT8192_CORE0_R_GPR2		0x30048
+
 #define SCP_FW_VER_LEN			32
 #define SCP_SHARE_BUFFER_SIZE		288
 
@@ -50,6 +69,19 @@ struct scp_ipi_desc {
 	void *priv;
 };
 
+struct mtk_scp;
+
+struct mtk_scp_of_data {
+	int (*scp_before_load)(struct mtk_scp *scp);
+	void (*scp_irq_handler)(struct mtk_scp *scp);
+	void (*scp_reset_assert)(struct mtk_scp *scp);
+	void (*scp_reset_deassert)(struct mtk_scp *scp);
+	void (*scp_stop)(struct mtk_scp *scp);
+
+	u32 host_to_scp_reg;
+	u32 host_to_scp_int_bit;
+};
+
 struct mtk_scp {
 	struct device *dev;
 	struct rproc *rproc;
@@ -58,6 +90,8 @@ struct mtk_scp {
 	void __iomem *sram_base;
 	size_t sram_size;
 
+	const struct mtk_scp_of_data *data;
+
 	struct mtk_share_obj __iomem *recv_buf;
 	struct mtk_share_obj __iomem *send_buf;
 	struct scp_run run;
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index ac13e7b046a6..f5f226a7b34c 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -124,9 +124,6 @@ static int scp_ipi_init(struct mtk_scp *scp)
 	size_t send_offset = SCP_FW_END - sizeof(struct mtk_share_obj);
 	size_t recv_offset = send_offset - sizeof(struct mtk_share_obj);
 
-	/* Disable SCP to host interrupt */
-	writel(MT8183_SCP_IPC_INT_BIT, scp->reg_base + MT8183_SCP_TO_HOST);
-
 	/* shared buffer initialization */
 	scp->recv_buf =
 		(struct mtk_share_obj __iomem *)(scp->sram_base + recv_offset);
@@ -138,7 +135,7 @@ static int scp_ipi_init(struct mtk_scp *scp)
 	return 0;
 }
 
-static void scp_reset_assert(const struct mtk_scp *scp)
+static void mt8183_scp_reset_assert(struct mtk_scp *scp)
 {
 	u32 val;
 
@@ -147,7 +144,7 @@ static void scp_reset_assert(const struct mtk_scp *scp)
 	writel(val, scp->reg_base + MT8183_SW_RSTN);
 }
 
-static void scp_reset_deassert(const struct mtk_scp *scp)
+static void mt8183_scp_reset_deassert(struct mtk_scp *scp)
 {
 	u32 val;
 
@@ -156,17 +153,29 @@ static void scp_reset_deassert(const struct mtk_scp *scp)
 	writel(val, scp->reg_base + MT8183_SW_RSTN);
 }
 
-static irqreturn_t scp_irq_handler(int irq, void *priv)
+static void mt8192_scp_reset_assert(struct mtk_scp *scp)
 {
-	struct mtk_scp *scp = priv;
-	u32 scp_to_host;
-	int ret;
+	writel(1, scp->reg_base + MT8192_CORE0_SW_RSTN_SET);
+}
 
-	ret = clk_prepare_enable(scp->clk);
-	if (ret) {
-		dev_err(scp->dev, "failed to enable clocks\n");
-		return IRQ_NONE;
-	}
+static void mt8192_scp_reset_deassert(struct mtk_scp *scp)
+{
+	writel(1, scp->reg_base + MT8192_CORE0_SW_RSTN_CLR);
+}
+
+static void scp_reset_assert(struct mtk_scp *scp)
+{
+	scp->data->scp_reset_assert(scp);
+}
+
+static void scp_reset_deassert(struct mtk_scp *scp)
+{
+	scp->data->scp_reset_deassert(scp);
+}
+
+static void mt8183_scp_irq_handler(struct mtk_scp *scp)
+{
+	u32 scp_to_host;
 
 	scp_to_host = readl(scp->reg_base + MT8183_SCP_TO_HOST);
 	if (scp_to_host & MT8183_SCP_IPC_INT_BIT)
@@ -177,6 +186,40 @@ static irqreturn_t scp_irq_handler(int irq, void *priv)
 	/* SCP won't send another interrupt until we set SCP_TO_HOST to 0. */
 	writel(MT8183_SCP_IPC_INT_BIT | MT8183_SCP_WDT_INT_BIT,
 	       scp->reg_base + MT8183_SCP_TO_HOST);
+}
+
+static void mt8192_scp_irq_handler(struct mtk_scp *scp)
+{
+	u32 scp_to_host;
+
+	scp_to_host = readl(scp->reg_base + MT8192_SCP2APMCU_IPC_SET);
+
+	if (scp_to_host & MT8192_SCP_IPC_INT_BIT)
+		scp_ipi_handler(scp);
+	else
+		scp_wdt_handler(scp, scp_to_host);
+
+	/*
+	 * SCP won't send another interrupt until we clear
+	 * MT8192_SCP2APMCU_IPC.
+	 */
+	writel(MT8192_SCP_IPC_INT_BIT,
+	       scp->reg_base + MT8192_SCP2APMCU_IPC_CLR);
+}
+
+static irqreturn_t scp_irq_handler(int irq, void *priv)
+{
+	struct mtk_scp *scp = priv;
+	int ret;
+
+	ret = clk_prepare_enable(scp->clk);
+	if (ret) {
+		dev_err(scp->dev, "failed to enable clocks\n");
+		return IRQ_NONE;
+	}
+
+	scp->data->scp_irq_handler(scp);
+
 	clk_disable_unprepare(scp->clk);
 
 	return IRQ_HANDLED;
@@ -238,20 +281,10 @@ static int scp_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 	return ret;
 }
 
-static int scp_load(struct rproc *rproc, const struct firmware *fw)
+static int mt8183_scp_before_load(struct mtk_scp *scp)
 {
-	const struct mtk_scp *scp = rproc->priv;
-	struct device *dev = scp->dev;
-	int ret;
-
-	ret = clk_prepare_enable(scp->clk);
-	if (ret) {
-		dev_err(dev, "failed to enable clocks\n");
-		return ret;
-	}
-
-	/* Hold SCP in reset while loading FW. */
-	scp_reset_assert(scp);
+	/* Clear SCP to host interrupt */
+	writel(MT8183_SCP_IPC_INT_BIT, scp->reg_base + MT8183_SCP_TO_HOST);
 
 	/* Reset clocks before loading FW */
 	writel(0x0, scp->reg_base + MT8183_SCP_CLK_SW_SEL);
@@ -272,6 +305,67 @@ static int scp_load(struct rproc *rproc, const struct firmware *fw)
 	       scp->reg_base + MT8183_SCP_CACHE_CON);
 	writel(MT8183_SCP_CACHESIZE_8KB, scp->reg_base + MT8183_SCP_DCACHE_CON);
 
+	return 0;
+}
+
+static void mt8192_power_on_sram(void *addr)
+{
+	int i;
+
+	for (i = 31; i >= 0; i--)
+		writel(GENMASK(i, 0), addr);
+	writel(0, addr);
+}
+
+static void mt8192_power_off_sram(void *addr)
+{
+	int i;
+
+	writel(0, addr);
+	for (i = 0; i < 32; i++)
+		writel(GENMASK(i, 0), addr);
+}
+
+static int mt8192_scp_before_load(struct mtk_scp *scp)
+{
+	/* clear SPM interrupt, SCP2SPM_IPC_CLR */
+	writel(0xff, scp->reg_base + MT8192_SCP2SPM_IPC_CLR);
+
+	writel(1, scp->reg_base + MT8192_CORE0_SW_RSTN_SET);
+
+	dsb(sy);
+
+	readl(scp->reg_base + MT8192_CORE0_SW_RSTN_SET);
+
+	/* enable SRAM clock */
+	mt8192_power_on_sram(scp->reg_base + MT8192_L2TCM_SRAM_PD_0);
+	mt8192_power_on_sram(scp->reg_base + MT8192_L2TCM_SRAM_PD_1);
+	mt8192_power_on_sram(scp->reg_base + MT8192_L2TCM_SRAM_PD_2);
+	mt8192_power_on_sram(scp->reg_base + MT8192_L1TCM_SRAM_PDN);
+	mt8192_power_on_sram(scp->reg_base + MT8192_CPU0_SRAM_PD);
+
+	return 0;
+}
+
+static int scp_load(struct rproc *rproc, const struct firmware *fw)
+{
+	struct mtk_scp *scp = rproc->priv;
+	struct device *dev = scp->dev;
+	int ret;
+
+	ret = clk_prepare_enable(scp->clk);
+	if (ret) {
+		dev_err(dev, "failed to enable clocks\n");
+		return ret;
+	}
+
+	/* Hold SCP in reset while loading FW. */
+	scp_reset_assert(scp);
+
+	ret = scp->data->scp_before_load(scp);
+	if (ret < 0)
+		return ret;
+
 	ret = scp_elf_load_segments(rproc, fw);
 	clk_disable_unprepare(scp->clk);
 
@@ -309,6 +403,7 @@ static int scp_start(struct rproc *rproc)
 		dev_err(dev, "wait SCP interrupted by a signal!\n");
 		goto stop;
 	}
+
 	clk_disable_unprepare(scp->clk);
 	dev_info(dev, "SCP is ready. FW version %s\n", run->fw_ver);
 
@@ -329,7 +424,7 @@ static void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len)
 		offset = da;
 		if (offset >= 0 && (offset + len) < scp->sram_size)
 			return (void __force *)scp->sram_base + offset;
-	} else {
+	} else if (scp->dram_size) {
 		offset = da - scp->dma_addr;
 		if (offset >= 0 && (offset + len) < scp->dram_size)
 			return (void __force *)scp->cpu_addr + offset;
@@ -338,6 +433,25 @@ static void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len)
 	return NULL;
 }
 
+static void mt8183_scp_stop(struct mtk_scp *scp)
+{
+	/* Disable SCP watchdog */
+	writel(0, scp->reg_base + MT8183_WDT_CFG);
+}
+
+static void mt8192_scp_stop(struct mtk_scp *scp)
+{
+	/* Disable SRAM clock */
+	mt8192_power_off_sram(scp->reg_base + MT8192_L2TCM_SRAM_PD_0);
+	mt8192_power_off_sram(scp->reg_base + MT8192_L2TCM_SRAM_PD_1);
+	mt8192_power_off_sram(scp->reg_base + MT8192_L2TCM_SRAM_PD_2);
+	mt8192_power_off_sram(scp->reg_base + MT8192_L1TCM_SRAM_PDN);
+	mt8192_power_off_sram(scp->reg_base + MT8192_CPU0_SRAM_PD);
+
+	/* Disable SCP watchdog */
+	writel(0, scp->reg_base + MT8192_CORE0_WDT_CFG);
+}
+
 static int scp_stop(struct rproc *rproc)
 {
 	struct mtk_scp *scp = (struct mtk_scp *)rproc->priv;
@@ -350,8 +464,7 @@ static int scp_stop(struct rproc *rproc)
 	}
 
 	scp_reset_assert(scp);
-	/* Disable SCP watchdog */
-	writel(0, scp->reg_base + MT8183_WDT_CFG);
+	scp->data->scp_stop(scp);
 	clk_disable_unprepare(scp->clk);
 
 	return 0;
@@ -443,6 +556,13 @@ static int scp_map_memory_region(struct mtk_scp *scp)
 	int ret;
 
 	ret = of_reserved_mem_device_init(scp->dev);
+
+	/* reserved memory is optional. */
+	if (ret == -ENODEV) {
+		dev_info(scp->dev, "skipping reserved memory initialization.");
+		return 0;
+	}
+
 	if (ret) {
 		dev_err(scp->dev, "failed to assign memory-region: %d\n", ret);
 		return -ENOMEM;
@@ -460,6 +580,9 @@ static int scp_map_memory_region(struct mtk_scp *scp)
 
 static void scp_unmap_memory_region(struct mtk_scp *scp)
 {
+	if (scp->dram_size == 0)
+		return;
+
 	dma_free_coherent(scp->dev, scp->dram_size, scp->cpu_addr,
 			  scp->dma_addr);
 	of_reserved_mem_device_release(scp->dev);
@@ -536,6 +659,7 @@ static int scp_probe(struct platform_device *pdev)
 	scp = (struct mtk_scp *)rproc->priv;
 	scp->rproc = rproc;
 	scp->dev = dev;
+	scp->data = of_device_get_match_data(dev);
 	platform_set_drvdata(pdev, scp);
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sram");
@@ -642,8 +766,29 @@ static int scp_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct mtk_scp_of_data mt8183_of_data = {
+	.scp_before_load = mt8183_scp_before_load,
+	.scp_irq_handler = mt8183_scp_irq_handler,
+	.scp_reset_assert = mt8183_scp_reset_assert,
+	.scp_reset_deassert = mt8183_scp_reset_deassert,
+	.scp_stop = mt8183_scp_stop,
+	.host_to_scp_reg = MT8183_HOST_TO_SCP,
+	.host_to_scp_int_bit = MT8183_HOST_IPC_INT_BIT,
+};
+
+static const struct mtk_scp_of_data mt8192_of_data = {
+	.scp_before_load = mt8192_scp_before_load,
+	.scp_irq_handler = mt8192_scp_irq_handler,
+	.scp_reset_assert = mt8192_scp_reset_assert,
+	.scp_reset_deassert = mt8192_scp_reset_deassert,
+	.scp_stop = mt8192_scp_stop,
+	.host_to_scp_reg = MT8192_GIPC_IN_SET,
+	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
+};
+
 static const struct of_device_id mtk_scp_of_match[] = {
-	{ .compatible = "mediatek,mt8183-scp"},
+	{ .compatible = "mediatek,mt8183-scp", .data = &mt8183_of_data },
+	{ .compatible = "mediatek,mt8192-scp", .data = &mt8192_of_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_scp_of_match);
diff --git a/drivers/remoteproc/mtk_scp_ipi.c b/drivers/remoteproc/mtk_scp_ipi.c
index 3d3d87210ef2..fb81df973566 100644
--- a/drivers/remoteproc/mtk_scp_ipi.c
+++ b/drivers/remoteproc/mtk_scp_ipi.c
@@ -182,7 +182,7 @@ int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
 			ret = -ETIMEDOUT;
 			goto clock_disable;
 		}
-	} while (readl(scp->reg_base + MT8183_HOST_TO_SCP));
+	} while (readl(scp->reg_base + scp->data->host_to_scp_reg));
 
 	scp_memcpy_aligned(send_obj->share_buf, buf, len);
 
@@ -191,7 +191,8 @@ int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
 
 	scp->ipi_id_ack[id] = false;
 	/* send the command to SCP */
-	writel(MT8183_HOST_IPC_INT_BIT, scp->reg_base + MT8183_HOST_TO_SCP);
+	writel(scp->data->host_to_scp_int_bit,
+	       scp->reg_base + scp->data->host_to_scp_reg);
 
 	if (wait) {
 		/* wait for SCP's ACK */

base-commit: 5925fa68fe8244651b3f78a88c4af99190a88f0d
-- 
2.28.0.618.gf4bc123cb7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
