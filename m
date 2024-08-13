Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E71C52D7C
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Aug 2024 11:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P6wl4QlbK9dDCaFofAKQ6GRs+6NaPPcggQLtpdhMRFA=; b=kX5mOkVeTUuCY+jSd2Kg3f+4Wq
	H1fdi+R5v6NkgPtbajWsq4dhJTn5xHVyVHkVP1+bxt4xQaJaFUEl9U3Wea7Qb+Sa5ebzTwguTT8r4
	j7RszQbF4BspUU8W9i40pYeFx7J1pppAuVN00kyYbN5HKogLikeb0nrah7VERODihlopSlCEEup6b
	WXq1ODHTSeVUn5r9W6RuGWIMaxGxmL9QuAN2gB3XDmjk34TItl/b5uQZ40KGYDr8o/kbAg/ho0OK1
	8PTi7Ik8D0INaXh/jp9jf8wwiru2GO7XzpZxi80EyXFQmSODkSXAH7CA2F/53XlVEHQZhFqdWTpQX
	k1HEBaUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdpug-00000003Xy6-26qj;
	Tue, 13 Aug 2024 11:42:06 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdpu3-00000003Xs5-0JWp;
	Tue, 13 Aug 2024 11:41:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723549287; x=1755085287;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I1yV/V1IVGNioZqOcI4srYsqZ1oyEFYyu5tfWfHA0Ro=;
  b=D7E34qksg/v3P+41ZyZGVN94+ex88QtHqQUvxZJb2cTEs62R9f1pL3Jk
   f1/t+ZlERVqKI/m5i+/LfHjJnJh0vOGhJPDEuv0K4bjIJqmGoEL4ayzeV
   kBJ0+8ra2zbYSvpileVVD/VctXXydNFuOEpzSMABAmM5dLKNGCJKigDOD
   Z9MYtYIhbkWKlnopEfnLx72CNBMT3SjPaVPR0SlvMncgV2LBaLeVL6FDK
   6IKqLbSN5568KMAKjyQ9oSzylP5tLrBgIPg1Gk5a/X0UBltcDLaLdLNNi
   4SDr5gnJ5pQmt464NVpkvOh/BluH7yewBah1OCLfRZv/ooW+H6sT945j5
   Q==;
X-CSE-ConnectionGUID: YrADfdp+T9uG0Suy0i1Y5A==
X-CSE-MsgGUID: Z049rKwJSsq7AyzBjx32/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="44226870"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="44226870"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 04:41:24 -0700
X-CSE-ConnectionGUID: Su+4s2FHRTCcvTwpuFdDtA==
X-CSE-MsgGUID: Cww//6/TSFSLG5x9b7d5/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="58604117"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 04:41:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sdptt-0000000EiB6-1uXP;
	Tue, 13 Aug 2024 14:41:17 +0300
Date: Tue, 13 Aug 2024 14:41:17 +0300
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
Subject: Re: [PATCH v4 4/6] i2c: of-prober: Add GPIO and regulator support
Message-ID: <ZrtGXfKE6BwupPPA@smile.fi.intel.com>
References: <20240808095931.2649657-1-wenst@chromium.org>
 <20240808095931.2649657-5-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240808095931.2649657-5-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_044127_186669_8831144B 
X-CRM114-Status: GOOD (  29.27  )
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

On Thu, Aug 08, 2024 at 05:59:27PM +0800, Chen-Yu Tsai wrote:
> This adds GPIO and regulator management to the I2C OF component prober.

Can this be two patches?

> Components that the prober intends to probe likely require their
> regulator supplies be enabled, and GPIOs be toggled to enable them or
> bring them out of reset before they will respond to probe attempts.
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

> +/*
> + * While 8 seems like a small number, especially when probing many component
> + * options, in practice all the options will have the same resources. The
> + * code getting the resources below does deduplication to avoid conflicts.
> + */
> +#define RESOURCE_MAX 8

Badly (broadly) named constant. Is it not the same that defines arguments in
the OF phandle lookup? Can you use that instead?

...

> +#define REGULATOR_SUFFIX "-supply"

Name is bad, also move '-' to the code, it's not part of the suffix, it's a
separator AFAICT.

...

> +	p = strstr(prop->name, REGULATOR_SUFFIX);

strstr()?! Are you sure it will have no side effects on some interesting names?

> +	if (!p)
> +		return 0;

> +	if (strcmp(p, REGULATOR_SUFFIX))
> +		return 0;

Ah, you do it this way...

What about




> +
> +	strscpy(con, prop->name, p - prop->name + 1);
> +	regulator = regulator_of_get_optional(node, con);
> +	/* DT lookup should never return -ENODEV */
> +	if (IS_ERR(regulator))
> +		return PTR_ERR(regulator);

...

> +	for (int i = 0; i < data->regulators_num; i++)

Why signed?

> +		if (regulator_is_equal(regulator, data->regulators[i])) {
> +			regulator_put(regulator);
> +			regulator = NULL;
> +			break;
> +		}

...

> +#define GPIO_SUFFIX "-gpio"

Bad define name, and why not "gpios"?

...

> +	p = strstr(prop->name, GPIO_SUFFIX);
> +	if (p) {
> +		strscpy(con, prop->name, p - prop->name + 1);
> +		con_id = con;
> +	} else if (strcmp(prop->name, "gpio") && strcmp(prop->name, "gpios")) {
> +		return 0;

We have an array of these suffixes, please use it. If required make it exported
to the others.

> +	}

...

> +	ret = of_parse_phandle_with_args_map(node, prop->name, "gpio", 0, &phargs);
> +	if (ret)
> +		return ret;

> +	gpiod = fwnode_gpiod_get_index(fwnode, con_id, 0, GPIOD_ASIS, "i2c-of-prober");
> +	if (IS_ERR(gpiod)) {
> +		of_node_put(phargs.np);
> +		return PTR_ERR(gpiod);
> +	}

Try not to mix fwnode and OF specifics. You may rely on fwnode for GPIO completely.

> +	if (data->gpiods_num == ARRAY_SIZE(data->gpiods)) {
> +		of_node_put(phargs.np);
> +		gpiod_put(gpiod);
> +		return -ENOMEM;
> +	}

...

> +	for (int i = data->gpiods_num - 1; i >= 0; i--)
> +		gpiod_put(data->gpiods[i]);

This sounds like reinvention of gpiod_*_array() call.

...

> +	for (int i = data->regulators_num; i >= 0; i--)
> +		regulator_put(data->regulators[i]);

Bulk regulators?

...

> +	for_each_child_of_node_scoped(i2c_node, node) {

Eventually _scoped(), but...

> +		u32 addr;
> +
> +		if (!of_node_name_prefix(node, type))
> +			continue;
> +		if (of_property_read_u32(node, "reg", &addr))
> +			continue;
> +
> +		dev_dbg(dev, "Requesting resources for %pOF\n", node);
> +		ret = i2c_of_probe_get_res(dev, node, &data);
> +		if (ret) {

> +			of_node_put(i2c_node);

...huh?!

> +			return ret;
> +		}
> +	}

-- 
With Best Regards,
Andy Shevchenko



