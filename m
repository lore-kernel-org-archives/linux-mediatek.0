Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 183DEC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 10:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CNWlvMxbMREsMn4axI9wrFWLgVnpFum7lphYKOpXozY=; b=zbfSZOG2HcbuE2
	xtIQSAOgTDpwGqX/zALaKL50hqZygSkabJQ1r2DMk9DjSCjp2KDkP8zm1Jn2F7CLm8bOujYo8UvJm
	8QHNTVJh2EJVc3WGxX5HIoPtvXf5VcNtVKBixv5y+XUPhE0w3Y/F3lF+yMCsMNvTObu/J0CbfDIov
	Spc3Xi8xzaqRtOf58Hzv/qcNFmF2dQuX8UA13y2r6xCLItelNARb6qL4MDIPV0ofw63U+ag+eLXjY
	15Ik0HVYbi/nsfoZoScUolP2297CgMFi1aCXhLx4V4c4ThuyRPSmegmXmuvSSnp7ghpsQ7ZIxURE8
	y3VDCcvi/b1ZHAoc1Dxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7xfZ-005WSY-Vh; Thu, 13 Jan 2022 10:49:25 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7xfN-005WOe-OA; Thu, 13 Jan 2022 10:49:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642070953; x=1673606953;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UTYhz+JLVLGh52BwP1c/i/glpIIbyehr0ElDLiBRGfE=;
 b=N7ehVD3OVNtNd2u/wPc5RpAvWtWARGUSiYAdYeCNWBsnL8AAWsLXNJXC
 V5TB5S5aKpq40jk+7ebBVW2zYJtNag6xIp2oXrJJ5zhyGQ5IiCQscuwwh
 XwHV8C5whEho9NXHfMThvzZ5ky26K7ygv4oQcwIcFNqaXUHF5YsN0IEV9
 lB5T/LohROQ9JdQ3YpLaMT3TSZEBCxAIAxPLe5Y2nkI3cLwXi0RqoE5eH
 idYsJPiOP3qJGaHcqpxeX8uPgjc+seX1mwn6W/Z6Enn6D4QQUrd8XbAFY
 Imh68lrbTiyhPt1OtPDAbNgu8aIvzGECdQqzjEhG4alKOL6W4sbliQf08 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="268334516"
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; d="scan'208";a="268334516"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 02:49:12 -0800
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; d="scan'208";a="593310113"
Received: from smile.fi.intel.com ([10.237.72.61])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 02:49:07 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1n7xe5-00A9zW-RM; Thu, 13 Jan 2022 12:47:53 +0200
Date: Thu, 13 Jan 2022 12:47:53 +0200
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
Message-ID: <YeADWXPGPW253ssR@smile.fi.intel.com>
References: <20220111014046.5864-1-axe.yang@mediatek.com>
 <20220111014046.5864-4-axe.yang@mediatek.com>
 <Yd1uJ+dX2CTEJfYY@smile.fi.intel.com>
 <83670f12a4eda1d8aecde3c0bf225642106d1267.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <83670f12a4eda1d8aecde3c0bf225642106d1267.camel@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_024913_853189_0B18BACB 
X-CRM114-Status: GOOD (  17.24  )
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

On Thu, Jan 13, 2022 at 03:58:52PM +0800, Axe Yang wrote:

> But for the comment for 'dev_dbg', can you explain more about that?

Sure.

> On Tue, 2022-01-11 at 13:46 +0200, Andy Shevchenko wrote:
> > On Tue, Jan 11, 2022 at 09:40:46AM +0800, Axe Yang wrote:

...

> > > +		host->pins_eint = pinctrl_lookup_state(host->pinctrl,
> > > "state_eint");
> > > +		if (IS_ERR(host->pins_eint)) {
> > > +			dev_dbg(&pdev->dev, "Cannot find pinctrl
> > > eint!\n");
> > 
> > In debug mode of pin control this will bring a duplicate message.
> 
> Can you explain more about this comment?
> I don't understand what the 'duplicate message' refers for.

Have you chance to read the implementation of pinctrl_lookup_state()?

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
