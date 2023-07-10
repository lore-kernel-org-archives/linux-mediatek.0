Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F8AC001B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 11:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T4mGBIVjd0QIoIsESvhPk7mRnkgKZgeBb7x0mMmLakA=; b=XEtGJJXQe0e/eOTFbfPYGked6y
	utIsdXPW18SLRcew8bbejZmCPVKxMvnLXUvYG3GCvmj+/S3+RHeHP54BvYOo+e0YfsqFcqpnEiNdb
	1N99OQXWU927xzSo+zsb3LcfHVsRbeqNa0nShB7TWI2EpJqhfqVLA7IAYVWcCHedxLm2tXf7IP/Zf
	QGA9NzwDKIycI0rHWvuF4OCnzMbdn3qsd08/uIPuw0LBOBJjqNC5nRid0wC9LVPn13EdYV42qpqQm
	hbNedNquGZ9WdB+1Kh/KfAfsddjqil1X1RVSMzyK3qwjBc75UckTyU8XtraigiAu8Rhd34zyoSLLc
	LHeiUpPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIokc-00BR2S-0p;
	Mon, 10 Jul 2023 11:08:18 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIokY-00BR0e-1P;
	Mon, 10 Jul 2023 11:08:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688987294; x=1720523294;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VFbT1YSYy4BNeDq7qC0WXbC9ofiSs7SR6qU8CkE8Ddw=;
  b=J8/3l5FQh9eXSIGZFCIgPwQcQjsO7bmOqfP4T8l0nPWzmKPzqITFQoR4
   bQFSiUei2hrJqasHv8rRYvBBFckmtA09FCKjsDU/gpbxxXhzxIX2xBTu+
   qvT5g6acBz7Y28lx73bYZMnsI+rs4Pq41kH33uBPRz0NdocFhpTKSDbkv
   S4P7n5Mr2YjYGW9eInWffhNLugVF+Qgum9upfTWJqYj4h6L3r5g9/3YLl
   V+CbkkMUPPg6G4YvCatrIjaAS13+P6hWsKYyNXi3o63AIxqQAo0AVtsF2
   FrQ5MO7dxYJUvRETSpFaZOtFlSNP5bgMeuu6H1FuEirhtZ6Y1z4SMK5Bg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="349117632"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="349117632"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 04:08:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="967393168"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="967393168"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP; 10 Jul 2023 04:08:03 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qIokK-001XII-18;
	Mon, 10 Jul 2023 14:08:00 +0300
Date: Mon, 10 Jul 2023 14:08:00 +0300
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
Message-ID: <ZKvmkAP5ZuT6lGLN@smile.fi.intel.com>
References: <20230710102751.83314-1-andriy.shevchenko@linux.intel.com>
 <20230710102751.83314-5-andriy.shevchenko@linux.intel.com>
 <1ffd5603-4140-4bf6-bfed-af70a6759bda@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ffd5603-4140-4bf6-bfed-af70a6759bda@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_040814_914267_D6397B58 
X-CRM114-Status: GOOD (  12.52  )
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

On Mon, Jul 10, 2023 at 12:04:35PM +0100, Mark Brown wrote:
> On Mon, Jul 10, 2023 at 01:27:47PM +0300, Andy Shevchenko wrote:
> 
> > Convert the users to SPI_CONTROLLER_NO_?X and SPI_CONTROLLER_MUST_.X
> > and kill the not used anymore definitions.
> 
> The above is not what this change does:

How to improve it? I was sure that the form of "converting to something and
something" is clear...

> > -	controller->flags = SPI_MASTER_MUST_RX | SPI_MASTER_MUST_TX;
> > +	controller->flags = SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX;

-- 
With Best Regards,
Andy Shevchenko



