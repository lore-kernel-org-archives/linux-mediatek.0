Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F446C04A95
	for <linux-mediatek@archiver.kernel.org>; Sun, 25 Sep 2022 21:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pv03MsGUqjo7YYplDmX5Vunn9/54pao7MFsyxjsDrsA=; b=X/eETonC1GmmS68B9xpim8tDOf
	UcozxnKf/GBgu433SJlmeQsJqXFVoBx+nDZNG9uy//z8+nzyOP3+NO6jm3xQ7hrwRc5wpAXj5LKBd
	6hHM21bJFI/3qxsH6GUZya9ooQ4XPWVdErAwX7Oi2MrM/ulDROxiTFrajfnfNzcOumec4kO9DrUUl
	Fpu8yRLW4spqPwyP+B5dDfcRmmmFHLO8Fb+we16f4gAtYbHptlndtwHaWaB/9JxsWmfAl0NLewgoH
	++6rVnOnWd4K6/VtoJkR6O2QIH5sJwnmgpZyWYV49YVtWBzh9YGcL6kjovW7Wc0TLmhZpUJ1FL7Je
	whz52e+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocZ2X-00Glom-CI; Sun, 25 Sep 2022 21:19:53 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocZ2U-00Glm6-Tp
	for linux-mediatek@lists.infradead.org; Sun, 25 Sep 2022 21:19:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id D66FCCE0E11;
	Sun, 25 Sep 2022 21:19:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE9F2C433C1;
	Sun, 25 Sep 2022 21:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664140782;
	bh=AruArAe0wNQ1T914dTbmwSbFVqUdQdd7FYwANLQJReM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oa5LsA1bP6Qs8X6JcdAtrnCIekfV42gPkSFLKXNOJnI9CmjktyZGK8w5DYMgmcDIn
	 wJlwUSnExi9EfVDkCmC+AyZ9GdLPA3/EpK+Eh1Ym7TDzOtv55w8focMGHQ12NXM2Bm
	 skFkNNWrtsomt845rHBZ6MazLsGaDnTqvsdU0y6U+BaZI8oZWKNAIkXt12ZnlMvnlq
	 YbIo8JciF1Krma+dMAKQaELZWzLP16qMdQywlkbrUXeAYPCb/ml9kfGhACeVCFfiFa
	 aY540YR++4fcqEroLqFVHJKYHMkoe9W6bItInzBFpDdjJBs7Ft28ptWQG11QcsXERW
	 CSamUDXziLAtg==
Date: Sun, 25 Sep 2022 23:19:38 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Sujuan Chen <sujuan.chen@mediatek.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chen Minqiang <ptpt52@gmail.com>
Subject: Re: [PATCH 1/2] net: ethernet: mtk_eth_soc: fix wrong use of new
 helper function
Message-ID: <YzDF6n2VX4qwX/I6@lore-desk>
References: <YzBp+Kk04CFDys4L@makrotopia.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O7gVFbOOpcyRoGqd"
Content-Disposition: inline
In-Reply-To: <YzBp+Kk04CFDys4L@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220925_141951_305604_54226708 
X-CRM114-Status: GOOD (  17.85  )
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


--O7gVFbOOpcyRoGqd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> In function mtk_foe_entry_set_vlan() the call to field accessor macro
> FIELD_GET(MTK_FOE_IB1_BIND_VLAN_LAYER, entry->ib1)
> has been wrongly replaced by
> mtk_prep_ib1_vlan_layer(eth, entry->ib1)
>=20
> Use correct helper function mtk_get_ib1_vlan_layer instead.

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

>=20
> Reported-by: Chen Minqiang <ptpt52@gmail.com>
> Fixes: 03a3180e5c09e1 ("net: ethernet: mtk_eth_soc: introduce flow offloa=
ding support for mt7986")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  drivers/net/ethernet/mediatek/mtk_ppe.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.c b/drivers/net/ethern=
et/mediatek/mtk_ppe.c
> index 25f8738a062bd0..4ea2b342f252ac 100644
> --- a/drivers/net/ethernet/mediatek/mtk_ppe.c
> +++ b/drivers/net/ethernet/mediatek/mtk_ppe.c
> @@ -337,7 +337,7 @@ int mtk_foe_entry_set_vlan(struct mtk_eth *eth, struc=
t mtk_foe_entry *entry,
>  {
>  	struct mtk_foe_mac_info *l2 =3D mtk_foe_entry_l2(eth, entry);
> =20
> -	switch (mtk_prep_ib1_vlan_layer(eth, entry->ib1)) {
> +	switch (mtk_get_ib1_vlan_layer(eth, entry->ib1)) {
>  	case 0:
>  		entry->ib1 |=3D mtk_get_ib1_vlan_tag_mask(eth) |
>  			      mtk_prep_ib1_vlan_layer(eth, 1);
> --=20
> 2.37.3
>=20

--O7gVFbOOpcyRoGqd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYzDF6gAKCRA6cBh0uS2t
rKUtAQDCPZ6z3aCvFim9pn2NQseCzfSz/BP9i4XwhX5jYS/zVgEAyAn4WxsHdgnZ
yj7zp6yr+dXdWoj2O9wO8UY3bm5VQAA=
=WBfG
-----END PGP SIGNATURE-----

--O7gVFbOOpcyRoGqd--

