Return-Path: <SRS0=AAZc=AL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E75C1C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 07:13:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0B052073E
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 07:13:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FO7PM3YU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="gxnjBKke"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0B052073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ezL0a+575MpHHgXIDVXImA5wpGjmDGBO3p8UPWHguu4=; b=FO7PM3YUTQrWJJp/x5F8fBs/G
	3i+otggDixP95ZuM/UpqBXErwHDYv0KA+NcajRO8LsgMa/DUMAJk5RqDDAmke1zIUl63dB5b+R6ES
	qjGsGmdXKNXvE8CXZZRKTQDD7yBBQpycHVSlYYWXi8y9RNQTgUWqOgKFfAswvDG0P0ue/zaZpO6ve
	RF5TcO3pJMZVqkI5lecwQsjYL+OzEd6wcHmiUKLY0vzunSJ8O266/iF52t5j6BPWWlJh20zhN5CV5
	tQMyNsoKhlgYUiXVJordPGhtOOQtoOi+nAbrBvgPUGC896Gq+lBghP+Tmo/9IKTYB0VrWdyhYCFro
	mneDrZCEw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqASF-0002FK-AU; Tue, 30 Jun 2020 07:13:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqASD-0002Ey-82
 for linux-mediatek@lists.infradead.org; Tue, 30 Jun 2020 07:13:17 +0000
Received: from localhost (unknown [151.48.138.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A14EB2073E;
 Tue, 30 Jun 2020 07:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593501196;
 bh=MGeDmhHK147t17Kohj7p/leccWrWnai1SGaLq6YZOYk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gxnjBKkeDTArNQKVPCuwPcv+oaM0h8p5eZHOu1jQfnvxGWCq33ciGRyq5aPJ8Dq75
 I8qjOo1jwMhIZf+GDx2hTmi7/13i5rwuUrwf8GiWAFVM19I/qBrTbXaN2IOJ+8n+3i
 KlxkwRB50fZ5e9wRuxubK5Gj+AyKHhPDuuDqTS1E=
Date: Tue, 30 Jun 2020 09:13:11 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: sean.wang@mediatek.com
Subject: Re: [PATCH 2/3] mt76: mt7663u: fix potential memory leak in mcu
 message handler
Message-ID: <20200630071311.GB2169@localhost.localdomain>
References: <5e8786d9cf0ccd09dd9c13c24c48ce441afbf0ff.1593491298.git.sean.wang@mediatek.com>
 <74f27a79f53c6df3c49484a27c5b954d827cd9a5.1593491298.git.sean.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <74f27a79f53c6df3c49484a27c5b954d827cd9a5.1593491298.git.sean.wang@mediatek.com>
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
Content-Type: multipart/mixed; boundary="===============7028143643398943708=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============7028143643398943708==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="f2QGlHpHGjS2mn6Y"
Content-Disposition: inline


--f2QGlHpHGjS2mn6Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> Fix potential memory leak in mcu message handler on error condition.
>=20
> Fixes: eb99cc95c3b6 ("mt76: mt7615: introduce mt7663u support")
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/wireless/mediatek/mt76/mt7615/usb_mcu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/usb_mcu.c b/driver=
s/net/wireless/mediatek/mt76/mt7615/usb_mcu.c
> index cd709fd617db..3e66ff98cab8 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/usb_mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/usb_mcu.c
> @@ -34,7 +34,6 @@ mt7663u_mcu_send_message(struct mt76_dev *mdev, struct =
sk_buff *skb,
> =20
>  	ret =3D mt76u_bulk_msg(&dev->mt76, skb->data, skb->len, NULL,
>  			     1000, ep);
> -	dev_kfree_skb(skb);
>  	if (ret < 0)
>  		goto out;
> =20
> @@ -43,6 +42,7 @@ mt7663u_mcu_send_message(struct mt76_dev *mdev, struct =
sk_buff *skb,
> =20
>  out:
>  	mutex_unlock(&mdev->mcu.mutex);
> +	dev_kfree_skb(skb);
> =20
>  	return ret;
>  }
> --=20
> 2.25.1

--f2QGlHpHGjS2mn6Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCXvrmBAAKCRA6cBh0uS2t
rDL3AQDekyN9KmPt67FocQBPL8/zYcFN3x6LLS54SLs+zbRGhwD/Yk6u2mmFYrAp
7aOdW76sPlrJa466ooMBLtZXcTX9+gI=
=49FR
-----END PGP SIGNATURE-----

--f2QGlHpHGjS2mn6Y--


--===============7028143643398943708==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7028143643398943708==--

