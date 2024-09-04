Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA185CA0ED3
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Sep 2024 13:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WIqYivxxNBK5wQwFDATI7PJyKeGApgKLKITwgVNwJOM=; b=m+ybcQoYii4UvxO+Ml6l4Yn/UY
	08WSEeZb2DJRmB7ctDJBUz5ppnL9K/r8QLbCy7qvuxghKlVLsnxUmtSzzmGM0NMu+GJIspCj1C3Eo
	IlWbym41F9y0xjtauid81hUlGfh9gpbdQsoZ2cHqTVUhv2cbcbAOMXPN0VQ7FZrBy/U3tNNZrPNOz
	s54iOD5NAs79UW0nGmGQHaoUeFbu0bu3OGba04he8LFUF05Uv3ozWnIVb0WaYKHj5xh2bfomt48eh
	UEkFOHe5+psorqEmaopkGQVsyXCSPpHf5k4G0wvfcY7SeTknTK8GgcKmyw2Vg724Na/EfFn8ikdC4
	vddrAxcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slqT1-00000004dwO-111g;
	Wed, 04 Sep 2024 13:54:39 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slqS3-00000004dhc-2xzk;
	Wed, 04 Sep 2024 13:53:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725458019; x=1756994019;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IrZ7cqUQ/rV3TjzeCgtYwOAMGS511YXRIN78hNIahso=;
  b=HptEWlm3zqmmEQs/7V1hm4OF3hWBlUxM5DGP1k7OpjqyMwrR4O3je4G/
   X3escZqcD+MvmtMtzgCnBIGG8ztaxTeE6SBmS/hNxNSW1KFzy4QTi+fsR
   c184D8Bo8Kax8XFHcm4bgWCvP+z7E0JGz+cX5uhb2Q13Csb/qsDEgd6S/
   OO02NiC3POFQhw1lmEVtrVdkfHkRHKlbtFyGIaAT1Gf8PLOJN0RRJomCa
   JypDiQn0QJurvzFW8WLx5RPimT6fq3AMXsoE17QBc1MjKm+BKgm7zJjHy
   lU0oITppCulam+YDjezeRHB6miK9oGJUga6oh8dB2GGOW+BtOPIYBT+96
   w==;
X-CSE-ConnectionGUID: iUIQWKaET2W/RZg5F4UZSg==
X-CSE-MsgGUID: RHxFRpfdS/2CRnQsx8YG3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="41619648"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="41619648"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 06:53:37 -0700
X-CSE-ConnectionGUID: j610Y+0US6q4B+XEa1zMhw==
X-CSE-MsgGUID: bvEv6kCCSCmYTMkuy16joQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="64946038"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 06:53:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1slqRu-0000000553f-1ICw;
	Wed, 04 Sep 2024 16:53:30 +0300
Date: Wed, 4 Sep 2024 16:53:30 +0300
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
Subject: Re: [PATCH v6 09/12] i2c: of-prober: Add regulator support
Message-ID: <ZthmWoJbjrEmzOzu@smile.fi.intel.com>
References: <20240904090016.2841572-1-wenst@chromium.org>
 <20240904090016.2841572-10-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904090016.2841572-10-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_065339_813156_4C1C2FD4 
X-CRM114-Status: GOOD (  29.54  )
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

On Wed, Sep 04, 2024 at 05:00:11PM +0800, Chen-Yu Tsai wrote:
> This adds regulator management to the I2C OF component prober.
> Components that the prober intends to probe likely require their
> regulator supplies be enabled, and GPIOs be toggled to enable them or
> bring them out of reset before they will respond to probe attempts.
> GPIOs will be handled in the next patch.
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

> +static int i2c_of_probe_get_regulators(struct device *dev, struct device_node *node,
> +				       struct i2c_of_probe_data *data)
> +{
> +	struct regulator_bulk_data *tmp, *new_regulators;
> +	int ret;
> +
> +	ret = of_regulator_bulk_get_all(dev, node, &tmp);
> +	if (ret < 0) {
> +		return ret;
> +	} else if (ret == 0) {
> +		/*
> +		 * It's entirely possible for a device node to not have
> +		 * regulator supplies. While it doesn't make sense from
> +		 * a hardware perspective, the supplies could be always
> +		 * on or otherwise not modeled in the device tree, but
> +		 * the device would still work.
> +		 */
> +		return ret;
> +	}

	if (ret < 0)
		return ret;

	/*
	 * It's entirely possible for a device node to not have regulator
	 * supplies. While it doesn't make sense from a hardware perspective,
	 * the supplies could be always on or otherwise not modeled in
	 * the device tree, but the device would still work.
	 */
	if (ret == 0)
		return ret;

> +	if (!data->regulators) {
> +		data->regulators = tmp;
> +		data->regulators_num = ret;
> +		return ret;
> +	};
> +
> +	new_regulators = krealloc_array(data->regulators, (data->regulators_num + ret),

Redundant parentheses.

> +					sizeof(*tmp), GFP_KERNEL);
> +	if (!new_regulators) {
> +		regulator_bulk_free(ret, tmp);
> +		return -ENOMEM;
> +	}
> +
> +	data->regulators = new_regulators;
> +	memcpy(&data->regulators[data->regulators_num], tmp, sizeof(*tmp) * ret);

Shouldn't be the size calculated based on the size of the destination?

> +	data->regulators_num += ret;
> +
> +	return ret;
> +}

...

As I said earlier my main concern is that timeout heuristic which seems fragile.
But I have no ideas to propose, leave this to others to comment on / think about.

-- 
With Best Regards,
Andy Shevchenko



