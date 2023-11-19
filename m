Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFC3C54E76
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Nov 2023 13:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mrf2Ye3rxXFPPPPTStZShmGfAVXHoL19LHNNJEO1Gwo=; b=jT2uaK+oc/F+a1rCGse6mK+7Ha
	C5MyKGsMnBqI1AedM5TNQTkuIF/H5TPqshW1LXTa4iRe6VI1MBNydaXWdB1DE6Bcln5gUcotuweRW
	uLOTF2y+syMORLoyY9RAoJvLSutrm1EDeY9ep4EgLw+LijqD+lKxXAcSSfGU00zqiPStZkk2KE+Vx
	mPKRxVLzGAP9a3tgRfdu/6ujo3UKZqKPjqQ7O9fLDl+Sbpajgb4RKSm+T5u6pAl2b7LIt4LyEcV8h
	Z8Ce1e1mbmN81CEhOEUTakQ1aPgqTU6sM9vRW1uE02tmct5gA6wOmRwUcikw3v+eFSdd5bSPaNc/b
	UKsfyO8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4hch-00ACrT-32;
	Sun, 19 Nov 2023 13:14:03 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4hce-00ACqE-1e;
	Sun, 19 Nov 2023 13:14:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 96A46B80B9F;
	Sun, 19 Nov 2023 13:13:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0829EC433C9;
	Sun, 19 Nov 2023 13:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700399633;
	bh=V5DrQvF6t0U/HsWpd5WvEPfjpOcCReCCCj86sAPbP3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oX/nHFCEfPImk+7retm6wyFAS/q9qe6NpBwcZE5N5hmznsGxkW1sQsABX0CyEQDOt
	 +GxjPJ6h7EipvTIFNKpJc5uD5ktNSiQqtJD7iERW8I7kFIbjJjUxh8pvOQfZIYBgut
	 MjYIQFCOvwloPORwGduT3zMIu4AGqeHTLHSWvPmhbo/wqv9IsHwZP0e4UDPjk8FijL
	 bUw4QEbakMWS8viI2MKACCA6flPp6NiaAThN8RYHO8P7cex6xD1GY8v/1YN+DRG71y
	 oKmfnEm7FFRjrJcExqD9MDcRfqKeosHccc8jriv2Xdn02e31rZuaioKOhWD/pr3gra
	 hQPB4NpiBnstQ==
Date: Sun, 19 Nov 2023 13:13:47 +0000
From: Conor Dooley <conor@kernel.org>
To: "yu-chang.lee" <yu-chang.lee@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Garmin Chang <garmin.chang@mediatek.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: mediatek: Remove compatible
 for MT8188 VPPSYS
Message-ID: <20231119-gem-plus-3217ffee6278@spud>
References: <20231117053934.10571-1-yu-chang.lee@mediatek.com>
 <20231117053934.10571-2-yu-chang.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/qVEodwOwNmr9weC"
Content-Disposition: inline
In-Reply-To: <20231117053934.10571-2-yu-chang.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231119_051400_702770_E53AD57B 
X-CRM114-Status: GOOD (  14.27  )
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


--/qVEodwOwNmr9weC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 17, 2023 at 01:39:33PM +0800, yu-chang.lee wrote:
> MT8188 VPPSYS 0/1 should be probed from mtk-mmsys driver to
> populate device by platform_device_register_data then start
> its own clock driver.

How does one operating system's driver probing model render these
compatibles invalid?

Cheers,
Conor.

>=20
> Signed-off-by: yu-chang.lee <yu-chang.lee@mediatek.com>
> ---
>  .../devicetree/bindings/clock/mediatek,mt8188-clock.yaml        | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8188-cloc=
k.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
> index d7214d97b2ba..860570320545 100644
> --- a/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
> @@ -43,8 +43,6 @@ properties:
>        - mediatek,mt8188-vdecsys
>        - mediatek,mt8188-vdecsys-soc
>        - mediatek,mt8188-vencsys
> -      - mediatek,mt8188-vppsys0
> -      - mediatek,mt8188-vppsys1
>        - mediatek,mt8188-wpesys
>        - mediatek,mt8188-wpesys-vpp0
> =20
> --=20
> 2.18.0
>=20
>=20

--/qVEodwOwNmr9weC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVoKCwAKCRB4tDGHoIJi
0mmwAP4xlBMe7KzcRqab0tzLkrFxcEcp+1zazJckesSqDZjnDgEA1RUf5bBcEP+x
B3LIvAw1RBNkkHCQMJDouIVhi3zTvQM=
=RCYq
-----END PGP SIGNATURE-----

--/qVEodwOwNmr9weC--

