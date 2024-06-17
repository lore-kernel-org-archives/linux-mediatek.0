Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A142BC27C79
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jun 2024 16:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K5FWBdvnSUfYnDP+coFxckt2tHynBYN6sYV/NmQ+ra0=; b=N6pgUdsXFDqfzkt1BW0COnRsXZ
	o7OYjJi4xjjRkPX9J4y3ABUBt3Z9aI+j6nDhHl+iJVKFMgM0zSTu1zdwEW1JwdnnZeWsMZGFv6gto
	yeoDNfJhSeRnsP01HkDqSv0BpbL1UNHFCbnex9VqTLo/Ckw9Di18qBBgjmtKmdipCFEEIiyqjg5SU
	ZYHW/BySjtSrOnyOxCpPdDE9rsNeRT/kAm8oDFMrwn24EzTU7xGbqEo7DJV2e6cag6K4gB7CoeRsQ
	b+D51iEZoCuploG0o/fKa89kVn0Lj7/0kp6aiEKYBK8BOAuQS6ZbAM+yMVmTyqgRX6CWpZApUIvfo
	TMQHxHHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJFWG-0000000BoTn-0XEz;
	Mon, 17 Jun 2024 16:47:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJFW8-0000000BoOr-2QRh;
	Mon, 17 Jun 2024 16:47:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AF74F61306;
	Mon, 17 Jun 2024 16:47:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E0CCC3277B;
	Mon, 17 Jun 2024 16:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718642859;
	bh=ExhDcZ4//zTNSSYj74RmnlQmZzjz1qUm2+2ZmpYR86Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R194lI59CkumFpQX1GcvmvdU4pUe9jICkjfIBKTOFJzSsR8bfBU2zgrqwc8vHwstG
	 nNBLREq+rOsEToxk8ocZa4rjMzl497x11FZFfvdNnnQNLSCy2VuHh8j+vPsazeQ7np
	 jS/YXVIPyfurmqwDaf14Moc6j8PN90pPyLul6FBnC9DBTTyiSeyhFOAlqA2xoYhyTV
	 g5HPZh7GPGso7hCR86KaRz3SwvFwhaZn7kdQ+qR+lwCO0UFGRsE+LCODu0LA9hs0wI
	 2riu/8B1FuWuK3t3T4D0J6z5wLg9OSQmPjudurW/qiePm/uzWtII0wT/FJFkQKeJ9Q
	 vkxaYB+dEs22A==
Date: Mon, 17 Jun 2024 17:47:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Khuong Dinh <khuong@os.amperecomputing.com>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com, Nishanth Menon <nm@ti.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 3/7] dt-bindings: soc: intel: lgm-syscon: Move to
 dedicated schema
Message-ID: <20240617-overnight-chevron-cd481dbc59ba@spud>
References: <20240616-dt-bindings-mfd-syscon-split-v2-0-571b5850174a@linaro.org>
 <20240616-dt-bindings-mfd-syscon-split-v2-3-571b5850174a@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8k1Yhdbf/8He0O/S"
Content-Disposition: inline
In-Reply-To: <20240616-dt-bindings-mfd-syscon-split-v2-3-571b5850174a@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_094740_926540_7257AB81 
X-CRM114-Status: GOOD (  17.98  )
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


--8k1Yhdbf/8He0O/S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 16, 2024 at 03:19:23PM +0200, Krzysztof Kozlowski wrote:
> intel,lgm-syscon is not a simple syscon device - it has children - thus
> it should be fully documented in its own binding.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> ---
>=20
> Context might depend on patch in Lee's MFD tree:
> https://lore.kernel.org/all/171828959006.2643902.8308227314531523435.b4-t=
y@kernel.org/
> and also further patches here depend on this one.
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml  |  1 -
>  .../bindings/soc/intel/intel,lgm-syscon.yaml       | 56 ++++++++++++++++=
++++++
>  2 files changed, 56 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Document=
ation/devicetree/bindings/mfd/syscon.yaml
> index af442767aa96..b9bf5bc05e92 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -77,7 +77,6 @@ properties:
>                - hisilicon,pcie-sas-subctrl
>                - hisilicon,peri-subctrl
>                - hpe,gxp-sysreg
> -              - intel,lgm-syscon
>                - loongson,ls1b-syscon
>                - loongson,ls1c-syscon
>                - lsi,axxia-syscon
> diff --git a/Documentation/devicetree/bindings/soc/intel/intel,lgm-syscon=
=2Eyaml b/Documentation/devicetree/bindings/soc/intel/intel,lgm-syscon.yaml
> new file mode 100644
> index 000000000000..0a73b7616a60
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/intel/intel,lgm-syscon.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/intel/intel,lgm-syscon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Intel Lightning Mountain(LGM) Syscon
> +
> +maintainers:
> +  - Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.=
com>

This email is bouncing FYI.

--8k1Yhdbf/8He0O/S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnBopAAKCRB4tDGHoIJi
0mU6AQCMelblVQzCR1QbJoBZ8rkW9ROijWRXui1XEUzgGVthiwD/aGWKRDu2jypE
UOhojA9+yW0IbmsZ7KSU00OLDZkwLwk=
=EkUU
-----END PGP SIGNATURE-----

--8k1Yhdbf/8He0O/S--

