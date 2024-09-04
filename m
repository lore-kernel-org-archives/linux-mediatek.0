Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825E6CD37B4
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Sep 2024 13:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H5INdmuob/xdKoZ8GkDf20JhY6cC8bC1424SXiBQesE=; b=HZi/nR7glCrM59JpC6wVaqJhVM
	v2SiLovJlBcGlqPxxJlj/q7UM6Oq/u8XdjaaKWZcriMLKZl8RKBFTzkTJP4gQcmHYa5iLCfy/V3ZN
	mZbEwABKna3m01jKiUwFdQUByEOmtNAwHY4HY/2gX5MajwKrOX5vM4ef/Vfw/qMfVWD1GlTse70tf
	MnJ61GWZHT+MAt5rRdgL7YIROYtvqnJ8y8b5Y/iR6wdCMOQFHNMoEHAVC6dmKrbqdQsjprieWs6Nj
	KaH9qxUCh3dky2GV/ZByVd3SkixaTOFSY1tuVYC9/0sZ0huTQtIGJoavmXKgYi5rmRo5Mi/n/24oN
	z/UZUaPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slpn1-00000004V1r-0RtQ;
	Wed, 04 Sep 2024 13:11:15 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slplr-00000004Ul5-3AZJ;
	Wed, 04 Sep 2024 13:10:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725455404; x=1756991404;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tATWn40qt4pXS+t/MnTUTHbZoXR7GdywvSxVFOVuwNw=;
  b=mwjh+9wzJ175Y/ogWZY3wJnoPgM1jSdTi9rjDxnmDnAQMH+qyjAua2S0
   gdSAlyB3b0bTcRt/ORrk499mAi6vSB3d0DHsrVSAy+CJVQgSezZp0Q6vu
   eB4uoGpQy6zcshR+YGEzTbpVZszx12tonZ6L+o5DNXf7vS/Yb0d7z8bmQ
   uH3+O8Wn0JR/vmFY8xyTGxn/4FPI4iiPvH5FJSMRSMG2RqQJHmC2eq80A
   /AXO1/hgapNBIeZ2sj5fTgY2MZ5pi8bpMesX+rV9GSYf8cYTP+Rh16F/u
   QhH9R56+NARI9kyAfeF6PAcEELwjuazA4CB+PfXjJo1JwORJtvIXaNgYH
   w==;
X-CSE-ConnectionGUID: mn+LE/0YS1yVbSMSX2KGtw==
X-CSE-MsgGUID: rIODxD9gTeyOakHx/nuMJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="35475112"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="35475112"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 06:10:02 -0700
X-CSE-ConnectionGUID: uC3tCP1tTJOsjejHvYHljg==
X-CSE-MsgGUID: zGepQVQES8CnElRy5vFcKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="65307987"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 06:09:58 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1slplG-000000054Je-2wKN;
	Wed, 04 Sep 2024 16:09:26 +0300
Date: Wed, 4 Sep 2024 16:09:26 +0300
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
Subject: Re: [PATCH v6 03/12] regulator: Move OF-specific regulator lookup
 code to of_regulator.c
Message-ID: <ZthcBpx8WFIvsrJj@smile.fi.intel.com>
References: <20240904090016.2841572-1-wenst@chromium.org>
 <20240904090016.2841572-4-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904090016.2841572-4-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_061003_871671_669ABCC6 
X-CRM114-Status: GOOD (  24.33  )
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

On Wed, Sep 04, 2024 at 05:00:05PM +0800, Chen-Yu Tsai wrote:
> There's still a bit of OF-specific code in the regulator device lookup
> function.
> 
> Move those bits of code over to of_regulator.c, and create a new
> function of_regulator_dev_lookup() to encapsulate the code moved out of
> regulator_dev_lookup().
> 
> Also mark of_find_regulator_by_node() as static, since there are no
> other users in other compile units.
> 
> There are no functional changes. A line alignment was also fixed.

...

> +/**
> + * of_get_child_regulator - get a child regulator device node
> + * based on supply name
> + * @parent: Parent device node
> + * @prop_name: Combination regulator supply name and "-supply"
> + *
> + * Traverse all child nodes.
> + * Extract the child regulator device node corresponding to the supply name.
> + *
> + * Return: Pointer to the &struct device_node corresponding to the regulator
> + *	   if found, or %NULL if not found.
> + */
> +static struct device_node *of_get_child_regulator(struct device_node *parent,
> +						  const char *prop_name)
> +{
> +	struct device_node *regnode = NULL;
> +	struct device_node *child = NULL;
> +
> +	for_each_child_of_node(parent, child) {

> +		regnode = of_parse_phandle(child, prop_name, 0);
> +		if (!regnode) {
> +			regnode = of_get_child_regulator(child, prop_name);
> +			if (regnode)
> +				goto err_node_put;
> +		} else {
> +			goto err_node_put;
> +		}

I know this is just a move of the existing code, but consider negating the
conditional and have something like

		regnode = of_parse_phandle(child, prop_name, 0);
		if (regnode)
			goto err_node_put;

		regnode = of_get_child_regulator(child, prop_name);
		if (regnode)
			goto err_node_put;

> +	}
> +	return NULL;
> +
> +err_node_put:
> +	of_node_put(child);
> +	return regnode;
> +}

...

I assume the use of _scoped() macros is in mind for the future changes?

...

> +/**
> + * of_get_regulator - get a regulator device node based on supply name
> + * @dev: Device pointer for the consumer (of regulator) device
> + * @supply: regulator supply name
> + *
> + * Extract the regulator device node corresponding to the supply name.
> + *
> + * Return: Pointer to the &struct device_node corresponding to the regulator
> + *	   if found, or %NULL if not found.
> + */
> +static struct device_node *of_get_regulator(struct device *dev, const char *supply)
> +{
> +	struct device_node *regnode = NULL;
> +	char prop_name[64]; /* 64 is max size of property name */
> +
> +	dev_dbg(dev, "Looking up %s-supply from device tree\n", supply);
> +
> +	snprintf(prop_name, 64, "%s-supply", supply);
> +	regnode = of_parse_phandle(dev->of_node, prop_name, 0);

> +	if (!regnode) {

Similarly here

	snprintf(prop_name, 64, "%s-supply", supply);
	regnode = of_parse_phandle(dev->of_node, prop_name, 0);
	if (regnode)
		return regnode;


> +		regnode = of_get_child_regulator(dev->of_node, prop_name);
> +		if (regnode)
> +			return regnode;
> +
> +		dev_dbg(dev, "Looking up %s property in node %pOF failed\n",
> +			prop_name, dev->of_node);
> +		return NULL;
> +	}
> +	return regnode;

	regnode = of_get_child_regulator(dev->of_node, prop_name);
	if (regnode)
		return regnode;

	dev_dbg(dev, "Looking up %s property in node %pOF failed\n", prop_name, dev->of_node);
	return NULL;

> +}

-- 
With Best Regards,
Andy Shevchenko



