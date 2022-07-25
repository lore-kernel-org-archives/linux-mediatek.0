Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1249FCCA473
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 08:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bRVhVwOCO9NfRWxcyuqIn2JQX4poKFaHCD4cyLoXIt8=; b=grsfvM1VHYW5Ewemz9jDPKjhQk
	5hcUkdA0lYKP7MCjCsmI5bP0eY8w0DbZN37aN3xnWAtkPYU3kGo50EIVyxB2Cbq5MY2Z4x1/u4RJb
	WM9e+UapS1pZcxcpYSIW6eGgQVTwNDXtbF+cj20Rq2L+3TAlQ2eoREzvmv97r1OFUu6TrkOxh4iPU
	RmpG/Z1kzso91aSTO0vqLM3is4Tc45RQPxAUek0Wk80Q3HUJD4HBWdYdOnYOdFysm+n6vgF7MoJM4
	KqO5080jpuF+HVBdZCyN5AHOsV9M5xkW4mlo9ZkjqkhVASG1uvnPXjdaYGPITo1lmbkE5hQALRlox
	I5CsaQOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFt0o-006S2q-O7; Mon, 25 Jul 2022 08:00:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFt0k-006Rvj-9W
	for linux-mediatek@lists.infradead.org; Mon, 25 Jul 2022 08:00:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 20A0D6119C;
	Mon, 25 Jul 2022 08:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61A87C341CE;
	Mon, 25 Jul 2022 08:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658736016;
	bh=M+ANK6zycupl8wyudZ7dhCND90FRLPpFDVsiA2vFXRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U8ig1dzKzwvFUDI/byV4CpY6NemiZ0CmdTk88Wo1vhwcqaEOOaA3RJ/WIRijVfJYi
	 KoME5KcoIBVOOfnPdbf+YrSR8IAcKGhMWmMH+0oX/gF8bq1X++SL6MtKttCLsN2Ed3
	 Szof9qPy/TdW5j2Y85vC/i83eKAg/OR2U1Lf4EF3L9hmzMQnrLzeW0jntmbVu9yYu4
	 irkYPaiUkRv1WO3K9qYnCqvM5jsUBIBDhli/bxPd3+MOs0lMbC0c+T/eLhzdl4L2hr
	 jcCKtQxq4zCz3xIbKnfDXig8wTPOaivmy3Fb1oLkA8lGcfYUxjZHCFyWicxzLlnpCJ
	 hrS4vjOdxalSw==
Date: Mon, 25 Jul 2022 10:00:13 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, lorenzo.bianconi@redhat.com, Soul.Huang@mediatek.com,
	YN.Chen@mediatek.com, Leon.Yen@mediatek.com,
	Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com,
	km.lin@mediatek.com, jenhao.yang@mediatek.com,
	robin.chiu@mediatek.com, Eddie.Chen@mediatek.com,
	ch.yeh@mediatek.com, posh.sun@mediatek.com, ted.huang@mediatek.com,
	Stella.Chang@mediatek.com, Tom.Chou@mediatek.com,
	steve.lee@mediatek.com, jsiuda@google.com, frankgor@google.com,
	kuabhs@google.com, druth@google.com, abhishekpandit@google.com,
	shawnku@google.com, linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] mt76: mt7921: add mt7921_mutex_acquire at
 mt7921_[start, stop]_ap
Message-ID: <Yt5NjVwFXt205J5n@lore-desk>
References: <acb86f6ecd2f446e4102a2ef2e7a9c0003ae8b46.1658641200.git.objelf@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uPKDG0+cIiilZ9Xi"
Content-Disposition: inline
In-Reply-To: <acb86f6ecd2f446e4102a2ef2e7a9c0003ae8b46.1658641200.git.objelf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_010018_469069_AFFBAB63 
X-CRM114-Status: GOOD (  18.67  )
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


--uPKDG0+cIiilZ9Xi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> Add mt7921_mutex_acquire at mt7921_[start, stop]_ap to fix the race
> with the context holding dev->muxtex and the driver might access the
> device in low power state.
>=20
> Fixes: 9d958b60ebc2 ("mt76: mt7921: fix command timeout in AP stop period=
")
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  .../net/wireless/mediatek/mt76/mt7921/main.c  | 21 ++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7921/main.c
> index 1438a9f8d1fd..7a4a3ed1817e 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> @@ -1526,17 +1526,23 @@ mt7921_start_ap(struct ieee80211_hw *hw, struct i=
eee80211_vif *vif,
>  	struct mt7921_dev *dev =3D mt7921_hw_dev(hw);
>  	int err;
> =20
> +	mt7921_mutex_acquire(dev);
> +
>  	err =3D mt76_connac_mcu_uni_add_bss(phy->mt76, vif, &mvif->sta.wcid,
>  					  true);
>  	if (err)
> -		return err;
> +		goto failed;
> =20
>  	err =3D mt7921_mcu_set_bss_pm(dev, vif, true);
>  	if (err)
> -		return err;
> +		goto failed;
> +
> +	err =3D mt7921_mcu_sta_update(dev, NULL, vif, true,
> +				    MT76_STA_INFO_STATE_NONE);

nit: maybe better "out" instead of "failed"

> +failed:
> +	mt7921_mutex_release(dev);
> =20
> -	return mt7921_mcu_sta_update(dev, NULL, vif, true,
> -				     MT76_STA_INFO_STATE_NONE);
> +	return err;
>  }
> =20
>  static void
> @@ -1548,11 +1554,16 @@ mt7921_stop_ap(struct ieee80211_hw *hw, struct ie=
ee80211_vif *vif,
>  	struct mt7921_dev *dev =3D mt7921_hw_dev(hw);
>  	int err;
> =20
> +	mt7921_mutex_acquire(dev);
> +
>  	err =3D mt7921_mcu_set_bss_pm(dev, vif, false);
>  	if (err)
> -		return;
> +		goto failed;
> =20
>  	mt76_connac_mcu_uni_add_bss(phy->mt76, vif, &mvif->sta.wcid, false);
> +
> +failed:

same here

> +	mt7921_mutex_release(dev);
>  }
> =20
>  const struct ieee80211_ops mt7921_ops =3D {
> --=20
> 2.25.1
>=20

--uPKDG0+cIiilZ9Xi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYt5NjQAKCRA6cBh0uS2t
rDdPAQDBI7y1gnpJ3qTOGAeOxSdJsoKxplc8uReMZh8HH/dXvQD/RBclGvQ3mMPW
AkOpg5aytWACHqSzpNkNGHXiwXL9GQY=
=fWlh
-----END PGP SIGNATURE-----

--uPKDG0+cIiilZ9Xi--

