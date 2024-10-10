Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0E6CF11FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Oct 2024 15:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AXYp1hCsE7O8eCHP5l0SClxsRy7S4xBaOx8hXQMbOVM=; b=TciDsbZXG+M9ZTUX4/Q8/yKNth
	/2izbBhkpNi1kF2NsE8BgyyoVsqhMHPswjXQKlGqX7jFtNggPcdFmeuDGqSnWd88rfZvWjyii9mIJ
	I9xclwFBFY4Qaa77I4bhSX/x8JZI+jtFXQ2OLfy4RgqGjYJ5NFEX/9fgBn6iomFcttE42A+8i9Dea
	YN/ub1GdMUSPeLOffhNM746ucSHhpaAgErhQYlHR9eDqPKOPwRuscwbSWTJdIcHQQFoDm33ZCwByD
	ScPxYDLxI3Gd0mGj/aCTjR0qcqWIAwJ6R1o0j0WERHAEMz3btb4nFgG8VUhiiJ77JCR1jNvAlb7Z8
	Yc25zhbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syvRI-0000000DQJs-03fw;
	Thu, 10 Oct 2024 15:50:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syv74-0000000DLGQ-46SE;
	Thu, 10 Oct 2024 15:30:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=AXYp1hCsE7O8eCHP5l0SClxsRy7S4xBaOx8hXQMbOVM=; b=XuZUNre/rj+ebBWDATHzx+D9nO
	ygtfgOAb0aOG+p4ty6OipVnxkL3PdtQa2mhYVnH2Mone9XYLr6vPy06ZnF2Z0I3a6XV3nSeUw85K8
	M8MvyjN3mqs1iY2u6MXtOscKgFKE8TxbETDi4L4DxwCC12cDMybJQh/2FuMQ2H337c8rgTNsVDFtO
	0Vlbtyysg1bzCnR6XZAsObr8QQP0CXFNoTD/Laqib+B19SpMqLdM6Hr4Af0z3lj84ZLnJ9i5GbJLU
	yDqZcm+otIjn1lAgG1rxIrZ78LetegwMdEVZwSmg+7OqjUH+vArJGU7VLTlvUlcdehIqiDlBhMrRL
	K+HDQWvg==;
Received: from mgamail.intel.com ([192.198.163.18])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syv70-00000005QVN-2QvO;
	Thu, 10 Oct 2024 15:30:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728574199; x=1760110199;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3Yh7DZRlIIUDk+aIqbJ40eQmrJ7arxkdSCZSAYEQQxo=;
  b=FnOgtDDpIWzWHl46m13c7JaPw6r8bZUzq8+jvIx4+OsCtX+LixUYI/0v
   Ymf513YuAcvYv3JwqiOlnCDIUEMQpwxFKyc/ubol9wUxCzbvb6hLYmp/W
   jfTAS8FZcqNPO2i5sSrj2imgzyzTYNaxGDVY+P7CQQyHft+bmMrohbQC7
   XoWi9fuzzpFf8HuZUrKht5OC4W2WwXdWKGP1I9RKDRfHmTd7W42bBv3Z2
   BAQ8N2hfNUolOb5jSZl44D5x+/hMQHSAa4NCL+aDLGsInD25LF/MfdDPC
   eu5QPE2hOhzIvNYdm6TrY0OktqQj6IYJF7+9KkbS5Rek9Hawc0ckeSLBO
   Q==;
X-CSE-ConnectionGUID: TsdIbeALTTe3TOqBmJ0Oww==
X-CSE-MsgGUID: GZs5B0XQS1OaX7r6Ct4mew==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27388506"
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="27388506"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 08:29:52 -0700
X-CSE-ConnectionGUID: XrYEqfQKRwaX4NHaTCuDjw==
X-CSE-MsgGUID: IKQnyKw7TIOwS2prjh7F+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="81151289"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 08:29:48 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1syv6m-00000001Zuf-3h6N;
	Thu, 10 Oct 2024 18:29:44 +0300
Date: Thu, 10 Oct 2024 18:29:44 +0300
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
Subject: Re: [PATCH v8 7/8] platform/chrome: Introduce device tree hardware
 prober
Message-ID: <Zwfy6ER6sbr_QxsY@smile.fi.intel.com>
References: <20241008073430.3992087-1-wenst@chromium.org>
 <20241008073430.3992087-8-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008073430.3992087-8-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_162959_046676_DD819163 
X-CRM114-Status: GOOD (  31.99  )
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

On Tue, Oct 08, 2024 at 03:34:26PM +0800, Chen-Yu Tsai wrote:
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
> this change introduces a simple I2C component prober. For any given
> class of devices on the same I2C bus, it will go through all of them,
> doing a simple I2C read transfer and see which one of them responds.
> It will then enable the device that responds.
> 
> This requires some minor modifications in the existing device tree.
> The status for all the device nodes for the component options must be
> set to "fail-needs-probe". This makes it clear that some mechanism is
> needed to enable one of them, and also prevents the prober and device
> drivers running at the same time.

...

> +#include <linux/array_size.h>
> +#include <linux/errno.h>
> +#include <linux/i2c-of-prober.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>

> +static int chromeos_i2c_component_prober(struct device *dev, const void *_data)
> +{
> +	const struct chromeos_i2c_probe_data *data = _data;
> +	struct i2c_of_probe_simple_ctx ctx = {
> +		.opts = data->opts

Leave trailing comma in such cases (when it's not a terminator and
not on the same line with the variable definition).

> +	};
> +
> +	return i2c_of_probe_component(dev, data->cfg, &ctx);
> +}
> +
> +static const struct chromeos_i2c_probe_data chromeos_i2c_probe_dumb_touchscreen = {
> +	.cfg = &(const struct i2c_of_probe_cfg) {

Perhaps you can introduce something like

#define DEFINE_I2C_OF_PROBE_CFG(_type_, _ops_)		\
	(struct ...) {					\
		.ops = _ops_,				\
		.type = #_type_,			\
	}

and use it here as

	.cfg = DEFINE_I2C_OF_PROBE_CFG(touchscreen, NULL),

> +		.type = "touchscreen"

Ditto.

> +	}

Ditto.

> +};
> +
> +static const struct i2c_of_probe_cfg chromeos_i2c_probe_simple_trackpad_cfg = {
> +	.ops = &i2c_of_probe_simple_ops,
> +	.type = "trackpad"

Leave a comma.

> +};

...

> +static const struct chromeos_i2c_probe_data chromeos_i2c_probe_hana_trackpad = {
> +	.cfg = &chromeos_i2c_probe_simple_trackpad_cfg,

	.cfg = DEFINE_I2C_OF_PROBE_CFG(trackpad, i2c_of_probe_simple_ops),

Or even

#define DEFINE_I2C_OF_PROBE_CFG_SIMPLE(_type_)			\
	DEFINE_I2C_OF_PROBE_CFG(type, &i2c_of_probe_simple_ops)

> +	.opts = &(const struct i2c_of_probe_simple_opts) {

Perhaps also DEFINE_xxx for this compound literal?

> +		.res_node_compatible = "elan,ekth3000",
> +		.supply_name = "vcc",
> +		/*
> +		 * ELAN trackpad needs 2 ms for H/W init and 100 ms for F/W init.
> +		 * Synaptics trackpad needs 100 ms.
> +		 * However, the regulator is set to "always-on", presumably to
> +		 * avoid this delay. The ELAN driver is also missing delays.
> +		 */
> +		.post_power_on_delay_ms = 0,
> +	}
> +};
> +
> +static const struct hw_prober_entry hw_prober_platforms[] = {
> +	{ .compatible = "google,hana", .prober = chromeos_i2c_component_prober, .data = &chromeos_i2c_probe_dumb_touchscreen },
> +	{ .compatible = "google,hana", .prober = chromeos_i2c_component_prober, .data = &chromeos_i2c_probe_hana_trackpad },

These strings are a bit long, perhaps wrap on one member per line?

> +};

-- 
With Best Regards,
Andy Shevchenko



