Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 590B3EE49BC
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 15:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4uPYv/UEkgTJLjv21tu/ZbXaq9KM/3P7L+XJMJ/TrbA=; b=1yBvA718SN8L38+eSkzNPEbP3F
	wyvychiQrkOkEGShjp7pD0kesCHoo5rzbyPNPBdgJs0iTAScOCXFZ19BDLDjxWZqm8gRFwnG3Sis0
	DZJhaR9VHq0UmhjaFQgOOv+0oGANMDYnTvnOVwvKt2P7maEbJ7Uw/IysUCf9rjULsmrkl/CLkcEW3
	MuIjunEVsHK07QgAyd8mtv3QQPm9I9pwBE6/ebWPbCnHRPWz0Uuj1ZFEEDeUnruks3Ua8LLU6A91+
	FGIpr3CU0dYr1eHpz9Um5YCv4npVpr2P3Q0HW2Wsc7c300zAikrQifM0AQSZ0ErBuYl+bTP6fSoaH
	cfGQP2+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soOud-0000000A4SY-3wYr;
	Wed, 11 Sep 2024 15:05:43 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soOUK-00000009xy2-3e9g;
	Wed, 11 Sep 2024 14:38:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726065513; x=1757601513;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Ldou9neFantEFPxbcntEHkUQuwTXsLxrT82B9jmiQRQ=;
  b=KNna4wkB95o/T+pKEXlhF1PvebgUl1d5nWmKZBB4c7/as+R8qPMpfi7S
   H+eoB3aLxhTu1w1fYRw19LNv2dkGkRJapGqF1NJEmFso2aaWB9qjDWLmX
   aPhgdMslqskmlDnkBLDCk0331R4S6YVahwMk5e07KKCvD0BdPLNqsxxFU
   bcRtqJmXnTcJbBdQTvc+azQm3oitxgSPd77CCXBzTtVetluJYTvm323P/
   XlIwL8aaaf7+1vE8hF0XigpNM8rsfXqdYYZXYGQwSj6qDsDGYyNUlCovm
   2tsNA4zoyX/9frP+sTD8iLhNc40REIlO3xZGofIq4uyj13qNHoQQ73D1O
   Q==;
X-CSE-ConnectionGUID: Fo3gA7tRQcKtZaZ+hqWiKA==
X-CSE-MsgGUID: ZPsYrL0mQdmwOFhZx5meDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="13471809"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="13471809"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 07:38:31 -0700
X-CSE-ConnectionGUID: 7GtiYkmyQSWRX5R/5DaXQg==
X-CSE-MsgGUID: 163BAyl5TAGhVuMw3BSEKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="67230388"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 07:38:27 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1soOUB-00000007aR0-3IeT;
	Wed, 11 Sep 2024 17:38:23 +0300
Date: Wed, 11 Sep 2024 17:38:23 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v6 09/12] i2c: of-prober: Add regulator support
Message-ID: <ZuGrX67LzMe9S6ce@smile.fi.intel.com>
References: <20240904090016.2841572-1-wenst@chromium.org>
 <20240904090016.2841572-10-wenst@chromium.org>
 <CAD=FV=UGOz3Xzg7reJKP=tA1LqTxszv5w-CL9krmoXQtXdJLaQ@mail.gmail.com>
 <CAGXv+5F27K76t=ht5v75jKsNF-J+C0r5+m=czHz6PtV3t5DxcQ@mail.gmail.com>
 <CAD=FV=XVrAdQN8p9QJtt3Ah_YQAG7Y-D4wDx8_+qb1EGN7+Uig@mail.gmail.com>
 <CAGXv+5HO=POHNL_tQHCsy+8=a0gPLMDVHcWMguferahVU+BnZA@mail.gmail.com>
 <CAD=FV=U2yDGv74GQWRQuHN9sjdY5iThqpH-br-jYXMkV1cujEg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=U2yDGv74GQWRQuHN9sjdY5iThqpH-br-jYXMkV1cujEg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_073832_991205_E0FC2323 
X-CRM114-Status: GOOD (  29.56  )
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

On Tue, Sep 10, 2024 at 05:30:07PM -0700, Doug Anderson wrote:
> On Thu, Sep 5, 2024 at 8:45 PM Chen-Yu Tsai <wenst@chromium.org> wrote:

...

> > At least for the stuff that we have (touchscreens and trackpads) such
> > registers typically don't exist, unless it's an HID-over-I2C device,
> > in which case there's the standard HID descriptor at some address.
> > But, yeah, reading the HID descriptor was the use case I had in mind.
> >
> > At least for one Chromebooks it's a bit more tricky because that one
> > HID-over-I2C component shares the same address as a non-HID one. We
> > currently have different SKU IDs and thus different device trees for
> > them, but we could make the prober work with this. It just has be able
> > to tell if the component it's currently probing needs the special
> > prober and is it responding correctly. This bit I need to think about.
> 
> I guess Mark Brown also thought that there wouldn't be some magic
> register, but my gut still tells me that most i2c devices have some
> way to confirm that they are what you expect even if it's not an
> official "vendor" or "version" register. Some type of predictable
> register at a predictable location that you could use, at least if you
> knew all of the options that someone might stuff.

"most" is way too optimistic to say, I believe that not even close to majority
of I²C target devices they are not reliably discoverable.

That's the downside of non-discoverable busses like I²C. Maybe I³C has
a mechanism for that, but I am not an expert, just wondering.

> For instance, in elan trackpads you can see elan_i2c_get_product_id().
> That just reads a location (ETP_I2C_UNIQUEID_CMD = 0x0101) that could
> theoretically be used to figure out (maybe in conjunction with other
> registers) that it's an elan trackpad instead of an i2c-hid one. You'd
> have to (of course) confirm that an i2c-hid device wouldn't somehow
> return back data from this read that made it look like an elan
> trackpad, but it feels like there ought to be some way to figure it
> out with a few i2c register reads.
> 
> ...that being said, I guess my original assertion that you might be
> able to figure out with a simple register read was naive and you'd
> actually need a function (maybe as a callback) to figure this out.

-- 
With Best Regards,
Andy Shevchenko



