Return-Path: <SRS0=43xy=5K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2A4EC43331
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Mar 2020 11:34:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7115C20722
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Mar 2020 11:34:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mLqj5ysr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7115C20722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+YDqmgYbyYuuNvpXghShcM6/HNUMZVOVq7nxAQGgrrE=; b=mLqj5ysra38yfB513ZQtX7zEW
	tHtMbwKH3F9FRRKDumRmtxtrMriB2DmO4gptPJ//tVV6IETNP4M/7LDNOMGOlbJrTUqBAK5aJcmS4
	Cq6q7/VQj129UF/nhhUfM43JsTwYyjTf8wRvnUldB5NTTxCOrorNWErPnRIJyC/BwgyS/JP33BPRA
	SqJqaTfKcSnMEcsO+Kbk6tRQQcNd/9bfGGFCH1d6G17KoN7oo+l44d1HNrj1TEIXQKDGSePGlSHr3
	3GKb7Afs01RtWmdNAukPp0P5LyqnmCj729DUYw3X40nRe4MugYzfrCadotUxhGH4Y/8orr8v6YL3B
	hMshqpfEg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jH4Ip-0005u9-D6; Wed, 25 Mar 2020 11:34:31 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jH4Im-0005t4-9y; Wed, 25 Mar 2020 11:34:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B9AA31B;
 Wed, 25 Mar 2020 04:34:27 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9C2C3F71F;
 Wed, 25 Mar 2020 04:34:26 -0700 (PDT)
Date: Wed, 25 Mar 2020 11:34:25 +0000
From: Mark Brown <broonie@kernel.org>
To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH v6 06/10] regulator: use linear_ranges helper
Message-ID: <20200325113425.GC4346@sirena.org.uk>
References: <cover.1584977512.git.matti.vaittinen@fi.rohmeurope.com>
 <5522b2e03f77e1b7c93adf07b85747ea9ddfbf9b.1584977512.git.matti.vaittinen@fi.rohmeurope.com>
 <20200324142427.GF7039@sirena.org.uk>
 <739a01454410a5d7acf231c92e5b3ffcae49d84c.camel@fi.rohmeurope.com>
MIME-Version: 1.0
In-Reply-To: <739a01454410a5d7acf231c92e5b3ffcae49d84c.camel@fi.rohmeurope.com>
X-Cookie: Many are called, few volunteer.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200325_043428_433803_669C8E41 
X-CRM114-Status: GOOD (  15.60  )
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "milo.kim@ti.com" <milo.kim@ti.com>,
 "andrei.stefanescu@microchip.com" <andrei.stefanescu@microchip.com>,
 "rafael@kernel.org" <rafael@kernel.org>, "tony@atomide.com" <tony@atomide.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "Gary.Hook@amd.com" <Gary.Hook@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "uwe@kleine-koenig.org" <uwe@kleine-koenig.org>, "Mutanen,
 Mikko" <Mikko.Mutanen@fi.rohmeurope.com>,
 "vincenzo.frascino@arm.com" <vincenzo.frascino@arm.com>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
 "b.zolnierkie@samsung.com" <b.zolnierkie@samsung.com>,
 "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
 "krzk@kernel.org" <krzk@kernel.org>, "ardb@kernel.org" <ardb@kernel.org>,
 "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
 "wens@csie.org" <wens@csie.org>, "agross@kernel.org" <agross@kernel.org>,
 "Laine, Markus" <Markus.Laine@fi.rohmeurope.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "bp@suse.de" <bp@suse.de>, "pmladek@suse.com" <pmladek@suse.com>,
 "zaslonko@linux.ibm.com" <zaslonko@linux.ibm.com>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "brendanhiggins@google.com" <brendanhiggins@google.com>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "sre@kernel.org" <sre@kernel.org>, "davidgow@google.com" <davidgow@google.com>,
 "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "support.opensource@diasemi.com" <support.opensource@diasemi.com>,
 "sbkim73@samsung.com" <sbkim73@samsung.com>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "talgi@mellanox.com" <talgi@mellanox.com>,
 "changbin.du@intel.com" <changbin.du@intel.com>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "mhiramat@kernel.org" <mhiramat@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "olteanv@gmail.com" <olteanv@gmail.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>
Content-Type: multipart/mixed; boundary="===============9194176484139961118=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============9194176484139961118==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="raC6veAxrt5nqIoY"
Content-Disposition: inline


--raC6veAxrt5nqIoY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2020 at 06:58:56AM +0000, Vaittinen, Matti wrote:
> On Tue, 2020-03-24 at 14:24 +0000, Mark Brown wrote:
> > On Tue, Mar 24, 2020 at 10:30:54AM +0200, Matti Vaittinen wrote:

> > > =20
> > > -		if (!(min_uV <=3D linear_max_uV && max_uV >=3D range-
> > > >min_uV))
> > > +		ret =3D linear_range_get_selector_high(range, min_uV,
> > > &sel,
> > > +						     &found);
> > > +		if (ret)
> > >  			continue;

> > Why are these going for _get_selector_high()?  Usually we try to
> > choose
> > the lowest voltage we can.

> I tried to maintain the existing logic - which is (if I am not
> mistaken) to search for first value which is equal or higher than the
> minimum. Hence we use the linear_range_get_selector_high() - which does
> not return selector for voltage smaller than given value (minimum).

OK, that's a bit confusingly named then - I'd read that as finding the
highest value within the range without registering that the function
only takes a single value so can't verify if the selector is in range or
not.  I'll also need to check that the modified code verifies that the
selector returned is within range.

--raC6veAxrt5nqIoY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl57QcAACgkQJNaLcl1U
h9B48wf/Yup52f4+vxj8p+8zsXI4DPYkIPQzNblGBvLw4ceQNvfqEjwSyMhOeK7g
fnAQL9cXDPe9ekx4pXc9ubBqiC+sXKPgV8UkMO0yA6U+roJPMSomksFUSkHLfPa5
63RdnPSLU0Vs3HD/rM8iPFhJhzEgwyt/apEpsOGw5VzoOoeW67ityiQ+yolSWnuX
EC+COV4xSIr4rwEzbWam6AaJoLAPxwGxIXeqKZftAjah+xFDQS6QaKZaBuG/soCA
8bh2bAFCT7SFZK2LD0RyAutVWG0cqmozkm0Uv51FPBRQPVUS3ch9epB7zH9jKkMh
UevqEA8oENc+9nRFnm5NSHF1E/jE+w==
=+FUO
-----END PGP SIGNATURE-----

--raC6veAxrt5nqIoY--


--===============9194176484139961118==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============9194176484139961118==--

