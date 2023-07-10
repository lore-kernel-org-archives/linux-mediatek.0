Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3891EB64DC
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 13:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RJ4lvP8JVJhiuP5mnFYex80ThwuAY/7j60INcuxA0Xw=; b=dPzNrkLkhNSATZvHRVCq1aNMsw
	04LMG3kz3hB+uLvW5OsrybtNDr9stPhJ3truBHpHycn9CSN2EHhPc/TopgXEJYx/b04jqncD+iVcj
	ZMZ7+cYz0tifKiQ+gZ0TejY8yxVK9Kg45CuUhgWlxS0fOWeIG42IAwcwDiEomf/BkXVl/cr6qtVH2
	zpkJUES0tp/zYpJeJIt2BbOSxRFfMhMVrf8SHuXCpbxIPY3gOn8wgkSK6XfcX9STnceAUAnf+Jiko
	+iDUlnXpv+EQPHP1EDibWyL/oFoOFXqwenlP/20zbPcOChLIH+N4wRgWI9/+PgZuFoLP/BFGZAML+
	FHEASUCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIqpK-00BjzF-0k;
	Mon, 10 Jul 2023 13:21:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIqpH-00BjxR-0v;
	Mon, 10 Jul 2023 13:21:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C621F60DED;
	Mon, 10 Jul 2023 13:21:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94191C433C7;
	Mon, 10 Jul 2023 13:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688995274;
	bh=ruJlO0wimIrsDY1JgPUqCqS7prBe1pSopi+dM4yYAWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tCUvqCttiPcwuUH6oQaeDTVlt/jVMTKddukpB3Rq2NTAjbzgaXhOs+IbQKiqA2zFS
	 A9RwOziobHTKo8xtAoLCbw9/G5XP7z93lwwcMiVxafq8PiTNYdyOWz2ZmNVbJqaRu3
	 p+o7GErUG6dN3D+2vdmSUok/vpvLEP/d4e2/6uVM8lFbtbK1g1KhHRcJ+YzSNSc8aV
	 vzC9RTasZiyt6DNQvmgXjaDeqvMTkrDbkZFHHHz5OJ3MwZifaBQsXsj96SFX7XFS5/
	 2yl7VTCIzPWHRNx1uEfr8lQDSlw+D72llgC2cC8KCiu81fGygjzL2Umg2d4uKSVdv1
	 5QaNEib99pP6w==
Date: Mon, 10 Jul 2023 14:21:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Yang Yingliang <yangyingliang@huawei.com>,
	Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
	Kris Bahnsen <kris@embeddedts.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Radu Pirea <radu_nicolae.pirea@upb.ro>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH v1 4/8] spi: Get rid of old SPI_MASTER_NO_.X and
 SPI_MASTER_MUST_.X
Message-ID: <7aff8759-cfca-47b5-b995-5260e5082c45@sirena.org.uk>
References: <20230710102751.83314-1-andriy.shevchenko@linux.intel.com>
 <20230710102751.83314-5-andriy.shevchenko@linux.intel.com>
 <1ffd5603-4140-4bf6-bfed-af70a6759bda@sirena.org.uk>
 <ZKvmkAP5ZuT6lGLN@smile.fi.intel.com>
 <ZKvnPXl9H+cQR8Ok@smile.fi.intel.com>
 <353027bf-6d2a-40de-9e18-8553864b343c@sirena.org.uk>
 <ZKv7p96D2B9vYd0J@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Bc8mzeK4BJwaYeTa"
Content-Disposition: inline
In-Reply-To: <ZKv7p96D2B9vYd0J@smile.fi.intel.com>
X-Cookie: Do you have lysdexia?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_062115_404397_E6C4074A 
X-CRM114-Status: GOOD (  16.85  )
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


--Bc8mzeK4BJwaYeTa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 10, 2023 at 03:37:59PM +0300, Andy Shevchenko wrote:
> On Mon, Jul 10, 2023 at 12:22:59PM +0100, Mark Brown wrote:
> > On Mon, Jul 10, 2023 at 02:10:53PM +0300, Andy Shevchenko wrote:

> > > > > > Convert the users to SPI_CONTROLLER_NO_?X and SPI_CONTROLLER_MUST_.X
> > > > > > and kill the not used anymore definitions.

...

> > > > > > -	controller->flags = SPI_MASTER_MUST_RX | SPI_MASTER_MUST_TX;
> > > > > > +	controller->flags = SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX;

> > What part of the above change is replacing _NO_ with _MUST_?

> None, that's why assuming the split by name should be fine.

That's what the above changelog sounds like it's trying to do (I'm not
sure the change itself makes sense but the first thing I ran into when
reviewing the patch), AFIACT you're missing a "from" in the changelog?

--Bc8mzeK4BJwaYeTa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSsBcAACgkQJNaLcl1U
h9BDYgf/Sarsl9t6SagewIDl2ctlFPl7f++zP6SLId0C0LErq2lPLxZKf8tzzV5x
7mUMpK3rPcygDeYAqOKLncxnrZp/i7yix/98fZtls9IesvOQa29aRYKVSvhKnB6y
dHoZoMBdYj1Rbo/olUcS1xjzzZ0o1VUHkLsp9rjoMW4lcz6Hu3o8GSOq1pbc9lRd
qlCYAjMqjR9K3te5I6FICKKGnIrXm2uxuzSPZl1G7LaN0THUZGZJvcBHjhR2PcJs
K9i9m0gJ9xsQXDOQgLTcXrm8hdSF7yQoRI3TBZ7RXzdWeO3mjNjeHGbVDRr3DMZy
Oici+Ga3mBLzIlFlF51Tg71+BGqcoQ==
=NWL6
-----END PGP SIGNATURE-----

--Bc8mzeK4BJwaYeTa--

