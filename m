Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1EA5C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Oct 2022 15:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+jLJYSZFFQ+J9KwL/Vx/5Q1PKh1V5cLDL2XT3zpPOi0=; b=sM5CyrK5zgKPBJxEcTJU5XFG/H
	FQriaNrpE02hJAJ6FlqaZ243fdvVT9kLwm+u+p0eQOVhv9aI6bjs6zs/AAuIYTk6XrAY0cXdkSXNi
	ozwhZu3XRX/DKL7vcqgl3gV8kjHQ0SbLJ9KhHbJrkaHjNjglRw/FltQbFmtaE/vKAFBrzG6hchkpA
	6rhvq9KjLqX+/bitWIbTT1dp6qieO9kkjZ5Jl8RMuGZVzrnuNqlou3QAgJvNTow9R08xrgKO4l6FU
	w7t6AVH2dTFdWSUtN6t1Wr4mF93FngUC7sqx2NOChWghkAB/zw+vZonmMVZFR9MNcX55l7+HCPYvX
	tfSkLdsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojMLv-00F8YR-Pw; Fri, 14 Oct 2022 15:11:59 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojMLj-00F8VP-Si; Fri, 14 Oct 2022 15:11:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665760307; x=1697296307;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N/njfTWM92urhDh1tc8kt06mInCQV3hTHb5sdf7xqk0=;
  b=UUcVxyNR2k+z1kwwaoCqz6ErWo6ZVzN9f/pYRQKUUvPsZSRKs8ynAbsc
   ENLstmY5ueLF1Gal81AnPpB79iGLxita4m7L+4mw9383EdRHh3xZ1W2SS
   tm8vqGRhn2fXBqajLSCxqk7G11mRtJJrs8j7D0FO3L3QirxQ9HmctXKy9
   Qh5bc7lVfRPtkMmqJw291ukwu3xHgUqxaKOOpZ6wb3yK+78R4VqZRSdUV
   ZjD/Y92FesRx1C1hmA0vZzfMxxSbD4Beck7sLZuuk05A6/oQ/d20AYo4E
   6G/E5C9t9OsOJn8sbZDq4FTA6wQFm5JwOIaZlGABTMTsw5xzAxNJ+or7B
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="391703298"
X-IronPort-AV: E=Sophos;i="5.95,184,1661842800"; 
   d="scan'208";a="391703298"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2022 08:11:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="660758830"
X-IronPort-AV: E=Sophos;i="5.95,184,1661842800"; 
   d="scan'208";a="660758830"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 14 Oct 2022 08:11:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ojMLW-006yCQ-0e;
	Fri, 14 Oct 2022 18:11:34 +0300
Date: Fri, 14 Oct 2022 18:11:33 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Florian Fainelli <f.fainelli@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
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
Message-ID: <Y0l8JTQQvLzRejk1@smile.fi.intel.com>
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <0684f480-2092-d520-2c8e-bd9a2dca47e3@gmail.com>
 <CAHp75VdDjyUAZBTaoPOe5oA3f_5xRznAooq08=Eff4F1AZyVOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VdDjyUAZBTaoPOe5oA3f_5xRznAooq08=Eff4F1AZyVOQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_081147_966319_0005D8A5 
X-CRM114-Status: GOOD (  21.72  )
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

On Wed, Oct 12, 2022 at 01:04:10PM +0300, Andy Shevchenko wrote:
> On Tue, Oct 11, 2022 at 11:56 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
> > On 10/10/2022 1:14 PM, Andy Shevchenko wrote:
> > > Currently the header inclusion inside the pinctrl headers seems more arbitrary
> > > than logical. This series is basically out of two parts:
> > > - add missed headers to the pin control drivers / users
> > > - clean up the headers of pin control subsystem
> > >
> > > The idea is to have this series to be pulled after -rc1 by the GPIO and
> > > pin control subsystems, so all new drivers will utilize cleaned up headers
> > > of the pin control.
> > >
> > > Please, review and comment.
> >
> > Did you really need to split this on a per-driver basis as opposed to
> > just a treewide drivers/pinctrl, drivers/media and drivers/gpiolib patch
> > set?
> >
> > 36 patches seems needlessly high when 4 patches could have achieve the
> > same outcome.
> 
> I can combine them if maintainers ask for that, nevertheless for Intel
> pin control and GPIO drivers, which I care more about, I would like to
> leave as separate changes (easy to see in history what was done).

I can now tell why I don't like to combine. While doing a revert (it's not
related to GPIO nor to pin control), it appears that I reverted extra bits
as merge conflict resolution. This is per se is not an issue, but when
I tried to find and reapply that missed piece I can't, because the patch
is combined and Git simply ignores to have
`git cherry-pick _something in the past_` done.

But again, up to maintainers.

-- 
With Best Regards,
Andy Shevchenko



