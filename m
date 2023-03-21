Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886D3C74A5B
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Mar 2023 13:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jRstWHrJY5Wdhhw75cFpAjwRgyvJoZeOUa5/fUotJ9s=; b=VItII8eXnmMCrh8DoNeR6UY4kI
	gH6D4YwxdaeJ9LQ1W4j278HaEHsvsUdIin/gUcxMQoKbyUbAOh5XmDDFBUOdpfspxPtRzMf08GSGI
	J4aopQ6NCPPJdFFKbUqJ7Qrt7ByYS/qGVcljUczG7rsrKDncmLJN9vIc1xFA9hXxqyBukTnFlBGe8
	FwgeAt9IjDEoQkG/8eL5abCRHl6o5BABP8RDriZyQXd02mLJmbWaE1AxO8bAL9/DxVcjY1nvUPt5K
	m+SalSwoV4n70iF8s6s4rcz2HtMinaWpI/LJZ5aPBASIuvXQt3V+CdHzGLHHx6bNbLBjCmhvRAZpt
	N0Xwegcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pecRa-00CcRo-36;
	Tue, 21 Mar 2023 13:54:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pecRX-00CcPg-15
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Mar 2023 13:54:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7FFA761BBA;
	Tue, 21 Mar 2023 13:54:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F7E9C433EF;
	Tue, 21 Mar 2023 13:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679406865;
	bh=sLwXEUpXzwGTKCNG2RTmaVz2tpCNp4oAQ+9c+0qNAPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P6ZTvsXN6sEGNLHViZE8UiBJlkzlMu0GZOFo5s/ofNtlJk884f+PBy8qJDh2Y+i9O
	 VmNOVST7oeHB4NtEfkW8wTFGEMwkVo5aK5h06kUp941HHO1kJwUlqiqw73S+HcsYOG
	 ssdW7aqVKaPU6HpUEUqiarl/dxbhAK64Yr4M3au8+C0bfu19pPc2xLACyPE2SQ1rxO
	 8tOdQKSnxMtoHklZAWgac87QQSVlCvWvLRGFteXYVW1qRNwWIbhpEuMNBWNpjSb7o7
	 yQNU6+2sDgio/0K9BQByDIH7TdQuTuS+uMXFFpeBjq+D/hiXfy6YZ53rPnjxrYfXaT
	 lttv7P+xrcH3Q==
Date: Tue, 21 Mar 2023 14:54:22 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: daniel@makrotopia.org, netdev@vger.kernel.org, matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org, sean.wang@mediatek.com,
	devicetree@vger.kernel.org, edumazet@google.com,
	davem@davemloft.net, krzysztof.kozlowski+dt@linaro.org,
	lorenzo.bianconi@redhat.com, Mark-MC.Lee@mediatek.com,
	john@phrozen.org, nbd@nbd.name, kuba@kernel.org, pabeni@redhat.com,
	robh+dt@kernel.org
Subject: Re: [PATCH net-next 06/10] dt-bindings: soc: mediatek: move ilm in a
 dedicated dts node
Message-ID: <ZBm3DvjvvHC+3EAH@lore-desk>
References: <cover.1679330630.git.lorenzo@kernel.org>
 <c9b65ef3aeb28a50cec45d1f98aec72d8016c828.1679330630.git.lorenzo@kernel.org>
 <167940235606.530981.2024563505368619498.robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JpkRWRtszDHfbi1x"
Content-Disposition: inline
In-Reply-To: <167940235606.530981.2024563505368619498.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_065427_627439_6A6D5322 
X-CRM114-Status: GOOD (  24.06  )
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


--JpkRWRtszDHfbi1x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

>=20
> On Mon, 20 Mar 2023 17:58:00 +0100, Lorenzo Bianconi wrote:
> > Since the cpuboot memory region is not part of the RAM SoC, move ilm in
> > a deidicated syscon node.
> > This patch helps to keep backward-compatibility with older version of
> > uboot codebase where we have a limit of 8 reserved-memory dts child
> > nodes.
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  .../arm/mediatek/mediatek,mt7622-wed.yaml     | 14 +++---
> >  .../soc/mediatek/mediatek,mt7986-wo-ilm.yaml  | 45 +++++++++++++++++++
> >  2 files changed, 53 insertions(+), 6 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/medi=
atek,mt7986-wo-ilm.yaml
> >=20
>=20
> My bot found errors running 'make DT_CHECKER_FLAGS=3D-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>=20
> yamllint warnings/errors:
>=20
> dtschema/dtc warnings/errors:
> Error: Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed=
=2Eexample.dts:63.59-60 syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings=
/arm/mediatek/mediatek,mt7622-wed.example.dtb] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1512: dt_binding_check] Error 2

Hi Rob,

I think it is just a typo in a patch in the middle of the series that I fix=
ed
in the latest one (before posting I compiled the dts schema with the full s=
eries
applied and not incrementally). I will fix it in v2. Thanks.

Regards,
Lorenzo

>=20
> doc reference errors (make refcheckdocs):
>=20
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/c9b65e=
f3aeb28a50cec45d1f98aec72d8016c828.1679330630.git.lorenzo@kernel.org
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

--JpkRWRtszDHfbi1x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZBm3DgAKCRA6cBh0uS2t
rIT4AQDJ0/RUcQ7x5fJKWJaVZ1iajTTGklMAnLOvSiTd8H9wdwD/YtZTqKWECe5o
5y6JQDle8/SY+VNgY1swVG/Mppt+Jwc=
=kpaY
-----END PGP SIGNATURE-----

--JpkRWRtszDHfbi1x--

