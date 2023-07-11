Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFFAEB64DD
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jul 2023 08:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e0ITNM84h8mOwKhA1IlZoP3DKih9eIhFfww2ByRdPXk=; b=Vt8qJX8AHOzpyWOaS0eK/HK1mf
	PlkqdbwPjsMLWBywLXZ3jXcpgnFDL1Op6BxqGV7HYuo1TcVtSdy9HY+4Cr2hVbNcEmvYdWNcPGY/L
	bLe8tHJxMM3MctODBOtBUcyyE9BCRIUkhXA8sN27V+OPMlAMzYrNW2sR/W/D/mLOy1cvkq41BSX8x
	YR2lb/MtVWhtBEqXA/OWACL7JX3oFU6kh3EQeMAYdQ2dy0Ql4HxALKlufEAFZTHCsjK/oyyrP5ffq
	T+ROeGP7tafAewkJp7N/Q95FoV+kzjRmmccQ3X1nXMtqQ96tdtEazpPNI7rYrpAI1WLgKuhXmQgsx
	/M5LXQcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ8jQ-00E7Hm-24;
	Tue, 11 Jul 2023 08:28:24 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ8jM-00E7Gf-0m;
	Tue, 11 Jul 2023 08:28:21 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2532E660700A;
	Tue, 11 Jul 2023 09:28:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689064098;
	bh=spdNLway67POM3vmFaXNGhDhQmXxhVIedWvVLp0PkEI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XSCTbFXk9e6Ms6w3dUD0gTaJbCLMJPnp6Us3KW28VZQ9hoaNYRdeO51FSibZH/fzR
	 JKiOts4MP0vpXd7Sm62WRMiy18wm8cew197TIrGkrMstBRkn8EotGVMfdYCXfIPJSe
	 daxKC2B2n9x1az4GZ5GnR8rcX8dTYTsyY730jAhseXuJoFP2RlZZLPbPOwRRmcg2DA
	 AuU+HmpPB29i7vONs5CAXPnuO8/39XXDXiNgdv1iHqfSMOywBsFHXC35USEsn3iVGM
	 sm/VWNEaupu1VVdE1Na6ph1PWVqdQwL0sL6NNEZHb+h9luZhHTnlJNLnVZ7IUaGKbA
	 HdIZq6knmkqdQ==
Message-ID: <83c4b75a-06d7-9fca-ffa0-f2e6a6ae7aed@collabora.com>
Date: Tue, 11 Jul 2023 10:28:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 04/15] spi: Replace open coded
 spi_controller_xfer_timeout()
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
 <20230710154932.68377-5-andriy.shevchenko@linux.intel.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230710154932.68377-5-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_012820_541887_62A2119D 
X-CRM114-Status: GOOD (  31.16  )
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
> Since the new spi_controller_xfer_timeout() helper appeared,
> we may replace open coded variant in spi_transfer_wait().
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/spi/spi.c       | 25 ++-----------------------
>   include/linux/spi/spi.h |  6 +++++-
>   2 files changed, 7 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> index 125dea8fae00..c99ee4164f11 100644
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -1342,8 +1342,7 @@ static int spi_transfer_wait(struct spi_controller *ctlr,
>   {
>   	struct spi_statistics __percpu *statm = ctlr->pcpu_statistics;
>   	struct spi_statistics __percpu *stats = msg->spi->pcpu_statistics;
> -	u32 speed_hz = xfer->speed_hz;
> -	unsigned long long ms;
> +	unsigned long ms;
>   
>   	if (spi_controller_is_slave(ctlr)) {
>   		if (wait_for_completion_interruptible(&ctlr->xfer_completion)) {
> @@ -1351,29 +1350,9 @@ static int spi_transfer_wait(struct spi_controller *ctlr,
>   			return -EINTR;
>   		}
>   	} else {
> -		if (!speed_hz)
> -			speed_hz = 100000;
> -
> -		/*
> -		 * For each byte we wait for 8 cycles of the SPI clock.
> -		 * Since speed is defined in Hz and we want milliseconds,
> -		 * use respective multiplier, but before the division,
> -		 * otherwise we may get 0 for short transfers.
> -		 */
> -		ms = 8LL * MSEC_PER_SEC * xfer->len;
> -		do_div(ms, speed_hz);
> -
> -		/*
> -		 * Increase it twice and add 200 ms tolerance, use
> -		 * predefined maximum in case of overflow.
> -		 */
> -		ms += ms + 200;
> -		if (ms > UINT_MAX)
> -			ms = UINT_MAX;
> -
> +		ms = spi_controller_xfer_timeout(ctlr, xfer);

I agree on using helpers, but the logic is slightly changing here: yes it is
unlikely (and also probably useless) to get ms == UINT_MAX, but the helper is
limiting the maximum timeout value to 500mS, which may not work for some slow
controllers/devices.

This should get validated on more than a few platforms, and I'm not sure that
this kind of validation would be "fast" to get... so, probably the best thing
to do here is to add a warning in case the timeout exceeds 500mS, print the
actual value, keep it like this for a kernel version or two and check reports:
that would allow to understand what a safe maximum timeout value could be.

Aside from that, I wouldn't drop those nice comments explaining how/why the
timeout is calculated: I know how, but not everyone knows in advance.

Regards,
Angelo

>   		ms = wait_for_completion_timeout(&ctlr->xfer_completion,
>   						 msecs_to_jiffies(ms));
> -
>   		if (ms == 0) {
>   			SPI_STATISTICS_INCREMENT_FIELD(statm, timedout);
>   			SPI_STATISTICS_INCREMENT_FIELD(stats, timedout);
> diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
> index 32c94eae8926..0ce1cb18a076 100644
> --- a/include/linux/spi/spi.h
> +++ b/include/linux/spi/spi.h
> @@ -1270,12 +1270,16 @@ static inline bool spi_is_bpw_supported(struct spi_device *spi, u32 bpw)
>    * that it would take on a single data line and take twice this amount of time
>    * with a minimum of 500ms to avoid false positives on loaded systems.
>    *
> + * Assume speed to be 100 kHz if it's not defined at the time of invocation.
> + *
>    * Returns: Transfer timeout value in milliseconds.
>    */
>   static inline unsigned int spi_controller_xfer_timeout(struct spi_controller *ctlr,
>   						       struct spi_transfer *xfer)
>   {
> -	return max(xfer->len * 8 * 2 / (xfer->speed_hz / 1000), 500U);
> +	u32 speed_hz = xfer->speed_hz ?: 100000;
> +
> +	return max(xfer->len * 8 * 2 / (speed_hz / 1000), 500U);
>   }
>   
>   /*---------------------------------------------------------------------------*/


