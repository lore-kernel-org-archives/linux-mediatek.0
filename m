Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED2ABCCD199
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Oct 2025 15:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kY4C/mNlv0GaIKHFI5ucYN9fdxMFUFjShfB09nDueZI=; b=dHoCgcPx5ol4T6AIxgi0TH2aqM
	G5o97HRIFinOdWQaKZ5fb2aPGtiqQAumkn3i5sIT5qLxaG6CDXC+tMFxFB2Gcjw/xI2Echjk6R2NU
	MR8IrKgbPjv5/RYdpF7b3fKINfFHkB8KECflPW9/y9cjSuLMqGa4T9x08PD3owajkeXUdFRJlJQkN
	Ufdq0CZTesF5of45ER8eZXLVuqnQnDUXdwzK6cLOKfEs8YR4Btl8VsuxnIDybPXfTCiDIDXNvAHBl
	1rwpu0SjYGuEsRuymkst3xvN0LfbyVN7LkKKAsBK3Mi8Djd6V38+gfaRqSDdX74tyrhh8kNtNitEQ
	cpkIGXoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Pu4-00000005BtH-2rJJ;
	Thu, 16 Oct 2025 15:28:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Pu3-00000005Bro-0OCK;
	Thu, 16 Oct 2025 15:28:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F09C60434;
	Thu, 16 Oct 2025 15:28:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57A8CC4CEF1;
	Thu, 16 Oct 2025 15:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760628510;
	bh=vFeX8GTTbE6dDYs0n6rTwcQeVXZ0OwNNC4fiFan0Fx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MeVKqESo2MhsXZIcjMHwwMffLOQWAkNNh6YaUV/EbfrOh5M0ehVcze+4kRu4KLTS4
	 H9nGr90f5odFULfRsetgro7TrYQ2v5fi7HTaVpUCadugAQN7JetX7NAksTrBqeCxu0
	 d5yFyI/nKpmtcb44KLM/xyDhT22SRgNt1eKk5NJ3hpE52ldX9Yw2zoLVPp1xhr4s4l
	 SK9AvGtt4AI1SDE2fySpmz0Yjv4RlP+RiYv47m9H8GEnrkj9yG3TMDXTLB/coai2ZH
	 pF3xorZ5pOCVdLYmkDKCfAqdz+pFq8eAYVP71vIlGDnfB7AGUGPQ3QNIjyPtLzengl
	 jKKRYiZT676Ig==
Date: Thu, 16 Oct 2025 16:28:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Sjoerd Simons <sjoerd@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Lee Jones <lee@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	kernel@collabora.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org, netdev@vger.kernel.org,
	Daniel Golle <daniel@makrotopia.org>,
	Bryan Hinton <bryan@bryanhinton.com>
Subject: Re: [PATCH 06/15] dt-bindings: phy: mediatek,tphy: Add support for
 MT7981
Message-ID: <20251016-constant-drinking-a7847adeabac@spud>
References: <20251016-openwrt-one-network-v1-0-de259719b6f2@collabora.com>
 <20251016-openwrt-one-network-v1-6-de259719b6f2@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nXHt0JSoCeXXUnko"
Content-Disposition: inline
In-Reply-To: <20251016-openwrt-one-network-v1-6-de259719b6f2@collabora.com>
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


--nXHt0JSoCeXXUnko
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 16, 2025 at 12:08:42PM +0200, Sjoerd Simons wrote:
> Add a compatible string for Filogic 820, this chip integrates a MediaTek
> generic T-PHY version 2
>=20
> Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  Documentation/devicetree/bindings/phy/mediatek,tphy.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml b/D=
ocumentation/devicetree/bindings/phy/mediatek,tphy.yaml
> index b2218c1519391..ff5c77ef11765 100644
> --- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> @@ -80,6 +80,7 @@ properties:
>                - mediatek,mt2712-tphy
>                - mediatek,mt6893-tphy
>                - mediatek,mt7629-tphy
> +              - mediatek,mt7981-tphy
>                - mediatek,mt7986-tphy
>                - mediatek,mt8183-tphy
>                - mediatek,mt8186-tphy
>=20
> --=20
> 2.51.0
>=20

--nXHt0JSoCeXXUnko
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPEPFQAKCRB4tDGHoIJi
0jX+AP0TA17pIR1hJMPQpqSEQHh7sVBT5R0NG998cvCpK5isZQD+LG7nfGpgLlzy
T0IpdRMx9PsdaHA7MSf4y/3FKHkXvA8=
=WiNI
-----END PGP SIGNATURE-----

--nXHt0JSoCeXXUnko--

