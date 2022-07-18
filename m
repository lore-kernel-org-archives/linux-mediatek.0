Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09400C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 19:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K91k8rhmwAVyxMcS0asmjIubeABEinxJMupE9+6nDAA=; b=YcsW0QKX6SuxrNNhcQe1Nk6LM/
	Dp30VO6eT4xJM/NuChXEwiS/IYSWDqkFnJwtv2HujT9OnxEq1g8aEUzEL8hQMuWadEzAa8J/Nb6tN
	rNUWofXq+Pp0NY1R5FYaqOU3pyY+EvuE8fDh04hklFWU1HpIuxCwSo/rTu9Fq3hOPc5hh4JHZIwIA
	jZMcvXVzAvurzGNz0TfDVWUmIaVUR8kAxzOG057aLWZHbAUkQ4AY/NS/eyTiLaeQr2vYAu1AF6U8V
	y/lsWKyKArr0EQLcE6mkMwFR2O//GGnpm6tmCNaH5tPzzJQ2tj2BnaJqMUWec0XhGWtzlb1EmzWQT
	NFj7rngw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDVyE-000BuD-Fd; Mon, 18 Jul 2022 18:59:54 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDVy0-000BmH-CH; Mon, 18 Jul 2022 18:59:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658170780; x=1689706780;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TIEQ4MTYN/3mHVFEK8QSYRaebmDVBch4wfEANQ4Z+F4=;
  b=fRp6jyLWEPVRoV5x2sRBRzaprr7U4hIyte5EwODV3FIuhfLx3d1uZhks
   M46SBrUrNOUi+wgLdQ7yC/abDqYvtSc2WK/bpDEEMUtstqal7D47fzUCy
   IZpWk5ydGHe9WdQzFHFXs5zi2uKg6OimambPb52TGz7smSd+P0KeSOt9I
   jnuJWw2kU/oP49aAhu3HmcOWt6OmMOhciQdPqnBX+dLrj3y6EvLMaCrHV
   B5YeCtGOvG0EjrVmGCCjRlyu1M5NA3lwScHcpf32G+ZRgAf3u8ufDVU51
   dRFSMv0hmpJ+WstbeVqQ2YPRGPABKI35GrtEfW/5UNZCpHF4BrgtJzfue
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="350258646"
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; 
   d="scan'208";a="350258646"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2022 11:59:37 -0700
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; 
   d="scan'208";a="700140775"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2022 11:59:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1oDVxl-001OP6-31;
	Mon, 18 Jul 2022 21:59:25 +0300
Date: Mon, 18 Jul 2022 21:59:25 +0300
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
Message-ID: <YtWtjYuQ8aLL64Tg@smile.fi.intel.com>
References: <YtGPO5SkMZfN8b/s@shell.armlinux.org.uk>
 <E1oCNlE-006e3z-3T@rmk-PC.armlinux.org.uk>
 <YtHJ5rfxZ+icXrkC@smile.fi.intel.com>
 <YtHd3f22AtrIzZ1K@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtHd3f22AtrIzZ1K@shell.armlinux.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_115940_534892_327B5AB3 
X-CRM114-Status: GOOD (  18.86  )
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

On Fri, Jul 15, 2022 at 10:36:29PM +0100, Russell King (Oracle) wrote:
> On Fri, Jul 15, 2022 at 11:11:18PM +0300, Andy Shevchenko wrote:
> > On Fri, Jul 15, 2022 at 05:01:48PM +0100, Russell King (Oracle) wrote:

...

> > > Co-developed by Vladimir Oltean and myself.
> > 
> > Why not to use
> > 
> >   Co-developed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> 
> Ah, that's an official thing. Thanks.

Yep, it's even documented in Submitting Patches.

...

> > > +	phy_node = of_parse_phandle(dn, "phy-handle", 0);
> > 
> > fwnode in the name, why not to use fwnode APIs?
> > 
> > 	fwnode_find_reference();
> 
> Marcin has a series converting DSA to use fwnode things - currently DSA
> does not support ACPI, so converting it to fwnode doesn't make that much
> sese until the proper ACPI patches get merged, which have now been
> rebased on this series by Marcin in the expectation that these patches
> would be merged... so I don't want to tred on Marcin's feet on that.

But it's normal development process...

Anyway, it seems to me that you are using fwnode out of that (with the
exception of one call). To me it looks that you add a work to him, rather
than making his life easier, since you know ahead that this is going to be
converted.

-- 
With Best Regards,
Andy Shevchenko



