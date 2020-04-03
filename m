Return-Path: <SRS0=YIXp=5T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2802C43331
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Apr 2020 12:01:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4D7820737
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Apr 2020 12:01:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JtxDjEaU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4D7820737
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EKLo7QB6WDFQGwL19qSipjVsD0tKIf36R22HYCqEsA8=; b=JtxDjEaUoZeO8Fs9nqMim+iF0
	0nl0VciAMWYR7otIjY3u/9FASNBfvz319jt2wrR11sK0ogOa58OPVzLG2qI1/F/w8Ny7oM/2aFJU5
	ws+BEYHsL66eEzbR8kGBPIwlS1m6rQdTf7i+g7c9jD+6GBOFsQbCSv43dRSxSXqA95s0OFaj7+nuC
	+V3LzdqasFj/KCK4iLLyd9CpSJJkLSxw9dzKom7FCPx3+BT8Av3ZJR45dT5gVHEkQyxGUM+RpBOdX
	aqmudXqnrbnl6B7q0HfN1LrkfalFZbbOf73lW9GR8wQIwD8JPt081vS5uHIZumq83cHL7fjBhYUtw
	6xt9l1GVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKL1B-0003J6-Ka; Fri, 03 Apr 2020 12:01:49 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKL14-0003BC-Hc; Fri, 03 Apr 2020 12:01:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E9B930E;
 Fri,  3 Apr 2020 05:01:37 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E9D6A3F68F;
 Fri,  3 Apr 2020 05:01:36 -0700 (PDT)
Date: Fri, 3 Apr 2020 13:01:35 +0100
From: Mark Brown <broonie@kernel.org>
To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH v8 00/10] Support ROHM BD99954 charger IC
Message-ID: <20200403120135.GE4286@sirena.org.uk>
References: <cover.1585902279.git.matti.vaittinen@fi.rohmeurope.com>
 <50797a6ac6cda4647f9a396dab0ad08017e3138b.camel@fi.rohmeurope.com>
 <20200403110210.GO1922688@smile.fi.intel.com>
 <8007dadb0b3a13934f2a950204506a156cb2e65e.camel@fi.rohmeurope.com>
MIME-Version: 1.0
In-Reply-To: <8007dadb0b3a13934f2a950204506a156cb2e65e.camel@fi.rohmeurope.com>
X-Cookie: Use other side for additional listings.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200403_050142_669060_9B067FFA 
X-CRM114-Status: GOOD (  16.39  )
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
 "andrei.stefanescu@microchip.com" <andrei.stefanescu@microchip.com>,
 "heiko@sntech.de" <heiko@sntech.de>, "rafael@kernel.org" <rafael@kernel.org>,
 "tony@atomide.com" <tony@atomide.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "brendanhiggins@google.com" <brendanhiggins@google.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "kholk11@gmail.com" <kholk11@gmail.com>,
 "hsin-hsiung.wang@mediatek.com" <hsin-hsiung.wang@mediatek.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "axel.lin@ingics.com" <axel.lin@ingics.com>,
 "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
 "b.zolnierkie@samsung.com" <b.zolnierkie@samsung.com>,
 "krzk@kernel.org" <krzk@kernel.org>,
 "m.reichl@fivetechno.de" <m.reichl@fivetechno.de>,
 "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
 "wens@csie.org" <wens@csie.org>, "andreas@kemnade.info" <andreas@kemnade.info>,
 "agross@kernel.org" <agross@kernel.org>, "Laine,
 Markus" <Markus.Laine@fi.rohmeurope.com>,
 "Adam.Thomson.Opensource@diasemi.com" <Adam.Thomson.Opensource@diasemi.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "sre@kernel.org" <sre@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "support.opensource@diasemi.com" <support.opensource@diasemi.com>,
 "baolin.wang@linaro.org" <baolin.wang@linaro.org>,
 "sbkim73@samsung.com" <sbkim73@samsung.com>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Mutanen,
 Mikko" <Mikko.Mutanen@fi.rohmeurope.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>
Content-Type: multipart/mixed; boundary="===============2415055719600439123=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============2415055719600439123==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5oH/S/bF6lOfqCQb"
Content-Disposition: inline


--5oH/S/bF6lOfqCQb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 03, 2020 at 11:13:54AM +0000, Vaittinen, Matti wrote:
> On Fri, 2020-04-03 at 14:02 +0300, andriy.shevchenko@linux.intel.com

> > From my point of view, you need to wait till rc1 is out and rebase
> > the series.
> > The cross-subsystem changes can be handled by maintainers in a form
> > of
> > immutable branches / tags. On your side you may recommend them how to
> > proceed,
> > but the final decision is by them.

> Thanks Andy. I re-read what I wrote and I see it can be interpreted as
> if I was trying to tell how things should be done. That was my
> intention. My intention was to point out that my patches will break
> regulator tree builds if new drivers are added.

> > From my point of view, you need to wait till rc1 is out and rebase
> > the series.

> Does this mean that there is no new regulator drivers expected to be
> added after rc1 is out? If this is the case, the rebasing this series
> on top of rc1 should work as then I get all new drivers (for a release)

During the merge window no new anything except bug fixes is expected to
be applied.  Like Andy says we'll share a branch for any dependencies,
nobody in particular seems to apply code for lib so I guess I'll take
that patch and the regulator one and share it but not until after the
merge window.

--5oH/S/bF6lOfqCQb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6HJZ4ACgkQJNaLcl1U
h9CXgQgAgxrovJmZiPhrTGdELR86BEph9nb5krfh6pe5Dn/d6jhLf/UMoNR3qdps
HDcyU1zU4TZF5QG/pXKPgXG20D1i8yet/5kCq9Czz9xfetTHelZPOXbHKsYyGXWf
iPkhT0Da1pEYWcb7K1iTcXRsmK7wrzEquXzBNK6pI3GbBbeYQ5Os0m6rwckhvewJ
kGUI3VcNI5YWY+VqGPut1jeuQ+KtsJtNwLeyRGRWAkwW0NF2KmH+hE3725HtP6E7
lO47x0KclhTzNeFd73YdrFPIs0G7g3ChJdykDdiIfvnG5yjTWfocKRVLI06r/fnT
Deqy7IF/qHtwDAXo0odFULF4NvQhgA==
=IFlK
-----END PGP SIGNATURE-----

--5oH/S/bF6lOfqCQb--


--===============2415055719600439123==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2415055719600439123==--

