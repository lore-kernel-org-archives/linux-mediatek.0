Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E178C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 20:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SwQHxw0V7UvKmYM3FBOC66gTjyfH+jj9fv3yZa1y6zM=; b=N1TBC3PecgAC0dLucRXySM86Pt
	oSb2jUTyoct0VnU0fnRPZAgFZFa1R3jwqwHP8UwwTmjd9MiDPkZt83/BmB5qqkUnxyntQJqNAuOgi
	w+dmwGk3Ey/R6/ypfWTUgCdLchTW82WkwmGyU9tqIvPATYSjbn2/AcgY3e4pEdziAGiOlxfMJE3Xp
	dbwbX5X8a8IhKVVTjbujGK2owmFqywEsa9BfVQ9a1MPXvASXzgpDbOpLpc0XK6X08a3WgfDEv+FiO
	MaUtRpBlt3TaY4dIGdkImdwmwn3L4/y0e8ksEGQLx3f2EyUwAseOz9LVhZA73e39K3mLrxwg6Iygr
	mxm+6JmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDXff-000yOs-4u; Mon, 18 Jul 2022 20:48:51 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDXfS-000yEr-44; Mon, 18 Jul 2022 20:48:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658177318; x=1689713318;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Gi29ipHphab6y06j2mvJvTRBDSiD7z2zobQEJWGvcQM=;
  b=ReqgIAIGW6fzUdSloBXvEHmxWLbCamJmrXCUhHa8lreH61V8k0rwABSt
   DrynENapVFPVcowFle1Y6D9o4SzqLphy5lEoou63JXgylHd7M7SQLSHDf
   t/kjrCPlHjmut8o/CNwOQ1SmPUT7mXiu2/46P0qXsUxOC6li6QvNdrw7Q
   x5Ia6J0sAXNK2PNhfZIjwquE9NB8/IbJmQQ3vlX8GSbO1kp0yr1ww9waB
   f5LwIpoYw41c1Z38elsOyAeQKzUkj2tGKzYBcx9QAsHLdRjSjEhIi4YY7
   HUtoQM7LhcGKS9USuaoATLsBnJ71ttVJz4teUSDH+/4DSUaZCUbUcfFg1
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="348008444"
X-IronPort-AV: E=Sophos;i="5.92,282,1650956400"; 
   d="scan'208";a="348008444"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2022 13:48:33 -0700
X-IronPort-AV: E=Sophos;i="5.92,282,1650956400"; 
   d="scan'208";a="843407801"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2022 13:48:26 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1oDXfC-001OVf-0d;
	Mon, 18 Jul 2022 23:48:22 +0300
Date: Mon, 18 Jul 2022 23:48:21 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
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
	Woojung Huh <woojung.huh@microchip.com>
Subject: Re: [PATCH net-next 2/6] software node: allow named software node to
 be created
Message-ID: <YtXHFQqB3M5Picdl@smile.fi.intel.com>
References: <20220715201715.foea4rifegmnti46@skbuf>
 <YtHPJNpcN4vNfgT6@smile.fi.intel.com>
 <20220715204841.pwhvnue2atrkc2fx@skbuf>
 <YtVSQI5VHtCOTCHc@smile.fi.intel.com>
 <YtVfppMtW77ICyC5@shell.armlinux.org.uk>
 <YtWp3WkpCtfe559l@smile.fi.intel.com>
 <YtWsM1nr2GZWDiEN@smile.fi.intel.com>
 <YtWxMrz3LcVQa43I@shell.armlinux.org.uk>
 <YtWzWdkFVMg0Hyvf@smile.fi.intel.com>
 <20220718223942.245f29b6@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220718223942.245f29b6@thinkpad>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_134838_233591_C98F6482 
X-CRM114-Status: GOOD (  54.22  )
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

On Mon, Jul 18, 2022 at 10:39:42PM +0200, Marek Behún wrote:
> On Mon, 18 Jul 2022 22:24:09 +0300
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> 
> > On Mon, Jul 18, 2022 at 08:14:58PM +0100, Russell King (Oracle) wrote:
> > > On Mon, Jul 18, 2022 at 09:53:39PM +0300, Andy Shevchenko wrote:  
> > > > On Mon, Jul 18, 2022 at 09:43:42PM +0300, Andy Shevchenko wrote:  
> > > > > On Mon, Jul 18, 2022 at 02:27:02PM +0100, Russell King (Oracle) wrote:  
> > > > > > On Mon, Jul 18, 2022 at 03:29:52PM +0300, Andy Shevchenko wrote:  
> > > > > > > On Fri, Jul 15, 2022 at 11:48:41PM +0300, Vladimir Oltean wrote:  
> > > > > > > > So won't kobject_init_and_add() fail on namespace collision? Is it the
> > > > > > > > problem that it's going to fail, or that it's not trivial to statically
> > > > > > > > determine whether it'll fail?
> > > > > > > > 
> > > > > > > > Sorry, but I don't see something actionable about this.  
> > > > > > > 
> > > > > > > I'm talking about validation before a runtime. But if you think that is fine,
> > > > > > > let's fail it at runtime, okay, and consume more backtraces in the future.  
> > > > > > 
> > > > > > Is there any sane way to do validation of this namespace before
> > > > > > runtime?  
> > > > > 
> > > > > For statically compiled, I think we can do it (to some extent).
> > > > > Currently only three drivers, if I'm not mistaken, define software nodes with
> > > > > names. It's easy to check that their node names are unique.
> > > > > 
> > > > > When you allow such an API then we might have tracebacks (from sysfs) bout name
> > > > > collisions. Not that is something new to kernel (we have seen many of a kind),
> > > > > but I prefer, if possible, to validate this before sysfs issues a traceback.
> > > > >   
> > > > > > The problem in this instance is we need a node named "fixed-link" that
> > > > > > is attached to the parent node as that is defined in the binding doc,
> > > > > > and we're creating swnodes to provide software generated nodes for
> > > > > > this binding.  
> > > > > 
> > > > > And how you guarantee that it will be only a single one with unique pathname?
> > > > > 
> > > > > For example, you have two DSA cards (or whatever it's called) in the SMP system,
> > > > > it mean that there is non-zero probability of coexisting swnodes for them.
> > > > >   
> > > > > > There could be several such nodes scattered around, but in this
> > > > > > instance they are very short-lived before they are destroyed, they
> > > > > > don't even need to be published to userspace (and its probably a waste
> > > > > > of CPU cycles for them to be published there.)
> > > > > > 
> > > > > > So, for this specific case, is this the best approach, or is there
> > > > > > some better way to achieve what we need here?  
> > > > > 
> > > > > Honestly, I don't know.
> > > > > 
> > > > > The "workaround" (but it looks to me rather a hack) is to create unique swnode
> > > > > and make fixed-link as a child of it.
> > > > > 
> > > > > Or entire concept of the root swnodes (when name is provided) should be
> > > > > reconsidered, so somehow we will have a uniqueness so that the entire
> > > > > path(s) behind it will be caller-dependent. But this I also don't like.
> > > > > 
> > > > > Maybe Heikki, Sakari, Rafael can share their thoughts...
> > > > > 
> > > > > Just for my learning, why PHY uses "fixed-link" instead of relying on a
> > > > > (firmware) graph? It might be the actual solution to your problem.
> > > > > 
> > > > > How graphs are used with swnodes, you may look into IPU3 (Intel Camera)
> > > > > glue driver to support devices before MIPI standardisation of the
> > > > > respective properties.  
> > > > 
> > > > Forgot to say (yes, it maybe obvious) that this API will be exported,
> > > > anyone can use it and trap into the similar issue, because, for example,
> > > > of testing in environment with a single instance of the caller.  
> > > 
> > > I think we're coming to the conclusion that using swnodes is not the
> > > correct approach for this problem, correct?  
> > 
> > If I understand the possibilities of the usage in _this_ case, then it's
> > would be problematic (it does not mean it's incorrect). It might be due to
> > swnode design restrictions which shouldn't be made, I dunno. That' why
> > it's better to ask the others for their opinions.
> > 
> > By design swnode's name makes not much sense, because the payload there
> > is a property set, where _name_ is a must.
> > 
> > Now, telling you this, I'm questioning myself why the heck I added names
> > to swnodes in the intel_quark_i2c_gpio driver...
> 
> 1. the way we use this new named swnode (in patch 5/6 of this series) is
>    that it gets destroyed immediately after being parsed, so I don't
>    think there will be collisions in the namespace for forseeable future
> 
>    also, we first create an unnamed swnode for port and only then
>    fixed-link swnode as a child.
> 
>       new_port_fwnode = fwnode_create_software_node(port_props, NULL);
>       ...
>       fixed_link_fwnode =
>         fwnode_create_named_software_node(fixed_link_props,
>                                           new_port_fwnode, "fixed-link");
> 
>    so there shouldn't be a name collision, since the port node gets a
>    unique name, or am I misunderstanding this?

This is not problem, but what I was talking about is how to guarantee this
hierarchy? See what I answered to RNK.

> 2. even if there was a problem with name collision, I think the place
>    that needs to be fixed is swnode system. What use are swnodes if
>    they cannot be used like this?

Precisely, that's why I don't want to introduce an API that needs to be fixed.

-- 
With Best Regards,
Andy Shevchenko



