Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51514C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 13:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BlE62g7DSeyKjgYvPdQz+WbnS2IpJ4glHIERNdg32+w=; b=HvE6fsmJzQL+o7nRbCwZbKG+i1
	r0Vou/hqvVagUDu5ockhM9V4Y63cwb4bvBklPbwi2BEmhAnmncHeTXdMslm2UmLtOdPI/Iljt+Nqs
	SFc9FngVwQPXayDLMpPbCUfdlMHIaTV+s4QyHaTxKQWWW79rJsTzaBVgG3nkitnkkxqhuzwn9iDPQ
	DaQGGoiGB2kg0pNbY4ck0O+Guo9PWGUX4vdR379LfS6PFop+bASNX/RQCMgx2L0HPvvJMEtY17m7B
	IS7niny8ZQu4GPHxmlq/sVlotzJFyob3iWbH5d/nd59zQ8IA11y5EPWkRKAVltCSNXmTDWTdlNfDE
	FCt6TFCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxTUT-009gZA-Jz; Tue, 22 Nov 2022 13:39:09 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxTUI-009gWI-KP; Tue, 22 Nov 2022 13:39:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669124338; x=1700660338;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=++lP3KudX1Bg9p4n7EIiOiN/6GstJqa2TC078+e0FNM=;
  b=R2eMNde6ydsDlxhi6bdPIpUmV6BLLWKpqlrFTrYipd8KZPGHGAH5np2O
   Riwr0I0mGnZiiOldawIQEPXgo7bplRzetR3IZ80vO2gWKdHORLNaq7LeF
   bpY0yuUuw3w0V3SP3TKOSwL2FayXDS3DmaXCqSDyqbYZ0gFt2JQXYLrBc
   VtzLqL1PgyBHCZWq73RKfuu5Wkow8izL21HJ5Dfp3LSFhkUHb3NnheyD/
   Gzb9Sd9pTVscJ5FR3ZrNK3G8RXo8NBf8390hzh8wkaYoudpvPotGAIxDN
   5jm+QEdDnYVEEx5gWBNVgzisc8FchLhxKBxcIwu3/CU2mfd2eFBFzAe/S
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="378072261"
X-IronPort-AV: E=Sophos;i="5.96,184,1665471600"; 
   d="scan'208";a="378072261"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2022 05:38:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="674349310"
X-IronPort-AV: E=Sophos;i="5.96,184,1665471600"; 
   d="scan'208";a="674349310"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 22 Nov 2022 05:38:48 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1oxTU5-00Fqhm-2v;
	Tue, 22 Nov 2022 15:38:45 +0200
Date: Tue, 22 Nov 2022 15:38:45 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lee Jones <lee@kernel.org>, Gene Chen <gene_chen@richtek.com>,
	Andrew Jeffery <andrew@aj.id.au>, linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Kurt Kanzenbach <kurt@linutronix.de>, Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH v3 00/11] leds: deduplicate led_init_default_state_get()
Message-ID: <Y3zQ5ZtAU4NL3hG4@smile.fi.intel.com>
References: <20220906135004.14885-1-andriy.shevchenko@linux.intel.com>
 <Y1gZ/zBtc2KgXlbw@smile.fi.intel.com>
 <Y1+NHVS5ZJLFTBke@google.com>
 <Y1/qisszTjUL9ngU@smile.fi.intel.com>
 <Y2pmqBXYq3WQa97u@smile.fi.intel.com>
 <Y3IUTUr/MXf9RQEP@google.com>
 <Y3IWMe5nGePMAEFv@smile.fi.intel.com>
 <Y3IbW5/yTWE7z0cO@kroah.com>
 <Y3Iq7tuSveejlVEU@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3Iq7tuSveejlVEU@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_053858_754486_BCF6AB86 
X-CRM114-Status: GOOD (  25.57  )
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

On Mon, Nov 14, 2022 at 01:47:58PM +0200, Andy Shevchenko wrote:
> On Mon, Nov 14, 2022 at 11:41:31AM +0100, Greg Kroah-Hartman wrote:
> > On Mon, Nov 14, 2022 at 12:19:29PM +0200, Andy Shevchenko wrote:
> > > On Mon, Nov 14, 2022 at 10:11:25AM +0000, Lee Jones wrote:
> > > > On Tue, 08 Nov 2022, Andy Shevchenko wrote:
> > > > > On Mon, Oct 31, 2022 at 05:32:26PM +0200, Andy Shevchenko wrote:
> > > > > > On Mon, Oct 31, 2022 at 08:53:49AM +0000, Lee Jones wrote:
> > > > > > > On Tue, 25 Oct 2022, Andy Shevchenko wrote:
> > > > > > > > On Tue, Sep 06, 2022 at 04:49:53PM +0300, Andy Shevchenko wrote:
> > > > > > > > > There are several users of LED framework that reimplement the
> > > > > > > > > functionality of led_init_default_state_get(). In order to
> > > > > > > > > deduplicate them move the declaration to the global header
> > > > > > > > > (patch 2) and convert users (patche 3-11).
> > > > > > > > 
> > > > > > > > Dear LED maintainers, is there any news on this series? It's hanging around
> > > > > > > > for almost 2 months now...
> > > > > > > 
> > > > > > > My offer still stands if help is required.
> > > > > > 
> > > > > > From my point of view the LED subsystem is quite laggish lately (as shown by
> > > > > > this patch series, for instance), which means that _in practice_ the help is
> > > > > > needed, but I haven't got if we have any administrative agreement on that.
> > > > > > 
> > > > > > Pavel?
> > > > > 
> > > > > So, Pavel seems quite unresponsive lately... Shall we just move on and take
> > > > > maintainership?
> > > > 
> > > > I had an off-line conversation with Greg who advised me against that.
> > > 
> > > OK. What the reasonable option we have then?
> > 
> > I thought there is now a new LED maintainer, is that not working out?
> 
> No new (co-)maintainer due to stale mate situation as far as I can read it
> right now.

So, any suggestion on how to proceed here?

De facto we have no patch flow in LED subsystem and the queue is growing...

-- 
With Best Regards,
Andy Shevchenko



