Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD91C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Dec 2021 10:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6BHFYCMWpMzBup5WlP0sbC6sckbHWZ4PdFAgBmEUb5M=; b=XxDO87FbFEd5ie
	qupC7VA1GhT5X2XAZKu70SACz7y8t3oqYllBc/zkslMDCwYO6UVTEaVKZgNrbfdZCqLPZiZ67pBvb
	EhOoxfVKwLjhFDsprNEwtGpo0oRU/GiykphKLFcWFmQMJT+KChkMxHzgJfrR3pGSumD4MrvjHFiKk
	BN1vQazcDHCZ0bLHktF//cVARnb/ctHXLREoDleWSZhH28tyi/5jSmHXKgJFHb08tQd4XeJ+oncQX
	AaF1R0MTzckM/dHGGnXEZBqGPrVs9VHw5R6rNzwHIZrj/J1ADPrLXM5mmQPxWAg/mVMPx4HjqQJUE
	bPEtgRQrAKdgUss80SmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muY5A-008Ae9-HZ; Tue, 07 Dec 2021 10:52:24 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muXyZ-0087IQ-RK; Tue, 07 Dec 2021 10:45:37 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="323806580"
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; d="scan'208";a="323806580"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 02:44:21 -0800
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; d="scan'208";a="563425275"
Received: from smile.fi.intel.com ([10.237.72.184])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 02:44:11 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1muXwD-003B63-00; Tue, 07 Dec 2021 12:43:09 +0200
Date: Tue, 7 Dec 2021 12:43:08 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Baruch Siach <baruch@tkos.co.il>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Marc Zyngier <maz@kernel.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Chunyan Zhang <chunyan.zhang@unisoc.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Jianqun Xu <jay.xu@rock-chips.com>,
 Alexandru Ardelean <aardelean@deviqon.com>,
 Thierry Reding <treding@nvidia.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 bcm-kernel-feedback-list@broadcom.com,
 linux-power@fi.rohmeurope.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-pwm@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-unisoc@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-tegra@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>,
 Gregory Fong <gregory.0xf0@gmail.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Keerthy <j-keerthy@ti.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang7@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Vladimir Zapolskiy <vz@mleia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v1 1/3] gpio: Get rid of duplicate of_node assignment in
 the drivers
Message-ID: <Ya86vFcRJjM30xQ/@smile.fi.intel.com>
References: <20211202210839.79140-1-andriy.shevchenko@linux.intel.com>
 <20211207080325.6hfokrrcs45iucx6@pengutronix.de>
 <87ilw0on3z.fsf@tarshish>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87ilw0on3z.fsf@tarshish>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_024535_947322_72DFE93C 
X-CRM114-Status: GOOD (  11.47  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Dec 07, 2021 at 10:05:08AM +0200, Baruch Siach wrote:
> On Tue, Dec 07 2021, Uwe Kleine-K=F6nig wrote:
> > Hello Andy,
> >
> > you Cc: linux-pwm and the pwm maintainers in this series. I don't spot
> > anything pwm specific here (apart from touching gpio-mvebu which also
> > contains a PWM driver). Do I miss something?

Thanks for your eagle eye! For the record I don't do this list manually,
I used the get_maintainer.pl's heuristics [1]. Usually it gives me more
than 95% correct prediction, so I believe here is no smoke without flame
(and it seems what Baruch discovered as well).

> That's probably because of drivers/gpio/gpio-mvebu.c that appears in the
> MAINTAINERS PWM entry.

[1]: https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintainer.=
sh

-- =

With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
