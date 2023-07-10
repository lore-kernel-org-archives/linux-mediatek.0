Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EAA2EB64D9
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 13:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rti924grr2qhV3F8xJTpAPcyMxwEFIjMr3HbDXVlN0E=; b=YftLndW3GCfjbKGhl5gfTVwNZN
	jUPSKPy9upP+S27CSHx+LobqXS9bhHl67zqAv/+zZn3Xocc5iTpqmgzdSyACYTCJVwxrYe6RUoVaX
	JR87F36fmcZZGHJICQkWC0yuX1UZ41ZjsvZtumnXsJEwuRNbPzmtWcHgWBTdCkEAHmJ+Z8Y8ycp5N
	MtEvIyTs+/4VU89V3TJZTo1aA2Hwg0ctwGf2QFtIWV0OP2JUBxkIVF+w4OR8QuoskWLdjI2/dyC2M
	kf1jGua9rrhX0kuRbKWb9wMcRwkZpSnx3Hw24dGmvlOOssTh278M8HSDiazZ1lJcA0itqVwD76qJ4
	BnN/bdqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIr07-00Bld1-2g;
	Mon, 10 Jul 2023 13:32:27 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIr04-00Blag-1R;
	Mon, 10 Jul 2023 13:32:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688995944; x=1720531944;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PcgdfCqBIbPTu4JqQZu5q+HYQGpr7DWOm49hDVjk5i0=;
  b=M+b6XZw/OXehX/c3Cmi09IN8iTHYBE7Cb5JC+4vQXidDgFRQzLLvHMwV
   eaZj7KcHS3qPMrHWmj/0XNeqJKp0OBwHwoTijRvw062MlU505sNmT6vzH
   gY6b9gJLvBZVvkbLmwuUNpm4Qcvp+PGpWcSctvYUtgHxf9Ops/cL+JAHe
   aK2qYW8ZBzFpjLokUrqE0LQfqUfSPbcqM2O7vcxqkBT++GFx3ypUIBXXN
   mlKtEtXxNfjL4P0fGo1aGqRuFblZIgnFNzYRRtM3ZgaIENJzg+MO0KHds
   qIiviU+tXXqwheLNEPcaw3eh+mOy8TFxZMofkKrvXSMDOWzm6TCZbEIGy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="428037969"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="428037969"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 06:32:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="790802176"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="790802176"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 10 Jul 2023 06:32:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qIqzq-001Z8L-0E;
	Mon, 10 Jul 2023 16:32:10 +0300
Date: Mon, 10 Jul 2023 16:32:09 +0300
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
Message-ID: <ZKwIWUeqD/otnSFM@smile.fi.intel.com>
References: <20230710102751.83314-1-andriy.shevchenko@linux.intel.com>
 <20230710102751.83314-5-andriy.shevchenko@linux.intel.com>
 <1ffd5603-4140-4bf6-bfed-af70a6759bda@sirena.org.uk>
 <ZKvmkAP5ZuT6lGLN@smile.fi.intel.com>
 <ZKvnPXl9H+cQR8Ok@smile.fi.intel.com>
 <353027bf-6d2a-40de-9e18-8553864b343c@sirena.org.uk>
 <ZKv7p96D2B9vYd0J@smile.fi.intel.com>
 <7aff8759-cfca-47b5-b995-5260e5082c45@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7aff8759-cfca-47b5-b995-5260e5082c45@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_063224_529420_9E6DD8A0 
X-CRM114-Status: GOOD (  17.16  )
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

On Mon, Jul 10, 2023 at 02:21:05PM +0100, Mark Brown wrote:
> On Mon, Jul 10, 2023 at 03:37:59PM +0300, Andy Shevchenko wrote:
> > On Mon, Jul 10, 2023 at 12:22:59PM +0100, Mark Brown wrote:
> > > On Mon, Jul 10, 2023 at 02:10:53PM +0300, Andy Shevchenko wrote:

...

> > > > > > > Convert the users to SPI_CONTROLLER_NO_?X and SPI_CONTROLLER_MUST_.X
> > > > > > > and kill the not used anymore definitions.

...

> > > > > > > -	controller->flags = SPI_MASTER_MUST_RX | SPI_MASTER_MUST_TX;
> > > > > > > +	controller->flags = SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX;
> 
> > > What part of the above change is replacing _NO_ with _MUST_?
> 
> > None, that's why assuming the split by name should be fine.
> 
> That's what the above changelog sounds like it's trying to do (I'm not
> sure the change itself makes sense but the first thing I ran into when
> reviewing the patch), AFIACT you're missing a "from" in the changelog?

I see, I will elaborate better in v2.
But still, I will split on per macro and add one for GPIO_SS.
Seems to me better that way.

-- 
With Best Regards,
Andy Shevchenko



