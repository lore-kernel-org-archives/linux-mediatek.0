Return-Path: <SRS0=jJra=56=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 488F9C2BA19
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 09:33:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AE1F206D5
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 09:33:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bdonmYk9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AE1F206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GG+DX+Z4B/Gx832SBGy+rKEdYNdwvbk4R164l7TYen4=; b=bdonmYk9QCbYXi
	CN+EAKItO8SctHHXrCA2ilvhpqLZMqLk9Z3cYSIlnSLRpfQy3+fUQVKnWfw/gJ2ZkEYDLzuKxGQF3
	wSYQRB0LioEm2nw/27tg1yVhdUSAINYLjejNMk9cH3CDAfDrPsMHRb1ubloTaxf3MfwZ2Tn60bszJ
	8s5hdp/EXpso0bHXags1dWnP2JZ1kmpmiRS+qh4Gk6GytblTZAkrDohJEnJKxxj8z6OHcOQY6U87c
	l7wrOvYvizpotPXn5YSHsEyNq8eNoW+hPn2n4gMz85dv982dDdkLY+h0A6tLH+mNOkpdJ0tqU8f9l
	A7jYLLHkmbdzGIOxRw3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOHwJ-0007H6-VT; Tue, 14 Apr 2020 09:33:07 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOHw5-00075I-W8; Tue, 14 Apr 2020 09:32:55 +0000
IronPort-SDR: 9iphxwe5ziNw+96s2/Ou/5s7pMoPW2zaOa5u8ccVMuZwodckRdLK05cxMYqOyAie5Ad9LXsg0o
 C8NBv2zRwmEw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 02:32:53 -0700
IronPort-SDR: fyKEwlWyiTPTJtm86vivI8s1UqiyL3h8kvihRjOK1ggFZoj8r1fnBL3w0HGFMwKRwpaV+TKTsQ
 o6ACfjdp5Qaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,382,1580803200"; d="scan'208";a="277199554"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga004.fm.intel.com with ESMTP; 14 Apr 2020 02:32:42 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jOHvv-000UVe-PA; Tue, 14 Apr 2020 12:32:43 +0300
Date: Tue, 14 Apr 2020 12:32:43 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH v9 05/10] power: supply: bd70528: use linear ranges
Message-ID: <20200414093243.GI34613@smile.fi.intel.com>
References: <cover.1586849281.git.matti.vaittinen@fi.rohmeurope.com>
 <8dcf498134adb09d88bd16138cdce65e9ffa0bb6.1586849281.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8dcf498134adb09d88bd16138cdce65e9ffa0bb6.1586849281.git.matti.vaittinen@fi.rohmeurope.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_023254_069528_AA488B92 
X-CRM114-Status: GOOD (  14.64  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Andrei Stefanescu <andrei.stefanescu@microchip.com>,
 Heiko Stuebner <heiko@sntech.de>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Andreas Kemnade <andreas@kemnade.info>,
 "Angelo G. Del Regno" <kholk11@gmail.com>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
 Axel Lin <axel.lin@ingics.com>, Gregory CLEMENT <gregory.clement@bootlin.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Markus Reichl <m.reichl@fivetechno.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>, markus.laine@fi.rohmeurope.com,
 Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, devicetree@vger.kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, mazziesaccount@gmail.com,
 linux-arm-msm@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Support Opensource <support.opensource@diasemi.com>,
 Baolin Wang <baolin.wang@linaro.org>, Sangbeom Kim <sbkim73@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, Sebastian Reichel <sre@kernel.org>,
 linux-kernel@vger.kernel.org, mikko.mutanen@fi.rohmeurope.com,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 patches@opensource.cirrus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Apr 14, 2020 at 11:04:21AM +0300, Matti Vaittinen wrote:
> Change the bd70528 to use common linear_range code instead of
> implementing a copy of it in this driver.

Couple of nits below which you can take as TODO items for the future.
(Because maintainer is fine with it according to the tags)

...

>  config CHARGER_BD70528
>  	tristate "ROHM bd70528 charger driver"
>  	depends on MFD_ROHM_BD70528
> +	select LINEAR_RANGES

>  	default n

At some point you can remove this kind of defaults (see [1] for the details).

...

> +static const struct linear_range current_limit_ranges[] = {
>  	{
>  		.min = 5,
>  		.step = 1,
> -		.vals = 36,
> -		.low_sel = 0,

> +		.min_sel = 0,

Perhaps it's better to have it aligned with max_sel, i.e. be 0x00.
Same applies to the rest of a such.

> +		.max_sel = 0x22,
>  	},

...

> +static const struct linear_range warm_charge_curr[] = {
>  	{
>  		.min = 10,
>  		.step = 10,
> -		.vals = 20,
> -		.low_sel = 0,
> +		.min_sel = 0,
> +		.max_sel = 0x12

Perhaps leaving comma is a good thing to avoid potential churn in the future
(if any of fields will be added here). Same applies to the reset of a such.

>  	},

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
