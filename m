Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9448CFC28B
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 11:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZPcCsEHgYk4HW57+OZxVUKQzoA2TKv8a4HdMbEH2Iis=; b=UefoonTBFEljEg33jZYM6AAHt/
	uyxd81OWi/iEJXAYseCtLLDJ8VQWAgIQC7joBl2lUv57I4TVMFJCLNLV3krRCu53YBjkTrdAmCnLI
	D6+0o4K8S/q6ONSnYuhhtm9iYNEa3olYg6hbFyNQ+NX6+sJKCjg95DYyfxTzFFY59dixGr30FqBqQ
	H01Ee7mJ0iW/Xg2gxgZ179X2+e0Qij0nr/IxYfD7Acf+QgaVDV4BrlYlW15RRnpT1nnhCSHu4wIoi
	Bum1DUwXcbYlvZ/i1BcaOzRH4643zMavSno42jCHNpo2aJSkpax7P8M4HFK5rYdQz/P5ko5ZokYpa
	QCQdyH2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0fhV-000000081KT-3s6G;
	Tue, 15 Oct 2024 11:26:53 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0fen-000000080hG-2IcQ;
	Tue, 15 Oct 2024 11:24:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728991446; x=1760527446;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Rdzp13zaH99entWKg0lm1Wx8wDdv6n9NqLsTT0PIeco=;
  b=MwT5rQmz9B6iHZw8HZSQrPO+IOqnfveQjSuLQxfnd2AaxGeEOPvCQm+Y
   DJjH9Mqt5VM0bk04rMqe05gx4s2oldQeztSywUPqx67Ze2B9/sdpdNQQw
   tE3cODxTMjEqizT/du8qURxRtzc58ZSwSxzdmd2njlgKoSgfReMewiojc
   u72h8+pE/IIFbwUm52lUqkyFucNNUlCy2AtMQKS/j7FKXUAzNh2TG4Ajj
   DzrQLB766OCd0yV4ty21ZrJiSjCSMcNwG17u/idw2YxtJ8Enngj0bYQSG
   FbDEEsFUlUgvg5ao3sr6lVK3CCq08CFsyxUJ/FZJD6Jwa133saMvzx+aP
   g==;
X-CSE-ConnectionGUID: gekHEaOUR1uWpXGDrhrRbQ==
X-CSE-MsgGUID: fEMjilrsRGevSCsjSas+ZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="45850678"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="45850678"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 04:24:04 -0700
X-CSE-ConnectionGUID: XjzeGirsRkyt2NS4hd72oA==
X-CSE-MsgGUID: UxyCuKF0TkCwvW1mvnN1dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="77948538"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 04:24:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t0fef-00000003FQr-0uQa;
	Tue, 15 Oct 2024 14:23:57 +0300
Date: Tue, 15 Oct 2024 14:23:56 +0300
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
Message-ID: <Zw5QzP-5hnHW--F-@smile.fi.intel.com>
References: <20241008073430.3992087-1-wenst@chromium.org>
 <20241008073430.3992087-8-wenst@chromium.org>
 <Zwfy6ER6sbr_QxsY@smile.fi.intel.com>
 <ZwfzhsvlPrxMi61j@smile.fi.intel.com>
 <CAGXv+5ED7j49ndT7BaESW8ZL7_mjVUJLM_FWma8Lwkg+Uh3saw@mail.gmail.com>
 <Zwz_Kl7SwfL0ZaAZ@smile.fi.intel.com>
 <CAGXv+5H0Yvt1cwPOim-quT3C+=s9NapnryJhNxs_QW=DAyAycQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5H0Yvt1cwPOim-quT3C+=s9NapnryJhNxs_QW=DAyAycQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_042405_672897_EC8ACA8D 
X-CRM114-Status: GOOD (  26.67  )
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

On Tue, Oct 15, 2024 at 02:32:54PM +0800, Chen-Yu Tsai wrote:
> On Mon, Oct 14, 2024 at 7:23 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Oct 14, 2024 at 12:56:20PM +0800, Chen-Yu Tsai wrote:
> > > On Thu, Oct 10, 2024 at 11:32 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Thu, Oct 10, 2024 at 06:29:44PM +0300, Andy Shevchenko wrote:
> > > > > On Tue, Oct 08, 2024 at 03:34:26PM +0800, Chen-Yu Tsai wrote:

...

> > > > > > +   .cfg = &chromeos_i2c_probe_simple_trackpad_cfg,
> > > > >
> > > > >       .cfg = DEFINE_I2C_OF_PROBE_CFG(trackpad, i2c_of_probe_simple_ops),
> > > > >
> > > > > Or even
> > > > >
> > > > > #define DEFINE_I2C_OF_PROBE_CFG_SIMPLE(_type_)                        \
> > > > >       DEFINE_I2C_OF_PROBE_CFG(type, &i2c_of_probe_simple_ops)
> > >
> > > I'm not inclined on using compound literals here. "simple X cfg" will
> > > likely get shared between multiple |chromeos_i2c_probe_data| entries,
> > > and AFAIK the toolchain can't merge them. So we would end up with one
> > > compound literal per entry, even if their contents are the same.
> >
> > I'm not sure I follow, you are using compound literal _already_.
> > How does my proposal change that?
> 
> I'm using it where it makes sense, i.e. where the embedded variable
> is not going to be shared with other instances.
> 
> For the dumb probers, there's only going to be one instance per "type".
> 
> For the simple probers, the config part is still one instance per "type",
> but the parameters are board and component specific. There will be
> multiple instances. Hence the config part can be shared, while the
> parameters likely won't be.
> 
> > > > With that also looking at the above
> > > >
> > > > #define DEFINE_I2C_OF_PROBE_CFG_NONE(_type_)                            \
> > > >         DEFINE_I2C_OF_PROBE_CFG(type, NULL)
> > >
> > > For the "dumb" case it makes sense though, since it would be one instance
> > > per type. But we could go further and just wrap the whole
> > > |chromeos_i2c_probe_data| declaration.
> >
> > Maybe it's too far from now...
> 
> This is what I have:
> 
> #define DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB(_type)
>                         \
>        static const struct chromeos_i2c_probe_data
> chromeos_i2c_probe_dumb_ ## _type = {       \

>                .cfg = &(const struct i2c_of_probe_cfg) {

But the below is static initializer, why do you need a compound literal here?

>                         \
>                        .type = #_type,
>                         \
>                },
>                         \
> };
> 
> DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB(touchscreen);

s/dumb/simple/g

-- 
With Best Regards,
Andy Shevchenko



