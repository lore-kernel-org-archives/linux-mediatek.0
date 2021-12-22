Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF919C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Dec 2021 11:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OssSmiLEm7BkIuA9imIMC8NmoMPTeXrqibvwUp6y1Dk=; b=fxsgnedKK9L0KtgzzThYOW3ieN
	RzdWGoudP3Hk/vydmFgbzIAUcz4ArfBjsr0xFoRqHUr6PyZIDsjvNzYLNrs8o2VcFHVrAiMsObhJu
	G+gwdosVL7Ro/OKHFlzaulsRKHVQg8nV/raaDYej89GgH9Z6lrgfszEg+cKFhGzPOMjEM6867cbHA
	SyoFEs9Us91F0j+Hzs1ImAsbgXWLL/qfcveLVyjIENRSqhYZcmXZh2OvK0l+tjbPsiUyQSvSzTm1j
	lSWdH8O/r92xpBkzt8GpnsiE9YMkvSfFbC6N34KMxZq2qxU+C+F6mPlWCYnSB3mxFBT2ySun6uK0S
	c/+WuhwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzzbu-00A5pd-I3; Wed, 22 Dec 2021 11:16:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzzbq-00A5oe-99
 for linux-mediatek@lists.infradead.org; Wed, 22 Dec 2021 11:16:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640171795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IKISxmtZzjPZoimC3+z/GJSBImMT6ZL0SxiFe7OYMWE=;
 b=jLsbkVYnqRY+wRfTFV3dfTe+AfIyb9zVeqwhnCnOvSicgHm4qw08wS/79ak53v0Zp77QMO
 H+tFXfWbUc3CFKz4XR1RC1dWPUbPfU6gcn5dYnVdEL07RHHfVJWx8yPXb3MXApNxNuN5X6
 bvaHOa4Og+p98Vwgh/ujf8eW6qsPl24=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-jOZpCXtPMdGuZbJWgaG57w-1; Wed, 22 Dec 2021 06:16:34 -0500
X-MC-Unique: jOZpCXtPMdGuZbJWgaG57w-1
Received: by mail-qk1-f198.google.com with SMTP id
 az44-20020a05620a172c00b0046a828b4684so1457156qkb.22
 for <linux-mediatek@lists.infradead.org>; Wed, 22 Dec 2021 03:16:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/vCKBX4ztR/l36gQ5MyV9nvdNnkC/8nxLd8Fi4Qr088=;
 b=6ITMAmhbmKjSVjaB5WW16npVe13yyeGsXCKj6nxlAYRCqFwv80CyKV/EyHgTWzNczR
 Nxc3jZjqQsorK2DzD1dwHFAc9Q55v/ZVGXV/IIPA1hOXhhI+GgLd8QXm8/KiRqCeUWYW
 BxBHDi6jPVewAjkg0z3hEndVe4fMqtHeQ21zy+X/n1IykayO9ccAIEXj5WevtoJT8fUW
 npP+yUeIRPsq6gbraLrYXUN4RHkDXOiH82fo6CDb1db0dFpUc5q1/jfNvBDzHf6x7tmN
 PgV3iftZ/xkj05iTKDhUm3Z4K3OU/sNQrPH4JNx90yVMu/7b5eqf/2e8Lr4zln7wWs8L
 2W8Q==
X-Gm-Message-State: AOAM5323FFuuTNOui8QOlsCSXUHKE3NxAryUdYXwrZJ+pz8NvDN3PHnE
 KioGqZkneI1kSxON8Y+cuuyGUeuenDhVfySCFTIjRS72xK4W7E/jZk/7Mlza21Cv8x3UCJqpaqf
 kWiMgse0VXIsHwkoYx3i/FJQYTdD1bM/O
X-Received: by 2002:a05:622a:19a3:: with SMTP id
 u35mr1078639qtc.303.1640171794158; 
 Wed, 22 Dec 2021 03:16:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw9nbq7aKZd3kohuuTe+I5dL9pVTLs8N1Hma9aa1hhv0rCqLy6tawJcGG7mJz2Q1h/poCUepQ==
X-Received: by 2002:a05:622a:19a3:: with SMTP id
 u35mr1078570qtc.303.1640171792935; 
 Wed, 22 Dec 2021 03:16:32 -0800 (PST)
Received: from localhost (net-93-146-37-237.cust.vodafonedsl.it.
 [93.146.37.237])
 by smtp.gmail.com with ESMTPSA id u16sm1462731qke.127.2021.12.22.03.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 03:16:32 -0800 (PST)
Date: Wed, 22 Dec 2021 12:16:29 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, Soul.Huang@mediatek.com, YN.Chen@mediatek.com,
 Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com,
 Mark-YW.Chen@mediatek.com, Deren.Wu@mediatek.com,
 km.lin@mediatek.com, jenhao.yang@mediatek.com,
 robin.chiu@mediatek.com, Eddie.Chen@mediatek.com,
 ch.yeh@mediatek.com, posh.sun@mediatek.com, ted.huang@mediatek.com,
 Eric.Liang@mediatek.com, Stella.Chang@mediatek.com,
 Tom.Chou@mediatek.com, steve.lee@mediatek.com, jsiuda@google.com,
 frankgor@google.com, jemele@google.com, abhishekpandit@google.com,
 shawnku@google.com, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mt76: sdio: lock sdio when it is needed
Message-ID: <YcMJDdDrDVIT0Y55@lore-desk>
References: <7aaf68bc8073c4f1cef063d1e0989e5402ac358c.1640151426.git.objelf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <7aaf68bc8073c4f1cef063d1e0989e5402ac358c.1640151426.git.objelf@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lorenzo.bianconi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_031638_889399_87FE31D4 
X-CRM114-Status: GOOD (  17.65  )
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
Content-Type: multipart/mixed; boundary="===============4474759673631482130=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============4474759673631482130==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QoOniBAhkIvv76Ai"
Content-Disposition: inline

--QoOniBAhkIvv76Ai
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> Acquire the SDIO as needed as possible because either MT7663S or MT7921S
> is a multiple-function device that always includes Bluetooth that would
> share with the same SDIO bus. So not to avoid breaking Bluetooth pairing,
> audio, and HID such kind of time critical application on that, we only
> lock sdio bus when it is necessary in WiFi driver.
>=20
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7615/sdio.c | 3 +++
>  drivers/net/wireless/mediatek/mt76/mt7921/sdio.c | 3 +++
>  drivers/net/wireless/mediatek/mt76/sdio_txrx.c   | 8 ++++++++
>  3 files changed, 14 insertions(+)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c b/drivers/n=
et/wireless/mediatek/mt76/mt7615/sdio.c
> index 31c4a76b7f91..71162befdae8 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c
> @@ -56,7 +56,10 @@ static int mt7663s_parse_intr(struct mt76_dev *dev, st=
ruct mt76s_intr *intr)
>  =09struct mt7663s_intr *irq_data =3D sdio->intr_data;
>  =09int i, err;
> =20
> +=09sdio_claim_host(sdio->func);
>  =09err =3D sdio_readsb(sdio->func, irq_data, MCR_WHISR, sizeof(*irq_data=
));
> +=09sdio_release_host(sdio->func);

I guess you can move this in mt76s_rx_handler() and remove the duplicated c=
ode
in mt7921_sdio.c

Regards,
Lorenzo

> +
>  =09if (err)
>  =09=09return err;
> =20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c b/drivers/n=
et/wireless/mediatek/mt76/mt7921/sdio.c
> index 65d693902c22..743b63f66efa 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
> @@ -58,7 +58,10 @@ static int mt7921s_parse_intr(struct mt76_dev *dev, st=
ruct mt76s_intr *intr)
>  =09struct mt7921_sdio_intr *irq_data =3D sdio->intr_data;
>  =09int i, err;
> =20
> +=09sdio_claim_host(sdio->func);
>  =09err =3D sdio_readsb(sdio->func, irq_data, MCR_WHISR, sizeof(*irq_data=
));
> +=09sdio_release_host(sdio->func);
> +
>  =09if (err < 0)
>  =09=09return err;
> =20
> diff --git a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c b/drivers/net=
/wireless/mediatek/mt76/sdio_txrx.c
> index 801590a0a334..f2b46975d831 100644
> --- a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
> +++ b/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
> @@ -102,7 +102,10 @@ mt76s_rx_run_queue(struct mt76_dev *dev, enum mt76_r=
xq_id qid,
> =20
>  =09buf =3D page_address(page);
> =20
> +=09sdio_claim_host(sdio->func);
>  =09err =3D sdio_readsb(sdio->func, buf, MCR_WRDR(qid), len);
> +=09sdio_release_host(sdio->func);
> +
>  =09if (err < 0) {
>  =09=09dev_err(dev->dev, "sdio read data failed:%d\n", err);
>  =09=09put_page(page);
> @@ -214,7 +217,10 @@ static int __mt76s_xmit_queue(struct mt76_dev *dev, =
u8 *data, int len)
>  =09if (len > sdio->func->cur_blksize)
>  =09=09len =3D roundup(len, sdio->func->cur_blksize);
> =20
> +=09sdio_claim_host(sdio->func);
>  =09err =3D sdio_writesb(sdio->func, MCR_WTDR1, data, len);
> +=09sdio_release_host(sdio->func);
> +
>  =09if (err)
>  =09=09dev_err(dev->dev, "sdio write failed: %d\n", err);
> =20
> @@ -298,6 +304,7 @@ void mt76s_txrx_worker(struct mt76_sdio *sdio)
>  =09/* disable interrupt */
>  =09sdio_claim_host(sdio->func);
>  =09sdio_writel(sdio->func, WHLPCR_INT_EN_CLR, MCR_WHLPCR, NULL);
> +=09sdio_release_host(sdio->func);
> =20
>  =09do {
>  =09=09nframes =3D 0;
> @@ -327,6 +334,7 @@ void mt76s_txrx_worker(struct mt76_sdio *sdio)
>  =09} while (nframes > 0);
> =20
>  =09/* enable interrupt */
> +=09sdio_claim_host(sdio->func);
>  =09sdio_writel(sdio->func, WHLPCR_INT_EN_SET, MCR_WHLPCR, NULL);
>  =09sdio_release_host(sdio->func);
>  }
> --=20
> 2.25.1
>=20

--QoOniBAhkIvv76Ai
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYcMJDQAKCRA6cBh0uS2t
rNBHAP90xJ+Mada+OCDe3sgAR7bOZEJiGQbcCDVAyv0qDwuBdwD7B2xzkTpTv7Tk
p/MUb4rB7hR+2QQQfaJbmPXIH3Jd6QQ=
=J2gf
-----END PGP SIGNATURE-----

--QoOniBAhkIvv76Ai--



--===============4474759673631482130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4474759673631482130==--


