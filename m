Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B72C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 20:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0OJmvnNalcuwTNUSB/3l0FXso+zqehG4oIzKkHC2GJY=; b=0p8v6VFGfANatXzno5tt7H/BXc
	lGREFa8Cm3n7lKKsFoasOOmNKxQM1laU2yHH/4NRVLAukhTjCHl0zLOwjJlg2UHjV8qaQ5UNeBIqe
	LKP5dWS42AGfOs1a1rN64mUaPbzSzu0nPqUG39cAalcfNGIGNwlxtSkIwQFtnuuJP62kWF0oV9e/+
	69H0ZAlNXUIk0FXVHGtEb0owiYap+WvHW+RLpSv6GO2Bjr1YnSTUoKiGUwZLoGyS0X3uPQbyPQHBz
	TmaRvXF1iGalmKxD1TWBdz65mbX7tYFZ28rp74BqaxRfmqBYhq2GzrwCb8w9fhesisKTsc9YGs8CG
	Ew4IgVrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDX3M-000faI-EH; Mon, 18 Jul 2022 20:09:16 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDX3B-000fUy-RB; Mon, 18 Jul 2022 20:09:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658174945; x=1689710945;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZbT+9aB0j/cIG9R+/zgGzINn4AUswURHEqrlVeDgrwA=;
  b=cBtE/WkXfqmQEoPaT2ipPBrXPosrC7isONzX+W87Gzk6154LcHdQtIfQ
   VzMuWe+OqeMOYetU/jakiCRQGDFU0yUhWGIg9pHc+dhwT86MAuIUoN2jo
   iy38E2Yol+yCRatFXA+M/8Kf9JOrlRvENB2BgG9HQuPYJ8T7vcHuJPAA8
   OzU+LS9yzbMsF+CNJ1z8syHyoh49hcw+0CqoqQ0NRBHTCsp2lCkprp5pL
   PDeXZodW5o1dlj2Llw5H03la/+tx6yKQ3csqd0N1qCHJy3Trr4oMy0Ien
   wBCA74B0UK93Egy8KKLxbtWHv3GPAMVNokY/b7/yk/TZHzyKgnTPlL6ZE
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="285069406"
X-IronPort-AV: E=Sophos;i="5.92,282,1650956400"; 
   d="scan'208";a="285069406"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2022 13:09:04 -0700
X-IronPort-AV: E=Sophos;i="5.92,282,1650956400"; 
   d="scan'208";a="723983942"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2022 13:08:57 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1oDX2y-001OTa-2m;
	Mon, 18 Jul 2022 23:08:52 +0300
Date: Mon, 18 Jul 2022 23:08:52 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
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
	Vladimir Oltean <olteanv@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Subject: Re: [PATCH net-next 5/6] net: dsa: use swnode fixed-link if using
 default params
Message-ID: <YtW91F42jhhtPj9p@smile.fi.intel.com>
References: <YtGPO5SkMZfN8b/s@shell.armlinux.org.uk>
 <E1oCNlE-006e3z-3T@rmk-PC.armlinux.org.uk>
 <YtHJ5rfxZ+icXrkC@smile.fi.intel.com>
 <YtHd3f22AtrIzZ1K@shell.armlinux.org.uk>
 <YtWtjYuQ8aLL64Tg@smile.fi.intel.com>
 <YtWwzwO9gZoR+9T/@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtWwzwO9gZoR+9T/@shell.armlinux.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_130905_912648_06209BFC 
X-CRM114-Status: GOOD (  26.11  )
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

On Mon, Jul 18, 2022 at 08:13:19PM +0100, Russell King (Oracle) wrote:
> On Mon, Jul 18, 2022 at 09:59:25PM +0300, Andy Shevchenko wrote:
> > On Fri, Jul 15, 2022 at 10:36:29PM +0100, Russell King (Oracle) wrote:
> > > On Fri, Jul 15, 2022 at 11:11:18PM +0300, Andy Shevchenko wrote:
> > > > On Fri, Jul 15, 2022 at 05:01:48PM +0100, Russell King (Oracle) wrote:
> > 
> > ...
> > 
> > > > > Co-developed by Vladimir Oltean and myself.
> > > > 
> > > > Why not to use
> > > > 
> > > >   Co-developed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> > > 
> > > Ah, that's an official thing. Thanks.
> > 
> > Yep, it's even documented in Submitting Patches.
> > 
> > ...
> > 
> > > > > +	phy_node = of_parse_phandle(dn, "phy-handle", 0);
> > > > 
> > > > fwnode in the name, why not to use fwnode APIs?
> > > > 
> > > > 	fwnode_find_reference();
> > > 
> > > Marcin has a series converting DSA to use fwnode things - currently DSA
> > > does not support ACPI, so converting it to fwnode doesn't make that much
> > > sese until the proper ACPI patches get merged, which have now been
> > > rebased on this series by Marcin in the expectation that these patches
> > > would be merged... so I don't want to tred on Marcin's feet on that.
> > 
> > But it's normal development process...
> > 
> > Anyway, it seems to me that you are using fwnode out of that (with the
> > exception of one call). To me it looks that you add a work to him, rather
> > than making his life easier, since you know ahead that this is going to be
> > converted.
> 
> No, I didn't know ahead of time until Marcin piped up about it, and
> then we discussed how to resolve the conflict between the two patch
> sets.

But now you know that and since your series is not yet in, back to phase 1,
i.e. "normal development process (with additional coordination required)".

-- 
With Best Regards,
Andy Shevchenko



