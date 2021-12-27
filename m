Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E52C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Dec 2021 08:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tv2metKfCXHQtstuEQV2HCFXdFCoibbUWSYKlotUyPI=; b=U3vluXrQD+ibyT
	uhu8Bj3Rt/5LntUDDrh2JhUnQ0B+yJ/lxQyquFNrw56zyrQs6fKyhi86kB9Tq3Gnv6Kkgg1yGhd6x
	Iq0tBa++r0+/PExlBsFhPUUBrdXdSLaq1O+nZIl+1dbH77FmCvKNkFJxalp42ojHjCN3futGc6TnS
	aWcdWbQozMsHDqQMxCPGvUzwU71/rfgi1f87n68iSxwOluVQgkIuwk1tBJddhF0cT3CnH2lTW62SB
	mpbo6yzFRwZEEa0h8BxkjjKDXEobOL7xEgi7d0x0zPq9FTerAuzI1jTA6RvmGLFxkFR2FNta2iJT7
	DeYf5rXkydKsFCCEUSwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1lWS-00GNRd-Ug; Mon, 27 Dec 2021 08:38:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1lW7-00GNK2-Su; Mon, 27 Dec 2021 08:38:05 +0000
X-UUID: 5c088ff2641a4c6ea4df09640fb071f2-20211227
X-UUID: 5c088ff2641a4c6ea4df09640fb071f2-20211227
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <axe.yang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 206507554; Mon, 27 Dec 2021 01:37:37 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Dec 2021 00:36:51 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 27 Dec 2021 16:36:49 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 27 Dec 2021 16:36:47 +0800
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
 <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH v1 3/3] mmc: mediatek: add support for SDIO eint irq
Date: Mon, 27 Dec 2021 16:36:41 +0800
Message-ID: <20211227083641.12538-4-axe.yang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211227083641.12538-1-axe.yang@mediatek.com>
References: <20211227083641.12538-1-axe.yang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_003803_974140_4A417B24 
X-CRM114-Status: GOOD (  24.05  )
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

Add support for eint irq when MSDC is used as an SDIO host. This
feature requires SDIO device support async irq function. With this
feature,SDIO host can be awakened by SDIO card in suspend state,
without additional pin.

MSDC driver will time-share the SDIO DAT1 pin. During suspend, MSDC
turn off clock and switch SDIO DAT1 pin to GPIO mode. And during
resume, switch GPIO function back to DAT1 mode then turn on clock.

Some device tree property should be added or modified in msdc node
to support SDIO eint irq. Pinctrls named state_dat1 and state_eint
are mandatory. And cap-sdio-async-int flag is necessary since this
feature depends on asynchronous interrupt:
	&mmcX {
		...
		pinctrl-names = "default", "state_uhs", "state_eint",
						"state_dat1";
		...
		pinctrl-2 = <&mmc2_pins_eint>;
		pinctrl-3 = <&mmc2_pins_dat1>;
		...
		cap-sdio-async-int;
		...
	};

Signed-off-by: Axe Yang <axe.yang@mediatek.com>
---
 drivers/mmc/host/mtk-sd.c | 113 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 107 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 4dfc246c5f95..8f23349f2963 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2014-2015 MediaTek Inc.
+ * Copyright (c) 2014-2021 MediaTek Inc.
  * Author: Chaotian.Jing <chaotian.jing@mediatek.com>
  */
 
@@ -432,9 +432,13 @@ struct msdc_host {
 	struct pinctrl *pinctrl;
 	struct pinctrl_state *pins_default;
 	struct pinctrl_state *pins_uhs;
+	struct pinctrl_state *pins_eint;
+	struct pinctrl_state *pins_dat1;
 	struct delayed_work req_timeout;
 	int irq;		/* host interrupt */
 	struct reset_control *reset;
+	int eint_irq;		/* device interrupt */
+	int sdio_irq_cnt;	/* irq enable cnt */
 
 	struct clk *src_clk;	/* msdc source clock */
 	struct clk *h_clk;      /* msdc h_clk */
@@ -1519,10 +1523,12 @@ static void msdc_enable_sdio_irq(struct mmc_host *mmc, int enb)
 	__msdc_enable_sdio_irq(host, enb);
 	spin_unlock_irqrestore(&host->lock, flags);
 
-	if (enb)
-		pm_runtime_get_noresume(host->dev);
-	else
-		pm_runtime_put_noidle(host->dev);
+	if (mmc->card && !mmc->card->cccr.enable_async_int) {
+		if (enb)
+			pm_runtime_get_noresume(host->dev);
+		else
+			pm_runtime_put_noidle(host->dev);
+	}
 }
 
 static irqreturn_t msdc_cmdq_irq(struct msdc_host *host, u32 intsts)
@@ -2380,6 +2386,49 @@ static const struct mmc_host_ops mt_msdc_ops = {
 	.hw_reset = msdc_hw_reset,
 };
 
+static irqreturn_t msdc_sdio_eint_irq(int irq, void *dev_id)
+{
+	unsigned long flags;
+	struct msdc_host *host = (struct msdc_host *)dev_id;
+	struct mmc_host *mmc = mmc_from_priv(host);
+
+	spin_lock_irqsave(&host->lock, flags);
+	if (likely(host->sdio_irq_cnt > 0)) {
+		disable_irq_nosync(host->eint_irq);
+		disable_irq_wake(host->eint_irq);
+		host->sdio_irq_cnt--;
+	}
+	spin_unlock_irqrestore(&host->lock, flags);
+
+	sdio_signal_irq(mmc);
+
+	return IRQ_HANDLED;
+}
+
+static int msdc_request_dat1_eint_irq(struct msdc_host *host)
+{
+	struct gpio_desc *desc;
+	int ret = 0;
+	int irq;
+
+	desc = devm_gpiod_get_index(host->dev, "eint", 0, GPIOD_IN);
+	if (IS_ERR(desc))
+		return PTR_ERR(desc);
+
+	irq = gpiod_to_irq(desc);
+	if (irq >= 0) {
+		irq_set_status_flags(irq, IRQ_NOAUTOEN);
+		ret = devm_request_threaded_irq(host->dev, irq, NULL, msdc_sdio_eint_irq,
+						IRQF_TRIGGER_LOW | IRQF_ONESHOT,
+						"sdio-eint", host);
+	} else {
+		ret = irq;
+	}
+
+	host->eint_irq = irq;
+	return ret;
+}
+
 static const struct cqhci_host_ops msdc_cmdq_ops = {
 	.enable         = msdc_cqe_enable,
 	.disable        = msdc_cqe_disable,
@@ -2534,6 +2583,19 @@ static int msdc_drv_probe(struct platform_device *pdev)
 		goto host_free;
 	}
 
+	/* Support for SDIO eint irq */
+	host->pins_eint = pinctrl_lookup_state(host->pinctrl, "state_eint");
+	if (IS_ERR(host->pins_eint)) {
+		dev_dbg(&pdev->dev, "Cannot find pinctrl eint!\n");
+	} else {
+		host->pins_dat1 = pinctrl_lookup_state(host->pinctrl, "state_dat1");
+		if (IS_ERR(host->pins_dat1)) {
+			ret = PTR_ERR(host->pins_dat1);
+			dev_err(&pdev->dev, "Cannot find pinctrl dat1!\n");
+			goto host_free;
+		}
+	}
+
 	msdc_of_property_parse(pdev, host);
 
 	host->dev = &pdev->dev;
@@ -2621,6 +2683,16 @@ static int msdc_drv_probe(struct platform_device *pdev)
 	if (ret)
 		goto release;
 
+	if (!IS_ERR(host->pins_eint) && !IS_ERR(host->pins_dat1)) {
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
@@ -2740,21 +2812,50 @@ static void msdc_restore_reg(struct msdc_host *host)
 
 static int __maybe_unused msdc_runtime_suspend(struct device *dev)
 {
+	unsigned long flags;
 	struct mmc_host *mmc = dev_get_drvdata(dev);
 	struct msdc_host *host = mmc_priv(mmc);
 
 	msdc_save_reg(host);
+
+	if (!IS_ERR(host->pins_eint)) {
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
 
 	msdc_ungate_clock(host);
 	msdc_restore_reg(host);
+	if (!IS_ERR(host->pins_eint)) {
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
 
@@ -2778,7 +2879,7 @@ static int __maybe_unused msdc_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops msdc_dev_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(msdc_suspend, msdc_resume)
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(msdc_suspend, msdc_resume)
 	SET_RUNTIME_PM_OPS(msdc_runtime_suspend, msdc_runtime_resume, NULL)
 };
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
