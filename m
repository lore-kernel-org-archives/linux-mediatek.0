Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E014DC07E97
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Nov 2023 16:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oM1WikqvsGuyS04S7WH2pwhVf8EnhlYOnFbjP1TtNYM=; b=gQjgP6xweBvBmfFOWtblTAGcFk
	i7lvrSDn1uJvw0F1Hv6H3w8IyktrNUcEdggHwQgxj6/wTKb7xiXd3ZyEvx8CZA0sXPTBFHxelLfr9
	B2fD6ogtYvUPes3Su/DtwSjr5czE4fLCQrqD7Efq/qLyzKMeTpBg5+PLj0HNzl/gTjBZ4hhRAqYd/
	yPSnWVD/0W1rAh4x9bDzwsbq6Gj0GbkJKRjmH4n7wIzP+KAaRKA4APcRRcPaYV1nQqKKR7iI4jDGR
	RkCXlqiY+MV7gPEmuyY+SB79+aBto/Y1+tnoPzvp81wluK41qjKFfi1nsPtD5w7BpX2IrEGEGhiLw
	n/sg8eyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r80rP-005nef-21;
	Tue, 28 Nov 2023 16:22:55 +0000
Received: from mgamail.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r80rL-005ne9-2d;
	Tue, 28 Nov 2023 16:22:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701188571; x=1732724571;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gE5J7qstsZ3WcDaR4Cb/bPac5/L+CEn93CqYK6zcnMA=;
  b=ZtPnU4u8TTvfVusyYDCBklaxfPje+W4ne2+oIEFs64/QWrXdzhGprQXj
   GRK03fosfWxcvYKNJ9UlCnHZdj9eEQTlF0wqJ3xORP/S+rroUZOq//JjD
   +gRGfRfHP8xyLEMzzCeWByrsOrybfVQjj1AcM0Hb0OqaCjbQ9rt4/BUMg
   wpc0OHow3PTLFsx9MSBEodbvktFn/6vpxxUJOR8Pw8KyZ6fl4FvfPheFd
   on18ymiVvnsZok+m69YCu1qcvu6xFwfkgHVG32mG63F9JtpzDsS8ug6TR
   KwgIzjtIPbjtsYlZyUuMQlo8xIGndzkEfPVor9JX6Rk9JLYxmwKSDDrXV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="459461907"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="459461907"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 08:22:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="1015938153"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="1015938153"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 08:22:40 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r80r6-00000000CwM-3RK7;
	Tue, 28 Nov 2023 18:22:36 +0200
Date: Tue, 28 Nov 2023 18:22:36 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>, linus.walleij@linaro.org,
	broonie@kernel.org, gregkh@linuxfoundation.org, hdegoede@redhat.com,
	james.clark@arm.com, james@equiv.tech, keescook@chromium.org,
	rafael@kernel.org, tglx@linutronix.de,
	Jeff LaBundy <jeff@labundy.com>, linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [RFC PATCH v3 2/5] i2c: of: Introduce component probe function
Message-ID: <ZWYTzGGToEmSu-Yh@smile.fi.intel.com>
References: <20231128084236.157152-1-wenst@chromium.org>
 <20231128084236.157152-3-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128084236.157152-3-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_082251_947729_01BA25AA 
X-CRM114-Status: GOOD (  31.68  )
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

On Tue, Nov 28, 2023 at 04:42:31PM +0800, Chen-Yu Tsai wrote:
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

> +/**
> + * i2c_of_probe_component() - probe for devices of "type" on the same i2c bus
> + * @dev: &struct device of the caller, only used for dev_* printk messages
> + * @type: a string to match the device node name prefix to probe for
> + *
> + * Probe for possible I2C components of the same "type" on the same I2C bus
> + * that have their status marked as "fail".

Definitely you haven't run kernel-doc validation.

> + */

...

> +		return dev_err_probe(dev, -ENODEV, "Could not find %s device node\n", type);

I haven't noticed clear statement in the description that this API is only for
the ->probe() stages.

...

> +		if (i2c_smbus_xfer(i2c, addr, 0, I2C_SMBUS_READ, 0, I2C_SMBUS_BYTE, &data) < 0)
> +			continue;

This will require the device to be powered on. Are you sure it will be always
the case?

-- 
With Best Regards,
Andy Shevchenko



