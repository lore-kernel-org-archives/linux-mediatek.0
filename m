Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 992A4CE7B08
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Sep 2023 07:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xJkRrteSTSAG2FblrRGY5Sz+zY9oF679iQ/KJMfXIdw=; b=MzhLC6T2QWjAns7uD9tDkVqVl8
	+dHwhSp4S+tSLDWZQABsRBHA3IAN1HhHB32PAKQEDVWq+rsRO+KkC2IQpp6hNVHYxURnK5nhlafQQ
	lqYPydZm19ZV9kZ576FkrmSF+el22y0akam+p2S74YaoCP+pje1DuFhrmE/omGRSi5jKCQPyOeFa8
	DiRMEItrqez6trxQcx8GFEAprGmLfL73TL8l605wc8tygna3P4qtdgwX0o/ZHLdLDOGRSvPJIDRTF
	kKMjPDvTQAP2+GQgrx9QttFze0trw855VFgoVDu1EObBEyJeCSzRypJ3tyZhHoVuIoKp0UmRvu5UW
	WsEkad1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qllm2-002Ylv-0P;
	Thu, 28 Sep 2023 07:49:26 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qllly-002YkN-07;
	Thu, 28 Sep 2023 07:49:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id D8092B81A6E;
	Thu, 28 Sep 2023 07:49:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87A57C433C8;
	Thu, 28 Sep 2023 07:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695887357;
	bh=Gs6aFP7wkoeloUPjh3P+7ZqWXKrUV+lmRvPOXvjf8Ds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C07hz1x9ZBOot13NmBg/w+8/7UOMHZqam5kdmBhRs0FIMx+p817yeI0/AwYqADdFf
	 LyROsByfc7udfgvzO+iVFxt40scEHqiTsEuBV2anPvz2pvOqA5rNaglngGFVYkDqNi
	 8llzR1bKPikKnXdUU/UiExt0M1sNhonfI2Tg9VWZ4Ep2jjWHYlWMlubIYLpGAoPemh
	 /llBuONh0YVRMZh24Aia4Qvo0KfHmtLVm+XDoqoKF4CTK02whHvixcoVQ+egWgMk7x
	 FTO4SCB3n9ecoNHU2OdnjDnT9Gq59BrqP6Jgw3zOEG+2pLxraJj4zpxQ8BtWBKRvcG
	 KuqZYg3uAID5g==
Date: Thu, 28 Sep 2023 13:19:13 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Olivier Dautricourt <olivierdautricourt@gmail.com>,
	Stefan Roese <sr@denx.de>, dmaengine@vger.kernel.org,
	kernel@pengutronix.de, Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Li Yang <leoyang.li@nxp.com>, Zhang Wei <zw@zh-kernel.org>,
	linuxppc-dev@lists.ozlabs.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-actions@lists.infradead.org,
	ye xingchen <ye.xingchen@zte.com.cn>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org, Sinan Kaya <okaya@kernel.org>,
	Green Wan <green.wan@sifive.com>, Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Pavel Machek <pavel@denx.de>,
	Hien Huynh <hien.huynh.px@renesas.com>,
	Yangtao Li <frank.li@vivo.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
	linux-sunxi@lists.linux.dev, Laxman Dewangan <ldewangan@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-tegra@vger.kernel.org, Lizhi Hou <lizhi.hou@amd.com>,
	Brian Xu <brian.xu@amd.com>,
	Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Peter Korsgaard <peter@korsgaard.com>,
	Liu Shixin <liushixin2@huawei.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Harini Katakam <harini.katakam@amd.com>,
	Swati Agarwal <swati.agarwal@amd.com>
Subject: Re: [PATCH 00/59] dma: Convert to platform remove callback returning
 void
Message-ID: <ZRUv+WgkovPotwIr@matsya>
References: <20230919133207.1400430-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230919133207.1400430-1-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_004922_339365_ABADBC7E 
X-CRM114-Status: GOOD (  17.28  )
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

On 19-09-23, 15:31, Uwe Kleine-König wrote:
> Hello,
> 
> this series convert nearly all platform drivers below drivers/dma to use
> .remove_new(). The motivation is to get rid of an integer return code
> that is (mostly) ignored by the platform driver core and error prone on
> the driver side.

I have applied this, with change of subsystem to dmaengine: xxx
> 
> See commit 5c5a7680e67b ("platform: Provide a remove callback that
> returns no value") for an extended explanation and the eventual goal.
> 
> There are 4 drivers I didn't convert in this series:
> 
> 	drivers/dma/milbeaut-hdmac.c
> 	drivers/dma/milbeaut-xdmac.c
> 	drivers/dma/uniphier-mdmac.c
> 	drivers/dma/uniphier-xdmac.c
> 
> These all might return early in .remove() if dmaengine_terminate_sync()
> fails. I only looked deeper into the first one, and this shows exactly
> the error that is easy to make with .remove() returning an int: When
> returning early from .remove(), some cleanup (here:
> dma_async_device_unregister()) is skipped. So the dma device stays
> known, but the device is still unregistered and the devm allocated stuff
> (here e.g. *mdev) is freed. So it can probably easily happen, that
> something tries to use the dma device and this will likely result in an
> oops.

We should convert these too, thanks for your work for the conversion

-- 
~Vinod

