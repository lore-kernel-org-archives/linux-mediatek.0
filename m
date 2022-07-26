Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60ECFC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 07:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=do/el0VdBJQ7oygldyg63U42MflrrRExoG6zCRijKCY=; b=ZZFZ3R0DeqUnW2kdDfx2K4RYep
	6XektiEa9+IshQybJY/1XReYr4xZ0RXc2D2GsR6p8zXtTbTT9Bhs+mrS19yE9JJtQa0wSTOJ7XhhV
	faupaKVZMqLr2ekAGMGkLr/YDqgRAThuo4dDOoTr7761JB6rN58PoN8EGOmM064OYg4hi24KQPFrO
	AhC+tjvG1ucLY7EQgWwrM9O1RZfZPD01VVaJcnmbKXndPXiJ2Heu8zfsqJT3rRMiZ1ujzi05hec1c
	6qQQ49r/NNHeIQVCwGdQrCskhP2v7G08xKdMJ5RwSFXW6pzIXFGhwInqkm1G63S/dQVxjCXkkHmOo
	VX6w6OKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGEhr-009Dge-V3; Tue, 26 Jul 2022 07:10:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGEhb-009DWw-Ki; Tue, 26 Jul 2022 07:10:01 +0000
X-UUID: e494e4f7a52247f1b6d6044390d85535-20220726
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:1b1f1ad3-07db-4212-ad2d-3bbd6eeaba14,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:2251f5d3-912a-458b-a623-74f605a77e93,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: e494e4f7a52247f1b6d6044390d85535-20220726
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <axe.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1345465219; Tue, 26 Jul 2022 00:09:56 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Tue, 26 Jul 2022 14:28:51 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 26 Jul 2022 14:28:48 +0800
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
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Yong Mao
	<yong.mao@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v14 3/3] mmc: mediatek: add support for SDIO eint wakup IRQ
Date: Tue, 26 Jul 2022 14:28:42 +0800
Message-ID: <20220726062842.18846-4-axe.yang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220726062842.18846-1-axe.yang@mediatek.com>
References: <20220726062842.18846-1-axe.yang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_000959_710850_9E3769BF 
X-CRM114-Status: GOOD (  24.18  )
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

Add support for eint IRQ when MSDC is used as an SDIO host. This
feature requires SDIO device support async IRQ function. With this
feature, SDIO host can be awakened by SDIO card in suspend state,
without additional pin.

MSDC driver will time-share the SDIO DAT1 pin. During suspend, MSDC
turn off clock and switch SDIO DAT1 pin to GPIO mode. And during
resume, switch GPIO function back to DAT1 mode then turn on clock.

Some device tree property should be added or modified in MSDC node
to support SDIO eint IRQ. Pinctrls "state_eint" is mandatory. Since
this feature depends on asynchronous interrupts, "wakeup-source",
"keep-power-in-suspend" and "cap-sdio-irq" flags are necessary, and
the interrupts list should be extended(the interrupt named with
sdio_wakeup):
        &mmcX {
		...
		interrupt-names = "msdc", "sdio_wakeup";
		interrupts-extended = <...>,
                              	      <&pio xxx IRQ_TYPE_LEVEL_LOW>;
                ...
                pinctrl-names = "default", "state_uhs", "state_eint";
                ...
                pinctrl-2 = <&mmc2_pins_eint>;
                ...
                cap-sdio-irq;
		keep-power-in-suspend;
		wakeup-source;
                ...
        };

Co-developed-by: Yong Mao <yong.mao@mediatek.com>
Signed-off-by: Yong Mao <yong.mao@mediatek.com>
Reviewed-by: Chaotian Jing <chaotian.jing@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Axe Yang <axe.yang@mediatek.com>
---
 drivers/mmc/host/mtk-sd.c | 86 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 80 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index a4954b200d87..4ff73d1883de 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2014-2015 MediaTek Inc.
+ * Copyright (c) 2014-2015, 2022 MediaTek Inc.
  * Author: Chaotian.Jing <chaotian.jing@mediatek.com>
  */
 
@@ -20,6 +20,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
+#include <linux/pm_wakeirq.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
@@ -440,8 +441,10 @@ struct msdc_host {
 	struct pinctrl *pinctrl;
 	struct pinctrl_state *pins_default;
 	struct pinctrl_state *pins_uhs;
+	struct pinctrl_state *pins_eint;
 	struct delayed_work req_timeout;
 	int irq;		/* host interrupt */
+	int eint_irq;		/* interrupt from sdio device for waking up system */
 	struct reset_control *reset;
 
 	struct clk *src_clk;	/* msdc source clock */
@@ -1521,17 +1524,46 @@ static void __msdc_enable_sdio_irq(struct msdc_host *host, int enb)
 
 static void msdc_enable_sdio_irq(struct mmc_host *mmc, int enb)
 {
-	unsigned long flags;
 	struct msdc_host *host = mmc_priv(mmc);
+	unsigned long flags;
+	int ret;
 
 	spin_lock_irqsave(&host->lock, flags);
 	__msdc_enable_sdio_irq(host, enb);
 	spin_unlock_irqrestore(&host->lock, flags);
 
-	if (enb)
-		pm_runtime_get_noresume(host->dev);
-	else
-		pm_runtime_put_noidle(host->dev);
+	if (mmc_card_enable_async_irq(mmc->card) && host->pins_eint) {
+		if (enb) {
+			/*
+			 * In dev_pm_set_dedicated_wake_irq_reverse(), eint pin will be set to
+			 * GPIO mode. We need to restore it to SDIO DAT1 mode after that.
+			 * Since the current pinstate is pins_uhs, to ensure pinctrl select take
+			 * affect successfully, we change the pinstate to pins_eint firstly.
+			 */
+			pinctrl_select_state(host->pinctrl, host->pins_eint);
+			ret = dev_pm_set_dedicated_wake_irq_reverse(host->dev, host->eint_irq);
+
+			if (ret) {
+				dev_err(host->dev, "Failed to register SDIO wakeup irq!\n");
+				host->pins_eint = NULL;
+				pm_runtime_get_noresume(host->dev);
+			} else {
+				dev_dbg(host->dev, "SDIO eint irq: %d!\n", host->eint_irq);
+			}
+
+			pinctrl_select_state(host->pinctrl, host->pins_uhs);
+		} else {
+			dev_pm_clear_wake_irq(host->dev);
+		}
+	} else {
+		if (enb) {
+			/* Ensure host->pins_eint is NULL */
+			host->pins_eint = NULL;
+			pm_runtime_get_noresume(host->dev);
+		} else {
+			pm_runtime_put_noidle(host->dev);
+		}
+	}
 }
 
 static irqreturn_t msdc_cmdq_irq(struct msdc_host *host, u32 intsts)
@@ -2635,6 +2667,20 @@ static int msdc_drv_probe(struct platform_device *pdev)
 		goto host_free;
 	}
 
+	/* Support for SDIO eint irq ? */
+	if ((mmc->pm_caps & MMC_PM_WAKE_SDIO_IRQ) && (mmc->pm_caps & MMC_PM_KEEP_POWER)) {
+		host->eint_irq = platform_get_irq_byname(pdev, "sdio_wakeup");
+		if (host->eint_irq > 0) {
+			host->pins_eint = pinctrl_lookup_state(host->pinctrl, "state_eint");
+			if (IS_ERR(host->pins_eint)) {
+				dev_err(&pdev->dev, "Cannot find pinctrl eint!\n");
+				host->pins_eint = NULL;
+			} else {
+				device_init_wakeup(&pdev->dev, true);
+			}
+		}
+	}
+
 	msdc_of_property_parse(pdev, host);
 
 	host->dev = &pdev->dev;
@@ -2849,6 +2895,15 @@ static int __maybe_unused msdc_runtime_suspend(struct device *dev)
 	struct msdc_host *host = mmc_priv(mmc);
 
 	msdc_save_reg(host);
+
+	if (sdio_irq_claimed(mmc)) {
+		if (host->pins_eint) {
+			disable_irq(host->irq);
+			pinctrl_select_state(host->pinctrl, host->pins_eint);
+		}
+
+		__msdc_enable_sdio_irq(host, 0);
+	}
 	msdc_gate_clock(host);
 	return 0;
 }
@@ -2864,12 +2919,18 @@ static int __maybe_unused msdc_runtime_resume(struct device *dev)
 		return ret;
 
 	msdc_restore_reg(host);
+
+	if (sdio_irq_claimed(mmc) && host->pins_eint) {
+		pinctrl_select_state(host->pinctrl, host->pins_uhs);
+		enable_irq(host->irq);
+	}
 	return 0;
 }
 
 static int __maybe_unused msdc_suspend(struct device *dev)
 {
 	struct mmc_host *mmc = dev_get_drvdata(dev);
+	struct msdc_host *host = mmc_priv(mmc);
 	int ret;
 
 	if (mmc->caps2 & MMC_CAP2_CQE) {
@@ -2878,11 +2939,24 @@ static int __maybe_unused msdc_suspend(struct device *dev)
 			return ret;
 	}
 
+	/*
+	 * Bump up runtime PM usage counter otherwise dev->power.needs_force_resume will
+	 * not be marked as 1, pm_runtime_force_resume() will go out directly.
+	 */
+	if (sdio_irq_claimed(mmc) && host->pins_eint)
+		pm_runtime_get_noresume(dev);
+
 	return pm_runtime_force_suspend(dev);
 }
 
 static int __maybe_unused msdc_resume(struct device *dev)
 {
+	struct mmc_host *mmc = dev_get_drvdata(dev);
+	struct msdc_host *host = mmc_priv(mmc);
+
+	if (sdio_irq_claimed(mmc) && host->pins_eint)
+		pm_runtime_put_noidle(dev);
+
 	return pm_runtime_force_resume(dev);
 }
 
-- 
2.25.1


