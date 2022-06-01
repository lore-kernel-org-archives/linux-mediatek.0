Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F53BC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 09:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IZ+zhjtyqh8mUsHKIdI9+xMnbBWdFbNcDvrF9nffUlE=; b=NJYgfuV2aFlZXY
	E2NLGctaMIBz7wfq+21UQwufxmS4alKlpxa4YXGt62o6f4SqSvyP3BDt0A12WV4PzPtwgd8O85FRP
	bAg25A3Fsevl+3YaRj0n0/SAvd30X+oGq7aMrLi6IZPt/QuaLuwTytF89aDBFfUBkAENAElnwz3aZ
	XNUH9yO709B+RMwsHUEZG82Y7HL5OPdmW8TtvED6ZTK1+gbWI2bd9n15QxJOxrI+WYAinb0QfqShJ
	n9hF+nRJm8qMorUXKLy5MNENXztqlqVVSolZLdw3D+oNz31+zm4yicOCTE6XMVD5Mq61u6rX7VrIt
	iJ9PN2uB1cHpPnlbalsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwL3Y-00F4A3-Ms; Wed, 01 Jun 2022 09:54:24 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwKvt-00F17M-GB
	for linux-mediatek@lists.infradead.org; Wed, 01 Jun 2022 09:46:31 +0000
Received: by mail-wr1-x42e.google.com with SMTP id e25so1524316wra.11
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jun 2022 02:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Og6FPm4sRa8uBiwJMQ4UeYWy3rDVm5W0tUEfClTWPxE=;
        b=gZvVSMzlksdRRWkClbiKbVMJ9XTEssLAgwE8fZ//ZlvSg2el0nXOb8vwKKb4QjjKGd
         b0Mvq3t07Ze4UOAwJ7OUGeogoi50GCQePaG/JhB0N68gQ4SXN2o0AV+0V4tnlbDKjWN9
         FfdFyLSjSWpSG7OvnoeYLA0oHcGOmPJOanodt2aOSrQ3ftqidDbnDh0EU7RHwZrMjD/e
         wZ3ReN+aVZIe5oTKgs6Ov8vIR2DOnJgiD5xxgjrc7naFHHDbSyssszDj3wx/6MRLV91M
         kKSP/0cTvVes7C67yNg7qnfRqaJRtVFoBiN5NubZNXrIHgrNcNr7dTF2BFUicHHOZcJc
         c6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Og6FPm4sRa8uBiwJMQ4UeYWy3rDVm5W0tUEfClTWPxE=;
        b=gBnfLmOkB+PtqFB3ST+qwnx3ny49+ERo9loo08DSomV1w0npFF6GImBa4TbqnHO1VV
         WYrkm4+xR/6E+oCe6aZnuMByxKL9+TsvMSJakVnU57hoJRTZ71bvU3gxkYYyFq12NWQ0
         pmG54gHKeXpu1CqHcGy0kF/11DFa8MGAI9+Uctlbcs9683SY/RM56cDX36ha+7srJCTr
         FN6pON/AsZvB2uknC3sHp8HFIMKp7Ey4GFJNVUUqz0UfNQa1ZpcxYBBiJepsKJTXGhF2
         GjhBhEaj4FEO51NEf7jL2nU82xWlKwYQh545MpuMmO1bSvkEL7HIP96DYZnxPtCRfphi
         0QWg==
X-Gm-Message-State: AOAM533w0jWxh8t1CeC1P2a0HZ9r0os2/mAf73UNRGbV/jnWTIsmcoi0
	lnBsZU4SSxCcpErhVjr4+rBEcA==
X-Google-Smtp-Source: ABdhPJzZB7kdzKNqkGXawocBomBN1LXxN/TJFSKFbeKmnRK3bttFBwdbDOqE9RxtXkI+73YmA/Yabw==
X-Received: by 2002:a5d:5342:0:b0:210:c508:956d with SMTP id t2-20020a5d5342000000b00210c508956dmr1423246wrv.205.1654076786432;
        Wed, 01 Jun 2022 02:46:26 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id l24-20020a05600c1d1800b00397342bcfb7sm1575251wms.46.2022.06.01.02.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 02:46:25 -0700 (PDT)
Date: Wed, 1 Jun 2022 10:46:23 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: lee.jones@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
	gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
	lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
	heikki.krogerus@linux.intel.com, deller@gmx.de,
	cy_huang@richtek.com, alice_chen@richtek.com, chiaen_wu@richtek.com,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [RESEND 14/14] video: backlight: mt6370: Add Mediatek MT6370
 support
Message-ID: <20220601094623.jnwh2fgsqepy72tc@maple.lan>
References: <20220531111900.19422-1-peterwu.pub@gmail.com>
 <20220531111900.19422-15-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220531111900.19422-15-peterwu.pub@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_024629_659109_5756D825 
X-CRM114-Status: GOOD (  35.59  )
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

On Tue, May 31, 2022 at 07:19:00PM +0800, ChiaEn Wu wrote:
> From: ChiaEn Wu <chiaen_wu@richtek.com>
> 
> Add Mediatek MT6370 Backlight support.
> 
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> ---
>  drivers/video/backlight/Kconfig            |   8 +
>  drivers/video/backlight/Makefile           |   1 +
>  drivers/video/backlight/mt6370-backlight.c | 338 +++++++++++++++++++++
>  3 files changed, 347 insertions(+)
>  create mode 100644 drivers/video/backlight/mt6370-backlight.c
> 
> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index a003e02e13ce..d9868fbe7488 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -268,6 +268,14 @@ config BACKLIGHT_MAX8925
>  	  If you have a LCD backlight connected to the WLED output of MAX8925
>  	  WLED output, say Y here to enable this driver.
>  
> +config BACKLIGHT_MT6370

Is MT6370 really the best name for this driver? In other words, you
don't expect there to be any family resemblance between this backlight
and the backlight in the *next* Mediatak PMIC?

Moreover, 


> +	tristate "Mediatek MT6370 Backlight Driver"
> +	depends on MFD_MT6370
> +	help
> +	  Say Y here to enable MT6370 Backlight support.
> +	  It's commonly used to drive the display WLED. There're 4 channels
> +	  inisde, and each channel can provide up to 30mA current.

Nitpicking but this doesn't align well with other help texts in this
file.


> +
>  config BACKLIGHT_APPLE
>  	tristate "Apple Backlight Driver"
>  	depends on X86 && ACPI
> diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
> index cae2c83422ae..e815f3f1deff 100644
> --- a/drivers/video/backlight/Makefile
> +++ b/drivers/video/backlight/Makefile
> @@ -44,6 +44,7 @@ obj-$(CONFIG_BACKLIGHT_LP855X)		+= lp855x_bl.o
>  obj-$(CONFIG_BACKLIGHT_LP8788)		+= lp8788_bl.o
>  obj-$(CONFIG_BACKLIGHT_LV5207LP)	+= lv5207lp.o
>  obj-$(CONFIG_BACKLIGHT_MAX8925)		+= max8925_bl.o
> +obj-$(CONFIG_BACKLIGHT_MT6370)		+= mt6370-backlight.o
>  obj-$(CONFIG_BACKLIGHT_OMAP1)		+= omap1_bl.o
>  obj-$(CONFIG_BACKLIGHT_PANDORA)		+= pandora_bl.o
>  obj-$(CONFIG_BACKLIGHT_PCF50633)	+= pcf50633-backlight.o
> diff --git a/drivers/video/backlight/mt6370-backlight.c b/drivers/video/backlight/mt6370-backlight.c
> new file mode 100644
> index 000000000000..f8a8d33203ed
> --- /dev/null
> +++ b/drivers/video/backlight/mt6370-backlight.c
> @@ -0,0 +1,338 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/backlight.h>
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#define MT6370_REG_DEV_INFO		0x100
> +#define MT6370_REG_BL_EN		0x1A0
> +#define MT6370_REG_BL_BSTCTRL		0x1A1
> +#define MT6370_REG_BL_PWM		0x1A2
> +#define MT6370_REG_BL_DIM2		0x1A4
> +
> +#define MT6370_VENID_MASK		GENMASK(7, 4)
> +#define MT6370_BL_EXT_EN_MASK		BIT(7)
> +#define MT6370_BL_EN_MASK		BIT(6)
> +#define MT6370_BL_CONFIG_MASK		BIT(0)
> +#define MT6370_BL_CH_MASK		GENMASK(5, 2)
> +#define MT6370_BL_DIM2_MASK		GENMASK(2, 0)
> +#define MT6370_BL_DUMMY_6372_MASK	GENMASK(2, 0)
> +#define MT6370_BL_DIM2_6372_SHIFT	3
> +#define MT6370_BL_PWM_EN_MASK		BIT(7)
> +#define MT6370_BL_PWM_HYS_EN_MASK	BIT(2)
> +#define MT6370_BL_PWM_HYS_SEL_MASK	GENMASK(1, 0)
> +#define MT6370_BL_OVP_EN_MASK		BIT(7)
> +#define MT6370_BL_OVP_SEL_MASK		GENMASK(6, 5)
> +#define MT6370_BL_OC_EN_MASK		BIT(3)
> +#define MT6370_BL_OC_SEL_MASK		GENMASK(2, 1)
> +
> +#define MT6370_BL_MAX_BRIGHTNESS	2048
> +
> +enum {
> +	MT6370_VID_COMMON = 0,
> +	MT6370_VID_6372,
> +	MT6370_VID_MAX,

Unused.

> +};
> +
> +enum mt6370_prop_type {
> +	MT6370_PARSE_TYPE_BOOL = 0,
> +	MT6370_PARSE_TYPE_U8,
> +	MT6370_PARSE_TYPE_MAX,

Unused.

> +};
> +
> +struct mt6370_priv {
> +	int vid_type;
> +	struct backlight_device *bl;
> +	struct device *dev;
> +	struct gpio_desc *enable_gpio;
> +	struct regmap *regmap;
> +};
> +
> +static int mt6370_bl_update_status(struct backlight_device *bl_dev)
> +{
> +	struct mt6370_priv *priv = bl_get_data(bl_dev);
> +	int brightness = backlight_get_brightness(bl_dev);
> +	unsigned int enable_val;
> +	u8 brightness_val[2];
> +	int ret;
> +
> +	if (brightness) {
> +		brightness_val[0] = (brightness - 1) & MT6370_BL_DIM2_MASK;
> +		brightness_val[1] = (brightness - 1)
> +					>> fls(MT6370_BL_DIM2_MASK);
> +
> +		if (priv->vid_type == MT6370_VID_6372) {
> +			brightness_val[0] <<= MT6370_BL_DIM2_6372_SHIFT;
> +			brightness_val[0] |= MT6370_BL_DUMMY_6372_MASK;

Comment explaining why we have to set these bits would be useful.


> +		}
> +
> +		ret = regmap_raw_write(priv->regmap, MT6370_REG_BL_DIM2,
> +				       brightness_val, sizeof(brightness_val));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (priv->enable_gpio)
> +		gpiod_set_value(priv->enable_gpio, brightness ? 1 : 0);
> +
> +	enable_val = brightness ? MT6370_BL_EN_MASK : 0;
> +	return regmap_update_bits(priv->regmap, MT6370_REG_BL_EN,
> +				  MT6370_BL_EN_MASK, enable_val);
> +}
> +

<snip>

> +#define MT6370_DT_PROP_DECL(_name, _type, _reg, _mask, _max, _inv)	\
> +{									\
> +	.name = "mediatek,bled-" #_name,				\

I'd rather have the whole DT property in the macro (because it helps
with grepability).


> +	.type = MT6370_PARSE_TYPE_##_type,				\
> +	.reg = _reg,							\
> +	.mask = _mask,							\
> +	.max_val = _max,						\
> +	.invert = _inv,							\
> +}
> +
> +static int mt6370_init_backlight_properties(struct mt6370_priv *priv,
> +					    struct backlight_properties *props)
> +{
> +	struct device *dev = priv->dev;
> +	u8 prop_val;
> +	u32 brightness;
> +	unsigned int mask, val;
> +	static const struct {
> +		char *name;
> +		enum mt6370_prop_type type;
> +		unsigned int reg;
> +		unsigned int mask;
> +		u8 max_val;
> +		bool invert;
> +	} vendor_opt_props[] = {
> +		MT6370_DT_PROP_DECL(pwm-enable, BOOL, MT6370_REG_BL_PWM,
> +				    MT6370_BL_PWM_EN_MASK, 1, false),
> +		MT6370_DT_PROP_DECL(pwm-hys-enable, BOOL, MT6370_REG_BL_PWM,
> +				    MT6370_BL_PWM_HYS_EN_MASK, 1, false),
> +		MT6370_DT_PROP_DECL(pwm-hys-sel, U8, MT6370_REG_BL_PWM,
> +				    MT6370_BL_PWM_HYS_SEL_MASK, 3, false),
> +		MT6370_DT_PROP_DECL(ovp-level-sel, U8, MT6370_REG_BL_BSTCTRL,
> +				    MT6370_BL_OVP_SEL_MASK, 3, false),
> +		MT6370_DT_PROP_DECL(ovp-shutdown, BOOL, MT6370_REG_BL_BSTCTRL,
> +				    MT6370_BL_OVP_EN_MASK, 1, true),
> +		MT6370_DT_PROP_DECL(ocp-level-sel, U8, MT6370_REG_BL_BSTCTRL,
> +				    MT6370_BL_OC_SEL_MASK, 3, false),
> +		MT6370_DT_PROP_DECL(ocp-shutdown, BOOL, MT6370_REG_BL_BSTCTRL,
> +				    MT6370_BL_OC_EN_MASK, 1, true),
> +	}, *prop_now;
> +	int i, ret;
> +
> +	/* vendor optional properties */
> +	for (i = 0; i < ARRAY_SIZE(vendor_opt_props); i++) {
> +		prop_now = vendor_opt_props + i;
> +
> +		switch (prop_now->type) {
> +		case MT6370_PARSE_TYPE_BOOL:
> +			if (device_property_read_bool(dev, prop_now->name))
> +				val = 1;
> +			else
> +				val = 0;
> +			break;
> +		case MT6370_PARSE_TYPE_U8:
> +			ret = device_property_read_u8(dev, prop_now->name,
> +						      &prop_val);
> +			/* Property not exist, keep value in default */
> +			if (ret)
> +				continue;
> +
> +			val = min_t(u8, prop_val, prop_now->max_val);
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +
> +		if (prop_now->invert)
> +			val = prop_now->max_val - val;
> +
> +		val <<= ffs(prop_now->mask) - 1;
> +
> +		ret = regmap_update_bits(priv->regmap, prop_now->reg,
> +					 prop_now->mask, val);
> +		if (ret)
> +			return ret;
> +	}

Is it really worth all this tricky code for 7 properties?

The code would be much easier to read and maintain if it were coded
directly. For example, the inverted boolean code is hard to read and
can be written directly as:


        val = device_property_read_bool(dev, "mediatek,bled-ovp_shutdown");
	ret = regmap_update_bits(priv->regmap, MT6370_REG_BL_BST_CTRL,
	                         MT6370_BL_OVP_EN_MASK,
				 MT6370_BL_OVP_EN_MASK * !val);
	if (ret)
		return ret;

The direct coded approach will probably also pay off if you switch
the bindings over to microvolts/microamps since it becomes much more
natural to call out to a lookup function to convert it into a register
value.

> +
> +	/* common properties */
> +	ret = device_property_read_u32(dev, "max-brightness", &brightness);
> +	if (ret)
> +		brightness = MT6370_BL_MAX_BRIGHTNESS;
> +
> +	props->max_brightness = min_t(u32, brightness,
> +				      MT6370_BL_MAX_BRIGHTNESS);
> +
> +	ret = device_property_read_u32(dev, "default-brightness", &brightness);
> +	if (ret)
> +		brightness = props->max_brightness;
> +
> +	props->brightness = min_t(u32, brightness, props->max_brightness);
> +
> +
> +	ret = device_property_read_u8(dev, "mediatek,bled-channel-use",
> +				      &prop_val);
> +	if (ret) {
> +		dev_err(dev, "mediatek,bled-channel-use DT property missing\n");
> +		return ret;
> +	}
> +
> +	if (!prop_val) {
> +		dev_err(dev, "No channel specified\n");
> +		return -EINVAL;
> +	}

If we are going to validity check this property then it needs an upper
bounds check to (e.g. consider if property is set to 64).


> +
> +	mask = MT6370_BL_EXT_EN_MASK | MT6370_BL_CH_MASK;
> +	val = prop_val << (ffs(MT6370_BL_CH_MASK) - 1);
> +
> +	if (priv->enable_gpio)
> +		val |= MT6370_BL_EXT_EN_MASK;
> +
> +	return regmap_update_bits(priv->regmap, MT6370_REG_BL_EN, mask, val);
> +}
> +
> +static int mt6370_check_vendor_info(struct mt6370_priv *priv)

A comment explaining what variants this function is intended to
supported here would be good here.


> +{
> +	unsigned int dev_info, vid;
> +	int ret;
> +
> +	ret = regmap_read(priv->regmap, MT6370_REG_DEV_INFO, &dev_info);
> +	if (ret)
> +		return ret;
> +
> +	vid = FIELD_GET(MT6370_VENID_MASK, dev_info);
> +	if (vid == 0x9 || vid == 0xb)
> +		priv->vid_type = MT6370_VID_6372;
> +	else
> +		priv->vid_type = MT6370_VID_COMMON;
> +
> +	return 0;
> +}


No furthers comments so I trimmed the rest.


Daniel.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
