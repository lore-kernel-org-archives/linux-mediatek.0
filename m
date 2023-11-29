Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 073BCC4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 14:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SVp6pkMGTcWDJYA6WG0Zd2pBi09UmOcSQNSboQ77doI=; b=wB3wA5yLXKVmFtLjHPdWmdpWbn
	k71FAZc/Ig/g5nkZ9lTl+/KDNLUKRx6K737ygVlgPb7/IKG98YPZbNN+d5l4JfwrO4HrjFsrnPMwg
	x2bfl7tsNn8XrkgOoH/FhdVqHAlKLJTLIeGjtV24QFH+d144eLTxdLxGI34f4r3AbteiJ0iVVMUrQ
	3CVOvi6FyPlcfGpGOOun4qFZ4RMbbx3J82ihUOKr+Mul3KQ+c5Jd/9eOzv5xkS6+Jm5ZmgtSw2dtg
	ZTYCqNMmzL4U34kGpwcAdCA9OvpcT2TBu+TSIOTOMt5vwp0c9YEcowDmFjb7TPvJC/NPIWnBMjbxf
	pFRBiaCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8LTR-008bwg-2K;
	Wed, 29 Nov 2023 14:23:33 +0000
Received: from mgamail.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8LTO-008bvm-0W;
	Wed, 29 Nov 2023 14:23:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701267810; x=1732803810;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=i+nKxtVOoA7/2O3dUI5Zs5QSN68782gToG5E1Dn3b/0=;
  b=NKlgBG7NNbbMi8E1a/sRRnUKC/tebus2Fw3U0r6atMM95B151GKHMHeY
   HxTRf4Utk9WRx4wHjltBoesvNBAfrqnUjb7P9oYqzetSTtDAU9hqBHnCk
   6qjicNBL9sxNYEsoqfTSgvjzeHNplPkhhn8lA6Xc6wSmP5RSy+0ufAAVW
   aWg8yJsVjg+Td9YFXmKRpAB0/e39ikedktkTMhiHZLE/gsVrNvt7GcOYi
   L7lZU2nXyTVQGAs2Dt1M6EPxt7D5GtUzOYJNGgfwUhKqR8m7maqghR3bW
   dpnnBKmV121W8b8J1qjjyqg2YQKceYYn4JvMX0cKeq7oLaoLslNBbYP6y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="424313719"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="424313719"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 06:23:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="1100543308"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="1100543308"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 06:23:17 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r8LT7-00000000SaA-0d82;
	Wed, 29 Nov 2023 16:23:13 +0200
Date: Wed, 29 Nov 2023 16:23:12 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
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
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v3 06/22] pinctrl: core: Make pins const in struct
 group_desc
Message-ID: <ZWdJUBNMYj9qvCf2@smile.fi.intel.com>
References: <20231128200155.438722-1-andriy.shevchenko@linux.intel.com>
 <20231128200155.438722-7-andriy.shevchenko@linux.intel.com>
 <CAMuHMdWt0qq-Umd8udb7fxpNVZ=X9O9eZGMVGFSGRO_d9UkgNw@mail.gmail.com>
 <ZWc_o4Dcsb0v5TGB@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZWc_o4Dcsb0v5TGB@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_062330_264787_0F7688DB 
X-CRM114-Status: GOOD (  21.02  )
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

On Wed, Nov 29, 2023 at 03:41:55PM +0200, Andy Shevchenko wrote:
> On Wed, Nov 29, 2023 at 12:21:45PM +0100, Geert Uytterhoeven wrote:
> > On Tue, Nov 28, 2023 at 9:04 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > It's unclear why it's not a const from day 1. Make the pins member
> > > const in struct group_desc. Update necessary APIs.

...

> > >  int pinctrl_generic_add_group(struct pinctrl_dev *pctldev, const char *name,
> > > -                             int *gpins, int ngpins, void *data);
> > > +                             const int *pins, int num_pins, void *data);
> > >
> > >  int pinctrl_generic_remove_group(struct pinctrl_dev *pctldev,
> > >                                  unsigned int group_selector);
> > 
> > Probably this is also the right moment to change all of these to arrays
> > of unsigned ints?  Else you will have mixed int/unsigned int after
> > "[PATCH v3 13/22] pinctrl: core: Embed struct pingroup into struct
> > group_desc", and purely unsigned int after "[PATCH v3 22/22] pinctrl:
> > core: Remove unused members from struct group_desc".
> 
> Hmm... Can it be done later?
> 
> I can, of course try to change the parameter here to be unsigned, but it most
> likely fail the build for those drivers means need more patches, more delay to
> this series.
> 
> Linus?

On the first glance updating API here does not fail the build.
Lemme incorporate this into v4.

Meanwhile the drivers I left untouched, it might be separate changes
to convert from int to const unsigned int.

-- 
With Best Regards,
Andy Shevchenko



