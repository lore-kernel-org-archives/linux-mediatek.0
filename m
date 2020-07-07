Return-Path: <SRS0=cZv3=AS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73CF9C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 21:18:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BDDC20674
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 21:18:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XjindE2q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="MgVclfRl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BDDC20674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qNiKeLsI9p/igE946L3dyS/I61Fu1PFPDQAJOYVgbYE=; b=XjindE2quLWPJoVLlRxrv50Ir
	VKbRH8lpqs8hYLt0vUc4Ckry/pi8K7S+htpTGQ6XPy8QRmisk4fJc4Nuq7a5bwUbqxo5HyYwMs36c
	SiVjsh/et2HXRm4oDNv527KLT0G+/Q7Z0iHHoyOGFxZQcFCgSVDZ+ONXM6mk5ZdWMqCwC+JrKYhpo
	qxFQ3QrILXmd95Kq4oxiS+n338f00nGYGo1Bp/oLdhKWJ7a+FRd9P+My+7JbEcIPZ5s7/YjIdmBsu
	XXduHstwVjwaUTyZ4IxWNeK2HERO9YXgA83OMH+c17dHC0Iy0MBBOuor05HbNDiXF6HZ1NiAsl7aQ
	dtkjOfkmA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsuz4-000729-5w; Tue, 07 Jul 2020 21:18:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsuz2-00071B-7F
 for linux-mediatek@lists.infradead.org; Tue, 07 Jul 2020 21:18:33 +0000
Received: from localhost (unknown [151.48.133.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7485120674;
 Tue,  7 Jul 2020 21:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594156711;
 bh=XL0tUECTDEwrDwToDqVJYlqz0LbTPyF5pQwI+PIscnA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MgVclfRlZvRYeBqsxUtdjp9u1Vr6d7uVSao1gFYbZrCmfSTVZncYwl3vBKuMdm4wk
 /y/1hRtvE2pyw/r7Yu9bMsAh2k7kljnZdXWkN/52t6rTPd4S4LVzxCbSYLkAS1Hg1Z
 fJIWqPn8CxbuhPjnB0PzihdHC3LRUpz0IIndo8+o=
Date: Tue, 7 Jul 2020 23:18:25 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: sean.wang@mediatek.com
Subject: Re: [PATCH v2 1/3] mt76: mt7663u: fix memory leak in set key
Message-ID: <20200707211825.GB388366@localhost.localdomain>
References: <57b81f8efe7e767616a0d5957728756cbfdfa235.1594148548.git.sean.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <57b81f8efe7e767616a0d5957728756cbfdfa235.1594148548.git.sean.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_171832_330143_8CACD62B 
X-CRM114-Status: GOOD (  14.76  )
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
Content-Type: multipart/mixed; boundary="===============3389248365717413910=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3389248365717413910==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mojUlQ0s9EVzWg2t"
Content-Disposition: inline


--mojUlQ0s9EVzWg2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> Fix memory leak in set key.
>=20
> v1 -> v2:
> 	- remove unneeded kfree
>=20
> Fixes: eb99cc95c3b6 ("mt76: mt7615: introduce mt7663u support")
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  .../net/wireless/mediatek/mt76/mt7615/usb.c   | 21 ++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/usb.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7615/usb.c
> index 0ba28d37c414..f3c3ad3509c8 100644
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
> @@ -178,19 +182,22 @@ __mt7663u_mac_set_key(struct mt7615_dev *dev,
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
> +
> +	return err;
>  }
> =20
>  void mt7663u_wtbl_work(struct work_struct *work)
> --=20
> 2.25.1

--mojUlQ0s9EVzWg2t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCXwTmnwAKCRA6cBh0uS2t
rLr8AQCULFrwZ7G32qjUjOLKsbnlci1fSkQNN4w1aSp3ARP41wD+P7qxShJrHRgo
8s5pPVZzF4QjWgGzu0Gm7RBUSw3z8w0=
=Um2P
-----END PGP SIGNATURE-----

--mojUlQ0s9EVzWg2t--


--===============3389248365717413910==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3389248365717413910==--

