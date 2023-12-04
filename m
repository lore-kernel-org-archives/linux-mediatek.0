Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76928C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 13:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t4hIshg370EMkP+Wl/yAc3thZGkKJzrbGIN2eaL3WpQ=; b=bXAaLKRp5b/xQg2c9UKjzxKeCK
	BiQkO/oGMWoVJMZ12lVw0tehmemHGEbM3E9Y4k0Tm40XKnESINHc/kJDmHKpIOKQDLL0+lZEA1lGY
	NLHX/7E/q9IgBlRKE7IcJgQmjgcbbDZPtgiaHdN3nnx7cTTnMTSQ1UFyZ+pziiG/ErzgGyL4CA+gE
	JMiQzoD2tdZYfPGH34+dhzcjCm4FaB/uvWp0so+kGDY8sfKSJ/bfSuT3JALUM8BGRHF2tIt3YT9Jh
	AV768JSm7X3noojuzTJol7Bba4rXXZHETzhSj8ioSmkks68aDZt3yToubBR6IlczUeCO+nMRAdWA8
	fKCce+Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA8iP-004QYY-18;
	Mon, 04 Dec 2023 13:10:25 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA8iM-004QVG-0b;
	Mon, 04 Dec 2023 13:10:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701695422; x=1733231422;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JAdlnvXuynUxhOXk0fIFpQJujwMXMqGdAOOSeNyz0/8=;
  b=MKSINYOYymvPixK6+gdLv9TG+PqMupsMW/+zdZnMLsSdx7u+pplBdW3x
   ryqSzaXh8kJ48P/33VZ/FDMho4o+9PLe5s1IsUra0Qo7Kp9FWaVc8WNu9
   l6c0EfWpNA4mFBQkEPKrg9SA19qYQwbM0piiGWKT7lvG7FC/nV8mLaK8p
   9wk2sZPPKLRByBjONpPM5RsXVvNd0PE9o95yHz+q/iWdII2XX9DUooZ4A
   URR1soddIi8OxnxaWkSgyS4Qe7qF0Lp5faGS2enQ4TuQg+6p8dkhkRxaj
   FCmPLZgY+xfzTOC5ZEL80McoX3hHF7KRq5A1rVB4NaixkgO7ZN+qywcq5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="793436"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="793436"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 05:10:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="841040937"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="841040937"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 05:10:10 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rA8i5-00000001kt9-3IFH;
	Mon, 04 Dec 2023 15:10:05 +0200
Date: Mon, 4 Dec 2023 15:10:05 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	openbmc@lists.ozlabs.org, linux-mips@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	Sean Wang <sean.wang@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v4 12/23] pinctrl: mediatek: Make use of
 PINCTRL_GROUP_DESC()
Message-ID: <ZW3PrSQWyZvvhN66@smile.fi.intel.com>
References: <20231129161459.1002323-1-andriy.shevchenko@linux.intel.com>
 <20231129161459.1002323-13-andriy.shevchenko@linux.intel.com>
 <CGME20231204114039eucas1p29c6f8a162191e58ff658d3a1c44429bf@eucas1p2.samsung.com>
 <9e4e65de-7234-4234-8091-796277a1f1c5@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e4e65de-7234-4234-8091-796277a1f1c5@samsung.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_051022_237774_2A4A4FFC 
X-CRM114-Status: GOOD (  12.04  )
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

On Mon, Dec 04, 2023 at 12:40:38PM +0100, Marek Szyprowski wrote:
> On 29.11.2023 17:06, Andy Shevchenko wrote:
> > Make use of PINCTRL_GROUP_DESC() instead of open coding it.

> PINCTRL_GROUP_DESC() macro from drivers/pinctrl/core.h contains a cast
> to (struct group_desc), what breaks users of the above macros.

There is no cast (*).
Thanks for report, I will check.

But this was v4 of the series and LKP actually sent a positive feedback.
Besides that I have tested this locally with modules enabled.

*) It's a compound literal, _not_ a cast.
   Taking above into consideration I'm wondering what compilers
   are in use?

-- 
With Best Regards,
Andy Shevchenko



