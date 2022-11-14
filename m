Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D8DC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Nov 2022 11:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4PK2uoIxNq/JS61apD3u3rwjcts2cMtk6ErWR3GMU0I=; b=kcRbLM6Td7G8lBELPBuFLXwdD9
	lxPQlWmVQ8dzJh3M/VJs8DphfZahUVtDDEwbIXg5Z+tAZHLN97+E0rfqfLNQ1PMhWfG5fElYJ33cS
	1UgshpPTU7bDCiVppvTiBhxI6uRblBXKkmpmEw+vaVeUSpf3rbp9j42ryBfZBN7qIh3IRnhp8m/bY
	/csUatsLfDLrVWdoPvCMYjqAIvoWwFyglNqjqh97ELh3N29ExsZA2fTJFj6cJ6XzKDDahCLejiFpl
	+7KXeXjBbnTn9ijS1f7Q3hl9fkjidMOSOx4o1UXYOrO21lxMuScJo5jWOdaL8COgYzbFUdu1iQi7I
	YyWx7Z7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouXy2-000Xrt-7U; Mon, 14 Nov 2022 11:49:34 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouXwm-000Wwo-Pd; Mon, 14 Nov 2022 11:48:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668426496; x=1699962496;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=et5ooO3+9cxyBYZTT10TA21nSmeMTtt6nI129QLnXM4=;
  b=Ktc9nwpHxYPmYN1ndNzpD1Tr4HqsAb2ikq8podtz8bpXIR/FLAx1GvSD
   3lC8dw6rBXngJM7SWXR1idsLFmfL9pBoJk/A0Uig2ns4T8MMbPUKjqYYq
   O1KW3UAl0f69n+D1ZrC8ZX+DlSfL/BXSs5cwecApH0M37YLLCmYCrHBDt
   HmzKyK4GK2x8gZuGPRkGwGtU7Yfl7Mr7OgkIfZE5fHuSdex6Oeqc+dm4u
   0BKUBoECiq7Go4AqkYhfaUyHlR+C5xv3EOeyGILSoDQqOHTCBy1YLUWRW
   n+MuOjhEcc1e7MXwjyw1Tt5RwmH9vKbHU0AoM+bB89441lYEVF2rwjwNE
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="310657530"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="310657530"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2022 03:48:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="780896891"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="780896891"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 14 Nov 2022 03:48:01 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ouXwU-00C9Kh-33;
	Mon, 14 Nov 2022 13:47:58 +0200
Date: Mon, 14 Nov 2022 13:47:58 +0200
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
Message-ID: <Y3Iq7tuSveejlVEU@smile.fi.intel.com>
References: <20220906135004.14885-1-andriy.shevchenko@linux.intel.com>
 <Y1gZ/zBtc2KgXlbw@smile.fi.intel.com>
 <Y1+NHVS5ZJLFTBke@google.com>
 <Y1/qisszTjUL9ngU@smile.fi.intel.com>
 <Y2pmqBXYq3WQa97u@smile.fi.intel.com>
 <Y3IUTUr/MXf9RQEP@google.com>
 <Y3IWMe5nGePMAEFv@smile.fi.intel.com>
 <Y3IbW5/yTWE7z0cO@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3IbW5/yTWE7z0cO@kroah.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_034816_974093_7733A98E 
X-CRM114-Status: GOOD (  24.66  )
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

On Mon, Nov 14, 2022 at 11:41:31AM +0100, Greg Kroah-Hartman wrote:
> On Mon, Nov 14, 2022 at 12:19:29PM +0200, Andy Shevchenko wrote:
> > On Mon, Nov 14, 2022 at 10:11:25AM +0000, Lee Jones wrote:
> > > On Tue, 08 Nov 2022, Andy Shevchenko wrote:
> > > > On Mon, Oct 31, 2022 at 05:32:26PM +0200, Andy Shevchenko wrote:
> > > > > On Mon, Oct 31, 2022 at 08:53:49AM +0000, Lee Jones wrote:
> > > > > > On Tue, 25 Oct 2022, Andy Shevchenko wrote:
> > > > > > 
> > > > > > > On Tue, Sep 06, 2022 at 04:49:53PM +0300, Andy Shevchenko wrote:
> > > > > > > > There are several users of LED framework that reimplement the
> > > > > > > > functionality of led_init_default_state_get(). In order to
> > > > > > > > deduplicate them move the declaration to the global header
> > > > > > > > (patch 2) and convert users (patche 3-11).
> > > > > > > 
> > > > > > > Dear LED maintainers, is there any news on this series? It's hanging around
> > > > > > > for almost 2 months now...
> > > > > > 
> > > > > > My offer still stands if help is required.
> > > > > 
> > > > > From my point of view the LED subsystem is quite laggish lately (as shown by
> > > > > this patch series, for instance), which means that _in practice_ the help is
> > > > > needed, but I haven't got if we have any administrative agreement on that.
> > > > > 
> > > > > Pavel?
> > > > 
> > > > So, Pavel seems quite unresponsive lately... Shall we just move on and take
> > > > maintainership?
> > > 
> > > I had an off-line conversation with Greg who advised me against that.
> > 
> > OK. What the reasonable option we have then?
> 
> I thought there is now a new LED maintainer, is that not working out?

No new (co-)maintainer due to stale mate situation as far as I can read it
right now.

-- 
With Best Regards,
Andy Shevchenko



