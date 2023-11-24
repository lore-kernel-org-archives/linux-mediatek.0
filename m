Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE50C61D97
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Nov 2023 14:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MFiobEZOo4A0u/F86dMG9ab4xrJNlwqAHsW39HuCwvw=; b=HkfEaFnNeWqEkI0ND/cOKiegHS
	nFx6ZLWTLRSibHEBQtxDvsp8ncPYCCpBcX6k8Nxi6balvcW7LNZl9vb3yCAiuhVDPGWwccqE51Dff
	qlnwxSHu3xx+GST0JHs7J7Q9BcUBYeLccIYSrEBAJp/iHbxnr1NZtZg3UtYSh+CRCjipGy+RAxt2q
	e0WKnILCRkU47OMvjQxIpVsVklOpYmR4CuXIotoUMEmbO4yHyNZb0b3yMLD3+pwnh0pVNGGNMjpAB
	5r3KAFmeVzHrwo+7oTF+IISk6B3BfbgthWgAMN6RsJj816a8HepCtAkX8FyUFj8qmTB6uHocAgAhn
	EMni1XDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6XKb-007Qdv-1S;
	Fri, 24 Nov 2023 14:38:57 +0000
Received: from mgamail.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6XKY-007QcE-1p;
	Fri, 24 Nov 2023 14:38:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700836734; x=1732372734;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QKgJEGRCbdv2EWGbewfRTODn2GZOxw9ytLOYIn7uuOQ=;
  b=IguYC+jh2moX0zcjKySGoetZDR0kBvsLg0cGRawmBDLgbuebG0AdWOhn
   mIYGF8HuSlWbj7n96MhII32+ZrFrgMBG8rvjFphzF19+/kcm7rf2cKxSn
   t2LyuG7fBjweyV3WrM4gHLx4VtxBzY3S4hRpIjazH25XEIDWh5AgSlEQK
   wECp53OlwT+yxJ4jfzJnX/aqPL4oasun+gtYTROmW/PsJYgaLDNzgvaOE
   g/07/CLZ4/y2QwTOpbEyoHzrwX0/3hBEck5PqgL5U3t402g9bC8HhTTwH
   VeyRAM1gUaT7TKHiDk8eETFmhlSyGV7qkuxfE74Aj6NEr6tdK/87yvft9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="392198721"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="392198721"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 06:38:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="743906526"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="743906526"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 06:38:42 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r6XCh-0000000GjtS-2kli;
	Fri, 24 Nov 2023 16:30:47 +0200
Date: Fri, 24 Nov 2023 16:30:47 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	openbmc@lists.ozlabs.org, linux-mips@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	Sean Wang <sean.wang@kernel.org>
Subject: Re: [PATCH v2 06/21] pinctrl: equilibrium: Convert to use struct
 pingroup
Message-ID: <ZWCzl-EYXdymay4p@smile.fi.intel.com>
References: <20231123193355.3400852-7-andriy.shevchenko@linux.intel.com>
 <202311241401.ZPILPdov-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202311241401.ZPILPdov-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_063854_618940_781EEC90 
X-CRM114-Status: GOOD (  13.11  )
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

On Fri, Nov 24, 2023 at 09:19:45PM +0800, kernel test robot wrote:

...

> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202311241401.ZPILPdov-lkp@intel.com/
> 
> smatch warnings:
> drivers/pinctrl/pinctrl-equilibrium.c:719 eqbr_build_groups() warn: unsigned 'grp->npins' is never less than zero.

Thank you for the report!

...

>    718			grp->npins = of_property_count_u32_elems(np, "pins");
>  > 719			if (grp->npins < 0) {
>    720				dev_err(dev, "No pins in the group: %s\n", prop->name);
>    721				of_node_put(np);
>    722				return -EINVAL;
>    723			}

Surprisingly (to me) the _count_u32_elems() can return a negative error code...
Fine, I redo a bit the code by introducing a new patch that will use err instead
of ->npins (which sounds better approach anyway).

-- 
With Best Regards,
Andy Shevchenko



