Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48732606AB10
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Nov 2026 20:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hvG+iGbI;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F4CrLZx1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Eecn0Ygaf7mft5z9aYz9Ro3xQK3/iLvYEIUNIgo48NA=; b=hvG+iGbIQlbZg1sD48rznkmWwI
	TTEXaFGmdXQwKrVtWaI+vwHSxVPsrMckkacMea2nF/Q5SfBTU+cc+1MnnZNMuycA2JTkEgUxbWZCe
	u88no8aFD7ZsFFYQ1T3ABys9D4qmWKdh+KmI29xaTxFxuYLvA0OYbjAjwbI0aWBYwIEbGQpVzk7h4
	X6d2j8I3sGMkTrjOes7p7mwb01+lvp5zyuY3Ks7bV2UTiGmMCDsVW61ymZ2O/2Wx2OWGCi9IVFp13
	0/dS+fMUBrG+ohDAuhLp7YQRyNFRV8ZDnM+SVMfBQGW1XY16/ywNHSVoXVlDJfm6PfDjyNvWbtmK1
	8GpwVtrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOhcY-00000006tfT-49LF;
	Wed, 04 Nov 2026 20:30:10 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOhcT-00000006tdO-03GY;
	Wed, 04 Nov 2026 20:30:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793824205; x=1825360205;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h9DF1vrSe2ymxSVWOc4qaehYKUBrcFML5wxNEDR44VM=;
  b=F4CrLZx1ddz2fGNGh+iE674/qmA3xF+OWMh93OqtbjX0MSkkEUvDQOQF
   TegKad+2EuKU+IR4iex0PrwbtRFiCG2vDoUcbLtOlfl8bygjTm1iZOrJj
   kZoE+k2Y53lwZri75cNnFTKQIcqtMN6slQAExyXEtktYU3P65Qw9xOWuD
   Ia7P/oX11lAg78xLVoS7qzrMXdPn0quQpAsIVwatA3PoqYKl3onR9Vn4E
   c7u/FI9jdZXJqsZLXlJYjFIP+EIxBOAjpkqgie2GZdwZskhVSbRvwbMfY
   XTCG8FGhuAHnCLddGKX1/QNR0RRKVMvnZzcqLNOpssAFCTJUlsTcMsGmq
   Q==;
X-CSE-ConnectionGUID: jwIhwxx4QY2nKUzXp9PHoA==
X-CSE-MsgGUID: E0HgbnZbROW0wIq/N92GSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2602472"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2602472"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 12:30:02 -0800
X-CSE-ConnectionGUID: 4s+PIBaTRcCfJB/9Fu/CBQ==
X-CSE-MsgGUID: W8xphM45RZOPK4ny68SHrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6825384"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 12:29:49 -0800
Date: Wed, 4 Nov 2026 22:29:46 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Frank.Li@oss.nxp.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Cunhao Lu <1579567540@qq.com>, Raul E Rangel <rrangel@chromium.org>,
	Yenchia Chen <yenchia.chen@mediatek.com>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>,
	Carlo Caione <ccaione@baylibre.com>, Moteen Shah <m-shah@ti.com>,
	Kendall Willis <k-willis@ti.com>,
	Kartik Rajput <kkartik@nvidia.com>, Fan Wu <fanwu01@zju.edu.cn>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>,
	Shitalkumar Gandhi <shital.gandhi45@gmail.com>,
	Peng Fan <peng.fan@nxp.com>, Sherry Sun <sherry.sun@nxp.com>,
	John Ogness <john.ogness@linutronix.de>,
	Pan Chuang <panchuang@vivo.com>, Petr Mladek <pmladek@suse.com>,
	Robin Gong <yibin.gong@nxp.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Zhaoyang Yu <2426767509@qq.com>,
	"Nikola Z. Ivanov" <zlatistiv@gmail.com>,
	Haoxiang Li <haoxiang_li2024@163.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Myeonghun Pak <mhun512@gmail.com>,
	Wenhua Lin <Wenhua.Lin@unisoc.com>, Cixi Geng <cixi.geng@linux.dev>,
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-kernel@vger.kernel.org>,
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	"open list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT..." <imx@lists.linux.dev>,
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
	"open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>,
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
	vkoul@kernel.org
Subject: Re: [PATCH 1/1] tty: serial: use dmaengine_desc_set_callback()
Message-ID: <auuVum_cd7MgGDUq@ashevche-desk.local>
References: <20261102175527.3957740-1-Frank.Li@oss.nxp.com>
 <a2d5ea00-bfa1-4883-923d-0a6a7eaa556d@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2d5ea00-bfa1-4883-923d-0a6a7eaa556d@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_123005_343746_736DDCD9 
X-CRM114-Status: GOOD (  18.61  )
X-Spam-Score: -4.2 (----)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 06:41:08PM +0100, Krzysztof Kozlowski wrote:
> On 02/11/2026 18:54, Frank.Li@oss.nxp.com wrote:
> > 
> > Replace open-coded assignments to callback and callback_param fields
> > of struct dma_async_tx_descriptor with calls to the
> > dmaengine_desc_set_callback() helper across serial drivers.
> > 
> > No functional change intended. Prepare to make struct
> > dma_async_tx_descriptor private to the DMA engine.

...

> I did not look at this code at all...
> 
> > index 640f85e2d636b..3f82a83998e1c 100644
> > --- a/drivers/tty/serial/samsung_tty.c
> > +++ b/drivers/tty/serial/samsung_tty.c
> > @@ -447,8 +447,7 @@ static int s3c24xx_serial_start_tx_dma(struct s3c24xx_uart_port *ourport,
> >  		return -EIO;
> >  	}
> >  
> > -	dma->tx_desc->callback = s3c24xx_serial_tx_dma_complete;
> > -	dma->tx_desc->callback_param = ourport;
> > +	dmaengine_desc_set_callback(dma->tx_desc, s3c24xx_serial_tx_dma_complete, NULL, ourport);
> >  	dma->tx_bytes_requested = dma->tx_size;
> >  
> >  	ourport->tx_in_progress = S3C24XX_TX_DMA;
> > @@ -642,8 +641,7 @@ static void s3c64xx_start_rx_dma(struct s3c24xx_uart_port *ourport)
> >  		return;
> >  	}
> >  
> > -	dma->rx_desc->callback = s3c24xx_serial_rx_dma_complete;
> > -	dma->rx_desc->callback_param = ourport;
> > +	dmaengine_desc_set_callback(dma->rx_desc, s3c24xx_serial_rx_dma_complete, NULL, ourport);
> >  	dma->rx_bytes_requested = dma->rx_size;

> ... but apparently reviewing only a few lines out of 400 is still reviewing:
> 
> https://lore.kernel.org/all/9e39502a-dd17-4fa2-98a3-9019523cb5e8@kernel.org/
> 
> Therefore:
> 
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

That's why I have added a trail to it to show what exactly I has reviewed,
this is a common practice, no?

Does this ring a bell 34d1e754155b ("dt-bindings: iio: drop unneeded quotes")?

-- 
With Best Regards,
Andy Shevchenko



