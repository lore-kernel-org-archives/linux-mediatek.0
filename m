Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFE9FA3741
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Sep 2024 10:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2XaJYZ0nYjnkMO3xQ10rtuPUVg8j/hLfGfj0wEwAGro=; b=srhYXOrrljlfCn+SqTGkmVtJCy
	Esyd4q4RwUGTkno+vUK0ZrAv+7uuxSxhbaaYi5wE8ZwOj3iQ4Ejmei68N68QpXigzRQsOS6XV6ZMs
	lXc62fI4UtQQ+uDvDI/0oYSt92vA7EdLEeNKTlsmxQZQePtYcYE2stbVFqFL7FVqcV+ZCzzJe+v9h
	rAuwv7CJ4o14e8uK5BHZc8DS31Pjb8a/kWT3ZejmbTGn/cE1mailNyKrcTFJ5shXmCfu/DcKVcIBw
	HlTu4z9lGayvP+/W2BwN6rIk0TDsWSuG4/wnpt0reWsA22va1cPrTc9ialQkgm+J50k6EuMUBRl/U
	XZRdF5Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp3q7-0000000FfNR-3lDd;
	Fri, 13 Sep 2024 10:47:47 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp3p0-0000000Ff8V-2Ng8;
	Fri, 13 Sep 2024 10:46:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726224398; x=1757760398;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e+un8vaDxaujRJMqDIAlvYg83zY4vEsoD9RPHPWxTwo=;
  b=HU48OiC2dWiVlrU+NPWqI7xuBP9X+z64unUH/V4/yk71k2bMNYKK6LSY
   NPBqLNNOXmbsR4Rww4zUJe0sVO15halPB9mHzDkCXevXVI5a8L1aR+2Bn
   CadFZ3wxc+zGniZ91fHjkAuAV4u7iVeyAKC5ubE7ACePmLsio1jDP0BTz
   uD4b172wMRvWCElXqxE12QdfhvFNl0PHsZl+o7oHYu3qNZTOwrT/WQpe0
   Jy2LPqSHt1p2o+rPAoQMvorBdJlIf4hM6tse1zlQwDNtoOlRCWQaL5Bf0
   1GkBUTzoFB94J+NLpztPfOgfbjJxND/3CRagT/2pH1tTqTdB0DsCRxoKp
   w==;
X-CSE-ConnectionGUID: CHblOb6UQ0ejetWDwTI4wg==
X-CSE-MsgGUID: C3RMiAI5SAWZDNvf3FrYiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="35785566"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="35785566"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 03:46:33 -0700
X-CSE-ConnectionGUID: Hhyk6Xc+Sgq83pUXYmyoqg==
X-CSE-MsgGUID: meWPunBWTZyMDaizKz0Dpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="72781058"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 03:46:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sp3oo-00000008GXj-3PLy;
	Fri, 13 Sep 2024 13:46:26 +0300
Date: Fri, 13 Sep 2024 13:46:26 +0300
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
Subject: Re: [PATCH v7 07/10] i2c: of-prober: Add simple helpers for
 regulator support
Message-ID: <ZuQYAu9tBN0wrNfo@smile.fi.intel.com>
References: <20240911072751.365361-1-wenst@chromium.org>
 <20240911072751.365361-8-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911072751.365361-8-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_034638_644930_EE17434B 
X-CRM114-Status: GOOD (  24.07  )
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

On Wed, Sep 11, 2024 at 03:27:45PM +0800, Chen-Yu Tsai wrote:
> Add helpers to do regulator management for the I2C OF component prober.
> Components that the prober intends to probe likely require their
> regulator supplies be enabled, and GPIOs be toggled to enable them or
> bring them out of reset before they will respond to probe attempts.
> GPIOs will be handled in the next patch.
> 
> The assumption is that the same class of components to be probed are
> always connected in the same fashion with the same regulator supply
> and GPIO. The names may vary due to binding differences, but the
> physical layout does not change.
> 
> This set of helpers supports at most one regulator supply. The user
> must specify the node from which the supply is retrieved. The supply
> name and the amount of time to wait after the supply is enabled are
> also given by the user.

...

> +static int i2c_of_probe_simple_get_supply(struct device *dev, struct device_node *node,
> +					  struct i2c_of_probe_simple_ctx *ctx)
> +{
> +	const char *supply_name;
> +	struct regulator *supply;
> +
> +	/*
> +	 * It's entirely possible for the component's device node to not have regulator
> +	 * supplies. While it does not make sense from a hardware perspective, the
> +	 * supplies could be always on or otherwise not modeled in the device tree, but
> +	 * the device would still work.
> +	 */

I would reformat as

	/*
	 * It's entirely possible for the component's device node to not have the
	 * regulator supplies. While it does not make sense from a hardware perspective,
	 * the supplies could be always on or otherwise not modeled in the device tree,
	 * but the device would still work.
	 */

> +	supply_name = ctx->opts->supply_name;
> +	if (!supply_name)
> +		return 0;
> +
> +	supply = of_regulator_get_optional(dev, node, supply_name);
> +	if (IS_ERR(supply)) {
> +		return dev_err_probe(dev, PTR_ERR(supply),
> +				     "Failed to get regulator supply \"%s\" from %pOF\n",
> +				     supply_name, node);
> +	}
> +
> +	ctx->supply = supply;
> +
> +	return 0;
> +}

...

> +int i2c_of_probe_simple_get_res(struct device *dev, struct device_node *bus_node, void *data)
> +{
> +	struct i2c_of_probe_simple_ctx *ctx = data;
> +	struct device_node *node;
> +	const char *compat;
> +	int ret;
> +
> +	dev_dbg(dev, "Requesting resources for components under I2C bus %pOF\n", bus_node);
> +
> +	if (!ctx || !ctx->opts)
> +		return -EINVAL;
> +
> +	compat = ctx->opts->res_node_compatible;
> +	if (!compat)
> +		return -EINVAL;

> +	node = of_get_compatible_child(bus_node, compat);

	__free(of_node_put) ?

> +	if (!node)
> +		return dev_err_probe(dev, -ENODEV, "No device compatible with \"%s\" found\n",
> +				     compat);
> +
> +	ret = i2c_of_probe_simple_get_supply(dev, node, ctx);
> +	if (ret)
> +		goto out_put_node;
> +
> +	return 0;
> +
> +out_put_node:
> +	of_node_put(node);
> +	return ret;
> +}

...

> + * @post_power_on_delay_ms: Delay in ms after regulators are powered on. Passed to msleep().

No need to duplicate the units as it's obvious from the variable name and msleep().

 * @post_power_on_delay_ms: Delay after regulators are powered on. Passed to msleep().

-- 
With Best Regards,
Andy Shevchenko



