Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED69BC52D7C
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Aug 2024 14:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XCPtBG/HQnbl9V9mzVAXye2Hu2zflZJYMt7iCsi8qaQ=; b=px+QZO3ccRE6s7HjS2jHnreKxo
	/q+NYv5RZwB+DJiveYNTdRc9iX3T4bHsHYTkH81imr9a93paFCJ/XUwrEmfBvmZsV5QBxiyop5cPR
	iOEtOSjdoCwl4FbPSfXYwolCjJa4RZR/2yEG9Z2vg09KxmJMYwhlMcb2Tsql21RUc0i72nK6a4Siq
	rbz8H5mip8kSNMzPUYsXupduPTNpoLNdHN/5FfsTV07dao/QZ5eXLjE2wGp2kRbJe6gKa0GIom96E
	ugBCOGyjGRdeVKBIoggqHbXWuDnl+dpobqgXnG+zbnkBx74bO3DbmV5IlbTYADogkSFnvIdu4O1Sg
	wJ1FpNgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh8W7-0000000D6JI-0IIj;
	Thu, 22 Aug 2024 14:10:23 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh8VM-0000000D67R-0c3n;
	Thu, 22 Aug 2024 14:09:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724335776; x=1755871776;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Zz4O4whEUesMfAhJ7j0Z3pqJqU8Y23VLUAaNVPdDNDc=;
  b=YNB2KBtskYNm7DUa2RF98tJ+F3Oc5phDr5XUUyajO4zvj0dUlz52Yh7a
   PdIjmygyaT1O8SzheO1rpYSUpLxKji0whYJukhf4qi/9K4uaHaT44bh/J
   SedTWgqW021MMj6rfSdbiqFdwLyl3ukLMfMATveemlavMBblursSCFDFP
   eL6qBcpIYm2lSYaEC/a6/bWQW1xWTU6fHtpwpkLGk2ONobX2GziRggYVk
   e6dod0129GnS5wwMxRKfnVNELsCP0VC826HRdhGhdn5Rp6rnkrm4LiOmY
   pMt1ttFMymLUDTMnzrWDc3uyokk0hSL+sg0y2XjYqHgoLm7keMpVb8Dab
   g==;
X-CSE-ConnectionGUID: igGrDdFHTiezxu/+gPaZKA==
X-CSE-MsgGUID: 9t8woji7TdWmYwz1GwRMWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33416184"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="33416184"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 07:09:34 -0700
X-CSE-ConnectionGUID: o0O4O1N9Q9eKJEQkwOUDag==
X-CSE-MsgGUID: 4ThAX0y+RG21HH6ZEn/45w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="84625756"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 07:09:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sh8VB-00000000TUH-0yhz;
	Thu, 22 Aug 2024 17:09:25 +0300
Date: Thu, 22 Aug 2024 17:09:24 +0300
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
Subject: Re: [PATCH v5 07/10] i2c: of-prober: Add regulator support
Message-ID: <ZsdGlMyq4pwWAOk4@smile.fi.intel.com>
References: <20240822092006.3134096-1-wenst@chromium.org>
 <20240822092006.3134096-8-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822092006.3134096-8-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_070936_234073_B1F82BEF 
X-CRM114-Status: GOOD (  31.59  )
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

On Thu, Aug 22, 2024 at 05:20:00PM +0800, Chen-Yu Tsai wrote:
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

>  /*

>   * address responds.
>   *
>   * TODO:
> - * - Support handling common regulators and GPIOs.
> + * - Support handling common GPIOs.

You can split this to two lines in the first place and have less churn in this
patch and the other one.

>   * - Support I2C muxes
>   */

..

> +/* Returns number of regulator supplies found for node, or error. */
> +static int i2c_of_probe_get_regulator(struct device *dev, struct device_node *node,
> +				      struct i2c_of_probe_data *data)
> +{
> +	struct regulator_bulk_data *tmp, *new_regulators;
> +	int ret;
> +
> +	ret = of_regulator_bulk_get_all(dev, node, &tmp);
> +	if (ret <= 0)
> +		return ret;

I would split this and explain 0 case.


> +	if (!data->regulators) {
> +		data->regulators = tmp;
> +		data->regulators_num = ret;
> +		return ret;
> +	};
> +
> +	new_regulators = krealloc(data->regulators,
> +				  sizeof(*tmp) * (data->regulators_num + ret),

krealloc_array()

> +				  GFP_KERNEL);
> +	if (!new_regulators) {
> +		regulator_bulk_free(ret, tmp);
> +		return -ENOMEM;
> +	}
> +
> +	data->regulators = new_regulators;

> +	for (unsigned int i = 0; i < ret; i++)
> +		memcpy(&data->regulators[data->regulators_num++], &tmp[i], sizeof(*tmp));

Seems like copying array to array, no? If so, can't be done in a single memcpy() call?

> +	return ret;
> +}

...

> +static int i2c_of_probe_get_res(struct device *dev, struct device_node *node,
> +				struct i2c_of_probe_data *data)
> +{
> +	struct property *prop;
> +	int ret;
> +
> +	ret = i2c_of_probe_get_regulator(dev, node, data);
> +	if (ret < 0) {
> +		dev_err_probe(dev, ret, "Failed to get regulator supplies from %pOF\n", node);
> +		goto err_cleanup;
> +	}
> +
> +	return 0;
> +
> +err_cleanup:
> +	i2c_of_probe_free_res(data);
> +	return ret;
> +}

Hmm... why not

static int i2c_of_probe_get_res(struct device *dev, struct device_node *node,
				struct i2c_of_probe_data *data)
{
	struct property *prop;
	int ret;

	ret = i2c_of_probe_get_regulator(dev, node, data);
	if (ret < 0) {
		i2c_of_probe_free_res(data);
		return dev_err_probe(dev, ret, "Failed to get regulator supplies from %pOF\n", node);
	}

	return 0;
}

...

> +static int i2c_of_probe_enable_res(struct device *dev, struct i2c_of_probe_data *data)
> +{
> +	int ret = 0;

Redundant assignment.

> +	dev_dbg(dev, "Enabling regulator supplies\n");
> +
> +	ret = regulator_bulk_enable(data->regulators_num, data->regulators);
> +	if (ret)
> +		return ret;
> +
> +	/* largest post-power-on pre-reset-deassert delay seen among drivers */
> +	msleep(500);

How would we monitor if any [new] driver wants to use bigger timeout?

> +	return 0;
> +}

...

>  	struct i2c_adapter *i2c;
> +	struct i2c_of_probe_data probe_data = {0};

Reversed xmas tree order?

'0' is not needed.

...

> +	/* Grab resources */
> +	for_each_child_of_node_scoped(i2c_node, node) {
> +		u32 addr;
> +
> +		if (!of_node_name_prefix(node, type))
> +			continue;

Is it third or fourth copy of this code? At some point you probably want

#define for_each_child_of_node_with_prefix_scoped()
	for_each_if(...)

(or equivalent)

> +		if (of_property_read_u32(node, "reg", &addr))
> +			continue;
> +
> +		dev_dbg(dev, "Requesting resources for %pOF\n", node);
> +		ret = i2c_of_probe_get_res(dev, node, &probe_data);
> +		if (ret)
> +			return ret;
> +	}

-- 
With Best Regards,
Andy Shevchenko



