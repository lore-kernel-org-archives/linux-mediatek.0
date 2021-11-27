Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6FAC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Nov 2021 14:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JHQ6Ti23U+Gs4rrFpV9BUwo7hwM52OM9dbyaGAVZAt8=; b=xvf0+FuFOLJ/pEz/fQX18nOkHy
	uENt5jQetoHBKVtCwdzapVlC+Cn2ro41+s1bhcPY/9vuEeTrD3ZHKVvgdQvluE4CZdeqFhMCY+7Yd
	0e+jWTDkS58ZYFNfdNw0RZen1zrNl8r/jyPpd+CPG/9RBdlV0pXb1NtASQ0wacgU7EAzcZlgkB4n1
	S1/xGL8rkwwYowpdpwmAjevQQIXojqgp9G4Z32mBx5khcpSXlzEJjN7url0HtvOfcEzknDg9n8oH4
	BHjIL98/nvfgrsqmo26DesiSujv9JgI3ldjmyZgg7j7EbXuN2/nThq3sYMrfIyPoj+TnfhcSjB7N8
	y7jK+UGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqyvX-00DppX-8J; Sat, 27 Nov 2021 14:43:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqyvU-00Dpp9-Mg
 for linux-mediatek@lists.infradead.org; Sat, 27 Nov 2021 14:43:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638024216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=51Zf5uatGgyB8agNKksvxXpLiJzCxzX6VNddpf1DJYY=;
 b=Tdq0uWKIvj3I8wX3YLPDkOY/bDH3n+Ez9/aTGH5GaLVuHeSdRhWoX0A0Zg8701QPE7JoOk
 TD+rBOlbRsfJEGuzosdWJnaD8YJNXt/pd80mvwQc9vrmKccypWgGuFyRIE89ybHY8vjrkM
 lAgim92A5IVodCyfTX53ZalubuZ8Bok=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-171-5PZbb8mgOXSSl-POd8ZI5A-1; Sat, 27 Nov 2021 09:43:35 -0500
X-MC-Unique: 5PZbb8mgOXSSl-POd8ZI5A-1
Received: by mail-ed1-f71.google.com with SMTP id
 a3-20020a05640213c300b003e7d12bb925so10143721edx.9
 for <linux-mediatek@lists.infradead.org>; Sat, 27 Nov 2021 06:43:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HYMhhSR1YoRrVgQhjjHCLmb5AD8hUPl6l2sqPb0+yok=;
 b=AnKbo+5xD0vN7QxUcmBeyBUbLp7eUkmJ6gOywuxccpeu3Eic/jee/pMT4RCgA44q89
 IM01gBpBlFhchWFRJaWrsZHmfsXI+rTJmLHK20qQDyZe27xK4dWMSG9jj0C9aik4Wq5I
 vyR+s9UBSxzW4+/vdE9grHXYoAGnIQ9LqkRAiZN4kKOLxpamKGh0nxrLFBWS04CE4iYh
 ziEQC4NYNLuVcZ8xMAKLsDqCMMiQIm51BpS5sNVXHncknaYqGVr8pT+rfM4YRyOjr0W7
 ZlUZvDglWs0K1FHCNDkVuEJZz4gH8iAHxp6ozIXKykSM1NsKVU4WU5HuVxJ+rnkSwiG7
 MlVA==
X-Gm-Message-State: AOAM5320v4aatS5UKyYbKiV7qAup1hbseUNuyl7afKYl2960a1ERba5b
 guBQC3puC7WZXVWtwb02VSqJYDFLNS1mbsQ6YG0oZjOS/IAzIfAfag9Z+vwldG1q5E9xCgbVQ4y
 a7Uf5aRKTDl5sNtoC13xiD/z6zCffXO4R
X-Received: by 2002:a05:6402:270d:: with SMTP id
 y13mr56792018edd.362.1638024213974; 
 Sat, 27 Nov 2021 06:43:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJySR0iTOiJpZdNLbJGIwVZczX8xknIU8gOmbM1qovIX9GeVb9xmpttQswURN4QHkgpESYk3BA==
X-Received: by 2002:a05:6402:270d:: with SMTP id
 y13mr56792003edd.362.1638024213824; 
 Sat, 27 Nov 2021 06:43:33 -0800 (PST)
Received: from localhost (net-93-151-197-210.cust.vodafonedsl.it.
 [93.151.197.210])
 by smtp.gmail.com with ESMTPSA id r3sm4536270ejr.79.2021.11.27.06.43.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Nov 2021 06:43:33 -0800 (PST)
Date: Sat, 27 Nov 2021 15:43:31 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Deren Wu <deren.wu@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] mt76: mt7921: use correct iftype data on 6GHz cap init
Message-ID: <YaJEE0gKhZvtBs6n@lore-desk>
References: <20211126165316.1662-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20211126165316.1662-1-shayne.chen@mediatek.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lorenzo.bianconi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211127_064340_982679_107ED55D 
X-CRM114-Status: GOOD (  15.05  )
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
Content-Type: multipart/mixed; boundary="===============4674674276906004123=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============4674674276906004123==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zUJr3aSWbgXhvFft"
Content-Disposition: inline

--zUJr3aSWbgXhvFft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Set 6GHz cap to iftype data which is matched to the type of
> current interface.

In this case data points to data[idx] since mt7921 supports just
NL80211_IFTYPE_STATION (please note idx =3D 0 and idx !=3D i).
Anyway this can be an issue in the future when we will add more vif_type.
Maybe we can drop Fixes tag, not sure. Anyway:

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

>=20
> Fixes: 50ac15a511e3 ("mt76: mt7921: add 6GHz support")
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7921/main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7921/main.c
> index 5a64126..5540b2d 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> @@ -178,7 +178,7 @@ mt7921_init_he_caps(struct mt7921_phy *phy, enum nl80=
211_band band,
>  =09=09=09if (vht_cap->cap & IEEE80211_VHT_CAP_RX_ANTENNA_PATTERN)
>  =09=09=09=09cap |=3D IEEE80211_HE_6GHZ_CAP_RX_ANTPAT_CONS;
> =20
> -=09=09=09data->he_6ghz_capa.capa =3D cpu_to_le16(cap);
> +=09=09=09data[idx].he_6ghz_capa.capa =3D cpu_to_le16(cap);
>  =09=09}
>  =09=09idx++;
>  =09}
> --=20
> 2.25.1
>=20

--zUJr3aSWbgXhvFft
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYaJEEwAKCRA6cBh0uS2t
rOIVAP9Igd1KDjdhJHQHIReTFXMdhNhWSVpGQFZXXzNLDCAFOgD+NVNS9h1ulTfi
LPxg4eCrt+xRDAzpwn5R458JiIuzdwI=
=EMib
-----END PGP SIGNATURE-----

--zUJr3aSWbgXhvFft--



--===============4674674276906004123==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4674674276906004123==--


