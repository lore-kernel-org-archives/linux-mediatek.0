Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F08C05027
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Feb 2023 16:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1JxadcUmstQQisxG5SMmC/yE89rXvA6AYxcU2YUnVDQ=; b=uMdhHC1Ij1fqj1n/k0j6tGJ+64
	xoHIX/BYiIStM56gbfbfJrAuOSaPdDi9ACoumdRy3ZE4FMoGDdGma6Pxxgtw7kOi9mSGk7Oa6rR3Z
	5ZjteCmnZoaDSMN5UuU+XitXeYd5VUaxfqfADzsbUI5sKL2se4rbMGubBPFQ37mQYVPDl7eyJyQZl
	WqYryAFlbgJbIc6L49dHB0B5B+t5zyIiomIIM6QkTOAWZI8IL6fNwFtNmxNTvf2BbnaJIwH38MQhu
	zFNKBQnM5bv4OHnDmb5X2yGnXWYPNTO7zwPL56Q2MD6+GTu0hIDK8acg88u/hvWVN9gBprVMGwunJ
	CSTIQK3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNcdl-00Ggkl-Eg; Thu, 02 Feb 2023 16:40:49 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNcdh-00Ggiu-4V; Thu, 02 Feb 2023 16:40:46 +0000
Received: by mail-ej1-x629.google.com with SMTP id ml19so7791631ejb.0;
        Thu, 02 Feb 2023 08:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1JxadcUmstQQisxG5SMmC/yE89rXvA6AYxcU2YUnVDQ=;
        b=F0H3B8NAgseBrYAc9OhvFrrJcHUs5RxsmEgusiWeYI4oHZkbOFHj9Ncu15Uvbi4tCO
         GCoGClEA/o94QYw0U1UfeOAEL80uwq+5tCfPJWGsWnHH8HpmO1lWGzeCrAsIdF4Fu6zR
         kNR+WhBg1xqNyaBWvq3l+bklN9GSWeF5rkZflnjP5JjP6Pm7phnd2Ab56G7cA8boFLp0
         xzt+aopsRq/bEYAtjRCwCMmTji3jBwX9xCOCD4tzAC2fkbovQWodfYFH0SLzujYlkR2S
         3SeXJQSQvZdrRrWbPhPWjXi7p2pGkVjdnp+X80CVTlvacpypSO18F0i1MgCSG84IgzXR
         jpqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1JxadcUmstQQisxG5SMmC/yE89rXvA6AYxcU2YUnVDQ=;
        b=1gDFr5xPxO6RUuFBZf1UQKp3vlCvMzV7z11KOVLQkDZujKDRikr1ikD5B7A8h/R7H5
         Dt9u/G82NZbhpBWDRURI+KOZHVzA2xm1IgqwIxftz8HHwWkm4wQPep62C/0y+NRFYW83
         FQc2kkgKI/nZOGCWPs4Z24vMZsygbMwkz5ticXnz7rkxpYPklKwCVgTXyu5tJMtbcNkd
         sgQ1IxM4a/asmLEfda6O8dgcRVY94h4dfSolax8WyXD9eiwlCbPcfuGSEEdWRFukUQIr
         WJUBpjnkT9/vOLBHg14MTRoNZSu2sueRWeBQdkL1fzGIWvxh6ux5Yit4kcZp5H0IMj97
         vSGA==
X-Gm-Message-State: AO0yUKWgJpfk/QxyPRgCV4KtKMqTk4GQgBrLqJeYPHAe8tbfjpbbJz9F
	NZ+EjVjkljU20DKQm8OmP8I=
X-Google-Smtp-Source: AK7set8DElzpOFybgSqmpPkVSDP76pQ9uMXg+BggB0EZ9TIGd1XdSGpOOvGTm4L9iJVvil59yp3mTw==
X-Received: by 2002:a17:906:c156:b0:88d:ba89:1835 with SMTP id dp22-20020a170906c15600b0088dba891835mr2844484ejc.6.1675356040636;
        Thu, 02 Feb 2023 08:40:40 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id by13-20020a0564021b0d00b004a277d55a6csm3387108edb.1.2023.02.02.08.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 08:40:40 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: broonie@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, jic23@kernel.org, tudor.ambarus@microchip.com,
 pratyush@kernel.org, sanju.mehta@amd.com, chin-ting_kuo@aspeedtech.com,
 clg@kaod.org, kdasu.kdev@gmail.com, f.fainelli@gmail.com, rjui@broadcom.com,
 sbranden@broadcom.com, eajames@linux.ibm.com, olteanv@gmail.com,
 han.xu@nxp.com, john.garry@huawei.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, narmstrong@baylibre.com, khilman@baylibre.com,
 matthias.bgg@gmail.com, haibo.chen@nxp.com, linus.walleij@linaro.org,
 daniel@zonque.org, haojian.zhuang@gmail.com, robert.jarzmik@free.fr,
 agross@kernel.org, bjorn.andersson@linaro.org, heiko@sntech.de,
 krzysztof.kozlowski@linaro.org, andi@etezian.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, wens@csie.org, samuel@sholland.org,
 masahisa.kojima@linaro.org, jaswinder.singh@linaro.org, rostedt@goodmis.org,
 mingo@redhat.com, l.stelmach@samsung.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 alex.aring@gmail.com, stefan@datenfreihafen.org, kvalo@kernel.org,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, palmer@dabbelt.com
Cc: git@amd.com, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 joel@jms.id.au, andrew@aj.id.au, radu_nicolae.pirea@upb.ro,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@microchip.com, bcm-kernel-feedback-list@broadcom.com,
 fancer.lancer@gmail.com, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 yogeshgaur.83@gmail.com, konrad.dybcio@somainline.org,
 alim.akhtar@samsung.com, ldewangan@nvidia.com, thierry.reding@gmail.com,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 netdev@vger.kernel.org, linux-wpan@vger.kernel.org,
 libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-iio@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject:  Re: [PATCH v3 01/13] spi: Replace all spi->chip_select and spi->cs_gpiod
 references with function call
Date: Thu, 02 Feb 2023 17:40:35 +0100
Message-ID: <4802797.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20230202152258.512973-2-amit.kumar-mahapatra@amd.com>
References:  <20230202152258.512973-1-amit.kumar-mahapatra@amd.com>
 <20230202152258.512973-2-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_084045_228293_E2F3FA10 
X-CRM114-Status: GOOD (  14.38  )
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

Hi!

Dne =C4=8Detrtek, 02. februar 2023 ob 16:22:46 CET je Amit Kumar Mahapatra=
=20
napisal(a):
> Supporting multi-cs in spi drivers would require the chip_select & cs_gpi=
od
> members of struct spi_device to be an array. But changing the type of the=
se
> members to array would break the spi driver functionality. To make the
> transition smoother introduced four new APIs to get/set the
> spi->chip_select & spi->cs_gpiod and replaced all spi->chip_select and
> spi->cs_gpiod references with get or set API calls.
> While adding multi-cs support in further patches the chip_select & cs_gpi=
od
> members of the spi_device structure would be converted to arrays & the
> "idx" parameter of the APIs would be used as array index i.e.,
> spi->chip_select[idx] & spi->cs_gpiod[idx] respectively.
>=20
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
> Acked-by: Heiko Stuebner <heiko@sntech.de> # Rockchip drivers
> Reviewed-by: Michal Simek <michal.simek@amd.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org> # Aspeed driver
> Reviewed-by: Dhruva Gole <d-gole@ti.com> # SPI Cadence QSPI
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com> # spi-stm32-qs=
pi
> Acked-by: William Zhang <william.zhang@broadcom.com> # bcm63xx-hsspi driv=
er
> ---
>  drivers/spi/spi-altera-core.c     |  2 +-
>  drivers/spi/spi-amd.c             |  4 ++--
>  drivers/spi/spi-ar934x.c          |  2 +-
>  drivers/spi/spi-armada-3700.c     |  4 ++--
>  drivers/spi/spi-aspeed-smc.c      | 13 +++++++------
>  drivers/spi/spi-at91-usart.c      |  2 +-
>  drivers/spi/spi-ath79.c           |  4 ++--
>  drivers/spi/spi-atmel.c           | 26 +++++++++++++-------------
>  drivers/spi/spi-au1550.c          |  4 ++--
>  drivers/spi/spi-axi-spi-engine.c  |  2 +-
>  drivers/spi/spi-bcm-qspi.c        | 10 +++++-----
>  drivers/spi/spi-bcm2835.c         | 19 ++++++++++---------
>  drivers/spi/spi-bcm2835aux.c      |  4 ++--
>  drivers/spi/spi-bcm63xx-hsspi.c   | 22 +++++++++++-----------
>  drivers/spi/spi-bcm63xx.c         |  2 +-
>  drivers/spi/spi-cadence-quadspi.c |  5 +++--
>  drivers/spi/spi-cadence-xspi.c    |  4 ++--
>  drivers/spi/spi-cadence.c         |  4 ++--
>  drivers/spi/spi-cavium.c          |  8 ++++----
>  drivers/spi/spi-coldfire-qspi.c   |  8 ++++----
>  drivers/spi/spi-davinci.c         | 18 +++++++++---------
>  drivers/spi/spi-dln2.c            |  6 +++---
>  drivers/spi/spi-dw-core.c         |  2 +-
>  drivers/spi/spi-dw-mmio.c         |  4 ++--
>  drivers/spi/spi-falcon.c          |  2 +-
>  drivers/spi/spi-fsi.c             |  2 +-
>  drivers/spi/spi-fsl-dspi.c        | 16 ++++++++--------
>  drivers/spi/spi-fsl-espi.c        |  6 +++---
>  drivers/spi/spi-fsl-lpspi.c       |  2 +-
>  drivers/spi/spi-fsl-qspi.c        |  6 +++---
>  drivers/spi/spi-fsl-spi.c         |  2 +-
>  drivers/spi/spi-geni-qcom.c       |  6 +++---
>  drivers/spi/spi-gpio.c            |  4 ++--
>  drivers/spi/spi-gxp.c             |  4 ++--
>  drivers/spi/spi-hisi-sfc-v3xx.c   |  2 +-
>  drivers/spi/spi-img-spfi.c        | 14 +++++++-------
>  drivers/spi/spi-imx.c             | 30 +++++++++++++++---------------
>  drivers/spi/spi-ingenic.c         |  4 ++--
>  drivers/spi/spi-intel.c           |  2 +-
>  drivers/spi/spi-jcore.c           |  4 ++--
>  drivers/spi/spi-lantiq-ssc.c      |  6 +++---
>  drivers/spi/spi-mem.c             |  4 ++--
>  drivers/spi/spi-meson-spicc.c     |  2 +-
>  drivers/spi/spi-microchip-core.c  |  6 +++---
>  drivers/spi/spi-mpc512x-psc.c     |  8 ++++----
>  drivers/spi/spi-mpc52xx.c         |  2 +-
>  drivers/spi/spi-mt65xx.c          |  6 +++---
>  drivers/spi/spi-mt7621.c          |  2 +-
>  drivers/spi/spi-mux.c             |  8 ++++----
>  drivers/spi/spi-mxic.c            | 10 +++++-----
>  drivers/spi/spi-mxs.c             |  2 +-
>  drivers/spi/spi-npcm-fiu.c        | 20 ++++++++++----------
>  drivers/spi/spi-nxp-fspi.c        | 10 +++++-----
>  drivers/spi/spi-omap-100k.c       |  2 +-
>  drivers/spi/spi-omap-uwire.c      |  8 ++++----
>  drivers/spi/spi-omap2-mcspi.c     | 24 ++++++++++++------------
>  drivers/spi/spi-orion.c           |  4 ++--
>  drivers/spi/spi-pci1xxxx.c        |  4 ++--
>  drivers/spi/spi-pic32-sqi.c       |  2 +-
>  drivers/spi/spi-pic32.c           |  4 ++--
>  drivers/spi/spi-pl022.c           |  4 ++--
>  drivers/spi/spi-pxa2xx.c          |  6 +++---
>  drivers/spi/spi-qcom-qspi.c       |  2 +-
>  drivers/spi/spi-rb4xx.c           |  2 +-
>  drivers/spi/spi-rockchip-sfc.c    |  2 +-
>  drivers/spi/spi-rockchip.c        | 26 ++++++++++++++------------
>  drivers/spi/spi-rspi.c            | 10 +++++-----
>  drivers/spi/spi-s3c64xx.c         |  2 +-
>  drivers/spi/spi-sc18is602.c       |  4 ++--
>  drivers/spi/spi-sh-msiof.c        |  6 +++---
>  drivers/spi/spi-sh-sci.c          |  2 +-
>  drivers/spi/spi-sifive.c          |  6 +++---
>  drivers/spi/spi-sn-f-ospi.c       |  2 +-
>  drivers/spi/spi-st-ssc4.c         |  2 +-
>  drivers/spi/spi-stm32-qspi.c      | 12 ++++++------
>  drivers/spi/spi-sun4i.c           |  2 +-
>  drivers/spi/spi-sun6i.c           |  2 +-

=46or sun4i, sun6i:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  drivers/spi/spi-synquacer.c       |  6 +++---
>  drivers/spi/spi-tegra114.c        | 28 ++++++++++++++--------------
>  drivers/spi/spi-tegra20-sflash.c  |  2 +-
>  drivers/spi/spi-tegra20-slink.c   |  6 +++---
>  drivers/spi/spi-tegra210-quad.c   |  8 ++++----
>  drivers/spi/spi-ti-qspi.c         | 16 ++++++++--------
>  drivers/spi/spi-topcliff-pch.c    |  4 ++--
>  drivers/spi/spi-wpcm-fiu.c        | 12 ++++++------
>  drivers/spi/spi-xcomm.c           |  2 +-
>  drivers/spi/spi-xilinx.c          |  6 +++---
>  drivers/spi/spi-xlp.c             |  4 ++--
>  drivers/spi/spi-zynq-qspi.c       |  2 +-
>  drivers/spi/spi-zynqmp-gqspi.c    |  2 +-
>  drivers/spi/spidev.c              |  6 +++---
>  include/trace/events/spi.h        | 10 +++++-----
>  92 files changed, 315 insertions(+), 310 deletions(-)




