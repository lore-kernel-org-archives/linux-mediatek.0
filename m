Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E56C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 19:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SH0q4/0Ph1jsdncDCF+dgAzmQvF24inFnmuraxQrYeI=; b=RoBHTwJez789iyBq7EurlJbBIW
	pviB5LgBmWn3xWQp7unTQ99KLHFMPdHSMXyxqXRUVrHi/npL5lDgds2kVjXvnZCxcDjetzikMPCqQ
	1LKG/255TBbEaRfK+WUhRPqrECwPfOqB/djNLD87VjmNpujdTd2bBZ1wMVoDAQ5QNkp5Yy6LEuQ2g
	VCqz7cVL9yoMrVtURPMwkIUcZIYTM1IsjE6f9Li2vOTb+ml6Ttoq7Sj/auRMDNjLdNaUvYmZQuTW9
	FoA2FhLoFKZU/lER8MS0vth8IO3XGLK8cu4s6nrFHwfknPY8mgD21R5GiIDSpJ8NdfAW/TslxQU4s
	4xC7p9PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCRSL-009zmt-Rr; Fri, 15 Jul 2022 19:58:33 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCRSA-009zlY-Fv; Fri, 15 Jul 2022 19:58:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657915102; x=1689451102;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ehY6mVr5usI1pbUCrRe9NIpChbrEMhuIPu5cO3R+A8k=;
  b=UZxmR0mS2s957SCuHieYMmuClx50CpEUXO/gWb2LNbzm4KTWjFnhb8fv
   GuGqdHIcyIvwJzbiwTurjtibYEmh/3ZSyg8F1EFvEqoxBCbY8RG5FVZ+j
   ArDUADYQ2cnCgtX4HJj5qBC56wLpJIPLSfm4PT7erLjeeGgiTNMExpjr/
   2x3WmN3e+EnOpsM5QYdtwy7cLP1YnRXLwOUjQ6qeOT/uDayW4ZfLO6bFP
   Y+lz8X2MxAEyvlZ3teS/I3GKMifn2ZPYZwoFlCvYTncGmPe55Q6S+gxHi
   68DtsGMkNVJ52Rx1xfY1hix9z6etKc2Rc727UrJQnQDgfqv+uqsfccUmm
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10409"; a="311556296"
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; 
   d="scan'208";a="311556296"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2022 12:58:07 -0700
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; 
   d="scan'208";a="842634224"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2022 12:58:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1oCRRk-001JE8-0C;
	Fri, 15 Jul 2022 22:57:56 +0300
Date: Fri, 15 Jul 2022 22:57:55 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
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
	Vladimir Oltean <olteanv@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Subject: Re: [PATCH net-next 2/6] software node: allow named software node to
 be created
Message-ID: <YtHGwz4v7VWKhIXG@smile.fi.intel.com>
References: <YtGPO5SkMZfN8b/s@shell.armlinux.org.uk>
 <E1oCNky-006e3g-KA@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1oCNky-006e3g-KA@rmk-PC.armlinux.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_125822_581091_A8592DB7 
X-CRM114-Status: GOOD (  10.98  )
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

On Fri, Jul 15, 2022 at 05:01:32PM +0100, Russell King wrote:
> From: Vladimir Oltean <vladimir.oltean@nxp.com>
> 
> Allow a named software node to be created, which is needed for software
> nodes for a fixed-link specification for DSA.

In general I have no objection, but what's worrying me is a possibility to
collide in namespace. With the current code the name is generated based on
unique IDs, how can we make this one more robust?

-- 
With Best Regards,
Andy Shevchenko



