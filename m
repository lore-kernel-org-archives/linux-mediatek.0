Return-Path: <SRS0=MDtk=CY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEC4FC433E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 13:38:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 673D920738
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 13:38:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CidAXp0A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 673D920738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ziTI1H88g+96N9YScz23GRKMpIJrmjZCvaz0I5coOfg=; b=CidAXp0Au/mPW+GRZNS2daxLh
	Xmx168vaUHVnWc1e8qtN2Igc++pc4siYylF2dybkg7eLDPM7U9RlUyeU+VW7NJu9q6qAbLcrhhZvz
	3sH4DHQkH6++9nEaKvufMVaeYFID28TuMnZjX+8TI4IXrg0gxm76pPzHaX17HbyKNTdmS8fHQsLnz
	JJFP4XXOExfP7uRyq5X/qOZRFZrw6zA0nBH9PfI4jZm6CkUAUhlqhBzmv8cVv9Vj1HvO6zQt+S3YC
	SuImV/kTxNNfprE6eR7CePgJDkmk+BE8GxfJPFdhijNIzXlA0APp3R8EvvA2IiCW/9hNYak3uUxGq
	NGFE3vYzg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIBA4-0005D3-4l; Tue, 15 Sep 2020 13:38:20 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIB9z-0005CC-R0; Tue, 15 Sep 2020 13:38:16 +0000
IronPort-SDR: 0p1ArUkFOXQ5QltncbU4iMJpEL+Q1pWU97PeVFuwpGXkCFGlSwDjmHFrHYrOiffgmCiw8+gdce
 BWIBV8CJqd2A==
X-IronPort-AV: E=McAfee;i="6000,8403,9744"; a="158540976"
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; d="scan'208";a="158540976"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2020 06:38:13 -0700
IronPort-SDR: UA5G45UrrFxSjjaOkVhRKjvbwuQAo7vjns7bzlxOA1Dv9YdCEEWDrppQTHv/iu18DRmJSdppJJ
 LwFuPecApS6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; d="scan'208";a="409202978"
Received: from kuha.fi.intel.com ([10.237.72.162])
 by fmsmga001.fm.intel.com with SMTP; 15 Sep 2020 06:38:10 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Tue, 15 Sep 2020 16:38:09 +0300
Date: Tue, 15 Sep 2020 16:38:09 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: cy_huang <u0084500@gmail.com>
Subject: Re: [PATCH v5 1/2] usb typec: mt6360: Add support for mt6360 Type-C
 driver
Message-ID: <20200915133809.GL1139641@kuha.fi.intel.com>
References: <1598928042-22115-1-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1598928042-22115-1-git-send-email-u0084500@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_093816_005089_A1272B76 
X-CRM114-Status: GOOD (  33.71  )
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
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 matthias.bgg@gmail.com, linux@roeck-us.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Sep 01, 2020 at 10:40:41AM +0800, cy_huang wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Mediatek MT6360 is a multi-functional IC that includes USB Type-C.
> It works with Type-C Port Controller Manager to provide USB PD
> and USB Type-C functionalities.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> v1 to v2
> 1. Add fix to Prevent the race condition from interrupt and tcpci port
>    unregister during module remove.
> 
> v2 to v3
> 1. Change comment style for the head of source code.
> 2. No need to print error for platform_get_irq_byname.
> 3. Fix tcpci_register_port check from IS_ERR_OR_NULL to IS_ERR.
> 4. Rename driver/Kconfig/Makefile form mt6360 to mt636x.
> 5. Rename DT binding documents from mt6360 to mt636x.
> 
> v3 to v4
> 1. revert v3 item 4 for mt636x patch in driver/Kconfig/Makefile
> 2. revert v3 item 5 for mt636x DT binding document.
> 
> v4 to v5
> All changes are for DT binding document. See patch 2.
> 1. Fix schema style (using spaces instead of tabs)
> 2. move connector into the properties block.
> 3. Add ports node into the binding example refer to USB HS/SS/DPMux.
> 
> ---
>  drivers/usb/typec/tcpm/Kconfig        |   8 ++
>  drivers/usb/typec/tcpm/Makefile       |   1 +
>  drivers/usb/typec/tcpm/tcpci_mt6360.c | 212 ++++++++++++++++++++++++++++++++++
>  3 files changed, 221 insertions(+)
>  create mode 100644 drivers/usb/typec/tcpm/tcpci_mt6360.c
> 
> diff --git a/drivers/usb/typec/tcpm/Kconfig b/drivers/usb/typec/tcpm/Kconfig
> index fa3f393..58a64e1 100644
> --- a/drivers/usb/typec/tcpm/Kconfig
> +++ b/drivers/usb/typec/tcpm/Kconfig
> @@ -27,6 +27,14 @@ config TYPEC_RT1711H
>  	  Type-C Port Controller Manager to provide USB PD and USB
>  	  Type-C functionalities.
>  
> +config TYPEC_MT6360
> +	tristate "Mediatek MT6360 Type-C driver"
> +	depends on MFD_MT6360
> +	help
> +	  Mediatek MT6360 is a multi-functional IC that includes
> +	  USB Type-C. It works with Type-C Port Controller Manager
> +	  to provide USB PD and USB Type-C functionalities.
> +
>  endif # TYPEC_TCPCI
>  
>  config TYPEC_FUSB302
> diff --git a/drivers/usb/typec/tcpm/Makefile b/drivers/usb/typec/tcpm/Makefile
> index a5ff6c8..7592ccb 100644
> --- a/drivers/usb/typec/tcpm/Makefile
> +++ b/drivers/usb/typec/tcpm/Makefile
> @@ -5,3 +5,4 @@ obj-$(CONFIG_TYPEC_WCOVE)	+= typec_wcove.o
>  typec_wcove-y			:= wcove.o
>  obj-$(CONFIG_TYPEC_TCPCI)	+= tcpci.o
>  obj-$(CONFIG_TYPEC_RT1711H)	+= tcpci_rt1711h.o
> +obj-$(CONFIG_TYPEC_MT6360)	+= tcpci_mt6360.o
> diff --git a/drivers/usb/typec/tcpm/tcpci_mt6360.c b/drivers/usb/typec/tcpm/tcpci_mt6360.c
> new file mode 100644
> index 00000000..f1bd9e0
> --- /dev/null
> +++ b/drivers/usb/typec/tcpm/tcpci_mt6360.c
> @@ -0,0 +1,212 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2020 MediaTek Inc.
> + *
> + * Author: ChiYuan Huang <cy_huang@richtek.com>
> + */
> +
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/usb/tcpm.h>
> +
> +#include "tcpci.h"
> +
> +#define MT6360_REG_VCONNCTRL1	0x8C
> +#define MT6360_REG_MODECTRL2	0x8F
> +#define MT6360_REG_SWRESET	0xA0
> +#define MT6360_REG_DEBCTRL1	0xA1
> +#define MT6360_REG_DRPCTRL1	0xA2
> +#define MT6360_REG_DRPCTRL2	0xA3
> +#define MT6360_REG_I2CTORST	0xBF
> +#define MT6360_REG_RXCTRL2	0xCF
> +#define MT6360_REG_CTDCTRL2	0xEC
> +
> +/* MT6360_REG_VCONNCTRL1 */
> +#define MT6360_VCONNCL_ENABLE	BIT(0)
> +/* MT6360_REG_RXCTRL2 */
> +#define MT6360_OPEN40M_ENABLE	BIT(7)
> +/* MT6360_REG_CTDCTRL2 */
> +#define MT6360_RPONESHOT_ENABLE	BIT(6)
> +
> +struct mt6360_tcpc_info {
> +	struct tcpci_data tdata;
> +	struct tcpci *tcpci;
> +	struct device *dev;
> +	int irq;
> +};
> +
> +static inline int mt6360_tcpc_read16(struct regmap *regmap,
> +				     unsigned int reg, u16 *val)
> +{
> +	return regmap_raw_read(regmap, reg, val, sizeof(u16));
> +}
> +
> +static inline int mt6360_tcpc_write16(struct regmap *regmap,
> +				      unsigned int reg, u16 val)
> +{
> +	return regmap_raw_write(regmap, reg, &val, sizeof(u16));
> +}
> +
> +static int mt6360_tcpc_init(struct tcpci *tcpci, struct tcpci_data *tdata)
> +{
> +	struct regmap *regmap = tdata->regmap;
> +	int ret;
> +
> +	ret = regmap_write(regmap, MT6360_REG_SWRESET, 0x01);
> +	if (ret)
> +		return ret;
> +
> +	/* after reset command, wait 1~2ms to wait IC action */
> +	usleep_range(1000, 2000);
> +
> +	/* write all alert to masked */
> +	ret = mt6360_tcpc_write16(regmap, TCPC_ALERT_MASK, 0);
> +	if (ret)
> +		return ret;
> +
> +	/* config I2C timeout reset enable , and timeout to 200ms */
> +	ret = regmap_write(regmap, MT6360_REG_I2CTORST, 0x8F);
> +	if (ret)
> +		return ret;
> +
> +	/* config CC Detect Debounce : 26.7*val us */
> +	ret = regmap_write(regmap, MT6360_REG_DEBCTRL1, 0x10);
> +	if (ret)
> +		return ret;
> +
> +	/* DRP Toggle Cycle : 51.2 + 6.4*val ms */
> +	ret = regmap_write(regmap, MT6360_REG_DRPCTRL1, 4);
> +	if (ret)
> +		return ret;
> +
> +	/* DRP Duyt Ctrl : dcSRC: /1024 */
> +	ret = mt6360_tcpc_write16(regmap, MT6360_REG_DRPCTRL2, 330);
> +	if (ret)
> +		return ret;
> +
> +	/* Enable VCONN Current Limit function */
> +	ret = regmap_update_bits(regmap, MT6360_REG_VCONNCTRL1, MT6360_VCONNCL_ENABLE,
> +				 MT6360_VCONNCL_ENABLE);
> +	if (ret)
> +		return ret;
> +
> +	/* Enable cc open 40ms when pmic send vsysuv signal */
> +	ret = regmap_update_bits(regmap, MT6360_REG_RXCTRL2, MT6360_OPEN40M_ENABLE,
> +				 MT6360_OPEN40M_ENABLE);
> +	if (ret)
> +		return ret;
> +
> +	/* Enable Rpdet oneshot detection */
> +	ret = regmap_update_bits(regmap, MT6360_REG_CTDCTRL2, MT6360_RPONESHOT_ENABLE,
> +				 MT6360_RPONESHOT_ENABLE);
> +	if (ret)
> +		return ret;
> +
> +	/* Set shipping mode off, AUTOIDLE on */
> +	return regmap_write(regmap, MT6360_REG_MODECTRL2, 0x7A);
> +}
> +
> +static irqreturn_t mt6360_irq(int irq, void *dev_id)
> +{
> +	struct mt6360_tcpc_info *mti = dev_id;
> +
> +	return tcpci_irq(mti->tcpci);
> +}
> +
> +static int mt6360_tcpc_probe(struct platform_device *pdev)
> +{
> +	struct mt6360_tcpc_info *mti;
> +	int ret;
> +
> +	mti = devm_kzalloc(&pdev->dev, sizeof(*mti), GFP_KERNEL);
> +	if (!mti)
> +		return -ENOMEM;
> +
> +	mti->dev = &pdev->dev;
> +
> +	mti->tdata.regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +	if (!mti->tdata.regmap) {
> +		dev_err(&pdev->dev, "Failed to get parent regmap\n");
> +		return -ENODEV;
> +	}
> +
> +	mti->irq = platform_get_irq_byname(pdev, "PD_IRQB");
> +	if (mti->irq < 0)
> +		return mti->irq;
> +
> +	mti->tdata.init = mt6360_tcpc_init;
> +	mti->tcpci = tcpci_register_port(&pdev->dev, &mti->tdata);
> +	if (IS_ERR(mti->tcpci)) {
> +		dev_err(&pdev->dev, "Failed to register tcpci port\n");
> +		return PTR_ERR(mti->tcpci);
> +	}
> +
> +	ret = devm_request_threaded_irq(mti->dev, mti->irq, NULL, mt6360_irq, IRQF_ONESHOT,
> +					dev_name(&pdev->dev), mti);
> +	if (ret) {
> +		dev_err(mti->dev, "Failed to register irq\n");
> +		tcpci_unregister_port(mti->tcpci);
> +		return ret;
> +	}
> +
> +	device_init_wakeup(&pdev->dev, true);
> +	platform_set_drvdata(pdev, mti);
> +
> +	return 0;
> +}
> +
> +static int mt6360_tcpc_remove(struct platform_device *pdev)
> +{
> +	struct mt6360_tcpc_info *mti = platform_get_drvdata(pdev);
> +
> +	disable_irq(mti->irq);
> +	tcpci_unregister_port(mti->tcpci);
> +	return 0;
> +}
> +
> +static int __maybe_unused mt6360_tcpc_suspend(struct device *dev)
> +{
> +	struct mt6360_tcpc_info *mti = dev_get_drvdata(dev);
> +
> +	if (device_may_wakeup(dev))
> +		enable_irq_wake(mti->irq);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused mt6360_tcpc_resume(struct device *dev)
> +{
> +	struct mt6360_tcpc_info *mti = dev_get_drvdata(dev);
> +
> +	if (device_may_wakeup(dev))
> +		disable_irq_wake(mti->irq);
> +
> +	return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(mt6360_tcpc_pm_ops, mt6360_tcpc_suspend, mt6360_tcpc_resume);
> +
> +static const struct of_device_id __maybe_unused mt6360_tcpc_of_id[] = {
> +	{ .compatible = "mediatek,mt6360-tcpc", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, mt6360_tcpc_of_id);
> +
> +static struct platform_driver mt6360_tcpc_driver = {
> +	.driver = {
> +		.name = "mt6360-tcpc",
> +		.pm = &mt6360_tcpc_pm_ops,
> +		.of_match_table = mt6360_tcpc_of_id,
> +	},
> +	.probe = mt6360_tcpc_probe,
> +	.remove = mt6360_tcpc_remove,
> +};
> +module_platform_driver(mt6360_tcpc_driver);
> +
> +MODULE_AUTHOR("ChiYuan Huang <cy_huang@richtek.com>");
> +MODULE_DESCRIPTION("MT6360 USB Type-C Port Controller Interface Driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.7.4

-- 
heikki

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
