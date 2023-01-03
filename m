Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BD3C53210
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 16:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q9E4rmFKR68thQMQ0Qacv3l3l+tnkOeB5ZYdx/ko1+E=; b=suDNBxLYddH5hCx8KJV+GiWAha
	+YflF+iHPjXsImr9NXDZoj5xQB9sr1WiDP51mOZtO+R9kofkdrOXFWHzg3rewfz85xx1olq3H6wR0
	/y/K/+o7HSsneyw61pbNDbXS1fLtNS+KQMCfX30QVqFZJ8Ayv4cWQFRfelu72fz7q3d4XKM79tXjz
	TLC227KGR2ve2Foc8p1E04lxTROGlD72CAyeikRavXh5tjNkJJ7Jm7Qo1qcuA4t3rCCHqvHw9Bd7x
	dG5SLHAMhNdeUw3QiDRBX9565VWnxBbeUQTqPeJoE5+0UguWhQZBzlWfUT7lC+StYk2mjGZNfV05W
	rQEH/Kgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCjqx-002mfH-KC; Tue, 03 Jan 2023 16:09:27 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCgzb-001OCB-Rm; Tue, 03 Jan 2023 13:06:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672751171; x=1704287171;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yBgdLlMhzv1mrtl8tYaZhXUeBm8whQ2iPQRyDqANgVc=;
  b=Nb2BzBZNrtApzPs8RFhyQOvkobyVMGG2gAUuvBdHEtQHdQuY9wOd9/Pp
   XzzswZGoSAqJc7aCRyJAt+5ZfYsL4mBQE3vCzDw2Yr99b37sJlOt5VRWm
   lN4h5qOPdvNkTB4HZSe6Sokr3NBUdmfFp9X5A2vuDzwsmANNgMiQd39oL
   W814Nn7cn4VhYXBDuxaSm1wyQXjO+NF4zMjUsFLIytPveekgSxatsSyJE
   k15hHSQAFhyPdbG/pun/1XwQAhkJOFZZGbke9ELJJYyKfkZ51Qlh7I/mg
   nq1Kt1dfenicH807FH9QYJUfRlWigdWcelzneGSYzPATZSu+np3J3ukwH
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="305159062"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; 
   d="scan'208";a="305159062"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2023 05:06:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="632453505"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; 
   d="scan'208";a="632453505"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 03 Jan 2023 05:06:00 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pCgzP-003tTQ-0C;
	Tue, 03 Jan 2023 15:05:59 +0200
Date: Tue, 3 Jan 2023 15:05:58 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: pavel@ucw.cz, lee@kernel.org, matthias.bgg@gmail.com,
	chiaen_wu@richtek.com, cy_huang@richtek.com,
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	szunichen@gmail.com, Alice Chen <alice_chen@richtek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v15 RESEND 2/2] leds: flash: mt6370: Add MediaTek MT6370
 flashlight support
Message-ID: <Y7QoNpbFRsK3bW6V@smile.fi.intel.com>
References: <cover.1672728620.git.chiaen_wu@richtek.com>
 <c1c6d3e51c93c15620ded0e2a53dcbe5de066ec9.1672728620.git.chiaen_wu@richtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1c6d3e51c93c15620ded0e2a53dcbe5de066ec9.1672728620.git.chiaen_wu@richtek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_050612_032997_6CADE910 
X-CRM114-Status: GOOD (  23.90  )
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

On Tue, Jan 03, 2023 at 03:00:09PM +0800, ChiaEn Wu wrote:
> From: Alice Chen <alice_chen@richtek.com>
> 
> The MediaTek MT6370 is a highly-integrated smart power management IC,
> which includes a single cell Li-Ion/Li-Polymer switching battery
> charger, a USB Type-C & Power Delivery (PD) controller, dual Flash
> LED current sources, a RGB LED driver, a backlight WLED driver,
> a display bias driver and a general LDO for portable devices.
> 
> Add support for the MT6370 Flash LED driver. Flash LED in MT6370
> has 2 channels and support torch/strobe mode.

...

>  obj-$(CONFIG_LEDS_RT8515)	+= leds-rt8515.o
>  obj-$(CONFIG_LEDS_SGM3140)	+= leds-sgm3140.o
> +obj-$(CONFIG_LEDS_MT6370_FLASH)	+= leds-mt6370-flash.o

Can it be kept ordered?

...

> +struct mt6370_priv {

> +	struct device *dev;
> +	struct regmap *regmap;

Do you need both of them?

> +	struct mutex lock;
> +	unsigned int fled_strobe_used;
> +	unsigned int fled_torch_used;
> +	unsigned int leds_active;
> +	unsigned int leds_count;
> +	struct mt6370_led leds[];
> +};

...

> +static int _mt6370_flash_brightness_set(struct led_classdev_flash *fl_cdev,
> +					u32 brightness)
> +{
> +	struct mt6370_led *led = to_mt6370_led(fl_cdev, flash);
> +	struct mt6370_priv *priv = led->priv;
> +	struct led_flash_setting *setting = &fl_cdev->brightness;
> +	u32 val = (brightness - setting->min) / setting->step;
> +	int ret, i;
> +
> +	if (led->led_no == MT6370_LED_JOINT) {
> +		u32 flevel[MT6370_MAX_LEDS];
> +
> +		flevel[0] = val / 2;
> +		flevel[1] = val - flevel[0];
> +		for (i = 0; i < MT6370_MAX_LEDS; i++) {
> +			ret = regmap_update_bits(priv->regmap,
> +						 MT6370_REG_FLEDISTRB(i),
> +						 MT6370_ISTROBE_MASK, flevel[i]);
> +			if (ret)
> +				break;
> +		}
> +
> +		return ret;

> +	} else {

Redundant 'else', just use }.

> +		return regmap_update_bits(priv->regmap,
> +					  MT6370_REG_FLEDISTRB(led->led_no),
> +					  MT6370_ISTROBE_MASK, val);

> +	}

No need.

> +}

...

> +	mutex_lock(&priv->lock);
> +	ret = regmap_update_bits(priv->regmap, MT6370_REG_STRBTO,
> +				 MT6370_STRBTO_MASK, val);
> +	mutex_unlock(&priv->lock);

I'm wondering now if you are using regmap lock, if so, what is the difference
between it and your mutex?

Depends on the answer and code flow, maybe one of them can gone.

...

> +	strscpy(config->dev_name, lcdev->dev->kobj.name,

Is it open coded dev_name()?

> +		sizeof(config->dev_name));

...

> +	num = fwnode_property_count_u32(init_data->fwnode, "led-sources");
> +	if (num < 1 || num > MT6370_MAX_LEDS)

Again, is the second part critical?

> +		return dev_err_probe(priv->dev, -EINVAL,
> +				     "Not specified or wrong number of led-sources\n");

...

> +	count = device_get_child_node_count(dev);
> +	if (!count || count > MT6370_MAX_LEDS)

Ditto.

> +		return dev_err_probe(dev, -EINVAL,
> +		       "No child node or node count over max led number %zu\n", count);

...

> +	device_for_each_child_node(dev, child) {
> +		struct mt6370_led *led = priv->leds + i;
> +		struct led_init_data init_data = { .fwnode = child, };
> +
> +		led->priv = priv;
> +		led->default_state = led_init_default_state_get(init_data.fwnode);
> +
> +		ret = mt6370_init_flash_properties(led, &init_data);
> +		if (ret)

Mind reference count.

> +			return ret;
> +
> +		ret = mt6370_led_register(dev, led, &init_data);
> +		if (ret)

Ditto.

> +			return ret;
> +
> +		i++;
> +	}

...

> +static const struct of_device_id mt6370_led_of_id[] = {
> +	{ .compatible = "mediatek,mt6370-flashlight" },

> +	{ /* sentinel */ },

A comma is not needed at the terminating entry.

> +};

-- 
With Best Regards,
Andy Shevchenko



