Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978ACC4167B
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Nov 2023 16:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DZ7QdccnQw5sPQbxsMwqYG+ywENUvna9Q64PnIbTnR0=; b=OW4yY8UrIqCoFrhVZwRhJUR83s
	+lUaD/O68d5TUv7au/KdMYxsadO77KIQ6E4wq3p9Oa5j4Ssyece6e/WTlgl+vt4ekSFjiXdOCxspF
	38sGs7QGqtFSbveJnAwMLwWPL3U3f+HPY/1lVu8TZapwohqL9SqxynqYlC07glfNhtdDIZO3h27Vn
	ja4zYVjHyJr4I6Mm1keIhexVt81/HqA6Jv+mNHHD9LKnTUQT8b7MEvjh2QjxHbr0CRYchmNlYwMlI
	Hxd0UFZT3w7hzJg3ieN7PsbAam/1i4I/yKws6W26053GdzoKUU8nkeKF0ixYHtwK8W6o9jR82ZVyF
	ncqgE+Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8kE2-00BOZu-15;
	Thu, 30 Nov 2023 16:49:18 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8kDy-00BOWu-0w;
	Thu, 30 Nov 2023 16:49:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701362954; x=1732898954;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=HXAZKQLZl/DnOU4OtJdFiiHQn7NurI3k3IMwWiBmDag=;
  b=Ub+srs294MHlnBKI+jl4EfpFAZHowvAsJfobPGGQMulmUPfhiHaiXHGG
   UW+sA+ILFpg/0gLI2Kp8hmY+A0W6DKEPoUSAnoBuEoxOkButeMfetybLy
   XjDrxr1yd295ETM+dQGOrwL/+CNUnsjFY/Iqg1gI21Q7XEQcbYUum72K8
   cmmFIkZD69y3kszw4I6R1mUpgYWLqRcdKf+SXgw+O6owVI24svCsStLmW
   NzUHxTrV97IvfeB6lax+5K8ljVfwrAdQ76gyQxiYxXnMTXJCkblu5dCB3
   E0x/JGBFCqM+ZvClRogeb4JEMUO3iZfrU8LVWtJ8mZ7iofCi0NeSncMuU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="12064110"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="12064110"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 08:49:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="745706056"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="745706056"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 08:49:01 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r8kDh-00000000kYA-2Q4s;
	Thu, 30 Nov 2023 18:48:57 +0200
Date: Thu, 30 Nov 2023 18:48:57 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Fabio Estevam <festevam@gmail.com>,
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
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
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
	Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v4 16/23] pinctrl: imx: Convert to use grp member
Message-ID: <ZWi8-a_4bdSUBqaV@smile.fi.intel.com>
References: <20231129161459.1002323-1-andriy.shevchenko@linux.intel.com>
 <20231129161459.1002323-17-andriy.shevchenko@linux.intel.com>
 <CAOMZO5CZpQjWKimNReUkwHOc-mF8vWoq2HDhjGKSu6E3g5-aVw@mail.gmail.com>
 <ZWduPKmBWkaIdLhi@smile.fi.intel.com>
 <CAOMZO5C_dhvx70nk1HOSZdw8hMMmED69tdsXgydXdpnxHTJ58Q@mail.gmail.com>
 <ZWdyOc3pCoNihDtD@smile.fi.intel.com>
 <CACRpkdap2fe-L0v7ttQULGq7d_zVCb2MmD4w=hHxKacKZH8jng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdap2fe-L0v7ttQULGq7d_zVCb2MmD4w=hHxKacKZH8jng@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_084914_379505_2C4FA60F 
X-CRM114-Status: GOOD (  20.16  )
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

On Wed, Nov 29, 2023 at 10:41:14PM +0100, Linus Walleij wrote:
> On Wed, Nov 29, 2023 at 6:18 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Wed, Nov 29, 2023 at 02:08:38PM -0300, Fabio Estevam wrote:
> > > On Wed, Nov 29, 2023 at 2:01 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > >
> > > > It's explained in the first paragraph in the cover letter. Do you
> > > > want to copy this into each commit message?
> > >
> > > Yes, much better to have the information into each commit message.
> >
> > Here it would be like
> > "Because other members will be removed to avoid duplication and
> > desynchronisation of the generic pin group description."
> >
> > Linus, what do you think about this?
> 
> I can just add that to each commit while applying if it makes everyone happy.

I'm pretty much fine, but I dunno if you are using `b4 shazam -H ...` I found
that very cool feature.

> No need to resend for that.

Yeah, we may utilise `git msg-filter ...` to fulfill the job (for curious one,
it can be run even if we are in the middle of `git rebase --interactive ...`).

-- 
With Best Regards,
Andy Shevchenko



