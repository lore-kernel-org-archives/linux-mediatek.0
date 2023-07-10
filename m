Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDD2EB64DA
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 17:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yBEMuGoWHM9zUe+iAIatKlGNoEB//1WfSxUw+0SuQ6A=; b=UQNxLz+JXyVU2ZDZRGlZwHCidG
	Csq+KxvtWvECKi03jMarZdc+CTM7s52d9iVDo1smsF0ujQry2mwrZqEKkMnjjaasSJbhUBZJryk8I
	Wmo8Z9kKrxqvW7An0HRlCnx/x7nhqITcKKzqZYsmYn4N7z/Amvyhd/BBO9w/ijd4+K/Q8ABtfx+fE
	WEYE/NP0XkbCh5C2rGoK2cB23muL33iIWOC0D2w0jficntqHU4kaQOTZzOigYUJ44crzf5Me935Nv
	IGz4Z8R6f699gcIdct1/5A8OLK3HgEZhILqPpnLDAIuSBvj87e9ZQVzzdPFvH+CJC2GYtw3aVbScj
	2DxrM0Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIujS-00CMmA-0K;
	Mon, 10 Jul 2023 17:31:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIujO-00CMkQ-0n;
	Mon, 10 Jul 2023 17:31:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 88CE460FBB;
	Mon, 10 Jul 2023 17:31:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62DD5C433C7;
	Mon, 10 Jul 2023 17:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689010285;
	bh=yBEMuGoWHM9zUe+iAIatKlGNoEB//1WfSxUw+0SuQ6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VttBOl+eNlj1/cgq3G8qxJc+Ah7b5ZQ04PTV+EG6CFR2pRgYe6JyXMHkH1/K5bemV
	 K7OqUHz9qrkCqPetZgj1nNcc9MMYdr/B9tGDE8jYkIXmiDAP6OS06Xl3q0kgh5hEpC
	 MvMnLChy3z1cQdkugx0ULecDib0F8BZscQJjcD6lCQGmAOZWkJumwmB1iP89ewG1mK
	 rAm6IHAnieSj0S2DZ5vLDOR0ISwF5BNq2Bv8GkENsnzbMGMTAKoGpz+DIGvt6qDstD
	 H+akvWxjFGPRQ19Fycx48iyLC1xdJ/ddnyN9qoFnjn+84u3R5jM1KfNYx9ZqQrj7XX
	 kUC1BkFYkCtCQ==
Date: Mon, 10 Jul 2023 18:31:12 +0100
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
Subject: Re: [PATCH v2 00/15] spi: Header and core clean up and refactoring
Message-ID: <58c6f76a-8028-4ce8-a101-d5feb3b40897@sirena.org.uk>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Mtt0ZQ3K6jQ9xKnG"
Content-Disposition: inline
In-Reply-To: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
X-Cookie: Do you have lysdexia?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_103126_362172_E4FC4DE9 
X-CRM114-Status: GOOD (  11.66  )
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


--Mtt0ZQ3K6jQ9xKnG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 10, 2023 at 06:49:17PM +0300, Andy Shevchenko wrote:
> Various cleanups and refactorings of the SPI header and core parts
> united in a single series. It also touches drivers under SPI subsystem
> folder on the pure renaming purposes of some constants.

I've queued 1-3, 6-8 and 11- for CI thanks.

--Mtt0ZQ3K6jQ9xKnG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSsQF8ACgkQJNaLcl1U
h9CQ2gf+NebuHlkBa9zrhzmcGhSrtVx5yFCLP0dHaZVPMEHj6t0rIpQGodx2xOq0
MawEB/JvvnMHpCvUoGGUXGsTcLiBB3uxADywJKyPkitWM3W/9LMAGRwpdnyV/zbN
i4RuTGjLyFnoHuDdf82cL/5f3EFsLn1J3rl3cUDAv1c3U+WpZReA4OO9s9QhlqJU
GfQoV1As2DUX49504bC2EfuPpa4wYIWrR1fT8ApGCZXs3KUQpgTWQ7iH4X48fdbY
5gE1rQID66FMT2d78FRZkVmqej6wFqYr34G0zD2Lf/qC+ZsTSvvy4YExJhNnts1Q
Md56GS1p2fjwWtBGCvs3Gmlg6zcmtQ==
=CQab
-----END PGP SIGNATURE-----

--Mtt0ZQ3K6jQ9xKnG--

