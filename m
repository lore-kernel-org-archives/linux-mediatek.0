Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF4CDEE49BC
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 15:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7nKMv2lKkSrNbC7nOgrLw99B6ICmBbqHj93JDbYt+8A=; b=JYre0kceH/EkASDX+RsqnC/8rN
	gn6gfHhapeGoe3u1Z7Sr43KGXyZqaVI0c6p/ONTcq3NZH+xqQnfToNNRAsBWrFIy9D+mgtk26c76S
	jZFMwKE4obGtGsIOBjegkBDcD55kjxV8is/b5x+RA8xyp9aGJ6q29a1pPEO9ieIEH73xnqnNZcnVV
	oYUnmF9L+S03XZ9TR3XQuZwPhRlHmkYXPiHEHEw9/KHq2C+FzRRqBAkfQiFYTCwYTEwv1mPjSqBDe
	3IvaT7MUNQ63jjYYKS371PmoaQOTlEths72uzcHwMsHq/xdHPWt04pLzAeb/WPS8jiF/Nc9ySUxqC
	r3w2dKSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soOwf-0000000A4oy-04Gr;
	Wed, 11 Sep 2024 15:07:49 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soOVp-00000009yNS-1ua1;
	Wed, 11 Sep 2024 14:40:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726065606; x=1757601606;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=WI2hLbPs3H1pco02BcRwP2QdoYU9cUQafOS5FL+JAdo=;
  b=C8/owVJ8SlVyx2RUGag7KfbV//sLg3YG6EhNRVOyKmK80LwOk61CrBS+
   dxotQvkTyG+Z8fATQ3TZ7oSMsCj2LLPW7Hm9ZIDQNVYUP6bNQlZMTn/i6
   HtsCPuh2yn/0ZZ4zyQBg9G8W2D2FoHNJO20NGS5J+5rJXfc+0zFi72R9G
   sxMx9gXn4HaQ4F9dooK/Ut4sguvOovilRHK2AyzQEr2TMjCMTGYxhFXdt
   6NPDFY+pthtu11kbSyv5Ulvf1xdvsFXHA/5grgv1V04mv4kYv28AfVGTp
   yy3E1qUq8mvfo/DSyaByN5RWO0HlvnIMteVlRqkoJ4lgUwPCe8KITvnV7
   g==;
X-CSE-ConnectionGUID: wrf/qtgcRzGciegdTiCh9w==
X-CSE-MsgGUID: UffNT7dxRl2Bimhp6nnxMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="36258865"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="36258865"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 07:40:04 -0700
X-CSE-ConnectionGUID: /9794G4jTLCwJ1OZgfQhEQ==
X-CSE-MsgGUID: nxrEBEmqRhebid8NxU0tPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="71526680"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 07:40:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1soOVh-00000007aSl-0wzE;
	Wed, 11 Sep 2024 17:39:57 +0300
Date: Wed, 11 Sep 2024 17:39:56 +0300
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
Subject: Re: [PATCH v6 06/12] gpiolib: Add gpio_get_property_name_length()
Message-ID: <ZuGrvIb_kZpiA9QC@smile.fi.intel.com>
References: <20240904090016.2841572-1-wenst@chromium.org>
 <20240904090016.2841572-7-wenst@chromium.org>
 <ZthjSK9N9z11YXi2@smile.fi.intel.com>
 <CAGXv+5GrW0EZZw6HVY7ALvm0dBj5Wwrvp02vtTPZYwqxxiZQyg@mail.gmail.com>
 <CAGXv+5Hrz2rA1_eAY8S96ankeWS4wr9EX-hr1LUY5JGx=FoNPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5Hrz2rA1_eAY8S96ankeWS4wr9EX-hr1LUY5JGx=FoNPQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_074005_646617_31CCB92E 
X-CRM114-Status: GOOD (  23.55  )
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

On Wed, Sep 11, 2024 at 03:37:35PM +0800, Chen-Yu Tsai wrote:
> On Mon, Sep 9, 2024 at 10:45 AM Chen-Yu Tsai <wenst@chromium.org> wrote:
> > On Wed, Sep 4, 2024 at 9:40 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Wed, Sep 04, 2024 at 05:00:08PM +0800, Chen-Yu Tsai wrote:

...

> > > > +/**
> > > > + * gpio_get_property_name_length - Returns the GPIO name length from a property name
> > > > + * @propname:        name of the property to check
> > > > + *
> > > > + * This function checks if the given property name matches the GPIO property
> > > > + * patterns, and returns the length of the name of the GPIO. The pattern is
> > > > + * "*-<GPIO suffix>" or just "<GPIO suffix>".
> > > > + *
> > > > + * Returns:
> > > > + * The length of the string before '-<GPIO suffix>' if it matches
> > > > + * "*-<GPIO suffix>", or 0 if no name part, just the suffix, or
> > > > + * -EINVAL if the string doesn't match the pattern.
> > >
> > > Should be %-EINVAL as we agreed with Bart when I updated GPIOLIB kernel-doc.
> >
> > Ack.
> >
> > In the regulator cleanups I did, I used -%EINVAL instead. But then I
> > realized that constants aren't really cross-referenced. I probably
> > have to go through all of them to fix those up.
> 
> FTR this patch ended up getting dropped from the series as it was no
> longer needed.

That's great news!

> However if folks think there is still value in this patch,
> I can still send a new version.

Not for me, thanks.

-- 
With Best Regards,
Andy Shevchenko



