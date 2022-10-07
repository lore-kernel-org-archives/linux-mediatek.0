Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6FA9C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Oct 2022 09:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WPdNUPQIbyzCDHptPhLZjzwPgPWTVb2ay1+lXqB7L74=; b=xO+ju87FJL/3hkVlfr2vb8QUSR
	FW/NowcLare/KiW0XcMxiPZDBEfDa7TQdZ87Z4L0hoerS6jGq9DHfYUeIquJTlvAxGmAtahBnx4WA
	od/FIjF//5Xxfocxv0do4DuUxCP7XaWytRXaiBTuy/3ZCdbUDoN2IPwuB1IcEW7wP2GXQICI0sOEA
	+Y4SXLTVyBm6QkY+xPmCQM3exX0pLKv6EvKypNlIjT7C4TBxWYRgHkUk/8ZCmu7UomOdQ1lsoS3s4
	W3WQSxPQ18bfVy2HU2dSS2H517Veku0dh9Ni2263CYChnqnhO4xMLDfIRoHR3vQrW8KqxYKeQy/cx
	QtLEymzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogjW6-008H04-LK; Fri, 07 Oct 2022 09:19:38 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogjVv-008Gx8-JM; Fri, 07 Oct 2022 09:19:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665134367; x=1696670367;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hoHyGOlZw7mT9PchNcyohGTzSrqH9AYZczrdE0VAU4M=;
  b=ZQi5L7JuW6PZWD4jHniZwJBkhVntKSsn0zE4I9Tgs/KtY5TMFx+Zs1Uv
   9QmHNuCH2QhOcSTsZCRdhlNJ6/Er0X1NStIm8Lsi6V+0oTtaefFnZPtJ3
   6V0qqVEFwpF+/l6n1PlQWnlqUZwpylLKzGvnV115UBJuJtyQla14DkAdg
   4CAwUKTTZmMsolakdks0T20mjK10fiX7pvXs0WOcwOBvwjHW0Ov0FvtAp
   udgJ7VglVLiLCkt6NON2abcxFk7fnIgPEiEYhtpNLxIGct3oT3CePpU62
   YqmuA+tDUraMokryfGd65W7LNQJoay+8jbAucyPb19LH4lBnYyPfzQoi+
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="304693023"
X-IronPort-AV: E=Sophos;i="5.95,166,1661842800"; 
   d="scan'208";a="304693023"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2022 02:19:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="620197894"
X-IronPort-AV: E=Sophos;i="5.95,166,1661842800"; 
   d="scan'208";a="620197894"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 07 Oct 2022 02:19:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ogjVm-003Xxs-1k;
	Fri, 07 Oct 2022 12:19:18 +0300
Date: Fri, 7 Oct 2022 12:19:18 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com, jic23@kernel.org, lars@metafoo.de,
	chiaen_wu@richtek.com, alice_chen@richtek.com, cy_huang@richtek.com,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, szunichen@gmail.com
Subject: Re: [PATCH v13 5/5] leds: flash: mt6370: Add MediaTek MT6370
 flashlight support
Message-ID: <Yz/vFml0mwaF0+f9@smile.fi.intel.com>
References: <cover.1664991040.git.chiaen_wu@richtek.com>
 <1bcd19dbd09650ddac7b96b0fe2932698be2731e.1664991040.git.chiaen_wu@richtek.com>
 <Yz11bkxz9lK4wOHE@smile.fi.intel.com>
 <CABtFH5J2r=Qq1kNb=yp6Hf7=oKJH9qeiwsO+4ejy5m9N+ZODXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABtFH5J2r=Qq1kNb=yp6Hf7=oKJH9qeiwsO+4ejy5m9N+ZODXg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_021927_715698_59A00615 
X-CRM114-Status: GOOD (  13.16  )
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

On Fri, Oct 07, 2022 at 09:28:17AM +0800, ChiaEn Wu wrote:
> On Wed, Oct 5, 2022 at 8:15 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:

...

> > > +config LEDS_MT6370_FLASH
> > > +     tristate "Flash LED Support for MediaTek MT6370 PMIC"
> >
> > > +     depends on LEDS_CLASS && OF
> >
> > Why do you have OF dependency?
> >
> 
> Hi Andy,
> The original idea is to use the "fwnode_property_*" related function.
> But this side may only consider just "Build Pass" (?)

Yes, you increase a compile test coverage by dropping that dependency.

> I will remove "OF" in the v14 patch.

-- 
With Best Regards,
Andy Shevchenko



