Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA76CCA479
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 20:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oNPBkAs1H3vOBgGTEacCX2HDRVx2Va46B3UkjCZ2wjA=; b=GKW2QLGFi4qqHZAyrIcHbeZpE0
	3GNyJcGsnwiB/cjuzTnOiR/RYQaRSSuJjPpKaucWmGeNkGVjWQq42Ja8YD74j3MtJ7ekA7Zny2tdf
	vW6LsD/2MbzxFHdnCJuU9SEs2Kl/UClF6yhdzQSP2n+4guhLk1zfuUw3durS5lupuu/gmnBYSsod/
	WtmjWngUUC75pd/grnC8KrlPN1Ht5XwLYiWQO5TUhLlQCWfIWlZvD04H4GCCtaVPdij2tDyA2n5xu
	UKPWCW/ekp9pmrB+EZfMf7mj4BXWd8tvDXGgAVM+1drAsa3Et5LC1iZasRLzTpO6+NxvLISVy+t83
	SQq9TM6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDXXP-000tYj-Nj; Mon, 18 Jul 2022 20:40:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDXXB-000tQ9-Mn; Mon, 18 Jul 2022 20:40:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3BE3E60EF0;
	Mon, 18 Jul 2022 20:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45181C341CA;
	Mon, 18 Jul 2022 20:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658176803;
	bh=It2kqb8PdMcO3xY4MnT5t9nXCXyZr9jKC+fldi0pjIo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=n9xLmb1OS0XTpcZcWgyeOU4UpzjDd59Khu+FMVLy45A+9aZNU4/iOsG+tRfjzXfGT
	 7xF0CxTI7ts9mUEpvyqNrUrOAd9J+DT8q+/FdOVjiJZ7Sexz+ACHlogGGPTQfvJczB
	 ZE6xamZfhv79rWrCAqxcU7SnobH6yIUxEJ+c7cOfWKDzeESpY+Ytvdp/xIFl6oNTx/
	 ZRPvXRSNUzRJGxutGAnFwzsfTB+OgjTgBYKFETN2TIRG2AExvccYZKYqoIc5iMsj61
	 C479EtuQTb3IO0do7Fe7/VJ9hID/iQ3B7jnbEhUUWA/oGSdfp0J/D/c0sg7+nhEdeF
	 +m52RwKsqMAnA==
Date: Mon, 18 Jul 2022 22:39:42 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Vladimir Oltean
 <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit
 <hkallweit1@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alvin __ipraga <alsi@bang-olufsen.dk>, Claudiu Manoil
 <claudiu.manoil@nxp.com>, Daniel Scally <djrscally@gmail.com>, "David S.
 Miller" <davem@davemloft.net>, DENG Qingfang <dqfext@gmail.com>, Eric
 Dumazet <edumazet@google.com>, Florian Fainelli <f.fainelli@gmail.com>,
 George McCollister <george.mccollister@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Hauke Mehrtens <hauke@hauke-m.de>, Heikki
 Krogerus <heikki.krogerus@linux.intel.com>, Jakub Kicinski
 <kuba@kernel.org>, Kurt Kanzenbach <kurt@linutronix.de>, Landen Chao
 <Landen.Chao@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger
 <matthias.bgg@gmail.com>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Sean Wang <sean.wang@mediatek.com>,
 UNGLinuxDriver@microchip.com, Vivien Didelot <vivien.didelot@gmail.com>,
 Woojung Huh <woojung.huh@microchip.com>
Subject: Re: [PATCH net-next 2/6] software node: allow named software node
 to be created
Message-ID: <20220718223942.245f29b6@thinkpad>
In-Reply-To: <YtWzWdkFVMg0Hyvf@smile.fi.intel.com>
References: <E1oCNky-006e3g-KA@rmk-PC.armlinux.org.uk>
	<YtHGwz4v7VWKhIXG@smile.fi.intel.com>
	<20220715201715.foea4rifegmnti46@skbuf>
	<YtHPJNpcN4vNfgT6@smile.fi.intel.com>
	<20220715204841.pwhvnue2atrkc2fx@skbuf>
	<YtVSQI5VHtCOTCHc@smile.fi.intel.com>
	<YtVfppMtW77ICyC5@shell.armlinux.org.uk>
	<YtWp3WkpCtfe559l@smile.fi.intel.com>
	<YtWsM1nr2GZWDiEN@smile.fi.intel.com>
	<YtWxMrz3LcVQa43I@shell.armlinux.org.uk>
	<YtWzWdkFVMg0Hyvf@smile.fi.intel.com>
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_134005_865616_010F8B21 
X-CRM114-Status: GOOD (  52.13  )
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

On Mon, 18 Jul 2022 22:24:09 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Mon, Jul 18, 2022 at 08:14:58PM +0100, Russell King (Oracle) wrote:
> > On Mon, Jul 18, 2022 at 09:53:39PM +0300, Andy Shevchenko wrote:  
> > > On Mon, Jul 18, 2022 at 09:43:42PM +0300, Andy Shevchenko wrote:  
> > > > On Mon, Jul 18, 2022 at 02:27:02PM +0100, Russell King (Oracle) wrote:  
> > > > > On Mon, Jul 18, 2022 at 03:29:52PM +0300, Andy Shevchenko wrote:  
> > > > > > On Fri, Jul 15, 2022 at 11:48:41PM +0300, Vladimir Oltean wrote:  
> > > > > > > So won't kobject_init_and_add() fail on namespace collision? Is it the
> > > > > > > problem that it's going to fail, or that it's not trivial to statically
> > > > > > > determine whether it'll fail?
> > > > > > > 
> > > > > > > Sorry, but I don't see something actionable about this.  
> > > > > > 
> > > > > > I'm talking about validation before a runtime. But if you think that is fine,
> > > > > > let's fail it at runtime, okay, and consume more backtraces in the future.  
> > > > > 
> > > > > Is there any sane way to do validation of this namespace before
> > > > > runtime?  
> > > > 
> > > > For statically compiled, I think we can do it (to some extent).
> > > > Currently only three drivers, if I'm not mistaken, define software nodes with
> > > > names. It's easy to check that their node names are unique.
> > > > 
> > > > When you allow such an API then we might have tracebacks (from sysfs) bout name
> > > > collisions. Not that is something new to kernel (we have seen many of a kind),
> > > > but I prefer, if possible, to validate this before sysfs issues a traceback.
> > > >   
> > > > > The problem in this instance is we need a node named "fixed-link" that
> > > > > is attached to the parent node as that is defined in the binding doc,
> > > > > and we're creating swnodes to provide software generated nodes for
> > > > > this binding.  
> > > > 
> > > > And how you guarantee that it will be only a single one with unique pathname?
> > > > 
> > > > For example, you have two DSA cards (or whatever it's called) in the SMP system,
> > > > it mean that there is non-zero probability of coexisting swnodes for them.
> > > >   
> > > > > There could be several such nodes scattered around, but in this
> > > > > instance they are very short-lived before they are destroyed, they
> > > > > don't even need to be published to userspace (and its probably a waste
> > > > > of CPU cycles for them to be published there.)
> > > > > 
> > > > > So, for this specific case, is this the best approach, or is there
> > > > > some better way to achieve what we need here?  
> > > > 
> > > > Honestly, I don't know.
> > > > 
> > > > The "workaround" (but it looks to me rather a hack) is to create unique swnode
> > > > and make fixed-link as a child of it.
> > > > 
> > > > Or entire concept of the root swnodes (when name is provided) should be
> > > > reconsidered, so somehow we will have a uniqueness so that the entire
> > > > path(s) behind it will be caller-dependent. But this I also don't like.
> > > > 
> > > > Maybe Heikki, Sakari, Rafael can share their thoughts...
> > > > 
> > > > Just for my learning, why PHY uses "fixed-link" instead of relying on a
> > > > (firmware) graph? It might be the actual solution to your problem.
> > > > 
> > > > How graphs are used with swnodes, you may look into IPU3 (Intel Camera)
> > > > glue driver to support devices before MIPI standardisation of the
> > > > respective properties.  
> > > 
> > > Forgot to say (yes, it maybe obvious) that this API will be exported,
> > > anyone can use it and trap into the similar issue, because, for example,
> > > of testing in environment with a single instance of the caller.  
> > 
> > I think we're coming to the conclusion that using swnodes is not the
> > correct approach for this problem, correct?  
> 
> If I understand the possibilities of the usage in _this_ case, then it's
> would be problematic (it does not mean it's incorrect). It might be due to
> swnode design restrictions which shouldn't be made, I dunno. That' why
> it's better to ask the others for their opinions.
> 
> By design swnode's name makes not much sense, because the payload there
> is a property set, where _name_ is a must.
> 
> Now, telling you this, I'm questioning myself why the heck I added names
> to swnodes in the intel_quark_i2c_gpio driver...

1. the way we use this new named swnode (in patch 5/6 of this series) is
   that it gets destroyed immediately after being parsed, so I don't
   think there will be collisions in the namespace for forseeable future

   also, we first create an unnamed swnode for port and only then
   fixed-link swnode as a child.

      new_port_fwnode = fwnode_create_software_node(port_props, NULL);
      ...
      fixed_link_fwnode =
        fwnode_create_named_software_node(fixed_link_props,
                                          new_port_fwnode, "fixed-link");

   so there shouldn't be a name collision, since the port node gets a
   unique name, or am I misunderstanding this?

2. even if there was a problem with name collision, I think the place
   that needs to be fixed is swnode system. What use are swnodes if
   they cannot be used like this?

Marek

