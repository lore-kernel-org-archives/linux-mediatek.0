Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA4C1C3DA7D
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 16:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B8eiPjXkkQb03Ja6E46VqXgqls7y1zhoNzwuQWkHhwE=; b=AXOKiDm1ScRGqqUGBFI+yv5LIX
	1JccDqudlZU6nMhsWEin8jSG9kclwzZyKUO3m0RzRLjnz5LrmEmPfYlCFUsobmqDlqHTU6ed9Myhj
	pUQ/nSc01OomC18HKz4jpwhuehJpm1rKYU+4y9vATynP/WwpudTf/odCEgWs8fPBFuLzh8bjQFFEk
	YRGk2CXdrSDZ4SO/NgHWim9ep45YaUaY5Jrt2PnS0F+LKo0Dpn+ZIHvpLeMhRqZOA5rx2ScNJOI++
	GZHwg9gxFJC0b4QqwIDz282Vbr20Vr1zGo2SSSG9QXRb8IbMcY5+Tth0yopayizj3LcZfiDnwrdRF
	me5mEiSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCjm0-002kF8-F1; Tue, 03 Jan 2023 16:04:20 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCgfi-001KeN-BG; Tue, 03 Jan 2023 12:45:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672749937; x=1704285937;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lwU98dyaymbW2/sk3kp9r5ZvEL697tsRK3f7uEUqPpM=;
  b=Q+Uj5hpDqctvhZd2kmtuusAnlQbqzAf4jLxj327ZxCWxgBa9uONGPHQY
   7KHQ8MuQsGdgGi/OwdmBsikVNeh3qZj9TkSYRUNTtOa2hjShAheUR0KtR
   MsxP/Yw5xE11f+r6dcuRIgsboex1joAlv/ha/yyeYVseuFY/tOAlkK+bK
   B0Q9lDXu4pcZsZ8cPrawuVD5+PVuCZv0+fn/rqEgGKsm9MhJQDw1FGh0A
   9ePZ1tT1iFXjYj4qt5Os+0HM8/YSmw7e1iKGkmg2QMRrAB+PIdnJhKAGT
   Hf33aOFOxqUN6zbA57UbBjzttD3s97D7DAFelGaeNsWAhCNj0Tp7nFAwb
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="383948135"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; 
   d="scan'208";a="383948135"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2023 04:45:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="685386050"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; 
   d="scan'208";a="685386050"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 03 Jan 2023 04:45:20 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pCgfO-003t61-15;
	Tue, 03 Jan 2023 14:45:18 +0200
Date: Tue, 3 Jan 2023 14:45:17 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: pavel@ucw.cz, lee@kernel.org, matthias.bgg@gmail.com,
	chiaen_wu@richtek.com, cy_huang@richtek.com,
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	szunichen@gmail.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alice Chen <alice_chen@richtek.com>
Subject: Re: [PATCH v15 RESEND 1/2] leds: rgb: mt6370: Add MediaTek MT6370
 current sink type LED Indicator support
Message-ID: <Y7QjXbTvI0N0i2WX@smile.fi.intel.com>
References: <cover.1672728620.git.chiaen_wu@richtek.com>
 <edc096c82d4aa7336e03315a22d2a59d467daf8f.1672728620.git.chiaen_wu@richtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <edc096c82d4aa7336e03315a22d2a59d467daf8f.1672728620.git.chiaen_wu@richtek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_044538_477271_F104881C 
X-CRM114-Status: GOOD (  25.32  )
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

On Tue, Jan 03, 2023 at 03:00:07PM +0800, ChiaEn Wu wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> The MediaTek MT6370 is a highly-integrated smart power management IC,
> which includes a single cell Li-Ion/Li-Polymer switching battery
> charger, a USB Type-C & Power Delivery (PD) controller, dual
> Flash LED current sources, a RGB LED driver, a backlight WLED driver,
> a display bias driver and a general LDO for portable devices.
> 
> Add support for the MediaTek MT6370 Current Sink Type LED Indicator
> driver. It can control four channels current-sink RGB LEDs with 3 modes:
> constant current, PWM, and breath mode.

...

> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2022 Richtek Technology Corp.
> + *
> + * Authors:
> + *   ChiYuan Huang <cy_huang@richtek.com>
> + *   Alice Chen <alice_chen@richtek.com>

> + *

Redundant blank line.

> + */

...

> +#include <asm-generic/unaligned.h>

asm/unaligned should work, no?

...

> +struct mt6370_pdata {
> +	const unsigned int *tfreq;
> +	unsigned int tfreq_len;

> +	u8 pwm_duty;

You may save a few bytes by moving this to the end of the structure.

> +	u16 reg_rgb1_tr;
> +	s16 reg_rgb_chrind_tr;
> +};

...

> +struct mt6370_priv {
> +	/* Per LED access lock */
> +	struct mutex lock;

> +	struct device *dev;
> +	struct regmap *regmap;

Isn't one can be derived from the other?

> +	struct regmap_field *fields[F_MAX_FIELDS];
> +	const struct reg_field *reg_fields;
> +	const struct linear_range *ranges;
> +	struct reg_cfg *reg_cfgs;
> +	const struct mt6370_pdata *pdata;
> +	unsigned int leds_count;
> +	unsigned int leds_active;
> +	struct mt6370_led leds[];
> +};

...

> +static int mt6370_isnk_brightness_set(struct led_classdev *lcdev,
> +				      enum led_brightness level)
> +{
> +	struct mt6370_led *led = container_of(lcdev, struct mt6370_led, isink);
> +	struct mt6370_priv *priv = led->priv;
> +	unsigned int enable;
> +	int ret;
> +
> +	mutex_lock(&priv->lock);
> +
> +	ret = regmap_field_read(priv->fields[F_RGB_EN], &enable);
> +	if (ret)
> +		goto out_unlock;

> +	if (level == 0) {
> +		enable &= ~MT6370_CHEN_BIT(led->index);
> +
> +		ret = mt6370_set_led_mode(priv, led->index,
> +					  MT6370_LED_REG_MODE);
> +		if (ret)
> +			goto out_unlock;
> +
> +		ret = regmap_field_write(priv->fields[F_RGB_EN], enable);
> +	} else {
> +		enable |= MT6370_CHEN_BIT(led->index);
> +
> +		ret = mt6370_set_led_brightness(priv, led->index, level);
> +		if (ret)
> +			goto out_unlock;
> +
> +		ret = regmap_field_write(priv->fields[F_RGB_EN], enable);
> +	}

Hmm... Wouldn't be below the equivalent?

	if (level == 0) {
		enable &= ~MT6370_CHEN_BIT(led->index);

		ret = mt6370_set_led_mode(priv, led->index,
					  MT6370_LED_REG_MODE);
		if (ret)
			goto out_unlock;
	} else {
		enable |= MT6370_CHEN_BIT(led->index);

		ret = mt6370_set_led_brightness(priv, led->index, level);
		if (ret)
			goto out_unlock;

	}

	ret = regmap_field_write(priv->fields[F_RGB_EN], enable);

(Of course even if (ret) goto... is duplicated, but probably better to leave it
 as is now)

> +out_unlock:
> +	mutex_unlock(&priv->lock);
> +
> +	return ret;
> +}

...

> +		fwnode_for_each_child_node(init_data->fwnode, child) {
> +			u32 reg, color;
> +
> +			ret = fwnode_property_read_u32(child, "reg", &reg);
> +			if (ret || reg > MT6370_LED_ISNK3 ||
> +			    priv->leds_active & BIT(reg))

I don't see where you drop a reference count.

> +				return -EINVAL;
> +
> +			ret = fwnode_property_read_u32(child, "color", &color);
> +			if (ret)

Ditto.

> +				return dev_err_probe(dev, ret,
> +						     "LED %d, no color specified\n",
> +						     led->index);
> +
> +			priv->leds_active |= BIT(reg);
> +			sub_led[num_color].color_index = color;
> +			sub_led[num_color].channel = reg;
> +			sub_led[num_color].intensity = 0;
> +			num_color++;
> +		}

...

> +	count = device_get_child_node_count(dev);
> +	if (!count || count > MT6370_MAX_LEDS)

Is the second really critical? Can it be just a warning and clamping of the
counter to the upper limit?

> +		return dev_err_probe(dev, -EINVAL,
> +				     "No child node or node count over max LED number %zu\n",
> +				      count);

...

> +	device_for_each_child_node(dev, child) {
> +		struct mt6370_led *led = priv->leds + i++;
> +		struct led_init_data init_data = { .fwnode = child };
> +		u32 reg, color;
> +
> +		ret = fwnode_property_read_u32(child, "reg", &reg);
> +		if (ret)

What about reference count?

> +			return dev_err_probe(dev, ret, "Failed to parse reg property\n");
> +
> +		if (reg >= MT6370_MAX_LEDS)

Ditto.

> +			return dev_err_probe(dev, -EINVAL, "Error reg property number\n");
> +
> +		ret = fwnode_property_read_u32(child, "color", &color);
> +		if (ret)

Ditto.

> +			return dev_err_probe(dev, ret, "Failed to parse color property\n");
> +
> +		if (color == LED_COLOR_ID_RGB || color == LED_COLOR_ID_MULTI)
> +			reg = MT6370_VIRTUAL_MULTICOLOR;
> +
> +		if (priv->leds_active & BIT(reg))

Ditto.

> +			return dev_err_probe(dev, -EINVAL, "Duplicate reg property\n");
> +
> +		priv->leds_active |= BIT(reg);
> +
> +		led->index = reg;
> +		led->priv = priv;
> +
> +		ret = mt6370_init_led_properties(led, &init_data);
> +		if (ret)

Ditto.

> +			return ret;
> +
> +		ret = mt6370_led_register(&pdev->dev, led, &init_data);
> +		if (ret)

Ditto.

> +			return ret;
> +	}
> +
> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko



