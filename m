Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1BB6C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Nov 2022 10:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SaGmAwHVZx/43wuOYwzGE61uNq+yS8hRAKprJHUM9NE=; b=I5bbSkErTkth9/76YGq2o0oCus
	/H3ERoHNz5BUtjgxKLHs71mIYfg//A0jSMhvc2G2jLi0YAp2DF0daRmkMDW6ZSjPx5kao1+FR8pWu
	qFnf9X+rdsLtA4XhK1ognD9p7fihWowe/7Zm3HVhGhHtf+meFHo8SFL29COR+Xw2Jz+rAvxpQI7fj
	VwOtWRRag6eVqfLCUDG30M5lXsU3jHQNKT4TN9MfSE36uK6E7eKZE+kROFPQa4Tgy/Ib9HApM1BrJ
	VZKyiiX93P+iMASA2mBh/7fi1VwUrl4j3rzD6DHCZVwNfC6s9dkeWzh57ySMloant2hurIlS6mZ+7
	aF0QMAIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouWZC-00HU8y-Uw; Mon, 14 Nov 2022 10:19:50 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouWZ1-00HU3t-Nl; Mon, 14 Nov 2022 10:19:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668421179; x=1699957179;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KcbCz+Nkr/BeXhgReuHAK11MwVuA/5RoWL91hSAe1P8=;
  b=Z9WhW1uTNXQC/IvqFPJlgzTlq3KnYcxP8h53RHEnENDisOWD1FNc5CjO
   k2ghsOVATa3kSY+6MyQMEIvS2siXWumgYD6WyeGqs46bpoz2XPy6Qc9nP
   0Q8u9YV1FDQMQPwzclWZM0wCFM5JjNXSZ9EbP3ZMcZ4fXJoqSLJPQC1lc
   oGadW4/EoL5M9HTY8ZhA3800W6L5gDcztu7mOIcX31DSrpyCj4evTvWXB
   ESKr3r1IfTXva9zh5/6CP7k7EQ3snmubwn3ABGFfdQfJl78x4qG70Ep0b
   OQBEY7oCiNoSYFzNMEnfcl+V8xLg0NQpOzEYhuv/fv/UOGC7NuzJw4Gbe
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="313737843"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="313737843"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2022 02:19:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="589314455"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="589314455"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 14 Nov 2022 02:19:32 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ouWYr-00C7Kz-1G;
	Mon, 14 Nov 2022 12:19:29 +0200
Date: Mon, 14 Nov 2022 12:19:29 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lee Jones <lee@kernel.org>
Cc: Gene Chen <gene_chen@richtek.com>, Andrew Jeffery <andrew@aj.id.au>,
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
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
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 00/11] leds: deduplicate led_init_default_state_get()
Message-ID: <Y3IWMe5nGePMAEFv@smile.fi.intel.com>
References: <20220906135004.14885-1-andriy.shevchenko@linux.intel.com>
 <Y1gZ/zBtc2KgXlbw@smile.fi.intel.com>
 <Y1+NHVS5ZJLFTBke@google.com>
 <Y1/qisszTjUL9ngU@smile.fi.intel.com>
 <Y2pmqBXYq3WQa97u@smile.fi.intel.com>
 <Y3IUTUr/MXf9RQEP@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3IUTUr/MXf9RQEP@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_021939_840859_4EFC8C91 
X-CRM114-Status: GOOD (  20.75  )
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

On Mon, Nov 14, 2022 at 10:11:25AM +0000, Lee Jones wrote:
> On Tue, 08 Nov 2022, Andy Shevchenko wrote:
> > On Mon, Oct 31, 2022 at 05:32:26PM +0200, Andy Shevchenko wrote:
> > > On Mon, Oct 31, 2022 at 08:53:49AM +0000, Lee Jones wrote:
> > > > On Tue, 25 Oct 2022, Andy Shevchenko wrote:
> > > > 
> > > > > On Tue, Sep 06, 2022 at 04:49:53PM +0300, Andy Shevchenko wrote:
> > > > > > There are several users of LED framework that reimplement the
> > > > > > functionality of led_init_default_state_get(). In order to
> > > > > > deduplicate them move the declaration to the global header
> > > > > > (patch 2) and convert users (patche 3-11).
> > > > > 
> > > > > Dear LED maintainers, is there any news on this series? It's hanging around
> > > > > for almost 2 months now...
> > > > 
> > > > My offer still stands if help is required.
> > > 
> > > From my point of view the LED subsystem is quite laggish lately (as shown by
> > > this patch series, for instance), which means that _in practice_ the help is
> > > needed, but I haven't got if we have any administrative agreement on that.
> > > 
> > > Pavel?
> > 
> > So, Pavel seems quite unresponsive lately... Shall we just move on and take
> > maintainership?
> 
> I had an off-line conversation with Greg who advised me against that.

OK. What the reasonable option we have then?

-- 
With Best Regards,
Andy Shevchenko



