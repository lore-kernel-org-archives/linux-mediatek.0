Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5ADDC52D7C
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Aug 2024 11:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k9pwxAKGW2OWYTbxMNvMtVLAWsYkSfMxvvZYhJ1gXNY=; b=ut8i4zEjCZ4UqlYok1vOl1LAjb
	yZ2ComZyWkuA7gySMyqZKeoELlYeMEkG8K3NGTzF783Mjq0awwVWxwFasEzbW40Xk6W5voGoWWfeH
	RtBHVRfJurEJmpTafWv7DxpQjR+Mnt2yWm7Wyfok0wI7yHwH2jqYnJ8Gr6wtJoRPRuCpyKoM+W9xK
	xVG8Gx7z2QNeemL7sV1Vmlp6Cf+x4XqQi+KFm2TvpekQifLG9q90U37MdWyWUTktVdikGJv5c9CqL
	fcspwAbpL1DHN0dhzXBagmzWf2riC+EYmmWS7NzPUDQLd9nYHuGrAF29DjFmBLis1XWoLyq473HQm
	ibKK0Jew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdpgI-00000003Vdb-1VfZ;
	Tue, 13 Aug 2024 11:27:14 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdpfe-00000003VWN-183p;
	Tue, 13 Aug 2024 11:26:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723548395; x=1755084395;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mCsx0QXngc1tRJLyEc7vROSqNAJTKyqG25u/E86hHu8=;
  b=A0y2yP8eWHf5QkzG+x9nb9TkFGRjX1ylu/qEfjiwxGs+FShGAExayb1F
   Jn+Mz7YvIWdZjZHLYCz4ef/VLsEqtCmZLq+s1fwVdQUC0r580yhWP/MFe
   bkYig0x5xFm8vOTEm3URRqAaf3WcqG3APfkho45asTNnpjpnYy0sMk3hn
   xHzF/rMvAA/q7q3hHenRfiI8736UQtDUf90lz5VVwMsF9Ta+XDLXZap9v
   QBl+JJELSty9/72AIaN0ge5kICqLpXrIac5ekBHzooZHt8uyubbwOgfLQ
   pLyx4QLM0neSkKeSUlZPODKHgAqHXFF9n8nZO9Chc379ZFOtVzz9WyA3H
   Q==;
X-CSE-ConnectionGUID: lffqVoA/QYOJaAwya6GvFQ==
X-CSE-MsgGUID: QWMeLaISRnmiarJY9fBEWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="32278830"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="32278830"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 04:26:33 -0700
X-CSE-ConnectionGUID: zbbaIvIxQReJCsjUmDVR/Q==
X-CSE-MsgGUID: Wra6aVTQRlm5QHzdFegvsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="63319144"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 04:26:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sdpfW-0000000EhwO-00u9;
	Tue, 13 Aug 2024 14:26:26 +0300
Date: Tue, 13 Aug 2024 14:26:25 +0300
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
Subject: Re: [PATCH v4 3/6] i2c: Introduce OF component probe function
Message-ID: <ZrtC4Q4N_3x2KTNb@smile.fi.intel.com>
References: <20240808095931.2649657-1-wenst@chromium.org>
 <20240808095931.2649657-4-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240808095931.2649657-4-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_042634_386971_F66490BC 
X-CRM114-Status: GOOD (  27.47  )
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

On Thu, Aug 08, 2024 at 05:59:26PM +0800, Chen-Yu Tsai wrote:
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

> +int i2c_of_probe_component(struct device *dev, const char *type)

Use respective scoped variants and remove the related of_node_put() calls.

...

> +		ocs = kzalloc(sizeof(*ocs), GFP_KERNEL);

Use __free()

> +		if (!ocs) {
> +			ret = -ENOMEM;
> +			goto err_put_node;
> +		}

> +err_free_ocs:
> +	kfree(ocs);

-- 
With Best Regards,
Andy Shevchenko



