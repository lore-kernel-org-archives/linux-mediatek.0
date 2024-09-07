Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51793EB64CA
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Sep 2024 16:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HHvesUp7I8h9dKLlXZOIZSXZgiKXJCbSqYnBNuMGYvw=; b=rkLOJ2G2wLkuWhZxLd3+0Ij9Nj
	AgY3r+EqVPmBIk8MwUv08kEcHtXOmZzFWVDhsFnLI0+ho3S3OXNQRTJP2r6IKVbjeezX1btiwELmm
	Pmw2CzwQkf29enX37wQUlmZk44VmvBcUoxlK1lFU4Ij1zC0W/3HSAjebE/3AUyAzVownT0c1P4zsr
	DCRF0sJSnjge8vnT/peXS8b2u2Rj9L/8hdiBzq6aYSKrW7i5olpWi9Y2ksDipZGAxFTDNQnxhMQfw
	PpvRibtJK/HAlyuWL3R+hvcKbN8snMhGdxMDCOu/XT/OU4VzP/WGjJ0ga7HDS0Vzun5d7uyRZJF/8
	+AR0UDVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smylV-0000000FL5M-1DcY;
	Sat, 07 Sep 2024 16:58:25 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smylR-0000000FL48-1aHx
	for linux-mediatek@lists.infradead.org;
	Sat, 07 Sep 2024 16:58:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=HHve
	sUp7I8h9dKLlXZOIZSXZgiKXJCbSqYnBNuMGYvw=; b=cm7gNj8Z9XxUitNfvIZy
	ri2HP2iF6A/uQRQTNoYWrMuSEu8BbFvacyitQuMJMPkvr7TV1YWJ7NQqO+IUwe1i
	13PDyrbpopP+IRqbC8uUqpByKXs0fa0DZrO5jP2u40/UQQO+J11j0LYupWLT1A/l
	Kbim+oKA1wCRym1VrkPdgzON1+r/403OBWO3S9yrggmzc3uUg1xWkchoU3zrgeSu
	aSlp95CsfbxAC96M58+X/l/4xcQisS2DIzqXaN3Bo/SVLfM2sfI61nRQtqk7FMTM
	3a6yEnLuNJNBArwsDd6XPcl+RpML6jKBC6UYFQrUhH6ghG/9Xhs/FmlovyZupsFe
	Uw==
Received: (qmail 1571321 invoked from network); 7 Sep 2024 18:58:15 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Sep 2024 18:58:15 +0200
X-UD-Smtp-Session: l3s3148p1@6m3+bYohJtoujnvu
Date: Sat, 7 Sep 2024 18:58:14 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v6 00/12] platform/chrome: Introduce DT hardware prober
Message-ID: <ZtyGJhm-0GEEFfYf@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
References: <20240904090016.2841572-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ytjyaEn513BUTabA"
Content-Disposition: inline
In-Reply-To: <20240904090016.2841572-1-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240907_095822_322195_AEFE203E 
X-CRM114-Status: GOOD (  15.69  )
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


--ytjyaEn513BUTabA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

this series gets quite some review from people I trust. This is awesome.
So, I will keep to some high level questions:

> undiscoverable devices" [2] series, but follows the scheme suggested by
> Rob, marking all second source component device nodes as "fail-needs-probe",
> and having a hardware prober driver enable the one of them.

Where is this "fail-needs-probe" documented? I neither see it here nor
in the dt-schema repo.

> The other case, selecting a display panel to use based on the SKU ID
> from the firmware, hit a bit of an issue with fixing the OF graph.
> It has been left out since v3.

Does it make sense then to add touchscreens only? Will the panels be
worked on once this is upstream? Or what is the way forward?

> Wolfram, would you be able to handle the late PR? Assuming you get a
> chance to look at the patches that is.

Yes, I can do this, but...

>  drivers/i2c/Makefile                          |   7 +-
>  drivers/i2c/i2c-core-of-prober.c              | 437 ++++++++++++++++++

... this is quite some code. Would you be willing to maintain it (i.e.
please add a MAINTAINERS entry then). Kudos for not touching other parts
of the I2C core!

All the best,

   Wolfram


--ytjyaEn513BUTabA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmbchiYACgkQFA3kzBSg
KbZ3bg//ag3oKXvBj1cYBQuG/BsTqEZ+kivhmPcabfoL4S2E30DicIxES4SOZjRP
HO6WDpilY/a3dnTbBnl293WZZFFpq4zrvycJmBaN14cUBtevuDunF0LwPnNfOdc6
WmX23w4zrt4q2rfS4Nv3X3DCU+fFtUF0kb6vmPs1eCAEAoYnpOFR1d/6nCT6mcvV
jPpyov9kg2P+XHmQkGSn+Rh5yyvvUUnCdK9ZCHIY0kMkYGyZ1x9jbSqWeNgqv7Ro
Zo4o3NjCV+PyjRB0+C9OpM+efioytSJEdeJeOn5vwPbGuXLGfBd3KRxCPa0CpAII
7YvUJQwWhsgcp5y3fADIiYJyqPDH3MMwNbet1rJFZsY2wu651QsfEoqtOqjpWZWh
EUzqZr+BhAAOCZFl9TyTnBcd6lW4oKscerYELF1Gs2Hn+Kp4jWNK77gncj1dwb3y
SU+hihFExiPWyWGQVqYufDGTfIIYBNI0D73zBv8xPaUzbEjMArHONAwaX52SyJ9W
O8lK9EnjPy9Du15OOHbnuNfv0cXpSnrig9R/CGdZAE3eOrwvIb3L+TopGYsHt6Qs
6dHq9diNp7IvYUK1I/VIm4FKqCoE0To6TwRaUfiTa/1H+hwVtdmq0EsyZciqPFCE
IfS82fC3QxAhq1EQV3/D2is4luXlbwW2OqQvbJcVAOleQFHPI8s=
=Amek
-----END PGP SIGNATURE-----

--ytjyaEn513BUTabA--

