Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807A7C00144
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 17:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ysEgZCJQe+l1Vy04HSurS/P59c30oa9AameF3EfQu0I=; b=HuIfjFy5rWHbXFksHr4csFeDgu
	LWoOa3YlD3Kcpi/iEj3Wka07pQrEMu+V+0pdiZK+kUYYll4tO0qgjvn8/xK/ieSDnSYT7S3MYckJQ
	5pYIxKbeUPZvuu6MZvHU6uMrThxzB7bCy3qW19h2eLcwDWTTu3N9S1WV/x4SzdKKei3Fe1pnVY+Tl
	dflxpyeQf4kJ/9SByhsYazo/wTE5IZWn8JVFwcHJ4ApsVY5mDHRsoEbQDvrl0CVUhJnodEgKzaCH4
	WqMnVL6mmF/yjTWifR8aRpugpqiZzLpayndf4a5nRVXtJ0NLOOc10dXWTF8yu567ckZLTQaCNGHPX
	yzEBdlFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHU29-008sRf-IN; Fri, 29 Jul 2022 17:44:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHTlB-0084XY-Lx
	for linux-mediatek@lists.infradead.org; Fri, 29 Jul 2022 17:26:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3A42C61F0D;
	Fri, 29 Jul 2022 17:26:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C038C433D6;
	Fri, 29 Jul 2022 17:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659115607;
	bh=TTETB8o7PvQdP2mX6Ys+iLsrFmlIEx9xlCqi+ww3iz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mEp2i0yO10ftohBAY8DWk0IaVKxuui91sT2nh87qBhawO10UMafu9r0Dx8cEjWVT1
	 KW7ik3QLGiXbmEut0/bS5c86tUmxFFdlLarCGSxtCHPRX/cdkiUwJPT/JsOiTOB53s
	 JaWDX04KiOB7E1zb6IvYxtEhWs9ESdR1eJFqZich1t+Fp1PGhvwqArekbDXVGNQnbN
	 BeKvNbPJiin7+BOcyvhbESpgLu9A0zmD1HQymp+ygO5IAA9L/YBcolY1Mm9KgTE36Y
	 47/PsYayw1+6KHcg34YMEFxIcdWGQ1kLgjsNC/uGIlZZk8+GaswyiHlrU4+kCYJuYR
	 iI3ITF0b9YI4w==
Date: Fri, 29 Jul 2022 19:26:43 +0200
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
Subject: Re: [PATCH RESEND v2 1/2] mt76: mt7921: add mt7921_mutex_acquire at
 mt7921_[start, stop]_ap
Message-ID: <YuQYU2SxIyHvIODd@lore-desk>
References: <6353fe62ebeb0f78aa34b40e9c1745061b229f6c.1659105379.git.objelf@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QR/FOKVDFLb314yh"
Content-Disposition: inline
In-Reply-To: <6353fe62ebeb0f78aa34b40e9c1745061b229f6c.1659105379.git.objelf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_102650_020882_7CB4F5A8 
X-CRM114-Status: GOOD (  17.94  )
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


--QR/FOKVDFLb314yh
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
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabor=
a.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
> v2: use "out" label instead and add the Tested-by tag from AngeloGioacchi=
no
> ---
>  .../net/wireless/mediatek/mt76/mt7921/main.c  | 21 ++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7921/main.c
> index 1438a9f8d1fd..63fd33dcd3af 100644
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
> +		goto out;
> =20
>  	err =3D mt7921_mcu_set_bss_pm(dev, vif, true);
>  	if (err)
> -		return err;
> +		goto out;
> +
> +	err =3D mt7921_mcu_sta_update(dev, NULL, vif, true,
> +				    MT76_STA_INFO_STATE_NONE);
> +out:
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
> +		goto out;
> =20
>  	mt76_connac_mcu_uni_add_bss(phy->mt76, vif, &mvif->sta.wcid, false);
> +
> +out:
> +	mt7921_mutex_release(dev);
>  }
> =20
>  const struct ieee80211_ops mt7921_ops =3D {
> --=20
> 2.25.1
>=20

--QR/FOKVDFLb314yh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYuQYUwAKCRA6cBh0uS2t
rFYcAQC6fw/AttTCMgPr9rVM0wmTBsyrie78IoSnVZuckMiTowD/XAqFayOYJfR5
7SHvc7DoQBYK1I1uiYWy6SiuAewu5wQ=
=YI9g
-----END PGP SIGNATURE-----

--QR/FOKVDFLb314yh--

