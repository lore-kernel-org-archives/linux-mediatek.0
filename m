Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62696CFC28A
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 11:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QulVcZ1lWLFl8PH89tPpYuj1UcnrdpsEKzPg0KhRjvo=; b=BV20/1nP7hCbdnyUF0Z0yTi/Up
	tIU/PwXsv6HMJoNhVruH+S4+bmqhBYZdf3kCfordhz6sYe4L3x0cZ3PPh8OiRSSe8eilyPGuxepme
	TzTLN6MhhMZVXNRWpZ8rIg7JzWsp+9/4uMgHprecs1Al7ZIjKeUc+98fB7iNhbkJIojvMPtx+AAcz
	Jc+4N7z+kVY+1Z2ong3hf/HFtpB+WrsngeRlYFAQIWolxECDl+zpuN7IpDuP+yZRGC3SiFvjjyVdr
	VTl4TGZGMBhR07HkA6o/xlMtn8PbaahgAzE4P8WLwavX2q2QrBmdlAB6Ybb88VxxafvxQO3dtEd2Y
	jhNhjp8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0fg0-0000000810U-0wTe;
	Tue, 15 Oct 2024 11:25:20 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0fcC-0000000806o-0Qhc;
	Tue, 15 Oct 2024 11:21:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728991284; x=1760527284;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=F+LntjNMoNMukvVFd2uBIf+bs68NkbZTB14gu4OyGW0=;
  b=B6nY23UozYbDybJpaOnPKHpCH8lphh70ypsBSgI5rla0mqaXahQmIG8h
   rnQs6OZW5bZDqOP20XiJdwhsyRALHQJfTc9tg7vQqZ4HlqvmSFWaHX0al
   o8cy8FDAlUIXYTWrHs+j0mkT7Hb49xSrX7bq3NRCZQTkejFt1XUFggzMA
   +CZPPmqi9lZFPzMqGyVmNjLfmBpx7Cx6ck+4U9RNDKg15DUImBPJQeSt5
   EpJD1nt8dGX8DLF4lwKyyYJl3sa6KpsX7fML9VencfazkeV7ahN5sq9gQ
   NSy8CskCjitgiqaS79RyLTp0Ebp99m4v3JIBIIfrRJDSU8YHQv8iVOF4I
   A==;
X-CSE-ConnectionGUID: o9e/kQPtTKuNJEzZLyHOng==
X-CSE-MsgGUID: 7IVjsNyYSjuJuDmXQtQjkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39500324"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39500324"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 04:21:19 -0700
X-CSE-ConnectionGUID: piYH8dHzQlyF9xS4V6a0lA==
X-CSE-MsgGUID: YjuABOffSRCNBgXlDBh9NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="77734747"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 04:21:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t0fc0-00000003FO9-1pHB;
	Tue, 15 Oct 2024 14:21:12 +0300
Date: Tue, 15 Oct 2024 14:21:12 +0300
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
Message-ID: <Zw5QKDoZkn6QZtNO@smile.fi.intel.com>
References: <20241008073430.3992087-1-wenst@chromium.org>
 <20241008073430.3992087-7-wenst@chromium.org>
 <Zwfwv-O9ln-PVMdc@smile.fi.intel.com>
 <CAGXv+5F=5f4R5AExANxOwgTL6_VbpHdNKKhHnzy_PDcxtcFoEQ@mail.gmail.com>
 <Zwz-benEP4PHbRb2@smile.fi.intel.com>
 <CAGXv+5HtDqf9MbGc53axP276fFA6riM85+Sa7nXHPvZcCb5-Pg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5HtDqf9MbGc53axP276fFA6riM85+Sa7nXHPvZcCb5-Pg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_042124_564450_B054D408 
X-CRM114-Status: GOOD (  29.32  )
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

On Tue, Oct 15, 2024 at 01:34:52PM +0800, Chen-Yu Tsai wrote:
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
> >
> > > The helpers for the release side are quite short, but the ones on the
> > > request side wrap some conditional and error handling. I think it's
> > > better to keep it symmetric?
> >
> > Yes, but why do you need the above check, I didn't still get...
> > I.o.w. you think that there is a gap in time that (if no check) the GPIO
> > descriptor might be changed? But then how does it affect anyway the possibility
> > that it becomes not NULL even with the current code.
> 
> The opposite actually. Either it is always NULL, or it was initially valid,
> but the early cleanup function released it and thus it became NULL by the
> time this function gets called.

Then I don't see any points to have this check (details in the other reply).

> > > > > +     /* Ignore error if GPIO is not in output direction */
> > > > > +     gpiod_set_value(ctx->gpiod, !ctx->opts->gpio_assert_to_enable);
> > > > > +}

-- 
With Best Regards,
Andy Shevchenko



