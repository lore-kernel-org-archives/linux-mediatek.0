Return-Path: <SRS0=zTQl=5Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F7C6C43331
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Mar 2020 16:09:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 631A0206CC
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Mar 2020 16:09:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f0CZp2We"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 631A0206CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PevM7SFKcxXKsbbHmvp3c7gy43EvdTYVowY5fwvPtZY=; b=f0CZp2WeDce/v4
	adm0WG5l9thcMTxMAZOL7xyn92D4xT5jeKZhkn4hfI50lgegtF4QoVU6aYW7UWKBlUs0sB6v7U8CD
	6ZttkTl6Xm5Vg7Dp0ysdf7orgfXKyzmMBocizOLsFqAh5M4XonKnQ6yxFXtPGR56EkTI9usz5OSn3
	NFoqlhgXZOLmWpP4NIJGu7QxjXJHskHeMAe56tNDwm+gU8dRDMlwSHLPg7Bg+MdFB+WOUaz48u+qk
	UaY7tX2fvS1Y+i9L3xYGTBFwhWUwKGL3524CpdDCCyX3UgSpax+q9IRuC94d2T8YkLCkGQqCF+baO
	yE1nqgO4pvrI7AHbr3dQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJJRd-0001XL-7u; Tue, 31 Mar 2020 16:08:53 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJJRY-0001W6-Mp; Tue, 31 Mar 2020 16:08:51 +0000
IronPort-SDR: 0aQTMnBCEL3ldYjkobLHFWIKIpn/JdOPUciXq5yPmbCCTgYP9Qqi5uwHNPKZexqtDgPYR1E2a2
 VEM7TwC6wAoA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2020 07:05:34 -0700
IronPort-SDR: Cp30xgv8jTSLPFdDeo8bM9c6hTeVSKfMYLRKjiO0I+Mb3yqaFRdAARW/g3DIYUXnMydxdxY86e
 lpk0AmZ7FrmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,327,1580803200"; d="scan'208";a="241921240"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga008.fm.intel.com with ESMTP; 31 Mar 2020 07:05:23 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andy.shevchenko@gmail.com>)
 id 1jJHW7-00EWBr-4E; Tue, 31 Mar 2020 17:05:23 +0300
Date: Tue, 31 Mar 2020 17:05:23 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH v7 03/10] lib: add linear ranges helpers
Message-ID: <20200331140523.GJ1922688@smile.fi.intel.com>
References: <cover.1585656143.git.matti.vaittinen@fi.rohmeurope.com>
 <c4cd52979ec187c942fa5794aab11e6c7f944cbb.1585656143.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c4cd52979ec187c942fa5794aab11e6c7f944cbb.1585656143.git.matti.vaittinen@fi.rohmeurope.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200331_090849_648031_E624F122 
X-CRM114-Status: GOOD (  26.72  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Milo Kim <milo.kim@ti.com>,
 Andrei Stefanescu <andrei.stefanescu@microchip.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree@vger.kernel.org,
 mikko.mutanen@fi.rohmeurope.com, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-samsung-soc@vger.kernel.org,
 linux-omap@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>, markus.laine@fi.rohmeurope.com,
 linux-arm-msm@vger.kernel.org, Borislav Petkov <bp@suse.de>,
 Petr Mladek <pmladek@suse.com>, Mikhail Zaslonko <zaslonko@linux.ibm.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Arnd Bergmann <arnd@arndb.de>,
 mazziesaccount@gmail.com, Gary Hook <Gary.Hook@amd.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Support Opensource <support.opensource@diasemi.com>,
 Sangbeom Kim <sbkim73@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, Sebastian Reichel <sre@kernel.org>,
 linux-kernel@vger.kernel.org, Tal Gilboa <talgi@mellanox.com>,
 Changbin Du <changbin.du@intel.com>, Mark Brown <broonie@kernel.org>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, patches@opensource.cirrus.com,
 Andrew Morton <akpm@linux-foundation.org>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Mar 31, 2020 at 03:23:03PM +0300, Matti Vaittinen wrote:
> Many devices have control registers which control some measurable
> property. Often a register contains control field so that change in
> this field causes linear change in the controlled property. It is not
> a rare case that user wants to give 'meaningful' control values and
> driver needs to convert them to register field values. Even more
> often user wants to 'see' the currently set value - again in
> meaningful units - and driver needs to convert the values it reads
> from register to these meaningful units. Examples of this include:
> 
> - regulators, voltage/current configurations
> - power, voltage/current configurations
> - clk(?) NCOs
> 
> and maybe others I can't think of right now.
> 
> Provide a linear_range helper which can do conversion from user value
> to register value 'selector'.
> 
> The idea here is stolen from regulator framework and patches refactoring
> the regulator helpers to use this are following.

...

> +/*
> + * linear_ranges.c -- helpers to map values in a linear range to range index

File name inside file can bring an unnecessary churn in the future in case we
would like to rename it (by some reason). So, better to remove.

> + *
> + * Original idea borrowed from regulator framework
> + *

> + * It might be useful if we could support also inversely proportional ranges?

Looks like remark that should not be here, rather in commit message or even in cover letter.

> + * Copyright 2020 ROHM Semiconductors
> + */

...

> +/**
> + * linear_range_get_value - fetch a value from given range

> + *

This blank line is not needed. Can we drop them everywhere?

> + * @r:		pointer to linear range where value is looked from
> + * @selector:	selector for which the value is searched
> + * @val:	address where found value is updated
> + *
> + * Search given ranges for value which matches given selector.
> + *
> + * Return: 0 on success, -EINVAL given selector is not found from any of the
> + * ranges.
> + */

...

> +int linear_range_get_selector_low(const struct linear_range *r,
> +				  unsigned int val, unsigned int *selector,
> +				  bool *found)
> +{
> +	*found = false;
> +
> +	if (r->min > val)
> +		return -EINVAL;
> +

> +	if (linear_range_get_max_value(r) >= val)
> +		*found = true;

As far as I can see this is a bit different from _high counterpart. So, if we
even not found the range we still check r->step. Can we make them symmetrical
(to some extend)?

> +	if (!r->step)

Why not positive conditional?

> +		*selector = r->min_sel;
> +	else
> +		*selector = (val - r->min) / r->step + r->min_sel;

> +	return 0;
> +}

...

> +int linear_range_get_selector_low_array(const struct linear_range *r,
> +					int ranges, unsigned int val,
> +					unsigned int *selector, bool *found)
> +{
> +	int i;
> +	int ret = -EINVAL;
> +
> +	for (i = 0; i < ranges; i++) {
> +		int tmpret;
> +
> +		tmpret = linear_range_get_selector_low(&r[i], val, selector,
> +						       found);
> +
> +		if (!tmpret)
> +			ret = 0;
> +
> +		if (*found)
> +			break;
> +	}
> +
> +	return ret;
> +}

Can we refactor this?

	int i;
	int ret = -EINVAL;

	for (i = 0; i < ranges; i++) {
		ret = linear_range_get_selector_low(&r[i], val, selector, found);
		if (*found)
			break;
	}

	return break;

This will unshadow the error code returned by the loop body.

Or if ranges is guaranteed to be always positive number, convert this to do {} while.

...

> +int linear_range_get_selector_high(const struct linear_range *r,
> +				   unsigned int val, unsigned int *selector,
> +				   bool *found)
> +{
> +	*found = false;
> +
> +	if (linear_range_get_max_value(r) < val)
> +		return -EINVAL;
> +

> +	if (r->min <= val) {
> +		*found = true;
> +	} else {
> +		*selector = r->min_sel;
> +		return 0;
> +	}

	if (r->min > val) {
		*selector = r->min_sel;
		return 0;
	}

	...see below...

> +	if (!r->step)

Positive conditional?

> +		*selector = r->max_sel;
> +	else
> +		*selector = DIV_ROUND_UP(val - r->min, r->step) + r->min_sel;


	*found = true;

> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
