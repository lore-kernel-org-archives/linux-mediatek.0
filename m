Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5BA2C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Aug 2024 15:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PEXEDZ7c83lbTlPoHACz6fNOwSBIXjxeXcIk7R6AtZw=; b=3fOhrwkJ4UvvbTkKSbDlZX6yT4
	ZfdIF6PvczF287BZaFGFEM2ho/ZxTDFWvg1z+Vu85uVKu6zVWv3wlI70CJWpFM+a0/INCNY/eZLSv
	VK+46uPcjXBxxvVfSRIN/As99dnvPCaALnLpKJvKxgZiO4Urn1c2112e1pF4zPuJ9hFzonO2s3Xh9
	zIVpQvmp1NesruFLBrZTpy4Jtjqaya/pOdTVI4Q/HN/W7hHJ4eitDv4F3We8bJZvHUX8LvtEL1mnL
	GHopPFnVk68CWU1KKmet06rnP9Xti1qjQ8DpeKU4lz4OsTBVnNjS+BZWQddJE0vdpXmFyxpoBCSvQ
	HL47pXig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shA4L-0000000DOkK-2r2X;
	Thu, 22 Aug 2024 15:49:49 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh8vy-0000000DBh0-3c4J;
	Thu, 22 Aug 2024 14:37:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724337427; x=1755873427;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SgGSm8FSzrhUcZoCD0EacsxaNLj+jUld7Z8yQeRQg0s=;
  b=KjjrEYfMfU7wnNfSsbKWnYFbCkFKJXCivDhTR0QUeZeQI0gecZAr+U8J
   cs0mbcLbk+oN8zG50ETt86ndrbto2fxdkAX/kWi8uq5BtQ/iAxmUe4x4s
   n1cy2fiv86m3r6ape5w/dVQWcR/dgxeGndutamcLxKYnGUMgIJy/Igqwk
   OjJ00SBrqh8E+j6kkXnm0+FTI35nLPboa9jQgWcFO5mLBaxDcFGvkh6up
   p9KKcBymuJWeIa8F/vDEnecX6p/ScOiNVXMShIiZGfnm5D2Fl+bx5Z6dE
   /h4E1u9Q+lYV8G1OJ88NLiD+JXrx+uOuXSIka18FLf46pdpjVS9GWvUzw
   g==;
X-CSE-ConnectionGUID: az1HSxddTbS47OEFskyg4w==
X-CSE-MsgGUID: upo/fX6wSMC1uBr6jmKIlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22909441"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="22909441"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 07:36:59 -0700
X-CSE-ConnectionGUID: IStEf+XORPuVTv0irBHBLg==
X-CSE-MsgGUID: xlNHxf70R66ubW8bBhDxnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="61145009"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 07:36:54 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sh8vj-00000000Tv1-1dqJ;
	Thu, 22 Aug 2024 17:36:51 +0300
Date: Thu, 22 Aug 2024 17:36:51 +0300
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
Subject: Re: [PATCH v5 05/10] gpiolib: Add gpio_property_name_length()
Message-ID: <ZsdNA2b9CDRrtno2@smile.fi.intel.com>
References: <20240822092006.3134096-1-wenst@chromium.org>
 <20240822092006.3134096-6-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822092006.3134096-6-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_073706_976201_45599892 
X-CRM114-Status: GOOD (  27.39  )
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

On Thu, Aug 22, 2024 at 05:19:58PM +0800, Chen-Yu Tsai wrote:
> The I2C device tree component prober needs to get and toggle GPIO lines
> for the components it intends to probe. These components may not use the
> same name for their GPIO lines, so the prober must go through the device
> tree, check each property to see it is a GPIO property, and get the GPIO
> line.
> 
> Instead of duplicating the GPIO suffixes, or exporting them to the
> prober to do pattern matching, simply add and export a new function that
> does the pattern matching and returns the length of the GPIO name. The
> caller can then use that to copy out the name if it needs to.

...

> +/**
> + * gpio_property_name_length - Returns the GPIO name length from a property name
> + * @str:	string to check

It's property name, so, I would name this 'propname'.

> + * This function checks if the given name matches the GPIO property patterns, and
> + * returns the length of the name of the GPIO. The pattern is "*-<GPIO suffix>"
> + * or just "<GPIO suffix>".
> + *
> + * Returns:
> + * The length of the string before '-' if it matches "*-<GPIO suffix>", or

What about "x-y-gpios"? It's unclear what will be the behaviour.

> + * 0 if no name part, just the suffix, or
> + * -EINVAL if the string doesn't match the pattern.
> + */
> +int gpio_property_name_length(const char *str)

gpio_get_... ?

> +{
> +	size_t len;
> +
> +	len = strlen(str);

If it has a thousands characters...?

> +	/* string need to be at minimum len(gpio) */
> +	if (len < 4)
> +		return -EINVAL;

Do we really need it here? See below as well.

> +	/* Check for no-name case: "gpio" / "gpios" */
> +	for (const char *const *p = gpio_suffixes; *p; p++)
> +		if (!strcmp(str, *p))
> +			return 0;

> +	for (size_t i = len - 4; i > 0; i--) {
> +		/* find right-most '-' and check if remainder matches suffix */
> +		if (str[i] != '-')
> +			continue;
> +
> +		for (const char *const *p = gpio_suffixes; *p; p++)
> +			if (!strcmp(str + i + 1, *p))
> +				return i;
> +
> +		return -EINVAL;
> +	}

This can be combined with the above

	for (const char *const *p = gpio_suffixes; *p; p++) {
		/*
		 * Find right-most '-' and check if remainder matches suffix.
		 * If no separator found, check for no-name cases.
		 */
		dash = strrchr(propname, '-');
		if (!strcmp(dash ? dash + 1 : propname, *p))
			return i;
	}

> +	return -EINVAL;
> +}

-- 
With Best Regards,
Andy Shevchenko



