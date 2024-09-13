Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1DCCFA3740
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Sep 2024 10:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mv2yIWBbfjFcYUbFMFbENVFXPZFrSHsv8WArrS8dKzs=; b=D7GIvCy0e+ClBzm0YD20ThIn57
	pUhRd2+hh5aojI3SrK8Pvip559h1YkKLmA38EpLQZkiRWqDBtthxHzMe8eRdH1hm2KsKfcKAl7Ab+
	yqy8AxNzERGdv2yUOzUOSoGZbfD5XoDx8ELeNA4TL9G3iEF8riz+sghN0cIjJM6cJwykQOBQP3KXO
	sR/wuQw4fiCwmE65sp0tP6cOy7OOZzFq2HZpJRBjUbRzV3QwbyJQebruzFNRjpELlAqBPCwCbYN0I
	+89NKfmoekfu9bAC0lIb763IFs+uJbSPIoBa1EjeoaNZIQk+VWRU8IotoX4vufeQOsD4K/+bEPd90
	pEJTckzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp3Vj-0000000FbWG-1v2l;
	Fri, 13 Sep 2024 10:26:43 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp3Ue-0000000FbR5-24pD;
	Fri, 13 Sep 2024 10:25:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726223136; x=1757759136;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lt83t51ZsHqvSfIdV0RclKGYyXqJEVdfzYc8IAcGfMI=;
  b=Y6mNeWg4b2frFbIDRkz36c+5xclQpx4mduw7t7qHiu38zlcrRwbWdZet
   uC9qUG2Yf2rJE+lOpAkx6OS8imtIl08q8VkBuIbrMnsQTWe+ZoAbCQUBl
   OhxJl2geY3wUCE6yYPSVK2GScDNkjRrQ8jBtSVwan4ygHTSY6kpNvUaIO
   /V3QSK/T/qKet1L/tame1oy6ycjH9yYpM3vh9HdyF5E5DtTMlNrYfiXmB
   2LjdKu9Pk6JI2Uo/v1c8dDm2HY6OZ5sja3YuqI9s0pKBtBw9NWIfGQVsW
   bS+22pjO0gIA1cFeg1o2Nf/BgZjyc7JvPygllPOvsxhTxitJxifUEIQml
   A==;
X-CSE-ConnectionGUID: JM8Z/uWAT3mWv9qWrd7JeA==
X-CSE-MsgGUID: EBz+4qpTTOiNdo/adJHxfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25271733"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="25271733"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 03:25:32 -0700
X-CSE-ConnectionGUID: 8QVI6aEsTCe+hCX64HmrqQ==
X-CSE-MsgGUID: EP8F7RfqRk6pAL0aOhSVoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="68096162"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 03:25:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sp3UT-00000008GAC-2BYS;
	Fri, 13 Sep 2024 13:25:25 +0300
Date: Fri, 13 Sep 2024 13:25:25 +0300
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
Subject: Re: [PATCH v7 06/10] i2c: Introduce OF component probe function
Message-ID: <ZuQTFTNTBLCziD05@smile.fi.intel.com>
References: <20240911072751.365361-1-wenst@chromium.org>
 <20240911072751.365361-7-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911072751.365361-7-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_032536_579729_8CDA222B 
X-CRM114-Status: GOOD (  44.39  )
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

On Wed, Sep 11, 2024 at 03:27:44PM +0800, Chen-Yu Tsai wrote:
> Some devices are designed and manufactured with some components having
> multiple drop-in replacement options. These components are often
> connected to the mainboard via ribbon cables, having the same signals
> and pin assignments across all options. These may include the display
> panel and touchscreen on laptops and tablets, and the trackpad on
> laptops. Sometimes which component option is used in a particular device
> can be detected by some firmware provided identifier, other times that
> information is not available, and the kernel has to try to probe each
> device.
> 
> This change attempts to make the "probe each device" case cleaner. The
> current approach is to have all options added and enabled in the device
> tree. The kernel would then bind each device and run each driver's probe
> function. This works, but has been broken before due to the introduction
> of asynchronous probing, causing multiple instances requesting "shared"
> resources, such as pinmuxes, GPIO pins, interrupt lines, at the same
> time, with only one instance succeeding. Work arounds for these include
> moving the pinmux to the parent I2C controller, using GPIO hogs or
> pinmux settings to keep the GPIO pins in some fixed configuration, and
> requesting the interrupt line very late. Such configurations can be seen
> on the MT8183 Krane Chromebook tablets, and the Qualcomm sc8280xp-based
> Lenovo Thinkpad 13S.
> 
> Instead of this delicate dance between drivers and device tree quirks,
> this change introduces a simple I2C component probe. function For a
> given class of devices on the same I2C bus, it will go through all of
> them, doing a simple I2C read transfer and see which one of them responds.
> It will then enable the device that responds.
> 
> This requires some minor modifications in the existing device tree. The
> status for all the device nodes for the component options must be set
> to "failed-needs-probe". This makes it clear that some mechanism is
> needed to enable one of them, and also prevents the prober and device
> drivers running at the same time.

...

> +static int i2c_of_probe_enable_node(struct device *dev, struct device_node *node)
> +{
> +	int ret;

> +	dev_info(dev, "Enabling %pOF\n", node);

Is it important to be on INFO level?

> +	struct of_changeset *ocs __free(kfree) = kzalloc(sizeof(*ocs), GFP_KERNEL);
> +	if (!ocs)
> +		return -ENOMEM;
> +
> +	of_changeset_init(ocs);
> +	ret = of_changeset_update_prop_string(ocs, node, "status", "okay");
> +	if (ret)
> +		return ret;
> +
> +	ret = of_changeset_apply(ocs);
> +	if (ret) {
> +		/* ocs needs to be explicitly cleaned up before being freed. */
> +		of_changeset_destroy(ocs);
> +	} else {
> +		/*
> +		 * ocs is intentionally kept around as it needs to
> +		 * exist as long as the change is applied.
> +		 */
> +		void *ptr __always_unused = no_free_ptr(ocs);
> +	}
> +
> +	return ret;
> +}

...

> +int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cfg, void *ctx)
> +{
> +	const struct i2c_of_probe_ops *ops;
> +	const char *type;
> +	struct device_node *i2c_node;
> +	struct i2c_adapter *i2c;
> +	int ret;
> +
> +	if (!cfg)
> +		return -EINVAL;
> +
> +	ops = cfg->ops ?: &i2c_of_probe_dummy_ops;
> +	type = cfg->type;
> +
> +	i2c_node = i2c_of_probe_get_i2c_node(dev, type);


	struct device_node *i2c_node __free(of_node_put) =
		i2c_...;

> +	if (IS_ERR(i2c_node))
> +		return PTR_ERR(i2c_node);
> +
> +	for_each_child_of_node_with_prefix(i2c_node, node, type) {
> +		if (!of_device_is_available(node))
> +			continue;
> +
> +		/*
> +		 * Device tree has component already enabled. Either the
> +		 * device tree isn't supported or we already probed once.
> +		 */
> +		ret = 0;

Shouldn't you drop reference count for "node"? (See also below)

> +		goto out_put_i2c_node;
> +	}
> +
> +	i2c = of_get_i2c_adapter_by_node(i2c_node);
> +	if (!i2c) {
> +		ret = dev_err_probe(dev, -EPROBE_DEFER, "Couldn't get I2C adapter\n");
> +		goto out_put_i2c_node;
> +	}
> +
> +	/* Grab resources */
> +	ret = 0;
> +	if (ops->get_resources)
> +		ret = ops->get_resources(dev, i2c_node, ctx);
> +	if (ret)
> +		goto out_put_i2c_adapter;
> +
> +	/* Enable resources */
> +	if (ops->enable)
> +		ret = ops->enable(dev, ctx);
> +	if (ret)
> +		goto out_release_resources;
> +
> +	ret = 0;
> +	for_each_child_of_node_with_prefix(i2c_node, node, type) {
> +		union i2c_smbus_data data;
> +		u32 addr;
> +
> +		if (of_property_read_u32(node, "reg", &addr))
> +			continue;
> +		if (i2c_smbus_xfer(i2c, addr, 0, I2C_SMBUS_READ, 0, I2C_SMBUS_BYTE, &data) < 0)
> +			continue;
> +
> +		/* Found a device that is responding */
> +		if (ops->free_resources_early)
> +			ops->free_resources_early(ctx);
> +		ret = i2c_of_probe_enable_node(dev, node);

Hmm... Is "node" reference count left bumped up for a reason?

> +		break;
> +	}
> +
> +	if (ops->cleanup)
> +		ops->cleanup(dev, ctx);
> +out_release_resources:
> +	if (ops->free_resources_late)
> +		ops->free_resources_late(ctx);
> +out_put_i2c_adapter:
> +	i2c_put_adapter(i2c);
> +out_put_i2c_node:
> +	of_node_put(i2c_node);
> +
> +	return ret;
> +}

...

> +/*
> + * i2c-of-prober.h - definitions for the Linux I2C OF component prober

Please avoid putting filenames inside files. In the possible future event of
file renaming this may become a burden and sometimes even forgotten.

> + * Copyright (C) 2024 Google LLC
> + */
> +
> +#ifndef _LINUX_I2C_OF_PROBER_H
> +#define _LINUX_I2C_OF_PROBER_H

> +#if IS_ENABLED(CONFIG_OF_DYNAMIC)

Do you really need to hide data types with this? Wouldn't be enough to hide
APIs only?

> +struct device;
> +struct device_node;
> +
> +/**
> + * struct i2c_of_probe_ops - I2C OF component prober callbacks
> + *
> + * A set of callbacks to be used by i2c_of_probe_component().
> + *
> + * All callbacks are optional. Callbacks are called only once per run, and are
> + * used in the order they are defined in this structure.
> + *
> + * All callbacks that have return values shall return %0 on success,
> + * or a negative error number on failure.
> + *
> + * The @dev parameter passed to the callbacks is the same as @dev passed to
> + * i2c_of_probe_component(). It should only be used for dev_printk() calls
> + * and nothing else, especially not managed device resource (devres) APIs.
> + */
> +struct i2c_of_probe_ops {
> +	/** @get_resources: Retrieve resources for components. */
> +	int (*get_resources)(struct device *dev, struct device_node *bus_node, void *data);
> +
> +	/** @free_resources_early: Release exclusive resources prior to enabling component. */
> +	void (*free_resources_early)(void *data);
> +
> +	/**
> +	 * @enable: Enable resources so that the components respond to probes.
> +	 *
> +	 * Resources should be reverted to their initial state before returning if this fails.
> +	 */
> +	int (*enable)(struct device *dev, void *data);
> +
> +	/**
> +	 * @cleanup: Opposite of @enable to balance refcounts after probing.
> +	 *
> +	 * Can not operate on resources already freed in @free_resources_early.
> +	 */
> +	int (*cleanup)(struct device *dev, void *data);
> +
> +	/**
> +	 * @free_resources_late: Release all resources, including those that would have
> +	 *                       been released by @free_resources_early.
> +	 */
> +	void (*free_resources_late)(void *data);
> +};
> +
> +/**
> + * struct i2c_of_probe_cfg - I2C OF component prober configuration
> + * @ops: Callbacks for the prober to use.
> + * @type: A string to match the device node name prefix to probe for.
> + */
> +struct i2c_of_probe_cfg {
> +	const struct i2c_of_probe_ops *ops;
> +	const char *type;
> +};
> +
> +int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cfg, void *ctx);
> +
> +#endif /* IS_ENABLED(CONFIG_OF_DYNAMIC) */
> +
> +#endif /* _LINUX_I2C_OF_PROBER_H */

-- 
With Best Regards,
Andy Shevchenko



