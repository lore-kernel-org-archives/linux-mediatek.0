Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347C2C19F2D
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Aug 2022 18:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tAsP15lQrAYdIC6HgwKROYXmVXfwo4WA2JDEaj2a+fw=; b=ZkUItNZ0pZxFuyMaXDgUxLqDRb
	Jv5ltR/6HSSI3/8BCDhjUhggLeo++PVl/1Vo+8tcGmE8Jzq7RAa7ro11Ub8gz+YdWRSAmPOsHdV7G
	FEfarVrsi47z4S8nLJpQJcPw+ukvaYRaoXxN5mqelt4fOMQ0/GViuiznToUh0ToBokGfzzl1gxM2A
	guXJSJvyYwubY71JUPrMw/PIXmmumY+RDBJhpA56Sux7gbbQuXA+BHqt46fN9Gjqb14Y1JvX7BKGW
	2OngWTDDGw4xwX3GiLstneBR+xOXk4KbUFQgE/dOZ0KZJwKqz5yYICDwVn9hPWyxp+TUQQ0F/hV7M
	IwaEV3vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKOX1-00FsTJ-Da; Sat, 06 Aug 2022 18:28:15 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKOWx-00FsPQ-SJ; Sat, 06 Aug 2022 18:28:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 34582B80819;
	Sat,  6 Aug 2022 18:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74E54C433D6;
	Sat,  6 Aug 2022 18:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659810488;
	bh=iCVWwAWSuOVXi4+hP+43X1j+qHEOeQGzNfyGNM8ZHlc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KlscbrYnUaVdHIBuJBN81x/XEFLtGKpriuNiG3TIj5xAofhQh18XT5SVajLATPRXt
	 kQGbEQhKcBA2xhXmdT7ZL4kusndKKO3JefSGMMDd57Q5QfD1wkWJdiwwXGNbp5AYW4
	 /NPqWyb4Skpm7IRTwQknAwUiQuD/FHHjm47osNQMZyFW2yLduPZm231zZD7LLHJxo/
	 dHP3+Cvo5l+MeLdd6HX0hj38x56VQseF4+LzZ6x9TDiH1HUFABXiplhZiuxzgHa+uB
	 03dlv22z29Scht3HXgZGArNewPIPyeIM8cDbRyB2TxarEfg/XHD9ndtiQNG0Sk0LXy
	 WA6QW93Z4GDOA==
Date: Sat, 6 Aug 2022 19:38:16 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>
Cc: <openbmc@lists.ozlabs.org>, <linux-imx@nxp.com>,
 <linux-stm32@st-md-mailman.stormreply.com>, <linux-iio@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <chrome-platform@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, <linux-arm-msm@vger.kernel.org>,
 Gwendal Grignou <gwendal@chromium.org>, Saravanan Sekar
 <sravanhome@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 "Olivier Moysan" <olivier.moysan@foss.st.com>, Tali Perry
 <tali.perry1@gmail.com>, Thara Gopinath <thara.gopinath@linaro.org>, Bjorn
 Andersson <bjorn.andersson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Benjamin Fair <benjaminfair@google.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Patrick Venture <venture@google.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Benson Leung
 <bleung@chromium.org>, Nancy Yuen <yuenn@google.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, Zhang Rui <rui.zhang@intel.com>, Linus
 Walleij <linus.walleij@linaro.org>, Christophe Branchereau
 <cbranchereau@gmail.com>, Cai Huoqing <cai.huoqing@linux.dev>, Avi Fishman
 <avifishman70@gmail.com>, Eugen Hristev <eugen.hristev@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Lars-Peter Clausen <lars@metafoo.de>, "Andy
 Shevchenko" <andy.shevchenko@gmail.com>, Guenter Roeck
 <groeck@chromium.org>, Paul Cercueil <paul@crapouillou.net>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Andy Gross <agross@kernel.org>, Amit
 Kucheria <amitk@kernel.org>, Michael Hennerich
 <Michael.Hennerich@analog.com>, "Haibo Chen" <haibo.chen@nxp.com>, Jishnu
 Prakash <quic_jprakash@quicinc.com>
Subject: Re: [PATCH v3 05/15] iio: inkern: move to fwnode properties
Message-ID: <20220806193816.780188da@jic23-huawei>
In-Reply-To: <20220715122903.332535-6-nuno.sa@analog.com>
References: <20220715122903.332535-1-nuno.sa@analog.com>
	<20220715122903.332535-6-nuno.sa@analog.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220806_112812_092127_52DDA7F0 
X-CRM114-Status: UNSURE (   7.79  )
X-CRM114-Notice: Please train this message.
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

>  
> -struct iio_channel *__of_iio_channel_get_by_name(struct device_node *np,
> -						 const char *name)
> +struct iio_channel *
> +__fwnode_iio_channel_get_by_name(struct fwnode_handle *fwnode, const char *name)
static

fixed up.

J

