Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B63EE57D7
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 21:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5yXk+VWPkX0pssfQ//LwNum7lUVfl4onasnP3i7/v2c=; b=sqwSGeWO/HFFfBLXzUX0Ie8HB6
	s81brkaf9uAXXmyiI6ogETDOZnAKK4hgw3giQXXNYlVueX75WmNYIh58haXaD8FUaR+Mr5SJMmezR
	dPDZXZcDDs7DHGqk62DrxgTsc7pyoe58+JTdZb2T9km5xiB2JUaYnEpHypwfGBJsHLkFBwm/wp26q
	SjPpc2SOQMilDIhlRy+5eCeiKId9pfeilTakB6WwqurpU74QHV2/dTLRsCIfrSxO00F5D3LRMcT3M
	1wEgjviiM3lX6K3XjmgTZP1xIXyc7CXMP3mlziq0/GjMzWRZHEjgkHq707MKy86io9kBPhbRAs/5o
	jzGgukcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soVBJ-0000000B6RK-06kB;
	Wed, 11 Sep 2024 21:47:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soVAE-0000000B6NM-3xpc;
	Wed, 11 Sep 2024 21:46:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8DFEB5C064C;
	Wed, 11 Sep 2024 21:46:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 538A2C4CEC0;
	Wed, 11 Sep 2024 21:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726091173;
	bh=9Lia/vj9NijN/dL8TFTCj2WGVi19Df2iJ9ZSaO7kFuo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KvRfr/8NH+Ct1+cMOOPbKuJ1Bqj8pafWXrigtRNcCMau27ZoCI8a0KI53JuhrzloG
	 mS/faG55aLBz0350Yvmevkcr4GX7jIzO+WCamjPZaIrOTj23N3WHYb1hC3AF2OB0CV
	 Jr1aM90ZLQTc0zDw4mQVuaKzoRpfblMF2Jf3T3GSg2BdxzjC1x1wJzEKNAetLN09ei
	 VgT4qJVOLmBbW87kGyhVNpr23MTvRJR8LAZOKa9hD2Osk0ej5kmtltE2DsrvQGJqhz
	 3uTMKt7cYxdzaWqT1jEV//vMtrYpkCFn5c4/si55NTr/vsRvlSMw/xTu/DO9G2XUum
	 ay49GTYif4Raw==
Date: Wed, 11 Sep 2024 23:46:11 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-gpio@vger.kernel.org, Sean Wang <sean.wang@kernel.org>,
	upstream@airoha.com, ansuelsmth@gmail.com,
	linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	benjamin.larsson@genexis.eu
Subject: Re: [PATCH v4 1/5] dt-bindings: arm: airoha: Add the chip-scu node
 for EN7581 SoC
Message-ID: <ZuIPo8BMBVGuaGMI@lore-desk>
References: <20240911-en7581-pinctrl-v4-0-60ac93d760bb@kernel.org>
 <20240911-en7581-pinctrl-v4-1-60ac93d760bb@kernel.org>
 <172608915149.1388705.7137335166206916411.robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u1VMXVgUUkR7/mdP"
Content-Disposition: inline
In-Reply-To: <172608915149.1388705.7137335166206916411.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_144615_142940_E6E853DC 
X-CRM114-Status: GOOD (  21.30  )
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


--u1VMXVgUUkR7/mdP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

>=20
> On Wed, 11 Sep 2024 21:50:01 +0200, Lorenzo Bianconi wrote:
> > This patch adds the chip-scu document bindings for EN7581 SoC.
> > The airoha chip-scu block provides a configuration interface for clock,
> > io-muxing and other functionalities used by multiple controllers (e.g.
> > clock, pinctrl, ecc.) on EN7581 SoC.
> >=20
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  .../bindings/arm/airoha,en7581-chip-scu.yaml       | 42 ++++++++++++++=
++++++++
> >  1 file changed, 42 insertions(+)
> >=20
>=20
> My bot found errors running 'make dt_binding_check' on your patch:
>=20
> yamllint warnings/errors:
>=20
> dtschema/dtc warnings/errors:
>=20
>=20
> doc reference errors (make refcheckdocs):
>=20
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/202409=
11-en7581-pinctrl-v4-1-60ac93d760bb@kernel.org
>=20
> The base for the series is generally the latest rc1. A different dependen=
cy
> should be noted in *this* patch.
>=20
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>=20
> pip3 install dtschema --upgrade
>=20
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your sch=
ema.
>=20

Hi Rob,

before posting the series I run make dt_binding_check:

$ make dt_binding_check DT_SCHEMA_FILES=3Dairoha
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
  CHKDT   Documentation/devicetree/bindings
  LINT    Documentation/devicetree/bindings
  DTC_CHK Documentation/devicetree/bindings/arm/airoha.example.dtb
  DTEX    Documentation/devicetree/bindings/arm/airoha,en7581-chip-scu.exam=
ple.dts
  DTC_CHK Documentation/devicetree/bindings/arm/airoha,en7581-chip-scu.exam=
ple.dtb
  DTC_CHK Documentation/devicetree/bindings/clock/airoha,en7523-scu.example=
=2Edtb
  DTC_CHK Documentation/devicetree/bindings/net/airoha,en7581-eth.example.d=
tb
  DTC_CHK Documentation/devicetree/bindings/net/airoha,en8811h.example.dtb
  DTC_CHK Documentation/devicetree/bindings/gpio/airoha,en7523-gpio.example=
=2Edtb
  DTC_CHK Documentation/devicetree/bindings/spi/airoha,en7581-snand.example=
=2Edtb
  DTC_CHK Documentation/devicetree/bindings/phy/airoha,en7581-pcie-phy.exam=
ple.dtb

$yamllint --version
yamllint 1.35.1

dtschema is at the latest version.
Is it a false positive or am I missing something?

Regards,
Lorenzo

--u1VMXVgUUkR7/mdP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZuIPowAKCRA6cBh0uS2t
rI3AAQDUQJG6nQXvoO+NPuUzfYYc0Nq+fBM/Tx8nTeu1S8RhDQEAvxD16DVhR8J7
Lk6V3bZBFHaqBUWfv9jl45J1LYZu7g4=
=9EXk
-----END PGP SIGNATURE-----

--u1VMXVgUUkR7/mdP--

