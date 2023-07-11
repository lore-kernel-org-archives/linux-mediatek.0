Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DB1EB64DC
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jul 2023 17:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vm2Y1HOL/jkYyigM5D2Hg7szLjTFhITER1+dgUZG9o8=; b=PuWJyRX/eMldw2njPuaC2mxLme
	4pSjR6AitR6ZGiqLwtDMKMQcwJCqkXue29OwpGMJPVEaBaefdHY1X9SC7Vu0vgqoue+DpiuRE1aXe
	IkTXR6JbqAuS1YZHhRxv96gREbLQga6KwEhr6yxyRB0lKZv4s7WrcwzImeHI8T0OaOBpcfP2u0M9G
	zWvonB760XWgPvo7ga052vWa9pUKZQyuFYOlBNWH685AtxaN6ql6wQcsOK1MUm551bd5VrZqKsTnM
	xmc1hR42fNs1Opa2CDDQXSqO/vmSvRD1gfjeUBAeD0iTMzkT/LYCo8/TXip2pU8hlNNnqEwf9j84I
	2+RXjZ2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJHcS-00FbMG-1q;
	Tue, 11 Jul 2023 17:57:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJHcP-00FbKM-0d;
	Tue, 11 Jul 2023 17:57:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 674C5615A6;
	Tue, 11 Jul 2023 17:57:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4141AC433C7;
	Tue, 11 Jul 2023 17:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689098263;
	bh=4CNmYEGA43XtKrFK+7Eo5Y4X7mKHQ2MnpYq04OPO5SM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sMytPArB5NY00mdbwjfy1/5qCpE3FqfkY3gaREuegAWU1l8Y1kNAXO2F8aXWwRP1J
	 YN6+whP6BIJ7G2WY95bLGkFLxGevZOS/+yXLKFCEUY/IEIV2bnsIiq2JKeo8Q3uRKR
	 sFDxp58nVaFDgE24aaS+pShU0tfL5pfCdjBYC2lqHAmAJl/+f0qEuu3tt0SsJvHJcP
	 jgvCN/B6iLR3wZ/oQ5q8/2Ly8+9621wxxW4pmk9wUMJnKI6f0/QFaxFctnlgAI9hBF
	 Hp3QbeZ8tVUBMw7AV/sDFbyacgVhICyyDW9Hsunp90i8J5jID/2A4rP/NjAn7Zb7yQ
	 UhmdnrWp9raMg==
Date: Tue, 11 Jul 2023 18:57:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Jason-ch Chen <jason-ch.chen@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 3/4] dt-bindings: soc: mediatek: pwrap: Add compatible
 for MT8188
Message-ID: <20230711-vocation-depose-2ddb4e50fcb5@spud>
References: <20230711023929.14381-1-jason-ch.chen@mediatek.com>
 <20230711023929.14381-4-jason-ch.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="g3AiUpry6RJXOl/J"
Content-Disposition: inline
In-Reply-To: <20230711023929.14381-4-jason-ch.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_105745_277608_8BACD16D 
X-CRM114-Status: GOOD (  15.16  )
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


--g3AiUpry6RJXOl/J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 11, 2023 at 10:39:28AM +0800, Jason-ch Chen wrote:
> From: jason-ch chen <Jason-ch.Chen@mediatek.com>
>=20
> Add MT8188 PMIC Wrapper compatible to binding document.
>=20
> Signed-off-by: jason-ch chen <Jason-ch.Chen@mediatek.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  .../devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml     | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwra=
p.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
> index a06ac2177444..c2f22e7dbcfb 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
> @@ -50,6 +50,11 @@ properties:
>                - mediatek,mt8186-pwrap
>                - mediatek,mt8195-pwrap
>            - const: syscon
> +      - items:
> +          - enum:
> +              - mediatek,mt8188-pwrap
> +          - const: mediatek,mt8195-pwrap
> +          - const: syscon
> =20
>    reg:
>      minItems: 1
> --=20
> 2.18.0
>=20

--g3AiUpry6RJXOl/J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZK2YEgAKCRB4tDGHoIJi
0t1hAP9eSqaeC3ZF7GneITp7UlKNoreLO4o0e9ORmt2jSCxjggEA8Tya2z9lNq4U
zrAM9szugkd3H38cNAOKCKaSpyrWCgo=
=txTc
-----END PGP SIGNATURE-----

--g3AiUpry6RJXOl/J--

