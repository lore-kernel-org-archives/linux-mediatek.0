Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CFE8EB64DD
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jul 2023 13:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WH1J3lxbYmwK4HX/vwQvN/bDM9AadSAUZU8trUClhmQ=; b=k1v79ZBJcR4RRLjiqyQigh0sZq
	SwShd3u0kSECsFyMQGOSZmnpXIhJlJUYzaUHkYKIDONTZ38247hVFTyQ+Wzmg65HWKJHQQXwvC+9Y
	75EHTMh603yB7O6GizRaUTQX6FZccrnYJtrhlSZxEvbtj4cZYpBgmWP26jLcGb4sqU/QuzN5wH/KJ
	abWSczLUtr7raNp6kWb/lvTCiFdwZkEY6uYVjGOtzMja6ZyJ/AagMkgoLALkBPQ1kqVdeB3+vdnG7
	3GJ0S7TkalxGUQOQ6aySD1KcbwXbIxe11s3MnZa7WbBsgGnZAZwaovs7ru/k8kbgZKRL4uHUCIWyB
	Py93UeSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJD3h-00EwuL-1O;
	Tue, 11 Jul 2023 13:05:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJD3d-00Ewtd-35;
	Tue, 11 Jul 2023 13:05:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D5788614A9;
	Tue, 11 Jul 2023 13:05:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE23AC433C8;
	Tue, 11 Jul 2023 13:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689080732;
	bh=HnVEva2jdOLXu3EN/cKYarAoyETVmcXrgG0CY9KCvZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BO5Sf+xL4FaASSNsNdM5EGXByrv4WeTUxRBoPW2QNejIwlELvXTu5gKKqv4hkKhGg
	 oi3ZfR9Shzo5QwnSHTFndf8ZIVkqpTClpssosTOBH6/4HIjVrlXO3KdynsW5+Pg7kp
	 pbkKvKQx6ir3yg7CLJDoLHQzo0ewO66SzIeDifz9SCJzdBAZAn9RpEQzQEGNZHOmt+
	 6tOI/PPlmxZBFom+gGGjOjy+qrSc5cI26iueLs1Gv6DR2sYD26rubxcFZS48+8Dw/G
	 5SSyFU8wEM4MuZLWsQU4tXLcKI+0ehoZc3/OitBA10N/7/7vB38b2KMdMwG1AhcrlN
	 +CUurb7ZrrwoQ==
Date: Tue, 11 Jul 2023 14:05:18 +0100
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
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
Message-ID: <e3688ce5-616a-4399-a4e3-c410a09f6a45@sirena.org.uk>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-5-andriy.shevchenko@linux.intel.com>
 <83c4b75a-06d7-9fca-ffa0-f2e6a6ae7aed@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="925w7TTgRoHZtFsT"
Content-Disposition: inline
In-Reply-To: <83c4b75a-06d7-9fca-ffa0-f2e6a6ae7aed@collabora.com>
X-Cookie: marriage, n.:
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_060534_078845_E656CB8C 
X-CRM114-Status: GOOD (  14.55  )
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


--925w7TTgRoHZtFsT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 11, 2023 at 10:28:13AM +0200, AngeloGioacchino Del Regno wrote:
> Il 10/07/23 17:49, Andy Shevchenko ha scritto:

> > +		ms = spi_controller_xfer_timeout(ctlr, xfer);

> I agree on using helpers, but the logic is slightly changing here: yes it is
> unlikely (and also probably useless) to get ms == UINT_MAX, but the helper is
> limiting the maximum timeout value to 500mS, which may not work for some slow
> controllers/devices.

The helper is limiting the *minimum* timeout value to 500ms - it's using
max() not min().  The idea is the other way around, that for a very fast
transfer we don't want to end up with such a short timeout that it false
triggers due to scheduling issues.

--925w7TTgRoHZtFsT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmStU40ACgkQJNaLcl1U
h9B+yQf+KBYXJ7506wC0Am0zY2LnPrpwi7/uhVWQsN9GzhBVU0RGwam2xuqmpCeo
A3o92lqKSQPkQGllTlnuM3r4jp2qDy1/U/QJJxak+i/i8NjuVxIQQIKtnM/nRQxh
yRpIp6WbVt+HJsdFgPS6j6r/3m1qS4eTbso7/ciwLzdRc2Yxk9SLXFteOErlAEoq
hhR7VxhID4BE72a+1NbyuALEVGjSMYBdpddD//Qa1UsJVw1yK5HuM51CaQd9bTlo
EtrmXMgaG9FB+lQeu2zedT6HTQQH/hOB77luYq4zGm849tw2sfBPIhqVgQtkkutv
4hpXSMiuD+iL32PThXfathhu4xvFiQ==
=l6sR
-----END PGP SIGNATURE-----

--925w7TTgRoHZtFsT--

