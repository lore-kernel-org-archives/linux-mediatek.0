Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 254A2EB64DC
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jul 2023 15:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r4r1AlvPQOrBvxNxQz1r1nEFum6Fk1/A9QT1lgD2iUM=; b=PSxudh3BNXOk8rjj5Wd49ZfUwk
	yrG73rLgJGEDAi4AFIL+QEiPEto96X+1R5VT+oDwugvSQkw1gd4Dj86At98qA7As/mJflM8w9xoi8
	9EdVjKuggk5vW1qUOYa+SwAOryiEajgAr/FtntFkl3mi8Qh9X9MEKUqYmBZsB/dWQOCouZj+a2xlm
	dupwaRRHsX7FI4kIdDOld/Hf3JrD33T/EieHC5nekSDpw8JRpZrNNlAyeBbQ/kfaV0LBeD0OccAQV
	byUhNw0f73Ap1zoexkiBZjLayzVbjVAWggZ3Ab7nVTuA8Hv4CPMmR/5WzmUqos7/YBRkbrFIxEGpK
	B/2fTsiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJFJt-00FFAa-1E;
	Tue, 11 Jul 2023 15:30:29 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJFJp-00FF9l-1Z;
	Tue, 11 Jul 2023 15:30:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689089425; x=1720625425;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WtKHEzd9TLb1fy9g0AvI3P/4wH5wHUCXn6+ARbR9U1s=;
  b=aHxo5lO7I6QXKDu21IKBmaPDi2NgG7KY6pKiYlC1+OWTU78g09sLyIIJ
   l5EBtZXT0YeOo299LtdFjOBIe877c68fj4/DuYtWr3XzSdab7GNp1adrL
   exFiVp8c07t5VJDEooQRglnSmL5M2BF60OwjKwxLkRsXYHPZCMjAc1HBh
   3cdnLR+vTNLcTQ5befzZO5lHnehqUxs+ESazcfJQdDjhDXAutjP+gB56w
   t6WtsP9xwvlCqed3Mt92ziGsFhYK2mRpezGaAMRjzwvDljjaQ1iAuu1vL
   E6Q7buJNTgmY9tH+bDS5yRI94Sh8JjKUPtMHz1N3c8CKoGIfOaaSzc/9x
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="428346801"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="428346801"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 08:30:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="698462660"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="698462660"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 11 Jul 2023 08:30:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qJFJX-001swf-0G;
	Tue, 11 Jul 2023 18:30:07 +0300
Date: Tue, 11 Jul 2023 18:30:06 +0300
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
Message-ID: <ZK11flZf/1grJ1Bd@smile.fi.intel.com>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-5-andriy.shevchenko@linux.intel.com>
 <cfaffa00-4b61-4d81-8675-70295844513b@sirena.org.uk>
 <ZK02efTYxV3czigr@smile.fi.intel.com>
 <5959b123-09e3-474b-9ab0-68d71cfdd9a2@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5959b123-09e3-474b-9ab0-68d71cfdd9a2@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_083025_580459_BBCCD057 
X-CRM114-Status: GOOD (  19.22  )
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

On Tue, Jul 11, 2023 at 03:14:54PM +0100, Mark Brown wrote:
> On Tue, Jul 11, 2023 at 02:01:13PM +0300, Andy Shevchenko wrote:
> > On Mon, Jul 10, 2023 at 06:30:32PM +0100, Mark Brown wrote:
> > > On Mon, Jul 10, 2023 at 06:49:21PM +0300, Andy Shevchenko wrote:
> 
> > > > + * Assume speed to be 100 kHz if it's not defined at the time of invocation.
> 
> > > You didn't mention this bit in the changelog, and I'm not 100% convinced
> > > it was the best idea in the first place.  It's going to result in some
> > > very big timeouts if it goes off, and we really should be doing
> > > validation much earlier in the process.
> 
> > Okay, let's drop this change.
> 
> Like I say we *should* be fine with the refactoring without this, or at
> least if it's an issue we should improve the validation.

For the speeds < 1000 Hz, this change will lead to the div by 0 crash.
It seems that the current code which this one removes is better than
the spi_controller_xfer_timeout() provides.

If anything, the spi_controller_xfer_timeout() should be improved first.
So, for now I drop this for sure. Maybe in the future we can come back
to it.

-- 
With Best Regards,
Andy Shevchenko



