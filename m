Return-Path: <SRS0=A+tK=A7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34924C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 00:53:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4E9F21744
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 00:53:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="v8Km/mmW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="rOdJPl/3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4E9F21744
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Kaq7KO/gqr2poafI4+e8HL0+Gsxe/39PuKMNsNwsTKI=; b=v8Km/mmWva4JdWjD7jJlrcOi1
	EA78COSZXrQHtQTlf20nX7qzcekECDcsqpR5vX1pNUYmijj1sZoXzSkAYB9AX0kyHIyEICfrLgYDx
	rgI+SZSwtTVFYvLp0ZVHgmRCkZAghNJ893a01eKa72przYZEMuA3Dj8Ltr7icqdxJHu4Bb8HMCmhi
	4Bn+u+Vr6sgMU27jKtpV5l8auQnC+OCRt6qbUwe04YYo5jS4Fv5Awi/2hG3uL9beqc4/y65V8W16s
	b1X7Kbuo9A16X/lQK8jEY2lGipTbLJHk4ajhMtVrY6HhWobCyFjGBk+MmBqBQMZUq9IwB7OOkvaw8
	GmebWOq3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxK3C-0006Km-Em; Mon, 20 Jul 2020 00:53:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxK34-0006IV-EK; Mon, 20 Jul 2020 00:52:55 +0000
X-UUID: 20324e38b5324ef28b901ca3d8ea8bdf-20200719
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=fK12aNjAC+/AJxmQTRbfVWU1gQkyXtjxqLX21iFBYoU=; 
 b=rOdJPl/37mZgYf3oSSy2tZ7yuxmfc/us8Aa02RAHXTGxVgtK0mkdXFaCkPwtKu4uQo2yjsmeTS1Bq02zmZn428rSv912wPVzdzvRG4pnKiWvXWvmjfZtHYM7X3cH2XFFMycZsjOq0TnDrCpSlJf6e4FB1Ib43LEpwrR8nfDuzZM=;
X-UUID: 20324e38b5324ef28b901ca3d8ea8bdf-20200719
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-hung.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 995018658; Sun, 19 Jul 2020 16:52:50 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 19 Jul 2020 17:42:49 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Jul 2020 08:42:44 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 20 Jul 2020 08:42:43 +0800
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
Subject: [PATCH v7 3/4] mmc: mediatek: command queue support
Date: Mon, 20 Jul 2020 08:42:38 +0800
Message-ID: <1595205759-5825-4-git-send-email-chun-hung.wu@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1595205759-5825-1-git-send-email-chun-hung.wu@mediatek.com>
References: <1595205759-5825-1-git-send-email-chun-hung.wu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 69AF0FBCE823458F6BE8E49ADA2CC2E69FB2B44E72088186CACC6132F38427DA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200719_205254_741790_A11ED592 
X-CRM114-Status: GOOD (  23.49  )
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
a. Add msdc_set_busy_timeout() to calculate emmc write timeout.
b. Connect mtk msdc driver to cqhci driver through
   host->cq_host->ops = &msdc_cmdq_ops;
c. msdc_cmdq_irq() will link up with cqchi_irq(). Besides, it provides
   more irq error messages like RSPCRCERR/CMDTO/DATACRCERR/DATTMO.
d. Select kernel config MMC_CQHCI for MMC_MTK

Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
---
 drivers/mmc/host/Kconfig  |   1 +
 drivers/mmc/host/mtk-sd.c | 115 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 116 insertions(+)

diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
index 3b706af..9c89a5b 100644
--- a/drivers/mmc/host/Kconfig
+++ b/drivers/mmc/host/Kconfig
@@ -1009,6 +1009,7 @@ config MMC_MTK
 	tristate "MediaTek SD/MMC Card Interface support"
 	depends on HAS_DMA
 	select REGULATOR
+	select MMC_CQHCI
 	help
 	  This selects the MediaTek(R) Secure digital and Multimedia card Interface.
 	  If you have a machine with a integrated SD/MMC card reader, say Y or M here.
diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 347ed72..e560a06 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -31,6 +31,8 @@
 #include <linux/mmc/sdio.h>
 #include <linux/mmc/slot-gpio.h>
 
+#include "cqhci.h"
+
 #define MAX_BD_NUM          1024
 
 /*--------------------------------------------------------------------------*/
@@ -152,6 +154,7 @@
 #define MSDC_INT_DMA_BDCSERR    (0x1 << 17)	/* W1C */
 #define MSDC_INT_DMA_GPDCSERR   (0x1 << 18)	/* W1C */
 #define MSDC_INT_DMA_PROTECT    (0x1 << 19)	/* W1C */
+#define MSDC_INT_CMDQ           (0x1 << 28)	/* W1C */
 
 /* MSDC_INTEN mask */
 #define MSDC_INTEN_MMCIRQ       (0x1 << 0)	/* RW */
@@ -182,6 +185,7 @@
 /* SDC_CFG mask */
 #define SDC_CFG_SDIOINTWKUP     (0x1 << 0)	/* RW */
 #define SDC_CFG_INSWKUP         (0x1 << 1)	/* RW */
+#define SDC_CFG_WRDTOC          (0x1fff  << 2)  /* RW */
 #define SDC_CFG_BUSWIDTH        (0x3 << 16)	/* RW */
 #define SDC_CFG_SDIO            (0x1 << 19)	/* RW */
 #define SDC_CFG_SDIOIDE         (0x1 << 20)	/* RW */
@@ -230,6 +234,7 @@
 #define MSDC_PATCH_BIT_DECRCTMO   (0x1 << 30)	/* RW */
 
 #define MSDC_PATCH_BIT1_CMDTA     (0x7 << 3)    /* RW */
+#define MSDC_PB1_BUSY_CHECK_SEL   (0x1 << 7)    /* RW */
 #define MSDC_PATCH_BIT1_STOP_DLY  (0xf << 8)    /* RW */
 
 #define MSDC_PATCH_BIT2_CFGRESP   (0x1 << 15)   /* RW */
@@ -431,9 +436,11 @@ struct msdc_host {
 				 /* cmd response sample selection for HS400 */
 	bool hs400_mode;	/* current eMMC will run at hs400 mode */
 	bool internal_cd;	/* Use internal card-detect logic */
+	bool cqhci;		/* support eMMC hw cmdq */
 	struct msdc_save_para save_para; /* used when gate HCLK */
 	struct msdc_tune_para def_tune_para; /* default tune setting */
 	struct msdc_tune_para saved_tune_para; /* tune result of CMD21/CMD19 */
+	struct cqhci_host *cq_host;
 };
 
 static const struct mtk_mmc_compatible mt8135_compat = {
@@ -764,6 +771,15 @@ static void msdc_set_timeout(struct msdc_host *host, u64 ns, u64 clks)
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
@@ -1481,6 +1497,34 @@ static void msdc_enable_sdio_irq(struct mmc_host *mmc, int enb)
 		pm_runtime_put_noidle(host->dev);
 }
 
+static irqreturn_t msdc_cmdq_irq(struct msdc_host *host, u32 intsts)
+{
+	int cmd_err = 0, dat_err = 0;
+
+	if (intsts & MSDC_INT_RSPCRCERR) {
+		cmd_err = -EILSEQ;
+		dev_err(host->dev, "%s: CMD CRC ERR", __func__);
+	} else if (intsts & MSDC_INT_CMDTMO) {
+		cmd_err = -ETIMEDOUT;
+		dev_err(host->dev, "%s: CMD TIMEOUT ERR", __func__);
+	}
+
+	if (intsts & MSDC_INT_DATCRCERR) {
+		dat_err = -EILSEQ;
+		dev_err(host->dev, "%s: DATA CRC ERR", __func__);
+	} else if (intsts & MSDC_INT_DATTMO) {
+		dat_err = -ETIMEDOUT;
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
+
 static irqreturn_t msdc_irq(int irq, void *dev_id)
 {
 	struct msdc_host *host = (struct msdc_host *) dev_id;
@@ -1517,6 +1561,14 @@ static irqreturn_t msdc_irq(int irq, void *dev_id)
 		if (!(events & (event_mask & ~MSDC_INT_SDIOIRQ)))
 			break;
 
+		if ((host->mmc->caps2 & MMC_CAP2_CQE) &&
+		    (events & MSDC_INT_CMDQ)) {
+			msdc_cmdq_irq(host, events);
+			/* clear interrupts */
+			writel(events, host->base + MSDC_INT);
+			return IRQ_HANDLED;
+		}
+
 		if (!mrq) {
 			dev_err(host->dev,
 				"%s: MRQ=NULL; events=%08X; event_mask=%08X\n",
@@ -2201,6 +2253,36 @@ static int msdc_get_cd(struct mmc_host *mmc)
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
@@ -2217,6 +2299,11 @@ static int msdc_get_cd(struct mmc_host *mmc)
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
@@ -2237,6 +2324,12 @@ static void msdc_of_property_parse(struct platform_device *pdev,
 		host->hs400_cmd_resp_sel_rising = true;
 	else
 		host->hs400_cmd_resp_sel_rising = false;
+
+	if (of_property_read_bool(pdev->dev.of_node,
+				  "supports-cqe"))
+		host->cqhci = true;
+	else
+		host->cqhci = false;
 }
 
 static int msdc_drv_probe(struct platform_device *pdev)
@@ -2352,6 +2445,8 @@ static int msdc_drv_probe(struct platform_device *pdev)
 		mmc->caps2 |= MMC_CAP2_SDIO_IRQ_NOTHREAD;
 
 	mmc->caps |= MMC_CAP_CMD23;
+	if (host->cqhci)
+		mmc->caps2 |= MMC_CAP2_CQE | MMC_CAP2_CQE_DCMD;
 	/* MMC core transfer sizes tunable parameters */
 	mmc->max_segs = MAX_BD_NUM;
 	if (host->dev_comp->support_64g)
@@ -2367,6 +2462,26 @@ static int msdc_drv_probe(struct platform_device *pdev)
 		host->dma_mask = DMA_BIT_MASK(32);
 	mmc_dev(mmc)->dma_mask = &host->dma_mask;
 
+	if (mmc->caps2 & MMC_CAP2_CQE) {
+		host->cq_host = devm_kzalloc(host->mmc->parent,
+					     sizeof(*host->cq_host),
+					     GFP_KERNEL);
+		if (!host->cq_host) {
+			ret = -ENOMEM;
+			goto host_free;
+		}
+		host->cq_host->caps |= CQHCI_TASK_DESC_SZ_128;
+		host->cq_host->mmio = host->base + 0x800;
+		host->cq_host->ops = &msdc_cmdq_ops;
+		ret = cqhci_init(host->cq_host, mmc, true);
+		if (ret)
+			goto host_free;
+		mmc->max_segs = 128;
+		/* cqhci 16bit length */
+		/* 0 size, means 65536 so we don't have to -1 here */
+		mmc->max_seg_size = 64 * 1024;
+	}
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
