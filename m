Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3606C61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Mar 2023 15:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AvDnsBHm4JPVWXbpMekTy6/FhzTPIA1qk63CGBaWUZQ=; b=tJilhrTRQG/Cb4RhP2dE3Hiltm
	rX0NDBxgqQ5JPSsBDn9Po6Iwh94vCDsxkIagUE1rckw6CME3b8ef2ptjfxMDi7qy4FxV8Qg3BtsXo
	MyjXCxhVTP9ur7MbOVrCdFBc0g3Px3vSb6BzsDHZlGwhar1lx8WtfCYn527ucgXjXcfpmiEMlw4Du
	/ebsTzSc9Gh1GteID9t6fSZ4VthKmg55slmACitOAcix5IBl+r17wUBs63dbp7zzDoGrcRDWC/yt+
	dq+ycE6NCy8JeUDXJwyLcP41ohbP5sHZhPYeWVe09zG+5WtragA21q81hpLcTt+zx/5blWcPV6MKi
	v8QkstHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZDBC-00DiXy-OJ; Mon, 06 Mar 2023 15:55:14 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZDAk-00DiNW-H4; Mon, 06 Mar 2023 15:54:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678118086; x=1709654086;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nqBEyqCxPf0CdDuSxcYS7HYgQHSI7GNHr2exg16wCz4=;
  b=jVQzGY7cm78n24RleIe4Y3IOOs3UvWUJWxBpsB/poUmwiF9/IrOrNKZM
   OD+iw8EXaul0+YEKyD++alUsF8rrZaLXwZMBqO6v5iUz9O+Ifd1btlGPa
   3gegQYjR+fJPu8tu63x4Fw3C3HDl/HpPjVOCDftObd0Cf+McdcLyiQwJr
   SZymu+KeyZnGzYLPIvkO1vYi5VFyfxB+B3827udan9BaXt0wN5mvJisGp
   o8ACMGyZtn9lsB9bTVxO+Sxi4lLIsXmEAKeGeM0A3O1mbK4gPyhq9Oqjf
   yC1KptYpTosbjzUQA4ux1R5xkslaiLHrxQEKCz6OBmOJMrNMVGQXW+Alz
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="400411727"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="400411727"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 07:54:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="850346560"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="850346560"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 06 Mar 2023 07:54:40 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pZDAc-00GVWx-0e;
	Mon, 06 Mar 2023 17:54:38 +0200
Date: Mon, 6 Mar 2023 17:54:37 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Gene Chen <gene_chen@richtek.com>, linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Kurt Kanzenbach <kurt@linutronix.de>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH v4 11/11] net: dsa: hellcreek: Get rid of custom
 led_init_default_state_get()
Message-ID: <ZAYMvVR+6eQ9qjAk@smile.fi.intel.com>
References: <20230103131256.33894-1-andriy.shevchenko@linux.intel.com>
 <20230103131256.33894-12-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230103131256.33894-12-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_075446_640886_1CCA18B3 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message.
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

On Tue, Jan 03, 2023 at 03:12:56PM +0200, Andy Shevchenko wrote:
> LED core provides a helper to parse default state from firmware node.
> Use it instead of custom implementation.

Jakub, if you are okay with thi, it may be applied now
(Lee hadn't taken it in via LEDS subsystem for v6.3-rc1).

-- 
With Best Regards,
Andy Shevchenko



