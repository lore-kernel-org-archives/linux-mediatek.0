Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 194EAC25B46
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 17:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jFfyUMrVccADcNzQgf31tm+tdMIlkypXSIHYrYLeAFs=; b=hg9C6w1RId8UzNa4ggVNNMcokf
	6qbPCz3eLEVeHNu6angZnMBbF79GCxduz8LEQnf0ulUQMh35PBtKAFw0G2oJNaFYAMKQaVEnZmsTc
	IESQMBL7MtRG8AX6NpP44m9UwZJbBgYGc9U4uvFdDMU9dKKq4eIYq75cDPWQaK9MIJ+ykrC31YOs8
	EbxajsRyKGUkAM7bQDDQNWogcMXfomv2AZ1ZneI4WnbGJvNJ/uFlfKoSWTGV2q5a8DpvCJTRIA0g8
	sQ9jawaOLCDkNGnMqFhNjbY44/IHXcFLMGk61PN4JEta78NGxRNwoR3q12k5828KQOrAMACBFGnag
	56mwlvyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quymU-007xbq-0D;
	Mon, 23 Oct 2023 17:31:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quymP-007xaD-36;
	Mon, 23 Oct 2023 17:31:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BCC7E62654;
	Mon, 23 Oct 2023 17:31:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AAE8C433C9;
	Mon, 23 Oct 2023 17:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698082312;
	bh=RoIE1xXK4oaL8rcaDxktETkJEouLHhkNssWXuP5Epe0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qqlLv54Os7Roj262+yZrxTxWxk6jTaW36NOHexBdLV1QrnXB3c7ChlTjcUyjiEM4T
	 UhJxniIAuRLa6zq8WeZEzE/EPPvALijyHrcJ0fxP9UKlcFAz8SZhkugcYe4uzDniEc
	 q5oeD+2GNT1qf8TxI7nm5Qho98DiuSuUX/g0YUFjmiGqFpOMis7QWLeURZLUutX/Z5
	 +BgQxoD9TM8KvjdN/Qn8+evhg6A+xFMCrShDuqJT8UNIIus5cxc1PARM0W7kAH8LFf
	 WY70VXysTuqxjD2S4sEEAFJ9Nx54Sv3kfej8hH868br2TwO6daWLNczPwP2qbjYoad
	 PsVgcZ6Yn1Vsg==
Date: Mon, 23 Oct 2023 18:31:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jitao Shi <jitao.shi@mediatek.com>,
	Xinlei Lee <xinlei.lee@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH 02/18] dt-bindings: display: mediatek: ccorr: add binding
 for MT8365 SoC
Message-ID: <20231023-reshoot-liquefy-429aacb68694@spud>
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
 <20231023-display-support-v1-2-5c860ed5c33b@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ARUire+fEKHR8b9F"
Content-Disposition: inline
In-Reply-To: <20231023-display-support-v1-2-5c860ed5c33b@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_103154_215527_3734127E 
X-CRM114-Status: GOOD (  15.57  )
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


--ARUire+fEKHR8b9F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2023 at 04:40:02PM +0200, Alexandre Mergnat wrote:
> Display Color Correction for MT8365 is compatible with another SoC.
> Then, add MT8365 binding along with MT8183 SoC.

This commit message's first line is too vague & the second doesn't make
sense. I suspect something as succinct as "Document the display colour
correction on mt<foo>, which is compatible with that of the mt<bar>"
does what you are looking for.

I suspect this is going to apply to the rest of the series...

Cheers,
Conor.


>=20
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml |=
 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,cc=
orr.yaml
> index 8c2a737237f2..9f8366763831 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y=
aml
> @@ -24,6 +24,9 @@ properties:
>        - enum:
>            - mediatek,mt8183-disp-ccorr
>            - mediatek,mt8192-disp-ccorr
> +      - items:
> +          - const: mediatek,mt8365-disp-ccorr
> +          - const: mediatek,mt8183-disp-ccorr
>        - items:
>            - enum:
>                - mediatek,mt8186-disp-ccorr
>=20
> --=20
> 2.25.1
>=20

--ARUire+fEKHR8b9F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTauAQAKCRB4tDGHoIJi
0rG1AQDVNLCTauTO68aeJeXwZERo8tQp+TLgjwiLq+AqZulyQwEA9uXOZb3JrBGq
ZdzQoSqOFaugEQ+Xa3te/HhYaNLcNwM=
=fTxV
-----END PGP SIGNATURE-----

--ARUire+fEKHR8b9F--

