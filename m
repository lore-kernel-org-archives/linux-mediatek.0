Return-Path: <SRS0=ysX+=5R=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01746C43331
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Apr 2020 10:18:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5A1D2077D
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Apr 2020 10:18:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nUL1gE6k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5A1D2077D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=93qHTOpVut4Ys410GaWkwCYReLefkoAQ+7rkbwj03Gk=; b=nUL1gE6kljCwh5F03/zci9DRW
	jKp/2x/eHyRxi5GUlyj/0BByY1+ssoAmI0HDhjveaMtJmMxhNyxcJyBbGeaoMSK53Ep69nTiIuIdx
	ngEs236R2RyQ8iEOREnWlZi+FXhKW90PjWHq3+J10bLEhVIThKhUF7Sk44TwUtCvAgG9OKodLPk2N
	pbqAu7YbWiRQm+uL5e/bJOLr0zKS/HzmUa2b88N3aQJ6vp3Ev7jJoLvfxCHIyRxZc4zH0C885bTXu
	QW8gTbmBDKNc1/lkWRzWqGJ1k4v99SL4NLvtxGASIXxe/F+Fc1UBdXlyi5PCt5TXD3usYzrCWlF2U
	1Ym2JwRpQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJaRg-0005qC-DD; Wed, 01 Apr 2020 10:18:04 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJaRe-0005p4-1r; Wed, 01 Apr 2020 10:18:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 271761FB;
 Wed,  1 Apr 2020 03:17:59 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 771D03F52E;
 Wed,  1 Apr 2020 03:17:58 -0700 (PDT)
Date: Wed, 1 Apr 2020 11:17:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH v7 06/10] regulator: use linear_ranges helper
Message-ID: <20200401101757.GF4943@sirena.org.uk>
References: <cover.1585656143.git.matti.vaittinen@fi.rohmeurope.com>
 <e5d785e3b3d2a60f44713ac5720df394e312408f.1585656143.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
In-Reply-To: <e5d785e3b3d2a60f44713ac5720df394e312408f.1585656143.git.matti.vaittinen@fi.rohmeurope.com>
X-Cookie: The Ranger isn't gonna like it, Yogi.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200401_031802_180308_CBECB2D7 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============1684185162940737182=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1684185162940737182==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c3bfwLpm8qysLVxt"
Content-Disposition: inline


--c3bfwLpm8qysLVxt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 31, 2020 at 03:25:30PM +0300, Matti Vaittinen wrote:

> Change the regulator helpers to use common linear_ranges code.

Reviwed-by: Mark Brown <broonie@kernel.org>

--c3bfwLpm8qysLVxt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6EalQACgkQJNaLcl1U
h9CXQgf/bs8libOQQ/yuGReAwtyUFTOVn+sMCSimsvFb4ZR2rABibOuqznQvwU+7
viAAlBNlwvQR1uXROyHPGYBBTBDFGn6zzHtfcicj9sCbra0yDKXfUxL3ZrASm3aH
x4DpdTpv3aCIZ//spSa5RexaUHTUaCtEmW1J/Rda+eVEmlMwdBUnfPfDMJxobjhJ
BpnduTl5fuWbyigg3PzrogvDA2VNT4WNPwpfgvwVW4RsQ3xuToOvq/YaORN9TpnH
76j1ky6pPMjIQURjOxqYgClqCNhI2nA8RX006xXEIs+2RohpKu9AQs5gsqziSG37
atz/twWtwqcuXZVMSncHKoypY5ZD9w==
=mRhT
-----END PGP SIGNATURE-----

--c3bfwLpm8qysLVxt--


--===============1684185162940737182==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1684185162940737182==--

