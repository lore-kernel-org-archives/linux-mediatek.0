Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B05AEE4993
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Aug 2023 17:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NSTYgfBedNeya8ivUvO1hd1HXfTDAREoQdbH6qfyuew=; b=rjStOpROi4SGVOk1wO5b+2epMo
	AQPpa4GA3odkYUWlMS1C2Rwswhbb7uiVZ36Ni4ovIcN/pSUKjNPHiQ7R3K/kRF71L6GA9Mf3fB3pK
	FX+Eqadi1oh0XK56+Ds8dthXlbzfalx3J55wl90nhefS+PHkKS0NZsSZyks4IebytU6/xwGffCoOR
	c3lUel3EhSIVGN/VTMvyhNVRjXO0ILqJ6V6oLE3TIkrz1hvn9XGz3gjhAAL4bjZmZQ/lC94jdiGdu
	g8LXpBa6hlzuBI8xrKJJdmV5VC3Zde8vQkwr2TB95t3a7cYYnTmxnxodKkB+gU+tEXyWulOJRnBn2
	Jqt6tlWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qY8Gq-00EPMa-1E;
	Mon, 21 Aug 2023 17:00:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qY8Gn-00EPMO-35;
	Mon, 21 Aug 2023 17:00:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NSTYgfBedNeya8ivUvO1hd1HXfTDAREoQdbH6qfyuew=; b=OxLrotbVWlpkf0LJ5MxU2ssEPe
	9ukPSHVi56t/K6z7YjEhBh+mNRCElToylRNtOEL5zCnKJl4H/iIPnGzF8V2l3a9iFaqoG1+r579Y2
	FOx3nmoxLleYl43YB1I9KKPIddMXskT3cKgPvrAG/ahDK57igh7EswN5Kg45qTQ2DALfr/Sw3RPTd
	HzdyFLYrl7xibQRhoUISYT6gaGtiSXV6Hg5gvGSgQ3168AbGSRTKlZ/Y3QqIEhHXziY4Q+duc2Y+U
	j9XaNEik8avXwfRzcaKapvEJjR0NWkA12IibiuZlnKQNZTehmgC56qfkKB7roKG6HJg8vxGqHrLBx
	wQJaZmZg==;
Received: from mgamail.intel.com ([192.55.52.120])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qY8Gh-001fuD-29;
	Mon, 21 Aug 2023 17:00:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692637243; x=1724173243;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n7S/UFEeowdzIZmbsuVfPC9j0Vf3rJq/KFb1fvy2s7A=;
  b=T55gU49nOBjTcHTBJyDwdEtXTt7JoEc61qZrI1pgIUcTRTdAV3Mc1c9F
   W9JduviRCfRwTqAIBknbsZ93hcMfY+TCXMEUh/Xn2O4Ie+0l3DK8NBlVY
   zM/fOo/uutEp4beQrEm6cRHb9rHovhxfigK3wM0WLYmTTKnMi49gb+xDT
   JbJfMlArrI5xlRt10sC7YXPq17vMseUqOIAcMjan4eQftaMD+DyGM2sMF
   pnXF6qtVWWVPIgFmkryA8GoUjNtLTGCGcN7YpExZOkGoW1D2DV7OOJUb5
   AcZHy/9VXD6zCzXeiMl0m6CSpVq5QAqYuJxm0oJvQszbEX9BWfaLJGUPm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="372546687"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="372546687"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 10:00:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="826004434"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="826004434"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Aug 2023 10:00:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qY8G7-005X2E-2I;
	Mon, 21 Aug 2023 20:00:07 +0300
Date: Mon, 21 Aug 2023 20:00:07 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Balsam CHIHI <bchihi@baylibre.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 00/10] pinctrl: Provide NOIRQ PM helper and use it
Message-ID: <ZOOYFxDktwce79Yc@smile.fi.intel.com>
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_180044_572422_D74E81D3 
X-CRM114-Status: GOOD (  18.46  )
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

On Mon, Jul 17, 2023 at 08:28:11PM +0300, Andy Shevchenko wrote:
> Intel pin control drivers use NOIRQ variant of the PM callbacks.
> Besides that several other drivers do similar. Provide a helper
> to make them smaller and less error prone against different
> kernel configurations (with possible defined but not used variables).
> 
> The idea is to have an immutable branch that PM tree can pull as well as
> main pin control one. We also can do other way around, if Rafael prefers
> that.

I have partially applied the series to my review and testing queue with
the following changes (besides the tags added):
- split pm_ptr() patches to be first with lynxpoint commit message updated
- fixed wording in the pm.h comment
- amended cherryview to wrap long line
- explained __maybe_unused and pm_ptr() changes in at91 commit message
- added pm_sleep_ptr() and explained that in the tegra commit message
- renesas and mvebu went as is
- intel and mediatek left aside for better rework

 drivers/pinctrl/intel/pinctrl-baytrail.c    | 11 +++--------
 drivers/pinctrl/intel/pinctrl-cherryview.c  | 10 +++-------
 drivers/pinctrl/intel/pinctrl-lynxpoint.c   |  7 +++----
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 14 +++-----------
 drivers/pinctrl/pinctrl-at91.c              | 10 ++++------
 drivers/pinctrl/renesas/core.c              | 16 +++++++---------
 drivers/pinctrl/tegra/pinctrl-tegra.c       |  5 +----
 drivers/pinctrl/tegra/pinctrl-tegra210.c    |  2 +-
 include/linux/pm.h                          |  9 +++++++++
 9 files changed, 34 insertions(+), 50 deletions(-)


-- 
With Best Regards,
Andy Shevchenko



