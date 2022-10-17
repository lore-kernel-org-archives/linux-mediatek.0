Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC77C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Oct 2022 09:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UE11fbamH5+I7xDq3hrb6zFwXYY3hk5uAIrPf2ekdVs=; b=QyT/7fiMJneYhu5Z3TDyJ0nWIz
	niuHLG7fC2txNmioQXEDqymz7Lv3A/hs1NnRPo2hJydZhJ/gUw07B+niq5W0DKfUeLGkhfsup1zxg
	hTMYLiScBs25pcv8SgLwGPeKoUCe1wYioB+SiKv6DAxyAV5uN0sgSygVaAhw2/RxXS5RsC19N3a03
	+dP8gdAnIOBPa6wkvNr7/2HcLRDjO5dLz2VCMyqrZuvlpQ0kaPurGSSprdsWB31J3k1Zk5hF8z5ug
	J1+onbfUrpRaTIcy45h9U1+MgK1Pj/2QLJxCR1yPnaCCOCH1+nCwetKc7iXbMFbjJ2yKM79qDM0uI
	NZkX7+Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okMPL-009hMJ-RD; Mon, 17 Oct 2022 09:27:39 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okMOv-009hCO-5C; Mon, 17 Oct 2022 09:27:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665998833; x=1697534833;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uMXEjdYfJ4AJV1TGc6N3Z98FaBO6KSM8lYZW5Txc/+Q=;
  b=BsRGXzY7ttLOus5EvKzkysJ+rCAPieKfnVzjGEG6GiHKXywA+6oxzwc0
   ud9Kbf1szWXOQsyvT3qyTeS2zDzyGSwjnFsEW+uYgOONMV5x2B5lEhxoX
   NNvfiSSzx0d+cJIWpbQ+dWvR1QxQ0jWAp7lw8L3x9G/xYLa2p28vWYI35
   +Ex9cdGuV/rM1ZI8M919/oTSZ7SUw54Nbgw4Z+zb5gkxucGe7Tq+IzzLd
   iu7/tIU/L7zn//+na68xqiK+apfQWm+g8pqhux8a5DpPWNqcHXQhYoTCP
   h4bkZwhyXUpJhr0Qr4+B4L2qaOdN1tL/a80259gtKZCgVSdDhFGfS2Qcx
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="293116242"
X-IronPort-AV: E=Sophos;i="5.95,191,1661842800"; 
   d="scan'208";a="293116242"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2022 02:27:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="630619961"
X-IronPort-AV: E=Sophos;i="5.95,191,1661842800"; 
   d="scan'208";a="630619961"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 17 Oct 2022 02:27:03 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1okMOj-008i6R-2u;
	Mon, 17 Oct 2022 12:27:01 +0300
Date: Mon, 17 Oct 2022 12:27:01 +0300
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
Message-ID: <Y00f5exY2fM6IwZ+@smile.fi.intel.com>
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdZ1M3ckw+jFgvMqG4jvR-t_44GPoZ6ZDXszwZCJr-cDpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZ1M3ckw+jFgvMqG4jvR-t_44GPoZ6ZDXszwZCJr-cDpg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_022713_300896_2F1D1802 
X-CRM114-Status: GOOD (  15.86  )
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

On Mon, Oct 17, 2022 at 11:02:09AM +0200, Linus Walleij wrote:
> On Mon, Oct 10, 2022 at 10:15 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > Currently the header inclusion inside the pinctrl headers seems more arbitrary
> > than logical. This series is basically out of two parts:
> > - add missed headers to the pin control drivers / users
> > - clean up the headers of pin control subsystem
> >
> > The idea is to have this series to be pulled after -rc1 by the GPIO and
> > pin control subsystems, so all new drivers will utilize cleaned up headers
> > of the pin control.
> 
> Aha I see you want to send a pull request so I backed out the applied patches
> from the series for now.

Can I consider all that you answered to as Rb tag?

-- 
With Best Regards,
Andy Shevchenko



