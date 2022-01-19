Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C204C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 10:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EQBElX9NqJG62w7uX9jHjLLEIVruefPUOwjuzJ2NR2c=; b=FuSyr+W2mcBr6D
	opCZ3Jt3N7sx9351ekgKYmI2ROOgQRxliDxi3R3matGVg5jpOfjEmFtEiiDsTGObblBvcoof+UITk
	9SR0FypztOFB+Tbydf4l3lHjZzQKAcYgFpHD1FAl13gm6h/3bSxba/niQHSe7NqbljLJb9XG6H4y4
	aoT9twYL4AXikDKW3nAtNS1zAjO5+tiyweLnSxGhF65qArGnoTUqXxtcbNPBIdVsnRLlAG2zVcmzd
	X1sT1XSRLcsE5U6Q+ZKIznvj7+YkVsJxndnpWR17A2Flb3FCqFBt8Qrl8GF0cPTnKLRkmjkobSf9V
	r+m/aQBixxYJEjPpvEnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA8Gg-004w7Y-7X; Wed, 19 Jan 2022 10:32:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA8GO-004vyn-Nu; Wed, 19 Jan 2022 10:32:26 +0000
X-UUID: e684b52df2c540d6a7e401adda16c565-20220119
X-UUID: e684b52df2c540d6a7e401adda16c565-20220119
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <axe.yang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 834425662; Wed, 19 Jan 2022 03:32:22 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Jan 2022 02:32:21 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 19 Jan 2022 18:32:19 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 19 Jan 2022 18:32:18 +0800
From: Axe Yang <axe.yang@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>
CC: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Satya Tangirala
 <satyat@google.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Axe Yang
 <axe.yang@mediatek.com>, Lucas Stach <dev@lynxeye.de>, Eric Biggers
 <ebiggers@google.com>, Andrew Jeffery <andrew@aj.id.au>, Stephen Boyd
 <swboyd@chromium.org>, Kiwoong Kim <kwmad.kim@samsung.com>, Yue Hu
 <huyue2@yulong.com>, Tian Tao <tiantao6@hisilicon.com>,
 <angelogioacchino.delregno@collabora.com>, <linux-mmc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 Yong Mao <yong.mao@mediatek.com>
Subject: [PATCH v4 3/3] mmc: mediatek: add support for SDIO eint IRQ
Date: Wed, 19 Jan 2022 18:32:12 +0800
Message-ID: <20220119103212.13158-4-axe.yang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119103212.13158-1-axe.yang@mediatek.com>
References: <20220119103212.13158-1-axe.yang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_023224_815521_615E76DC 
X-CRM114-Status: GOOD (  27.72  )
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

Add support for eint IRQ when MSDC is used as an SDIO host. This
feature requires SDIO device support async IRQ function. With this
feature, SDIO host can be awakened by SDIO card in suspend state,
without additional pin.

MSDC driver will time-share the SDIO DAT1 pin. During suspend, MSDC
turn off clock and switch SDIO DAT1 pin to GPIO mode. And during
resume, switch GPIO function back to DAT1 mode then turn on clock.

Some device tree property should be added or modified in MSDC node
to support SDIO eint IRQ. Pinctrls named state_dat1 and state_eint
are mandatory. And cap-sdio-async-irq flag is necessary since this
feature depends on asynchronous interrupt:
        &mmcX {
                ...
                pinctrl-names = "default", "state_uhs", "state_eint",
                                "state_dat1";
                ...
                pinctrl-2 = <&mmc2_pins_eint>;
                pinctrl-3 = <&mmc2_pins_dat1>;
                ...
                cap-sdio-async-irq;
                ...
        };

Signed-off-by: Axe Yang <axe.yang@mediatek.com>
Signed-off-by: Yong Mao <yong.mao@mediatek.com>
---
 drivers/mmc/host/mtk-sd.c | 124 +++++++++++++++++++++++++++++++++++---
 1 file changed, 116 insertions(+), 8 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 65037e1d7723..066616ddc88f 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2014-2015 MediaTek Inc.
+ * Copyright (c) 2022 MediaTek Inc.
  * Author: Chaotian.Jing <chaotian.jing@mediatek.com>
  */
 
@@ -9,6 +9,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
+#include <linux/gpio/consumer.h>
 #include <linux/iopoll.h>
 #include <linux/ioport.h>
 #include <linux/irq.h>
@@ -440,8 +441,12 @@ struct msdc_host {
 	struct pinctrl *pinctrl;
 	struct pinctrl_state *pins_default;
 	struct pinctrl_state *pins_uhs;
+	struct pinctrl_state *pins_eint;
+	struct pinctrl_state *pins_dat1;
 	struct delayed_work req_timeout;
 	int irq;		/* host interrupt */
+	int eint_irq;		/* device interrupt */
+	int sdio_irq_cnt;	/* irq enable cnt */
 	struct reset_control *reset;
 
 	struct clk *src_clk;	/* msdc source clock */
@@ -465,6 +470,7 @@ struct msdc_host {
 	bool hs400_tuning;	/* hs400 mode online tuning */
 	bool internal_cd;	/* Use internal card-detect logic */
 	bool cqhci;		/* support eMMC hw cmdq */
+	bool sdio_eint_ready;	/* Ready to support SDIO eint interrupt */
 	struct msdc_save_para save_para; /* used when gate HCLK */
 	struct msdc_tune_para def_tune_para; /* default tune setting */
 	struct msdc_tune_para saved_tune_para; /* tune result of CMD21/CMD19 */
@@ -1527,10 +1533,12 @@ static void msdc_enable_sdio_irq(struct mmc_host *mmc, int enb)
 	__msdc_enable_sdio_irq(host, enb);
 	spin_unlock_irqrestore(&host->lock, flags);
 
-	if (enb)
-		pm_runtime_get_noresume(host->dev);
-	else
-		pm_runtime_put_noidle(host->dev);
+	if (mmc->card && !mmc->card->cccr.enable_async_irq) {
+		if (enb)
+			pm_runtime_get_noresume(host->dev);
+		else
+			pm_runtime_put_noidle(host->dev);
+	}
 }
 
 static irqreturn_t msdc_cmdq_irq(struct msdc_host *host, u32 intsts)
@@ -2461,6 +2469,49 @@ static const struct mmc_host_ops mt_msdc_ops = {
 	.hw_reset = msdc_hw_reset,
 };
 
+static irqreturn_t msdc_sdio_eint_irq(int irq, void *dev_id)
+{
+	struct msdc_host *host = dev_id;
+	struct mmc_host *mmc = mmc_from_priv(host);
+
+	spin_lock(&host->lock);
+	if (likely(host->sdio_irq_cnt > 0)) {
+		disable_irq_nosync(host->eint_irq);
+		disable_irq_wake(host->eint_irq);
+		host->sdio_irq_cnt--;
+	}
+	spin_unlock(&host->lock);
+
+	sdio_signal_irq(mmc);
+
+	return IRQ_HANDLED;
+}
+
+static int msdc_request_dat1_eint_irq(struct msdc_host *host)
+{
+	struct gpio_desc *desc;
+	int irq, ret;
+
+	desc = devm_gpiod_get(host->dev, "eint", GPIOD_IN);
+	if (IS_ERR(desc))
+		return PTR_ERR(desc);
+
+	ret = gpiod_to_irq(desc);
+	if (ret < 0)
+		return ret;
+
+	irq = ret;
+	ret = devm_request_threaded_irq(host->dev, irq, NULL, msdc_sdio_eint_irq,
+					IRQF_TRIGGER_LOW | IRQF_ONESHOT | IRQF_NO_AUTOEN,
+					"sdio-eint", host);
+	if (ret)
+		return ret;
+
+	host->eint_irq = irq;
+
+	return 0;
+}
+
 static const struct cqhci_host_ops msdc_cmdq_ops = {
 	.enable         = msdc_cqe_enable,
 	.disable        = msdc_cqe_disable,
@@ -2631,6 +2682,23 @@ static int msdc_drv_probe(struct platform_device *pdev)
 		goto host_free;
 	}
 
+	if (!(mmc->caps2 & MMC_CAP2_NO_SDIO) && (mmc->caps2 & MMC_CAP2_SDIO_ASYNC_IRQ)) {
+		/* Support for SDIO eint irq */
+		host->pins_eint = pinctrl_lookup_state(host->pinctrl, "state_eint");
+		if (IS_ERR(host->pins_eint)) {
+			dev_dbg(&pdev->dev, "Cannot find pinctrl eint!\n");
+		} else {
+			host->pins_dat1 = pinctrl_lookup_state(host->pinctrl, "state_dat1");
+			if (IS_ERR(host->pins_dat1)) {
+				ret = dev_err_probe(&pdev->dev, PTR_ERR(host->pins_dat1),
+						    "Cannot find pinctrl dat1!\n");
+				goto host_free;
+			}
+
+			host->sdio_eint_ready = true;
+		}
+	}
+
 	msdc_of_property_parse(pdev, host);
 
 	host->dev = &pdev->dev;
@@ -2722,6 +2790,16 @@ static int msdc_drv_probe(struct platform_device *pdev)
 	if (ret)
 		goto release;
 
+	if (host->sdio_eint_ready) {
+		ret = msdc_request_dat1_eint_irq(host);
+		if (ret) {
+			dev_err(host->dev, "Failed to register data1 eint irq!\n");
+			goto release;
+		}
+
+		pinctrl_select_state(host->pinctrl, host->pins_dat1);
+	}
+
 	pm_runtime_set_active(host->dev);
 	pm_runtime_set_autosuspend_delay(host->dev, MTK_MMC_AUTOSUSPEND_DELAY);
 	pm_runtime_use_autosuspend(host->dev);
@@ -2841,16 +2919,31 @@ static void msdc_restore_reg(struct msdc_host *host)
 
 static int __maybe_unused msdc_runtime_suspend(struct device *dev)
 {
+	unsigned long flags;
 	struct mmc_host *mmc = dev_get_drvdata(dev);
 	struct msdc_host *host = mmc_priv(mmc);
 
 	msdc_save_reg(host);
+
+	if (host->sdio_eint_ready) {
+		disable_irq(host->irq);
+		pinctrl_select_state(host->pinctrl, host->pins_eint);
+		spin_lock_irqsave(&host->lock, flags);
+		if (host->sdio_irq_cnt == 0) {
+			enable_irq(host->eint_irq);
+			enable_irq_wake(host->eint_irq);
+			host->sdio_irq_cnt++;
+		}
+		sdr_clr_bits(host->base + SDC_CFG, SDC_CFG_SDIOIDE);
+		spin_unlock_irqrestore(&host->lock, flags);
+	}
 	msdc_gate_clock(host);
 	return 0;
 }
 
 static int __maybe_unused msdc_runtime_resume(struct device *dev)
 {
+	unsigned long flags;
 	struct mmc_host *mmc = dev_get_drvdata(dev);
 	struct msdc_host *host = mmc_priv(mmc);
 	int ret;
@@ -2860,10 +2953,25 @@ static int __maybe_unused msdc_runtime_resume(struct device *dev)
 		return ret;
 
 	msdc_restore_reg(host);
+
+	if (host->sdio_eint_ready) {
+		spin_lock_irqsave(&host->lock, flags);
+		if (host->sdio_irq_cnt > 0) {
+			disable_irq_nosync(host->eint_irq);
+			disable_irq_wake(host->eint_irq);
+			host->sdio_irq_cnt--;
+			sdr_set_bits(host->base + SDC_CFG, SDC_CFG_SDIOIDE);
+		} else {
+			sdr_clr_bits(host->base + MSDC_INTEN, MSDC_INTEN_SDIOIRQ);
+		}
+		spin_unlock_irqrestore(&host->lock, flags);
+		pinctrl_select_state(host->pinctrl, host->pins_uhs);
+		enable_irq(host->irq);
+	}
 	return 0;
 }
 
-static int __maybe_unused msdc_suspend(struct device *dev)
+static int __maybe_unused msdc_suspend_noirq(struct device *dev)
 {
 	struct mmc_host *mmc = dev_get_drvdata(dev);
 	int ret;
@@ -2877,13 +2985,13 @@ static int __maybe_unused msdc_suspend(struct device *dev)
 	return pm_runtime_force_suspend(dev);
 }
 
-static int __maybe_unused msdc_resume(struct device *dev)
+static int __maybe_unused msdc_resume_noirq(struct device *dev)
 {
 	return pm_runtime_force_resume(dev);
 }
 
 static const struct dev_pm_ops msdc_dev_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(msdc_suspend, msdc_resume)
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(msdc_suspend_noirq, msdc_resume_noirq)
 	SET_RUNTIME_PM_OPS(msdc_runtime_suspend, msdc_runtime_resume, NULL)
 };
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
