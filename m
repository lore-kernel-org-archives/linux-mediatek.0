Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB56EC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Dec 2023 13:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+E3FK9K6D9I80PFenCFSYlv8CkiS4+4UDO7OezsD+hQ=; b=JSMosw0aPbJv0HcUM9os5NmppH
	6tBYefva0K/cp4m7GxTX5F+YqOCljXoKO5ZcvMxTFVpbSxZUzNnZM/D0tIl+m9eo0nmoE+llf4jGt
	/ORtY7OhbOCqYL0Wheb+nJxGJbuj0zWYHMves5U0MRitEKPo5HZGc+3K/xHomNagAN+wwuh10NVyk
	RS/XjWpV2HG6JC3/JoN4wevCjElgmwuy5ETrU0Lka0jdP6XWynPgmLjdN2Wej/tEir1XZ0ARvD2hL
	KjYdIZ5O/NwLEQzWl8XuTTQGZzy7Lu3e5MGhgSKRjxtuAPiBIfvndbD2BrpfjgctnjX0/WCMW8oRO
	MeUHIluQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDPBm-00EmUT-2T;
	Wed, 13 Dec 2023 13:22:14 +0000
Received: from mgamail.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDPBj-00EmSy-2u;
	Wed, 13 Dec 2023 13:22:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702473731; x=1734009731;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=aynrVvDsgLEQ+oNpXkj3YsTsnJctWZHApJV8F3owo30=;
  b=SzNEbkSAeMETT1ygxQsJFoiqboJb/f9hyAPGm7msIlJbyCk4o/x0i8NR
   yxTHJczLLMNNrNUZaq3dwk0u/Qs/zHOT5kZDMGuwBSRb6TMVyjBUflOXB
   Q/B/co4rf5+J50f50F7LvxyoJn9aQyajF1i/WXtXQuvvX6j/uGyNzPXGp
   Yh2KeSr/ffBfepEOvnr8MRJ6oZP7+BemGb++j0c8Nh5l8q51Jxn0NY3to
   fqlGj1asOF5RPnCiSqPBv9deRA4xfO2uxq8x7suMjAghonv6OhqxYgM+9
   msYAS5DRrFZi5ppmArLCbMbejyAzmmkDUIenJhEz2NHXzjD1Z3EQwTr4b
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="398804949"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="398804949"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 05:22:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="864625953"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="864625953"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 05:21:59 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rDPBT-00000005X7P-2zJE;
	Wed, 13 Dec 2023 15:21:55 +0200
Date: Wed, 13 Dec 2023 15:21:55 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	Sean Wang <sean.wang@kernel.org>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v5 03/13] pinctrl: ingenic: Use C99 initializers in
 PINCTRL_PIN_GROUP()
Message-ID: <ZXmv81bJRMqB1GLY@smile.fi.intel.com>
References: <20231211190321.307330-1-andriy.shevchenko@linux.intel.com>
 <20231211190321.307330-4-andriy.shevchenko@linux.intel.com>
 <fb29c3bca8d245e3f7496539b7293aa4fc4bccd0.camel@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fb29c3bca8d245e3f7496539b7293aa4fc4bccd0.camel@crapouillou.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_052212_005391_406215FF 
X-CRM114-Status: GOOD (  12.08  )
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

On Wed, Dec 13, 2023 at 10:55:46AM +0100, Paul Cercueil wrote:
> Le lundi 11 décembre 2023 à 20:57 +0200, Andy Shevchenko a écrit :

...

> > -#define INGENIC_PIN_GROUP(name, id, func)		\
> > -	INGENIC_PIN_GROUP_FUNCS(name, id, (void *)(func))
> > +#define INGENIC_PIN_GROUP(_name_, id,
> > func)						\
> > +	{							
> > 			\
> > +		.name =
> > _name_,								\
> > +		.pins =
> > id##_pins,							\
> > +		.num_pins =
> > ARRAY_SIZE(id##_pins),					\
> > +		.data = (void
> > *)func,							\
> > +	}
> 
> This INGENIC_PIN_GROUP() macro doesn't need to be modified, does it?

We can go either way. I prefer to go this way as it reduces level of
indirections in the macros. It makes code easier to read and understand.
But if you insist, I can drop that change in next version.

-- 
With Best Regards,
Andy Shevchenko



