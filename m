Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A36BEC4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Nov 2023 16:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W1ywWWTIjPTvPOiE3I/U/Ertmn0SdcywoKEnpfUiiAw=; b=xCJt4wv0yDMmaYzYLY+A6m3NGV
	mKmpqfee7r9e/vld3otOl0R7wELKbe0p+UAfgFq3Hh1IONzOBdQHIspFPiJQfy/tf805aacT5Z5/N
	hTVieli2ogvoA1mchh1OmX27qvk/tlGJBotg2ly/DiiOZDboX1+abj5Oh10BaDgIhdoSwGji3mkXZ
	GYBb/lajRbpxYpznlB+crr1HVw0sd2B5ISIwTDmX665UayH7k4HrpSAMFx6HtEAizmiGBzOq9yqfo
	US4LEpTzz5g8GKG+nb5eFK4dMrC4LJNodJqGi7kHJKDT56WWv+ShYq+Rhj4T19qUCUkquIEG9mhMa
	jXKNFDRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r80uT-005oAd-2M;
	Tue, 28 Nov 2023 16:26:05 +0000
Received: from mgamail.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r80uQ-005o9x-1y;
	Tue, 28 Nov 2023 16:26:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701188762; x=1732724762;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WQHZ+PbGGa3aDyciuChblMvLCm0dgXzHSZ5ktHj28m0=;
  b=QBeUqHGd9IIm5NGwE7LzRpVQnaqwgzfeBTh2Lis/piSqZfwXafvM96ts
   vWJ9LAUIhE0dKA1EDX1hUw9GoYTeIjM8nXOiWqFJofMdr1UqKHQNm2fiw
   4KGkNfY/hXCJs0aJcPzOzvARDYHBCVmhdrJd9fnHHdvbpeuKMk5ISkKLZ
   dNJyRW60ZO6iJGznRykjg26BvH5K7Gu67LECnEkkrvShXhtfwYh4FHuCD
   9ZdpC6z34V/vZksvbV2H+Daehr2m9wnroRyWLJWvoLqu7J3dasfxDI/BM
   O+ftsHY9C5dg3ozzhi1qx0C3fesLxZPRvz0j3FZIJOK08oZj7BSTcIQ25
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="424106454"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="424106454"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 08:26:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="768577278"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="768577278"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 08:25:51 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r80uB-00000000CyG-1z99;
	Tue, 28 Nov 2023 18:25:47 +0200
Date: Tue, 28 Nov 2023 18:25:47 +0200
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
Subject: Re: [RFC PATCH v3 3/5] platform/chrome: Introduce device tree
 hardware prober
Message-ID: <ZWYUi3Q5ptQXR0uQ@smile.fi.intel.com>
References: <20231128084236.157152-1-wenst@chromium.org>
 <20231128084236.157152-4-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128084236.157152-4-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_082602_681473_E11EC900 
X-CRM114-Status: GOOD (  33.29  )
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

On Tue, Nov 28, 2023 at 04:42:32PM +0800, Chen-Yu Tsai wrote:
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

> +#include <linux/array_size.h>
> +#include <linux/i2c.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>

init.h for init calls.


> +static int chromeos_of_hw_prober_probe(struct platform_device *pdev)
> +{
> +	for (size_t i = 0; i < ARRAY_SIZE(hw_prober_platforms); i++)
> +		if (of_machine_is_compatible(hw_prober_platforms[i].compatible)) {
> +			int ret;

Perhaps

		if (!of_machine_is_compatible(hw_prober_platforms[i].compatible))
			continue;

?

> +			ret = hw_prober_platforms[i].prober(&pdev->dev,
> +							    hw_prober_platforms[i].data);
> +			if (ret)
> +				return ret;
> +		}
> +
> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko



