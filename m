Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A71C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jul 2022 08:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AGkHJQlA6/acDC/ceEiMdJplcCauzvc80X5IH6VxviQ=; b=NtxrcJ1tlkJbiO4aqHajxiRBY/
	8VJQkG/qC7XsaSZ92T3tBI4d/t5vVsrXMdpq+vW+Jjs02xtE6Fny2Hp53oeTtcl7e0vSfdtqbbwab
	7vLc8y1uB3HlK6ylawSctQxsGpH7L0LmpeOnZFiVAwI7QcB+6TpvXhvXS4irXQaELzBA69vh1PlSW
	ieHswCRjqIs82lYIPWeWqEiyeuQFgnTDuvXuc3zYaG/QPkrGjitmV8NXV6MrNqTVB6uAkC43wDl+e
	DYrp447DfYyHdW2U0/vKxt6ixAvYz2P/U+2eJs9DzSzr/AYYypS12NuYf0J6ojbnZKfAls9ppnAcP
	L8cwbDvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDiwZ-006dQt-U4; Tue, 19 Jul 2022 08:51:03 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDiwM-006d48-C5; Tue, 19 Jul 2022 08:50:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658220650; x=1689756650;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2JAJzcpzppdk8+5vwNAE1GhAxpYQx+69osAyMGcV9+w=;
  b=nDWUN1Llk3MtnHG7UTD12S+P5VS7mLQ4D+paPhSy/V6Ernv5J2ZFfKtT
   5lByWZ5KQmGm4/JSBOJFM7dd+CLsUVzZnNxd3dD8oZ0tMjzC+8j5OGq0K
   QyRsEKH53l4M/bp4COTvkgJtmkxoZPH+5ya2S2LzESfWNktiMW+U83T+f
   Dl2YiPjS7YgBSEPNqw774yYyyqIaROm30RA1r6mS2rKbUnaYqdEMIO+O2
   CIFQ4KLCMpfGccanHeK/oY4SMeHM2+7Sbyq8vCZEmRgE5KQRfDm+qssRp
   INd+jgfuz8WFvLcodtt1md3zx2hY15mYLAmgKgnscvx9v+iu8NAYuqTSl
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="350400601"
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; 
   d="scan'208";a="350400601"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2022 01:50:37 -0700
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; 
   d="scan'208";a="700361257"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2022 01:50:29 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
	by paasikivi.fi.intel.com (Postfix) with SMTP id 9E6EB202EA;
	Tue, 19 Jul 2022 11:50:27 +0300 (EEST)
Date: Tue, 19 Jul 2022 08:50:27 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
	Sean Wang <sean.wang@mediatek.com>, UNGLinuxDriver@microchip.com,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Subject: Re: [PATCH net-next 2/6] software node: allow named software node to
 be created
Message-ID: <YtZwU9BKAO/WSRmK@paasikivi.fi.intel.com>
References: <YtHGwz4v7VWKhIXG@smile.fi.intel.com>
 <20220715201715.foea4rifegmnti46@skbuf>
 <YtHPJNpcN4vNfgT6@smile.fi.intel.com>
 <20220715204841.pwhvnue2atrkc2fx@skbuf>
 <YtVSQI5VHtCOTCHc@smile.fi.intel.com>
 <YtVfppMtW77ICyC5@shell.armlinux.org.uk>
 <YtWp3WkpCtfe559l@smile.fi.intel.com>
 <YtWwbMucEyO+W8/Y@shell.armlinux.org.uk>
 <YtW9goFpOLGvIDog@smile.fi.intel.com>
 <YtXE0idsKe6FZ+n4@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtXE0idsKe6FZ+n4@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_015050_484804_D294B8B1 
X-CRM114-Status: GOOD (  41.00  )
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

Hi Russell, Andy,

On Mon, Jul 18, 2022 at 09:38:42PM +0100, Russell King (Oracle) wrote:
> On Mon, Jul 18, 2022 at 11:07:30PM +0300, Andy Shevchenko wrote:
> > On Mon, Jul 18, 2022 at 08:11:40PM +0100, Russell King (Oracle) wrote:
> > > Good point - I guess we at least need to attach the swnode parent to the
> > > device so its path is unique, because right now that isn't the case. I'm
> > > guessing that:
> > > 
> > >         new_port_fwnode = fwnode_create_software_node(port_props, NULL);
> > > 
> > > will create something at the root of the swnode tree, and then:
> > > 
> > >         fixed_link_fwnode = fwnode_create_named_software_node(fixed_link_props,
> > >                                                               new_port_fwnode,
> > >                                                               "fixed-link");
> > > 
> > > will create a node with a fixed name. I guess it in part depends what
> > > pathname the first node gets (which we don't specify.) I'm not familiar
> > > with the swnode code to know what happens with the naming for the first
> > > node.
> > 
> > First node's name will be unique which is guaranteed by IDA framework. If we
> > have already 2B nodes, then yes, it would be problematic (but 2^31 ought to be
> > enough :-).
> > 
> > > However, it seems sensible to me to attach the first node to the device
> > > node, thus giving it a unique fwnode path. Does that solve the problem
> > > in swnode land?
> > 
> > Yes, but in the driver you will have that as child of the device, analogue in DT
> > 
> >   my_root_node { // equal the level of device node you attach it to
> > 	  fixed-link {
> > 	  }
> >   }
> > 
> > (Sorry, I don't know the DT syntax by heart, but I hope you got the idea.)
> 
> Yes, that looks about right.
> 
> What we're attempting to do here is create the swnode equivalent of this
> DT description:
> 
> 	some_node {
> 		phy-mode = "foo";
> 
> 		fixed-link {
> 			speed = X;
> 			full-duplex;
> 		};
> 	};
> 
> and the some_node fwnode handle gets passed into phylink for it to
> parse - we never attach it to the firmware tree itself. Once phylink
> has parsed it, we destroy the swnode tree since it's no longer useful.
> 
> This would get used in this situation as an example:
> 
> 	switch@4 {
> 		compatible = "marvell,mv88e6085";
> 
> 		ports {
> 			port@0 {
> 				reg = <0>;
> 				phy-mode = "internal";
> 				phy-handle = <&sw_phy_0>;
> 			};
> 			...
> 			port@5 {
> 				reg = <5>;
> 				label = "cpu";
> 				ethernet = <&eth1>;
> 			};
> 		};
> 	};
> 
> The DSA driver knows the capabilities of the chip, so it knows what the
> fastest "phy-mode" and speed would be, and whether full or half duplex
> are supported.
> 
> We need to get this information into phylink some how, and my initial
> approach was to add a new function to phylink to achieve that.
> 
> We would normally have passed the "port@5" node to phylink, just as we
> pass the "port@0" node. However, because the "port@5" operates as a
> fixed-link as determined by the hardware/driver, we need some way to
> get that into phylink.
> 
> So, Vladimir's approach is to create a swnode tree that reflects the
> DT layout, and rather than passing the "port@5" as a fwnode to phylink,
> we instead pass that "some_node" swnode instead. Phylink then uses
> normal fwnode APIs to parse the swnode tree it's been given, resulting
> in it picking up the fixed-link specification as if it had been in the
> original DT.
> 
> We don't augment the existing firmware tree for "port@5", we are
> effectively creating a small sub-tree and using it as a subsitute
> description.
> 
> I hope that clarifies what is going on here and why.

Basically what your patch is doing is adding a helper function that creates
an fwnode with a given name. This functionality was there previously through
software_node_register_nodes(), with node allocation responsibility residing
on the caller. It's used e.g. here:
drivers/media/pci/intel/ipu3/cio2-bridge.c .

The larger question is perhaps when can you safely remove software nodes.
And which of these two APIs would be preferred. I haven't checked how many
users each has. There's no refcounting nor locking for software nodes, so
once made visible to the rest of the kernel, they're always expected to be
there, unchanged, or at least it needs to be known when they can be removed.

-- 
Kind regards,

Sakari Ailus

