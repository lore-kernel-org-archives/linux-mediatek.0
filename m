Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A4AC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 13:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PU8iLDDA+m/cUqp7DVCuVVqtb4tzbKYIvnDaDCswBMc=; b=XBq8ePbjj9L1hX
	yrU+lCyKxDlqXGdyV1G8dM2s4wnsXSbkhXTAmPoyj4KCwHqve7T5Q9Pu6x2uWeBTecJEyKVxkBHe7
	7gH9hllMdyuPhKoncMgJS/23mg3NWeBg74xbc4J/izmwfxrtG0V2dhqq16c8bsDmPeuJHVb7sjC9c
	/mXld0WXG9I6/5dJKR6JTHwnECDJMW26IqcLBiCecaHLPhNPItn+iShoSzcgprlCUy3sdVg4LKAel
	HWDgIiYtmJtGiGfFITWoXXpZOfUGK6AF+Xg8p2+Nl2GhJnVUmgCAg+z8lYyES1xY9TdbejXHdy+cU
	thOJK6tYM+pMrbEkKgPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8Mow-009ENJ-HM; Fri, 14 Jan 2022 13:40:46 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8Moi-009EJc-Uq; Fri, 14 Jan 2022 13:40:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642167632; x=1673703632;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=POdeD4+1G0JKY0mLHWhbQ3GjB8ZbNAHvQrtkU1zviNg=;
 b=KxxnBzWjLxD4x/MqI916eAtVBZyNZ/YP9HvKyV3EHY8EGKJAaJl4B4xu
 qpt/x+QKKH2GvKcZvxNb2H+A73kEsCgOQf/Kjt82Nv6+Q76/79K1uTV87
 grmUqU1SwpdrYasJR2DV6nHX4wy1NQV/Vbbe9ERQaADnri4IStuZKrl6f
 U1Wr28VT/PY5Z9x8ohFl3oAh+mYnnfnIZqR7xEG2QxAizBjWy2QzIFuPB
 wA/cTUTYSDN07T+N7IWHuFlD/oFxH46Q/z1qHGOYBG79ocaER5sWIHkPX
 YpeEgzRi4GRHiA0JVmgZCsZakv9byWRzKRr/WzFaaWd/4q1yBDwnqCSvk w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10226"; a="330594782"
X-IronPort-AV: E=Sophos;i="5.88,288,1635231600"; d="scan'208";a="330594782"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2022 05:40:32 -0800
X-IronPort-AV: E=Sophos;i="5.88,288,1635231600"; d="scan'208";a="614341875"
Received: from smile.fi.intel.com ([10.237.72.61])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2022 05:40:27 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1n8Mn4-00AcqY-Hh; Fri, 14 Jan 2022 15:38:50 +0200
Date: Fri, 14 Jan 2022 15:38:27 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Axe Yang <axe.yang@mediatek.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Satya Tangirala <satyat@google.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Lucas Stach <dev@lynxeye.de>, Eric Biggers <ebiggers@google.com>,
 Andrew Jeffery <andrew@aj.id.au>, Stephen Boyd <swboyd@chromium.org>,
 Kiwoong Kim <kwmad.kim@samsung.com>, Yue Hu <huyue2@yulong.com>,
 Tian Tao <tiantao6@hisilicon.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 3/3] mmc: mediatek: add support for SDIO eint irq
Message-ID: <YeF806Ucigo5vWmx@smile.fi.intel.com>
References: <20220111014046.5864-1-axe.yang@mediatek.com>
 <20220111014046.5864-4-axe.yang@mediatek.com>
 <Yd1uJ+dX2CTEJfYY@smile.fi.intel.com>
 <83670f12a4eda1d8aecde3c0bf225642106d1267.camel@mediatek.com>
 <YeADWXPGPW253ssR@smile.fi.intel.com>
 <52901ebe0db555f8e58dc0d59cfd703c5a0fc2de.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <52901ebe0db555f8e58dc0d59cfd703c5a0fc2de.camel@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_054033_056876_5A789218 
X-CRM114-Status: GOOD (  21.28  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jan 14, 2022 at 11:06:36AM +0800, Axe Yang wrote:
> On Thu, 2022-01-13 at 12:47 +0200, Andy Shevchenko wrote:
> > On Thu, Jan 13, 2022 at 03:58:52PM +0800, Axe Yang wrote:
> > > On Tue, 2022-01-11 at 13:46 +0200, Andy Shevchenko wrote:
> > > > On Tue, Jan 11, 2022 at 09:40:46AM +0800, Axe Yang wrote:

...

> > > > > +		host->pins_eint = pinctrl_lookup_state(host-
> > > > > >pinctrl,
> > > > > "state_eint");
> > > > > +		if (IS_ERR(host->pins_eint)) {
> > > > > +			dev_dbg(&pdev->dev, "Cannot find
> > > > > pinctrl
> > > > > eint!\n");
> > > > 
> > > > In debug mode of pin control this will bring a duplicate message.
> > > 
> > > Can you explain more about this comment?
> > > I don't understand what the 'duplicate message' refers for.
> > 
> > Have you chance to read the implementation of pinctrl_lookup_state()?
> 
> I have read pinctrl_lookup_state(), and if the 'duplicate message' you
> were talking about is 'using pinctrl dummy state...':
> 
> https://elixir.bootlin.com/linux/latest/source/drivers/pinctrl/core.c#L1214
> No, this message will not appear in debug mode if pins_eint not found
> because pinctrl_dummy_state is always FALSE. MTK Soc do not need dummy
> state support.

I see, thanks for explanation. I'm wondering how good or bad would be
the idea of adding a debug message on the !pinctrl_dummy_state case.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
