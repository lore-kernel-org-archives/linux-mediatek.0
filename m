Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCB6C52D7C
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Aug 2024 14:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=90AoTyfvA9g72Jijd7SVKUa4VZxBneIxG5keaybXl6w=; b=Imnt4+jNETz+bHNWpIHT7mGepr
	7wYrXFC/Ydq/ZVctirPiwHbXjp6MhJtuWLa44AThBvlqzTSn5eAdfHcvmtDjw5meh0YghKcOzyKzm
	e6eLaT3SUybfMxSPJX7VAJlErYGbuWtRVCr+1bPmxfbf6WSJ8NOcWyjhr/0M/mDcg8YRy4rRN/rbk
	RarH1rF1ycxiJxy+kT+BntOxZXPn2BMWMlAIIEG2wI6ny0nEvwS6tBHXaMdA66WSERg5Ot6FemVtN
	VclMCDVvund3G3+nCx9ZIUJGUks4sjm32PgsPb58hN6tP4+4Vrlzh1vp1BGJ+S4HF2UqRKLp00w9M
	cK7n1nRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh8Om-0000000D55k-3cg9;
	Thu, 22 Aug 2024 14:02:48 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh8O2-0000000D4ti-0Ubw;
	Thu, 22 Aug 2024 14:02:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724335322; x=1755871322;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DYajc8AW19c7b03Ic4Cd1e/BodGn5ZQSh80teMscdVc=;
  b=ElO1aOKutghtgKkUXIfpOK2U6tEx4I4sncCHKMJnafJmVRqO5lHy4/VM
   b6BjmP7LaR05su4dSbKghy7d3t0hKM5TwI1AWQpoPDjOLM7las0cKqp4w
   LGCyTLLfeqxBrKV8RgtjG2EF5Bybe+8uV6Ys7tn6A2ViFw231ppQQJ4Or
   yjgLV/BYjGK7bo0eWvPBNZoIYWea8kR+igZM6+O2Y3gnXn/IGKzZjPOEL
   QK/Zu63lRaDiCbK2/ysphOgYHQu/WbE47e0eUcgi3lH4+/2ujCY9yIy2k
   08epiey0iau67ISKvhmMcN5PBE/ZnkRrzWl5PtEKfvmqrt55QdFeGQnkk
   A==;
X-CSE-ConnectionGUID: Mgl4wnZPTr6xgdseUI9mWQ==
X-CSE-MsgGUID: VGJY5f/qSuS810hLErUWGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22619640"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="22619640"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 07:02:00 -0700
X-CSE-ConnectionGUID: wtMnhjT5Q7OY5YzBoCs16Q==
X-CSE-MsgGUID: GpBRurRkQOykwsj44mUesQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="66347601"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 07:01:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sh8Nt-00000000TMP-0QuL;
	Thu, 22 Aug 2024 17:01:53 +0300
Date: Thu, 22 Aug 2024 17:01:52 +0300
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
Subject: Re: [PATCH v5 06/10] i2c: Introduce OF component probe function
Message-ID: <ZsdE0PxKnGRjzChl@smile.fi.intel.com>
References: <20240822092006.3134096-1-wenst@chromium.org>
 <20240822092006.3134096-7-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822092006.3134096-7-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_070202_223915_5E718BA4 
X-CRM114-Status: GOOD (  30.02  )
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

On Thu, Aug 22, 2024 at 05:19:59PM +0800, Chen-Yu Tsai wrote:
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

> --- a/drivers/i2c/Makefile
> +++ b/drivers/i2c/Makefile
> @@ -9,6 +9,7 @@ i2c-core-objs 			:= i2c-core-base.o i2c-core-smbus.o
>  i2c-core-$(CONFIG_ACPI)		+= i2c-core-acpi.o
>  i2c-core-$(CONFIG_I2C_SLAVE) 	+= i2c-core-slave.o
>  i2c-core-$(CONFIG_OF) 		+= i2c-core-of.o
> +i2c-core-$(CONFIG_OF_DYNAMIC) 	+= i2c-core-of-prober.o

Seems like all the above (except ACPI) have the same issue, i.e. TABs/spaces
mixture.

...

> +	ret = of_changeset_apply(ocs);
> +	if (!ret) {

Why not positive conditional?

> +		/*
> +		 * ocs is intentionally kept around as it needs to
> +		 * exist as long as the change is applied.
> +		 */
> +		void *ptr __always_unused = no_free_ptr(ocs);
> +	} else {
> +		/* ocs needs to be explicitly cleaned up before being freed. */
> +		of_changeset_destroy(ocs);
> +	}

-- 
With Best Regards,
Andy Shevchenko



