Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A551FEB64DC
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 16:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bwIH6gr5RsIwRGuJNXunq5XwhZktmoqV/pn/dRKRNz0=; b=S6mITBpJiX0kiwPNKQ4ErYbeDx
	SJu4wt9+aO8SDfKAYsCvHDf8IJ+q4t+GV9kziJeNvQS/9c3UWOm+vr102cEZG2sgHkxIkx93Dt1Id
	qVYZ4N4vteVNdjIuJgnEMQirzWsbWo1nIPtRdeal1/4LupFuQr3AUg1V/3/8A3/EKoryQzImKh9UB
	oYXDD383b6+0Htj1Fny0MaA9pl3N48cm0Y/Sui7g2ZdXLOrvDbDE84NMDcrY1jXdTu4pyQ7aKdr68
	xd/sONJohMJg65UZqAvz9fKIzAo5kzuhjYucH31BNvc7rsiUvfmEiG3IkSNDK4Koh+s3a0kppg3Jm
	uCUArM1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qItV9-00C9qo-2g;
	Mon, 10 Jul 2023 16:12:39 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qItV6-00C9q1-09;
	Mon, 10 Jul 2023 16:12:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689005555; x=1720541555;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0SlN/itezSp5S5zjCF2SMzf5gnBS89SJ4xDj94AkcQw=;
  b=M4UatrbStEW7CaUeyxxe6bKSd0ckHW65e3BegOoxu9Qv8HH7hB0YCb/l
   6MJENllTnu10HSVZmPeKhVCBiWCYhVL+dpanY55xfcRz8DtfJGJl4SC55
   Uwvz2UGZdWaZQu0pUYdthstOXorm57Q4h5fiWZfMlbCTuWHibs7MeRVtA
   eX1Qk6OoO2dfgbHKxvN8MrXSPHWApZz5xozC2MVnwHPlLQr854YUPi3tt
   PrUYit3gFkuUStJ1c5xqxJzNs3BsDn4W4oUGcWei8MQYFaQDRaIDpBZp2
   h5HCfz5dYrF3HWDZAabHeuQw1B24PuOYALKzoMsocsvOAZZcjXruNepcB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="430464648"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="430464648"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 09:10:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="750388713"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="750388713"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 10 Jul 2023 09:10:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qItTH-001bF6-2N;
	Mon, 10 Jul 2023 19:10:43 +0300
Date: Mon, 10 Jul 2023 19:10:43 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Mark Brown <broonie@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
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
	Richard Cochran <richardcochran@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Andy Gross <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Radu Pirea <radu_nicolae.pirea@upb.ro>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sanjay R Mehta <sanju.mehta@amd.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH v2 09/15] spi: Use struct_size() helper
Message-ID: <ZKwtgwZtUUHGC+S3@smile.fi.intel.com>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-10-andriy.shevchenko@linux.intel.com>
 <20230710-doze-scared-9f0a2e1a9125-mkl@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230710-doze-scared-9f0a2e1a9125-mkl@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_091236_179110_C08F5BAA 
X-CRM114-Status: GOOD (  10.19  )
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

On Mon, Jul 10, 2023 at 05:59:55PM +0200, Marc Kleine-Budde wrote:
> On 10.07.2023 18:49:26, Andy Shevchenko wrote:

...

> > +	struct spi_transfer	t[];
> 
> You might want to use the DECLARE_FLEX_ARRAY helper here.

Technically, yes, semantically documentation [1] disagrees with
you, so I leave it as is.

[1]: Documentation/process/deprecated.rst:269

-- 
With Best Regards,
Andy Shevchenko



