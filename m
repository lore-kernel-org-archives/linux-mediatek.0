Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFA8EB64DA
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 16:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vf+hINBxnQmKHxnN5HSIKugguSQ4LsFli3CGiHsqCYw=; b=exPYcjsXXrSuwSzZP1hcxTSiRb
	TrbA7KLVysn4wsfgNaRE2J0qMDCyBlI8pfTCsbaYx4oQEJu25f2iOlfN7IovmqA5gfAECdYaFKXyA
	ZVqY2FL1mO99NhNy9jTKCbchzBaGpV0+KOdyCvUxktQBVl0k5zKdGgukBPZRe2kmHXFHjOMYFbpEx
	V1sKiDtUT65ptOExo/N2vDdNbI6cwQvE3p99ohP2V+VZRh63FvjfZiSgaT4uzU5RslRbGx8H+iroF
	l+OF5NhDVkg10ugElYmuZT6oulE8iLiwiRwHXq2YVxB323Ay3IxatnkuSg9Et9CmSjuDkj56nQK4V
	BX+XoCTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIuCN-00CGrq-07;
	Mon, 10 Jul 2023 16:57:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIuCJ-00CGqy-2t;
	Mon, 10 Jul 2023 16:57:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4835D6102A;
	Mon, 10 Jul 2023 16:57:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 013E7C433C8;
	Mon, 10 Jul 2023 16:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689008234;
	bh=IIro+PYudoCpsNeH2Llkq/gmEiqeLq8TswCPO5UnD6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p7yUWoNb8JNe5qIMp13em9m8Rzsc1ghhta/kWFSe5/qi4pD5l1Kdd3nTIbhSAnB41
	 W8C1J2axQqESm/vo5JFAn+FCzJ9O92y9klVgFoPPFBocvgHANqPMFGPKWSy1cah2AJ
	 6B66a+6OSbM4vJnoAPeTpJQU1ZveA0PYXoTV6fut7sflD58+Jtel0GfBpq6p2nXiCt
	 M0xsvZQxCC0EolQkXizKejaZaayP6VSNsobrYWwUH758W9Nr9zRBh1oYMDG5FsShL0
	 zQI22BV9Iz/Ww1LFbCTyWKHKLILGMYlknCcvjk0BqOW9V/aTLFc+59pabBeheGKNwr
	 5euI/OtpKjArA==
Date: Mon, 10 Jul 2023 17:56:59 +0100
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
Subject: Re: [PATCH v2 03/15] spi: Replace if-else-if by bitops and
 multiplications
Message-ID: <24e71654-bc79-42ac-86d1-4e6100f6893a@sirena.org.uk>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-4-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fI+fdz2D5/EEE42m"
Content-Disposition: inline
In-Reply-To: <20230710154932.68377-4-andriy.shevchenko@linux.intel.com>
X-Cookie: Do you have lysdexia?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_095716_017984_F78ADD92 
X-CRM114-Status: GOOD (  13.77  )
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


--fI+fdz2D5/EEE42m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 10, 2023 at 06:49:20PM +0300, Andy Shevchenko wrote:

> -		if (xfer->bits_per_word <= 8)
> -			maxsize = maxwords;
> -		else if (xfer->bits_per_word <= 16)
> -			maxsize = 2 * maxwords;
> -		else
> -			maxsize = 4 * maxwords;
> -
> +		maxsize = maxwords * roundup_pow_of_two(BITS_TO_BYTES(xfer->bits_per_word));

This will change the behaviour if bits_per_word is more than 32.  That
is validated out elsewhere but I shouldn't have had to go around
checking the code to confirm that this is the case.  This is the sort of
thing that should be highlighted when doing this sort of edge case
stylistic change.

--fI+fdz2D5/EEE42m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSsOFsACgkQJNaLcl1U
h9A2Ywf+KXUPki4n4OHbYfUF8KSXIYSkZGLAugrUbcI1dW/wY8+0fLYP8+4w9V+j
f81LA7/NDs1aRdnIEAvy6JRWhsUGKyHHKw42xpXD6MqtamipzOaVSYaL2Hr3ZuqC
22p4KuNl0BAuHc+iyOWLpX7/btG8mweyZNWYjDbaB3duv4usx8Pis5kQu9HrTvfw
e1repiQ4pqd5PGfhReO1fGbR6QIhoswiEm/9yfkZTQs1HAIOpRAePL2XPZD3sBuj
pehvlOvP2yRq1fOxYVWGxXH8dhavS5t/mUlzyTYI7VxMD2HUZD1EiZ2uYcmntUEl
y8tiLDQIFQRb++F+IFf0SjU+vXe0UQ==
=tuUl
-----END PGP SIGNATURE-----

--fI+fdz2D5/EEE42m--

