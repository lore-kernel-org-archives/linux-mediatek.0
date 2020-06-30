Return-Path: <SRS0=AAZc=AL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D32C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 07:24:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D625320759
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 07:24:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TyqAruwF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="uSns4xvi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D625320759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Eq9X6y1fpi0GVU8Z3nLsUB2PR94EB5Ie+kxnOMdpO4s=; b=TyqAruwFNH7IxDnow068XcO6+
	bY8fOcc3DhXbT7ick/Q6Gw4TCuKYma4lyh19yRQkUD48K4ddt2CSypUSBzxMjxbaIqYVE6Zmtvl8+
	MCiM871w+tZTHUoOz4Qqob0PtpyFrVCNy4TEAPPhyGormWLb5ue8BCYApGnOCSZLZDtrTkgmZ7Ly1
	X+ZYf9NMPzqZRSQAWY7ZJHRWUCGfURR8UkpMbQY8Iw3dQtDVHfiAIfMs0BwaTHGdGxGOLur1CenON
	efSx/da31mxypTyvE7Pje4qsTHmL+wB2CAxpBpu9g+gmnuNEcDT+eq/qS1HAvr0ndJ2hfpR1JaRct
	TqEUhRy0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqAdC-0003zn-6U; Tue, 30 Jun 2020 07:24:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqAd9-0003yx-KC
 for linux-mediatek@lists.infradead.org; Tue, 30 Jun 2020 07:24:36 +0000
Received: from localhost (unknown [151.48.138.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8DA9E20759;
 Tue, 30 Jun 2020 07:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593501874;
 bh=HvhnlfmSrJuoYL5PlEkRODPAbslKF6Vpa8TWSCAMJ2w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uSns4xvic6/mlnoSOgQc5/edZS7x32JkoEyklhlsEcB9PuhzpROumxHKLRK4QluTI
 4VHuER245AOxthzYmZ1fdrbbXov4KKZ4FMjC0ieRXKo5US8L96tojpRxU3bpyGuxV3
 A0b6JnpyHO7hok9J3FazxeBr1t4Mvl9eZIMReMw0=
Date: Tue, 30 Jun 2020 09:24:29 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: sean.wang@mediatek.com
Subject: Re: [PATCH 1/3] mt76: mt7663u: fix memory leak in set key
Message-ID: <20200630072429.GD2169@localhost.localdomain>
References: <5e8786d9cf0ccd09dd9c13c24c48ce441afbf0ff.1593491298.git.sean.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <5e8786d9cf0ccd09dd9c13c24c48ce441afbf0ff.1593491298.git.sean.wang@mediatek.com>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 ryder.lee@mediatek.com, linux-wireless@vger.kernel.org, nbd@nbd.name
Content-Type: multipart/mixed; boundary="===============8257629344001250461=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8257629344001250461==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2Z2K0IlrPCVsbNpk"
Content-Disposition: inline


--2Z2K0IlrPCVsbNpk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> Fix memory leak in set key.
>=20
> Fixes: eb99cc95c3b6 ("mt76: mt7615: introduce mt7663u support")
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  .../net/wireless/mediatek/mt76/mt7615/usb.c   | 22 +++++++++++++------
>  1 file changed, 15 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/usb.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7615/usb.c
> index 0ba28d37c414..96a081be108e 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/usb.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/usb.c
> @@ -165,12 +165,16 @@ __mt7663u_mac_set_key(struct mt7615_dev *dev,
> =20
>  	lockdep_assert_held(&dev->mt76.mutex);
> =20
> -	if (!sta)
> -		return -EINVAL;
> +	if (!sta) {
> +		err =3D -EINVAL;
> +		goto out;
> +	}
> =20
>  	cipher =3D mt7615_mac_get_cipher(key->cipher);
> -	if (cipher =3D=3D MT_CIPHER_NONE)
> -		return -EOPNOTSUPP;
> +	if (cipher =3D=3D MT_CIPHER_NONE) {
> +		err =3D -EOPNOTSUPP;
> +		goto out;
> +	}
> =20
>  	wcid =3D &wd->sta->wcid;
> =20
> @@ -178,19 +182,23 @@ __mt7663u_mac_set_key(struct mt7615_dev *dev,
>  	err =3D mt7615_mac_wtbl_update_key(dev, wcid, key->key, key->keylen,
>  					 cipher, key->cmd);
>  	if (err < 0)
> -		return err;
> +		goto out;
> =20
>  	err =3D mt7615_mac_wtbl_update_pk(dev, wcid, cipher, key->keyidx,
>  					key->cmd);
>  	if (err < 0)
> -		return err;
> +		goto out;
> =20
>  	if (key->cmd =3D=3D SET_KEY)
>  		wcid->cipher |=3D BIT(cipher);
>  	else
>  		wcid->cipher &=3D ~BIT(cipher);
> =20
> -	return 0;
> +out:
> +	kfree(key->key);
> +	kfree(wd);

Actually we do not need to free wd since it is done in mt7663u_wtbl_work()

> +
> +	return err;
>  }
> =20
>  void mt7663u_wtbl_work(struct work_struct *work)
> --=20
> 2.25.1

--2Z2K0IlrPCVsbNpk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCXvroqgAKCRA6cBh0uS2t
rPBnAQDmSs/a+RSB3542U4ZITjLG5j04PnwuU5GAChNUlDE94AEAxlto2CvCAt4M
fRHzEhpC4/eXghF7NdpIT5oHldFucQY=
=jr3r
-----END PGP SIGNATURE-----

--2Z2K0IlrPCVsbNpk--


--===============8257629344001250461==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8257629344001250461==--

