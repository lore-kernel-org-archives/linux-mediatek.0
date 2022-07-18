Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EE1C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 12:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0jCeqIQnbjq+tMRjEm/cDOoLXixk8oQgA4SVlNraUAQ=; b=WeYqbCoWKKNbi22lYVgZH4XocJ
	RuVR/D0nYNtqoVmfCcAhKQRK7SI4ARc2HycA0URpJel1/vo9a0/XE1QMVmmG+t5aLMNvhutOORY/8
	SSyxWf21lA5a5CXtoARLtR1kE6aYItPsj/1rYNhziy0hlTFVrPKW4K+HBULDvtxMzPY68HmMVs9np
	O/qgbaCaf4HCz85NTZkQkYuujDKqPX2NtZ9uYpMGi5c3RwtAaCmUHrmbCdWkcQQV7UkDGvhKOuUeQ
	uiY3fUAoITI5GuX3XRS6XLZYjsypl0NGJdUMHweEWBrldEtBhlw5wlYIYidc44/NI0D9x9En3WVmM
	TiaTN8KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDPtI-00DIaa-95; Mon, 18 Jul 2022 12:30:24 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDPt3-00DIQI-GY; Mon, 18 Jul 2022 12:30:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658147409; x=1689683409;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iD9MNKwEAKGE0wV7TMV/IgNKE43bbdq4a0RjU1vPlEE=;
  b=NtqFlG9eN0fZ8M+orzJidhLJSvMmGqvfU67XI7i2fv4SDMI39jpf9A3X
   d5FzXEE0GGfNVuLZbehkEsRaC4L6vuVQ5Pg5CJYgld58fqUAuBRhtpIK/
   Q1uIJtoKWeC+5cYJipNdNdL4dt+wZSwkowJkQCNCVCxSKb7J9rhYlk554
   91mpIrfsF0nNAyAFeV2HGfbPPuHKTycO/4W8+MvLD9y5tcvMxr9JQSWTa
   lK2jzvuQL9Xhg7U1EVzNlLKL6hhAOaS9zuy7vwAJ31ZsDhek6YEcD2HhG
   qaJ35aVq2z29gUqX0tZW1nTUd/JAo1jWNz+LGnW/ZTO4mnomDg7NZrnu7
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10411"; a="372513876"
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; 
   d="scan'208";a="372513876"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2022 05:30:04 -0700
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; 
   d="scan'208";a="655256538"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2022 05:29:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1oDPsm-001OAe-1M;
	Mon, 18 Jul 2022 15:29:52 +0300
Date: Mon, 18 Jul 2022 15:29:52 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Russell King <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
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
Message-ID: <YtVSQI5VHtCOTCHc@smile.fi.intel.com>
References: <YtGPO5SkMZfN8b/s@shell.armlinux.org.uk>
 <E1oCNky-006e3g-KA@rmk-PC.armlinux.org.uk>
 <YtHGwz4v7VWKhIXG@smile.fi.intel.com>
 <20220715201715.foea4rifegmnti46@skbuf>
 <YtHPJNpcN4vNfgT6@smile.fi.intel.com>
 <20220715204841.pwhvnue2atrkc2fx@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220715204841.pwhvnue2atrkc2fx@skbuf>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_053009_591661_1FC594A5 
X-CRM114-Status: GOOD (  23.36  )
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

On Fri, Jul 15, 2022 at 11:48:41PM +0300, Vladimir Oltean wrote:
> On Fri, Jul 15, 2022 at 11:33:40PM +0300, Andy Shevchenko wrote:
> > On Fri, Jul 15, 2022 at 11:17:15PM +0300, Vladimir Oltean wrote:
> > > On Fri, Jul 15, 2022 at 10:57:55PM +0300, Andy Shevchenko wrote:
> > > > On Fri, Jul 15, 2022 at 05:01:32PM +0100, Russell King wrote:
> > > > > From: Vladimir Oltean <vladimir.oltean@nxp.com>
> > > > > 
> > > > > Allow a named software node to be created, which is needed for software
> > > > > nodes for a fixed-link specification for DSA.
> > > > 
> > > > In general I have no objection, but what's worrying me is a possibility to
> > > > collide in namespace. With the current code the name is generated based on
> > > > unique IDs, how can we make this one more robust?
> > > 
> > > Could you be more clear about the exact concern?
> > 
> > Each software node can be created with a name. The hierarchy should be unique,
> > means that there can't be two or more nodes with the same path (like on file
> > system or more specifically here, Device Tree). Allowing to pass names we may
> > end up with the situation when it will be a path collision. Yet, the static
> > names are easier to check, because one may run `git grep ...` or coccinelle
> > script to see what's in the kernel.
> 
> So won't kobject_init_and_add() fail on namespace collision? Is it the
> problem that it's going to fail, or that it's not trivial to statically
> determine whether it'll fail?
> 
> Sorry, but I don't see something actionable about this.

I'm talking about validation before a runtime. But if you think that is fine,
let's fail it at runtime, okay, and consume more backtraces in the future.

-- 
With Best Regards,
Andy Shevchenko



