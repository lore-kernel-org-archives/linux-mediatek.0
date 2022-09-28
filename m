Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B919FC32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 09:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nfV6HfiwxCoPU/ek9MwiwFG/ZAYcG/2Sq+eQMc/E6kg=; b=PvjemWitw3FNxsQIIThLW2/5XM
	YVaR+QPFEm+gSS+Lxske2rliCreknuttRFjpdqetmWg3TZJcTfr46gA8ZsCzga8NPBXQr5Lp34vnx
	aJup07T0oHRgzKXMftYPAVbHnrKFLKiMQwqAJwoG1jQYlFqe9Wljkdxh3uF70VpVn6lIKbL0bWDAw
	omKnBDCiZVLZHOmQ+0QBcoH9afpJTCepQ3QzLhorMYlHK41GS7VH8YVQYDdnivuFLu2nPWE8JqnYj
	wdozQvG6o2oMEYQrwscGnnR1H/AHWBr/J+BmYCKqC5leWfyQDjObXq3eRVFBKg0vll029iFwxqNHs
	kNByxnpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odTM2-00FCB7-4e; Wed, 28 Sep 2022 09:27:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odTLz-00FCA7-Lf
	for linux-mediatek@lists.infradead.org; Wed, 28 Sep 2022 09:27:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 35BFD611AA;
	Wed, 28 Sep 2022 09:27:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4742AC433D7;
	Wed, 28 Sep 2022 09:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664357262;
	bh=ccg1pM+XNUwx5lEW8JBcafEXG88UBm4Y4hgUSqf14/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qyQl9ymlGmwTt72nMnbXlUz9g0IBP4sl+zVhy8eBGXOJGM6Fi7Yb0usTHemOKlSwK
	 hiegBLuyX+3p+M4OIEAdJhCakkfpyfUVHhST0tatrNvhr9DsJiYjjSJC5FfjPH2Nro
	 Vs8aqEnrE0xAeqApBUj0E3GU1DgAsWtrzJbe9kLsyjScb4laMsyNjDc2zrH/CTQy+3
	 UKUjLhZxXyn4j2b/h25M7x59E83e9TiUj5fsokKldzN3zQ9b84Gryx+7y4Uic+Qvqm
	 FX5wkqbZxY/QFA09QvYwYVgUI5Cc9Mc1tSa3cQ4SSisjE4MRVRwJGNuTJhTXF8kUuV
	 +3SwfyoEIrNaQ==
Date: Wed, 28 Sep 2022 11:27:39 +0200
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
	Chen Minqiang <ptpt52@gmail.com>,
	Thomas =?iso-8859-1?Q?H=FChn?= <thomas.huehn@hs-nordhausen.de>
Subject: Re: [PATCH] net: ethernet: mtk_eth_soc: fix state in
 __mtk_foe_entry_clear
Message-ID: <YzQTi1CfU79u8RYT@lore-desk>
References: <YzOie0dkiQ43EPnu@makrotopia.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0XpyYKBevE2ylH7z"
Content-Disposition: inline
In-Reply-To: <YzOie0dkiQ43EPnu@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_022743_803811_3D807A57 
X-CRM114-Status: GOOD (  18.00  )
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


--0XpyYKBevE2ylH7z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Setting ib1 state to MTK_FOE_STATE_UNBIND in __mtk_foe_entry_clear
> routine as done by commit 0e80707d94e4c8 ("net: ethernet: mtk_eth_soc:
> fix typo in __mtk_foe_entry_clear") breaks flow offloading, at least
> on older MTK_NETSYS_V1 SoCs; OpenWrt users have confirmed the bug on
> MT7622 and MT7621 systems.
> Felix Fietkau suggested to use MTK_FOE_STATE_INVALID instead which
> works well on both, MTK_NETSYS_V1 and MTK_NETSYS_V2.
>=20
> Tested on MT7622 (Linksys E8450) and MT7986 (BananaPi BPI-R3).
>=20
> Suggested-by: Felix Fietkau <nbd@nbd.name>
> Fixes: 0e80707d94e4c8 ("net: ethernet: mtk_eth_soc: fix typo in __mtk_foe=
_entry_clear")
> Fixes: 33fc42de33278 ("net: ethernet: mtk_eth_soc: support creating mac a=
ddress based offload entries")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/ethernet/mediatek/mtk_ppe.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.c b/drivers/net/ethern=
et/mediatek/mtk_ppe.c
> index 887f430734f747..ae00e572390d7b 100644
> --- a/drivers/net/ethernet/mediatek/mtk_ppe.c
> +++ b/drivers/net/ethernet/mediatek/mtk_ppe.c
> @@ -442,7 +442,7 @@ __mtk_foe_entry_clear(struct mtk_ppe *ppe, struct mtk=
_flow_entry *entry)
>  		struct mtk_foe_entry *hwe =3D mtk_foe_get_entry(ppe, entry->hash);
> =20
>  		hwe->ib1 &=3D ~MTK_FOE_IB1_STATE;
> -		hwe->ib1 |=3D FIELD_PREP(MTK_FOE_IB1_STATE, MTK_FOE_STATE_UNBIND);
> +		hwe->ib1 |=3D FIELD_PREP(MTK_FOE_IB1_STATE, MTK_FOE_STATE_INVALID);
>  		dma_wmb();
>  	}
>  	entry->hash =3D 0xffff;
> --=20
> 2.37.3
>=20

--0XpyYKBevE2ylH7z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYzQTiwAKCRA6cBh0uS2t
rMV8AQDhjJi0FeKHuFhjhaYu7HLNTxJ6uWF1xx0U/i79Ek61TAD+PuB6uf7AItB8
NoV+SHYJreeLaFclZMKTPROB9NBn7gQ=
=W1l5
-----END PGP SIGNATURE-----

--0XpyYKBevE2ylH7z--

