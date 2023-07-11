Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 643F4C0015E
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jul 2023 11:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zSwpf6BIANOM40IZH5A99t060WoeRwXcMpZfwrTn5Mk=; b=EtrTK10rS9uB4QLm+Yd6v1tiyB
	RHOXo2/4mrwvryDMLwQMZSOS03RwNkW5CJbOCl7Kww0PYosy+f0Hppqni1g7/VgY/3EoVcHi2mGqG
	4+q2ZhHY4vYFUfcF5JTNqbOZofjlfU+4iqSCet17P9uRfhMuqzvMiEuHOM3gBlunWG9mfZn+21TqO
	sXD2YlgGqlF849ZBNL+DFx3CFG9A46n20uEHFe1XmR4xD9YrL9vaLDodp0UvhJeF5qd7BMlWnVICy
	uQ4W0147+uRJSPS+a0GaI8nGX94WLPqo1OyL6VeiNSWQ78WTZ2NTjUOnnsbsB2YGnzJAaySCz1/ww
	KZhzVO4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJB7i-00EiJf-1g;
	Tue, 11 Jul 2023 11:01:38 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJB7f-00EiIq-0z;
	Tue, 11 Jul 2023 11:01:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689073295; x=1720609295;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g5docwgn1sedQFCIUNy5vO+RB2jnG5735hob/X5gUzk=;
  b=S4JD8JGVdhC7U4fxxI10woMBXFGSFmc6RztWeLvNRXdrHzaU/4Cg62N7
   uWDY9/ZF/m2RxTvNiS259QMUJ3ypVBU30YG2Zdn5Fl7zg3ZhIQfQbNwsq
   CywVaPHzueARlBtxdS/xBeuhOVlgsn+TXpkWf+RoMxMdl4lyEULbMrAeu
   nebf35PKswtOx+QUFdMJfNJrGQ5fb3aUcBp1mm4BQzOp/Y8PRSDnQVOT1
   XDSJGYGmQrRQAfKtB8A4Y2dXHa4QA50VvEI8B4w1gHYQ3GNzXYlUxtEWY
   OejQ7efcw33jyIgkVVOBF8J43ZCcYtVHxtP6OAgmZOYK4pevSpkipk7NJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="368087971"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="368087971"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 04:01:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="715143826"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="715143826"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 11 Jul 2023 04:01:17 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qJB7J-001p8E-30;
	Tue, 11 Jul 2023 14:01:13 +0300
Date: Tue, 11 Jul 2023 14:01:13 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
	Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-trace-kernel@vger.kernel.org, netdev@vger.kernel.org,
	Sanjay R Mehta <sanju.mehta@amd.com>,
	Radu Pirea <radu_nicolae.pirea@upb.ro>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH v2 04/15] spi: Replace open coded
 spi_controller_xfer_timeout()
Message-ID: <ZK02efTYxV3czigr@smile.fi.intel.com>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-5-andriy.shevchenko@linux.intel.com>
 <cfaffa00-4b61-4d81-8675-70295844513b@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cfaffa00-4b61-4d81-8675-70295844513b@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_040135_422284_6EF9E290 
X-CRM114-Status: GOOD (  15.02  )
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

On Mon, Jul 10, 2023 at 06:30:32PM +0100, Mark Brown wrote:
> On Mon, Jul 10, 2023 at 06:49:21PM +0300, Andy Shevchenko wrote:
> 
> > Since the new spi_controller_xfer_timeout() helper appeared,
> > we may replace open coded variant in spi_transfer_wait().
> 
> > + * Assume speed to be 100 kHz if it's not defined at the time of invocation.
> > + *
> 
> You didn't mention this bit in the changelog, and I'm not 100% convinced
> it was the best idea in the first place.  It's going to result in some
> very big timeouts if it goes off, and we really should be doing
> validation much earlier in the process.

Okay, let's drop this change.

> > +	u32 speed_hz = xfer->speed_hz ?: 100000;
> 
> Not only the ternery operator, but the version without the second
> argument for extra clarity!

Elvis can be interpreted as "A _or_ B (if A is false/0)".
Some pieces related to SPI use Elvis already IIRC.

-- 
With Best Regards,
Andy Shevchenko



