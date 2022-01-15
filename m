Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0D5C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Jan 2022 00:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=448FxfAM/coGwmy8RUWI7GKRZhrmFXpW0XzCSllpFGE=; b=14GpH9PWGetUEH8d39rdb1ZV3r
	Tl42GrBx5Nv2AR+Ng1pQoADhQB7kCYPC4znzRLxW/3/kOKV89/EoSYSkPQj+7o4J9HN+bkqJbjONy
	lIKiiLZvvxMXl3TlJUiF8SGpoOM2RgUJsICHgXZy7Dp4+hib0i39onCyeVBTbOgejfcylDFviFve7
	DJHnmvXnEYEBITH/xLnMk/thQxaqNxXF6jtzXQUjRZBOIZy2NwYdnyf4siFiUcJGucJ+iYufcd6Vv
	zSJAEtE5BaxzeG2rO1jlf96ydAAg9h4O297kRJ0x/nGEwjeNG05dRUURsPBkIsMvEGYiWjk/XFmdb
	LY/8I8fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8Wpv-00AUlE-1x; Sat, 15 Jan 2022 00:22:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8Wps-00AUkQ-8Y
 for linux-mediatek@lists.infradead.org; Sat, 15 Jan 2022 00:22:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642206143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2Odg0gG3lpsaGROxvBX3P3hmedT2uds6YzOkytf6LEA=;
 b=KazOQCbYsxD6mzzDDDpGWF4psQmNDREndFn5vxhoD7c3dBdctqdciT3+xirotybrnjGwnJ
 +yjUbBj1hKER+VrXF9YxFCD0txn1tUQ2NDBxdJxDT7UUA8gtykiwDEBTnNhovuVmRihS+0
 g1sM6z2M81NR/qb7XwGlwFT8X9yrW5o=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-c2c8Yd0oPDSnP61GyCtrkw-1; Fri, 14 Jan 2022 19:22:19 -0500
X-MC-Unique: c2c8Yd0oPDSnP61GyCtrkw-1
Received: by mail-ed1-f70.google.com with SMTP id
 z8-20020a056402274800b003f8580bfb99so9524203edd.11
 for <linux-mediatek@lists.infradead.org>; Fri, 14 Jan 2022 16:22:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IOTMjcsFlAXOs8F/XDJPlk4E5ciP5rKuxIodhPB+eOw=;
 b=wx4oq+zz9RgVSUGjpBhojlU63fy8E+xOoooFkDhh2w9PrjwDo4So2ptMT9yUK4I9Xr
 xlGwHbRVFJLnzOdXN7fPyGRAZ4f96En+85CqooQkZZus3G6PlRuSfNE0CEEWFeFJjKSH
 4FwXkMB09iU5zYyhhuVmSYLUAB1K/744JJIMztyfj8YaLBaWGDhU/q9ilu3dzhskNV7T
 VtGSrqo69QwaOz3y20xa1XEFtH9qrtxXiBjM3bH8KmRT1a3Hpwtkr7c2MNQbqzz6ug/M
 GVMOtxgMm93oddhvIqCfNfckl+F+osRRXx3wZ4DOAPqK5wcfBLrRCQbgKYGyVy3dedDy
 hoZQ==
X-Gm-Message-State: AOAM532GhKYjdsJAHEq2X0dWUt36bnQGf/riP6XBCADYQqtBJ3nzHXRx
 lgzK7FZBxrLu45r8o8gN6sH/HkKcieUAE18crNWv64X+Z5e7gdF8JM00SLRs2ud+GS7+RFK6+FQ
 7HBa17xCTcbJYCOcFqZmr0q/v5F1YaZbF
X-Received: by 2002:a17:906:5d12:: with SMTP id
 g18mr9100689ejt.524.1642206138482; 
 Fri, 14 Jan 2022 16:22:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwHbUuP9yCC0Syz/FEFHdMn3EIDMrhDwVbKAhmAz8WLt/qVA9am2nzcPig3xq9CWbl/ECeTBQ==
X-Received: by 2002:a17:906:5d12:: with SMTP id
 g18mr9100673ejt.524.1642206138315; 
 Fri, 14 Jan 2022 16:22:18 -0800 (PST)
Received: from localhost (net-93-146-37-237.cust.vodafonedsl.it.
 [93.146.37.237])
 by smtp.gmail.com with ESMTPSA id e16sm2821140edu.15.2022.01.14.16.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 16:22:17 -0800 (PST)
Date: Sat, 15 Jan 2022 01:22:15 +0100
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
Subject: Re: [PATCH v2 2/2] mt76: mt7921s: run sleep mode by default
Message-ID: <YeITtw2P89PN0nh8@lore-desk>
References: <c09673a115c39f7af692efb984a5dc0c75238a64.1642204233.git.objelf@gmail.com>
 <ddbc5499b76989c7d67fcbc31eb19ff535156dfa.1642204233.git.objelf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <ddbc5499b76989c7d67fcbc31eb19ff535156dfa.1642204233.git.objelf@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lorenzo.bianconi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_162224_402177_985DC437 
X-CRM114-Status: GOOD (  15.10  )
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
Content-Type: multipart/mixed; boundary="===============8288785848924065963=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============8288785848924065963==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3ZxKOMiV+WaUfZ/B"
Content-Disposition: inline

--3ZxKOMiV+WaUfZ/B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 15, Sean Wang wrote:
> From: Sean Wang <sean.wang@mediatek.com>
>=20
> Apply sleep mode by default to reduce power consumption as possible.

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

>=20
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
> v1 -> v2: rebase on the top of
> =09  ("mt76: mt7921: toggle runtime-pm adding a monitor vif")
> ---
>  drivers/net/wireless/mediatek/mt76/mt7921/init.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/n=
et/wireless/mediatek/mt76/mt7921/init.c
> index 6059d8a0f227..fa6af85bba7b 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> @@ -226,14 +226,10 @@ int mt7921_register_device(struct mt7921_dev *dev)
>  =09dev->pm.idle_timeout =3D MT7921_PM_TIMEOUT;
>  =09dev->pm.stats.last_wake_event =3D jiffies;
>  =09dev->pm.stats.last_doze_event =3D jiffies;
> -
> -=09/* TODO: mt7921s run sleep mode on default  */
> -=09if (mt76_is_mmio(&dev->mt76)) {
> -=09=09dev->pm.enable_user =3D true;
> -=09=09dev->pm.enable =3D true;
> -=09=09dev->pm.ds_enable_user =3D true;
> -=09=09dev->pm.ds_enable =3D true;
> -=09}
> +=09dev->pm.enable_user =3D true;
> +=09dev->pm.enable =3D true;
> +=09dev->pm.ds_enable_user =3D true;
> +=09dev->pm.ds_enable =3D true;
> =20
>  =09if (mt76_is_sdio(&dev->mt76))
>  =09=09hw->extra_tx_headroom +=3D MT_SDIO_TXD_SIZE + MT_SDIO_HDR_SIZE;
> --=20
> 2.25.1
>=20

--3ZxKOMiV+WaUfZ/B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYeITtwAKCRA6cBh0uS2t
rOMJAQDBplG0yTmRNOJh8aKzzetqboDPc3/i787qyVAhD/7pLQD8D4vV5TPSFZ9x
12jADQqQ6c9U0UgvJHAADexQfbIs8QE=
=dm9T
-----END PGP SIGNATURE-----

--3ZxKOMiV+WaUfZ/B--



--===============8288785848924065963==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8288785848924065963==--


