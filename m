Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76C7C10DCE
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 16:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OsU/uFt7WDOHMzzAMlb/J/ZcVXpHjZ9dfvzsw5GYCsM=; b=VWRN1ZcsD20foZfMLf2dMDoeUZ
	LSW3iAT3YFdT9aBOnkz9oZ1KkaH/7LFZ8XzYxIpPt4wrqzVViS3OIKpd6Ll0gVzVZtAGqZZuphz+/
	RXVTqorR8995Ed0Gsn310Un99upwchPzkJ7hQwxtp4ib5pPqHRPE0V70WCzp+S9Wb9lahUfoPxfRW
	qzjEMIn8rg3hDf9iWjVrgMOgJMVFIbz3tQbtC0gVOGd4sc3jMEdmBuBgR1R3asUwn+H5oRHux56+h
	L1k8FeGPFvRzLR6zTjtryNzslBxhTUZEsenMuK07t2Vt4J4Js3RFDVg4A2Qs4yR8LWrqa64Mwo90V
	YOLfR3Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rABP5-0052Tg-2i;
	Mon, 04 Dec 2023 16:02:39 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rABP2-0052SY-0A;
	Mon, 04 Dec 2023 16:02:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701705756; x=1733241756;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=XNcK+nowG13Y865Fjff3FDTvFJmZG2WRC888K2sx/o0=;
  b=ltQ4D38h8jwNXqAMVcMr9BQcYUc8fA4XMXzYKoYYWE9eb119decIE1rZ
   t0a2E2Q2jH88VaysGN6nLBwqIyJiMNoJo15mDXTzNmE2MQssJTNdDnZb3
   tIQnwH81EzqGm9tlLwWxZWUleGdd2Ke2cmpLh0L31e2HSLuvQJ9Zf2Cu+
   fucOYB3mmcQdorcboCOZeEmfdieSV1GLz4KJL0BKe9y/oHngMQFvb4pxY
   0vvqqfsb+g9ORTczq06BCZqxgQQ2QmxZ1OfBQz9mbzbaLvt/0S2n6cNBn
   7KPmRwwce3zVxZgazeTD4gIS9Rdq5lRcGtHX0Yot0gxsHHg3bUCva4oiA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="631788"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="631788"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 08:02:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="861419788"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="861419788"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 08:02:24 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rABOl-00000001nOJ-2TZj;
	Mon, 04 Dec 2023 18:02:19 +0200
Date: Mon, 4 Dec 2023 18:02:19 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
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
	Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v4 12/23] pinctrl: mediatek: Make use of
 PINCTRL_GROUP_DESC()
Message-ID: <ZW34C47rt80Ng8SA@smile.fi.intel.com>
References: <20231129161459.1002323-1-andriy.shevchenko@linux.intel.com>
 <20231129161459.1002323-13-andriy.shevchenko@linux.intel.com>
 <CGME20231204114039eucas1p29c6f8a162191e58ff658d3a1c44429bf@eucas1p2.samsung.com>
 <9e4e65de-7234-4234-8091-796277a1f1c5@samsung.com>
 <ZW3PrSQWyZvvhN66@smile.fi.intel.com>
 <CAMuHMdU-E7jemjAS0EunWFPq1LfF9vcNE+50ah4WH9oD1TXYew@mail.gmail.com>
 <ZW3U5-LBqWiyxB6-@smile.fi.intel.com>
 <CAMuHMdVz=dLaBt-Td0UdOOs79ju7UfX_2vUcy8Kdeo9aSP+edw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdVz=dLaBt-Td0UdOOs79ju7UfX_2vUcy8Kdeo9aSP+edw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_080236_611177_A0DC3808 
X-CRM114-Status: GOOD (  23.59  )
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

On Mon, Dec 04, 2023 at 02:39:37PM +0100, Geert Uytterhoeven wrote:
> On Mon, Dec 4, 2023 at 2:32 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Dec 04, 2023 at 02:19:10PM +0100, Geert Uytterhoeven wrote:
> > > On Mon, Dec 4, 2023 at 2:10 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Mon, Dec 04, 2023 at 12:40:38PM +0100, Marek Szyprowski wrote:
> > > > > On 29.11.2023 17:06, Andy Shevchenko wrote:
> > > > > > Make use of PINCTRL_GROUP_DESC() instead of open coding it.
> > > >
> > > > > PINCTRL_GROUP_DESC() macro from drivers/pinctrl/core.h contains a cast
> > > > > to (struct group_desc), what breaks users of the above macros.
> > > >
> > > > There is no cast (*).
> > > > Thanks for report, I will check.
> > > >
> > > > But this was v4 of the series and LKP actually sent a positive feedback.
> > > > Besides that I have tested this locally with modules enabled.
> > > >
> > > > *) It's a compound literal, _not_ a cast.
> > > >    Taking above into consideration I'm wondering what compilers
> > > >    are in use?
> > >
> > > kisskb reported the following m68k failures to me:
> > >     linux-next/m68k-allmodconfig/m68k-gcc8
> > >     linux-next/m68k-allmodconfig/m68k-gcc11
> > >     linux-next/m68k-allmodconfig/m68k-gcc12
> > >
> > > However, according to [1], linux-next/m68k-allmodconfig/m68k-gcc13
> > > did succeed, so I guess you are using gcc13?
> >
> > Yes, I compiled with these:
> >
> > $ gcc --version
> > gcc (Debian 13.2.0-5) 13.2.0
> 
> Time to install and try an older version ;-)

Yeah, compound literals seems the often-to-break topic (as per GCC bugzilla).
Tried with GCC 8 for ARM64 and indeed it doesn't build it well.

-- 
With Best Regards,
Andy Shevchenko



