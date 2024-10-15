Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB70CFC28A
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 11:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yxe9gdkvuTNTpQ41mDo6m9bR2y1zwu/bf2kZS7t+EqU=; b=B2L4AfffVlKA7kK7CT2n4dd/u1
	TB2EM+IEXwjMN7j7MNEtb92i1Zd3UQUgSzspUsZuP+mQm2SHtvwTyhUe0jRyTa6sI8PyxqQanHagQ
	DhJaTnEV7B8QMLgAtR3y4ts/0YInRQB/rCz3DhWwH1Eo72Z8RG7k1us5dwhOh48EilENSP6jXS3zg
	KVU1NoXeFR3BRUTfm/l7rl64j9eJpOJprMRh0bxFVdCX5tu1MFxkZxThiRfmHCehz+M3TKYoOfjU7
	1z8pvnAdm81/qdDEftVps3tG3uy5OD8moPev+EZg0fK5GStIWKVOX++A5ka5D25Zq1UmlPNNriI05
	mkRKdLGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0fea-000000080eF-1JIQ;
	Tue, 15 Oct 2024 11:23:52 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0faX-00000007zd4-1grC;
	Tue, 15 Oct 2024 11:19:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728991181; x=1760527181;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=nHnbY3Qf1d9Iv/MtYL8kyklNX27QMs4I/0vg9sFyQ/k=;
  b=aztDR+q89LVQiNexH2+JpL6piT4FDCD3KrUvUg8NvGUoSozycgjupaJu
   CjOmp9d9E0771uW/Z/QJQnBpLj/SK/Q/fXSqWmwByXLd4wuf057TCgq8d
   4VjiqESg7PtvgXkZMgCcQgmj1SonSy79ke2c+Vf+S3IAEYGzJFeX3NFr9
   37Uo1YZz+Ewky/K3DLtZ9MgpLYxxEjzX0mkV6sDLjA2NgixiqQP+1Vehh
   D8ugY3Nb+fjnzjHIH85BW+jwh5OeJYLyv1yslAiLcgW8d5b9/aBRqoaue
   QmIK2R9QKKHwg6zB4K16QPsVfzv/1/WwhtGikQwCJhtdO49i/I4LdSelH
   g==;
X-CSE-ConnectionGUID: ycJOR3WhQzSoyfkzsBFpww==
X-CSE-MsgGUID: qyACyI8RSWCHyg0mrr8esA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="32297437"
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="32297437"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 04:19:39 -0700
X-CSE-ConnectionGUID: R9uydBfYRYeW71Emay4xrQ==
X-CSE-MsgGUID: UZheSprSSyqQfzcSvzXGnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="78047063"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 04:19:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t0faO-00000003FMY-2Ug5;
	Tue, 15 Oct 2024 14:19:32 +0300
Date: Tue, 15 Oct 2024 14:19:32 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v8 6/8] i2c: of-prober: Add GPIO support to simple helpers
Message-ID: <Zw5PxMOrF8Ape3if@smile.fi.intel.com>
References: <20241008073430.3992087-1-wenst@chromium.org>
 <20241008073430.3992087-7-wenst@chromium.org>
 <Zwfwv-O9ln-PVMdc@smile.fi.intel.com>
 <CAGXv+5F=5f4R5AExANxOwgTL6_VbpHdNKKhHnzy_PDcxtcFoEQ@mail.gmail.com>
 <Zwz-benEP4PHbRb2@smile.fi.intel.com>
 <CAGXv+5EwSZFoE-Uzb5x1QfknkVfd64Z_uzR0YcvZ_pR9ktGUBA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5EwSZFoE-Uzb5x1QfknkVfd64Z_uzR0YcvZ_pR9ktGUBA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_041941_483209_3C94A466 
X-CRM114-Status: GOOD (  32.99  )
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

On Tue, Oct 15, 2024 at 01:31:40PM +0800, Chen-Yu Tsai wrote:
> On Mon, Oct 14, 2024 at 7:20 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Oct 14, 2024 at 12:06:16PM +0800, Chen-Yu Tsai wrote:
> > > On Thu, Oct 10, 2024 at 11:20 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Tue, Oct 08, 2024 at 03:34:25PM +0800, Chen-Yu Tsai wrote:

...

> > > > > +static void i2c_of_probe_simple_disable_gpio(struct device *dev, struct i2c_of_probe_simple_ctx *ctx)
> > > > > +{
> > > > > +     if (!ctx->gpiod)
> > > > > +             return;
> > > >
> > > > Do you need this check for the future patches?
> > >
> > > Not sure I follow. The check is needed because this function is called
> > > in i2c_of_probe_simple_cleanup(), but the GPIO could have been released
> > > earlier in i2c_of_probe_simple_cleanup_early(), and that makes this
> > > function a no-op.
> >
> > Do you have a known race condition then? This is bad. You shouldn't rely on
> > the sequence of events here, or the serialisation has to be added.
> 
> No there isn't. Explanation below.
> 
> > > The helpers for the release side are quite short, but the ones on the
> > > request side wrap some conditional and error handling. I think it's
> > > better to keep it symmetric?
> >
> > Yes, but why do you need the above check, I didn't still get...
> > I.o.w. you think that there is a gap in time that (if no check) the GPIO
> > descriptor might be changed? But then how does it affect anyway the possibility
> > that it becomes not NULL even with the current code.
> 
> There are two codes paths, either
> 
>     a) successfully finding a device and enabling it, or
>     b) exhausting all options and not finding a device, because it was
>        optional or it is malfunctioning.
> 
> After either code path, this cleanup function is called.
> 
> In path (a), the GPIO descriptor is released prior to enabling the device,
> because the descriptor is an exclusive resource, and as soon as the device
> is enabled, its corresponding driver may probe and request the same GPIO,
> and would fail if it was not released.
> 
> In path (b), nothing was enabled, and the GPIO descriptor was not released
> early.
> 
> The cleanup function here accounts for both cases, hence the check.

Yes, but the very same check is inside gpiod_set_value(). I'm still puzzled
about the duplication. Maybe I'm missing something...

> A step-by-step description might be clearer:
> 
> 1. i2c_of_probe_simple_enable()
>    ...
>    1a. i2c_of_probe_simple_get_supply()
>    1b. i2c_of_probe_simple_get_gpiod()
>    1c. i2c_of_probe_simple_enable_regulator()
>    1d. i2c_of_probe_simple_set_gpio()
> 
> 2. Loop through potential component options and probe; if one is found:
>    2a. i2c_of_probe_simple_cleanup_early()
>        2a-i. i2c_of_probe_simple_put_gpiod
>    2b. Enable device and driver's probe() gets called
> 
> 3. i2c_of_probe_simple_cleanup()
>    3a. i2c_of_probe_simple_disable_gpio()
>    3b. i2c_of_probe_simple_put_gpiod()
>    3c. i2c_of_probe_simple_disable_regulator()
>    3d. i2c_of_probe_simple_put_supply()
> 
> > > > > +     /* Ignore error if GPIO is not in output direction */
> > > > > +     gpiod_set_value(ctx->gpiod, !ctx->opts->gpio_assert_to_enable);
> > > > > +}

-- 
With Best Regards,
Andy Shevchenko



