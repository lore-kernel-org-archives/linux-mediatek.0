Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B68C0015E
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jul 2023 12:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BonMTE4G0Fzi/dhQw+vSnPhFtmGhv8bK9dMjJ44uF1Y=; b=UHOVh1irMZP4YmUuavBunHV7T4
	5jYHuDNwP5QBmBILRVlfwpjY6bgmRBFlk/MVndmEmt4J5OoMfkpLyvTWad+mywtm3+/kgLW2KkeNF
	0N6QndIEWCcZaA7URwV7ipe/9g9a6igII5XbWRYKuy0yZvkwVrTL2IN2nWVQR50uWg66zqYqdJKET
	fkMKsA+p/u1jrkkQtmtwavTElJRHDwMERrQWraGxjvaZ+5b8Ae8w8MEEMSxn4Ff2d8+/Sy2w/XGD1
	vzQpA+dqV+Y48xmbXcHua9sJDBbbEfOrXXeWWFZU5+T+0qkPeXMkekhqnDEiI6ndRCCK6eQ2MJDBw
	gn2/BNYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJCo1-00EuSd-0N;
	Tue, 11 Jul 2023 12:49:25 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJCnx-00EuRt-0e;
	Tue, 11 Jul 2023 12:49:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689079761; x=1720615761;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OYszt38IqNikveaxxJtUvxsFTPNnv5LlXD+DX90BkWs=;
  b=h6LD2uoeBepZ/ia2hLQyLMO1plgbpHOmm/4YGJYKWstai0T3NM3wCNpc
   PwHL1I8A0zR2yxJo8OJZ7OM+tv7sOIePOkW95vd9it9Yr83ZX0McQ23C7
   7uvRan3jA4UzqBfHbSXNBRPEgu2Xziqv9IeM0f/zm+dMVCjEwjztlTI/b
   a7l5Ck0eodtIh18C63Oo1z/NqLfusmJOCatgsruU5NZdpbqerdtsV5L4i
   zKautqKKuIt+i2/LbDIxQ1L1CrrAd8UygphxF6MJk6MZE1EbuqRRRfRHK
   uuRJih4ayw8jSP/G7ck3TeWuL5MimvgPQ0zgmO29SPxcXp+Ss0oyZ2B6R
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="354470007"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="354470007"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 05:49:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="721078284"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="721078284"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 11 Jul 2023 05:49:08 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qJCng-001qlR-32;
	Tue, 11 Jul 2023 15:49:04 +0300
Date: Tue, 11 Jul 2023 15:49:04 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Serge Semin <fancer.lancer@gmail.com>
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
	Sanjay R Mehta <sanju.mehta@amd.com>,
	Radu Pirea <radu_nicolae.pirea@upb.ro>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
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
Subject: Re: [PATCH v2 13/15] spi: Rename SPI_MASTER_GPIO_SS to
 SPI_CONTROLLER_GPIO_SS
Message-ID: <ZK1PwMAz8OjsHgsE@smile.fi.intel.com>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-14-andriy.shevchenko@linux.intel.com>
 <tvm772o6uqndgyjvycv27qouqq76crpre5tyqcnanaautqjjwn@pydiwhjzhbgd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tvm772o6uqndgyjvycv27qouqq76crpre5tyqcnanaautqjjwn@pydiwhjzhbgd>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_054921_281556_BA4A6102 
X-CRM114-Status: GOOD (  16.10  )
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

On Tue, Jul 11, 2023 at 03:30:19PM +0300, Serge Semin wrote:
> On Mon, Jul 10, 2023 at 06:49:30PM +0300, Andy Shevchenko wrote:
> > Rename SPI_MASTER_GPIO_SS to SPI_CONTROLLER_GPIO_SS and
> > convert the users to SPI_CONTROLLER_GPIO_SS to follow
> 
> * I'm not an expert in English, but imo the next would look a
> * bit more readable:
> * convert s/the users to SPI_CONTROLLER_GPIO_SS/the code to using SPI_CONTROLLER_GPIO_SS

> > the new naming shema.
> 
> s/shema/schema

Right, thank you!

...

> Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

Thank you for the review!

-- 
With Best Regards,
Andy Shevchenko



