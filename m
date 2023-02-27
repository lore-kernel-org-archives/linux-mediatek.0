Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962BFC64ED8
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Feb 2023 13:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f/FzhhKEtTgugR/y3mXLSjzn0vLNSjQZIOnSkH/KjvI=; b=o/yWbhGyXNR4O1N+wg1K5Ad/TZ
	CYATZQxRGq5kYbQP6CYLADP1MJKPGtsmPh1h3yCJPCcab3ekxoiP1dJUJiniCAjmArl4duzyy6rpz
	c8JqYXs8+jiq6ZqTl2p/qM8zYjJ4JA0/9OIKE08NbMItCsH1E3RLHy+aoFToP0BpqccJUC3khPM/j
	rkE6olFGpiI97UenBqsYkhQYUlzldEzkkH/oMtmUP+uu2ZBMY3V1zcO9NQsNQnHK78iuT/sJEaBwu
	D2XjQLahFPGQkddv+efSVRoGfE8gQAu4PfqZhDCt8kQ7bPAi8ZWn4jR5AaZtH0uaBu3OxLsKZ0qN0
	ncBM/UNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWdet-009mOb-JT; Mon, 27 Feb 2023 13:35:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWdeh-009mKj-8D
	for linux-mediatek@lists.infradead.org; Mon, 27 Feb 2023 13:35:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677504900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f/FzhhKEtTgugR/y3mXLSjzn0vLNSjQZIOnSkH/KjvI=;
	b=dIBljA3+YDw9bv2Rz1xiINT0NFqTOguoXzLwDTN/J0ckvlj/Q8BFTTtR86AOf2YNDqKdqe
	u31n4cxa6/V0XukDLAt1z+IxTPVVx2aACqc1A0KRbwlqCILKeDwpGHcm0Wo435IlHZg6bU
	E8Z3j05ftxLD25q9gn5Y1whFkmSwOk8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-614-WCiAAXKLPOC5t-VZNSOVDQ-1; Mon, 27 Feb 2023 08:33:19 -0500
X-MC-Unique: WCiAAXKLPOC5t-VZNSOVDQ-1
Received: by mail-wr1-f71.google.com with SMTP id n4-20020a5d5984000000b002c3b562d76cso857749wri.12
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Feb 2023 05:33:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/FzhhKEtTgugR/y3mXLSjzn0vLNSjQZIOnSkH/KjvI=;
        b=OD6EJ/EM5Hc12qM6KavVtssXleRwgktSzFn1n8VfcR4E4NN0xnF10OsudHhp2ZAFHq
         yvtjw+r52mdfgd8VK76p5zjVyHcXL4A48xcJ1QcMZ1T8Ovp9RFxsiwVho78b2FI6kzk8
         CaGZlFx5Wce17OlFjJZAZPvjQbTTE7agIv161CeqWmjPnEK8Y8bQBXX9YrtEDswaUByZ
         AJDrRt/3wOSjE0LiPT1arQ2gqIDH26244scrGEsPyxPVH8vuLn08Oc0R6immm0oDCTHV
         oSqP/fy97SphXcuDACL9sRVM3p2Hdvq8gwH498uUqCCeMu7adXIBxP8Yj1FsLHsUz6NO
         9bIg==
X-Gm-Message-State: AO0yUKWpsTqey/STS/Xu3ePNKCkyqchoJtYHniHWpivExpPrTLCURyg5
	BzrvqySb2Jr7GYVM9CPYbNbNozWpbAYT6H22GczOiIQ6hzcRyNNCJ1zugfutw2ZgszTovi+BRM1
	5X9S3yq+RR5PbbO77QILftZKkkOahiaD3
X-Received: by 2002:a5d:4a01:0:b0:2c5:530d:4045 with SMTP id m1-20020a5d4a01000000b002c5530d4045mr22440798wrq.20.1677504796251;
        Mon, 27 Feb 2023 05:33:16 -0800 (PST)
X-Google-Smtp-Source: AK7set/Yz/Rv4CK4NnI11VoX+Rldy1Xt3bEfcajvfM5UFjwwMM3KQIUevlYVIj9yyeSBZmQssT/Hiw==
X-Received: by 2002:a5d:4a01:0:b0:2c5:530d:4045 with SMTP id m1-20020a5d4a01000000b002c5530d4045mr22440777wrq.20.1677504795917;
        Mon, 27 Feb 2023 05:33:15 -0800 (PST)
Received: from localhost (net-188-216-77-84.cust.vodafonedsl.it. [188.216.77.84])
        by smtp.gmail.com with ESMTPSA id p1-20020a056000018100b002c54fb024b2sm7198843wrx.61.2023.02.27.05.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 05:33:14 -0800 (PST)
Date: Mon, 27 Feb 2023 14:33:12 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: Kang Chen <void0red@gmail.com>
Cc: shayne.chen@mediatek.com, sean.wang@mediatek.com, kvalo@kernel.org,
	nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] wifi: mt76: add a check of vzalloc in
 mt7615_coredump_work
Message-ID: <Y/yxGMvBbMGiehC6@lore-desk>
References: <20230227115717.3360755-1-void0red@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ifWNKEdM2/arQ3c2"
Content-Disposition: inline
In-Reply-To: <20230227115717.3360755-1-void0red@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_053503_466211_255EEC65 
X-CRM114-Status: GOOD (  15.98  )
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


--ifWNKEdM2/arQ3c2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> vzalloc may fails, dump might be null and will cause
> illegal address access later.

can you please add a Fixes tag?

Regards,
Lorenzo

>=20
> Signed-off-by: Kang Chen <void0red@gmail.com>
> ---
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

--ifWNKEdM2/arQ3c2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY/yxGAAKCRA6cBh0uS2t
rLjcAP0QtrGC6pC4wqyPa3TdGMOKu6ih0Dlbdf4hC0hL6+BYTAEAxEIcRy+wsaR6
kT/4qA1YwxG1EmeDzGEy+PPTPp/NZAA=
=x8oL
-----END PGP SIGNATURE-----

--ifWNKEdM2/arQ3c2--


