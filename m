Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C14D4EB64DC
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jul 2023 12:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PF44NEqyxP0uEPvVdBdUhZoOyhnmXaRRtdBTolupizs=; b=bkqhkZZM5j8FE7xQnjENeudpaa
	pRN83MZN3BsUXigzsCQ5Iz22+OIX9iAWdG9qTqA9W6+0RWtAvmQTRMXJ1seXGTPwlhKoS8/NJYj5h
	aZJPWsPogXgb8qGZDPe7cMGlv1L1fMdMxMHT1sAeSZ6LxbVx3rpaUIvT5q0Y3R228Q5BcYkYmwg3c
	XItd+dY7rbOxGlVu3Sbvwgl+Q9iA/BDDvHRTLZrlgPhAimkhehXIVl6mMWVVrMQ52VAPtvUWzRhbw
	FNCqstVFGZ6FkcHZ9DrEWJg8uVf3GHg3Yq/wMV53bXHulJnjMMpYQ9SL3U4r1VtB6VXdqjALqARfc
	zDB/lIYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJCVq-00EsZZ-2a;
	Tue, 11 Jul 2023 12:30:38 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJCVi-00EsXN-0X;
	Tue, 11 Jul 2023 12:30:31 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b703cbfaf5so89531181fa.1;
        Tue, 11 Jul 2023 05:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689078626; x=1691670626;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PF44NEqyxP0uEPvVdBdUhZoOyhnmXaRRtdBTolupizs=;
        b=SBnTfmlUAjKWCRn3fyds5WJnq/rFhCyNY0inIr58sbmQdnr0ekqm/rRHOpDPaGy/KO
         B5+bnED3EocI70B/1Liqfviz84UQamIYXCfhBLJdAwpngn8GsImdPLHw3RB6cx2k3qLl
         nSGU6gtvVw3/VsXZCkMPykBjpKDuKmimIVto3O71KEXoVSR8sXs9wWBC1yWjR9VJRV7y
         Wiz8QKW407Y9wEjIJVzHwlxfi2RJhdAg86N/DwGw/jxMsF0gA+NEhyREeEq19FirWzm/
         TqVILtBOKMHlbGVQP5ypx9ZxmExDySMPGPYIR/gAUwwQJjSdRAbKTqb1KbxEGl8qDyoh
         Eb8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689078626; x=1691670626;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PF44NEqyxP0uEPvVdBdUhZoOyhnmXaRRtdBTolupizs=;
        b=gfigeq7VBTv6yPt5Vorw543CrkFV0HNrsfI/2OJRlZFJA6ooWcVB5gcFMPwVmHm5Us
         hF8oEwcBZLwEarXQdqVm9y5MMcm4BzTa8uOsPJgSXneAWXneka1gxdghl+Uxm1Ff2MdZ
         gLxzUxIxNmQxg6b4Dom6D0iiZN4gUQt/JTWm76AO3zYCPABo2mVS5hyU2Ji9yrZcBWb+
         J8n18p2wKGLzE2by87AboJVsZrrmJ5UDhtiwPsBIawaKu0Gjb/5NmecFCnrlp78gLzmI
         AqexflZnXsHXNeO9Sxh81y8Ocp1NpoAsc1D42TUMinXF4lXaj+B06lRBuz0F4KVP928U
         bcdg==
X-Gm-Message-State: ABy/qLa0GYcxx8B34Q2/ld7YR+dISjiN1eFHOdkHGo4RWILLUD7jon28
	ph0oywd12S6MB82Svjm36Lo=
X-Google-Smtp-Source: APBJJlEGAsotaRV20l259BaTNO1He84gEShKxa1gOSyhZTOSrSYKw2njibp5AmXp10CkNfmdPINRWg==
X-Received: by 2002:a2e:8eca:0:b0:2b6:dc50:19ac with SMTP id e10-20020a2e8eca000000b002b6dc5019acmr13901724ljl.31.1689078625694;
        Tue, 11 Jul 2023 05:30:25 -0700 (PDT)
Received: from mobilestation ([85.249.18.12])
        by smtp.gmail.com with ESMTPSA id j17-20020a2e6e11000000b002b6ee75648fsm441355ljc.12.2023.07.11.05.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 05:30:24 -0700 (PDT)
Date: Tue, 11 Jul 2023 15:30:19 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Yang Yingliang <yangyingliang@huawei.com>, 
	Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>, Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-trace-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	Sanjay R Mehta <sanju.mehta@amd.com>, Radu Pirea <radu_nicolae.pirea@upb.ro>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Heiko Stuebner <heiko@sntech.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH v2 13/15] spi: Rename SPI_MASTER_GPIO_SS to
 SPI_CONTROLLER_GPIO_SS
Message-ID: <tvm772o6uqndgyjvycv27qouqq76crpre5tyqcnanaautqjjwn@pydiwhjzhbgd>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-14-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230710154932.68377-14-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_053030_204343_F222A691 
X-CRM114-Status: GOOD (  20.58  )
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

On Mon, Jul 10, 2023 at 06:49:30PM +0300, Andy Shevchenko wrote:
> Rename SPI_MASTER_GPIO_SS to SPI_CONTROLLER_GPIO_SS and
> convert the users to SPI_CONTROLLER_GPIO_SS to follow

* I'm not an expert in English, but imo the next would look a
* bit more readable:
* convert s/the users to SPI_CONTROLLER_GPIO_SS/the code to using SPI_CONTROLLER_GPIO_SS

> the new naming shema.

s/shema/schema

> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
[...]

>  drivers/spi/spi-dw-core.c  | 2 +-

[...]

> diff --git a/drivers/spi/spi-dw-core.c b/drivers/spi/spi-dw-core.c
> index a8ba41ad4541..45f5acc26b1d 100644
> --- a/drivers/spi/spi-dw-core.c
> +++ b/drivers/spi/spi-dw-core.c
> @@ -932,7 +932,7 @@ int dw_spi_add_host(struct device *dev, struct dw_spi *dws)
>  	if (dws->mem_ops.exec_op)
>  		master->mem_ops = &dws->mem_ops;
>  	master->max_speed_hz = dws->max_freq;
> -	master->flags = SPI_MASTER_GPIO_SS;
> +	master->flags = SPI_CONTROLLER_GPIO_SS;
>  	master->auto_runtime_pm = true;
>  
>  	/* Get default rx sample delay */

For the DW APB/AHB SSI driver:
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

[...]

> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> index 06a92a3a5746..bcabae98cb7c 100644
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -995,7 +995,7 @@ static void spi_set_cs(struct spi_device *spi, bool enable, bool force)
>  				gpiod_set_value_cansleep(spi_get_csgpiod(spi, 0), activate);
>  		}
>  		/* Some SPI masters need both GPIO CS & slave_select */
> -		if ((spi->controller->flags & SPI_MASTER_GPIO_SS) &&
> +		if ((spi->controller->flags & SPI_CONTROLLER_GPIO_SS) &&
>  		    spi->controller->set_cs)
>  			spi->controller->set_cs(spi, !enable);
>  	} else if (spi->controller->set_cs) {
> @@ -3020,7 +3020,7 @@ static int spi_get_gpio_descs(struct spi_controller *ctlr)
>  
>  	ctlr->unused_native_cs = ffs(~native_cs_mask) - 1;
>  
> -	if ((ctlr->flags & SPI_MASTER_GPIO_SS) && num_cs_gpios &&
> +	if ((ctlr->flags & SPI_CONTROLLER_GPIO_SS) && num_cs_gpios &&
>  	    ctlr->max_native_cs && ctlr->unused_native_cs >= ctlr->max_native_cs) {
>  		dev_err(dev, "No unused native chip select available\n");
>  		return -EINVAL;
> diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
> index cdc3addfe117..43f6c3f71a76 100644
> --- a/include/linux/spi/spi.h
> +++ b/include/linux/spi/spi.h
> @@ -578,8 +578,7 @@ struct spi_controller {
>  #define SPI_CONTROLLER_NO_TX		BIT(2)	/* Can't do buffer write */
>  #define SPI_CONTROLLER_MUST_RX		BIT(3)	/* Requires rx */
>  #define SPI_CONTROLLER_MUST_TX		BIT(4)	/* Requires tx */
> -
> -#define SPI_MASTER_GPIO_SS		BIT(5)	/* GPIO CS must select slave */
> +#define SPI_CONTROLLER_GPIO_SS		BIT(5)	/* GPIO CS must select slave */
>  
>  	/* Flag indicating if the allocation of this struct is devres-managed */
>  	bool			devm_allocated;
> -- 
> 2.40.0.1.gaa8946217a0b
> 

