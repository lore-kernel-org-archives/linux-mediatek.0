Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6092FA3741
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Sep 2024 10:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ehl5i2csHP3k2VFiKdeD0jGw7TYHP4pIB99FrXY9e4g=; b=KIxKz7oVA61APx4CVb0A9YAsPj
	dgUeIOpoPUMOGOhyaShxHuDmdMlZGXDrVhHnndJU9woZfeHWEFBZbDM01FPuAXGJ+nPvHAnkzZg5K
	wGJP6DXseJ6ejCTCzSC9V97issP7ziXXVHodvQ/4FEralGUvGJdebcBWXIjzroUUbOjg0KuF3pG9y
	sMKtrv8aOyxZwek+cZ3VEUP9JtmFbL4kdUtCFhAyRIUMOT+2s/bKdP8pH0fCE0e7ulPLf3he0W6vF
	BG05EWAOMKhWEg+Umoz2p/SVeNjfgMsFSjENQrB/b9CPSAOLheIN/SexFJb7BL9u0anmIrfbWtSF0
	KniLWNjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp3xB-0000000FgPk-22aF;
	Fri, 13 Sep 2024 10:55:05 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp3v4-0000000Fg5m-2qbO;
	Fri, 13 Sep 2024 10:52:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726224775; x=1757760775;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vfmDCSc14mOA4j2yfWDNkchC1g26e9g7RDxQlrvfJnI=;
  b=TF5yWpiDdFlmM0RxkTp/vYqF59rYURZqnA7qiWLpL0xh5VQKIEA/ccOp
   mCxFu7LA7ueit+iTs0Xpqaad/wackXciBi2IJswilabvEJlwnotY3dKkP
   4lDZ6n6bRu9zkW69kyyMyhjw/XDzdbR9cOquvrIZ94GYZ4W5Sx3EyDYib
   IvxheKUA/O5SHXX0tH3v16/ZwPgAmzSA9jMGYGd2H7+Y4WUmLW8jG18Yw
   xszao17VcTGZxdGfIY+BVhD7xLyEuifI56HcyONl7NeeiMkJeREN+Z0wj
   DJGZLCh0zDC4AsUlg1sjI9IVh7Jrm4D2DiqeNOhxZjZ/IqelWDKRo0R3b
   w==;
X-CSE-ConnectionGUID: 6UjHI1eTQtCS33kmSQ2aeg==
X-CSE-MsgGUID: X+r1Mh7GTV6MmiORfT5Xyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="24989416"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="24989416"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 03:52:54 -0700
X-CSE-ConnectionGUID: cSOVMhO3SjG5+iiaEOC6lw==
X-CSE-MsgGUID: Bcldi3p3QBCw2CtSci/RBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="68331128"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 03:52:50 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sp3uw-00000008Gdo-2uie;
	Fri, 13 Sep 2024 13:52:46 +0300
Date: Fri, 13 Sep 2024 13:52:46 +0300
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
Subject: Re: [PATCH v7 08/10] i2c: of-prober: Add GPIO support to simple
 helpers
Message-ID: <ZuQZfvqGii9fcH-j@smile.fi.intel.com>
References: <20240911072751.365361-1-wenst@chromium.org>
 <20240911072751.365361-9-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911072751.365361-9-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_035254_800595_B327A7EB 
X-CRM114-Status: GOOD (  21.48  )
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

On Wed, Sep 11, 2024 at 03:27:46PM +0800, Chen-Yu Tsai wrote:
> Add GPIO support to the simple helpers for the I2C OF component prober.
> Components that the prober intends to probe likely require their
> regulator supplies be enabled, and GPIOs be toggled to enable them or
> bring them out of reset before they will respond to probe attempts.
> Regulator supplies were handled in the previous patch.
> 
> The assumption is that the same class of components to be probed are
> always connected in the same fashion with the same regulator supply
> and GPIO. The names may vary due to binding differences, but the
> physical layout does not change.
> 
> This supports at most one GPIO pin. The user must specify the GPIO name,
> the polarity, and the amount of time to wait after the GPIO is toggled.
> Devices with more than one GPIO pin likely require specific power
> sequencing beyond what generic code can easily support.

...

> +static int i2c_of_probe_simple_get_gpiod(struct device *dev, struct device_node *node,
> +					 struct i2c_of_probe_simple_ctx *ctx)
> +{
> +	struct fwnode_handle *fwnode = of_fwnode_handle(node);
> +	struct gpio_desc *gpiod;
> +	const char *con_id = NULL;
> +
> +	/* NULL signals no GPIO needed */
> +	if (!ctx->opts->gpio_name)
> +		return 0;
> +
> +	/* An empty string signals an unnamed GPIO */
> +	if (strlen(ctx->opts->gpio_name))

You run for entire string in order to check the first byte only?

	if (ctx->opts->gpio_name[0] == '\0')
		con_id = NULL;
	else

> +		con_id = ctx->opts->gpio_name;

Also note, that comment is given in inverted condition to what you actually do
in the code. With my suggestion it looks better.

> +	gpiod = fwnode_gpiod_get_index(fwnode, con_id, 0, GPIOD_ASIS, "i2c-of-prober");
> +	if (IS_ERR(gpiod))
> +		return PTR_ERR(gpiod);
> +
> +	ctx->gpiod = gpiod;
> +
> +	return 0;
> +}

...

> +static int i2c_of_probe_simple_set_gpio(struct device *dev, struct i2c_of_probe_simple_ctx *ctx)
> +{
> +	int ret;
> +
> +	if (!ctx->gpiod)
> +		return 0;

> +	dev_dbg(dev, "Setting GPIO\n");

> +	ret = gpiod_direction_output_raw(ctx->gpiod, ctx->opts->gpio_high_to_enable ? 1 : 0);

Hmm... _raw() in use... Perhaps it's on a territory of Bart and Linus to review
and comment on this.

> +	if (ret)
> +		return ret;
> +
> +	msleep(ctx->opts->post_reset_deassert_delay_ms);
> +
> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko



