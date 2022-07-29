Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EBAEC00144
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 12:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QUSVGWQo9+0yFcl0+T/fuexf/i1kh24Phd+nCUlGSuQ=; b=Ao6fda1AsPHUAFlTmcHoS9XO/K
	inmt3beiVVDV+WXv5Kf/MqWmlCRd/Kao0qCUG3H5h0Mlcjhn0g1dkRx+EWa4otZgd5PdZGBBQYP0K
	fy6JBN6YreiYBZx+UAuoGXGr91igQPrb6tWHqsvl6+ur/yOsjnssfZUHxCpBe/5wUB7sfhWDBeUAf
	BxsOPNVqG3ZqICnJybug+uznSfAvyw2sax7iTrzcMdqgHOrvRClTf0AeRNC7aI4dYUxKa14+vYpqd
	ym5S9hYgRLfuDufWhssYk6lk1pJ0NNYHfypUhNTyG9Qbm7cFPHuyK+Ae94SacNMkvUhOqqLN9KN8y
	p7oC30lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHOpq-004fSY-4M; Fri, 29 Jul 2022 12:11:18 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHOpb-004eak-Gv; Fri, 29 Jul 2022 12:11:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659096663; x=1690632663;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=BU/nh2fbY29DK8WaA1aA/wBUoWc0oOBzxFt4YYd12KM=;
  b=T/jLBc2wqYj1Hry+J652bBosk9px4IoAj8ByCrOpQY/KHh5SPBu7FyPE
   hKgWod1bmsr/5RSvo1VxRbOBPepMLmWr71OeohYJc7PBDSWetNa3AJI/b
   GnJQLfIDCHfEYTgInFpCuF57Mwf5TyJN6v0ye5toZ9SYIiXpnxHt3ePh6
   ux2eT8eAslDTjFdDWNX6BKa4RUYkxEIV6dNM7jN70WW5ak9qMJFD/nXmc
   Bloi4WgLFIsBTNjV0NKUhva6d4TVTU3HrH3agGJxW2f4gy7EAuIMoz3iA
   ChV5fePClHsbB0nKx9f6ALA8DVM/jt/5TpM5V0tuD4VRaPvVxESPH2hg3
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10422"; a="350459397"
X-IronPort-AV: E=Sophos;i="5.93,201,1654585200"; 
   d="scan'208";a="350459397"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2022 05:08:41 -0700
X-IronPort-AV: E=Sophos;i="5.93,201,1654585200"; 
   d="scan'208";a="604947944"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2022 05:08:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1oHOn8-001eTi-0s;
	Fri, 29 Jul 2022 15:08:30 +0300
Date: Fri, 29 Jul 2022 15:08:30 +0300
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
Message-ID: <YuPNvr9RkaJoZdRg@smile.fi.intel.com>
References: <20220715204841.pwhvnue2atrkc2fx@skbuf>
 <YtVSQI5VHtCOTCHc@smile.fi.intel.com>
 <YtVfppMtW77ICyC5@shell.armlinux.org.uk>
 <YtWp3WkpCtfe559l@smile.fi.intel.com>
 <YtWsM1nr2GZWDiEN@smile.fi.intel.com>
 <YtWxMrz3LcVQa43I@shell.armlinux.org.uk>
 <YtWzWdkFVMg0Hyvf@smile.fi.intel.com>
 <20220718223942.245f29b6@thinkpad>
 <YtXHFQqB3M5Picdl@smile.fi.intel.com>
 <20220719091800.3116daf1@dellmb>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220719091800.3116daf1@dellmb>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_051103_677768_DA7B43D6 
X-CRM114-Status: GOOD (  15.19  )
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

On Tue, Jul 19, 2022 at 09:18:00AM +0200, Marek Behún wrote:
> On Mon, 18 Jul 2022 23:48:21 +0300
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Jul 18, 2022 at 10:39:42PM +0200, Marek Behún wrote:
> > > On Mon, 18 Jul 2022 22:24:09 +0300
> > > Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

...

> > > 2. even if there was a problem with name collision, I think the place
> > >    that needs to be fixed is swnode system. What use are swnodes if
> > >    they cannot be used like this?  
> > 
> > Precisely, that's why I don't want to introduce an API that needs to be fixed.
> 
> Aha, so you want to ensure that root swnodes are created with unique
> name?
> 
> Can't we just make it so that named software node must have a parent?

That's my proposal, but it might have a downside effect on the existing users
(chtwc_int33fe).

-- 
With Best Regards,
Andy Shevchenko



