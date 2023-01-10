Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23668C54EBE
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Jan 2023 05:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qrFoNNzAykK08ww31LT0pmrW6Z5LzPloGhl028dk7IM=; b=1ZQpd/DfDTQVGEk25uS9R5XJZF
	x20qyD0nSj/IPtf7KAGFPLNDwPunYwn3idHlcoenoUrv0cjLUq0F5JfmXL9vu1GUzwLVL5J+O8Jbu
	FopI24/CdN5tS9uL5xpP+5peHv3BHoX0u1lzFBWRcoJ83gpDpOJHfYCwYTI7481m0bDlo0jZdb+A0
	iEsfIr/hHYUoQD8fnXUblKJRW+/5Eyxdhypdv6cqISqAR62PyAGO64rgW/JEQtlJP2lQMgkaO14GB
	ZOJaFy+pyxfqgEi2dYllpAik2KZuSWO8n2iA4yJV6QUX+ftbpjKNQAqKNYKP2kciTCBcvPRXpMFEo
	y/9cI26w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF7OZ-005Mar-9D; Tue, 10 Jan 2023 05:41:59 +0000
Received: from mg.richtek.com ([220.130.44.152])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF7OV-005MYh-7w; Tue, 10 Jan 2023 05:41:58 +0000
X-MailGates: (flag:4,DYNAMIC,BADHELO,RELAY,NOHOST:PASS)(compute_score:DE
	LIVER,40,3)
Received: from 192.168.10.47
	by mg.richtek.com with MailGates ESMTP Server V5.0(16481:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>); Tue, 10 Jan 2023 13:41:11 +0800 (CST)
Received: from ex4.rt.l (192.168.10.47) by ex4.rt.l (192.168.10.47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Tue, 10 Jan
 2023 13:41:11 +0800
Received: from linuxcarl2.richtek.com (192.168.10.154) by ex4.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1118.20 via Frontend
 Transport; Tue, 10 Jan 2023 13:41:11 +0800
Date: Tue, 10 Jan 2023 13:41:11 +0800
From: ChiYuan Huang <cy_huang@richtek.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: ChiaEn Wu <peterwu.pub@gmail.com>, <pavel@ucw.cz>, <lee@kernel.org>,
	<matthias.bgg@gmail.com>, <chiaen_wu@richtek.com>,
	<linux-leds@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<szunichen@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Alice Chen
	<alice_chen@richtek.com>
Subject: Re: [PATCH v15 RESEND 1/2] leds: rgb: mt6370: Add MediaTek MT6370
 current sink type LED Indicator support
Message-ID: <20230110054111.GA30080@linuxcarl2.richtek.com>
References: <cover.1672728620.git.chiaen_wu@richtek.com>
 <edc096c82d4aa7336e03315a22d2a59d467daf8f.1672728620.git.chiaen_wu@richtek.com>
 <Y7QjXbTvI0N0i2WX@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y7QjXbTvI0N0i2WX@smile.fi.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_214155_753487_CEC4A32C 
X-CRM114-Status: GOOD (  34.80  )
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

On Tue, Jan 03, 2023 at 02:45:17PM +0200, Andy Shevchenko wrote:
> On Tue, Jan 03, 2023 at 03:00:07PM +0800, ChiaEn Wu wrote:
> > From: ChiYuan Huang <cy_huang@richtek.com>
> > 
> > The MediaTek MT6370 is a highly-integrated smart power management IC,
> > which includes a single cell Li-Ion/Li-Polymer switching battery
> > charger, a USB Type-C & Power Delivery (PD) controller, dual
> > Flash LED current sources, a RGB LED driver, a backlight WLED driver,
> > a display bias driver and a general LDO for portable devices.
> > 
> > Add support for the MediaTek MT6370 Current Sink Type LED Indicator
> > driver. It can control four channels current-sink RGB LEDs with 3 modes:
> > constant current, PWM, and breath mode.
> 
> ...
> 
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2022 Richtek Technology Corp.
> > + *
> > + * Authors:
> > + *   ChiYuan Huang <cy_huang@richtek.com>
> > + *   Alice Chen <alice_chen@richtek.com>
> 
> > + *
> 
> Redundant blank line.
> 
> > + */
> 
> ...
> 
> > +#include <asm-generic/unaligned.h>
> 
> asm/unaligned should work, no?
> 
Yes, it works, thanks.
> ...
> 
> > +struct mt6370_pdata {
> > +	const unsigned int *tfreq;
> > +	unsigned int tfreq_len;
> 
> > +	u8 pwm_duty;
> 
> You may save a few bytes by moving this to the end of the structure.
> 
> > +	u16 reg_rgb1_tr;
> > +	s16 reg_rgb_chrind_tr;
> > +};
> 
> ...
> 
> > +struct mt6370_priv {
> > +	/* Per LED access lock */
> > +	struct mutex lock;
> 
> > +	struct device *dev;
> > +	struct regmap *regmap;
> 
> Isn't one can be derived from the other?
>
No, regmap is derived by the parent dev.
But after reviewing its usage, 'dev' can be removed.
For this part, only regmap will be kept to check product info. 
> > +	struct regmap_field *fields[F_MAX_FIELDS];
> > +	const struct reg_field *reg_fields;
> > +	const struct linear_range *ranges;
> > +	struct reg_cfg *reg_cfgs;
> > +	const struct mt6370_pdata *pdata;
> > +	unsigned int leds_count;
> > +	unsigned int leds_active;
> > +	struct mt6370_led leds[];
> > +};
> 
> ...
> 
> > +static int mt6370_isnk_brightness_set(struct led_classdev *lcdev,
> > +				      enum led_brightness level)
> > +{
> > +	struct mt6370_led *led = container_of(lcdev, struct mt6370_led, isink);
> > +	struct mt6370_priv *priv = led->priv;
> > +	unsigned int enable;
> > +	int ret;
> > +
> > +	mutex_lock(&priv->lock);
> > +
> > +	ret = regmap_field_read(priv->fields[F_RGB_EN], &enable);
> > +	if (ret)
> > +		goto out_unlock;
> 
> > +	if (level == 0) {
> > +		enable &= ~MT6370_CHEN_BIT(led->index);
> > +
> > +		ret = mt6370_set_led_mode(priv, led->index,
> > +					  MT6370_LED_REG_MODE);
> > +		if (ret)
> > +			goto out_unlock;
> > +
> > +		ret = regmap_field_write(priv->fields[F_RGB_EN], enable);
> > +	} else {
> > +		enable |= MT6370_CHEN_BIT(led->index);
> > +
> > +		ret = mt6370_set_led_brightness(priv, led->index, level);
> > +		if (ret)
> > +			goto out_unlock;
> > +
> > +		ret = regmap_field_write(priv->fields[F_RGB_EN], enable);
> > +	}
> 
> Hmm... Wouldn't be below the equivalent?
> 
> 	if (level == 0) {
> 		enable &= ~MT6370_CHEN_BIT(led->index);
> 
> 		ret = mt6370_set_led_mode(priv, led->index,
> 					  MT6370_LED_REG_MODE);
> 		if (ret)
> 			goto out_unlock;
> 	} else {
> 		enable |= MT6370_CHEN_BIT(led->index);
> 
> 		ret = mt6370_set_led_brightness(priv, led->index, level);
> 		if (ret)
> 			goto out_unlock;
> 
> 	}
> 
> 	ret = regmap_field_write(priv->fields[F_RGB_EN], enable);
> 
> (Of course even if (ret) goto... is duplicated, but probably better to leave it
>  as is now)
> 
It's equivalent. Thanks.
> > +out_unlock:
> > +	mutex_unlock(&priv->lock);
> > +
> > +	return ret;
> > +}
> 
> ...
> 
> > +		fwnode_for_each_child_node(init_data->fwnode, child) {
> > +			u32 reg, color;
> > +
> > +			ret = fwnode_property_read_u32(child, "reg", &reg);
> > +			if (ret || reg > MT6370_LED_ISNK3 ||
> > +			    priv->leds_active & BIT(reg))
> 
> I don't see where you drop a reference count.
>
Fix in next. 
> > +				return -EINVAL;
> > +
> > +			ret = fwnode_property_read_u32(child, "color", &color);
> > +			if (ret)
> 
> Ditto.
> 
> > +				return dev_err_probe(dev, ret,
> > +						     "LED %d, no color specified\n",
> > +						     led->index);
> > +
> > +			priv->leds_active |= BIT(reg);
> > +			sub_led[num_color].color_index = color;
> > +			sub_led[num_color].channel = reg;
> > +			sub_led[num_color].intensity = 0;
> > +			num_color++;
> > +		}
> 
> ...
> 
> > +	count = device_get_child_node_count(dev);
> > +	if (!count || count > MT6370_MAX_LEDS)
> 
> Is the second really critical? Can it be just a warning and clamping of the
> counter to the upper limit?
> 
I think it's 'must', following by the next, it will dynamically allocate the memory by the count.
But sure, like as you said, also can clamp the counter.
To use the clamping, it means that need more code to check after 'device_for_each_node'.

I think it's better to put the pre-check here to save the release actions if any error.
> > +		return dev_err_probe(dev, -EINVAL,
> > +				     "No child node or node count over max LED number %zu\n",
> > +				      count);
> 
> ...
> 
> > +	device_for_each_child_node(dev, child) {
> > +		struct mt6370_led *led = priv->leds + i++;
> > +		struct led_init_data init_data = { .fwnode = child };
> > +		u32 reg, color;
> > +
> > +		ret = fwnode_property_read_u32(child, "reg", &reg);
> > +		if (ret)
> 
> What about reference count?
> 
Fix in next.
> > +			return dev_err_probe(dev, ret, "Failed to parse reg property\n");
> > +
> > +		if (reg >= MT6370_MAX_LEDS)
> 
> Ditto.
> 
> > +			return dev_err_probe(dev, -EINVAL, "Error reg property number\n");
> > +
> > +		ret = fwnode_property_read_u32(child, "color", &color);
> > +		if (ret)
> 
> Ditto.
> 
> > +			return dev_err_probe(dev, ret, "Failed to parse color property\n");
> > +
> > +		if (color == LED_COLOR_ID_RGB || color == LED_COLOR_ID_MULTI)
> > +			reg = MT6370_VIRTUAL_MULTICOLOR;
> > +
> > +		if (priv->leds_active & BIT(reg))
> 
> Ditto.
> 
> > +			return dev_err_probe(dev, -EINVAL, "Duplicate reg property\n");
> > +
> > +		priv->leds_active |= BIT(reg);
> > +
> > +		led->index = reg;
> > +		led->priv = priv;
> > +
> > +		ret = mt6370_init_led_properties(led, &init_data);
> > +		if (ret)
> 
> Ditto.
> 
> > +			return ret;
> > +
> > +		ret = mt6370_led_register(&pdev->dev, led, &init_data);
> > +		if (ret)
> 
> Ditto.
> 
> > +			return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

