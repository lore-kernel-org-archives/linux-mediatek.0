Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC9FEB64DC
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jul 2023 08:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nFmwfxhgbitFCQIxZCIwLXxsI27stDUfANTr/r9Pc6Q=; b=U3ezEWUKZPeJXqDK3iAlrL5A5O
	kRGj95QCvCIicGpuanKBKxc2Dr3x7cdecGVvTEAAOfWUK9U1l0DwNjF8ZbkJLPy/ggZORyIuED/Ou
	SxL+2DV1DGXUCUzf8qs0s6iMD9q5Gb8CMoY5CLeWiaQWbTc+uOasx2uBbUZmLcZ26iGPGoNtaCSf5
	BkNSbWUlFLtsmRDUQraWkDifFBdJf5joSrTMkfQUTMHhM/74vLgxiHljTyObYXmd4oPKnbs4U6RYE
	BLF0jJcgKoBA2Ww4YK5HMzIEytDYAoxvtlicwyJWZNPj2Wb+DyTBeQlCePz7hEcXdqEein5SLK4c7
	w7LKfcFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ8Ud-00E4hM-3D;
	Tue, 11 Jul 2023 08:13:08 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ8Ua-00E4g8-0o;
	Tue, 11 Jul 2023 08:13:05 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6971C660700A;
	Tue, 11 Jul 2023 09:12:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689063180;
	bh=2+yn6FDwMd8voKMx1WPt05JiOyMTQxbLsZaEtvbtNN4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Fx8WIExUEuJPaY5MFu8knfLP/k0C26AMfNb/AvH/Fmm0WSmwyzjbdouviC0vRIt5c
	 MKvJLE8w0cLrlZEwxmbFWfOjjLGUQZgFi0o1pLWqgdMYxBGlFBGIjiNaupLZ6FnB33
	 j1HPiXlommzYaYv6ce4cvKcTdjN1ewdnVTlkRjRRehst4X7XEwQxnR9ySh21JtPk6b
	 7KLhT/OtiV9F5v6WVi5j7pxhtZflk0tkK/vKZu9Q314nRK+CtbZPcevQ7M0A64UCcq
	 2GUJjcluoW7Hk+VgSk0dx0uk8kgwhRiKCYyXOMoe3dlhEE5DcTiXTswvygvLYV31mr
	 rt/T478FT4VDw==
Message-ID: <f0b9e2e4-b2c0-4336-0ec4-5afd9f1b6c72@collabora.com>
Date: Tue, 11 Jul 2023 10:12:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 01/15] spi: Remove unneeded OF node NULL checks
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
 Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-trace-kernel@vger.kernel.org, netdev@vger.kernel.org
Cc: Sanjay R Mehta <sanju.mehta@amd.com>,
 Radu Pirea <radu_nicolae.pirea@upb.ro>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Serge Semin <fancer.lancer@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Alain Volmat
 <alain.volmat@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-2-andriy.shevchenko@linux.intel.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230710154932.68377-2-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_011304_424574_2B9C68D4 
X-CRM114-Status: GOOD (  17.39  )
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

Il 10/07/23 17:49, Andy Shevchenko ha scritto:
> In the couple of places the NULL check of OF node is implied by the call
> that takes it as a parameter. Drop the respective duplicate checks.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Validated against spi-mt65xx, spi-mt7621, spi-mtk-nor, spi-mtk-snfi;

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> # 
MediaTek

> ---
>   drivers/spi/spi.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> index 9291b2a0e887..8f3282a71c63 100644
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -2399,9 +2399,6 @@ static void of_register_spi_devices(struct spi_controller *ctlr)
>   	struct spi_device *spi;
>   	struct device_node *nc;
>   
> -	if (!ctlr->dev.of_node)
> -		return;
> -
>   	for_each_available_child_of_node(ctlr->dev.of_node, nc) {
>   		if (of_node_test_and_set_flag(nc, OF_POPULATED))
>   			continue;
> @@ -3134,7 +3131,7 @@ int spi_register_controller(struct spi_controller *ctlr)
>   		if (WARN(id < 0, "couldn't get idr"))
>   			return id == -ENOSPC ? -EBUSY : id;
>   		ctlr->bus_num = id;
> -	} else if (ctlr->dev.of_node) {
> +	} else {
>   		/* Allocate dynamic bus number using Linux idr */
>   		id = of_alias_get_id(ctlr->dev.of_node, "spi");
>   		if (id >= 0) {




