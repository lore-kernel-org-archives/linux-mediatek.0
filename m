Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369A0D21690
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 12:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LCX1rA8wwXlGB/Kr0sY2myFodFORVpDd8InZ1HgTd6I=; b=xFCuGgn2CkzQPWS6VNhV/NhH4Q
	shSt7/Xsd6v+1Hj1ReAYdoApGdhdLlMh0lXK9XCajq7mQFQSdTDJ48lhYZv4fvxvSUVYZC+pIbx5B
	X366AqjDBWoG8aFW9FqcS+ibbhk3JHd37TL45Mt+2Kgm8pX7mE/e+pVehIYB4DhmeYZMyjIarbODO
	WuGG+kr9lUF/4ZdXIfnFPi7FanzfyX28XfM8ZSDWuSXbPciQQqyMjFX4+GrVaUm9Ebw3CAIW7+WUw
	r9gAoseht8bVUhgxvFwv5EvPIh+RdyiPtVI2+fSulEZ30cVCC3OP5IR6HFk3AjgP29qlZaR6sJdUh
	WRSWkLRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0h7n-00000008GEG-1UKG;
	Tue, 15 Oct 2024 12:58:07 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0h4g-00000008Fmk-0mVb;
	Tue, 15 Oct 2024 12:54:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728996894; x=1760532894;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=IpUeFHHJn0wswPXOIvJ6ugRddbx0dZyA2d3iKLKDp/k=;
  b=O3QgNzDNRMgD/32i9m8jtuLRJoCS1g4QUE+PVg9f9lsZaS6YHk4E0ieQ
   pWa5Nk0XagmfHUTOHHXjdhU5OMTJkvucEfygygyFc2ElgmFVLwvRk8GHc
   CNEdh4shmIQStFJcQMEqZu/bS8diqT0dxFGAbQ15/UGGLn05Yr/sVoTMZ
   X3QSiMrKvm39XfBqXOL4mMHYTK2y7qU5qNw50fTINrWV08QR366+Guaii
   vamnHevjF2B1ll9rlThIPi8mZEj2tsxPVCL5WxWSqLGu9OqtgguaJ1WLI
   c38IcDaMhekbyJFUbX92NZdqYnON5mQGdLdhUmgeaYxEE1TA/ckqWEtk7
   Q==;
X-CSE-ConnectionGUID: ZjEY0MaQSU+ODAcre4z8aw==
X-CSE-MsgGUID: QQEuXC3NR0CokB7+RINOQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="27831882"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; 
   d="scan'208";a="27831882"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 05:54:50 -0700
X-CSE-ConnectionGUID: 21gC6auxR7iXSugTgjheEQ==
X-CSE-MsgGUID: lVgSUNSMRReLO0GG2lM24A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; 
   d="scan'208";a="78333817"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 05:54:46 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t0h4U-00000003GzT-49q1;
	Tue, 15 Oct 2024 15:54:42 +0300
Date: Tue, 15 Oct 2024 15:54:42 +0300
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
Subject: Re: [PATCH v8 7/8] platform/chrome: Introduce device tree hardware
 prober
Message-ID: <Zw5mEv_cnZzPUqII@smile.fi.intel.com>
References: <20241008073430.3992087-1-wenst@chromium.org>
 <20241008073430.3992087-8-wenst@chromium.org>
 <Zwfy6ER6sbr_QxsY@smile.fi.intel.com>
 <ZwfzhsvlPrxMi61j@smile.fi.intel.com>
 <CAGXv+5ED7j49ndT7BaESW8ZL7_mjVUJLM_FWma8Lwkg+Uh3saw@mail.gmail.com>
 <Zwz_Kl7SwfL0ZaAZ@smile.fi.intel.com>
 <CAGXv+5H0Yvt1cwPOim-quT3C+=s9NapnryJhNxs_QW=DAyAycQ@mail.gmail.com>
 <Zw5QzP-5hnHW--F-@smile.fi.intel.com>
 <CAGXv+5FuMjSaUJ+qDrx7Vmr9o5vJ9VW=tss1ezvdJyaZZouHKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5FuMjSaUJ+qDrx7Vmr9o5vJ9VW=tss1ezvdJyaZZouHKw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_055454_261443_7FD17712 
X-CRM114-Status: GOOD (  33.31  )
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

On Tue, Oct 15, 2024 at 08:18:50PM +0800, Chen-Yu Tsai wrote:
> On Tue, Oct 15, 2024 at 7:24 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, Oct 15, 2024 at 02:32:54PM +0800, Chen-Yu Tsai wrote:
> > > On Mon, Oct 14, 2024 at 7:23 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Mon, Oct 14, 2024 at 12:56:20PM +0800, Chen-Yu Tsai wrote:
> > > > > On Thu, Oct 10, 2024 at 11:32 PM Andy Shevchenko
> > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > On Thu, Oct 10, 2024 at 06:29:44PM +0300, Andy Shevchenko wrote:
> > > > > > > On Tue, Oct 08, 2024 at 03:34:26PM +0800, Chen-Yu Tsai wrote:

...

> > > > > > > > +   .cfg = &chromeos_i2c_probe_simple_trackpad_cfg,
> > > > > > >
> > > > > > >       .cfg = DEFINE_I2C_OF_PROBE_CFG(trackpad, i2c_of_probe_simple_ops),
> > > > > > >
> > > > > > > Or even
> > > > > > >
> > > > > > > #define DEFINE_I2C_OF_PROBE_CFG_SIMPLE(_type_)                        \
> > > > > > >       DEFINE_I2C_OF_PROBE_CFG(type, &i2c_of_probe_simple_ops)
> > > > >
> > > > > I'm not inclined on using compound literals here. "simple X cfg" will
> > > > > likely get shared between multiple |chromeos_i2c_probe_data| entries,
> > > > > and AFAIK the toolchain can't merge them. So we would end up with one
> > > > > compound literal per entry, even if their contents are the same.
> > > >
> > > > I'm not sure I follow, you are using compound literal _already_.
> > > > How does my proposal change that?
> > >
> > > I'm using it where it makes sense, i.e. where the embedded variable
> > > is not going to be shared with other instances.
> > >
> > > For the dumb probers, there's only going to be one instance per "type".
> > >
> > > For the simple probers, the config part is still one instance per "type",
> > > but the parameters are board and component specific. There will be
> > > multiple instances. Hence the config part can be shared, while the
> > > parameters likely won't be.
> > >
> > > > > > With that also looking at the above
> > > > > >
> > > > > > #define DEFINE_I2C_OF_PROBE_CFG_NONE(_type_)                            \
> > > > > >         DEFINE_I2C_OF_PROBE_CFG(type, NULL)
> > > > >
> > > > > For the "dumb" case it makes sense though, since it would be one instance
> > > > > per type. But we could go further and just wrap the whole
> > > > > |chromeos_i2c_probe_data| declaration.
> > > >
> > > > Maybe it's too far from now...
> > >
> > > This is what I have:
> > >
> > > #define DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB(_type)
> > >                         \
> > >        static const struct chromeos_i2c_probe_data
> > > chromeos_i2c_probe_dumb_ ## _type = {       \
> >
> > >                .cfg = &(const struct i2c_of_probe_cfg) {
> >
> > But the below is static initializer, why do you need a compound literal here?
> 
> Because .cfg takes a pointer to a struct. It's not an embedded struct.
> The compound literal creates the internal struct, and then its address
> is taken and assigned to the .cfg field.
> 
> Does that make sense?

Okay, I see now. Yeah, I have no preferences here, I saw the code like in split
version or like in yours. I _slightly_ bend to non-compound literal variant,
but again here it might be not worth doing a such.

> > >                         \
> > >                        .type = #_type,
> > >                         \
> > >                },
> > >                         \
> > > };
> > >
> > > DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB(touchscreen);
> >
> > s/dumb/simple/g
> 
> "simple" is taken. This is "dumb" as in it does not need any helpers.
> Maybe "no-op" if you don't like the negative connotation?

_BY_TYPE ?

-- 
With Best Regards,
Andy Shevchenko



