Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 215A3E82CA1
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Sep 2023 15:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l+r3W4wemwNksGIFZjQFS0oJqccM2/dnH2ibrqBSnbU=; b=Rs0sOH+gEIHOQ4Ua/p8SAXhBji
	ZvSaGC16etHfZyI6anpRGzhE5tcXIie3mcNDUOwxec1BHHJ6Cxx+hP+gds6HWZP//hHelHRB/iePK
	ImGQCD/7S+fXKT5sNI0YXk1kKHwRkiqrX5cgcD1hl/aiMjVwqJBsNmASGz85A9SBY+CDDboSzVoAl
	Yo/GWn9NE/CoKZFO6KCenEUX2OhOzEBQ890KlHH1Ddn4sZlazpIEeMMegSH5eLss1N4eM7Uop16Ym
	JD2edcj8bYCMhyyvUnla3kGCutmTTinx20nS7ZCcX4pMda2tuy0qtw+tKOKNnRL/NKYSYy+e8RNOB
	dTjslV4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWD8-001DAz-1U;
	Wed, 27 Sep 2023 15:12:22 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWD4-001D9d-2Z;
	Wed, 27 Sep 2023 15:12:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 5DCEAB8181E;
	Wed, 27 Sep 2023 15:12:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FE04C433C8;
	Wed, 27 Sep 2023 15:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695827536;
	bh=DcRNA9OfKi/fCALpJwPBIv4plNYmp5Y1i6dc+yueQDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B9ipkHGSg12B+M1Pu1tL0DxKXFdj/hS163OLvYF0TeHA+hrfV5aNzMgf1ramAj1Gm
	 QkLWJbUW8Koyn8+e2ao0Ud81PEHCEDqn8MNMGN9RHkkPTAKB98PhnRPyYdArrCfmUG
	 OAT6MTt9lwkYKklqvUgS0yigwmDFpn1/64s3t/U1sQBFfyG8PUFCvASDxAPhYwsWK7
	 v1RjL+hylXrz819UJdxgrQfGNHM7elgxyJiyn3T8P3Dl8LuCIzh4QyA9+dq7DqQqyt
	 sA0CcSNGeq0M0tu9MMCSzGcr8jZ8UBX1R530aqhDv5Ahou9fHJ6CpYQK9OsYyTTBPG
	 vJSibG6FsKFqQ==
Date: Wed, 27 Sep 2023 16:12:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: remoteproc: mtk,scp: Add missing
 additionalProperties on child node schemas
Message-ID: <20230927-unmovable-spender-63bbbceae9ae@spud>
References: <20230926164513.101958-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k5h0Si8SbS8mkeKk"
Content-Disposition: inline
In-Reply-To: <20230926164513.101958-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_081219_001291_8A82C9A3 
X-CRM114-Status: GOOD (  16.75  )
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


--k5h0Si8SbS8mkeKk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 26, 2023 at 11:45:08AM -0500, Rob Herring wrote:
> Just as unevaluatedProperties or additionalProperties are required at
> the top level of schemas, they should (and will) also be required for
> child node schemas. That ensures only documented properties are
> present for any node.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Acked-by: Conor Dooley <conor.dooley@microchip.com>


>  Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/=
Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> index 895415772d1d..24422fd56e83 100644
> --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> @@ -91,6 +91,7 @@ allOf:
> =20
>  additionalProperties:
>    type: object
> +  additionalProperties: false
>    description:
>      Subnodes of the SCP represent rpmsg devices. The names of the devices
>      are not important. The properties of these nodes are defined by the
> --=20
> 2.40.1
>=20

--k5h0Si8SbS8mkeKk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRRGSwAKCRB4tDGHoIJi
0vdoAPwITfmBTlb9ktA+ucCanQ8H71ISLdcJKhmBNc6dLvKgMgD+LdOpppLFXS08
K2Gh6f8c9V/4BAnDSlZYhZCbo3rNQQA=
=x2FK
-----END PGP SIGNATURE-----

--k5h0Si8SbS8mkeKk--

