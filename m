Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50AB3C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Nov 2023 15:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M+KTsF68zStTv8jLRkA6fJ62RAp8TQTjSZ+ppGRSPdg=; b=1INYbIqSAMMlHoqtVM+j1mdSED
	0Gcb5hk6qnSzDLhQ0i53P1kIGNmwg7gkgT99zZy0y7jHcE0nuXZ1x9Byz38Shj8BS2rZxhCvsT5u2
	zytsdzySPNtCVEvcVRoXiDX/YTJhZtrNpf+vZzsBipmIpNub2yoPZUNt3EIeckZdlMNicBvO5TbSr
	RIJ7yiaYP4j0PutHYo+/O3nui2RxDGRqocNBd94qVMVxc9We8ucO8vig9wIZD5S4j9bL8gs/RnOCh
	rnoH2S70+z+3Ej/4e8cAjDh+ZdVoPch1taSkVM8MPsOjj2XNKMUvP4pvdolwmR2D4tU3frF3m1qFu
	20lLG/jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r80US-005klD-13;
	Tue, 28 Nov 2023 15:59:12 +0000
Received: from mgamail.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r80UO-005kkG-2q;
	Tue, 28 Nov 2023 15:59:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701187148; x=1732723148;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aFGhnhLBctAxdXmqRzubiIeJfbC6+H1rRvtasuLMDp8=;
  b=DrhYSE/soZ5ubqOA0PR68IfInTmU2Vg+oNe0DeshOOMgDHc/4RT7tVb8
   udvgyAuV02JuimyIUQaygpum2BItI0Gvfby+oQWTjgPyJ/36+fPQ9Syx+
   F1Q8Z0a8gmaTGKEcWBaS40sg+L53Gsh+7am11LoBRnLYCm9Pemb0GSOQz
   TRtkkdfS8U/NH8sn7B99nE2ZzeIxeJQAeXw10/QS2VJuT/Rm6DdVyoWbo
   6DjGJPJirJoeWe11io113Df4x+boGRuMi/fNrdZsLAoL9uvn7sZYAHHgt
   BFH3UJ8wOAyV0osn8Hil8wZRseLpCOIzFhaYHEGsxRAWoN9krQxie6pIH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="372324485"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="372324485"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 07:59:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="802984915"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="802984915"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 07:58:53 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r80U5-00000000Cdt-1MWE;
	Tue, 28 Nov 2023 17:58:49 +0200
Date: Tue, 28 Nov 2023 17:58:49 +0200
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
Subject: Re: [PATCH v2 12/21] pinctrl: core: Embed struct pingroup into
 struct group_desc
Message-ID: <ZWYOOW0KojJSTROj@smile.fi.intel.com>
References: <20231123193355.3400852-13-andriy.shevchenko@linux.intel.com>
 <202311250448.uz5Yom3N-lkp@intel.com>
 <ZWYM8Pjl-S-8CMPu@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZWYM8Pjl-S-8CMPu@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_075908_950532_4A5A7023 
X-CRM114-Status: GOOD (  14.90  )
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

On Tue, Nov 28, 2023 at 05:53:21PM +0200, Andy Shevchenko wrote:
> On Sat, Nov 25, 2023 at 07:39:02AM +0800, kernel test robot wrote:
> > Hi Andy,
> > 
> > kernel test robot noticed the following build errors:
> 
> > [also build test ERROR on linusw-pinctrl/for-next next-20231124]
> 
> Hmm... I have compiled tested on Linux Next it several times, I can't reproduce
> this neither with GCC nor with LLVM.

Actually it rings a bell that some versions of GCC have a bug (?) that they may
not identify initializations like this to be converted to constants as we are
using compound literal it should make no difference.

-- 
With Best Regards,
Andy Shevchenko



