Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5DE0EB64DC
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jul 2023 10:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zkuM88eUpd4lwwF3xUixcqfuJbBS47crOoLESP2lR7s=; b=UHyjVuUPcccop/3don2RNYT2To
	tPrJtz5DwoavdEafLSDFiXMaJAdQzU8WYwieAZg0v0tvfx6Xnez1pfsLL5PILMHjX4SLInl+d+riT
	KIP+/GKIj5wUCVvf4Zye9VPDGs2E9Ucrez0bbRLVFxEc8dS4Bpg+q/b8PZZ7GGAmdpoPyDdMoKCEo
	Qn8u0z7SBcVM49vqr5uF3/CIzCySNu8xj7K/+K1hVC4ZJNPpPngHEhd+w1i4UeU94xDw4nUDeD0e3
	YyHrM9YaO9Gjr7Ds0+FAREASILLHv5cCMRSVEqeQc6XsGu7a0shHmeYd6SWGyVwTbmFyD1WkTOWH0
	ll8wFkIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJB5K-00Ehqy-08;
	Tue, 11 Jul 2023 10:59:10 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJB5F-00EhoZ-0n;
	Tue, 11 Jul 2023 10:59:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689073145; x=1720609145;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+zeFSMPLY2Z95wTb4g4rf/2HnStio6yWOtQ5rXla3Pk=;
  b=lf1kCD9qvUJqTp/GVBcYioFX3kfYyyAkcrUg2dGXmji/lcjMsSnmmSKw
   mk9VsHWQat26bj56hBFch45IoUGE9z0k/8u7HRa9/eZoihL1keGAsA279
   LSS2dZ7tjPMAxijKEEciTRMoKgk5SX3AAbpZQBD6QjkKRP3Ov8+/2zBhW
   sMZxCmEqKLWvM5OjYKCCvw3rJnB6tGNtTukW5Lkaoa2i0m2Mu2HD4JKib
   6DML8DAdRXVEJbBro/zsNu5B2Xe/7HRddruJs3/o5Us9jp+eI3diD0kqG
   4TCc3WHYf/5OEtR/+SKvYaRGiavVWFeOz5FdBtBdWmj+/dNUiQj/ckuHf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="450948901"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="450948901"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 03:59:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="721055869"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="721055869"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 11 Jul 2023 03:58:49 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qJB4v-001p5g-2V;
	Tue, 11 Jul 2023 13:58:45 +0300
Date: Tue, 11 Jul 2023 13:58:45 +0300
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
Subject: Re: [PATCH v2 03/15] spi: Replace if-else-if by bitops and
 multiplications
Message-ID: <ZK015fKTOK5wjck+@smile.fi.intel.com>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-4-andriy.shevchenko@linux.intel.com>
 <24e71654-bc79-42ac-86d1-4e6100f6893a@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24e71654-bc79-42ac-86d1-4e6100f6893a@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_035905_294803_B01F797C 
X-CRM114-Status: GOOD (  16.33  )
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

On Mon, Jul 10, 2023 at 05:56:59PM +0100, Mark Brown wrote:
> On Mon, Jul 10, 2023 at 06:49:20PM +0300, Andy Shevchenko wrote:
> 
> > -		if (xfer->bits_per_word <= 8)
> > -			maxsize = maxwords;
> > -		else if (xfer->bits_per_word <= 16)
> > -			maxsize = 2 * maxwords;
> > -		else
> > -			maxsize = 4 * maxwords;
> > -
> > +		maxsize = maxwords * roundup_pow_of_two(BITS_TO_BYTES(xfer->bits_per_word));
> 
> This will change the behaviour if bits_per_word is more than 32.  That
> is validated out elsewhere but I shouldn't have had to go around
> checking the code to confirm that this is the case.  This is the sort of
> thing that should be highlighted when doing this sort of edge case
> stylistic change.

Right, I have to add this into commit message of v3.

-- 
With Best Regards,
Andy Shevchenko



