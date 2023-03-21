Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7823BC74A5B
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Mar 2023 07:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mp/hbJa9VgnJveSKDR+g99Qs6rKAs+IbD/h6Rb4tyM8=; b=w0nut0qBKV9rxjA92VJOznhFnW
	nddTyiBPeiAihTZmZGpck4km4sbTs7zoWOXkkprRz78ETgsV3/bYxHI3J1UWEJltM2jFH2BTqKDb+
	1CPodsuxP3pq9cY9cKHVRASp6jhmum6qp6zBj4Ze9ljb8lOdrPvKIkU4iN3lY/hqwSs82ox8fJ6wf
	PQCGxV2qoAstUR6V2j4r2Uw5ZL0QE39oal30mWFcz2YS65H5E5jZAEQoJTXDhVfDfmhlEIy9VKMpF
	9FhAZcv3oJijxYTiLBhJElkOeHyyiuIHMyatRe2w/Ytjrf7ipCeGaA8+ccyWonk069t3rkkijDB8M
	z6YeI1pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peWD2-00BUtQ-2B;
	Tue, 21 Mar 2023 07:15:04 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peWCz-00BUrh-1M
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Mar 2023 07:15:03 +0000
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1peWCD-0005ev-Co; Tue, 21 Mar 2023 08:14:13 +0100
Received: from pengutronix.de (unknown [IPv6:2a01:4f8:1c1c:29e9:22:41ff:fe00:1400])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id CFC9A19831D;
	Tue, 21 Mar 2023 07:14:02 +0000 (UTC)
Date: Tue, 21 Mar 2023 08:14:01 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Yu Chen <chenyu56@huawei.com>,
	Binghui Wang <wangbinghui@hisilicon.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Robert Marko <robert.marko@sartura.hr>,
	Luka Perkov <luka.perkov@sartura.hr>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Vincent Shih <vincent.sunplus@gmail.com>,
	Wolfgang Grandegger <wg@grandegger.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-can@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: Drop unneeded quotes
Message-ID: <20230321071401.tmzxmedhjtup3gil@pengutronix.de>
References: <20230320233955.2921179-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="be3e4amne3fqyhxc"
Content-Disposition: inline
In-Reply-To: <20230320233955.2921179-1-robh@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:b01:1d::7b
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_001501_455979_F7073913 
X-CRM114-Status: GOOD (  13.00  )
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


--be3e4amne3fqyhxc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 20.03.2023 18:39:52, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml  | 4 ++--

Acked-by: Marc Kleine-Budde <mkl@pengutronix.de> # for ti,tcan104x-can.yaml

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--be3e4amne3fqyhxc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEDs2BvajyNKlf9TJQvlAcSiqKBOgFAmQZWTcACgkQvlAcSiqK
BOhnJggArFl7SeXMUoTFqF4RAxiwJqkBFw93RzRXX0UR0G4PQJiS7lLHDZ7ouvtO
rhXsWIOs5a6P/Ui5FqXcfmo19Lv0KoJY/qddMLlT/bZ5JkS5uAgrqbHe+nLos462
41OBQby+tr3pxNThQcX8/sq6Od9GHQ5ZrbtiIV3yyd7z65cmR2WgRvomHEADY6uh
m+x5woaXBVJqK5m1srOvvOs4gS+ruZdSbjMuVPNJJr4Kp7r05JRRGyaIhlAQ2zTV
RjASaGhVK8Gq5uknd2s684jKIfcCeSxmN1P8JLNA3I2rwTmn5+b7XrawnbOWrKlS
e56NNf6fuROlFhJVzNzl24yI+zqsyg==
=Khyr
-----END PGP SIGNATURE-----

--be3e4amne3fqyhxc--

