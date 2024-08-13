Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75571C52D7B
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Aug 2024 11:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D8BuanT6kTDObWmw14IGIL3aXbtSys/I8WUyxFjEqWg=; b=LGt1ipY13YRKHdNbpXAe+aINX5
	RNTQp1lOmQgnHLGIQ61aPejWzhmBjCx5YlsBCtTIDzA/kpK/MLe2tzmxuJu8hV3WD38U1KLK8SV+D
	dS2TlPD4utKV/vtgzIRtHNe6qZfSpw0M4cvnpTDUl0TbfHUAq6ZALnMEpU5ORyJZ+wNKviKWgGq7S
	C36UZCYtnjx791C/2N1rO/p0KtHlkTxL0wDmiKYx2h1AED5oywYpgIXeZeOhcevYppMZbgz+0LCGm
	tTa81T6cCJ4c0H4Keh4ed7MIBOR4B224BWcdrXygBWLgYyTy0kI65agjeIzTlohsI7v73JAvQ38J3
	xRkK+EqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdpcQ-00000003V5O-4C7W;
	Tue, 13 Aug 2024 11:23:15 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdpbg-00000003Uv9-26CL;
	Tue, 13 Aug 2024 11:22:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723548148; x=1755084148;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mEePcR8nadTN2WwOSCJ4XUGSlm4GH5pq61cZ2MGoSgc=;
  b=kna32EFk+rB/2LoK8jQXVVpdU9fh4KdL1iguwdxlfcCCRlgH6Qn5f5nu
   Tg3p/byEYrUo8ynCut8XNEFCVM3+ZhknRCprVrSBk4GqRzHJa1Q6Itj4y
   Y16FFwTlWwZO4XwYlIDcpOglwWFNLdGfKJrrDAdLcSmkJ4G6t26ykHPd5
   e0YPiMNxdKgl8eGkNA3Zd/gxw2q55JJnxXFBcQaxdBNSJ/KPd2pH2TqgY
   XG/+CCbaJYA/Qwd3VZpBRQe1UnNk2rkew9oTZcMI6lyxnnvCkfe0cGbks
   D5+FD2DaVb0USqVtrmooaaJczfeJs6PGI9HfIwvOmwKAPooYeRzJRohp8
   A==;
X-CSE-ConnectionGUID: qBMK6qiOQ3yRb7l+c6vKfQ==
X-CSE-MsgGUID: wHNnr+QcQHypaTks+nV7Lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21263353"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="21263353"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 04:22:28 -0700
X-CSE-ConnectionGUID: iM9QhMsrRlC/RmA8aYMD7A==
X-CSE-MsgGUID: LwyBf4ceQ4W+RavON2Bbug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="58573160"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 04:22:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sdpbY-0000000EhrZ-2ZRZ;
	Tue, 13 Aug 2024 14:22:20 +0300
Date: Tue, 13 Aug 2024 14:22:20 +0300
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
Subject: Re: [PATCH v4 2/6] regulator: Add regulator_of_get_optional() for
 pure DT regulator lookup
Message-ID: <ZrtB7NPmnqF5ya2A@smile.fi.intel.com>
References: <20240808095931.2649657-1-wenst@chromium.org>
 <20240808095931.2649657-3-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240808095931.2649657-3-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_042228_574156_83A5044F 
X-CRM114-Status: GOOD (  20.09  )
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

On Thu, Aug 08, 2024 at 05:59:25PM +0800, Chen-Yu Tsai wrote:
> The to-be-introduced I2C component prober needs to enable regulator
> supplies (and toggle GPIO pins) for the various components it intends
> to probe. To support this, a new "pure DT lookup" method for getting
> regulator supplies is needed, since the device normally requesting
> the supply won't get created until after the component is probed to
> be available.
> 
> This adds a new regulator_of_get_optional() for this purpose. The
> underlying code that support the existing regulator_get*() functions
> are extended to support this specific case.

...

>  /**
>   * regulator_dev_lookup - lookup a regulator device.
>   * @dev: device for regulator "consumer".
> + * @node: device node for regulator supply lookup.
> + *        Falls back to dev->of_node if NULL.

Please, avoid using dereferences in the comments. Use plain language:
"Falls back to the OF node of the @dev, if NULL." or alike.

>   * @supply: Supply name or regulator ID.

>   */

...

>  static struct regulator_dev *regulator_dev_lookup(struct device *dev,
> +						  struct device_node *node,

This function has no of_ prefix in its name. If you want to make it for all,
please use fwnode instead. Otherwise I would expect a new one with of_ prefix.
(But I really prefer just agnostic, i.e. fwnode, approach!)

>  						  const char *supply)
>  {
> +	bool pure_dt_lookup = false;

Redundant assignment.

> +	pure_dt_lookup = (node && !dev);
>  
> +	/* Pure DT lookup should use given supply name directly */
> +	if (!pure_dt_lookup)
> +		regulator_supply_alias(&dev, &supply);
> +
> +	if (!node && dev && dev->of_node)

The dev->of_node is redundant and with the above...

> +		node = dev->of_node;

...this becomes as simple as

	if (!node && dev)

> +	/* Pure DT lookup stops here. */
> +	if (pure_dt_lookup)
> +		return ERR_PTR(-ENODEV);

Looking at this pure_dt_lookup and the above (somehow inverted) case I would
rather use (node && !dev) or (!node && dev) explicitly everywhere.

...

> +struct regulator *_regulator_get(struct device *dev, struct device_node *node,
> +				 const char *id, enum regulator_get_type get_type)

Again, no of_ prefix and function becomes OF-specific...

-- 
With Best Regards,
Andy Shevchenko



