Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB2AC2BBCA
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jun 2024 10:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BtjWR+gEmc49VtSTIaCGRyr5H0C8Qccd3WQsIc/9xUo=; b=KPykRQPEIVS3SPSmiH3qWe/tuM
	EiSztHSSccTANmlgTOhknQ160HVzbDEbzRzi6kXD8gzt6jwY49GFHoo6MQ11MlRDPC1GwGMFZgbKO
	eBJfiqbPIVSiJocICeSM+YaLUkmJqFCy6P8H2a5Rg3owVpdCMenZ4IvH2Qwo/CUQlHPp2T0PeGGcH
	5y96Q46MYGZOYnCHeEWq4PySSjZuVlhtwyvePZzgf62hHtfANAjF2HEdbLt4J5ONnR3CeKpeSwBuH
	QBP7WdN0a3B7rZj0JZPz2GousQ+7dq5aqjd2p2ph8yPkf5J4HcUsifBhlT35+XsJjXKxn8+5KWuvd
	3e1pDmhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM3Ms-00000002Ot8-3LBG;
	Tue, 25 Jun 2024 10:25:42 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM3Mj-00000002OqS-3Ofk;
	Tue, 25 Jun 2024 10:25:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0284CCE17D2;
	Tue, 25 Jun 2024 10:25:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57878C32781;
	Tue, 25 Jun 2024 10:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719311131;
	bh=BtjWR+gEmc49VtSTIaCGRyr5H0C8Qccd3WQsIc/9xUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sV06yI4F3RaAzDzqwrxh6gxUv8cK+xRlvTpZIbM/sOGaVNSuodtK/oe5ge9iVOteP
	 GTxxIAgW8EbUGv0gXDsw/J+Jonpt/WC2Gy+OqWpIoKUl6Ua8WKkhdiXz9hPLxVMu+o
	 cct/GUbgBihxs16kVJjebCJDMBRA8dUX2OAmhAgXmcNlhnvNci8GUmXJYcv0GDRPtg
	 IxmQy1ZTFXDXXrFkj6sX1D0/TDABypZQx3CEY2aswzvo7d4y3BA/TsNKNv+/z4hFcs
	 ILMG4ciMdK16vZWcBKjhQ/i865dSTNzInqL8/nap4BKNGfYmqhe3BqgQlozm5CZMLo
	 ACJKjip0Nr1BQ==
Date: Tue, 25 Jun 2024 11:25:24 +0100
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, lgirdwood@gmail.com, keescook@chromium.org,
	gustavoars@kernel.org, henryc.chen@mediatek.com,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com,
	wenst@chromium.org, amergnat@baylibre.com, djakov@kernel.org
Subject: Re: [PATCH v6 0/7] MediaTek DVFSRC Bus Bandwidth and Regulator knobs
Message-ID: <57cf8f9f-4320-4c55-a9f8-a4c1facabfe8@sirena.org.uk>
References: <20240610085735.147134-1-angelogioacchino.delregno@collabora.com>
 <f7b4cd98-1acf-4f6b-a7e0-57419abadba1@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HtLS8F6gqzyPaPXW"
Content-Disposition: inline
In-Reply-To: <f7b4cd98-1acf-4f6b-a7e0-57419abadba1@collabora.com>
X-Cookie: Results vary by individual.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_032534_049979_67C58362 
X-CRM114-Status: GOOD (  12.53  )
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


--HtLS8F6gqzyPaPXW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 10:32:30AM +0200, AngeloGioacchino Del Regno wrote:

> Mark, I assume that this series is ok from your perspective, since this h=
as got
> your acks and r-b -- but in order to pick the soc/mediatek stuff I need a=
ll of
> the dependent bindings to be in as well .. and this includes the regulato=
r one!
>=20
> The main issue here is that the main soc/mediatek dvfsrc binding
> dt-bindings: soc: mediatek: Add DVFSRC bindings for MT8183 and MT8195
> does use the others, so I can't pick this one without the others being pr=
esent
> or the validation obviously fails.
>=20
> So... gentle ping :-)

I can't tell what you want from me here.

--HtLS8F6gqzyPaPXW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ6mxMACgkQJNaLcl1U
h9BI1Af7BjpHZjz2dcjVv0813GPAdnKjHAGhVhRvlIhqpTpKTUhV9kb4NaCW3WA8
WcTOuGzqXUetqxmyeIWpMFtNVeqdieIIuUfdUlMGWpTFKs+B+TEDi62ErAUlWCNd
3xQZMy9y9glGhigclS7EAFIcMF8eRSp/rNX0B9UD8fi9IAJMMeqBqojRam0XfAII
UT4XL/p1HG9l16q8Oo3VMAaTCh3kkgVNp/uTWMkZzeccIGDAUS0paMDbGCWnCjiH
A5hI1uZsXMJx6TtJf2Fkoxry7a4PleBULaXS0HM92gWwpYdqINQsFr0bn9/Lw1oc
gPxF2FlxpRXTYEQn++SXScXX8tJVAw==
=emPb
-----END PGP SIGNATURE-----

--HtLS8F6gqzyPaPXW--

