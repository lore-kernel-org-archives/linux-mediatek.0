Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C38AC6FA82
	for <linux-mediatek@archiver.kernel.org>; Sun, 25 Sep 2022 21:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pxqEyaDcnKPI4I8pZ2PMNM8ijhVWgE+T8TPQomLniS4=; b=VW/bgPVGclng6M5vKaLMNhyQr9
	cJPX4N1Z7aqznpvRrfZ5bqcip0OHchBJHR/RNjYCXKFyuLTfu459fl+CoF+Q1vTSL3at8QRwQyZQy
	AsArf0jxBoz8HVc8YT3sfuNcmDjpRvzPeIlxWOge0SpYOdOvUiEkDqztbb7uqkNh2R8/WMC25o6gk
	1rRm08HnuG1aSN47QXPYFLzZ8NoEeN419iXxQdDsWPNpNUf+RAe7ZKd4cGocIaFxdAGFebNGl4lr0
	kPBNnUFeymj4fr6coKIa0aJ37o7BIDEnN4RsEO1ZVKeRyoWa7wXxaVo+nj4XYPSUb4r0fK8RhriJz
	4htI42bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocZ9q-00GocC-Qn; Sun, 25 Sep 2022 21:27:26 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocZ9n-00GoUs-U3
	for linux-mediatek@lists.infradead.org; Sun, 25 Sep 2022 21:27:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 86948B80D14;
	Sun, 25 Sep 2022 21:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6B37C433C1;
	Sun, 25 Sep 2022 21:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664141236;
	bh=Rbz1zGH0GqMSn96wkkP2rNJ9kqxZfKKDKoPQgNJPquc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WHu1hGyAt7vDOqEP7H0odVmG15cEuzyosyK+3+1JWDrCo9d71+XN6GZgGO0L9GAWZ
	 ep1t45BQas8KFYfHT0l/Jl/bzeaiJqftqykdwZCSbvj3dhmbvikiZ6Qq/dL2QWWLY2
	 XWA7ibpvl4O2rRbHjbL4G5L3G/kcbMkHKxRSlLXyFsb7yN6MjPRZ3xj8DHQlvskJmz
	 xKnplmwkpbrgz5LBH6Q6h3FWqlFoUT8BWFtncTK3J0DN+8552ppLvx2iwq6i9MlzRq
	 8UF3Y7/8X4pSUfNtvX3IT1WGys4qz5ZQ2qnTcwdtuVrCQtKAuSnuX/57QKZOgeOcDK
	 y5LqFMfaU2eew==
Date: Sun, 25 Sep 2022 23:27:12 +0200
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
Subject: Re: [PATCH 2/2] net: ethernet: mtk_eth_soc: fix usage of
 foe_entry_size
Message-ID: <YzDHsJ7ilCnEQgUo@lore-desk>
References: <YzBqPIgQR2gLrPoK@makrotopia.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NrpRlPxFAxiArcc9"
Content-Disposition: inline
In-Reply-To: <YzBqPIgQR2gLrPoK@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220925_142724_142433_56C83AC1 
X-CRM114-Status: GOOD (  21.52  )
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


--NrpRlPxFAxiArcc9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> As sizeof(hwe->data) can now longer be used as the actual size depends
> on foe_entry_size, in commit 9d8cb4c096ab02
> ("net: ethernet: mtk_eth_soc: add foe_entry_size to mtk_eth_soc") the
> use of sizeof(hwe->data) is hence replaced.
>=20
> However, replacing it with ppe->eth->soc->foe_entry_size is wrong as
> foe_entry_size represents the size of the whole descriptor and not just
> the 'data' field.
>=20
> Fix this by subtracing the size of the only other field in the struct
> 'ib1', so we actually end up with the correct size to be copied to the
> data field.
>=20
> Reported-by: Chen Minqiang <ptpt52@gmail.com>
> Fixes: 9d8cb4c096ab02 ("net: ethernet: mtk_eth_soc: add foe_entry_size to=
 mtk_eth_soc")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/ethernet/mediatek/mtk_ppe.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.c b/drivers/net/ethern=
et/mediatek/mtk_ppe.c
> index 4ea2b342f252ac..887f430734f747 100644
> --- a/drivers/net/ethernet/mediatek/mtk_ppe.c
> +++ b/drivers/net/ethernet/mediatek/mtk_ppe.c
> @@ -547,7 +547,7 @@ __mtk_foe_entry_commit(struct mtk_ppe *ppe, struct mt=
k_foe_entry *entry,
>  	}
> =20
>  	hwe =3D mtk_foe_get_entry(ppe, hash);
> -	memcpy(&hwe->data, &entry->data, eth->soc->foe_entry_size);
> +	memcpy(&hwe->data, &entry->data, eth->soc->foe_entry_size - sizeof(hwe-=
>ib1));
>  	wmb();
>  	hwe->ib1 =3D entry->ib1;
> =20
> --=20
> 2.37.3
>=20

--NrpRlPxFAxiArcc9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYzDHsAAKCRA6cBh0uS2t
rMS1AP0YPgNBO9K0LJnKjNS664lozBLlv/z9B8RVZSIDRZPMEgEAyUK/li93ge07
2xcOy89rkcP+n5x9svtmj5SZ+QstmQk=
=fvir
-----END PGP SIGNATURE-----

--NrpRlPxFAxiArcc9--

