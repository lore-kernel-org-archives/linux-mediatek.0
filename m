Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D13F1C4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 13:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=StM4NRAGukWrAj75FfKQXfjn0giOLHSN+P1vvfYXpwo=; b=H6Dt3UPyI1Aq3NRYHuCMEJk8rv
	cQJmw6/EoaItZ/d8pfiooS8IS2O+F8s2NlypGaEr2he9DAHlBZAX2XJr6dJAl+e1HWMwb5EVDqukV
	La8Z0uGmEBpDl+zwOT8SJ0VG4541WXArqm87dSF4pzDl65eWurL/ohinpxBk9ZWY0IJ3F0uG06Jbl
	U+i1+P8y5YXe4o5N6x/lchMiYG6nKoOKMHTNtS4hOQ7yJLHVJL+2Pfl+cH+/5knd32Py1Q1YDVwdT
	xqFs587bsvHkHrFsk3zk9chWaBJ9DD5X/uc4oi2k3HaJyHp+FOXFAraAWV0NFQPLoMINsRPUw71/9
	HOHIslvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8KpT-008UzU-2h;
	Wed, 29 Nov 2023 13:42:15 +0000
Received: from mgamail.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8KpP-008Uxg-39;
	Wed, 29 Nov 2023 13:42:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701265331; x=1732801331;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=hzAuAJ5s5oCGg7D9BAY5Ac1RZ/MBIy/fgOAKR6StNrI=;
  b=DoODJ+4R4ro4D+lV5RwyqW3o1c37eW6W6lJ84LqQIfdiNf75WTfu2X7X
   o5rvoHEdh+KzFfBcKb1XPoV0BEg4ldAq2Kxs9VY5MUaf3lw91H7QOnz67
   QkFxyzVfxb4n+WoM0sPNFeepRrwC7E4ghO0QGMIdQlVofQwy+fxZ78P/t
   rLzU/Xpo8krZyHf+dVIowgUtLICvy5PcwIAIjdLs13vvQm6CxxEt58Adt
   Aa/COKXgT1uLPVooSn4pgYlewsZ6HPJQ5MUmnGHXOugICVIIzjH8DYvSt
   40gEfYk+e8pEgxbpt/0h0LBmG+ailRnGtMhjqvmK7JO3+hpqpWncm1mwq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="378193864"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="378193864"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 05:42:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="912858646"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="912858646"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 05:42:00 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r8Kp9-00000000S0e-49ct;
	Wed, 29 Nov 2023 15:41:55 +0200
Date: Wed, 29 Nov 2023 15:41:55 +0200
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
Message-ID: <ZWc_o4Dcsb0v5TGB@smile.fi.intel.com>
References: <20231128200155.438722-1-andriy.shevchenko@linux.intel.com>
 <20231128200155.438722-7-andriy.shevchenko@linux.intel.com>
 <CAMuHMdWt0qq-Umd8udb7fxpNVZ=X9O9eZGMVGFSGRO_d9UkgNw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWt0qq-Umd8udb7fxpNVZ=X9O9eZGMVGFSGRO_d9UkgNw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_054212_055925_5DBE97A6 
X-CRM114-Status: GOOD (  17.11  )
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

On Wed, Nov 29, 2023 at 12:21:45PM +0100, Geert Uytterhoeven wrote:
> On Tue, Nov 28, 2023 at 9:04 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > It's unclear why it's not a const from day 1. Make the pins member
> > const in struct group_desc. Update necessary APIs.

...

> >  int pinctrl_generic_add_group(struct pinctrl_dev *pctldev, const char *name,
> > -                             int *gpins, int ngpins, void *data);
> > +                             const int *pins, int num_pins, void *data);
> >
> >  int pinctrl_generic_remove_group(struct pinctrl_dev *pctldev,
> >                                  unsigned int group_selector);
> 
> Probably this is also the right moment to change all of these to arrays
> of unsigned ints?  Else you will have mixed int/unsigned int after
> "[PATCH v3 13/22] pinctrl: core: Embed struct pingroup into struct
> group_desc", and purely unsigned int after "[PATCH v3 22/22] pinctrl:
> core: Remove unused members from struct group_desc".

Hmm... Can it be done later?

I can, of course try to change the parameter here to be unsigned, but it most
likely fail the build for those drivers means need more patches, more delay to
this series.

Linus?

-- 
With Best Regards,
Andy Shevchenko



