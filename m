Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11542CD98E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 09:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9hBGbkhV/3vuK/Tjp/LOl9erXla1+SWHZPqLvmd3tfc=; b=HHOyCf9qWKGDEhjFoHIiOSLfqp
	rmeNSj3RlEYY7z8MCk7GGceTJLxYslNm6AK+sQPJsFsxS9fUXy8UQ39QmIcSTdSSpa+8gXh0kZa6P
	Yqjgj0n6pB4ppC/3p3eAtxQRePKqz5W/l2UlxTQ90fAGhZDJ4efRT/hP584329GDLVgtSr16dmbxG
	tcbNLGX+bwUP90GOwr/vDXxbwypJT2xxafpSmkpH8u+isvzoxFktZrkwJpVt9hAHzoj+AdZNRbYJY
	so7C90lguEAjcgua8Hs9rrB0hPop6K7ZN1n0D2DTDv9bZ+dealMZTVPQC1fQt5laEO2x9ZVfWvAhW
	R6lj+jfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZmqR-0000000GxpS-2cWX;
	Wed, 17 Jun 2026 09:46:03 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZmqP-0000000Gxia-0xJF;
	Wed, 17 Jun 2026 09:46:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781689561; x=1813225561;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PJRUrD9zZfvxEp95vYDkf9Io499+vXWD3N/tqWUsuhs=;
  b=edluMAKcnaLRx1CHZZxcNZ9x8DZMY0XRb4x3Mz6gwEu51a/LVUNOPxmW
   OkfuxUilVQm4bwcI3apaWKuqsGlKbdbRCdtNGVQBAjHpBEroz6ckcnKMU
   zV+3SiUPHDO4QdDcILvlZ+YhzZV+fFFbO1P6H4b0RkMHtBB5SOH6D/8Ba
   gVzMfpFM+fe7s1qTD+xUfDBLHI3IU9koYZxmRaVsZQrAWV5sGSX2SYedw
   9VX+SnDjjUgaX71jVTpUBd74rtVzoHDr7J+m3VV3fL2+PJqqm4A/o6HsF
   YonFkE9SkhlcLsc/f6YdLnKbtInd3eIuT9kxfX1YjL0tR9aHpp3nV869Z
   w==;
X-CSE-ConnectionGUID: O5QuLaWdQXKyIh6EK8JS2g==
X-CSE-MsgGUID: nx89t2vRSUW/zv2es+tXvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82534245"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="82534245"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 02:43:56 -0700
X-CSE-ConnectionGUID: KqEF+XwPTGGdSxcdFhXqFA==
X-CSE-MsgGUID: zVMyIUsrS06+OMMQYl0JoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="246888272"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.245.69])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 02:43:52 -0700
Date: Wed, 17 Jun 2026 12:43:49 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: rva333@protonmail.com
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ben Grisdale <bengris32@protonmail.ch>
Subject: Re: [PATCH v3 2/4] iio: adc: mt6323-auxadc: add mt6323 PMIC AUXADC
 driver
Message-ID: <ajJsVdQPdkpfIyLG@ashevche-desk.local>
References: <20260616-mt6323-adc-v3-0-1c27c588185d@protonmail.com>
 <20260616-mt6323-adc-v3-2-1c27c588185d@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616-mt6323-adc-v3-2-1c27c588185d@protonmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_024601_301230_CBB9F706 
X-CRM114-Status: GOOD (  14.21  )
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

On Tue, Jun 16, 2026 at 05:15:40PM +0300, Roman Vivchar via B4 Relay wrote:

> The mt6323 AUXADC is a 15-bit ADC used for system monitoring. This driver
> provides support for reading various channels including battery and
> charger voltages, battery and chip temperature, current sensing and
> accessory detection.
> 
> Add a driver for the AUXADC found in the MediaTek mt6323 PMIC.

...

> +static int mt6323_auxadc_prepare_channel(struct mt6323_auxadc *auxadc)
> +{
> +	struct regmap *map = auxadc->regmap;
> +	u32 val;
> +	int ret;
> +
> +	ret = regmap_read(map, MT6323_AUXADC_CON19, &val);
> +	if (ret)
> +		return ret;
> +
> +	/* The ADC is idle. */
> +	if (!(val & AUXADC_CON19_DECI_GDLY_MASK))
> +		return 0;

> +	ret = regmap_read_poll_timeout(map, MT6323_AUXADC_ADC19, val,
> +				       !(val & AUXADC_ADC19_BUSY_MASK),
> +				       10, 500);

Still can be amended.

	ret = regmap_read_poll_timeout(map, MT6323_AUXADC_ADC19,
				       val, !(val & AUXADC_ADC19_BUSY_MASK),
				       10, 500);

(no need to resend just for this).

> +	if (ret)
> +		return ret;
> +
> +	return regmap_clear_bits(map, MT6323_AUXADC_CON19,
> +				 AUXADC_CON19_DECI_GDLY_MASK);
> +}

-- 
With Best Regards,
Andy Shevchenko



