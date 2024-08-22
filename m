Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B640C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Aug 2024 14:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0+tQyt4NH4bOrmcCS0STVzWvkGrl/Llw0Igg8i4zIso=; b=WQ7zywyf89ao33fn1Ct6iiZ26C
	e2N81kMQYfDy12t6AK2B67s1sP+wRImBW68dDS18ewUmZ4/loXlEoesgKvoeFM21fyBY1DUbUmwJu
	rLbiSAHpIhaRJOr/mdurmYDCMqINld2IKtklqbJnjEDy/RsqqOeP6NTuQta67LkZobcuBqMho7X2E
	j/YxLaJeAzcsPQJU+BBqx1uf1XleRdRqhz2ZHG7mjwslzpejr/4E20PjCh/vx7OY4abxMj4UORijW
	pGJj1N4toy2xlNFu+m3JgpIzmU9GSHlwekSyCLnG6Cm7tNWYXyWJuubymg75jHuCHmd3HFLNl+f7Z
	pxhSKg3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh8h0-0000000D83p-0F3A;
	Thu, 22 Aug 2024 14:21:38 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh8gE-0000000D7ve-0yzB;
	Thu, 22 Aug 2024 14:20:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724336450; x=1755872450;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DbkNI2FbaBywilWppugkB1Yz7W1BXd9eW/krIM7n1Lg=;
  b=FLb1bdj/uyIRegGVz9DaoxdPm8jav5Rc5GgKJsOmAEyiPO7VC83R28sf
   ZSbN5+OSyhA6urxwaBk/NLa4+PIpDQTy9ZkJELgJEVKN6rScnKOkjnkvS
   3Q5vgjGUIueNA3Tavxpn4gxPHg1AuZs2GMauS3rLkXOvjiK1dkf08NTSw
   4piTaqvAZpeY3aL1rw60a7qN6sLYaQgzxbGPu5ntMb48GecXwrPRmC0/D
   pZYFE/c8HNfsAa4H/pQhvPBPhgJzYDR8GqNK9ffqCN/SID3S0zd19v76G
   rB1V+DiW4iCK4mkPq3zRD6UowSR1BpOQZSrSLhNGgyNjcbHpy4F0h/W25
   A==;
X-CSE-ConnectionGUID: ZJKZOji4QIOylKpFLrE52g==
X-CSE-MsgGUID: xRcFqZ0XRZGOze2yeEt71Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="40264414"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="40264414"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 07:20:49 -0700
X-CSE-ConnectionGUID: Xgwb6QXRS7q1FUsK/fMpdg==
X-CSE-MsgGUID: DY2HQ1VIR2i4q8kjbVJB5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="61465764"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 07:20:45 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sh8g6-00000000TfG-10aA;
	Thu, 22 Aug 2024 17:20:42 +0300
Date: Thu, 22 Aug 2024 17:20:41 +0300
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
Subject: Re: [PATCH v5 08/10] i2c: of-prober: Add GPIO support
Message-ID: <ZsdJOUe44hiGur-s@smile.fi.intel.com>
References: <20240822092006.3134096-1-wenst@chromium.org>
 <20240822092006.3134096-9-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822092006.3134096-9-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_072050_309900_A7CD5BFF 
X-CRM114-Status: GOOD (  27.82  )
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

On Thu, Aug 22, 2024 at 05:20:01PM +0800, Chen-Yu Tsai wrote:
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

> +	struct fwnode_handle *fwnode = of_fwnode_handle(node);
> +	struct gpio_descs *gpiods;
> +	struct gpio_desc *gpiod;
> +	char con[32]; /* 32 is max size of property name */

Use 'propname' to be aligned with GPIO library usages.

> +	char *con_id = NULL;
> +	size_t new_size;
> +	int len;

...

> +	if (len >= sizeof(con) - 1) {

This can be transformed to check the returned value from strscpy().

> +		pr_err("%pOF: length of GPIO name \"%s\" exceeds current limit\n",
> +		       node, prop->name);
> +		return -EINVAL;
> +	}
> +
> +	if (len > 0) {
> +		strscpy(con, prop->name, len + 1);

The correct (robust) call is with destination size. Which means here that you
may use 2-argument strscpy().

> +		con_id = con;
> +	}

...

> +	if (!data->gpiods)
> +		return 0;

If it comes a new code (something else besides GPIOs and regulators) this will be a (small) impediment. Better to have a helper for each case and do

	ret = ..._gpiods();
	if (ret)
		...

Same for regulators and anything else in the future, if any.

> +		/*
> +		 * reset GPIOs normally have opposite polarity compared to

"reset"

> +		 * enable GPIOs. Instead of parsing the flags again, simply

"enable"

> +		 * set the raw value to high.

This is quite a fragile assumption. Yes, it would work in 98% cases, but will
break if it's not true somewhere else.

> +		 */

...

> +	/* largest post-reset-deassert delay seen in tree for Elan I2C HID */
> +	msleep(300);

Same Q, how do you monitor _all_ the drivers?

...

> +disable_gpios:
> +	for (gpio_i--; gpio_i >= 0; gpio_i--)
> +		gpiod_set_raw_value_cansleep(data->gpiods->desc[gpio_i], 0);

Can't you call the _array() variant here?

...

> -	dev_dbg(dev, "Resources: # of regulator supplies = %d\n", probe_data.regulators_num);
> +	dev_dbg(dev, "Resources: # of GPIOs = %d, # of regulator supplies = %d\n",
> +		probe_data.gpiods ? probe_data.gpiods->ndescs : 0,
> +		probe_data.regulators_num);

I would issue one message per class of the devices (GPIOs, regulators, ...)

-- 
With Best Regards,
Andy Shevchenko



