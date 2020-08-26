Return-Path: <SRS0=weZ6=CE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB7FFC433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 20:44:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F2EB207BC
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 20:44:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R6HeKZF1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iTfbGcog"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F2EB207BC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=H+VkA1bKXYO695fyGRzFKHw/3HlJ9k3tpGbAOTCGDYM=; b=R6HeKZF1M1IE6zJ/HPYhQsWOM
	jut7Ul2vf86pxcfifHsKZ0Txb6SQGMhc07z0WjRJXRSPBnHnoFRUVky33vnkEMdlv3vNXWdi9Po5a
	i2sIMS9Kcs1mjF2ohO52nD8CFKCMDhz9Wxay0xnvnU+pq+gDsn9Az+p0eKeA90AAc8Uk0vfHWIKXk
	iHh3TqIXmKsBieoYdjOgQ545IEWwRmcPnysq4udNT5CWR96IcPc7OzJggpZvupWYy6CyH1mB3fu08
	Ila6riwUXjZyg9RamkjjZhsOyZWZgA5I6J99KsLjJVbDTzaO57XvZa2CFBVCw93wNZNDzhymfRut7
	wcCb4w6oA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kB2HJ-0005zN-DQ; Wed, 26 Aug 2020 20:44:17 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kB2HH-0005yT-Cl; Wed, 26 Aug 2020 20:44:16 +0000
Received: by mail-pg1-x542.google.com with SMTP id g1so1717557pgm.9;
 Wed, 26 Aug 2020 13:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c6xYxHtdPsMmTmyT83g4v0jl89gNS4O1vCIlVcxSXgQ=;
 b=iTfbGcogI4rYLaTVdlbbQwGenz4DtvqFVz0pADP0e339WNaNU0otoHsomapXaCSbtH
 9KgGWhHRAuVuG4HfamVp9Dom8ziYQ8uGROMVvWt1TFRugZarpcK5opVXnS8nHzsCvbM4
 SgoZrD/rdTjtsOYcjN9b04DDZiGgsJb/89aAuoHO18dwnNZ2OKBTXlhspBNW5TeEQI1V
 UhwEG7aBC6AHcTAgl5vUb6CSBMGExxEc4uuenRL6u2SMiyhrRngS7YydqvdiluaJzkBZ
 Rd0Du5Bmo06M6jN7HdriHuJPTSKs4Q0M/+J8Fw4oGVr+I97oA0UVemxFcT9FmsN/QS/u
 Qy6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=c6xYxHtdPsMmTmyT83g4v0jl89gNS4O1vCIlVcxSXgQ=;
 b=mzglD7l/ie56nwBKJNkgKWYX5zzl3Dz5pDgaJ5DHDhkuEfF/+MMQwWaaW5ye4xhBEm
 8n/HvowlzM8s+H8aCc3EYNW7QWyPk+55pIBOQzbSEQ5fTUrIbXjv9IjiUb+j40sC6xzL
 w2V911ftm/zXglNgR13kLVsysiRNl+tDtxMgGKImh3WBAfvRv/fwoABkaLRtgnq+60cR
 SuAMBAQyN3RiJozFE1C0FXDKaRcP3VpLfPqJS+pnB66LlKMAANjCg125GXlQQrVTnoHB
 8aUSMthLNHULuMCEVdYJX+NgOp/nFe+VY3iFp6UJ84eZ8ObkTXam36IQ1vSsdgi+iK9X
 vuyQ==
X-Gm-Message-State: AOAM5333GK3eA52xSGPhtl9l1iPculaautWcMgTZ9TQYxeS29lQEWkJJ
 NGMLw6QNjQhEg+MGMUSsImU=
X-Google-Smtp-Source: ABdhPJxIrs9lvA/269YmsVqIX7mJ0RJ5+/Mk4r0hPR8n948ydo+k+lpJdpYtKu3JFTtoIkvC9sJEYQ==
X-Received: by 2002:a65:48c1:: with SMTP id o1mr11235341pgs.83.1598474653071; 
 Wed, 26 Aug 2020 13:44:13 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 in12sm2812142pjb.29.2020.08.26.13.44.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2020 13:44:12 -0700 (PDT)
Subject: Re: [PATCH 1/2] usb typec: mt6360: Add support for mt6360 Type-C
 driver
To: cy_huang <u0084500@gmail.com>, gregkh@linuxfoundation.org,
 robh+dt@kernel.org, matthias.bgg@gmail.com, heikki.krogerus@linux.intel.com
References: <1598440602-8648-1-git-send-email-u0084500@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <a7d1a5d9-97e9-bcf6-23f4-2c4be356913f@roeck-us.net>
Date: Wed, 26 Aug 2020 13:44:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1598440602-8648-1-git-send-email-u0084500@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_164415_449360_F17DC7E5 
X-CRM114-Status: GOOD (  27.58  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 8/26/20 4:16 AM, cy_huang wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Mediatek MT6360 is a multi-functional IC that includes USB Type-C.
> It works with Type-C Port Controller Manager to provide USB PD
> and USB Type-C functionalities.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
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
> index 00000000..6a28193
> --- /dev/null
> +++ b/drivers/usb/typec/tcpm/tcpci_mt6360.c
> @@ -0,0 +1,212 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// Copyright (C) 2020 MediaTek Inc.
> +//
> +// Author: ChiYuan Huang <cy_huang@richtek.com>
> +
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/usb/tcpm.h>

Is that needed ?

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
> +	if (mti->irq < 0) {
> +		dev_err(&pdev->dev, "Failed to get PD_IRQB irq\n");
> +		return mti->irq;
> +	}
> +
> +	mti->tdata.init = mt6360_tcpc_init;
> +	mti->tcpci = tcpci_register_port(&pdev->dev, &mti->tdata);
> +	if (IS_ERR_OR_NULL(mti->tcpci)) {
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
> +	tcpci_unregister_port(mti->tcpci);

That leaves interrupts enabled, which might be racy
because interrupts are still enabled here.

Guenter

> +	return 0;
> +}
> +
> +static int __maybe_unused mt6360_tcpc_suspend(struct device *dev)
> +{
> +	struct mt6360_tcpc_info *mti = dev_get_drvdata(dev);> +
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
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
