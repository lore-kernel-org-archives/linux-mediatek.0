Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B9BD16261
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 13:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P9cfpSV60ZauXClI8qK9+Ciu4/A46dZmq9Gknct8loI=; b=fm4Y5B8PwA8GvZfdxWy4DMUxua
	sCqM1Cd66URbw7FoTjKiPMaWEMnHq/f/U9rCmtFaCH4EyG8Z209XsdPsk9uFw+vHMUBHcRJB0R8om
	4EcZmZPSXXX0hnQhUZnysxVBWiOnRn/JXi05oSoV7qsNhLzvwoz/PpsXL8TD0F0mjzqYvZGN1Ul/X
	RcbMnEi434PJtcxw4vKbDmM9aQE306PJVJMahsXN42u9cBMgPKvCf/QJ5ra/DVg+CbA+7M3Jv3Mhj
	wkWxQ+sr3OTFQtdpNFg5MjhtJEOwVLmOCxDxg5beAayd6nPnrDEbFpCOn2CzTEg4Q7h4w9aDI3vWG
	7co/II3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0L1N-00000005Ep8-0Q2k;
	Mon, 14 Oct 2024 13:22:01 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0J7d-00000004tr8-2u9h;
	Mon, 14 Oct 2024 11:20:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728904822; x=1760440822;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=wkULcwJ8+tIJqpDigom4l5ZO9Ca9fMKfWw3vvXj223k=;
  b=adtB43CCbFxbyiC5OPKIOHAbcs7mVXetAP5LXPTbhxJIfCZ08briZFNs
   7ab7E+KAKew5Y1O5zzsrOa1ezQ6dfelZbw7z0k11G4IIpvgPYgXPQBZrr
   1YakZQQM01aZxE1pkKwmQA41HoTzm6cEzhyQGw3oWfr1W4v/i0yePB/sS
   VfKM9K6rC4avmoHZ+ssESl2fTKYWJAboUyKtt2ghhAKOCkQezHJERp9hF
   TwqqZ0yw6L2b/T8uwIHQxPPqPwb/KJr70OLnh9Vwf2NFehMloYQJspzC7
   +h+o3HW0bAf+fiP3bOwsGXkVCDXlg2mo2WktSU/WVr/3j0kUbL2z6mXYb
   g==;
X-CSE-ConnectionGUID: sZJWm7vWTwuJJa+nOOWJ0w==
X-CSE-MsgGUID: LjjR5cfRS+a1Gvq7XTUPwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="38890099"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="38890099"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 04:20:20 -0700
X-CSE-ConnectionGUID: d67WPmw8RuSOrMioKshBRw==
X-CSE-MsgGUID: OFXUrAcdSweP56vvf+Qt2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="82318089"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 04:20:17 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t0J7V-00000002sTM-1oXM;
	Mon, 14 Oct 2024 14:20:13 +0300
Date: Mon, 14 Oct 2024 14:20:13 +0300
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
Message-ID: <Zwz-benEP4PHbRb2@smile.fi.intel.com>
References: <20241008073430.3992087-1-wenst@chromium.org>
 <20241008073430.3992087-7-wenst@chromium.org>
 <Zwfwv-O9ln-PVMdc@smile.fi.intel.com>
 <CAGXv+5F=5f4R5AExANxOwgTL6_VbpHdNKKhHnzy_PDcxtcFoEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5F=5f4R5AExANxOwgTL6_VbpHdNKKhHnzy_PDcxtcFoEQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_042021_767340_AA325150 
X-CRM114-Status: GOOD (  32.60  )
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

On Mon, Oct 14, 2024 at 12:06:16PM +0800, Chen-Yu Tsai wrote:
> On Thu, Oct 10, 2024 at 11:20 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, Oct 08, 2024 at 03:34:25PM +0800, Chen-Yu Tsai wrote:
> > > Add GPIO support to the simple helpers for the I2C OF component prober.
> > > Components that the prober intends to probe likely require their
> > > regulator supplies be enabled, and GPIOs be toggled to enable them or
> > > bring them out of reset before they will respond to probe attempts.
> > > Regulator supplies were handled in the previous patch.
> > >
> > > The assumption is that the same class of components to be probed are
> > > always connected in the same fashion with the same regulator supply
> > > and GPIO. The names may vary due to binding differences, but the
> > > physical layout does not change.
> > >
> > > This supports at most one GPIO pin. The user must specify the GPIO name,
> > > the polarity, and the amount of time to wait after the GPIO is toggled.
> > > Devices with more than one GPIO pin likely require specific power
> > > sequencing beyond what generic code can easily support.

...

> > > +     /* An empty string signals an unnamed GPIO */
> > > +     if (!ctx->opts->gpio_name[0])
> > > +             con_id = NULL;
> > > +     else
> > > +             con_id = ctx->opts->gpio_name;
> >
> > Can it use positive conditional?
> >
> >         if (ctx->opts->gpio_name[0])
> >                 con_id = ctx->opts->gpio_name;
> >         else
> >                 con_id = NULL;
> 
> You suggested writing it this way in your reply to v7. Please pick one.

Oh, whatever you will finish with then, sorry for the noise.

...

> > > +static void i2c_of_probe_simple_disable_gpio(struct device *dev, struct i2c_of_probe_simple_ctx *ctx)
> > > +{
> > > +     if (!ctx->gpiod)
> > > +             return;
> >
> > Do you need this check for the future patches?
> 
> Not sure I follow. The check is needed because this function is called
> in i2c_of_probe_simple_cleanup(), but the GPIO could have been released
> earlier in i2c_of_probe_simple_cleanup_early(), and that makes this
> function a no-op.

Do you have a known race condition then? This is bad. You shouldn't rely on
the sequence of events here, or the serialisation has to be added.

> The helpers for the release side are quite short, but the ones on the
> request side wrap some conditional and error handling. I think it's
> better to keep it symmetric?

Yes, but why do you need the above check, I didn't still get...
I.o.w. you think that there is a gap in time that (if no check) the GPIO
descriptor might be changed? But then how does it affect anyway the possibility
that it becomes not NULL even with the current code.

> > > +     /* Ignore error if GPIO is not in output direction */
> > > +     gpiod_set_value(ctx->gpiod, !ctx->opts->gpio_assert_to_enable);
> > > +}

-- 
With Best Regards,
Andy Shevchenko



