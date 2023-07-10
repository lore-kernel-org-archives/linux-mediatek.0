Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D009EB64DA
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 12:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4hlbWr9w/qULlhkq0JEGxt2u2GxZ486E8CfHuUwsRUs=; b=amnMHp7ynmHGlgzy10Yz8DSHOa
	d5wmRaIPskWkwJi7LLmSULMM5KcVnXohn2cPVEihIbsl6P9wFhjyUvR5zrGc+otH+W3tGAU0zFqZ5
	WV71XmA+hRiPYfloGZulUY8/mPr5neyN4b5FkvE6NSVB7kaZkbV9rLiECYcOs+C3p2tvTmLlZs9oh
	b3scwHi1iRyPbRkqGCf1+bxumBLxe/ceboDUQWEwBblgEgCz37peiGOTFWGVQkpJxO1FTJrqKCvZG
	xaPYgWvW5pHgNAalk1wgtywu6RVvip7J4NBXoys15DNh/Q9X5CEwk0P8r9LXoZrRDwXgHqK7N22WY
	23huKBQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIq9i-00BcNZ-1B;
	Mon, 10 Jul 2023 12:38:18 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIq9e-00BcKR-0x;
	Mon, 10 Jul 2023 12:38:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688992694; x=1720528694;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2I7Ns5P9Fqk5itIQUPMwgPj6Db+DdMBwViqY3DgUc6U=;
  b=kkVJ4lJvG5qebUwlZUulmkOEEqO7bWU0QaV/cFseCdZGnbsLj+KyO8bg
   yPYNUpYzTvdg0Uvo50eWbqCb7ut7R0NHqeAreejewXChtK6J8Y6+2j66P
   3dQm0sWGx7JhTEA7y7/DHymvKsLlSa6gsSmThiJMbgV76xsQ6AM1nSdgT
   bELI7X/1z/ujK2wv0qRqHHiWRHoGXeZLXb9sBLhJvY4o543/tcAF4nZDU
   tC5EnAJbSU/2HFM5f5DRlTJeUGN4vCO/ebX+X3+TyTfvFQFI0HA6vPCMZ
   fJnTnoLwFt4jg840dKZjWTfMcrspju3plc2kTrzWfPodY7U4x/v9cKYEq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="428025537"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="428025537"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 05:38:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="755983743"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="755983743"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 10 Jul 2023 05:38:02 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qIq9Q-001YUr-0L;
	Mon, 10 Jul 2023 15:38:00 +0300
Date: Mon, 10 Jul 2023 15:37:59 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Yang Yingliang <yangyingliang@huawei.com>,
	Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
	Kris Bahnsen <kris@embeddedts.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Radu Pirea <radu_nicolae.pirea@upb.ro>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH v1 4/8] spi: Get rid of old SPI_MASTER_NO_.X and
 SPI_MASTER_MUST_.X
Message-ID: <ZKv7p96D2B9vYd0J@smile.fi.intel.com>
References: <20230710102751.83314-1-andriy.shevchenko@linux.intel.com>
 <20230710102751.83314-5-andriy.shevchenko@linux.intel.com>
 <1ffd5603-4140-4bf6-bfed-af70a6759bda@sirena.org.uk>
 <ZKvmkAP5ZuT6lGLN@smile.fi.intel.com>
 <ZKvnPXl9H+cQR8Ok@smile.fi.intel.com>
 <353027bf-6d2a-40de-9e18-8553864b343c@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <353027bf-6d2a-40de-9e18-8553864b343c@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_053814_405856_BC4A64CC 
X-CRM114-Status: GOOD (  16.75  )
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

On Mon, Jul 10, 2023 at 12:22:59PM +0100, Mark Brown wrote:
> On Mon, Jul 10, 2023 at 02:10:53PM +0300, Andy Shevchenko wrote:
> > On Mon, Jul 10, 2023 at 02:08:00PM +0300, Andy Shevchenko wrote:
> > > On Mon, Jul 10, 2023 at 12:04:35PM +0100, Mark Brown wrote:
> > > > On Mon, Jul 10, 2023 at 01:27:47PM +0300, Andy Shevchenko wrote:
> 
> > > > > Convert the users to SPI_CONTROLLER_NO_?X and SPI_CONTROLLER_MUST_.X
> > > > > and kill the not used anymore definitions.
> 
> > > > The above is not what this change does:
> 
> > > How to improve it? I was sure that the form of "converting to something and
> > > something" is clear...
> 
> > A wild guess, maybe you meant to split to two changes, one per each macro group?
> 
> No, doing TX and RX in one commit is fine.

No, I meant one per _NO_ and _MUST_.

> > > > > -	controller->flags = SPI_MASTER_MUST_RX | SPI_MASTER_MUST_TX;
> > > > > +	controller->flags = SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX;
> 
> What part of the above change is replacing _NO_ with _MUST_?

None, that's why assuming the split by name should be fine.

-- 
With Best Regards,
Andy Shevchenko



