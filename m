Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B02BCCCF9F8
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Nov 2025 10:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2SpWOW82vuNNRBxu7jCcO5mLAl9iv8FhRpl0+cmv7GE=; b=A18qI2WIQ/nFBYDKnAFQevjG4f
	Be2yPCYk9ELzVpoDRg92ccLaCEXf1lXEnYLpHPhxVksAA2k2ILc8WJ83xteDb4eSUATSvRSeNfa8o
	m+1w6WP1yb3+4JW0khqx/7VbKPmBjUyfVwOOptZemcU2hRk2uRLD3zhhfbWwqKRQsCtP2SnxsgsFr
	uCV1fR6sHSgVQf+17CDJyJpaL60YJs4Rk1VnbaKolegOL/AG2uc+vtM3MPq1thBEFmGQgDjGBNDrH
	IdSe3k4+bh0X04/9UDjHTuduHUCcW+vswg/cDRrRiaYo7Xt05oW5c+BqH7k7xjvLhUmndi3F4UZJp
	5vZNXe1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGaS1-0000000DRmB-3mu8;
	Wed, 05 Nov 2025 10:09:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGaS0-0000000DRm1-39qt
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Nov 2025 10:09:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 322BA60203;
	Wed,  5 Nov 2025 10:09:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8470AC116D0;
	Wed,  5 Nov 2025 10:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762337351;
	bh=q9vl6CFKNRq+RTkadcNLgRaGu8yY+YtEFDn5kcjX11E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UJxOynmbksttRhm6CoepJhonLfasEBZlgUi0IWinsT9CBzcsr4YA/MV7crPa571Sg
	 ujhoUpJnX+jEdWUECpUzoiCI/VHzSbOV5X6Z8y3I621y3jM21yOqxSEaHuhuWplc7s
	 Nnxz9YbsYvOxoUBbHD4ZYX8ZAQ26wzXq1kd8pQaplIninofHhp8H0wp7U8wAmLWh9G
	 jwTmjbW698Zjc0mjiLYiAPmZOhK1Ih8O+mjlF91vjiEUAStEcHU84FYVAdBmnkdGeE
	 rOvMa5D0SPTb5r6iI0eDvQail5WDa0wBJwp9G56OpMHjpbSwQmlIfx9q1bDJqFTPGI
	 6zOe/eAOtFnsg==
Date: Wed, 5 Nov 2025 11:09:09 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH mt76 06/12] wifi: mt76: mt7996: fix teardown command for
 an MLD peer
Message-ID: <aQsiRRlc-d86tuHb@lore-desk>
References: <20251105093100.541408-1-shayne.chen@mediatek.com>
 <20251105093100.541408-6-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gWOG1LyuzKOKSpQo"
Content-Disposition: inline
In-Reply-To: <20251105093100.541408-6-shayne.chen@mediatek.com>
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


--gWOG1LyuzKOKSpQo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> For an MLD peer, we only need to call the teardown command when removing
> the last link, and there's no need to call mt7996_mcu_add_sta() for the
> earlier links.
>=20
> Fixes: c1d6dd5d03eb ("wifi: mt76: mt7996: Add mt7996_mcu_teardown_mld_sta=
 rouine")
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/wireless/mediatek/mt76/mt7996/main.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7996/main.c
> index 5e0b57657e7e..685be98b9f27 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
> @@ -1206,13 +1206,13 @@ mt7996_mac_sta_event(struct mt7996_dev *dev, stru=
ct ieee80211_vif *vif,
>  				mt7996_mac_twt_teardown_flow(dev, link,
>  							     msta_link, i);
> =20
> -			if (sta->mlo && links =3D=3D BIT(link_id)) /* last link */
> -				mt7996_mcu_teardown_mld_sta(dev, link,
> -							    msta_link);
> -			else
> +			if (!sta->mlo)
>  				mt7996_mcu_add_sta(dev, link_conf, link_sta,
>  						   link, msta_link,
>  						   CONN_STATE_DISCONNECT, false);
> +			else if (sta->mlo && links =3D=3D BIT(link_id)) /* last link */
> +				mt7996_mcu_teardown_mld_sta(dev, link,
> +							    msta_link);
>  			msta_link->wcid.sta_disabled =3D 1;
>  			msta_link->wcid.sta =3D 0;
>  			links =3D links & ~BIT(link_id);
> --=20
> 2.51.0
>=20

--gWOG1LyuzKOKSpQo
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaQsiRQAKCRA6cBh0uS2t
rPYxAPwN6UABmG4cWh1w5AMD909RUy2CkfSxh1vzuY9uCDsErQEA+FEvZetibhlH
WOLWyymP5iNrpj0FC2ymsPEwhU8GTAE=
=Gd8Y
-----END PGP SIGNATURE-----

--gWOG1LyuzKOKSpQo--

