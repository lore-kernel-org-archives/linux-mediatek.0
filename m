Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D5F7C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Dec 2022 21:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r3R+mnM7fQH/xiULT8zdIWIjiEObacZiMr/MlEMGFVs=; b=vOqQiSkEZixLKJLLExY5Nw78ok
	b/2ocVWebkNOQNwnopkTxHhJlsIdm2cdqDgH9lzhYqhEFywY9uLo7U5MkpIuDR456UaSwCsNZgeqx
	rO7tvEn9mis3kjnl6e5PIF6gHbaib/9j2s9pE1RGpoOvL8ji8WeGyrLoi/s++LD6Qg5AypDEPaUF/
	pgmMYZC/89hE1/TVuuMz6n4d+/i+FYgIKfFR+FhpyTsH6zTvqF91DiBN1jKvh7NdTSEQeUtsrc2UN
	NAzobzClRQSwdhnNRklY6BSqbk7GiSuuChaAd08DK8lsDamA4HZajm8gsJR9tg/AOLU2TMQgmdnlU
	bfe3UgEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3lEA-00Bdr4-Nj; Fri, 09 Dec 2022 21:48:18 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3lDx-00BdmO-UW; Fri, 09 Dec 2022 21:48:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670622485; x=1702158485;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=VyW/tMWJvyoCTirAlG73DmAZL480LWhJqZ6Zbp5E2tY=;
  b=DmlaXKDMGmHZ8VfjaykFiCcvjSXpnC9MYB9zSdjhgZxqwj9fHjEgcY+X
   7pJ9tCwxNtWR1tJ+BzzmR0JHM/Ht4SqWmzWJZ05piJT7+hLqOojaJulVA
   gfCHrlrMo6HgQ2a5K+pmK3V4aDn2YsgoyjtRwztktKI4KdW1pbchz8zuQ
   BFCSQnE8VHLHYR9M/3zsLhDp9SAKbgFoS1XSe6dpYjlY6XP4vsJIxzmkK
   K7nrZAU9WnJ9XU/CYIZN7UE0ejfqH7rCgO7Qqsq453oiByW5RXx15Wg6q
   SJEavGZqN2MGzlt23iD1Wf8mOobyvpjfqzi0w0ILOQU4sBf7VEi6xhnvW
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="319415096"
X-IronPort-AV: E=Sophos;i="5.96,232,1665471600"; 
   d="scan'208";a="319415096"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2022 13:48:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="821856456"
X-IronPort-AV: E=Sophos;i="5.96,232,1665471600"; 
   d="scan'208";a="821856456"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 09 Dec 2022 13:47:57 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1p3lDn-007CW5-0p;
	Fri, 09 Dec 2022 23:47:55 +0200
Date: Fri, 9 Dec 2022 23:47:54 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-pwm@vger.kernel.org,
	linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev, linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 00/11] pwm: Allow .get_state to fail
Message-ID: <Y5OtCjQOQjjltGPa@smile.fi.intel.com>
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_134806_174527_5D94EC4F 
X-CRM114-Status: GOOD (  20.94  )
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

On Wed, Nov 30, 2022 at 04:21:37PM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> I forgot about this series and was remembered when I talked to Conor
> Dooley about how .get_state() should behave in an error case.
> 
> Compared to (implicit) v1, sent with Message-Id: 20220916151506.298488-1-u.kleine-koenig@pengutronix.de
> I changed:
> 
>  - Patch #1 which does the prototype change now just adds "return 0" to
>    all implementations and so gets simpler and doesn't change behaviour.
>    The adaptions to the different .get_state() implementations are split
>    out into individual patches to ease review.
>  - One minor inconsistency fixed in "pwm: Handle .get_state() failures"
>    that I noticed while looking into this patch.
>  - I skipped changing sun4i.c as I don't know how to handle the error
>    there. Someone might want to have a look. (That's not ideal, but it's
>    not worse than the same issue before this series.)
> 
> In v1 Thierry had the concern:
> 
> | That raises the question about what to do in these cases. If we return
> | an error, that could potentially throw off consumers. So perhaps the
> | closest would be to return a disabled PWM? Or perhaps it'd be up to the
> | consumer to provide some fallback configuration for invalidly configured
> | or unconfigured PWMs.
> 
> .get_state() is only called in pwm_device_request on a pwm_state that a
> consumer might see. Before my series a consumer might have seen a
> partial modified pwm_state (because .get_state() might have modified
> .period, then stumbled and returned silently). The last patch ensures
> that this partial modification isn't given out to the consumer. Instead
> they now see the same as if .get_state wasn't implemented at all.

I'm wondering why we didn't see a compiler warning about mistyped function
prototypes in some drivers.

P.S. The series is good thing to do, thank you.

-- 
With Best Regards,
Andy Shevchenko



