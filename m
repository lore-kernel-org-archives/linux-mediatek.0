Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9E6CF11FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Oct 2024 15:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uZXciJxc9xhRD5ekiCINrfWnYkrPAE6qWJ9SanVpjgo=; b=1ZlhjBvJ/Dqtwm2Sf4iOS9i0nn
	k3nEG9/Vu35zrjBCtMHDT4ufSgZGtqyUKYbHZf2QcAQvOoUTwLACIrMARaQQioNMPGZa94USB3X4P
	KdxLplE4AAV0svTbzxs1qdZ3fKFmsnaAcLunnyJXXswNwPGOln3slLqElOYU6HxGf5rTE/gfyXU5c
	VzZfucgg5//Hd+w0kmMfu9PnGZin2ERhuc+yYfwsRiYkdv9XYBrvxAGoOD3k+XMshpKOwQTZS/jXY
	tn9wRAlSPf9odTOZNtEyUQM1VGQ9YqPfeFizU9mFcrN8tJVxdaTmJzUwUYBMKZpsZJolnjbeKN9zo
	h/Glfuvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syvIl-0000000DNW8-3zBH;
	Thu, 10 Oct 2024 15:42:07 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syuy4-0000000DIoP-1ASe;
	Thu, 10 Oct 2024 15:20:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728573645; x=1760109645;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FMOKQmRnRuG0u6SCHuk/rSndbZsClfTEYhslQL/e4Ss=;
  b=K941IjWPi8WpRfBN6v3zuTWsZkwR2veBnliORlo7T3lRCOs0DLSuTxzj
   qFyUtcHe6dicO4gyP0VwuR4y95b66WUMAp57gsLoMdYjjwZ2I9JA89nyV
   apJwEL9MWoMfmM82rZSGh+7jxnFDp+gUJLLoU3/9I7wbH9lXoM0eaZVPZ
   FHwDL+hY4x7ndBFkN1pzptZsIEj2fE8tqyDmr130gtwn5OeZqVAfvMHTW
   dSR3H7FZGdmZYELaZqWUCpEJNDcpXSkaW4EA2rNGPGrEr5yP0QAmab3IM
   O3FXyqqn9cdUj+IYkfUYDwsE9CglmnJUC8Y+Z+Rq/cXnngOVQsUuBfpJt
   Q==;
X-CSE-ConnectionGUID: 4T6+fnjxQkSkgaq+P/VDbg==
X-CSE-MsgGUID: +Lawn3syTQOEo7j69dzuUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="45417085"
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="45417085"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 08:20:39 -0700
X-CSE-ConnectionGUID: uFuqKWFpRUGoCWa1ZSzSlg==
X-CSE-MsgGUID: HFVp1nsLSFi0YkYM0dHCyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="76532971"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 08:20:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1syuxr-00000001ZlS-3lMj;
	Thu, 10 Oct 2024 18:20:31 +0300
Date: Thu, 10 Oct 2024 18:20:31 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v8 6/8] i2c: of-prober: Add GPIO support to simple helpers
Message-ID: <Zwfwv-O9ln-PVMdc@smile.fi.intel.com>
References: <20241008073430.3992087-1-wenst@chromium.org>
 <20241008073430.3992087-7-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008073430.3992087-7-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_082044_396954_938E07F1 
X-CRM114-Status: GOOD (  19.37  )
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

On Tue, Oct 08, 2024 at 03:34:25PM +0800, Chen-Yu Tsai wrote:
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
> +	const char *con_id;
> +
> +	/* NULL signals no GPIO needed */
> +	if (!ctx->opts->gpio_name)
> +		return 0;
> +
> +	/* An empty string signals an unnamed GPIO */
> +	if (!ctx->opts->gpio_name[0])
> +		con_id = NULL;
> +	else
> +		con_id = ctx->opts->gpio_name;

Can it use positive conditional?

	if (ctx->opts->gpio_name[0])
		con_id = ctx->opts->gpio_name;
	else
		con_id = NULL;

> +	gpiod = fwnode_gpiod_get_index(fwnode, con_id, 0, GPIOD_ASIS, "i2c-of-prober");
> +	if (IS_ERR(gpiod))
> +		return PTR_ERR(gpiod);
> +
> +	ctx->gpiod = gpiod;
> +
> +	return 0;
> +}

...

> +static void i2c_of_probe_simple_disable_gpio(struct device *dev, struct i2c_of_probe_simple_ctx *ctx)
> +{
> +	if (!ctx->gpiod)
> +		return;

Do you need this check for the future patches?

> +	/* Ignore error if GPIO is not in output direction */
> +	gpiod_set_value(ctx->gpiod, !ctx->opts->gpio_assert_to_enable);
> +}

...

>  struct regulator;
> +struct gpio_desc;

Ordered?

-- 
With Best Regards,
Andy Shevchenko



