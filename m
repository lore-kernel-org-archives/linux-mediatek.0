Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7547C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 18:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ae0GCzWz/tz/YXfNIJwpqtPzWDipXmA2r5LKcC8kBFw=; b=J8+XXzGx7qSY4jvxTHEWVA4J6c
	yCDyBgIYTHmk7WaXewLKQRuvrYPNNTQv2IG+pjWdGsTsUycN4X7gQrvwcEfQ/je6PQ1jZcDaJWEHc
	fA3dfvq1lgKMUFuIqt3PC37XISP7LvKFZ1x2XGt5DtUdKYZeMbxM1jh8Kl6HjMY798FhkKDrNKFJ4
	oaxQNlmqMb082v9F3pCgKoD56rworUyhfgMAtuATyeK/WnhpFJOGv4/NajS3vQsWWRg7X5ashXSUl
	OqB6G+6lDSq97fsAOX82nLDRn1q9GVkvZjliqxcU3a6e3L3eiKfYXHgeXBJByO7F2Ij6BuN1hHrEE
	8sW1axrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDVix-00059u-5p; Mon, 18 Jul 2022 18:44:07 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDVil-00055G-IH; Mon, 18 Jul 2022 18:43:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658169835; x=1689705835;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KdBF4yjrLuXbz/OvgsIOnMxdr8dPb/kuNCRv0XTho8U=;
  b=kV8pICTOgyGh+jxNQPcDe4w+H0Lt6eUdfZdmMJBq1j4HF2KUpLlFKyRF
   D59+uNyzraypA2kzbhVkmpHIpcW+DY3RAN93fohrK+GCyNqM971ELwmDd
   ycRxclspNIGPJPQc/FBvAZo68xcEGpRIHW4DapSJR6CJTpboK/PkFJoMK
   jG9vMNabQvQu+MYWMuXd+sJNyakstH1x4HlNrD6m3PpEvLMBxfXbgMSIY
   oI1i21x3kszqV3gKookL01rK7yHLPZgXqoDLrMFkT8crq9mxtAeC2DoJ/
   y4wm3D+SFJlQHqtg12d179NgrFE2iJdU1pinjpt4LlQuO9ZrRB3UTekO3
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="266699797"
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; 
   d="scan'208";a="266699797"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2022 11:43:53 -0700
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; 
   d="scan'208";a="843374513"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2022 11:43:46 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1oDViY-001OOO-0R;
	Mon, 18 Jul 2022 21:43:42 +0300
Date: Mon, 18 Jul 2022 21:43:41 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alvin __ipraga <alsi@bang-olufsen.dk>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Daniel Scally <djrscally@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	George McCollister <george.mccollister@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sean Wang <sean.wang@mediatek.com>, UNGLinuxDriver@microchip.com,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Subject: Re: [PATCH net-next 2/6] software node: allow named software node to
 be created
Message-ID: <YtWp3WkpCtfe559l@smile.fi.intel.com>
References: <YtGPO5SkMZfN8b/s@shell.armlinux.org.uk>
 <E1oCNky-006e3g-KA@rmk-PC.armlinux.org.uk>
 <YtHGwz4v7VWKhIXG@smile.fi.intel.com>
 <20220715201715.foea4rifegmnti46@skbuf>
 <YtHPJNpcN4vNfgT6@smile.fi.intel.com>
 <20220715204841.pwhvnue2atrkc2fx@skbuf>
 <YtVSQI5VHtCOTCHc@smile.fi.intel.com>
 <YtVfppMtW77ICyC5@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtVfppMtW77ICyC5@shell.armlinux.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_114355_678795_517138D9 
X-CRM114-Status: GOOD (  26.56  )
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

On Mon, Jul 18, 2022 at 02:27:02PM +0100, Russell King (Oracle) wrote:
> On Mon, Jul 18, 2022 at 03:29:52PM +0300, Andy Shevchenko wrote:
> > On Fri, Jul 15, 2022 at 11:48:41PM +0300, Vladimir Oltean wrote:
> > > So won't kobject_init_and_add() fail on namespace collision? Is it the
> > > problem that it's going to fail, or that it's not trivial to statically
> > > determine whether it'll fail?
> > > 
> > > Sorry, but I don't see something actionable about this.
> > 
> > I'm talking about validation before a runtime. But if you think that is fine,
> > let's fail it at runtime, okay, and consume more backtraces in the future.
> 
> Is there any sane way to do validation of this namespace before
> runtime?

For statically compiled, I think we can do it (to some extent).
Currently only three drivers, if I'm not mistaken, define software nodes with
names. It's easy to check that their node names are unique.

When you allow such an API then we might have tracebacks (from sysfs) bout name
collisions. Not that is something new to kernel (we have seen many of a kind),
but I prefer, if possible, to validate this before sysfs issues a traceback.

> The problem in this instance is we need a node named "fixed-link" that
> is attached to the parent node as that is defined in the binding doc,
> and we're creating swnodes to provide software generated nodes for
> this binding.

And how you guarantee that it will be only a single one with unique pathname?

For example, you have two DSA cards (or whatever it's called) in the SMP system,
it mean that there is non-zero probability of coexisting swnodes for them.

> There could be several such nodes scattered around, but in this
> instance they are very short-lived before they are destroyed, they
> don't even need to be published to userspace (and its probably a waste
> of CPU cycles for them to be published there.)
> 
> So, for this specific case, is this the best approach, or is there
> some better way to achieve what we need here?

Honestly, I don't know.

The "workaround" (but it looks to me rather a hack) is to create unique swnode
and make fixed-link as a child of it.

Or entire concept of the root swnodes (when name is provided) should be
reconsidered, so somehow we will have a uniqueness so that the entire
path(s) behind it will be caller-dependent. But this I also don't like.

Maybe Heikki, Sakari, Rafael can share their thoughts...

Just for my learning, why PHY uses "fixed-link" instead of relying on a
(firmware) graph? It might be the actual solution to your problem.

How graphs are used with swnodes, you may look into IPU3 (Intel Camera)
glue driver to support devices before MIPI standardisation of the
respective properties.

-- 
With Best Regards,
Andy Shevchenko



