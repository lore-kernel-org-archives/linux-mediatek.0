Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F01C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Oct 2022 12:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UF4U4gKuPoCtX7amS0XmApUm5jxl8wMwNh0EJHmOXa0=; b=Ss/NqDxwRv3kj2JyHRro2ZQZWy
	naR7iNpy7zonB1kBTQORxaqkKIJZJM6dTLo4XtqA296AagZaoFh/DlB6bn5CQOYlf68X7jn6JIZ/L
	nTVU7nzwGW4FFOOcq0bfeBn/OAn69yetSP/nLa6JVbzFwR2iG+7ENEPT+iQZJSB6svQIRpIzkYhAi
	rUNdz1WMSq5ETB7j6wBESaow/5cHAzuYLp5kKaTXX5/3TfAghj3Lo6LA4syHi0Sl2mX3y+n0WEbgu
	3wUU+ew+OnV3UXEez2+ikke/Fct0m4Rl1v0Cs5drJrK6bJa2m8dnEP2SpEkosFvd/u9gWPU0+KJkE
	X11aL8iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okPBE-00BWXW-Rc; Mon, 17 Oct 2022 12:25:16 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okP4d-00BTMI-Ub; Mon, 17 Oct 2022 12:18:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666009107; x=1697545107;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RmYFEN28phqSp8mG6aCLWFWEADNDyPYb/TiMHr0QPNc=;
  b=Qp5sQYv5eQMsQjJAgjYqcw2hfTHruM2uH1KIl17tqcVhtBAkD53HKGpq
   nrjtFXNeN1sD+P2uXJxejj9j1urolufvrt6seBDHoT0Vv6imGfijjl8BF
   H/5XNz+b+4evY8te31lK/gB0vHv69Kupp4bDQpyECfmBtmbu6aR5ycPPc
   oiB4me1pPwWtGKSOfYALMbHG6lPPGwtzs3NSrr6yKuLLc7afAnrm30Unw
   UlPsfLPvcrNmebe1ECCxWPriVAyMNa71xUA3Azen4l5L2ub16rz0s02Lr
   9yWlkTUuIt4DHcLylO23cepWZye6Xvrf4P7i3IDG/Jh47twB9StwUzJFy
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="332320294"
X-IronPort-AV: E=Sophos;i="5.95,191,1661842800"; 
   d="scan'208";a="332320294"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2022 05:18:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="623207818"
X-IronPort-AV: E=Sophos;i="5.95,191,1661842800"; 
   d="scan'208";a="623207818"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 17 Oct 2022 05:18:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1okP4U-008mkH-2E;
	Mon, 17 Oct 2022 15:18:18 +0300
Date: Mon, 17 Oct 2022 15:18:18 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>,
	linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org, linux-actions@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
	linux-rpi-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [rft, PATCH v2 00/36] pinctrl: Clean up and add missed headers
Message-ID: <Y01ICtqd8uy/4/Mb@smile.fi.intel.com>
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdZ1M3ckw+jFgvMqG4jvR-t_44GPoZ6ZDXszwZCJr-cDpg@mail.gmail.com>
 <Y00f5exY2fM6IwZ+@smile.fi.intel.com>
 <CACRpkdYmSOGtFz8W_RRkDqMXRRBOSB9jqSn65Sah90bf3Gm59g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYmSOGtFz8W_RRkDqMXRRBOSB9jqSn65Sah90bf3Gm59g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_051828_038837_81A88098 
X-CRM114-Status: GOOD (  19.46  )
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

On Mon, Oct 17, 2022 at 11:58:03AM +0200, Linus Walleij wrote:
> On Mon, Oct 17, 2022 at 11:27 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Oct 17, 2022 at 11:02:09AM +0200, Linus Walleij wrote:
> > > On Mon, Oct 10, 2022 at 10:15 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > > Currently the header inclusion inside the pinctrl headers seems more arbitrary
> > > > than logical. This series is basically out of two parts:
> > > > - add missed headers to the pin control drivers / users
> > > > - clean up the headers of pin control subsystem
> > > >
> > > > The idea is to have this series to be pulled after -rc1 by the GPIO and
> > > > pin control subsystems, so all new drivers will utilize cleaned up headers
> > > > of the pin control.
> > >
> > > Aha I see you want to send a pull request so I backed out the applied patches
> > > from the series for now.
> >
> > Can I consider all that you answered to as Rb tag?
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Thank you!

> I haven't reviewed in detail but I fully trust you to do the right thing
> and fix any fallout so will happily pull this.

The plan is to push this to Linux Next for a couple of days and then I'll send
PR to you and Bart.

-- 
With Best Regards,
Andy Shevchenko



