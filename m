Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F63E6FE5B
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Sep 2023 15:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7I1dNoNVNe7bENG7xy5iR4LmpOYLGAF9gPCO5/SFtv0=; b=L8a1QfmzoWHQoo+dXlUfSqaxRy
	RQdYsw7QQSvKWeMa9/iwT958JoOlnvsM4Sj05kpEHD7EgC+J1Mp33IPIPUjb3Qb2NL8m9UFBn3ROg
	4F7W5dJLRtEwhmGJq/qtI8rp3boJLEMO488dUsawNIrq4p+JjlPKYyznLroyKR20dbF+atJvctE9g
	da2hbYkbuNCs4lSD0TUUpvJ5QAzN8pSfuDYcVtYirwj7wKS1S88bvpEbrq9HdX2y/Hktowcvz+Ryg
	pxB7DDRg7M4BeE+aNOMLFsp9saTtdihBbTAFn9UD2CoJxZ1o1JusWBdZmq/WkdodkYghJDF7G6fYC
	/qXDKcYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjiPF-009LOt-3B;
	Fri, 22 Sep 2023 15:49:25 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjiPC-009LN3-1D;
	Fri, 22 Sep 2023 15:49:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id DCC83B822B5;
	Fri, 22 Sep 2023 15:49:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD083C433C8;
	Fri, 22 Sep 2023 15:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695397760;
	bh=jMjHcug31WE0Bf+Ku26R9S8JCXFscQZH4Akv3KWK0Zw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X/SOWMfNE20zbjcBK/8c3F6O6Fc1na8/hodzZZ6DGFRpmsfAkqnWg/2PfBkUGQDfN
	 t7R+uTAEmxHPA2Ja2+bmUkE0GCtFWPpzaUb/QFDmD2Hde2nKeh/m/QBgzg8B3iYy+Q
	 rYaChEdl1p3tKO3m/aLHWbQ3ifkqxXV2GTIaCy9R9okYWTGdqIsTS6VQYnNPe+fG7D
	 ja508rv2ZxCUTLw7YSs6jk5zGXCPfQxbpE0+CEhxu5i14SfbWDQ/R08ZlVn/MEVmzm
	 4hR1WIFYYlXXRO6OIMq2snh4Nwv9dmlipjE/Ef3qTFtjCkjidtgtihq8ytBApJvYuM
	 Tn1S6OnoXQAJA==
Date: Fri, 22 Sep 2023 16:49:14 +0100
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
Subject: Re: [PATCH v6 12/16] dt-bindings: display: mediatek: color: add
 compatible for MT8195
Message-ID: <20230922-zebra-modify-87ff23c70bb3@spud>
References: <20230922072116.11009-1-moudy.ho@mediatek.com>
 <20230922072116.11009-13-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4AbnyxYTFcvfDnp5"
Content-Disposition: inline
In-Reply-To: <20230922072116.11009-13-moudy.ho@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_084922_557366_AEAC91C1 
X-CRM114-Status: GOOD (  15.69  )
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


--4AbnyxYTFcvfDnp5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2023 at 03:21:12PM +0800, Moudy Ho wrote:
> Add a compatible string for the COLOR block in MediaTek MT8195 that
> is controlled by MDP3.
>=20
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,color.yaml     | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,co=
lor.yaml
> index f21e44092043..b886ca0d89ea 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y=
aml
> @@ -26,6 +26,7 @@ properties:
>            - mediatek,mt2701-disp-color
>            - mediatek,mt8167-disp-color
>            - mediatek,mt8173-disp-color
> +          - mediatek,mt8195-mdp3-color

How come this one is a "mdp3" not a "disp"?

>        - items:
>            - enum:
>                - mediatek,mt7623-disp-color
> --=20
> 2.18.0
>=20

--4AbnyxYTFcvfDnp5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQ23egAKCRB4tDGHoIJi
0jeNAQDbS49YRGx3evrS4YI09M9KqM0J+UXzPHF9KB+js6e3qQD+Ivrgl0SwBLae
2UKQyhQwRkwkANvuDlc0Y+I85WBfego=
=zbsi
-----END PGP SIGNATURE-----

--4AbnyxYTFcvfDnp5--

