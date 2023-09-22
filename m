Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8784E6FE52
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Sep 2023 15:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ocJALG3csHHfFOLpJ8FDNJYSsNrZZa74IsAXdJ6rWYw=; b=EJOgB6beV7hQjDlRWRxpUP7dkL
	g8sbb9wtlsH7el4RUAEM66oHLcNkLjkmOf/CLyuJLItOcd6wjkEl69OGGBi+9agyVbojXDhnhz7pe
	e7GF8LuHBuNOJpgXf5QPEMQYlHEuaf8WcaLltnprMkNT8srkOLDJK4HOSPVbVB31Ah2zq+2cSs4gw
	xTx2wxe/yTcf1vTTGZzVkqa3X05Iof2O7vfEfzE0SG30ZDNS0n0O1LKLGWvS386EnoK6IMt69eHVE
	+T9/4QSYz0yuOAeG17SPj2YVBtgysL6yDIaarumZOPer5RG31Oa2cQCSdr3HIyafYS3CcBPfAY5r2
	rymQ9hZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjiOF-009LF2-1h;
	Fri, 22 Sep 2023 15:48:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjiOC-009LDU-1L;
	Fri, 22 Sep 2023 15:48:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BDE98622A9;
	Fri, 22 Sep 2023 15:48:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 015D2C433C7;
	Fri, 22 Sep 2023 15:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695397699;
	bh=8w9Ujvja964fuDGqWLgM5V4eKnCcfYA0NVGZFXl15sQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p5HBOrsKFey9p3dAJ7MRKC4083LY/P8a1poYb+aB+21SUWlseDbNpfcTHVARIsvzP
	 bvAHEgggwV3hJIjwvIKjTZcqqlfuXL2McNpwAQNu0CMy6lEcv9fk5RdJ506CrBpyzN
	 eC9qTCgvxVSLfBwR6cU+X3FK88hzghXxWn9CAA4uuu9GjBNURsbcbsGCiZycJsoQ3U
	 XZzBV1p7lDlrtSDkaqjt3ddSfG0Bfnju60iQas+EBypsB+Wtfb0vKfCaze/24k3lcz
	 7tw6xUPNREoIda8qU4Goa2vQfK4LfgcE2trgVMVwoedmM2pt/kVUaCvg/BA45mEJZR
	 T1AKzKqMHNzNA==
Date: Fri, 22 Sep 2023 16:48:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 11/16] dt-bindings: display: mediatek: aal: add
 compatible for MT8195
Message-ID: <20230922-copilot-blinks-9792fbb03f98@spud>
References: <20230922072116.11009-1-moudy.ho@mediatek.com>
 <20230922072116.11009-12-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jaBhXNzcCjVRYW/j"
Content-Disposition: inline
In-Reply-To: <20230922072116.11009-12-moudy.ho@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_084820_510097_EF5F85D1 
X-CRM114-Status: GOOD (  15.56  )
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


--jaBhXNzcCjVRYW/j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2023 at 03:21:11PM +0800, Moudy Ho wrote:
> Add a compatible string for the AAL block in MediaTek MT8195 that
> is controlled by MDP3.
>=20
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  .../devicetree/bindings/display/mediatek/mediatek,aal.yaml       | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.=
yaml
> index 7fd42c8fdc32..b4c28e96dd55 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> @@ -24,6 +24,7 @@ properties:
>        - enum:
>            - mediatek,mt8173-disp-aal
>            - mediatek,mt8183-disp-aal
> +          - mediatek,mt8195-mdp3-aal
>        - items:
>            - enum:
>                - mediatek,mt2712-disp-aal
> --=20
> 2.18.0
>=20

--jaBhXNzcCjVRYW/j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQ23PQAKCRB4tDGHoIJi
0j37AQC9UwbCC8s2QULJCGVr5HCywVwaJT5fLfW7JjIum7PnRwD9FhdX5hZHQxDX
q3jxn4X/g9f90EQyLRTLqwpHbwF3eA4=
=kIb2
-----END PGP SIGNATURE-----

--jaBhXNzcCjVRYW/j--

