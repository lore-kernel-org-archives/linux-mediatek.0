Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC254C4332F
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Dec 2022 13:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ke9LoB1FeHeMRPEube2LONSYlHl1ocaQniy5+w/Emwg=; b=G+ZIM/jTUongBgOoLSBtvcI7EI
	Wdi9bbam0vGusuR/HbR3u1F3mM53ZRYLj+hPTxQ1eaGVe0MF64TOdCEiPvgBrGSa/lhYivtCh9uqX
	4i8vrpJqm514LKHqLDlAzlVz4QwV1Pno02XbuvOsvzoTskbHYV5usqPmuyubqVZa0I7uqY0i97wgH
	KrSdf1OodmBWmfVmlCAtsvBBuYs7viruy2X1PknnqFe02UGZ/ReoPwhnP+3ckW2tL5aWWG5xGAI/c
	sryLw47KItzYGQ1wS1qL2seqPHGQ4R78eIDtmZQ+VXXJRR0OsjrLHOJ7RLh+hE2dBjKk4VZvrLawP
	eDCzQBcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4MQt-000lmV-Hp; Sun, 11 Dec 2022 13:31:55 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4MQZ-000lWC-U2; Sun, 11 Dec 2022 13:31:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670765495; x=1702301495;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=mzHG/pVGmg236g4ocCottXwf/Vck+AOplcQMPTkzoug=;
  b=MNc7YmhZ6X9At/PueJnc3JuWtS43xq9KTKOfp1I/qJANVCPXFxux4iSc
   DaPOfD9Rd+c//t8M5gQPDJsx/0QXvLuCCVAagsPg+CkaFvWQU49kD1zim
   lJQ7Y5brrDN2vNWQyAV7nEBURwfxmXatCQBYoQs/UTUs76k8d0x/oujsf
   KY26WZV12DUB7zzC1kMVbYrvlLVn1nwaplo7DbVq+u9Ay0hbnB7Dk65qH
   uZfFAkQiJBf0zGd4CCOWIoqUczDBKacWjkmVzXAg1KD19cxDr/ykkeF43
   Y9K0VrFmpoyja/z0yXWYMWdZJPka4V8LxkSXwYJgz6kdZ5BQYBX6er48j
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10558"; a="318847053"
X-IronPort-AV: E=Sophos;i="5.96,236,1665471600"; 
   d="scan'208";a="318847053"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2022 05:31:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10558"; a="678628772"
X-IronPort-AV: E=Sophos;i="5.96,236,1665471600"; 
   d="scan'208";a="678628772"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 11 Dec 2022 05:31:28 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1p4MQQ-0080Nz-0b;
	Sun, 11 Dec 2022 15:31:26 +0200
Date: Sun, 11 Dec 2022 15:31:25 +0200
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
Message-ID: <Y5XbrWTicuTxPLwN@smile.fi.intel.com>
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
 <Y5OtCjQOQjjltGPa@smile.fi.intel.com>
 <20221210091833.vdfir63nq4kpj5cm@pengutronix.de>
 <Y5TyrO5maz5VYic3@smile.fi.intel.com>
 <20221210224154.733cd5qnrkpexq22@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221210224154.733cd5qnrkpexq22@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221211_053137_217025_A1EA3463 
X-CRM114-Status: GOOD (  17.24  )
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

On Sat, Dec 10, 2022 at 11:41:54PM +0100, Uwe Kleine-König wrote:
> On Sat, Dec 10, 2022 at 10:57:16PM +0200, Andy Shevchenko wrote:
> > On Sat, Dec 10, 2022 at 10:18:33AM +0100, Uwe Kleine-König wrote:
> > > On Fri, Dec 09, 2022 at 11:47:54PM +0200, Andy Shevchenko wrote:
> > > > On Wed, Nov 30, 2022 at 04:21:37PM +0100, Uwe Kleine-König wrote:

...

> > > > I'm wondering why we didn't see a compiler warning about mistyped function
> > > > prototypes in some drivers.
> > > 
> > > I don't understand where you expected a warning. Care to elaborate?
> > 
> > intel-lpss.c has the prototype that returns an int. IIRC it was like this
> 
> Do you mean drivers/mfd/intel-lpss.c? That one doesn't implement a PWM?!

Nope, I meant pwm-lpss.c.

> And drivers/pwm/pwm-lpss.c is adapted by this series.

That's what I didn't see how.

> One of us is confused ...

Yes, because when I have checked the branch based on Linux Next I already saw
that get_state() returns a code and I wasn't aware that the series is already
there.

-- 
With Best Regards,
Andy Shevchenko



