Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E18DCCFA18
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Nov 2025 14:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IdnpZzH2MO66v3/AbgjJrFurWYIm5SGsHKI6OU+wKrs=; b=deJ0ugfhuxV8cOpwQMUEvwC0xV
	6zoROP/8sousDlMRxFAzHRKjzIUHmVtAWbuFtiwT9Dc7px+Eu32pN/znRvrwfCNM+aC+LPnFrqKmW
	7fjmavVFvi4/mY2bebRw0EKBJwwNfyLBKVvqyj7IS/Ggib4RBDpmM9OTr88jkMUxsGCAaeQOWJlHQ
	FcI3UeEN6Ix4auMKI1VQ4wfNivNqncPFi9eBX2rQyTM9iMrotO8uTFKO/LGlhtyQYBoGpufp7Kphs
	7rB38hVLyzV1akxaMCm5XIbhFC8GDDoUIrNlPqldmsfd3mv7YcMZTy+pERdjWRWYGjZu8YO+Ncy17
	A+4yDZCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIouu-00000007HF4-2LUI;
	Tue, 11 Nov 2025 14:00:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIout-00000007HEl-3Dwu
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Nov 2025 14:00:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D16D160225;
	Tue, 11 Nov 2025 14:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECF0FC4CEF5;
	Tue, 11 Nov 2025 14:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762869613;
	bh=pKGxohOsLQcLsOLtFArzxf1WdF08CEmoONSvXjw76To=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oib/AhSC+LENxt8l6cfvQXi0qe80vMq1BhrYRxNQbXErF+crW6yJqXAhNpM1///Uz
	 HlPs27FoW2v5V53Fq2sjR5VQejrwefP8RtU42ti9vYEa2rLxPgIfPE7ANItwOm83cq
	 Tw7/Ou2UnC5MPPX7juv5eZLEHdM34Sq1UH9P4gJodqwEwYn3uBgB+qPbd0BImwAbFm
	 2f/DT0v3SsWwu51mTIFjFyzo3VwMR98Q/ee9WysUTC4kKNMwZtouEJR3LtoBZ7qpar
	 /w1T3yW1hrCrjGmQFIkmVne2W9gRdc++8c+SSd84P9sXXbEXboEWjd8tPbmvuOavGb
	 Juu3kXKCzsjfw==
Date: Tue, 11 Nov 2025 15:00:10 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Nick Huang <sef1548@gmail.com>
Cc: nbd@nbd.name, ryder.lee@mediatek.com, shayne.chen@mediatek.com,
	sean.wang@mediatek.com, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mt76: connac: remove unused reserved field in gtk rekey
 TLV struct
Message-ID: <aRNBak9Xl_wsBJ6w@lore-desk>
References: <20251111134400.5258-1-sef1548@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3NAqLAM4O8sK+KAA"
Content-Disposition: inline
In-Reply-To: <20251111134400.5258-1-sef1548@gmail.com>
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


--3NAqLAM4O8sK+KAA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> The 'reserverd' field in struct mt76_connac_gtk_rekey_tlv was unused
> and misspelled. Removing it cleans up the structure definition and
> improves code readability.
>=20
> Signed-off-by: Nick Huang <sef1548@gmail.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drive=
rs/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> index 27daf4195..28cf46a5f 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> @@ -1681,7 +1681,6 @@ struct mt76_connac_gtk_rekey_tlv {
>  	__le32 group_cipher;
>  	__le32 key_mgmt; /* NONE-PSK-IEEE802.1X */
>  	__le32 mgmt_group_cipher;
> -	u8 reserverd[4];

This field is used to keep the struct size consistent with the fw one so it=
 is
expected to not be used.

Regards,
Lorenzo

>  } __packed;
> =20
>  #define MT76_CONNAC_WOW_MASK_MAX_LEN			16
> --=20
> 2.48.1
>=20

--3NAqLAM4O8sK+KAA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaRNBagAKCRA6cBh0uS2t
rA8XAP92QWJ628UHuby2jMHAqObl3TqsYz3L5+Sblh+15y/FRQEAsXhgZSpVvlhm
LMdSaMTBNy4ja/h10Tz9E+eYjURNTgc=
=pcBD
-----END PGP SIGNATURE-----

--3NAqLAM4O8sK+KAA--

