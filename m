Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59020C001DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 17:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XsZNfqD+qCYxTR5DTiRhkoewxQaOjpqIrkrlAx10mbs=; b=EZ5sZ/gFduFex5Elyrte0x8+St
	ATj6XqAvsycwD8yBnxfFPLELe5pikUqIjAzf4nz8aYQmWPfqCeiGo65IM30Iw1XTPmJ63lbOjqFJO
	WGY1po4ltaED17HwDyVfRuKProbzU+dVjK5hfE/J/d1TZXilBbQEi0O5gFPG6KhLM8yAwHsQQDF1z
	k0G86O8FplD42wKmk5QmLKFh2kJb8e9cqtDIh5jpIAiEa+tZc0eDe3J2vqqqhZGxqVwTG4VMPhz3g
	9kmts2cuqtXyQ8YGnohlfAVXHflUMw1CgDAeTiU2GYX3whf9a0x0A1BSjDCKHX9DYaFo8SLS5RKkI
	S9PYaTBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIuin-00CMXH-1c;
	Mon, 10 Jul 2023 17:30:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIuik-00CMWM-1b;
	Mon, 10 Jul 2023 17:30:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CD59A61166;
	Mon, 10 Jul 2023 17:30:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B727C433C9;
	Mon, 10 Jul 2023 17:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689010245;
	bh=8daJmCsRggn9xziEjmtzfB/+TEmSHGqfTrQOxt4tg1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t2qoXUnSHuV+TbWU69K3xBxeG6UAs5r8JvEuI+8qIwEdTjDJX9HPZn++uZHMNIQaD
	 86g42vDDjo+xgTS9/scrmuWADvN0R48PLgUPQA8lzB5uIE7gczU7YsGie2UjWiD40Y
	 soETF0P1p+D4lt8Jw6O9FNAf5+tzNnhQ6U1GTpxDacTetMTQd4tHQO7p92dxIvPKDo
	 vCacGl+XShxk3g8tnOVtoXP+PJNeX8VjY17MSNUMQyZxhOaFwy902auPvHxrZTYMla
	 iILw2xA2Gbqp0/Iihh6sd5pNaL6Cxsx8tHLlJ00pYbON+m3jOCfuniILkrN7AJJX38
	 Zx5bmFaJNvHKA==
Date: Mon, 10 Jul 2023 18:30:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Subject: Re: [PATCH v2 04/15] spi: Replace open coded
 spi_controller_xfer_timeout()
Message-ID: <cfaffa00-4b61-4d81-8675-70295844513b@sirena.org.uk>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-5-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IbZ/DrTRficzGRpW"
Content-Disposition: inline
In-Reply-To: <20230710154932.68377-5-andriy.shevchenko@linux.intel.com>
X-Cookie: Do you have lysdexia?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_103046_618093_90C238F9 
X-CRM114-Status: GOOD (  14.04  )
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


--IbZ/DrTRficzGRpW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 10, 2023 at 06:49:21PM +0300, Andy Shevchenko wrote:

> Since the new spi_controller_xfer_timeout() helper appeared,
> we may replace open coded variant in spi_transfer_wait().

> + * Assume speed to be 100 kHz if it's not defined at the time of invocation.
> + *

You didn't mention this bit in the changelog, and I'm not 100% convinced
it was the best idea in the first place.  It's going to result in some
very big timeouts if it goes off, and we really should be doing
validation much earlier in the process.

> +	u32 speed_hz = xfer->speed_hz ?: 100000;

Not only the ternery operator, but the version without the second
argument for extra clarity!

--IbZ/DrTRficzGRpW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSsQDcACgkQJNaLcl1U
h9DEzgf/dy9EpgGVS5JKG+2sOnEEWzJ1/z92vL5sQoHWJT0M7rzfGdRlGddYvj2k
yOJg6fvzzY2vbGoYuqkSlYi95WyUFmwqjd+BwayzJ5gH0xKRXo4MwCHKIET3z44z
8pD55r1ow40GOeztLTsLwgiADUQSMRLm/Y33rrf2I1J+/AgrEV6V+oZnbWsmoI+I
0QS2ZIQk8m1oDghyOmEOzW+jqJQbDR6HAP0L9dUbd/zcJK9LDXHE5hepkLjQbC6v
oGrJJVbs+IYFbaNJrDNtxtF3JwlAtVWWSten66FG3fmreSDQwcKATVKiHWtLlhJb
a/T8TlFW3ianwYVf2yMOEojOIbZvQw==
=d1Us
-----END PGP SIGNATURE-----

--IbZ/DrTRficzGRpW--

