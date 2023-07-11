Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD47EB64DD
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jul 2023 10:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kBnsSNCEPCx0GSwj7QQVCkmswgJVRUZF4XbEV/sMmD8=; b=zZsHaBVB0VVANUtoIj8YX9qUcP
	AqiNoGfA3+0aKl5B8Un4kE9QyeEcDqFUe6v50KWHnk2qvoo+0vL39zIzfg/WP0bVwL2FA1Qwf1hUh
	STepsymA2/k2w4t3xH0U/ijDGm1+mkHs3xHeUAPpXqzCA53Ub3Wq639v+92eJ9jmvo0cqT86TOvA0
	yP1eb0n+KXbM3pE6V1rdF7LpakmnEmi1hRwnul3M3n11vIwVebWis2jZ9qXzR0eq4jDvz/drmERWF
	n4IZ3h5N1XC7BXwvXdW0K/QeOR/ZmbvdKlMVmbpcydG27DfToe1qJlYYDf5EbUae36PgmZvdv1Ts7
	YqnnGEag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJB4k-00Ehem-2x;
	Tue, 11 Jul 2023 10:58:34 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJB4h-00EhdM-1C;
	Tue, 11 Jul 2023 10:58:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689073111; x=1720609111;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lIHyBeHEaNenp9Q/l2JAcaQuyI3ymSNUAckdiFell2M=;
  b=FPvz+0fP8EpdjIn+3jtuJUg2KgBPPtwzw1ZPlL6XkXlh3HKZnhFldMNW
   bWS+0srjAYGBbghWzOoFIoCA5Aaw72ydRUcYk+3naqwa15Iyk4R+HLPDg
   3RjDb98/B0p2ZOHCFz1sFG5E6sD2d3e9Fw4XMYcpz07L+VRswfi4ACb6t
   Q09C6LrcYVhpkOmQnDSBrp8riPVmBLAo3+bBIGzPFoRQHg3SH5wdzEr4A
   nCI+/iiPho/ycLTzDLMTw62nrwroqhLfiWRgXMPcFvhHHJZ35axnTqjz4
   386OOWks83exPsLXJ/IdbRVVEsEq/8XfEklMCleRANvLo5ZqZMjUH5Usa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="368087266"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="368087266"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 03:58:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="724404293"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="724404293"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 11 Jul 2023 03:58:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qJB4O-001p51-1q;
	Tue, 11 Jul 2023 13:58:12 +0300
Date: Tue, 11 Jul 2023 13:58:12 +0300
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
Subject: Re: [PATCH v2 02/15] spi: Drop duplicate IDR allocation code in
 spi_register_controller()
Message-ID: <ZK01xAqLc8AGFDo/@smile.fi.intel.com>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-3-andriy.shevchenko@linux.intel.com>
 <97f3436a-78ca-4a94-a409-ef04bd3b593f@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97f3436a-78ca-4a94-a409-ef04bd3b593f@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_035831_503801_390C41E4 
X-CRM114-Status: GOOD (  19.30  )
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

On Mon, Jul 10, 2023 at 06:09:00PM +0100, Mark Brown wrote:
> On Mon, Jul 10, 2023 at 06:49:19PM +0300, Andy Shevchenko wrote:
> 
> > Refactor spi_register_controller() to drop duplicate IDR allocation.
> > Instead of if-else-if branching use two sequential if:s, which allows
> > to re-use the logic of IDR allocation in all cases.
> 
> For legibility this should have been split into a separate factoring out
> of the shared code and rewriting of the logic, that'd make it trivial to
> review.

Should I do that for v3?

> > -		mutex_lock(&board_lock);
> > -		id = idr_alloc(&spi_master_idr, ctlr, first_dynamic,
> > -			       0, GFP_KERNEL);
> > -		mutex_unlock(&board_lock);
> > -		if (WARN(id < 0, "couldn't get idr"))
> > -			return id;
> > -		ctlr->bus_num = id;
> > +		status = spi_controller_id_alloc(ctlr, first_dynamic, 0);
> > +		if (status)
> > +			return status;
> 
> The original does not do the remapping of return codes that the previous
> two copies do...

Yes, I had to mention this in the commit message that in my opinion this makes
no difference. With the dynamically allocated aliases the absence of the slot
has the same effect as in the other cases.

-- 
With Best Regards,
Andy Shevchenko



