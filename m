Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B15C4332F
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Dec 2022 20:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2eS92BCMwaSmxPrvin+FpfaZxgHzkJe1FAlftJr4tOs=; b=xsOsKUzg2jWoh8FUU0qnrN/x7W
	g6SY75he7v9GMqK/HRpvhJLTJ3Re8PJ4iLlo7ka+M1d+WTVBcio69b0RYaspO8wz3SA91T43Jvk4y
	WRSaqezkhl4sz/zDvgHIvGZzjWwSFuq4shB6rbAHQN1LVWiQTnH80wleC099qNWXv47M+jP2TzuRM
	S+hyY7/KyF0WFb+wwzmvdxBuhP3Ps6Qg5u7uYKNGTA8/GjLlupq8laHjtnH80bCr2YmDGsndH1hEp
	I2onXTPt5HfdQ8y18VUlnT1FtjxlKnnr17mxkYMpXjC/vLiN/6FKqPvRXzv32360RQdbRG0i7I4X9
	XppA6dwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p46uf-005Li5-O4; Sat, 10 Dec 2022 20:57:37 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p46uT-005LaT-0L; Sat, 10 Dec 2022 20:57:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670705845; x=1702241845;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=8tRXcUKxGagfde91ZdUSDF88p8/b8+3NQn8nn2kaumc=;
  b=Z8FRauK1i0+pKl0yATc+E/NGcYNXoq/grKMGZ8aBNhcj2zQBZviMwQvM
   JKTKkydjjrfdd88qIDhnFhVWVD6hX38j3rzs3dvmQRFNEvpUbds5gNfHv
   QVoSZ/MC8o/OOOEYRXDl6/PYdXxqqcyJKpADPlHEvs40Z2ioban1YAGOp
   QLuYd0SApjC2GQ8k1H9kKgfUf06LbHlziSQ1WNXpANEyxupG23qcznL7s
   ME80wd5FoowGzUAyWZgwH6UNrnXM25SvbjOHS8+yjqM7G7rQwsBc7YnZq
   lomfMZNbAAvmVC3CRS3ByThlCbc82bwu/kh1l5VLRNo3RZZFMPVrugfzx
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10557"; a="315286168"
X-IronPort-AV: E=Sophos;i="5.96,235,1665471600"; 
   d="scan'208";a="315286168"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2022 12:57:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10557"; a="678489946"
X-IronPort-AV: E=Sophos;i="5.96,234,1665471600"; 
   d="scan'208";a="678489946"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 10 Dec 2022 12:57:18 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1p46uK-007g2g-33;
	Sat, 10 Dec 2022 22:57:16 +0200
Date: Sat, 10 Dec 2022 22:57:16 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-pwm@vger.kernel.org,
	linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev, linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 00/11] pwm: Allow .get_state to fail
Message-ID: <Y5TyrO5maz5VYic3@smile.fi.intel.com>
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
 <Y5OtCjQOQjjltGPa@smile.fi.intel.com>
 <20221210091833.vdfir63nq4kpj5cm@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221210091833.vdfir63nq4kpj5cm@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221210_125725_103248_1B20FD6E 
X-CRM114-Status: GOOD (  12.70  )
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

On Sat, Dec 10, 2022 at 10:18:33AM +0100, Uwe Kleine-König wrote:
> On Fri, Dec 09, 2022 at 11:47:54PM +0200, Andy Shevchenko wrote:
> > On Wed, Nov 30, 2022 at 04:21:37PM +0100, Uwe Kleine-König wrote:

...

> > I'm wondering why we didn't see a compiler warning about mistyped function
> > prototypes in some drivers.
> 
> I don't understand where you expected a warning. Care to elaborate?

intel-lpss.c has the prototype that returns an int. IIRC it was like this
before your patches. Now the above wondering passage...

-- 
With Best Regards,
Andy Shevchenko



