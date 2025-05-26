Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C97C5AD49
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 May 2025 16:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tCbLRnD850Fw84D6O+/v5XHafNaaAGbfyOsK8To1nVE=; b=OJ1EEUXF2IUe/jFaxpse6jxWDW
	NOCfatCSN3CaL/wSeGv59UmA96Hs/9iXoFygVVobtKRO79f24J6ja/u0v9HwDAL6AtDMmVwHDJRjw
	jGXOGb0YCEX0dQGL9OIxZqETqYPN5RCeMCw7vnfXPRtGqDRGob3GMKPvTOLk/fSG+7zkEK5UETwka
	yw/XZKTFcWj5tnhmbDgGLwbrWLzdOK28OKRhP514qQ2yyMTesC47LhmPdBknjrT3Pmx0vQcxzMMJH
	DcoSzhx1ZxKiucB7j5EWsD+PqbvACZ/rQe7dJNrVdgbB83l+mKljeOhSEhMIdSQ7FXfs3dLXaU5ak
	Cf1GwzsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJaXc-00000009Dc0-23bo;
	Mon, 26 May 2025 16:19:08 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJZNp-000000096N6-11fD;
	Mon, 26 May 2025 15:04:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AFB2444225;
	Mon, 26 May 2025 15:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748271892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tCbLRnD850Fw84D6O+/v5XHafNaaAGbfyOsK8To1nVE=;
	b=px3wU1eRkJ/axr/5DuhnZySKrn823eNaAIJXbZcAmaqq4qeYcle/G8QC7ZsPXuBfqgUfA5
	j9UtCvuxzUT5A1xXY1Po4PCIRoRj/UYUvff9JIXuTSFDpA7KBjR1wfOWeVD/7/YChB4k6k
	OccO5Dc6ZOmBH1W60DJj3fdi7jALdeVeqR+U/9rbTTM1YBDMzgagRRa7zs6wL9Q2HF+Ggl
	lZR8EQV0hFy/i3wUKXQGcb6+9G9tfBRSFOtl6/n8GoMSf0r2Iy6B5ejdMC9jPJn6kFCLCK
	x5mkCnLV2MqtCm+ayiflRELaT0mOKkuuwcU+khwFj5kXsikeBoHem+BuFAnX/A==
Date: Mon, 26 May 2025 17:04:46 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Hector Martin <marcan@marcan.st>, Sven Peter
 <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno        
 <angelogioacchino.delregno@collabora.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Orson Zhai
 <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan
 Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Vincent Shih
 <vincent.sunplus@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Kunihiko
 Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Michal Simek <michal.simek@xilinx.com>, Alessandro
 Zummo <a.zummo@towertech.it>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Evgeniy Polyakov <zbr@ioremap.net>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-rtc@vger.kernel.org, Michael Walle <michael@walle.cc>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Romain Gantois
 <romain.gantois@bootlin.com>
Subject: Re: [PATCH V5] nvmem: add explicit config option to read old syntax
 fixed OF cells
Message-ID: <20250526170446.1190e046@kmaincent-XPS-13-7390>
In-Reply-To: <20230927204446.4231-1-zajec5@gmail.com>
References: <20230927204446.4231-1-zajec5@gmail.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddujeekfeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefguddtfeevtddugeevgfevtdfgvdfhtdeuleetffefffffhffgteekvdefudeiieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepkhhmrghinhgtvghnthdqigfrufdqudefqdejfeeltddpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehgedprhgtphhtthhopeiirghjvggtheesghhmrghilhdrtghomhdprhgtphhtthhopehsrhhinhhivhgrshdrkhgrnhgurghgrghtlhgrsehlihhnrghrohdrohhrghdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprhhit
 ghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehmrghrtggrnhesmhgrrhgtrghnrdhsthdprhgtphhtthhopehsvhgvnhesshhvvghnphgvthgvrhdruggvvhdprhgtphhtthhopegrlhihshhsrgesrhhoshgvnhiifigvihhgrdhioh
X-GND-Sasl: kory.maincent@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_080458_123844_99BEE9B2 
X-CRM114-Status: GOOD (  14.32  )
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

Le Wed, 27 Sep 2023 22:44:46 +0200,
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> a =C3=A9crit :

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> Binding for fixed NVMEM cells defined directly as NVMEM device subnodes
> has been deprecated. It has been replaced by the "fixed-layout" NVMEM
> layout binding.
>=20
> New syntax is meant to be clearer and should help avoiding imprecise
> bindings.
>=20
> NVMEM subsystem already supports the new binding. It should be a good
> idea to limit support for old syntax to existing drivers that actually
> support & use it (we can't break backward compatibility!). That way we
> additionally encourage new bindings & drivers to ignore deprecated
> binding.
>=20
> It wasn't clear (to me) if rtc and w1 code actually uses old syntax
> fixed cells. I enabled them to don't risk any breakage.

Hello,

Was there a reason to not add the legacy flag to all the drivers that was
supporting nvmem at the time nvmem fixed layout was supported?

I just faced a nvmem layout regression on board with an at24 eeprom.

Commit: 27f699e578b1 nvmem: core: add support for fixed cells *layout*
$ git grep nvmem_config drivers/ | cut -d ':' -f 1 | sort -u
drivers/hwmon/pmbus/adm1266.c
drivers/iio/pressure/bmp280-core.c
drivers/media/i2c/ov2740.c
drivers/media/i2c/video-i2c.c
drivers/misc/eeprom/at24.c
drivers/misc/eeprom/at25.c
drivers/misc/eeprom/eeprom_93xx46.c
drivers/mtd/mtdcore.c
drivers/nvmem/apple-efuses.c
drivers/nvmem/bcm-ocotp.c
drivers/nvmem/brcm_nvram.c
drivers/nvmem/core.c
drivers/nvmem/imx-iim.c
drivers/nvmem/imx-ocotp.c
drivers/nvmem/imx-ocotp-ele.c
drivers/nvmem/imx-ocotp-scu.c
drivers/nvmem/jz4780-efuse.c
drivers/nvmem/lan9662-otpc.c
drivers/nvmem/layerscape-sfp.c
drivers/nvmem/lpc18xx_eeprom.c
drivers/nvmem/lpc18xx_otp.c
drivers/nvmem/meson-efuse.c
drivers/nvmem/meson-mx-efuse.c
drivers/nvmem/microchip-otpc.c
drivers/nvmem/mtk-efuse.c
drivers/nvmem/mxs-ocotp.c
drivers/nvmem/nintendo-otp.c
drivers/nvmem/qcom-spmi-sdam.c
drivers/nvmem/qfprom.c
drivers/nvmem/rave-sp-eeprom.c
drivers/nvmem/rmem.c
drivers/nvmem/rockchip-efuse.c
drivers/nvmem/rockchip-otp.c
drivers/nvmem/sc27xx-efuse.c
drivers/nvmem/snvs_lpgpr.c
drivers/nvmem/sprd-efuse.c
drivers/nvmem/stm32-romem.c
drivers/nvmem/sunplus-ocotp.c
drivers/nvmem/sunxi_sid.c
drivers/nvmem/u-boot-env.c
drivers/nvmem/uniphier-efuse.c
drivers/nvmem/vf610-ocotp.c
drivers/nvmem/zynqmp_nvmem.c
drivers/rtc/nvmem.c
drivers/rtc/rtc-abx80x.c
drivers/rtc/rtc-cmos.c
drivers/rtc/rtc-ds1305.c
drivers/rtc/rtc-ds1307.c
drivers/rtc/rtc-ds1343.c
drivers/rtc/rtc-ds1511.c
drivers/rtc/rtc-ds1553.c
drivers/rtc/rtc-ds1685.c
drivers/rtc/rtc-ds1742.c
drivers/rtc/rtc-ds3232.c
drivers/rtc/rtc-isl12026.c
drivers/rtc/rtc-isl1208.c
drivers/rtc/rtc-m48t59.c
drivers/rtc/rtc-m48t86.c
drivers/rtc/rtc-meson.c
drivers/rtc/rtc-omap.c
drivers/rtc/rtc-pcf2127.c
drivers/rtc/rtc-pcf85063.c
drivers/rtc/rtc-pcf85363.c
drivers/rtc/rtc-rp5c01.c
drivers/rtc/rtc-rv3028.c
drivers/rtc/rtc-rv3029c2.c
drivers/rtc/rtc-rv3032.c
drivers/rtc/rtc-rv8803.c
drivers/rtc/rtc-rx8581.c
drivers/rtc/rtc-stk17ta8.c
drivers/rtc/rtc-sun6i.c
drivers/rtc/rtc-ti-k3.c
drivers/soc/atmel/sfr.c
drivers/soc/tegra/fuse/fuse-tegra.c
drivers/thunderbolt/nvm.c
drivers/w1/slaves/w1_ds250x.c

--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

