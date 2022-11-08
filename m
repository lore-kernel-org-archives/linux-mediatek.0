Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F81BC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 14:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nmobDXOnKIvXSqDf0KznrH6+NdMK57hX9B8Qa4ds58Q=; b=UUMNDh/Xr1ZVoT5gbKB4dylx51
	rhmo+TO7glDgZtrQcZfc73GiO+NrvMMlRhn1Q6CBLxSBgo/rWu2VuKshZ2NmlyQ2ZUqiv5klPyxu0
	qboFAkHwXvIOOvDpWnMjGF4fZNvpdgm87iYCmMLGUCsd19l1/HgoS+r22LvozhFeQWdHM5fRks5za
	H5/oovC3nWiMjer0Hq44LRdQC0eraiiFIgGg0aXrE2SCvqUtD9TU/gK2IYF2kMp/BVtVMoLdFUbzN
	IH+RMGMZN8hkIluiqLsfcetYOTPp+e7/LlJ1+fTSG7vsRWxJZ5Iuo8a5kfd4bpDtm2f6DTNovaJhN
	XpzfFkKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osPXA-005uoD-Vx; Tue, 08 Nov 2022 14:25:00 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osPX0-005uml-F1; Tue, 08 Nov 2022 14:24:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667917490; x=1699453490;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SkQVJcDZAagONBPRjE0wTg4gud81SvHRy4ZcfIKi2yU=;
  b=mTUne7x5L8iban5km9oeaZeRZpSYSbyY70DU5LZVpaC6xYedEWRapzyW
   t+g8BQZvbzCUvhnCVh12VYkQKl8m61CqykDyAKag5TS8t7uGmCH1ZQJ7C
   jen7CxQv3mqaCN+GdyJdOwa3x5lIodO3zdlluTBeIPQOPh8FFn71LgWgH
   NNe04Tgu5zrT4sCyWZJM5dSNQ/T6deQH6l3AE05nVRjD1WtLeIQ6KoUj6
   bYkHitZopA0Btiw0kV61RUiFc+MNL+0VUCHYg9tShzoiZAQcu5fdy1l9t
   fkdd2Y+eqHIycF+RJ7HjOZ+5qtPXPxboexo8ChxW4KobqUl2D38GRJTjr
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="311858517"
X-IronPort-AV: E=Sophos;i="5.96,148,1665471600"; 
   d="scan'208";a="311858517"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2022 06:24:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="630884179"
X-IronPort-AV: E=Sophos;i="5.96,148,1665471600"; 
   d="scan'208";a="630884179"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 08 Nov 2022 06:24:43 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1osPWq-009ANu-2m;
	Tue, 08 Nov 2022 16:24:40 +0200
Date: Tue, 8 Nov 2022 16:24:40 +0200
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
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH v3 00/11] leds: deduplicate led_init_default_state_get()
Message-ID: <Y2pmqBXYq3WQa97u@smile.fi.intel.com>
References: <20220906135004.14885-1-andriy.shevchenko@linux.intel.com>
 <Y1gZ/zBtc2KgXlbw@smile.fi.intel.com>
 <Y1+NHVS5ZJLFTBke@google.com>
 <Y1/qisszTjUL9ngU@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1/qisszTjUL9ngU@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_062450_562866_35FAFC54 
X-CRM114-Status: GOOD (  18.29  )
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

On Mon, Oct 31, 2022 at 05:32:26PM +0200, Andy Shevchenko wrote:
> On Mon, Oct 31, 2022 at 08:53:49AM +0000, Lee Jones wrote:
> > On Tue, 25 Oct 2022, Andy Shevchenko wrote:
> > 
> > > On Tue, Sep 06, 2022 at 04:49:53PM +0300, Andy Shevchenko wrote:
> > > > There are several users of LED framework that reimplement the
> > > > functionality of led_init_default_state_get(). In order to
> > > > deduplicate them move the declaration to the global header
> > > > (patch 2) and convert users (patche 3-11).
> > > 
> > > Dear LED maintainers, is there any news on this series? It's hanging around
> > > for almost 2 months now...
> > 
> > My offer still stands if help is required.
> 
> From my point of view the LED subsystem is quite laggish lately (as shown by
> this patch series, for instance), which means that _in practice_ the help is
> needed, but I haven't got if we have any administrative agreement on that.
> 
> Pavel?

So, Pavel seems quite unresponsive lately... Shall we just move on and take
maintainership?

-- 
With Best Regards,
Andy Shevchenko



