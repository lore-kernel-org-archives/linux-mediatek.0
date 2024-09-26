Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8199EC369CD
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 12:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tUzzN+6jxlOWBnd7eoe1z+PaNIecleWQ0OvOtpoRjmM=; b=xZ3ChF7S9t7Ks8IrqVfO3i2Lb2
	IFR6IxKXgQ/3W+h3gWql/36gpp+rGv9RsBgJaTnYtQbX7rMomW9OwxvmKeQ0MJ2ufaK3v5e8esT4b
	uezMNVQ09lgrS8sXebSb6vpIXLinhmfUF+Wyk7qi1NEr+FHtG6LC59CJU16LLJpX2gaIIU7hAvmkM
	KBykQ6sGiWBXUExW8f2QwVNFrCw1TS/0/CDO96EX7/fDdu4RREnUgvPd6R7QL3LxSkBkhuiEPlwED
	TmqVnEP11e+DtxxLCzRrUNYoyPnF8k6kyjlH1w0PRzUBz4Haqy9OFNsYENoO7YO3h0onz8RBYiOoH
	srrTqmkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stnaw-00000008LDU-15Dl;
	Thu, 26 Sep 2024 12:27:42 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stnZj-00000008L3t-3SKt;
	Thu, 26 Sep 2024 12:26:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727353587; x=1758889587;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=rjxzLjusFV53fgrI0naeYMyM31w0t57thRWG/vxGG3Y=;
  b=bvOJGYXgsED5A4iL87jGy1PTqQdypaTxrs1jK5r24dqqHh3g60zuX81q
   a8h2UXR4HGV7c266LXa2+4/ZkcdL2g+t8Z27Z+BzsPweuiyPAX2MslDZ0
   yCjzA6zmtT6P/M/cBE2ig/RwMurzEnMd9OrsN2lfD8HWajBQpzH0b2lnw
   tSkRhkNvdlcCeCPb8x+niIdNtU2vPlTtBfHjqt2G6LFzdPvkRAlfWTcft
   vRKS1mufXySYeDZ77atNZYn8USIpaIHfh1S1zf0MtMal2gHHC5K4M6/GF
   CY/v5za1Orvr6CrcxXsd0T6+H0npLU45+9doMtwOwSidpWNM22PhdQA0S
   g==;
X-CSE-ConnectionGUID: LzlRC0GwQUmzYU3vpi2HDg==
X-CSE-MsgGUID: vFQ1Ezk9Qm2XM14qfHTQ4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26257352"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; 
   d="scan'208";a="26257352"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 05:26:26 -0700
X-CSE-ConnectionGUID: IHjgVfp/QfGwRQ/D1hWGVg==
X-CSE-MsgGUID: hU7dHfB0Rr2PbmeyHeqmgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; 
   d="scan'208";a="72439183"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 05:26:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1stnZc-0000000DC1D-1rRn;
	Thu, 26 Sep 2024 15:26:20 +0300
Date: Thu, 26 Sep 2024 15:26:20 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v8 2/3] regulator: Add devres version of
 of_regulator_get_optional()
Message-ID: <ZvVS7ITg2t-RIh8C@smile.fi.intel.com>
References: <20240925093807.1026949-1-wenst@chromium.org>
 <20240925093807.1026949-3-wenst@chromium.org>
 <ZvPscRdWlFPmtCyR@smile.fi.intel.com>
 <CAGXv+5Gf9+rc+vLcr-JFhO561G8dw38ksV3drat+DyCfWEVakQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5Gf9+rc+vLcr-JFhO561G8dw38ksV3drat+DyCfWEVakQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_052627_931328_56A0E761 
X-CRM114-Status: GOOD (  31.50  )
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

On Thu, Sep 26, 2024 at 04:43:52PM +0800, Chen-Yu Tsai wrote:
> On Wed, Sep 25, 2024 at 6:56 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Wed, Sep 25, 2024 at 05:38:05PM +0800, Chen-Yu Tsai wrote:

...

> > > +#if IS_ENABLED(CONFIG_OF)
> >
> > Do we really need this?
> 
> What's the point of going through devres_* stuff if we already know
> _of_regulator_get() is going to fail anyway?

With devm_add_action*() this will be other way around and there are plenty of
APIs done this way. The ifdeffery is simply ugly in the code.

> Also, _of_regulator_get() does not have a stub version for !CONFIG_OF.

So, what prevents us from adding it?

> > > +static struct regulator *_devm_of_regulator_get(struct device *dev, struct device_node *node,
> > > +                                             const char *id, int get_type)
> > > +{
> > > +     struct regulator **ptr, *regulator;
> > > +
> > > +     ptr = devres_alloc(devm_regulator_release, sizeof(*ptr), GFP_KERNEL);
> > > +     if (!ptr)
> > > +             return ERR_PTR(-ENOMEM);
> > > +
> > > +     regulator = _of_regulator_get(dev, node, id, get_type);
> > > +     if (!IS_ERR(regulator)) {
> > > +             *ptr = regulator;
> > > +             devres_add(dev, ptr);
> > > +     } else {
> > > +             devres_free(ptr);
> > > +     }
> > > +
> > > +     return regulator;
> >
> > Why not using devm_add_action() / devm_add_action_or_reset()
> > (whichever suits better here)?
> 
> Cargo cult from _devm_regulator_get() in this file. However since this is
> meant to share the same release function, both functions need to use the
> same mechanism.
> 
> I could also argue that this is not an action, but an allocation, and so
> devres_alloc() seems to make more sense.

It's rather matter of the naming of the devm_add_action*() APIs, but again,
we have plenty of APIs using it when it's allocation and not strictly speaking
an action.

> > > +}
> >
> > > +#endif

...

> > > +static inline struct regulator *__must_check devm_of_regulator_get_optional(struct device *dev,
> > > +                                                                         struct device_node *node,
> > > +                                                                         const char *id)
> >
> > I don't know the conventions here, but I find better to have it as
> >
> > static inline __must_check struct regulator *
> > devm_of_regulator_get_optional(struct device *dev, struct device_node *node, const char *id)
> >
> > Similar to other stubs and declarations.
> 
> I don't think there are any conventions. This file already has three types:
> 
> 1. Wrap the line with the function name on the second line
> 2. Wrap the arguments; wrapped arguments aligned to the left parenthesis.
> 3. Wrap the arguments; wrapped arguments aligned with aribtrary number of
>    tabs.
> 
> I prefer the way I have put them.

The way you put it despite relaxed limit is slightly harder to read.
I don't remember many headers that do so-o indented parameters. Besides
your way defers the burden of resplit to the future in case one more parameter
needs to be added which will excess the 100 limit.

Also __must_check is somehow misplaced in my opinion (talking from my
experience and this can be simply checked by grepping other headers).

That said, I prefer the way I suggested or something alike.

-- 
With Best Regards,
Andy Shevchenko



