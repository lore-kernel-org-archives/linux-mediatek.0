Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C21C52D7C
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Aug 2024 11:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4we6/dbujn51zMrqwrJZOeZZ1ZeGRM0LMIAefRGYnow=; b=N0wnkKb7+eyRhIGh7xj35KIabw
	Drk+GhBBJFcfIBUVi3LMr/OCYLteP5f1UjoHHhGgK4sB5mpWVb9Sn1XKdKDGO/UaC++T6a0eookMG
	f7XnTMaP2njW3Y0GnApaaHTimLcvHDwNOxIUaOXkwERlbwyZeWKzq3EkhyNPgPZYsLBfvz9DfXTwJ
	N9VvEht3GWO73Xiq+KEOFMjZSOxY7CJ5rYLTXtGr5zLQo4qaTa23Xckt1Gd8vD68RYrfZftGRnz8M
	13d48Sj6Gdk1UTkQuQH0r+1i/1n3zE/Za9+5wIG/KDsuUACAALbAqbJKsUmnaibXOMHqDQr5X/UE5
	niNbSftw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdpzR-00000003YYR-2VH2;
	Tue, 13 Aug 2024 11:47:01 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdpyp-00000003YQf-1tnN;
	Tue, 13 Aug 2024 11:46:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723549583; x=1755085583;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PEn3XtRW5tjHG4xl8Hpy2BfiNBLyF2Xe3sCNrstiv8Y=;
  b=P2vUqLHxZ0fdb2EwcTuwGjjbcnB2xiYfn1ws4zW/rwiRCU+r9m+MknCF
   wwQIQmj4U5FQ6T/tWOxQTPPC1KGd7rPyph1xzTccHNQFXU9RjIO9wepZd
   H736SeEetwj/+YCHZcAp3C4uHfkgeQ3gHV2dL7LYBwzG1ttrZ0IOtZxTs
   /Pi6hnNiVyO53h2XwUBstoDvun7uJRMJ++XxmsPOnUbDcV0RkgyfPGaYI
   sMslF5EUgAsVbdDC7kGYTQpsI3F3dsT6KU21jHftVP7Jg7pVctZc0CYMC
   /IV/laS4uYzoLtbDYdAZJdV2YsSoD3m5mZl8/bqaId/3R5n34eITULCIP
   A==;
X-CSE-ConnectionGUID: pGwc6X37R3u/VkUwSvTCIQ==
X-CSE-MsgGUID: KmIn208aRQ6Kd6qx71znwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21523250"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="21523250"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 04:46:20 -0700
X-CSE-ConnectionGUID: PSIpAqcSTxuZeWGvCSvo1g==
X-CSE-MsgGUID: P3hRk+ueTcOZ3cw0Qi3PVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="63037742"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 04:46:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sdpyf-0000000EiFk-1s3a;
	Tue, 13 Aug 2024 14:46:13 +0300
Date: Tue, 13 Aug 2024 14:46:13 +0300
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
Subject: Re: [PATCH v4 5/6] platform/chrome: Introduce device tree hardware
 prober
Message-ID: <ZrtHhcNMiyHmKbal@smile.fi.intel.com>
References: <20240808095931.2649657-1-wenst@chromium.org>
 <20240808095931.2649657-6-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240808095931.2649657-6-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_044623_570263_96222683 
X-CRM114-Status: GOOD (  31.10  )
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

On Thu, Aug 08, 2024 at 05:59:28PM +0800, Chen-Yu Tsai wrote:
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
> set to "failed-needs-probe". This makes it clear that some mechanism is
> needed to enable one of them, and also prevents the prober and device
> drivers running at the same time.

...

> + * Copyright (c) 2023 Google LLC

At bare minimum we are in 2024 now.

...

> +#include <linux/array_size.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>

> +#include <linux/of.h>

Why?

> +#include <linux/platform_device.h>

...

> +	for (size_t i = 0; i < ARRAY_SIZE(hw_prober_platforms); i++) {
> +		if (!of_machine_is_compatible(hw_prober_platforms[i].compatible))
> +			continue;

> +		int ret;

I didn't know we allow this kind of definition mix besides for-loop and
__free()... Can you point me out where this style change was discussed?

> +		ret = hw_prober_platforms[i].prober(&pdev->dev, hw_prober_platforms[i].data);
> +		/* Ignore unrecoverable errors and keep going through other probers */
> +		if (ret == -EPROBE_DEFER)
> +			return ret;
> +	}

...

> +static void chromeos_of_hw_prober_driver_exit(void)
> +{
> +	if (!chromeos_of_hw_prober_pdev)
> +		return;

First of all, this is dup for the next call, second, when may this conditional
be true?

> +	platform_device_unregister(chromeos_of_hw_prober_pdev);
> +	platform_driver_unregister(&chromeos_of_hw_prober_driver);
> +}
> +module_exit(chromeos_of_hw_prober_driver_exit);

-- 
With Best Regards,
Andy Shevchenko



