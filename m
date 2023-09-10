Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8340EE14D8
	for <linux-mediatek@archiver.kernel.org>; Sun, 10 Sep 2023 09:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WZkTqG2/ICfLnzTAeIxKnoL1nu/k4i4QorsWUgWq+lo=; b=h4/LkGzLgKemVQLBmhBIHvCKHH
	jlNIVksAFo2JZtCFLKaRKVGBZpBRb+g4ugtPhop7xck3Tdg15fx9jukatZrJfbCwzp7cumNt01jo/
	zzfz/Zy5bt+icP3hzJlXCEl3Xh0uftC6BFpXRQyfMk3ZLfzOfrLNaTnPv2jI60cfTXIKLmhIzZUOG
	Qj68/bJ2Qw8QcBoBFAv+3iSxb9tN6UJjglOUQ1EL4JLnRV/S/XJCGH9UJigNzSFw8cqLg75Jpnyy2
	q2+S84SQvn4dBr1Kb5b332vQN96wW+kcAm70XkLZreaZ9sYa4C5i4iktk2CP8OnZG9378ItS3hTOx
	cyYoPFyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfGvm-00GMOt-1e;
	Sun, 10 Sep 2023 09:40:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfGvj-00GMOG-1X;
	Sun, 10 Sep 2023 09:40:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AA2FE601FE;
	Sun, 10 Sep 2023 09:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96EF5C433C7;
	Sun, 10 Sep 2023 09:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694338834;
	bh=jLtGOqox7MJX7EormqHEUu+Ks0UsdUWX+SnzA6zN8gU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IeG9lPcJ0IYIef8emoCjw6630u4trREQM3bdU0sLMltnc74KkmXsrGS+2dntfryPG
	 8E++qMFdSaDDdLwm3Hm1RHH5pIJOXFTuzaiEB4tDuVXTmDC6ya/gsA9BLp+/ItgRYb
	 mmmOGnN2psGTw7fnf61nMaMZEu5lV2F86L7z8Ts6l20FRO360N0+1cpvV5uErYYpfr
	 42XRy2I9o6mBFN783JKzyj836uiMTFu5mAmdL1204HOc2GCsOmNQupgI5mATqO6Veo
	 zwqQu/m/QSK6ewknMvrrfz9WX/IsfT0e4pV9j2NflUo8H5YBPUCUQackgtdc5B/4WJ
	 iX3r71mUEB8Pw==
Date: Sun, 10 Sep 2023 10:40:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Shuijing Li <shuijing.li@mediatek.com>
Cc: chunfeng.yun@mediatek.com, vkoul@kernel.org, kishon@kernel.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de, linux-phy@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	jitao.shi@mediatek.com
Subject: Re: [PATCH v3] dt-bindings: phy: Add compatible for Mediatek MT8188
Message-ID: <20230910-say-kebab-b6968c44809d@spud>
References: <20230908075310.17825-1-shuijing.li@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="usyFpcbg56OVilwN"
Content-Disposition: inline
In-Reply-To: <20230908075310.17825-1-shuijing.li@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_024035_602926_970957EB 
X-CRM114-Status: GOOD (  15.38  )
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


--usyFpcbg56OVilwN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 08, 2023 at 03:53:10PM +0800, Shuijing Li wrote:
> Add dt-binding documentation of dsi-phy for MediaTek MT8188 SoC.
>=20
> Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
> Changes in v3:
> After upstreaming the basic version of mt8188.dtsi, we will add the
> following mipi node in mt8188.dtsi:
> mipi_tx_config0: mipi_dphy0@11c80000 {
> 			compatible =3D "mediatek,mt8188-mipi-tx",
> 				     "mediatek,mt8183-mipi-tx";
> 			reg =3D <0 0x11c80000 0 0x1000>;
> 			clocks =3D <&clk26m>;
> 			#clock-cells =3D <0>;
> 			#phy-cells =3D <0>;
> 			clock-output-names =3D "mipi_tx0_pll";
> 			status =3D "disabled";
> 		};
> per suggestion from the previous thread:
> https://lore.kernel.org/all/0a6d3d14-33f0-92d2-b42f-e4d336c8cd91@linaro.o=
rg/
> Changes in v2:
> Adjust mt8188 position.
> ---
>  Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml =
b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> index a63b20dfa4a5..6703689fcdbe 100644
> --- a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> @@ -30,6 +30,7 @@ properties:
>            - const: mediatek,mt8173-mipi-tx
>        - items:
>            - enum:
> +              - mediatek,mt8188-mipi-tx
>                - mediatek,mt8365-mipi-tx
>            - const: mediatek,mt8183-mipi-tx
>        - const: mediatek,mt2701-mipi-tx
> --=20
> 2.40.1
>=20

--usyFpcbg56OVilwN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZP2PDAAKCRB4tDGHoIJi
0pFIAP9jrgL8n+v3mPL3S1wh1wd48GwQVMGsnmrG6WeVsQI/5QD/ZtNCfHkVx9lM
r4VnXPQ1uUnAjilJIX5m0w9Bp6N30QM=
=d8a5
-----END PGP SIGNATURE-----

--usyFpcbg56OVilwN--

