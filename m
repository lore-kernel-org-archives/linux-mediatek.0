Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF7FCA0ED3
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Sep 2024 14:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8yqP8oZ72fsO5/2JR2ih49Ao0JF4zlr8p7IuPD366vY=; b=pUd10OUbNg/AnCgru5S0h/TnfU
	0f09HV9ak+/Gevjozlc214Eh+1n+PwMwO7Rn9qxGrdQDUbepj99TW3vLWtceeYukoeTT3dcnpF4NG
	8n+RKagWe0JaFxd6j77C+/RR8OPFG6maAmoh0/fUx6q0HwdKFs7sfYFB45bIcrcKlPuC0/jgm6Gl7
	xTkTiAYW7MGU8zqrUEqEZt+Wn0oYtHDOQ4VOJvoKfKgfJGeH53AArn2iNGEzMrcKeELoZP7m9BsLL
	UF2iqGWBMNIy8sd7D9eGNqTGKoFjJ/4ZTIKBKCNQS09AiUhCDh0xW9HAKPd1Pi7//48LzSbxW1ecn
	nuvo43xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slqdC-00000004gnX-28Hn;
	Wed, 04 Sep 2024 14:05:10 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slqcD-00000004gYk-3WxO;
	Wed, 04 Sep 2024 14:04:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725458650; x=1756994650;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4TSPzyXFo3mbtoWssEyI2IeYSaBZSS1lpLsVvyGQj+w=;
  b=jWYT5WFSSAd++YWDOM6kYfYT/Fwzd4ocz7iJQxFcLr4G45harGxmBQgg
   vwkD72oIrcUpXVxvCK0rnV6HAsTMGjvcxKui1/roq9nHUt+jvZ+Ua0lbJ
   xURYoPRcaL4/UlcTvdRYLs0NK2T+URMMbM+kAWgWBwpMAqiRbl7Bc+7V9
   5GCDIXEgcr91gjNItOLNUWynDlFY1RpECFb5JuLEGa8wdKJDHrVcXrQh7
   7lzqYYUMrixfQxlKM5292VhFrzM3og9EjZ8cdh0ZhFyTMvRhpAO5GVIRr
   Z+G98ChGMnyAo6BfIC+4JxG+2CXmz1Zo3vQNRwJS8sAoerHH1a237vLcM
   Q==;
X-CSE-ConnectionGUID: 3pdE+xe+T+quDo7ex0BxfQ==
X-CSE-MsgGUID: u0N1L6bOTCCoJwlQTY/DXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24263233"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="24263233"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 07:04:09 -0700
X-CSE-ConnectionGUID: vo0i1YUjRZmNB8mT1EJMSw==
X-CSE-MsgGUID: iLEpjnPLTGeJk6AuL3/5Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="65120093"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 07:04:05 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1slqc6-000000055Ds-0KY5;
	Wed, 04 Sep 2024 17:04:02 +0300
Date: Wed, 4 Sep 2024 17:04:01 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v6 10/12] i2c: of-prober: Add GPIO support
Message-ID: <Ztho0WuqgFZxpD1Q@smile.fi.intel.com>
References: <20240904090016.2841572-1-wenst@chromium.org>
 <20240904090016.2841572-11-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904090016.2841572-11-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_070409_952479_1B300E6C 
X-CRM114-Status: GOOD (  30.34  )
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

On Wed, Sep 04, 2024 at 05:00:12PM +0800, Chen-Yu Tsai wrote:
> This adds GPIO management to the I2C OF component prober.
> Components that the prober intends to probe likely require their
> regulator supplies be enabled, and GPIOs be toggled to enable them or
> bring them out of reset before they will respond to probe attempts.
> regulator support was added in the previous patch.
> 
> Without specific knowledge of each component's resource names or
> power sequencing requirements, the prober can only enable the
> regulator supplies all at once, and toggle the GPIOs all at once.
> Luckily, reset pins tend to be active low, while enable pins tend to
> be active high, so setting the raw status of all GPIO pins to high
> should work. The wait time before and after resources are enabled
> are collected from existing drivers and device trees.
> 
> The prober collects resources from all possible components and enables
> them together, instead of enabling resources and probing each component
> one by one. The latter approach does not provide any boot time benefits
> over simply enabling each component and letting each driver probe
> sequentially.
> 
> The prober will also deduplicate the resources, since on a component
> swap out or co-layout design, the resources are always the same.
> While duplicate regulator supplies won't cause much issue, shared
> GPIOs don't work reliably, especially with other drivers. For the
> same reason, the prober will release the GPIOs before the successfully
> probed component is actually enabled.

...

> +static int i2c_of_probe_get_gpiod(struct device_node *node, struct property *prop,
> +				  struct i2c_of_probe_data *data)
> +{
> +	struct fwnode_handle *fwnode = of_fwnode_handle(node);
> +	struct gpio_descs *gpiods;
> +	struct gpio_desc *gpiod;
> +	char propname[32]; /* 32 is max size of property name */
> +	char *con_id = NULL;
> +	size_t new_size;
> +	int len, ret;
> +
> +	len = gpio_get_property_name_length(prop->name);
> +	if (len < 0)
> +		return 0;
> +
> +	ret = strscpy(propname, prop->name);
> +	if (ret < 0) {
> +		pr_err("%pOF: length of GPIO name \"%s\" exceeds current limit\n",
> +		       node, prop->name);
> +		return -EINVAL;

Any good reason to shadow the error code from strscpy() here?

> +	}
> +
> +	if (len > 0) {
> +		/* "len < ARRAY_SIZE(propname)" guaranteed by strscpy() above */

is guaranteed

> +		propname[len] = '\0';

Please, check if it's guaranteed by strscpy() (IIRC it is, hence redundant line).

> +		con_id = propname;
> +	}
> +
> +	/*
> +	 * GPIO descriptors are not reference counted. GPIOD_FLAGS_BIT_NONEXCLUSIVE
> +	 * can't differentiate between GPIOs shared between devices to be probed and
> +	 * other devices (which is incorrect). If the initial request fails with
> +	 * -EBUSY, retry with GPIOD_FLAGS_BIT_NONEXCLUSIVE and see if it matches
> +	 * any existing ones.
> +	 */
> +	gpiod = fwnode_gpiod_get_index(fwnode, con_id, 0, GPIOD_ASIS, "i2c-of-prober");
> +	if (IS_ERR(gpiod)) {
> +		if (PTR_ERR(gpiod) != -EBUSY || !data->gpiods)
> +			return PTR_ERR(gpiod);
> +
> +		gpiod = fwnode_gpiod_get_index(fwnode, con_id, 0,
> +					       GPIOD_ASIS | GPIOD_FLAGS_BIT_NONEXCLUSIVE,
> +					       "i2c-of-prober");
> +		for (unsigned int i = 0; i < data->gpiods->ndescs; i++)
> +			if (gpiod == data->gpiods->desc[i])
> +				return 1;
> +
> +		return -EBUSY;
> +	}
> +
> +	new_size = struct_size(gpiods, desc, data->gpiods ? data->gpiods->ndescs + 1 : 1);
> +	gpiods = krealloc(data->gpiods, new_size, GFP_KERNEL);
> +	if (!gpiods) {
> +		gpiod_put(gpiod);
> +		return -ENOMEM;
> +	}
> +
> +	data->gpiods = gpiods;
> +	data->gpiods->desc[data->gpiods->ndescs++] = gpiod;
> +
> +	return 1;
> +}

...

> +static int i2c_of_probe_set_gpios(struct device *dev, struct i2c_of_probe_data *data)
> +{
> +	int ret;
> +	int gpio_i;

Why signed? And can it be simply named 'i'?

> +
> +	if (!data->gpiods)
> +		return 0;
> +
> +	for (gpio_i = 0; gpio_i < data->gpiods->ndescs; gpio_i++) {
> +		/*
> +		 * "reset" GPIOs normally have opposite polarity compared to
> +		 * "enable" GPIOs. Instead of parsing the flags again, simply
> +		 * set the raw value to high.
> +		 */
> +		dev_dbg(dev, "Setting GPIO %d\n", gpio_i);
> +		ret = gpiod_direction_output_raw(data->gpiods->desc[gpio_i], 1);
> +		if (ret)
> +			goto disable_gpios;
> +	}
> +
> +	msleep(data->opts->post_reset_deassert_delay_ms);
> +
> +	return 0;
> +
> +disable_gpios:

> +	for (gpio_i--; gpio_i >= 0; gpio_i--)

	while (i--)

> +		gpiod_set_raw_value_cansleep(data->gpiods->desc[gpio_i], 0);
> +
> +	return ret;
> +}


-- 
With Best Regards,
Andy Shevchenko



