Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159F9C001B0
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 06:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W6HrL3BtCHrhgmTaDJWjy/HoC/K/v738+OyJgwUgiIs=; b=BgcyKRVAjpqU9XEECuC8x06YEt
	W4hdxva6nyuupXaUpUvm4v8HY26m8Qs949HXE/kxpMuIDpegetc6Z/oaIpDk8Yfp2XdyBgGAEQr5w
	rC83TDntzsbh6qTs4fpcCRgcm+4qMMZWiPkQX2uskQnST3Dg/E2nkWu+2e20mJen8+C1hq/KzmGt8
	gZhuuY8z1PDYYGq2APApyy5eeitInKishTxh3Y6VEMw5SP4CDIq31kN9tyDLUkKI7n+lzsaJ8Wp6x
	pAyr/HmUvtvgVkI+XZNi41Tys7nfvZVDunawdvQctDy6R4g1cifJpK7IOybg/mCfMb19zKU1/YnHT
	RWKy+NWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM14w-005xcP-2b;
	Wed, 19 Jul 2023 06:54:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM14d-005xRK-0J;
	Wed, 19 Jul 2023 06:54:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=W6HrL3BtCHrhgmTaDJWjy/HoC/K/v738+OyJgwUgiIs=; b=P/0EYbpSuFJGzjcDzDBWeHM5r0
	GhlvrIMb4zme9bwXsQNadue+3U176AjkgDGjdSEnQJ3gejwb5JN9cWHDVKknJvbTkAKSYbmxMgxNO
	MukME2171RMOaKMCeB2VyX/ksqx6DKmBVzH2awaN1fF3pBe0pyxMVp0PxX0xO/PisktxJBQoS+bmx
	sf2/d2tCe3M1IuovYqqdDi9Ah2XrzF2R4hYnfFG5f8i2M1fshwUVXrAdzbAQvkjq7UFjdqwcQTLA0
	2j8IkVeTo9B2nvIuqnYCqSUCyXqLmTmk/i6WGlmowyWeq8f/pv/jn2xbeuIZNzcd6OKHyIYRJWIzR
	ayK2iSLg==;
Received: from mga12.intel.com ([192.55.52.136])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLlBe-00BbSO-2g;
	Tue, 18 Jul 2023 13:56:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689688582; x=1721224582;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V7uObewKKMsSFKcANEcQ6EZsbUKYMZQzdkpGT+xME/c=;
  b=X+Ff+hsNvlGWkAjPkAoJaxMbINoSzKsigZWadQKnnw8km3ER6oFfZBxZ
   iCgarx3JFIQr9KhrHwstks1FgXOL7Mz4okx5mCcMgWjvcN4xtFTOGEH0H
   u1wWtHj1OAS8Tmg/ZSAMEpKEreT9VQIBshwibSaUw+Lgn3iHzM4DCoD2z
   q4DtGHdqynhwOQzx6ybb/aUtGgWCWOiz3tTRy4toe53YZI2koDGNIT4h3
   4QNXTghTCmAORj+llISLUWfhZ9Dub4uYdlCEBfOXViyT3JMk35kSLWk/q
   99xWPsXTq50eVpwiFyfQBDHFq6n0h37QUMTX0uFwTaW5/xtDtqUdqdK8y
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="345803882"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; 
   d="scan'208";a="345803882"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 06:55:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="793630354"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; 
   d="scan'208";a="793630354"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 18 Jul 2023 06:55:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qLlAr-00FzOP-0Z;
	Tue, 18 Jul 2023 16:55:33 +0300
Date: Tue, 18 Jul 2023 16:55:32 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
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
	linux-pm@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Len Brown <len.brown@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sean Wang <sean.wang@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Pavel Machek <pavel@ucw.cz>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 05/10] pinctrl: lynxpoint: Make use of pm_ptr()
Message-ID: <ZLaZ1NLcACjqB02i@smile.fi.intel.com>
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
 <20230717172821.62827-6-andriy.shevchenko@linux.intel.com>
 <20230718110620.0000218e@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718110620.0000218e@Huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_145624_959533_9D8B8D06 
X-CRM114-Status: GOOD (  13.85  )
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

On Tue, Jul 18, 2023 at 11:06:20AM +0100, Jonathan Cameron wrote:
> On Mon, 17 Jul 2023 20:28:16 +0300
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> 
> > Cleaning up the driver to use pm_ptr() and *_PM_OPS() macros that
> > make it simpler and allows the compiler to remove those functions
> > if built without CONFIG_PM and CONFIG_PM_SLEEP support.

> Those macros

I believe you meant here "The SYSTEM_SLEEP... macro..."

Or is runtime PM also altered? Hmm...

> add a load more callbacks... Whilst that may well be fine,
> you should definitely mention that in this patch description.

Sure.

-- 
With Best Regards,
Andy Shevchenko



