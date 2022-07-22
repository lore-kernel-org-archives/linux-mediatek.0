Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF129C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jul 2022 06:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m9AY0OFgfzKJQ36oydAGqsto3YCmvRl+qOwLnM7VaLw=; b=eEbNqzdi2SNB4NXh21+orBvsDO
	axEcyU24WLwN9tzvDur5RutwDjXGts6zmqogXzLlr5kQ9V22wLQqyqHQiGEh2Et+Quxvm6RwWEybj
	8hVsVk3RdH868Dm21mAV7RELUAmENFsdRxyDF6/ofBb7CwY/N0ZunD5OgZjHORUmn60oRHXtir4RS
	nhV3eeEHOJ8GMtx+3lQ7mlNSn7ukqvh/P9H/5nUnvho68x6074vxhlpyLI6iQwMJVa60jk+eLSeDc
	qf6PFZSgzG+Jqjw19K0BntHFYAT/rp++DYIit4Ym0QGHKIJ2srioj4MckaacFOJV7uI7eft1kzGko
	SAw6XiqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEm2P-000Jri-1x; Fri, 22 Jul 2022 06:21:25 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEm2D-000Jnn-Ix; Fri, 22 Jul 2022 06:21:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658470873; x=1690006873;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h4H/Zx6LklP4XR6ejecTuQCa5GmpUXVBaolU3VL7Erc=;
  b=cxP7XIORKZDpLVNBS5MwtFqDUtaJ+SmlbCQzczUvA/F8j4/kiWUQrvpV
   +5dRC9PE+4BXjkr1zbOxESIosDrWuVcKzZtD1miz/Uc4M/+9yj2mC91rd
   kUSDTBaZH9z4u03fC7Chrbbg8ca4kymmrXbhCQr2nzRWFkvkR/5IBgXeN
   7dK8uhcz6n0hsdKgrngHSXzrmcfJi+Tl1K3k+8gTY3WuvTXG9EDKCUnY4
   vl5kjOtnlGffPrOKsuWbkIXlS/wb696pyrpSL8WCMUuFkM/6ShhJawjBD
   dwuiB9PVN9vWm4i80S8p3u4CH+KfTe1xSQuft85VHkFC+z6klvziOZfVj
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10415"; a="288416514"
X-IronPort-AV: E=Sophos;i="5.93,184,1654585200"; 
   d="scan'208";a="288416514"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2022 23:21:10 -0700
X-IronPort-AV: E=Sophos;i="5.93,184,1654585200"; 
   d="scan'208";a="626439407"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2022 23:21:02 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
	by paasikivi.fi.intel.com (Postfix) with SMTP id 8778B20359;
	Fri, 22 Jul 2022 09:21:00 +0300 (EEST)
Date: Fri, 22 Jul 2022 06:21:00 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
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
Message-ID: <YtpBzCf+Vc3yWSUF@paasikivi.fi.intel.com>
References: <YtHPJNpcN4vNfgT6@smile.fi.intel.com>
 <20220715204841.pwhvnue2atrkc2fx@skbuf>
 <YtVSQI5VHtCOTCHc@smile.fi.intel.com>
 <YtVfppMtW77ICyC5@shell.armlinux.org.uk>
 <YtWp3WkpCtfe559l@smile.fi.intel.com>
 <YtWwbMucEyO+W8/Y@shell.armlinux.org.uk>
 <YtW9goFpOLGvIDog@smile.fi.intel.com>
 <YtXE0idsKe6FZ+n4@shell.armlinux.org.uk>
 <YtZwU9BKAO/WSRmK@paasikivi.fi.intel.com>
 <20220720225652.4uo6fcdcunenej3j@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220720225652.4uo6fcdcunenej3j@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_232113_713876_A7B07FC1 
X-CRM114-Status: GOOD (  29.64  )
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

Hi Vladimir,

On Thu, Jul 21, 2022 at 01:56:52AM +0300, Vladimir Oltean wrote:
> Hi Sakari,
> 
> On Tue, Jul 19, 2022 at 08:50:27AM +0000, Sakari Ailus wrote:
> > Basically what your patch is doing is adding a helper function that creates
> > an fwnode with a given name. This functionality was there previously through
> > software_node_register_nodes(), with node allocation responsibility residing
> > on the caller. It's used e.g. here:
> > drivers/media/pci/intel/ipu3/cio2-bridge.c .
> > 
> > The larger question is perhaps when can you safely remove software nodes.
> > And which of these two APIs would be preferred. I haven't checked how many
> > users each has. There's no refcounting nor locking for software nodes, so
> > once made visible to the rest of the kernel, they're always expected to be
> > there, unchanged, or at least it needs to be known when they can be removed.
> 
> Just for my clarity, are you saying that this printf selftest is
> violating the software nodes' expectation to always be there unchanged
> and never be removed?

No. This is the other case, i.e. it's known the nodes can be removed.

> 
> static void __init fwnode_pointer(void)
> {
> 	const struct software_node softnodes[] = {
> 		{ .name = "first", },
> 		{ .name = "second", .parent = &softnodes[0], },
> 		{ .name = "third", .parent = &softnodes[1], },
> 		{ NULL /* Guardian */ }
> 	};
> 	const char * const full_name = "first/second/third";
> 	const char * const full_name_second = "first/second";
> 	const char * const second_name = "second";
> 	const char * const third_name = "third";
> 	int rval;
> 
> 	rval = software_node_register_nodes(softnodes);
> 	if (rval) {
> 		pr_warn("cannot register softnodes; rval %d\n", rval);
> 		return;
> 	}
> 
> 	test(full_name_second, "%pfw", software_node_fwnode(&softnodes[1]));
> 	test(full_name, "%pfw", software_node_fwnode(&softnodes[2]));
> 	test(full_name, "%pfwf", software_node_fwnode(&softnodes[2]));
> 	test(second_name, "%pfwP", software_node_fwnode(&softnodes[1]));
> 	test(third_name, "%pfwP", software_node_fwnode(&softnodes[2]));
> 
> 	software_node_unregister_nodes(softnodes);
> }
> 
> The use case in this patch set is essentially equivalent to what printf
> does: exposing the software nodes to the rest of the kernel and to user
> space is probably not necessary, it's just that we need to call a
> function that parses their structure (essentially an equivalent to
> calling "test" above). Could you indicate whether there is a better
> alternative of doing this?

I'm actually not suggesting to do otherwise. What I wanted to say was that
it'd be best to settle with a single API to create software nodes while
keeping in mind serialising access to the data structure as well as
the lifetime of the software nodes.

This patch is adding another API function to register software nodes which
expands the scope of another that effectively did not allow sub-nodes.
Lifetime management currently doesn't really exist for ACPI nodes (device
or data) and only exists in somewhat unsatisfactory form for DT nodes. That
might be still the best model for software nodes.

Perhaps the API this patch adds is nicer to use than
software_node_register_nodes() and better lends itself for adding
refcounting later on.

I wonder what Andy or Heikki think.

-- 
Kind regards,

Sakari Ailus

