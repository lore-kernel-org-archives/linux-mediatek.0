Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4E1DC433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 11:19:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C7B022CF7
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 11:19:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a4bAu+e3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iP5GfH4B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C7B022CF7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UQURBb46wssY5wQFiROTHLURAEJDG9LpfcaaKrVJd4Q=; b=a4bAu+e3iytid6ju25aQDldQm9
	M3AwrLuaaJCthhATCghJKpe5JXq1m4fEcQekXetHTGFedwtiWVhLQwaYJHUxIpewMtHnYh+O9bKuR
	Q0owSNT2Ok2c4X0TQK9p2SCBE+dR8+aMYhGvQM3PEY0UlCQKeZQx2g/RfBwwkmPWj008jGOaky7vU
	5n4nKu7oEdeRXFYL9z4yGSOKCIHLcyF+f0Kx1x6bEj+TaSPhCgnZLjauSDUCGK1OS+ZoCxxXmSR+n
	IXifTaevH1ZcQmx3VqGmBs7GnEecJ6+y3n+3JdoWL8GZVHeFhLDkrENJaYmDBC091kPj82TYtXN8M
	yiNeELpQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBFwH-0004p2-0j; Thu, 27 Aug 2020 11:19:29 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBFwB-0004nW-6c; Thu, 27 Aug 2020 11:19:24 +0000
Received: by mail-pg1-x544.google.com with SMTP id g29so2108034pgl.2;
 Thu, 27 Aug 2020 04:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4AB77AAFgWkjOgI8rZNbI2/uf+Pa/WR+XiSoAO41hDU=;
 b=iP5GfH4BYcFn1X7+ZaLSUUP8OFJgPiJ0YXqtbyak2fY+O+dRk8aIeqwW2sg2YIRtbl
 4561u6EklbPcqjXB73lkcd2pQPLAD3CpN/1lcFAegHNijNA6O8hmgc/99UPk/y3c3AZU
 W1qTMcQELkRJHqmgWPBYeW1a6UTbLXPCoDAyZ91PMUaDIX9WvdYuKDixpDbwlIoN/dBS
 baEwyQUGHCgraS23lIENCgkLA0/MJId5x4FySBjmpZJ+7iPPADXbOMdygwgwFStGaHQV
 5FzIhc84ICzEuV8M8zoBBZDl7GOE9sJIupMYO8i7/Uotr1/3YJHWYIGGjRqpRCE20hUO
 dU5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4AB77AAFgWkjOgI8rZNbI2/uf+Pa/WR+XiSoAO41hDU=;
 b=qWaixE+ZER0rVCJWHfODQrWZw/33m7NlBvNzx8QvkSAT3OOYydzBdKdQk4Scs0Dodd
 cohsBiSC9/u/9l8YXLzNrQg0Z4f6bgYl5RdowQilIXFpmaF8IZAX3IsdXgHkwiK0gJ24
 pF/cVdGW5tYwIk0dJ5TtmxVwnIOtxuYHoPUltEd/kv1becq7+ONckGvr13l90EW4mgU8
 pWHN7P+X7BKBJtL6KeTLCJb9LvTEi5jvPMe1udGMkr4CDuG3FlKo6VlEatYsM1KYhq2i
 5CannXlLLlhwnint1rFKm1I4MK/fxSTigRL2xsnF0Jji1NGUfDm4OsnD1u1h6eVNyiZs
 qiOQ==
X-Gm-Message-State: AOAM532OBnIeKlH059XpEz4OcLNBbahe/I6oN4zrdpdAYzHCcfXneyeM
 RxuDxsJDJWhDbHtbIIupqSw5MCSOmyQPIg==
X-Google-Smtp-Source: ABdhPJyS8KU9UqgkcpP9lUUeYiVT5tWm/4YdrdCIIWqlJ0PCb4r7qs1JbjY/8l3wZGSH7qp0kRqejw==
X-Received: by 2002:a17:902:7045:: with SMTP id h5mr5664144plt.4.1598527160923; 
 Thu, 27 Aug 2020 04:19:20 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:c678:1129:dc1b:b8d8:6430])
 by smtp.gmail.com with ESMTPSA id h64sm2411609pfe.201.2020.08.27.04.19.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Aug 2020 04:19:20 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, matthias.bgg@gmail.com,
 linux@roeck-us.net, heikki.krogerus@linux.intel.com
Subject: [PATCH v3 2/3] usb typec: mt6360: Rename driver/Kconfig/Makefile from
 mt6360 to mt636x
Date: Thu, 27 Aug 2020 19:18:56 +0800
Message-Id: <1598527137-6915-2-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598527137-6915-1-git-send-email-u0084500@gmail.com>
References: <1598527137-6915-1-git-send-email-u0084500@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_071923_332711_5550400C 
X-CRM114-Status: GOOD (  26.62  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: ChiYuan Huang <cy_huang@richtek.com>

1. Rename file form tcpci_mt6360.c to tcpci_mt636x.c
2. Rename internal function from mt6360 to mt636x, except the register
definition.
3. Change Kconfig/Makefile from MT6360 to MT636X.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 drivers/usb/typec/tcpm/Kconfig        |   6 +-
 drivers/usb/typec/tcpm/Makefile       |   2 +-
 drivers/usb/typec/tcpm/tcpci_mt6360.c | 212 ----------------------------------
 drivers/usb/typec/tcpm/tcpci_mt636x.c | 212 ++++++++++++++++++++++++++++++++++
 4 files changed, 216 insertions(+), 216 deletions(-)
 delete mode 100644 drivers/usb/typec/tcpm/tcpci_mt6360.c
 create mode 100644 drivers/usb/typec/tcpm/tcpci_mt636x.c

diff --git a/drivers/usb/typec/tcpm/Kconfig b/drivers/usb/typec/tcpm/Kconfig
index 58a64e1..c96141f 100644
--- a/drivers/usb/typec/tcpm/Kconfig
+++ b/drivers/usb/typec/tcpm/Kconfig
@@ -27,11 +27,11 @@ config TYPEC_RT1711H
 	  Type-C Port Controller Manager to provide USB PD and USB
 	  Type-C functionalities.
 
-config TYPEC_MT6360
-	tristate "Mediatek MT6360 Type-C driver"
+config TYPEC_MT636X
+	tristate "Mediatek MT636x Type-C driver"
 	depends on MFD_MT6360
 	help
-	  Mediatek MT6360 is a multi-functional IC that includes
+	  Mediatek MT636x is a multi-functional IC that includes
 	  USB Type-C. It works with Type-C Port Controller Manager
 	  to provide USB PD and USB Type-C functionalities.
 
diff --git a/drivers/usb/typec/tcpm/Makefile b/drivers/usb/typec/tcpm/Makefile
index 7592ccb..ccd7923 100644
--- a/drivers/usb/typec/tcpm/Makefile
+++ b/drivers/usb/typec/tcpm/Makefile
@@ -5,4 +5,4 @@ obj-$(CONFIG_TYPEC_WCOVE)	+= typec_wcove.o
 typec_wcove-y			:= wcove.o
 obj-$(CONFIG_TYPEC_TCPCI)	+= tcpci.o
 obj-$(CONFIG_TYPEC_RT1711H)	+= tcpci_rt1711h.o
-obj-$(CONFIG_TYPEC_MT6360)	+= tcpci_mt6360.o
+obj-$(CONFIG_TYPEC_MT636X)	+= tcpci_mt636x.o
diff --git a/drivers/usb/typec/tcpm/tcpci_mt6360.c b/drivers/usb/typec/tcpm/tcpci_mt6360.c
deleted file mode 100644
index f1bd9e0..00000000
--- a/drivers/usb/typec/tcpm/tcpci_mt6360.c
+++ /dev/null
@@ -1,212 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2020 MediaTek Inc.
- *
- * Author: ChiYuan Huang <cy_huang@richtek.com>
- */
-
-#include <linux/interrupt.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/of.h>
-#include <linux/platform_device.h>
-#include <linux/regmap.h>
-#include <linux/usb/tcpm.h>
-
-#include "tcpci.h"
-
-#define MT6360_REG_VCONNCTRL1	0x8C
-#define MT6360_REG_MODECTRL2	0x8F
-#define MT6360_REG_SWRESET	0xA0
-#define MT6360_REG_DEBCTRL1	0xA1
-#define MT6360_REG_DRPCTRL1	0xA2
-#define MT6360_REG_DRPCTRL2	0xA3
-#define MT6360_REG_I2CTORST	0xBF
-#define MT6360_REG_RXCTRL2	0xCF
-#define MT6360_REG_CTDCTRL2	0xEC
-
-/* MT6360_REG_VCONNCTRL1 */
-#define MT6360_VCONNCL_ENABLE	BIT(0)
-/* MT6360_REG_RXCTRL2 */
-#define MT6360_OPEN40M_ENABLE	BIT(7)
-/* MT6360_REG_CTDCTRL2 */
-#define MT6360_RPONESHOT_ENABLE	BIT(6)
-
-struct mt6360_tcpc_info {
-	struct tcpci_data tdata;
-	struct tcpci *tcpci;
-	struct device *dev;
-	int irq;
-};
-
-static inline int mt6360_tcpc_read16(struct regmap *regmap,
-				     unsigned int reg, u16 *val)
-{
-	return regmap_raw_read(regmap, reg, val, sizeof(u16));
-}
-
-static inline int mt6360_tcpc_write16(struct regmap *regmap,
-				      unsigned int reg, u16 val)
-{
-	return regmap_raw_write(regmap, reg, &val, sizeof(u16));
-}
-
-static int mt6360_tcpc_init(struct tcpci *tcpci, struct tcpci_data *tdata)
-{
-	struct regmap *regmap = tdata->regmap;
-	int ret;
-
-	ret = regmap_write(regmap, MT6360_REG_SWRESET, 0x01);
-	if (ret)
-		return ret;
-
-	/* after reset command, wait 1~2ms to wait IC action */
-	usleep_range(1000, 2000);
-
-	/* write all alert to masked */
-	ret = mt6360_tcpc_write16(regmap, TCPC_ALERT_MASK, 0);
-	if (ret)
-		return ret;
-
-	/* config I2C timeout reset enable , and timeout to 200ms */
-	ret = regmap_write(regmap, MT6360_REG_I2CTORST, 0x8F);
-	if (ret)
-		return ret;
-
-	/* config CC Detect Debounce : 26.7*val us */
-	ret = regmap_write(regmap, MT6360_REG_DEBCTRL1, 0x10);
-	if (ret)
-		return ret;
-
-	/* DRP Toggle Cycle : 51.2 + 6.4*val ms */
-	ret = regmap_write(regmap, MT6360_REG_DRPCTRL1, 4);
-	if (ret)
-		return ret;
-
-	/* DRP Duyt Ctrl : dcSRC: /1024 */
-	ret = mt6360_tcpc_write16(regmap, MT6360_REG_DRPCTRL2, 330);
-	if (ret)
-		return ret;
-
-	/* Enable VCONN Current Limit function */
-	ret = regmap_update_bits(regmap, MT6360_REG_VCONNCTRL1, MT6360_VCONNCL_ENABLE,
-				 MT6360_VCONNCL_ENABLE);
-	if (ret)
-		return ret;
-
-	/* Enable cc open 40ms when pmic send vsysuv signal */
-	ret = regmap_update_bits(regmap, MT6360_REG_RXCTRL2, MT6360_OPEN40M_ENABLE,
-				 MT6360_OPEN40M_ENABLE);
-	if (ret)
-		return ret;
-
-	/* Enable Rpdet oneshot detection */
-	ret = regmap_update_bits(regmap, MT6360_REG_CTDCTRL2, MT6360_RPONESHOT_ENABLE,
-				 MT6360_RPONESHOT_ENABLE);
-	if (ret)
-		return ret;
-
-	/* Set shipping mode off, AUTOIDLE on */
-	return regmap_write(regmap, MT6360_REG_MODECTRL2, 0x7A);
-}
-
-static irqreturn_t mt6360_irq(int irq, void *dev_id)
-{
-	struct mt6360_tcpc_info *mti = dev_id;
-
-	return tcpci_irq(mti->tcpci);
-}
-
-static int mt6360_tcpc_probe(struct platform_device *pdev)
-{
-	struct mt6360_tcpc_info *mti;
-	int ret;
-
-	mti = devm_kzalloc(&pdev->dev, sizeof(*mti), GFP_KERNEL);
-	if (!mti)
-		return -ENOMEM;
-
-	mti->dev = &pdev->dev;
-
-	mti->tdata.regmap = dev_get_regmap(pdev->dev.parent, NULL);
-	if (!mti->tdata.regmap) {
-		dev_err(&pdev->dev, "Failed to get parent regmap\n");
-		return -ENODEV;
-	}
-
-	mti->irq = platform_get_irq_byname(pdev, "PD_IRQB");
-	if (mti->irq < 0)
-		return mti->irq;
-
-	mti->tdata.init = mt6360_tcpc_init;
-	mti->tcpci = tcpci_register_port(&pdev->dev, &mti->tdata);
-	if (IS_ERR(mti->tcpci)) {
-		dev_err(&pdev->dev, "Failed to register tcpci port\n");
-		return PTR_ERR(mti->tcpci);
-	}
-
-	ret = devm_request_threaded_irq(mti->dev, mti->irq, NULL, mt6360_irq, IRQF_ONESHOT,
-					dev_name(&pdev->dev), mti);
-	if (ret) {
-		dev_err(mti->dev, "Failed to register irq\n");
-		tcpci_unregister_port(mti->tcpci);
-		return ret;
-	}
-
-	device_init_wakeup(&pdev->dev, true);
-	platform_set_drvdata(pdev, mti);
-
-	return 0;
-}
-
-static int mt6360_tcpc_remove(struct platform_device *pdev)
-{
-	struct mt6360_tcpc_info *mti = platform_get_drvdata(pdev);
-
-	disable_irq(mti->irq);
-	tcpci_unregister_port(mti->tcpci);
-	return 0;
-}
-
-static int __maybe_unused mt6360_tcpc_suspend(struct device *dev)
-{
-	struct mt6360_tcpc_info *mti = dev_get_drvdata(dev);
-
-	if (device_may_wakeup(dev))
-		enable_irq_wake(mti->irq);
-
-	return 0;
-}
-
-static int __maybe_unused mt6360_tcpc_resume(struct device *dev)
-{
-	struct mt6360_tcpc_info *mti = dev_get_drvdata(dev);
-
-	if (device_may_wakeup(dev))
-		disable_irq_wake(mti->irq);
-
-	return 0;
-}
-
-static SIMPLE_DEV_PM_OPS(mt6360_tcpc_pm_ops, mt6360_tcpc_suspend, mt6360_tcpc_resume);
-
-static const struct of_device_id __maybe_unused mt6360_tcpc_of_id[] = {
-	{ .compatible = "mediatek,mt6360-tcpc", },
-	{},
-};
-MODULE_DEVICE_TABLE(of, mt6360_tcpc_of_id);
-
-static struct platform_driver mt6360_tcpc_driver = {
-	.driver = {
-		.name = "mt6360-tcpc",
-		.pm = &mt6360_tcpc_pm_ops,
-		.of_match_table = mt6360_tcpc_of_id,
-	},
-	.probe = mt6360_tcpc_probe,
-	.remove = mt6360_tcpc_remove,
-};
-module_platform_driver(mt6360_tcpc_driver);
-
-MODULE_AUTHOR("ChiYuan Huang <cy_huang@richtek.com>");
-MODULE_DESCRIPTION("MT6360 USB Type-C Port Controller Interface Driver");
-MODULE_LICENSE("GPL v2");
diff --git a/drivers/usb/typec/tcpm/tcpci_mt636x.c b/drivers/usb/typec/tcpm/tcpci_mt636x.c
new file mode 100644
index 00000000..ca0f743
--- /dev/null
+++ b/drivers/usb/typec/tcpm/tcpci_mt636x.c
@@ -0,0 +1,212 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2020 MediaTek Inc.
+ *
+ * Author: ChiYuan Huang <cy_huang@richtek.com>
+ */
+
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/usb/tcpm.h>
+
+#include "tcpci.h"
+
+#define MT6360_REG_VCONNCTRL1	0x8C
+#define MT6360_REG_MODECTRL2	0x8F
+#define MT6360_REG_SWRESET	0xA0
+#define MT6360_REG_DEBCTRL1	0xA1
+#define MT6360_REG_DRPCTRL1	0xA2
+#define MT6360_REG_DRPCTRL2	0xA3
+#define MT6360_REG_I2CTORST	0xBF
+#define MT6360_REG_RXCTRL2	0xCF
+#define MT6360_REG_CTDCTRL2	0xEC
+
+/* MT6360_REG_VCONNCTRL1 */
+#define MT6360_VCONNCL_ENABLE	BIT(0)
+/* MT6360_REG_RXCTRL2 */
+#define MT6360_OPEN40M_ENABLE	BIT(7)
+/* MT6360_REG_CTDCTRL2 */
+#define MT6360_RPONESHOT_ENABLE	BIT(6)
+
+struct mt636x_tcpc_info {
+	struct tcpci_data tdata;
+	struct tcpci *tcpci;
+	struct device *dev;
+	int irq;
+};
+
+static inline int mt636x_tcpc_read16(struct regmap *regmap,
+				     unsigned int reg, u16 *val)
+{
+	return regmap_raw_read(regmap, reg, val, sizeof(u16));
+}
+
+static inline int mt636x_tcpc_write16(struct regmap *regmap,
+				      unsigned int reg, u16 val)
+{
+	return regmap_raw_write(regmap, reg, &val, sizeof(u16));
+}
+
+static int mt636x_tcpc_init(struct tcpci *tcpci, struct tcpci_data *tdata)
+{
+	struct regmap *regmap = tdata->regmap;
+	int ret;
+
+	ret = regmap_write(regmap, MT6360_REG_SWRESET, 0x01);
+	if (ret)
+		return ret;
+
+	/* after reset command, wait 1~2ms to wait IC action */
+	usleep_range(1000, 2000);
+
+	/* write all alert to masked */
+	ret = mt636x_tcpc_write16(regmap, TCPC_ALERT_MASK, 0);
+	if (ret)
+		return ret;
+
+	/* config I2C timeout reset enable , and timeout to 200ms */
+	ret = regmap_write(regmap, MT6360_REG_I2CTORST, 0x8F);
+	if (ret)
+		return ret;
+
+	/* config CC Detect Debounce : 26.7*val us */
+	ret = regmap_write(regmap, MT6360_REG_DEBCTRL1, 0x10);
+	if (ret)
+		return ret;
+
+	/* DRP Toggle Cycle : 51.2 + 6.4*val ms */
+	ret = regmap_write(regmap, MT6360_REG_DRPCTRL1, 4);
+	if (ret)
+		return ret;
+
+	/* DRP Duyt Ctrl : dcSRC: /1024 */
+	ret = mt636x_tcpc_write16(regmap, MT6360_REG_DRPCTRL2, 330);
+	if (ret)
+		return ret;
+
+	/* Enable VCONN Current Limit function */
+	ret = regmap_update_bits(regmap, MT6360_REG_VCONNCTRL1, MT6360_VCONNCL_ENABLE,
+				 MT6360_VCONNCL_ENABLE);
+	if (ret)
+		return ret;
+
+	/* Enable cc open 40ms when pmic send vsysuv signal */
+	ret = regmap_update_bits(regmap, MT6360_REG_RXCTRL2, MT6360_OPEN40M_ENABLE,
+				 MT6360_OPEN40M_ENABLE);
+	if (ret)
+		return ret;
+
+	/* Enable Rpdet oneshot detection */
+	ret = regmap_update_bits(regmap, MT6360_REG_CTDCTRL2, MT6360_RPONESHOT_ENABLE,
+				 MT6360_RPONESHOT_ENABLE);
+	if (ret)
+		return ret;
+
+	/* Set shipping mode off, AUTOIDLE on */
+	return regmap_write(regmap, MT6360_REG_MODECTRL2, 0x7A);
+}
+
+static irqreturn_t mt636x_irq(int irq, void *dev_id)
+{
+	struct mt636x_tcpc_info *mti = dev_id;
+
+	return tcpci_irq(mti->tcpci);
+}
+
+static int mt636x_tcpc_probe(struct platform_device *pdev)
+{
+	struct mt636x_tcpc_info *mti;
+	int ret;
+
+	mti = devm_kzalloc(&pdev->dev, sizeof(*mti), GFP_KERNEL);
+	if (!mti)
+		return -ENOMEM;
+
+	mti->dev = &pdev->dev;
+
+	mti->tdata.regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!mti->tdata.regmap) {
+		dev_err(&pdev->dev, "Failed to get parent regmap\n");
+		return -ENODEV;
+	}
+
+	mti->irq = platform_get_irq_byname(pdev, "PD_IRQB");
+	if (mti->irq < 0)
+		return mti->irq;
+
+	mti->tdata.init = mt636x_tcpc_init;
+	mti->tcpci = tcpci_register_port(&pdev->dev, &mti->tdata);
+	if (IS_ERR(mti->tcpci)) {
+		dev_err(&pdev->dev, "Failed to register tcpci port\n");
+		return PTR_ERR(mti->tcpci);
+	}
+
+	ret = devm_request_threaded_irq(mti->dev, mti->irq, NULL, mt636x_irq, IRQF_ONESHOT,
+					dev_name(&pdev->dev), mti);
+	if (ret) {
+		dev_err(mti->dev, "Failed to register irq\n");
+		tcpci_unregister_port(mti->tcpci);
+		return ret;
+	}
+
+	device_init_wakeup(&pdev->dev, true);
+	platform_set_drvdata(pdev, mti);
+
+	return 0;
+}
+
+static int mt636x_tcpc_remove(struct platform_device *pdev)
+{
+	struct mt636x_tcpc_info *mti = platform_get_drvdata(pdev);
+
+	disable_irq(mti->irq);
+	tcpci_unregister_port(mti->tcpci);
+	return 0;
+}
+
+static int __maybe_unused mt636x_tcpc_suspend(struct device *dev)
+{
+	struct mt636x_tcpc_info *mti = dev_get_drvdata(dev);
+
+	if (device_may_wakeup(dev))
+		enable_irq_wake(mti->irq);
+
+	return 0;
+}
+
+static int __maybe_unused mt636x_tcpc_resume(struct device *dev)
+{
+	struct mt636x_tcpc_info *mti = dev_get_drvdata(dev);
+
+	if (device_may_wakeup(dev))
+		disable_irq_wake(mti->irq);
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(mt636x_tcpc_pm_ops, mt636x_tcpc_suspend, mt636x_tcpc_resume);
+
+static const struct of_device_id __maybe_unused mt636x_tcpc_of_id[] = {
+	{ .compatible = "mediatek,mt6360-tcpc", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, mt636x_tcpc_of_id);
+
+static struct platform_driver mt636x_tcpc_driver = {
+	.driver = {
+		.name = "mt636x-tcpc",
+		.pm = &mt636x_tcpc_pm_ops,
+		.of_match_table = mt636x_tcpc_of_id,
+	},
+	.probe = mt636x_tcpc_probe,
+	.remove = mt636x_tcpc_remove,
+};
+module_platform_driver(mt636x_tcpc_driver);
+
+MODULE_AUTHOR("ChiYuan Huang <cy_huang@richtek.com>");
+MODULE_DESCRIPTION("MT636x USB Type-C Port Controller Interface Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
