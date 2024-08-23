Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA53C52D7C
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Aug 2024 14:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QYcbLoEJLzMR/koL3CSmXdZhUdn7WEUX3IHhLDRpKRA=; b=kYYtZQEUUyP+iccBsQpjqcPmz/
	D5R9e0w3u01Qihy21UPKAPxe/eHeVw/t99Q2jQIeVWiLpszaNiSUxxDr3Xngx8/19+LoEDE8kSdPY
	+T6Kumk2Sdt9lwt087k/BSgd4dmyqape6eCb+1lMxN9fr/b9IWPZBVLMefr8Y6H7Sj5GMfyUPhGUp
	cxuYbkN+GtBvoSki7h0kp/fLkULL5oBkt7wZ+ackk73oAgytzUYPdBBnO+Ov6N22oPYAiX1NSELA1
	duUTMokwGaAGLvMBV8gXkPy8cMQn2FQRL99/xz2FXWUA35xd03CsBDYU18uCYf29zff+1viQ2klPt
	ULNrOF1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shUsY-0000000GzLe-2lpb;
	Fri, 23 Aug 2024 14:03:02 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shUrG-0000000Gyq7-2WEP;
	Fri, 23 Aug 2024 14:01:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724421703; x=1755957703;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=3yHP9wBn0SJcAbqYl8E8vpjlCd39wZV+iP+REGMWKgE=;
  b=cslIqk2qTFG8B3n0epjJnj6y3+sZ6UoCHB4BXDwqoJ5tDG3Y+XvxlhYV
   1smhuXBDHWNHAbM1jy8J20EV0lhB6iG9nwb5JT/9D0Yt+CabQzALGs/bY
   BTJ2c0KF549lw2VOcERxNad8RfeDvbYRBiti5BCp/ImZ7YVupTycacV5j
   6VfbNQtiaeWsNaPhvgtXkuKr8l3htbfrUNRTUF/SShip/jnC4x5UpdJKU
   n/EPiOUfBMLpsFn+L3iUPGezPfzlPKERy4OECHet3u3MoRaqK+UEUKLxl
   VO9H7zOJTLn5shfrt2eiRINk6e3Q3V4iWvXT3lAZ65tGjIn2wIaeM7Tow
   Q==;
X-CSE-ConnectionGUID: q+QIlE2VTVWp+34dw69ung==
X-CSE-MsgGUID: 53zt7meyQyKN0dOpmIJYCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22412169"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="22412169"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 07:01:41 -0700
X-CSE-ConnectionGUID: gY6ksg/lRlC/GHXXERowJA==
X-CSE-MsgGUID: DSzI+E0EQtK7ef5AaKdSkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="66726448"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 07:01:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1shUqs-00000000oRR-3UOF;
	Fri, 23 Aug 2024 17:01:18 +0300
Date: Fri, 23 Aug 2024 17:00:32 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v5 08/10] i2c: of-prober: Add GPIO support
Message-ID: <ZsiWALpt1IpTHsKg@smile.fi.intel.com>
References: <20240822092006.3134096-1-wenst@chromium.org>
 <20240822092006.3134096-9-wenst@chromium.org>
 <ZsdJOUe44hiGur-s@smile.fi.intel.com>
 <CAGXv+5G7h08Pvd24_6LoUB_8w_Cd0RntRSjNdn_FjrRH1ZF5oQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5G7h08Pvd24_6LoUB_8w_Cd0RntRSjNdn_FjrRH1ZF5oQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_070142_714046_1A7FB1E9 
X-CRM114-Status: GOOD (  30.61  )
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

On Fri, Aug 23, 2024 at 06:32:16PM +0800, Chen-Yu Tsai wrote:
> On Thu, Aug 22, 2024 at 10:20 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Aug 22, 2024 at 05:20:01PM +0800, Chen-Yu Tsai wrote:

...

> > > +     if (!data->gpiods)
> > > +             return 0;
> >
> > If it comes a new code (something else besides GPIOs and regulators) this
> > will be a (small) impediment. Better to have a helper for each case and do
> >
> >         ret = ..._gpiods();
> >         if (ret)
> >                 ...
> >
> > Same for regulators and anything else in the future, if any.
> 
> I'm not sure I follow. Do you mean wrap each individual type in a wrapper
> and call those here, like the following?
> 
>     i2c_of_probe_enable_res(...)
>     {
>         ret = i2c_of_probe_enable_regulators(...)
>         if (ret)
>               return ret;
> 
>         ret = i2c_of_probe_enable_gpios(...)
>         if (ret)
>               goto error_disable_regulators;
> 
>         ...
>     }

Yes.

...

> > > +             /*
> > > +              * reset GPIOs normally have opposite polarity compared to
> >
> > "reset"
> >
> > > +              * enable GPIOs. Instead of parsing the flags again, simply
> >
> > "enable"
> >
> > > +              * set the raw value to high.
> >
> > This is quite a fragile assumption. Yes, it would work in 98% cases, but will
> > break if it's not true somewhere else.
> 
> Well, this seems to be the de facto standard. Or it would have to remember
> what each GPIO descriptor's name is, and try to classify those into either
> "enable" or "reset", and set their respective logical values to 1 or 0.
> And then you run into a peripheral with a broken binding that has its
> "reset" GPIO inverted, i.e. it's driver behavior needs to follow the
> "enable" GPIO style. The class of devices this prober targets are
> consumer electronics (laptops, tablets, phones) that at least have gone
> through some component selection where the options won't have conflicting
> requirements.

I'm talking from real life example(s) :-)

Recently I looked at the OV7251 sensor driver that expects "enable" GPIO while
all users supply "reset"-as-"enable" with the exact trouble I described.
Yet it's pure software / ABI issue in that case, but who knows what PCB
engineers may come up with.

> And if the polarities of the possible components don't line up, then this
> probe structure can't really do anything. One would need something that
> power sequences each component separately and probes it. I would really
> like to avoid that if possible, as it makes the boot time (to peripheral
> available) dependent on which component you have and how far down the
> list it is. We have Chromebooks that have 4 touchscreen components
> introduced over the years. In that case something more like Doug's
> original proposal would work better: something that forces mutual
> exclusivity among a class of devices.

Maybe. I just pointed out the potential problem.

> > > +              */

-- 
With Best Regards,
Andy Shevchenko



