Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319E7606A326
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2026 16:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CzqLI43M;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Q8lzSdZq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TDfQrDs0VJJpLswhqOkr8Amdn3FxE2RvcuAwVP6cJFo=; b=CzqLI43MkrmjRsdPXu+bnY2bBT
	jfUoNekhSd/+yHP9mmiiHI25YqkJsMz1j6zkysOLCogxPs3O3u676i7EwMYrq73M2O1LXjsaDAlUc
	gohpQPpg/IYdRYRO66Yz6ncGQbvjSu26hGJ81NY/dUlfAZJYi+GEp09g9gOyH1Z2cwOIGlUpB2Ju2
	w0CdOJw+EmYAuZ32bBIuKzmN5lYcRp7dhoiyGbQ9TAa/WgQ6kWf5MPUcM78UO4WeHS4jHpEwv7vGd
	aNbBTLWnb3GJwlrnHqjt4Ru4VF5mvrJsTlaOd+iyAZsXhpOp8+YpdQ/euyqt4TRgarfw0Oqy0UoS4
	0DkwxSYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtX1-000000078oE-3c2c;
	Tue, 24 Nov 2026 16:38:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtWx-000000078nM-0kFI;
	Tue, 24 Nov 2026 16:38:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795538284;
	bh=/QZ+irOHsWaC/ChJazv1fX2AjDKuXTFkIcL1lxRycPM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Q8lzSdZqNQsy2LbpNePfKX8KQh7pIMERWPxdBSw3wkx1WOgtvWjSMVDtbLtNHhKi8
	 uYKj8/MoSIcaW0v1BzkTok23qLTkyBt1VBkqtjhOsNXLjSD5akpLoNf53w3rntaSS0
	 BUS5vp2VWLxZ2BhPxrgyzeGD0TPj7s5mB2D3L2Ovc3gS9DSZlD7736/uhb5P9l3yGb
	 Dpz83spNUgC2jGlmUPwf2QclEoWAATsQolBSTA806m2YM/hbvtumvbFlr9/gLoskP1
	 5ls7Ph35rDMM9wi6OQXmsaZMhN7eUET5A8crPpoCFPnbVGTGpJvarj5bZo7WI+ISU0
	 lgDxI5zAa0VLw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8700617E005B;
	Tue, 24 Nov 2026 17:38:02 +0100 (CET)
Message-ID: <871fa86e8a524f7d3ae7a0ac54adf57f14eaa187.camel@collabora.com>
Subject: Re: [PATCH 4/8] media: mtk-mdp: Round MT21C sources up to whole
 tiles
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Ryan Brue <ryanbrue.dev@gmail.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>,  Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans
 Verkuil <hverkuil@kernel.org>, Minghsiu Tsai	 <minghsiu.tsai@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>, Enric Balletbo i Serra
 <eballetbo@kernel.org>, Eizan Miyamoto <eizan@chromium.org>, Francois
 Buergisser	 <fbuergisser@chromium.org>
Cc: Youngjoon Lee <getfeus@gmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Mauro Carvalho Chehab
	 <mchehab+huawei@kernel.org>
Date: Tue, 24 Nov 2026 11:38:00 -0500
In-Reply-To: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-4-877dea14c3d0@gmail.com>
References: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-0-877dea14c3d0@gmail.com>
	 <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-4-877dea14c3d0@gmail.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Ap9Z8iPA9oUAx81PJBIK"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_083807_423087_55BECC5D 
X-CRM114-Status: GOOD (  17.18  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--=-Ap9Z8iPA9oUAx81PJBIK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 20 novembre 2026 =C3=A0 13:55 -0600, Ryan Brue a =C3=A9crit=C2=
=A0:
> MT21C, the MT8173 decoder's output, is laid out in tiles of 16x32
> pixels, and the MDP firmware refuses a source of a size that is not a
> whole number of them: converting a 1280x720 picture fails with -EINVAL
> for every frame, while 1280x736, the decoder's own buffer size, works.
> The alignment was 16x16, so 720 lines passed the format check.
>=20
> Align MT21C to 16x32. mtk_mdp_bound_align_image() already rounds a size
> up to the alignment, so a source covers its picture, and the visible
> part is the crop rectangle.
>=20
> Fixes: c8eb2d7e8202 ("[media] media: Add Mediatek MDP Driver")

Is this commit in stable? If so you should CC stable.

> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c b/drivers/=
media/platform/mediatek/mdp/mtk_mdp_m2m.c
> index d2813890cceb..34d02de4453d 100644
> --- a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
> +++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
> @@ -40,7 +40,7 @@ struct mtk_mdp_pix_limit {
> =20
>  static struct mtk_mdp_pix_align mtk_mdp_size_align =3D {
>  =09.org_w=09=09=09=3D 16,
> -=09.org_h=09=09=09=3D 16,
> +=09.org_h=09=09=09=3D 32,
>  =09.target_w=09=09=3D 2,
>  =09.target_h=09=09=3D 2,
>  };

--=-Ap9Z8iPA9oUAx81PJBIK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawW9aAAKCRDZQZRRKWBy
9I6LAP97J054sBtnp+eLh55dXZmQlNt8Cj6YYU+GZPToghAE0AEA+FmJ/e9Hv+dy
mWFFrQT47bJIutO025aeyEtaLq0Fuw4=
=EFQo
-----END PGP SIGNATURE-----

--=-Ap9Z8iPA9oUAx81PJBIK--

