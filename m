Return-Path: <SRS0=XWkL=5J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0895BC54FCE
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Mar 2020 14:24:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FDB4214D8
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Mar 2020 14:24:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hz7CF2cl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FDB4214D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SwQ5SYlP0IvZp36wp3HcIzxj2fA4NGBTTW/Te9HHSFI=; b=Hz7CF2cl8C9C0Si8uzGZDNyiq
	mV1PU4nmT0hlwlAELnGVuLNQ2AMCYIqSUN7tQx0zKaM/a3ivpiTfXxHmTHeEsXVVVmv4O0GQVsaBB
	CsBgW9vNMdZEgd+fFNDT4HgAE/4MScc6qpeY/JQ1b+rzHbeSR9zBHd5GtSLJz+hm6u0A1DBb6ci4F
	txAr1m2onJFx1XYItWKHNg28+KmPMbx4GnzcbycXi5mYyWkjuM0R+HLZYZ244mBj8KaGFf7KUkTaf
	bYwWUCMQzlVx9xO8Xyeo0weyzk5DZR8izO5ND0svh90F6dzJAJmrJwM4SQMl4DOmKO+FKri+UUmW+
	cfz3g2E+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGkU4-0001qD-Rx; Tue, 24 Mar 2020 14:24:48 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGkTo-0001c6-0u; Tue, 24 Mar 2020 14:24:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC9401FB;
 Tue, 24 Mar 2020 07:24:29 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 372A53F52E;
 Tue, 24 Mar 2020 07:24:29 -0700 (PDT)
Date: Tue, 24 Mar 2020 14:24:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH v6 06/10] regulator: use linear_ranges helper
Message-ID: <20200324142427.GF7039@sirena.org.uk>
References: <cover.1584977512.git.matti.vaittinen@fi.rohmeurope.com>
 <5522b2e03f77e1b7c93adf07b85747ea9ddfbf9b.1584977512.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
In-Reply-To: <5522b2e03f77e1b7c93adf07b85747ea9ddfbf9b.1584977512.git.matti.vaittinen@fi.rohmeurope.com>
X-Cookie: I feel ... JUGULAR ...
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200324_072432_168079_3188E37E 
X-CRM114-Status: GOOD (  11.90  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Milo Kim <milo.kim@ti.com>,
 Andrei Stefanescu <andrei.stefanescu@microchip.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree@vger.kernel.org,
 linux-omap@vger.kernel.org, mikko.mutanen@fi.rohmeurope.com,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-samsung-soc@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Chen-Yu Tsai <wens@csie.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Gross <agross@kernel.org>,
 markus.laine@fi.rohmeurope.com, linux-arm-msm@vger.kernel.org,
 Borislav Petkov <bp@suse.de>, Petr Mladek <pmladek@suse.com>,
 Mikhail Zaslonko <zaslonko@linux.ibm.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Arnd Bergmann <arnd@arndb.de>,
 mazziesaccount@gmail.com, Gary Hook <Gary.Hook@amd.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Support Opensource <support.opensource@diasemi.com>,
 Sangbeom Kim <sbkim73@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, Sebastian Reichel <sre@kernel.org>,
 linux-kernel@vger.kernel.org, Tal Gilboa <talgi@mellanox.com>,
 Changbin Du <changbin.du@intel.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, patches@opensource.cirrus.com,
 Andrew Morton <akpm@linux-foundation.org>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: multipart/mixed; boundary="===============9019065393513980571=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============9019065393513980571==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yRA+Bmk8aPhU85Qt"
Content-Disposition: inline


--yRA+Bmk8aPhU85Qt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2020 at 10:30:54AM +0200, Matti Vaittinen wrote:

> =20
> -		if (!(min_uV <=3D linear_max_uV && max_uV >=3D range->min_uV))
> +		ret =3D linear_range_get_selector_high(range, min_uV, &sel,
> +						     &found);
> +		if (ret)
>  			continue;

Why are these going for _get_selector_high()?  Usually we try to choose
the lowest voltage we can.

--yRA+Bmk8aPhU85Qt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl56GBsACgkQJNaLcl1U
h9CN2Qf/R3HW431olYvhFPNzcF/cfTxpUIKeXvCEaJZzRSz4PNUTk2n8PfjR8QJc
r1rCNq6XHT3GvoIk4XgLxgDEBz/3tT0pwRBXe8qwCYzdWLisDN1jz1cjURObeaUV
jIJMfhu2Q3BQEDdrRKnHdN7rFgzXMPW3tc4mxlitPQ2c/m2TAQKtXdx/D5ekGz2b
Gi8r8r4mtZ4vf/DinqVNAFI01WKs7PaYM8NL/+CVpYQsUy2J1LHbbk6JAO+NMnLZ
Baokwy5eIlpox1/TOqmFu1L39ZB7QgwYwEnDXlMjs30c8hGTWE5mdmjWlnQyH93M
vO5v7AOkNChmCy/jeRykVY3AifrPxA==
=FYhc
-----END PGP SIGNATURE-----

--yRA+Bmk8aPhU85Qt--


--===============9019065393513980571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============9019065393513980571==--

