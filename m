Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB25C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 23:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ou7f9nb4OS80JLV9gthxRtEelKGWsjb0mb3k/ou5dGs=; b=aHw/yC1Q3KZ2k/FS78m8OJ2A5s
	SNWlB3iVkgD2+1UdbH4mmIQ+4iOch+drUhUjDQQHPmHyaxsiNA5xSW2tkLrtZc/E4HV9QYJ8iKsXm
	AU1O0Xog0WhQ4jQDh33G4VbGN6ZJrqVr52D8gX5qtZSBMVfS53Xt6NGuVtwY90gSGl1UIZVtAaEiG
	EjzweDyuANx79BmcMB8Y9vDxWiJK5MAJZeak7KRzGXJfeNj1kMvN4DmmW4y5Xa3Ki7CZQjwNeH5i5
	7Q+Dkk164YDB5tzAy3UuqbnSoDr9iyUk4KmzNHN7ZMD2NpoGk1consMyC3YeTeooJlqoRLJc12+3m
	Zvv2durg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHa0s-00Fo6i-Ht; Tue, 08 Feb 2022 23:35:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHa0l-00Fo66-V4
 for linux-mediatek@lists.infradead.org; Tue, 08 Feb 2022 23:35:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644363299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a+I41qsZkl0PaJEbp3TN1sQ8oZRm8zfem4Tt0Ceohbk=;
 b=BU4fdRVFUMpYvqezy7H/qivtieBpxdw7BlpFYfTQIeJVuFzpHUXwyD2vxnUx0wrsnzUB/c
 CbS9usfvQ1sbTACpbZ1+kfsFeYUbinR+WlPCpimevYhXMp5zBlrPuuTWIVghlYn1ghcR4x
 hmLZVpmESw8l3Kk7LOuHKW6dE9Ia9vg=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-311-594VqULOO32Ija4fuKgW2A-1; Tue, 08 Feb 2022 18:34:58 -0500
X-MC-Unique: 594VqULOO32Ija4fuKgW2A-1
Received: by mail-qv1-f69.google.com with SMTP id
 gg10-20020a056214252a00b0041eeb1c2684so388907qvb.21
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Feb 2022 15:34:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=a+I41qsZkl0PaJEbp3TN1sQ8oZRm8zfem4Tt0Ceohbk=;
 b=l7ZoQMWejSpomOiDp4LILNgT2GAmxjrPm3HFzgU2SUDoVxGpjeKJdnaHCNopMJv4mi
 sj2rbWuumKYn1AELOcoqKp4ZsISeexeVZmofLHM6Vea/J0RYp08JQ0G3Z/ApOsfW9Kq7
 ZYC5E2YHPheP/XQ20+GaRkYS4nHGaDgTHIrKITbexRQNQRAk9zRgMN9wkvQZXZKC7+0d
 lB5ClncwzuBjopFntMK+pOEaX9zNlchlsO0zlQKM2IPj9xJFVQBHTxqn44HwhJAAK6cG
 hWViLFQov5e8u6fCc92bEKMX+c/oWGelc0Sgq+wHdHtCFN371NKKdPNt2/ezNeSXF/O9
 1JEg==
X-Gm-Message-State: AOAM533Y0J7XczXHqNdBbh+Nu4b2JV7Z1iEcOKlm8f4N7x8SfQhUeccI
 uld7OcOiDMb7myEGVQaxcmQNrG52B35iPer+AO+A3sXDQXYTJ6HW/ZuNNtKotp/Dl5W29Rl5Cmy
 gbaBkPWCu32yL7lWuygML1WKjwVSZ94zb
X-Received: by 2002:ac8:5c05:: with SMTP id i5mr4804252qti.203.1644363297873; 
 Tue, 08 Feb 2022 15:34:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzIQOYL6OThcuTnYuatMPZNhHNRL0gGT8+y/VK/tKt8+dlsJWe3UCkvoCzvN8e/9tsEDRQhzQ==
X-Received: by 2002:ac8:5c05:: with SMTP id i5mr4804226qti.203.1644363297626; 
 Tue, 08 Feb 2022 15:34:57 -0800 (PST)
Received: from localhost (net-37-182-17-113.cust.vodafonedsl.it.
 [37.182.17.113])
 by smtp.gmail.com with ESMTPSA id w5sm7643883qko.34.2022.02.08.15.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 15:34:57 -0800 (PST)
Date: Wed, 9 Feb 2022 00:34:53 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: Deren Wu <Deren.Wu@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
 Soul Huang <Soul.Huang@mediatek.com>,
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>,
 Eric-SY Chang <Eric-SY.Chang@mediatek.com>,
 KM Lin <km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>,
 CH Yeh <ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>,
 Eric Liang <Eric.Liang@mediatek.com>,
 Stella Chang <Stella.Chang@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] mt76: mt7921s: fix missing fc type/sub-type for 802.11
 pkts
Message-ID: <YgL+HfN/xaiA40yc@lore-desk>
References: <33dd8e4b7f7f72d191e8eca88b33b32dbf2595d2.1644313224.git.deren.wu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <33dd8e4b7f7f72d191e8eca88b33b32dbf2595d2.1644313224.git.deren.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_153504_128491_26A417E9 
X-CRM114-Status: GOOD (  17.84  )
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
Content-Type: multipart/mixed; boundary="===============8748199118570767017=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8748199118570767017==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="P2x5gIiIgqgcIJtH"
Content-Disposition: inline


--P2x5gIiIgqgcIJtH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Deren Wu <deren.wu@mediatek.com>
>=20
> For non-mmio devices, should set fc values to proper txwi config
>=20
> Fixes: 48fab5bbef40 ("mt76: mt7921: introduce mt7921s support")
> Co-developed-by: Leon Yen <Leon.Yen@mediatek.com>
> Signed-off-by: Leon Yen <Leon.Yen@mediatek.com>
> Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7921/mac.c | 13 ++++++++++---
>  drivers/net/wireless/mediatek/mt76/mt7921/mac.h |  3 +++
>  2 files changed, 13 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/mac.c
> index d17558349a17..e403f0225b77 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
> @@ -852,6 +852,7 @@ mt7921_mac_write_txwi_80211(struct mt7921_dev *dev, _=
_le32 *txwi,
>  	__le16 fc =3D hdr->frame_control;
>  	u8 fc_type, fc_stype;
>  	u32 val;
> +	bool is_mmio =3D mt76_is_mmio(&dev->mt76);
> =20
>  	if (ieee80211_is_action(fc) &&
>  	    mgmt->u.action.category =3D=3D WLAN_CATEGORY_BACK &&
> @@ -912,9 +913,15 @@ mt7921_mac_write_txwi_80211(struct mt7921_dev *dev, =
__le32 *txwi,
>  		txwi[3] |=3D cpu_to_le32(val);
>  	}
> =20
> -	val =3D FIELD_PREP(MT_TXD7_TYPE, fc_type) |
> -	      FIELD_PREP(MT_TXD7_SUB_TYPE, fc_stype);
> -	txwi[7] |=3D cpu_to_le32(val);
> +	if (is_mmio) {

Nit: we do need is_mmio variable since it is used just here.

Regards,
Lorenzo

> +		val =3D FIELD_PREP(MT_TXD7_TYPE, fc_type) |
> +		      FIELD_PREP(MT_TXD7_SUB_TYPE, fc_stype);
> +		txwi[7] |=3D cpu_to_le32(val);
> +	} else {
> +		val =3D FIELD_PREP(MT_TXD8_L_TYPE, fc_type) |
> +		      FIELD_PREP(MT_TXD8_L_SUB_TYPE, fc_stype);
> +		txwi[8] |=3D cpu_to_le32(val);
> +	}
>  }
> =20
>  void mt7921_mac_write_txwi(struct mt7921_dev *dev, __le32 *txwi,
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.h b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/mac.h
> index 544a1c33126a..12e1cf8abe6e 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.h
> @@ -284,6 +284,9 @@ enum tx_mcu_port_q_idx {
>  #define MT_TXD7_HW_AMSDU		BIT(10)
>  #define MT_TXD7_TX_TIME			GENMASK(9, 0)
> =20
> +#define MT_TXD8_L_TYPE			GENMASK(5, 4)
> +#define MT_TXD8_L_SUB_TYPE		GENMASK(3, 0)
> +
>  #define MT_TX_RATE_STBC			BIT(13)
>  #define MT_TX_RATE_NSS			GENMASK(12, 10)
>  #define MT_TX_RATE_MODE			GENMASK(9, 6)
> --=20
> 2.18.0
>=20

--P2x5gIiIgqgcIJtH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYgL+HAAKCRA6cBh0uS2t
rCpMAQDjdD09xNnp1MIirN/vL82VYSpTLDbLqXqkMq7L/KXZNgEA1bXQFBwVuLPz
0u93drRn7ueCcLOpx4HTmDZGqDbjWAw=
=oeMk
-----END PGP SIGNATURE-----

--P2x5gIiIgqgcIJtH--



--===============8748199118570767017==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8748199118570767017==--


