Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72CDBC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 11:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O5ZdMVFsR9tI/fLK/2X+RYKXPbh6MLfT5QbsSLE5+og=; b=P3ZUNDLEiWnA5l
	DsqmVeDrYjm951WjfMT5+29O2mksmMEih9cGJgucsZN/K0EPxjUV/NR/xs/qAQzF20k+2eWKeeKBd
	JlNgNsF18TMV+JYHi+V7J6xyr1oRw/8ulIPlx002Gl9Sv1YfVTmycx0npHwbrgXK9+QolRuduzH2N
	JkW0dt0VYsojUKzvjSt/caBzYspin0UXRE0wFYfSkcT8NHNA1aiOJi0teC/3c2KOWKbtemBLNZT3f
	ufqivaMHYhVIx7zbwJiaojmAeulrrFhK78tgUblCguavDMIRVJbKn1mf8IJMn6yeBlW48pMyXdhrV
	xx8h4nbLN+tHvBQSVVrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nre8G-006QKI-V6; Thu, 19 May 2022 11:15:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nre7v-006Q9b-2G; Thu, 19 May 2022 11:15:32 +0000
X-UUID: c58fb7ebbe794e48823b1d1068088f21-20220519
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:251e4383-e212-4018-b3ec-c2b2577d44a9, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:2a19b09, CLOUDID:9a6acde2-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: c58fb7ebbe794e48823b1d1068088f21-20220519
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <axe.yang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1419263203; Thu, 19 May 2022 04:15:21 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 May 2022 04:13:32 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 19 May 2022 19:13:30 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 19 May 2022 19:13:29 +0800
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
 <yong.mao@mediatek.com>
Subject: [PATCH v10 3/3] mmc: mediatek: add support for SDIO eint wakup IRQ
Date: Thu, 19 May 2022 19:13:23 +0800
Message-ID: <20220519111323.14586-4-axe.yang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519111323.14586-1-axe.yang@mediatek.com>
References: <20220519111323.14586-1-axe.yang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_041531_150111_E111E31A 
X-CRM114-Status: GOOD (  23.35  )
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
to support SDIO eint IRQ. Pinctrls "state_eint" is mandatory. Since
this feature depends on asynchronous interrupts, "wakeup-source",
"keep-power-in-suspend" and "cap-sdio-irq" flags are necessary, and
the interrupts list should be extended(the interrupt named with
sdio_wakeup_irq):
        &mmcX {
		...
		interrupt-names = "msdc_irq", "sdio_wakeup_irq";
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
Signed-off-by: Axe Yang <axe.yang@mediatek.com>
---
 drivers/mmc/host/mtk-sd.c | 73 +++++++++++++++++++++++++++++++++++----
 1 file changed, 67 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 195dc897188b..db245b1b03f4 100644
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
@@ -1520,17 +1523,34 @@ static void __msdc_enable_sdio_irq(struct msdc_host *host, int enb)
 
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
+	if (!mmc_card_enable_async_irq(mmc->card)) {
+		if (enb)
+			pm_runtime_get_noresume(host->dev);
+		else
+			pm_runtime_put_noidle(host->dev);
+	} else if (host->pins_eint) {
+		if (enb) {
+			pinctrl_select_state(host->pinctrl, host->pins_eint);
+
+			ret = dev_pm_set_dedicated_wake_irq_reverse(host->dev, host->eint_irq);
+			if (ret) {
+				dev_err(host->dev, "Failed to register SDIO wakeup irq!\n");
+				host->pins_eint = NULL;
+			} else
+				device_init_wakeup(host->dev, true);
+
+			pinctrl_select_state(host->pinctrl, host->pins_uhs);
+		} else
+			dev_pm_clear_wake_irq(host->dev);
+	}
 }
 
 static irqreturn_t msdc_cmdq_irq(struct msdc_host *host, u32 intsts)
@@ -2631,6 +2651,19 @@ static int msdc_drv_probe(struct platform_device *pdev)
 		goto host_free;
 	}
 
+	/* Support for SDIO eint irq ? */
+	if ((mmc->pm_caps & MMC_PM_WAKE_SDIO_IRQ) && (mmc->pm_caps & MMC_PM_KEEP_POWER)) {
+		host->eint_irq = platform_get_irq_byname(pdev, "sdio_wakeup_irq");
+		if (host->eint_irq > 0) {
+			host->pins_eint = pinctrl_lookup_state(host->pinctrl, "state_eint");
+			if (IS_ERR(host->pins_eint)) {
+				dev_err_probe(&pdev->dev, PTR_ERR(host->pins_eint),
+						    "Cannot find pinctrl eint!\n");
+				host->pins_eint = NULL;
+			}
+		}
+	}
+
 	msdc_of_property_parse(pdev, host);
 
 	host->dev = &pdev->dev;
@@ -2845,6 +2878,13 @@ static int __maybe_unused msdc_runtime_suspend(struct device *dev)
 	struct msdc_host *host = mmc_priv(mmc);
 
 	msdc_save_reg(host);
+
+	if (sdio_irq_claimed(mmc) && host->pins_eint) {
+		disable_irq(host->irq);
+		pinctrl_select_state(host->pinctrl, host->pins_eint);
+		sdr_clr_bits(host->base + SDC_CFG, SDC_CFG_SDIOIDE);
+	}
+
 	msdc_gate_clock(host);
 	return 0;
 }
@@ -2860,12 +2900,20 @@ static int __maybe_unused msdc_runtime_resume(struct device *dev)
 		return ret;
 
 	msdc_restore_reg(host);
+
+	if (sdio_irq_claimed(mmc) && host->pins_eint) {
+		sdr_set_bits(host->base + SDC_CFG, SDC_CFG_SDIOIDE);
+		pinctrl_select_state(host->pinctrl, host->pins_uhs);
+		enable_irq(host->irq);
+	}
+
 	return 0;
 }
 
 static int __maybe_unused msdc_suspend(struct device *dev)
 {
 	struct mmc_host *mmc = dev_get_drvdata(dev);
+	struct msdc_host *host = mmc_priv(mmc);
 	int ret;
 
 	if (mmc->caps2 & MMC_CAP2_CQE) {
@@ -2874,11 +2922,24 @@ static int __maybe_unused msdc_suspend(struct device *dev)
 			return ret;
 	}
 
+	if (sdio_irq_claimed(mmc) && host->pins_eint) {
+		pm_runtime_put_sync_suspend(dev);
+		return 0;
+	}
+
 	return pm_runtime_force_suspend(dev);
 }
 
 static int __maybe_unused msdc_resume(struct device *dev)
 {
+	struct mmc_host *mmc = dev_get_drvdata(dev);
+	struct msdc_host *host = mmc_priv(mmc);
+
+	if (sdio_irq_claimed(mmc) && host->pins_eint) {
+		pm_runtime_get_sync(dev);
+		return 0;
+	}
+
 	return pm_runtime_force_resume(dev);
 }
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
