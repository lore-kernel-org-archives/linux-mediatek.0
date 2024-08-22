Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE32C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Aug 2024 13:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vTaw+8ycJu+2xvxjK0K9713hRdWUf9lcZbnHXgrlQa0=; b=mhW6Gx3kC6KE/22BG5J50mKJFT
	kDO2T8HCeRAvqvZZGEI/MlCUBWlPoawpwwTzQ9IcSX1KJUlHHC5isEWgJV1JYUNE0ChWEHC30O6Cs
	bRsgZbmFsVdEBSy0CRWtUPOyt8P1kwnFNTnX/6HFR1tXF7nHT18W+ENzR9/leEGb+8iCsWRF9+VdR
	7LPFDx/DlfXX7Y+m4uS8uBiG9NObQLDaR7LmWXpntKqIaD++YsmMuhdRr+1aIbp36X4a95j/cLX0W
	LWGmYH05MrQj2zZaVHgd9fFMZxs+gn+MJeSooExytzzkWUIW7qvlimfmmlGYr3dPkpEbva969bdKx
	Gn1z4ZRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh8Jw-0000000D3wq-2moU;
	Thu, 22 Aug 2024 13:57:48 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh8By-0000000D1HD-33JI;
	Thu, 22 Aug 2024 13:49:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724334575; x=1755870575;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LqJ7DQPFpxfgiOEVr0qSMrvDXb62+WaBmrdVtmy0cxs=;
  b=BaGXXGcOpFYeMs4rlgSaYdGOf0H6sqC909nLIVkswyfU+grG7rHfd5PX
   ErJrMDw3K5amjNnCSHmm0ZTwT98iV2ubJlVw/E62O87yTrFucoSUwdMHZ
   rgb6XXht7G2A8rGqyti5EWeE5A5teDixBgLXnLeEslAWOVXR1M23A3vdl
   tr/379/hS/B+VDxQLfvg+GM6ZwacRD+64q7zft4T211kCrJW4u5ByNgH0
   R3hhdPXxw8ZkEq4gHEnN64Jvk7Juu1W3DJK+1XYDze3nb1sN5W6TwLSN4
   H4w9E4r5gsuGoM+dGGM+8qmA6G3jiVpQkrft5JPjVs9UE1Y7/4Jl1yooL
   w==;
X-CSE-ConnectionGUID: nG39HabaRKSMwGKn8hCG7Q==
X-CSE-MsgGUID: 4TGy0CpnROWOegMiId46eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22617698"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="22617698"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 06:49:34 -0700
X-CSE-ConnectionGUID: rExSLsXBRvKzM/DYRndzqA==
X-CSE-MsgGUID: d9wMAPFZQ7qycJM9TKoADw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="66342683"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 06:49:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sh8Bb-00000000T9V-0Vns;
	Thu, 22 Aug 2024 16:49:11 +0300
Date: Thu, 22 Aug 2024 16:49:10 +0300
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
Subject: Re: [PATCH v5 03/10] regulator: Split up _regulator_get()
Message-ID: <ZsdB1vsEe0atW88_@smile.fi.intel.com>
References: <20240822092006.3134096-1-wenst@chromium.org>
 <20240822092006.3134096-4-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822092006.3134096-4-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_064934_846406_CD9CD7F1 
X-CRM114-Status: GOOD (  13.84  )
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

On Thu, Aug 22, 2024 at 05:19:56PM +0800, Chen-Yu Tsai wrote:
> _regulator_get() contains a lot of common code doing checks prior to the
> regulator lookup and housekeeping work after the lookup. Almost all the
> code could be shared with a OF-specific variant of _regulator_get().
> 
> Split out the common parts so that they can be reused. The OF-specific
> version of _regulator_get() will be added in a subsequent patch.
> No functional changes were made.

> +/**
> + * _regulator_get_common - Common code for regulator requests
> + * @rdev: regulator device pointer as returned by *regulator_dev_lookup()
> + *       Its reference count is expected to have been incremented.
> + * @dev: device used for dev_printk messages
> + * @id: Supply name or regulator ID
> + * @get_type: enum regulator_get_type value corresponding to type of request
> + *
> + * Returns a struct regulator corresponding to @rdev,
> + * or IS_ERR() condition containing errno.
> + *
> + * This function should be chained with *regulator_dev_lookup() functions.

kernel-doc will warn here: No "Return" section.

> + */

-- 
With Best Regards,
Andy Shevchenko



