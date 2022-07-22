Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37606C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jul 2022 14:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T1q/5UEvjKnmrGkeFgZRytr5DU5kdabjES1IFoO/gqw=; b=f4LcrJUxrw4cKbQoGBES8ceeKM
	RfZvmzRpRca+0nKx8M/73XBvvm+CGrJg7H4u02VuiBbdt/97OeiQptSFkY1vXwfVH2tx7CLujaU4S
	4H0p6CUwdOG/D4JNSMPaXTwIs1g4sxpwogXOYd/zLhTCU5mmEgbQInCGtiAa7RESYIomd4falUlcI
	9/azEey7ZdZewiWKmcknb9wfY7ig+VBnpsSIaRe68u6MMIvuBNdIlBzgY6Nh66bEx2TH9PdOh1LNm
	RHryz6oV1+GDz89h/b32zGfk6Jo6bGccHaVR4OxbzPOORjBRRReMlpB2Txs78vdZb2PJ/NZjQEZhf
	JQmV320A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEtVo-0061x5-Cj; Fri, 22 Jul 2022 14:20:16 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEtVP-0060w0-6W; Fri, 22 Jul 2022 14:19:53 +0000
Received: by mail-pj1-x102b.google.com with SMTP id t2-20020a17090a4e4200b001f21572f3a4so4367423pjl.0;
        Fri, 22 Jul 2022 07:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=T1q/5UEvjKnmrGkeFgZRytr5DU5kdabjES1IFoO/gqw=;
        b=N5b2E48s3MFxEm4zDb2HCPhQHt4Urn8emhJOhYSUlZ5Y57Ig163ukqY7GWAh8urYCS
         HoNK8KFmrEWeuERbb5IRJDMLkwGWh8d6gFpumktZTx0iitGevy10Z/qaTUWKsPNCQefi
         tgBpDzACKUqQ3W04Vse8a3Ym5LbgWuccclVvYtR+iXeeBcT8306sbxShnNhR+FkoELQE
         RgJE3w9ydSuqJoeZ5XqQT8lRdGQe7VOQ9EYrs+whGEOfoUv54IzpxHuvLRMOI+Y7qnjJ
         0ZTHyjIGqCWUJ4pDWCaeRp19ymx/h7u0u11UzLCg29nhJyqlZ4YsiPxey1skCyps7Zm9
         f8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=T1q/5UEvjKnmrGkeFgZRytr5DU5kdabjES1IFoO/gqw=;
        b=5KYb9KFkX9uSPzLF4VMNkR8Ey2/fZ6ASjy4fRtPiE1EJjYLAj+NQQ9iliXRxekVCym
         xCC9kuYqEc48zI276DfBOk1T2YEbYKonS16Oa2rrrGpRvAjNjXnWZo0MlT70kFomB3bY
         1rTBtj1S54FfH8dWFhXTri2iSS81A23N+jPRauAWxoubZ7hFawUZDlJK4yHZ3QumpUoq
         k/AcqOVViFvNF//GLb+2DpdwYy3utJALcx1S1CI6O4JsGyg2Leb3FrqmFT3aaDtZENJi
         bacd88c9/Kvta8XRWxxYI7+ud2NVbZ0Fj3f0RJWu5PovN4/PtH9XhAXzZWqRYCeSvcBa
         m/RA==
X-Gm-Message-State: AJIora/0Ddfi/PvgQx11yrvwevNEvlBNo1AozfpSaiu/4NXr6d7f830C
	JNQZuZX6wGYs2sc4qUW6ff0=
X-Google-Smtp-Source: AGRyM1tXVqYNUy+NFgrAHlDcM01iNexAN7CaAL0uAROXCpeeVwkXmKhPFoUuKttLJzcQ4dpaFH8V7g==
X-Received: by 2002:a17:903:120f:b0:15f:99f:9597 with SMTP id l15-20020a170903120f00b0015f099f9597mr651270plh.45.1658499587396;
        Fri, 22 Jul 2022 07:19:47 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y12-20020aa79aec000000b005252a06750esm3913898pfp.182.2022.07.22.07.19.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Jul 2022 07:19:45 -0700 (PDT)
Message-ID: <d0c94078-eec5-5924-a2c1-8c94c06364b8@roeck-us.net>
Date: Fri, 22 Jul 2022 07:19:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v6 08/13] usb: typec: tcpci_mt6370: Add MediaTek MT6370
 tcpci driver
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, lee.jones@linaro.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, heikki.krogerus@linux.intel.com,
 deller@gmx.de, andy.shevchenko@gmail.com
Cc: chiaen_wu@richtek.com, alice_chen@richtek.com, cy_huang@richtek.com,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org, szunichen@gmail.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20220722102407.2205-1-peterwu.pub@gmail.com>
 <20220722102407.2205-9-peterwu.pub@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220722102407.2205-9-peterwu.pub@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_071951_308672_0395B4E5 
X-CRM114-Status: GOOD (  32.82  )
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

On 7/22/22 03:24, ChiaEn Wu wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> The MediaTek MT6370 is a highly-integrated smart power management IC,
> which includes a single cell Li-Ion/Li-Polymer switching battery
> charger, a USB Type-C & Power Delivery (PD) controller, dual
> Flash LED current sources, a RGB LED driver, a backlight WLED driver,
> a display bias driver and a general LDO for portable devices.
> 
> Add support for the Type-C & Power Delivery controller in
> MediaTek MT6370 IC.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
> v6
> - Convert tcpci as device resource managed with 'devm_add_action_or_reset' API.
> - Refine remvoe callback.
> - Refine the commit text from 'This commit add' to 'Add'.
> ---
>   drivers/usb/typec/tcpm/Kconfig        |  11 ++
>   drivers/usb/typec/tcpm/Makefile       |   1 +
>   drivers/usb/typec/tcpm/tcpci_mt6370.c | 208 ++++++++++++++++++++++++++++++++++
>   3 files changed, 220 insertions(+)
>   create mode 100644 drivers/usb/typec/tcpm/tcpci_mt6370.c
> 
> diff --git a/drivers/usb/typec/tcpm/Kconfig b/drivers/usb/typec/tcpm/Kconfig
> index 073fd2e..e6b88ca 100644
> --- a/drivers/usb/typec/tcpm/Kconfig
> +++ b/drivers/usb/typec/tcpm/Kconfig
> @@ -35,6 +35,17 @@ config TYPEC_MT6360
>   	  USB Type-C. It works with Type-C Port Controller Manager
>   	  to provide USB PD and USB Type-C functionalities.
>   
> +config TYPEC_TCPCI_MT6370
> +	tristate "MediaTek MT6370 Type-C driver"
> +	depends on MFD_MT6370
> +	help
> +	  MediaTek MT6370 is a multi-functional IC that includes
> +	  USB Type-C. It works with Type-C Port Controller Manager
> +	  to provide USB PD and USB Type-C functionalities.
> +
> +	  This driver can also be built as a module. The module
> +	  will be called "tcpci_mt6370".
> +
>   config TYPEC_TCPCI_MAXIM
>   	tristate "Maxim TCPCI based Type-C chip driver"
>   	help
> diff --git a/drivers/usb/typec/tcpm/Makefile b/drivers/usb/typec/tcpm/Makefile
> index 7d499f3..906d9dc 100644
> --- a/drivers/usb/typec/tcpm/Makefile
> +++ b/drivers/usb/typec/tcpm/Makefile
> @@ -6,4 +6,5 @@ typec_wcove-y				:= wcove.o
>   obj-$(CONFIG_TYPEC_TCPCI)		+= tcpci.o
>   obj-$(CONFIG_TYPEC_RT1711H)		+= tcpci_rt1711h.o
>   obj-$(CONFIG_TYPEC_MT6360)		+= tcpci_mt6360.o
> +obj-$(CONFIG_TYPEC_TCPCI_MT6370)	+= tcpci_mt6370.o
>   obj-$(CONFIG_TYPEC_TCPCI_MAXIM)		+= tcpci_maxim.o
> diff --git a/drivers/usb/typec/tcpm/tcpci_mt6370.c b/drivers/usb/typec/tcpm/tcpci_mt6370.c
> new file mode 100644
> index 0000000..4f53319
> --- /dev/null
> +++ b/drivers/usb/typec/tcpm/tcpci_mt6370.c
> @@ -0,0 +1,208 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2022 Richtek Technology Corp.
> + *
> + * Author: ChiYuan Huang <cy_huang@richtek.com>
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_wakeup.h>
> +#include <linux/pm_wakeirq.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/usb/tcpm.h>
> +#include "tcpci.h"
> +
> +#define MT6370_REG_SYSCTRL8	0x9B
> +
> +#define MT6370_AUTOIDLE_MASK	BIT(3)
> +
> +#define MT6370_VENDOR_ID	0x29CF
> +#define MT6370_TCPC_DID_A	0x2170
> +
> +struct mt6370_priv {
> +	struct device *dev;
> +	struct regulator *vbus;
> +	struct tcpci *tcpci;
> +	struct tcpci_data tcpci_data;
> +};
> +
> +static const struct reg_sequence mt6370_reg_init[] = {
> +	REG_SEQ(0xA0, 0x1, 1000),
> +	REG_SEQ(0x81, 0x38, 0),
> +	REG_SEQ(0x82, 0x82, 0),
> +	REG_SEQ(0xBA, 0xFC, 0),
> +	REG_SEQ(0xBB, 0x50, 0),
> +	REG_SEQ(0x9E, 0x8F, 0),
> +	REG_SEQ(0xA1, 0x5, 0),
> +	REG_SEQ(0xA2, 0x4, 0),
> +	REG_SEQ(0xA3, 0x4A, 0),
> +	REG_SEQ(0xA4, 0x01, 0),
> +	REG_SEQ(0x95, 0x01, 0),
> +	REG_SEQ(0x80, 0x71, 0),
> +	REG_SEQ(0x9B, 0x3A, 1000),
> +};
> +
> +static int mt6370_tcpc_init(struct tcpci *tcpci, struct tcpci_data *data)
> +{
> +	u16 did;
> +	int ret;
> +
> +	ret = regmap_register_patch(data->regmap, mt6370_reg_init,
> +				    ARRAY_SIZE(mt6370_reg_init));
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_raw_read(data->regmap, TCPC_BCD_DEV, &did, sizeof(u16));
> +	if (ret)
> +		return ret;
> +
> +	if (did == MT6370_TCPC_DID_A)
> +		return regmap_write(data->regmap, TCPC_FAULT_CTRL, 0x80);
> +
> +	return 0;
> +}
> +
> +static int mt6370_tcpc_set_vconn(struct tcpci *tcpci, struct tcpci_data *data,
> +				 bool enable)
> +{
> +	return regmap_update_bits(data->regmap, MT6370_REG_SYSCTRL8,
> +				  MT6370_AUTOIDLE_MASK,
> +				  !enable ? MT6370_AUTOIDLE_MASK : 0);
> +}
> +
> +static int mt6370_tcpc_set_vbus(struct tcpci *tcpci, struct tcpci_data *data,
> +				bool source, bool sink)
> +{
> +	struct mt6370_priv *priv = container_of(data, struct mt6370_priv,
> +						tcpci_data);
> +	int ret;
> +
> +	ret = regulator_is_enabled(priv->vbus);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (ret && !source)
> +		return regulator_disable(priv->vbus);
> +
> +	if (!ret && source)
> +		return regulator_enable(priv->vbus);
> +
> +	return 0;
> +}
> +
> +static irqreturn_t mt6370_irq_handler(int irq, void *dev_id)
> +{
> +	struct mt6370_priv *priv = dev_id;
> +
> +	return tcpci_irq(priv->tcpci);
> +}
> +
> +static int mt6370_check_vendor_info(struct mt6370_priv *priv)
> +{
> +	struct regmap *regmap = priv->tcpci_data.regmap;
> +	u16 vid;
> +	int ret;
> +
> +	ret = regmap_raw_read(regmap, TCPC_VENDOR_ID, &vid, sizeof(u16));
> +	if (ret)
> +		return ret;
> +
> +	if (vid != MT6370_VENDOR_ID)
> +		return dev_err_probe(priv->dev, -ENODEV,
> +				     "Vendor ID not correct 0x%02x\n", vid);
> +
> +	return 0;
> +}
> +
> +static void mt6370_unregister_tcpci_port(void *tcpci)
> +{
> +	tcpci_unregister_port(tcpci);
> +}
> +
> +static int mt6370_tcpc_probe(struct platform_device *pdev)
> +{
> +	struct mt6370_priv *priv;
> +	struct device *dev = &pdev->dev;
> +	int irq, ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->dev = dev;
> +
> +	priv->tcpci_data.regmap = dev_get_regmap(dev->parent, NULL);
> +	if (!priv->tcpci_data.regmap)
> +		return dev_err_probe(dev, -ENODEV, "Failed to init regmap\n");
> +
> +	ret = mt6370_check_vendor_info(priv);
> +	if (ret)
> +		return ret;
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return dev_err_probe(dev, irq, "Failed to get irq\n");
> +
> +	/* Assign TCPCI feature and ops */
> +	priv->tcpci_data.auto_discharge_disconnect = 1;
> +	priv->tcpci_data.init = mt6370_tcpc_init;
> +	priv->tcpci_data.set_vconn = mt6370_tcpc_set_vconn;
> +
> +	priv->vbus = devm_regulator_get_optional(dev, "vbus");
> +	if (!IS_ERR(priv->vbus))
> +		priv->tcpci_data.set_vbus = mt6370_tcpc_set_vbus;
> +
> +	priv->tcpci = tcpci_register_port(dev, &priv->tcpci_data);
> +	if (IS_ERR(priv->tcpci))
> +		return dev_err_probe(dev, PTR_ERR(priv->tcpci),
> +				     "Failed to register tcpci port\n");
> +
> +	ret = devm_add_action_or_reset(dev, mt6370_unregister_tcpci_port,
> +				       priv->tcpci);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_request_threaded_irq(dev, irq, NULL, mt6370_irq_handler,
> +					IRQF_ONESHOT, dev_name(dev), priv);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to allocate irq\n");
> +
> +	device_init_wakeup(dev, true);
> +	dev_pm_set_wake_irq(dev, irq);
> +
> +	return 0;
> +}
> +
> +static int mt6370_tcpc_remove(struct platform_device *pdev)
> +{
> +	dev_pm_clear_wake_irq(&pdev->dev);
> +	device_init_wakeup(&pdev->dev, false);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id mt6370_tcpc_devid_table[] = {
> +	{ .compatible = "mediatek,mt6370-tcpc" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, mt6370_tcpc_devid_table);
> +
> +static struct platform_driver mt6370_tcpc_driver = {
> +	.driver = {
> +		.name = "mt6370-tcpc",
> +		.of_match_table = mt6370_tcpc_devid_table,
> +	},
> +	.probe = mt6370_tcpc_probe,
> +	.remove = mt6370_tcpc_remove,
> +};
> +module_platform_driver(mt6370_tcpc_driver);
> +
> +MODULE_AUTHOR("ChiYuan Huang <cy_huang@richtek.com>");
> +MODULE_DESCRIPTION("MT6370 USB Type-C Port Controller Interface Driver");
> +MODULE_LICENSE("GPL v2");


