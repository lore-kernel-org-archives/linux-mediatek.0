Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E33AC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Oct 2022 11:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ibSOz8syyL+Yd/czcjaBZJfT8vxXMc+70ts/B3YP3yA=; b=NeKIwk2wi6MNsCX0C+5EnCepsL
	NWOYwnvF70dRUmrYLaDL017o+xRIaNyP8t43j3c7lrgNIfZxvy9AdT0FvVrd/9f8SlH2+nnYgDY2a
	/H11n1had7hSqnZDF9a8XITzyyBmLwJtXQjDIYaNY25Xyp8zNCnbq16JPr7+9qd0vJuQhX6tggqtc
	LyoAM4oiKdxy81cxW0G+5VWEF6Y1Ll3isLNd0UygAncCbqzYQ8Cq9jWY6+fyDZFCisQw1vr4Y02/x
	pl3G42veFDl5dX3nO0rEt5butbThzrN0rGV7DOVMYWfOJWjxKtEjr2Dgbcs0/fQ6aXq78T8WiaOY6
	MgYi9jTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol74O-000s0E-Et; Wed, 19 Oct 2022 11:17:08 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol74E-000rzN-Gi; Wed, 19 Oct 2022 11:16:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666178218; x=1697714218;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=byhaK/IP5btEn4lSHeI7yfg5hfTKJgloqLB5svueUwQ=;
  b=QROqtaHRYnxT8RMGuHW2bRKWbJSKRtjqDEJ5IFbmRiR95dQHlEV+jCQf
   FCYM3EOzqBHu4FmNpCSi6ad+fO9Ray4xuoMwWntkXrol1g2tg8HYGHaJI
   R6JLdqzijOZjFFUf8xGVo8hsGRW+eB0d/6W6EbSnXAzKmJCkxJFAP4ZFK
   ooQaZTDaqCLqOYdS/L9g9rtZs6toJ4SKFPVm3TmnTvDKU5ZeEd/oLpDYx
   JCA1Syvlc2wjoMM692FZMjjjR+ktgOT4vm6lvkXlkAT6FR2r30pV2cdAw
   Fb/5aDHub0uwOZ/IWAeXH2ptAgzoLyODlNQ/ypNXyYVupFvQpGlcZZ4Kg
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="303997229"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; 
   d="scan'208";a="303997229"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2022 04:16:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="718435312"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; 
   d="scan'208";a="718435312"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Oct 2022 04:16:52 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ol746-009pHc-10;
	Wed, 19 Oct 2022 14:16:50 +0300
Date: Wed, 19 Oct 2022 14:16:50 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	Daniel Thompson <daniel.thompson@linaro.org>,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 00/10] gpiolib: more quirks to handle legacy names
Message-ID: <Y0/cot711ad/hG/o@smile.fi.intel.com>
References: <20221011-gpiolib-quirks-v3-0-eae9cc2ed0a1@gmail.com>
 <Y06cvrpcHn0jwZxU@smile.fi.intel.com>
 <CACRpkdZZZp5Li7OSybv8F7a8F5iik_gRumwR__BAwpWddfctxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZZZp5Li7OSybv8F7a8F5iik_gRumwR__BAwpWddfctxQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_041658_590287_6074B0BE 
X-CRM114-Status: GOOD (  29.05  )
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

On Wed, Oct 19, 2022 at 12:56:31PM +0200, Linus Walleij wrote:
> On Tue, Oct 18, 2022 at 2:32 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Oct 17, 2022 at 10:41:01PM -0700, Dmitry Torokhov wrote:
> > > In preparation to converting several drivers to gpiod API, and to keep
> > > existing DTS working, this series adds additional quirks to locate
> > > gpio lines with legacy names.
> > >
> > > Additionally the quirk handling has been reworked (once again) to pull
> > > all simple renames (ones that do not involve change of indices or other
> > > complex manipulations) into a single quirk with a table containing
> > > transformations. This should make adding new quirks easier.
> > > When using legacy names gpiolib will emit a message to nudge users to
> > > update DTSes (when possible).
> > >
> > > Note that the last patch requires the following change from the OF tree:
> > >
> > >         88269151be67 ("of: base: make of_device_compatible_match() accept const device node")
> > >
> > > The change is also available in mainline - it has been merged in 6.1
> > > merge window.
> >
> > I was wondering if we can use the approach that ACPI chose for itself,
> > i.e.  the separate data that can be filled by the corresponding driver
> > and then GPIO OF common code may use it. In that case each driver knows
> > the exact list of compatible strings and associated quirks.
> 
> I actually deliverately chose the other way around, to centralize all quirks,
> so that drivers look nice and simple and the ugly historical errors of the
> device tree be hidden away in gpiolib-of.c.

This makes sense if and only if we may guarantee no quirks will appear in the
future. So, it may be true for DT, but I'm quite skeptical about ACPI...

-- 
With Best Regards,
Andy Shevchenko



