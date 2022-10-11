Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E17C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Oct 2022 13:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2O/sgWaGnO6z4AF/yeVmsjYkOvAsF7Wd+OoPbVTejeU=; b=L5lcIgQTSkV87m1eN3O1FGgSbp
	xLPRS6w1HBF00TwKt2Isd7u9z3G2LK62ivYAXCfDhtXbsFgJqh1VluO7oDdO1ayplaxObDwfa/n5u
	rB+QbJQ59gEtpPJS88DeJ3TRc4BF62tMwOPRzv9aGi19S2jrwrCOqlmnqcy7H1rTfTPm8qS9JTnY9
	2HyhnyqTxWzKt9bZem/2rGt9kmnxB13MuwojdjAYn9t0MquD9CqbbUnMRMuuhvHwHaeZooU+i+CU5
	+RIJU1urtTv1Tpr2YuScDM36ehcb1lfSL1Wh1OAzWppTfY5jT+QGqzEOnpmnW+XZAjrFAs4RozC2z
	GjY5nSag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiFcf-004NYz-N1; Tue, 11 Oct 2022 13:48:41 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiFcU-004NVh-Bu; Tue, 11 Oct 2022 13:48:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665496110; x=1697032110;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QHbuyb2S/uUcVxyF/lwXUqAZuHdBPKm0sW+WbMyb3sc=;
  b=kcYHEuF0lPchWf+CyUX21Qws7Ir1cV28A+WeEljB1UQITpbJqIJ/K+7k
   MoOb+BDQaIJPxIp5ixjVbBpyutum/mc5p09sCz7q3HpQmu3bkULLGaKmm
   lmCELsvmSUPN1+sUC73InBq7GPwwQZUlqdDCHS70lXwmctaXknf5rlb3f
   2ioX98/2X+xzmajAYoeE7LYpHDHWGX1m17Dk35Mg+wmEYTUILxfv9HUR1
   qUu0Lq+NTyK+L4Tz7Cen7N7JKtaQINfJdKTt+/XbyfC2cWiOdfTSkzd6g
   rfIH0BGPXeSZRlomCiuBlWMhNEI+mXXR0qjJouYofgCoiAzS0xi58oyDy
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="303244168"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; 
   d="scan'208";a="303244168"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2022 06:48:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="695068698"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; 
   d="scan'208";a="695068698"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 11 Oct 2022 06:48:19 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1oiFcH-005KIR-1Z;
	Tue, 11 Oct 2022 16:48:17 +0300
Date: Tue, 11 Oct 2022 16:48:17 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-actions@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 02/36] gpiolib: cdev: Add missed header(s)
Message-ID: <Y0V0IXF3sASTGdMU@smile.fi.intel.com>
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-3-andriy.shevchenko@linux.intel.com>
 <Y0SyVwjDl7NGfTPn@sol>
 <CAHp75Vf4oS8g0zxgismtLrzsJ7AE-bdMEq+GAzx2=Mwnhuk3UA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vf4oS8g0zxgismtLrzsJ7AE-bdMEq+GAzx2=Mwnhuk3UA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_064830_439148_B0019E69 
X-CRM114-Status: GOOD (  14.01  )
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

On Tue, Oct 11, 2022 at 11:05:42AM +0300, Andy Shevchenko wrote:
> On Tue, Oct 11, 2022 at 3:02 AM Kent Gibson <warthog618@gmail.com> wrote:
> > On Mon, Oct 10, 2022 at 11:14:18PM +0300, Andy Shevchenko wrote:

...

> > > -#include <linux/gpio.h>
> > >  #include <linux/gpio/driver.h>
> > > +#include <linux/gpio.h>
> > > +#include <linux/hte.h>
> >
> > Ok with the hte re-order.
> >
> > But moving the gpio subsystem header after the gpio/driver is not
> > alphabetical ('.' precedes '/') and it read better and made more sense
> > to me the way it was.
> 
> I see, I guess this is vim sort vs shell sort. Strange, they should
> follow the locale settings...

I have checked, the shell and vim sort gave the same result as in this patch.

-- 
With Best Regards,
Andy Shevchenko



