Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586F2C64ED6
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Feb 2023 14:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aFTvFQ3q5aWSqvyw9AelhhhkIt6I0O9TBRHfypnLJlQ=; b=LFgAHLCfDTfsVquastdZrNkqAt
	mtgSnPD3miynv3U+kPhc2QwnU/QzRZJLZPg0tbUvgkYv/cBOmt6dNfvWtT18+tbLIqbItMhb5c5t+
	e/juLXAbdPmkqAKJv7YWhXXCPGcddBDFXYHqSU3+aQ3gL/OhYCvM4nITCnFSVzqCreinAJBAooYl5
	fJpqNcuifIfl7VGFRAdXaxRm9m16yJzUw2GW8bgDYrc4DJQ5DDYOc1Jgq+FtNRJ8BjpaEGaQtVtT1
	GMRKY20bipXHGRLDeCf6lVKLa8CvRA2w+jyyxDotbzwXTiOc7NdGZXwj2C7a1RUISdUFmRAP/x8ES
	lG1ZAMxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWe9l-009u7a-SO; Mon, 27 Feb 2023 14:07:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWe9j-009u6G-4i
	for linux-mediatek@lists.infradead.org; Mon, 27 Feb 2023 14:07:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677506825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aFTvFQ3q5aWSqvyw9AelhhhkIt6I0O9TBRHfypnLJlQ=;
	b=GEcndyobv9GWtT9DftMcqy+RVDZRHvLBaiVaAtQobRey6fEObKRbXNVtWyBX0Fp8xPS74b
	osEQO+vJJzJ4Oj1pLgA52/KFbxJIniJrjFvRFa6Qexk2VJbAm2SRLvMKi5kU8ZVFlN6rBb
	0mCfpP7j8wRb4gzwZgQjaWOWGiWnccw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-277-9-tHI4D8MxijkiE_V_U4jg-1; Mon, 27 Feb 2023 09:07:04 -0500
X-MC-Unique: 9-tHI4D8MxijkiE_V_U4jg-1
Received: by mail-wm1-f71.google.com with SMTP id s18-20020a7bc392000000b003deaf780ab6so2933211wmj.4
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Feb 2023 06:07:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFTvFQ3q5aWSqvyw9AelhhhkIt6I0O9TBRHfypnLJlQ=;
        b=DIz8ilkqhOblNKKV1gawjmEeePBwohBcNswp9k3DjAK2gkxtus0jtqk93G5CPXPl/M
         6VFmxJ47sjThfmAnnw1xmSQWTDOTFtOtEJ5dCaFP1oSKhbBFjRoARc/VPu1z7Jf/CFiq
         UBt27ouOxpnzJkkfx2dkXA2cTIVLSDVkJpUT/if4pEcBzo0GTY3L0atgmURbbBDPhuqx
         pkDy68pnHWycGZAodmSon3I4zONfGZkZGHSi+Of4r+CUXK9mYeaiLnMEoQk/L57npc/A
         QF9EkE5L39sB49r/COV5v8yMi4kvDqjJ7y0hrT8PNGx3ezY6UwEvAo5h381OLE6/JZ1P
         vA3Q==
X-Gm-Message-State: AO0yUKUoWabgCXnVQcrjY6paO9Ofvv9BB7fkfCeO8GmdV7osLRbPWcdh
	uGW9+A8U1tji3Lj70ir1zEj0uHtIN7Yva9/LEH6BQJP7ylMNM/Y7rzid8RC3e7mxrmquPSaMsbo
	cmbSXYZB/wcXA4rTmf5k9uXoz+JlRZbXVimHbpQ==
X-Received: by 2002:a5d:4f89:0:b0:2c7:1d70:561 with SMTP id d9-20020a5d4f89000000b002c71d700561mr9516583wru.45.1677506821180;
        Mon, 27 Feb 2023 06:07:01 -0800 (PST)
X-Google-Smtp-Source: AK7set9ec/Yueab8Bvk6eJi8LCRz4+aeuNEBluM/tCSwA288dNuu0Nq41jbKDNy7uFxhcbonKrPSew==
X-Received: by 2002:a5d:4f89:0:b0:2c7:1d70:561 with SMTP id d9-20020a5d4f89000000b002c71d700561mr9516553wru.45.1677506820885;
        Mon, 27 Feb 2023 06:07:00 -0800 (PST)
Received: from localhost (net-188-216-77-84.cust.vodafonedsl.it. [188.216.77.84])
        by smtp.gmail.com with ESMTPSA id g9-20020a056000118900b002c794495f6fsm6993704wrx.117.2023.02.27.06.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 06:07:00 -0800 (PST)
Date: Mon, 27 Feb 2023 15:06:58 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: void0red <void0red@gmail.com>
Cc: angelogioacchino.delregno@collabora.com, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, kvalo@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org,
	lorenzo@kernel.org, matthias.bgg@gmail.com, nbd@nbd.name,
	netdev@vger.kernel.org, pabeni@redhat.com, ryder.lee@mediatek.com,
	sean.wang@mediatek.com, shayne.chen@mediatek.com
Subject: Re: [PATCH v2] wifi: mt76: add a check of vzalloc in
 mt7615_coredump_work
Message-ID: <Y/y5Asxw3T3m4jCw@lore-desk>
References: <Y/yxGMvBbMGiehC6@lore-desk>
 <20230227135241.947052-1-void0red@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="suqa0cLxZu8I2O6i"
Content-Disposition: inline
In-Reply-To: <20230227135241.947052-1-void0red@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_060707_285605_A770A61C 
X-CRM114-Status: GOOD (  16.93  )
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


--suqa0cLxZu8I2O6i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Kang Chen <void0red@gmail.com>
>=20
> vzalloc may fails, dump might be null and will cause
> illegal address access later.
>=20
> Fixes: d2bf7959d9c0 ("mt76: mt7663: introduce coredump support")
> Signed-off-by: Kang Chen <void0red@gmail.com>
> ---
> v2 -> v1: add Fixes tag
>=20
>  drivers/net/wireless/mediatek/mt76/mt7615/mac.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7615/mac.c
> index a95602473..73d84c301 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
> @@ -2367,6 +2367,9 @@ void mt7615_coredump_work(struct work_struct *work)
>  	}
> =20
>  	dump =3D vzalloc(MT76_CONNAC_COREDUMP_SZ);
> +	if (!dump)
> +		return;
> +
>  	data =3D dump;
> =20
>  	while (true) {
> --=20
> 2.34.1
>=20

revieweing the code I guess the right approach would be the one used in
mt7921_coredump_work():
- free pending skbs
- not run dev_coredumpv()

What do you think?

Regards,
Lorenzo

--suqa0cLxZu8I2O6i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY/y5AgAKCRA6cBh0uS2t
rNvNAQChxct9I9hvxziffNgrIyEvdXvuQxbOt0yeiX8oblnPWwEA4qXx39acNsg6
Q0MSG7S8eufwOP2IXUXhOgXTb9tFZQw=
=ErB1
-----END PGP SIGNATURE-----

--suqa0cLxZu8I2O6i--


