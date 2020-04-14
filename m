Return-Path: <SRS0=jJra=56=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9876EC2BA19
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 09:35:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AB352076A
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 09:35:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="st5fuopP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AB352076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YQtOcAHf7yZ8GwWbH/io89rJTJkqcdej2E2rKeO+VAI=; b=st5fuopPHzD1i7
	TD0exnicHLIGWUEaDkEVBp8OEctQwJJfVVRQbYEBRH4wCJ2h2iSIY78odrcwru/WHi+DC7OKdfgXm
	8p1bfS8BUr7cB1i7FOnZ8SEbISM2MQ+3kEWWeLdey1h+pwZW3ACZP6dWenETxYB2PWthjmd5BYKO7
	TDll9dox/LOJCYCVvbKqYBsAH0fhrOFaW4BRMNiR3UVhztw5ovRJDlkftS6PVSc+7b3SffyjncNO8
	IfotIHGMzTTFoezvGf8Mp4oB5Vq2AMDwcWp5omlKgoNkr/0Vn+SI+gTIgI1DesWoXKX0LyqLTJScL
	OhABlMrTgCq+jcdmAu0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOHyh-0001rH-CZ; Tue, 14 Apr 2020 09:35:35 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOHyV-0001jz-Gp; Tue, 14 Apr 2020 09:35:28 +0000
IronPort-SDR: t6uILsKy17G7mkuQMd8k9FpX+K53DhKEsnZUEaOlvN/rg7uVduzCpOADY5qi+9oFysGNJsG91q
 7CNMFv0LGGgQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 02:35:22 -0700
IronPort-SDR: gZMXuRG+DwMXhibMHthYrh9eztu9ABAkZ8OokL5UVQ6tf6XqedvzMK1DckUlttKussD2p8SBql
 /TGa6XZ+NQVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,382,1580803200"; d="scan'208";a="253148521"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga003.jf.intel.com with ESMTP; 14 Apr 2020 02:35:12 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jOHyL-000UXS-Gw; Tue, 14 Apr 2020 12:35:13 +0300
Date: Tue, 14 Apr 2020 12:35:13 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH v9 05/10] power: supply: bd70528: use linear ranges
Message-ID: <20200414093513.GJ34613@smile.fi.intel.com>
References: <cover.1586849281.git.matti.vaittinen@fi.rohmeurope.com>
 <8dcf498134adb09d88bd16138cdce65e9ffa0bb6.1586849281.git.matti.vaittinen@fi.rohmeurope.com>
 <20200414093243.GI34613@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200414093243.GI34613@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_023523_571797_AA40F7C3 
X-CRM114-Status: GOOD (  16.73  )
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

On Tue, Apr 14, 2020 at 12:32:43PM +0300, Andy Shevchenko wrote:
> On Tue, Apr 14, 2020 at 11:04:21AM +0300, Matti Vaittinen wrote:
> > Change the bd70528 to use common linear_range code instead of
> > implementing a copy of it in this driver.
> 
> Couple of nits below which you can take as TODO items for the future.
> (Because maintainer is fine with it according to the tags)
> 
> ...
> 
> >  config CHARGER_BD70528
> >  	tristate "ROHM bd70528 charger driver"
> >  	depends on MFD_ROHM_BD70528
> > +	select LINEAR_RANGES
> 
> >  	default n
> 
> At some point you can remove this kind of defaults (see [1] for the details).

Missed reference

[1]: commit 0192f17529fa ("clean up x86 platform driver default values")

> ...
> 
> > +static const struct linear_range current_limit_ranges[] = {
> >  	{
> >  		.min = 5,
> >  		.step = 1,
> > -		.vals = 36,
> > -		.low_sel = 0,
> 
> > +		.min_sel = 0,
> 
> Perhaps it's better to have it aligned with max_sel, i.e. be 0x00.
> Same applies to the rest of a such.
> 
> > +		.max_sel = 0x22,
> >  	},
> 
> ...
> 
> > +static const struct linear_range warm_charge_curr[] = {
> >  	{
> >  		.min = 10,
> >  		.step = 10,
> > -		.vals = 20,
> > -		.low_sel = 0,
> > +		.min_sel = 0,
> > +		.max_sel = 0x12
> 
> Perhaps leaving comma is a good thing to avoid potential churn in the future
> (if any of fields will be added here). Same applies to the reset of a such.
> 
> >  	},
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
