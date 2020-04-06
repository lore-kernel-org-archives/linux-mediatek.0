Return-Path: <SRS0=dAcd=5W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77DD4C2BA19
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Apr 2020 09:28:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48B3420644
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Apr 2020 09:28:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="drqjx7QE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="r9PH4HYB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48B3420644
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lEi97BQ/h7PhzL/LUGxVUiC3w87/WAGRjbYLH5JEi5E=; b=drqjx7QEDzh+Bn
	t0YlSajEWlTdGejsyhYuDpbp/PcNutWDWM+htk5XyQpQkceY8c4uhvFIiN4KD2N9bi9jebHgU3Mjf
	LTeBhUkxQbohUDpb+2OSEkRn37lzcY/0JEq4ZVg/kmpmh63PHi3zpcRRteD9QT86fm6HZIa3/VYB+
	BrR439j+XFrKUAf5VzM/h5f49VP7e4CqdR1z0qOoVEuhz7GLKpuNeTDEvXJXYF7VwnpDePi5ZSYsS
	S4U34+xeZa6WXAVphYm8BYpybI9f54N4pk9paCWDN1h7zu5/YNjgUTVWOa9k/ZYhp91oN3oczY4uB
	Ofe3M4S25RCNSIAZqApg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLO3c-0001lN-LZ; Mon, 06 Apr 2020 09:28:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLO3D-0001HU-4z; Mon, 06 Apr 2020 09:28:16 +0000
X-UUID: e136b894d81848c0aa5b8e22be51e702-20200406
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Hsl3GJfHOubDs7v2Mnr4grCYwiLXJb28jC4OAsC2VDs=; 
 b=r9PH4HYBRMdq6R9RGUVL4P7BdgnTKBBjq4LHIJhp/SW1uUExwmI6DtSeQOjyNa/wPbpquBACBeJNa7SHUwGZrfTO20MmK0eXKvZoyAlSEt37vIbKMkVxAjtVOwXoy/0uBRn2ehME4onAuaGgSidXvK6s6gPaKpQ1z09c5YkmuWc=;
X-UUID: e136b894d81848c0aa5b8e22be51e702-20200406
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chun-hung.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 101475461; Mon, 06 Apr 2020 01:28:11 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Apr 2020 02:28:06 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Apr 2020 17:28:04 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 6 Apr 2020 17:28:03 +0800
From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
To: <mirq-linux@rere.qmqm.pl>, Jonathan Hunter <jonathanh@nvidia.com>, "Al
 Cooper" <alcooperx@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 <bcm-kernel-feedback-list@broadcom.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Michal Simek
 <michal.simek@xilinx.com>, Thierry Reding <thierry.reding@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, "Linus
 Walleij" <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>, Kate
 Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Pan Bian <bianpan2016@163.com>, "Thomas
 Gleixner" <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 "Mathieu Malaterre" <malat@debian.org>, Stanley Chu
 <stanley.chu@mediatek.com>, "Kuohong Wang" <kuohong.wang@mediatek.com>
Subject: [PATCH 4/5] [4/5] mmc: mediatek: command queue support
Date: Mon, 6 Apr 2020 17:28:00 +0800
Message-ID: <1586165281-11888-5-git-send-email-chun-hung.wu@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1586165281-11888-1-git-send-email-chun-hung.wu@mediatek.com>
References: <1586165281-11888-1-git-send-email-chun-hung.wu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9EDC88A9D882AF1E302692BE455AB7C9EB2BAE0811192905FAE38824E5F8FE282000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200406_022815_194464_DC050067 
X-CRM114-Status: GOOD (  15.35  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-arm-msm@vger.kernel.org, Chun-Hung Wu <chun-hung.wu@mediatek.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Support command queue for mt6779 platform.
a. Add msdc_set_busy_timeout() to calculate emmc write timeout
b. Connect mtk msdc driver to cqhci driver through
   host->cq_host->ops = &msdc_cmdq_ops;
c. msdc_cmdq_irq() will link up with cqchi_irq(). Besides, it provides
   more irq error messages like RSPCRCERR/CMDTO/DATACRCERR/DATTMO.
d. Use the options below to separate support for CQHCI or not, because
   some of our platform does not support CQHCI hence no kernel option:
   CONFIG_MMC_CQHCI.
   #if IS_ENABLED(CONFIG_MMC_CQHCI)
   XXX //Support CQHCI
   #else
   XXX //Not support CQHCI
   #endif

Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
---
 drivers/mmc/host/mtk-sd.c | 119 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index a2328fb..8516888 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -31,6 +31,8 @@
 #include <linux/mmc/sdio.h>
 #include <linux/mmc/slot-gpio.h>
 
+#include "cqhci.h"
+
 #define MAX_BD_NUM          1024
 
 /*--------------------------------------------------------------------------*/
@@ -151,6 +153,7 @@
 #define MSDC_INT_DMA_BDCSERR    (0x1 << 17)	/* W1C */
 #define MSDC_INT_DMA_GPDCSERR   (0x1 << 18)	/* W1C */
 #define MSDC_INT_DMA_PROTECT    (0x1 << 19)	/* W1C */
+#define MSDC_INT_CMDQ           (0x1 << 28)	/* W1C */
 
 /* MSDC_INTEN mask */
 #define MSDC_INTEN_MMCIRQ       (0x1 << 0)	/* RW */
@@ -181,6 +184,7 @@
 /* SDC_CFG mask */
 #define SDC_CFG_SDIOINTWKUP     (0x1 << 0)	/* RW */
 #define SDC_CFG_INSWKUP         (0x1 << 1)	/* RW */
+#define SDC_CFG_WRDTOC          (0x1fff  << 2)  /* RW */
 #define SDC_CFG_BUSWIDTH        (0x3 << 16)	/* RW */
 #define SDC_CFG_SDIO            (0x1 << 19)	/* RW */
 #define SDC_CFG_SDIOIDE         (0x1 << 20)	/* RW */
@@ -229,6 +233,7 @@
 #define MSDC_PATCH_BIT_DECRCTMO   (0x1 << 30)	/* RW */
 
 #define MSDC_PATCH_BIT1_CMDTA     (0x7 << 3)    /* RW */
+#define MSDC_PB1_BUSY_CHECK_SEL   (0x1 << 7)    /* RW */
 #define MSDC_PATCH_BIT1_STOP_DLY  (0xf << 8)    /* RW */
 
 #define MSDC_PATCH_BIT2_CFGRESP   (0x1 << 15)   /* RW */
@@ -432,6 +437,7 @@ struct msdc_host {
 	struct msdc_save_para save_para; /* used when gate HCLK */
 	struct msdc_tune_para def_tune_para; /* default tune setting */
 	struct msdc_tune_para saved_tune_para; /* tune result of CMD21/CMD19 */
+	struct cqhci_host *cq_host;
 };
 
 static const struct mtk_mmc_compatible mt8135_compat = {
@@ -528,6 +534,18 @@ struct msdc_host {
 	.use_internal_cd = true,
 };
 
+static const struct mtk_mmc_compatible mt6779_compat = {
+	.clk_div_bits = 12,
+	.hs400_tune = false,
+	.pad_tune_reg = MSDC_PAD_TUNE0,
+	.async_fifo = true,
+	.data_tune = true,
+	.busy_check = true,
+	.stop_clk_fix = true,
+	.enhance_rx = true,
+	.support_64g = true,
+};
+
 static const struct of_device_id msdc_of_ids[] = {
 	{ .compatible = "mediatek,mt8135-mmc", .data = &mt8135_compat},
 	{ .compatible = "mediatek,mt8173-mmc", .data = &mt8173_compat},
@@ -537,6 +555,7 @@ struct msdc_host {
 	{ .compatible = "mediatek,mt7622-mmc", .data = &mt7622_compat},
 	{ .compatible = "mediatek,mt8516-mmc", .data = &mt8516_compat},
 	{ .compatible = "mediatek,mt7620-mmc", .data = &mt7620_compat},
+	{ .compatible = "mediatek,mt6779-mmc", .data = &mt6779_compat},
 	{}
 };
 MODULE_DEVICE_TABLE(of, msdc_of_ids);
@@ -740,6 +759,15 @@ static void msdc_set_timeout(struct msdc_host *host, u64 ns, u64 clks)
 		      (u32)(timeout > 255 ? 255 : timeout));
 }
 
+static void msdc_set_busy_timeout(struct msdc_host *host, u64 ns, u64 clks)
+{
+	u64 timeout;
+
+	timeout = msdc_timeout_cal(host, ns, clks);
+	sdr_set_field(host->base + SDC_CFG, SDC_CFG_WRDTOC,
+		      (u32)(timeout > 8191 ? 8191 : timeout));
+}
+
 static void msdc_gate_clock(struct msdc_host *host)
 {
 	clk_disable_unprepare(host->src_clk_cg);
@@ -1426,6 +1454,36 @@ static void msdc_enable_sdio_irq(struct mmc_host *mmc, int enb)
 		pm_runtime_put_noidle(host->dev);
 }
 
+#if IS_ENABLED(CONFIG_MMC_CQHCI)
+static irqreturn_t msdc_cmdq_irq(struct msdc_host *host, u32 intsts)
+{
+	int cmd_err = 0, dat_err = 0;
+
+	if (intsts & MSDC_INT_RSPCRCERR) {
+		cmd_err = (unsigned int)-EILSEQ;
+		dev_err(host->dev, "%s: CMD CRC ERR", __func__);
+	} else if (intsts & MSDC_INT_CMDTMO) {
+		cmd_err = (unsigned int)-ETIMEDOUT;
+		dev_err(host->dev, "%s: CMD TIMEOUT ERR", __func__);
+	}
+
+	if (intsts & MSDC_INT_DATCRCERR) {
+		dat_err = (unsigned int)-EILSEQ;
+		dev_err(host->dev, "%s: DATA CRC ERR", __func__);
+	} else if (intsts & MSDC_INT_DATTMO) {
+		dat_err = (unsigned int)-ETIMEDOUT;
+		dev_err(host->dev, "%s: DATA TIMEOUT ERR", __func__);
+	}
+
+	if (cmd_err || dat_err) {
+		dev_err(host->dev, "cmd_err = %d, dat_err =%d, intsts = 0x%x",
+			cmd_err, dat_err, intsts);
+	}
+
+	return cqhci_irq(host->mmc, 0, cmd_err, dat_err);
+}
+#endif
+
 static irqreturn_t msdc_irq(int irq, void *dev_id)
 {
 	struct msdc_host *host = (struct msdc_host *) dev_id;
@@ -1462,6 +1520,16 @@ static irqreturn_t msdc_irq(int irq, void *dev_id)
 		if (!(events & (event_mask & ~MSDC_INT_SDIOIRQ)))
 			break;
 
+#if IS_ENABLED(CONFIG_MMC_CQHCI)
+		if ((host->mmc->caps2 & MMC_CAP2_CQE) &&
+		    (events & MSDC_INT_CMDQ)) {
+			msdc_cmdq_irq(host, events);
+			/* clear interrupts */
+			writel(events, host->base + MSDC_INT);
+			return IRQ_HANDLED;
+		}
+#endif
+
 		if (!mrq) {
 			dev_err(host->dev,
 				"%s: MRQ=NULL; events=%08X; event_mask=%08X\n",
@@ -2146,6 +2214,36 @@ static int msdc_get_cd(struct mmc_host *mmc)
 		return !val;
 }
 
+static void msdc_cqe_enable(struct mmc_host *mmc)
+{
+	struct msdc_host *host = mmc_priv(mmc);
+
+	/* enable cmdq irq */
+	writel(MSDC_INT_CMDQ, host->base + MSDC_INTEN);
+	/* enable busy check */
+	sdr_set_bits(host->base + MSDC_PATCH_BIT1, MSDC_PB1_BUSY_CHECK_SEL);
+	/* default write data / busy timeout 20s */
+	msdc_set_busy_timeout(host, 20 * 1000000000ULL, 0);
+	/* default read data timeout 1s */
+	msdc_set_timeout(host, 1000000000ULL, 0);
+}
+
+void msdc_cqe_disable(struct mmc_host *mmc, bool recovery)
+{
+	struct msdc_host *host = mmc_priv(mmc);
+
+	/* disable cmdq irq */
+	sdr_clr_bits(host->base + MSDC_INTEN, MSDC_INT_CMDQ);
+	/* disable busy check */
+	sdr_clr_bits(host->base + MSDC_PATCH_BIT1, MSDC_PB1_BUSY_CHECK_SEL);
+
+	if (recovery) {
+		sdr_set_field(host->base + MSDC_DMA_CTRL,
+			      MSDC_DMA_CTRL_STOP, 1);
+		msdc_reset_hw(host);
+	}
+}
+
 static const struct mmc_host_ops mt_msdc_ops = {
 	.post_req = msdc_post_req,
 	.pre_req = msdc_pre_req,
@@ -2162,6 +2260,11 @@ static int msdc_get_cd(struct mmc_host *mmc)
 	.hw_reset = msdc_hw_reset,
 };
 
+static const struct cqhci_host_ops msdc_cmdq_ops = {
+	.enable         = msdc_cqe_enable,
+	.disable        = msdc_cqe_disable,
+};
+
 static void msdc_of_property_parse(struct platform_device *pdev,
 				   struct msdc_host *host)
 {
@@ -2312,6 +2415,22 @@ static int msdc_drv_probe(struct platform_device *pdev)
 		host->dma_mask = DMA_BIT_MASK(32);
 	mmc_dev(mmc)->dma_mask = &host->dma_mask;
 
+#if IS_ENABLED(CONFIG_MMC_CQHCI)
+	if (mmc->caps2 & MMC_CAP2_CQE) {
+		host->cq_host = devm_kzalloc(host->mmc->parent,
+					     sizeof(*host->cq_host),
+					     GFP_KERNEL);
+		host->cq_host->caps |= CQHCI_TASK_DESC_SZ_128;
+		host->cq_host->mmio = host->base + 0x800;
+		host->cq_host->ops = &msdc_cmdq_ops;
+		cqhci_init(host->cq_host, mmc, true);
+		mmc->max_segs = 128;
+		/* cqhci 16bit length */
+		/* 0 size, means 65536 so we don't have to -1 here */
+		mmc->max_seg_size = 64 * 1024;
+	}
+#endif
+
 	host->timeout_clks = 3 * 1048576;
 	host->dma.gpd = dma_alloc_coherent(&pdev->dev,
 				2 * sizeof(struct mt_gpdma_desc),
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
