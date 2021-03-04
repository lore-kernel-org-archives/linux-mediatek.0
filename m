Return-Path: <SRS0=K2BI=IC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 885D8C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Mar 2021 13:40:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FB9D64F41
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Mar 2021 13:40:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FB9D64F41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O30+gTiD8JOpj/m7jtS5zquuMpdeN5XIN1HT68kCfoU=; b=q5qHpZYsHlAtosNViX5o7+UsD
	+eXETZdVNN/c5gz75fRuD/mbN9iTk6nMa86Vi59S9zQM8vJuR7CSWC5xbdMcwudnB/I8XUGGkq2wb
	vRIZFPK2pePeFrjSOYIUX6Inr4mWr23/sr/i6+EOdp1B/WkIRiLuJ470zNvc5pdpGaqQioGdIDWM2
	VRNQiOamq2FqVQaCajcz4nysye7vR9EwqcUJiihNtnjygLVCQumUcWJPPTQ/Nn2+V8Y/dIA7KoISG
	c47p2t7sQMwobl1FMIp1JwsUHKtOhV4tOlZ2l2t6DrNifRrSOgwgNacnYXBr2AWzcgtlE8OZk+PIr
	1DzmMeywg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHoD7-008mLm-0k; Thu, 04 Mar 2021 13:40:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHoD3-008mJo-12
 for linux-mediatek@lists.infradead.org; Thu, 04 Mar 2021 13:40:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614865203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ymvDs2Ilb3LuJSt/azAgm+MCtnBeUP7jc3j/YmcaRRQ=;
 b=Rqn1RSBMaJ7PeuUcogOL2K4nmpnPvqzvaxoGXlkOAaN9pxqaOcSh3UIG1SG8pbKMS5RKGp
 shScLdWV3J3HFkRCTjSL9xsAR+pOQYnzlo5Ax58F/uBhO21tGU0DhQ8Co6mOY6Tl7jI54E
 GmvtNih3+ydNwPKdplkcLdUwiDAUeQU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-sXCPNnfEM3mZCWMnn3RJ_Q-1; Thu, 04 Mar 2021 08:38:38 -0500
X-MC-Unique: sXCPNnfEM3mZCWMnn3RJ_Q-1
Received: by mail-ej1-f70.google.com with SMTP id m4so12115054ejc.14
 for <linux-mediatek@lists.infradead.org>; Thu, 04 Mar 2021 05:38:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Oiw/daA+qGj8KoGgNbsja8mLaNqMYW3y+9Hx03xilNY=;
 b=sEf4On90MZ/1xHydksx3zUlTD29OWpJUe+3Dhgy4Dr/ojltp2dILz2GlcTJooWZSIv
 FMtafLKj5qc/gknbWEfU5DYfyEefCPE5EnuSDcqIyTpI7XwB8v8wKvBYM8rHAzFRGFay
 fToWpyRukwTcAE7F1/b96qL+Drx3fdr3lwpJ3sxl3u+XcMhkcf1ofYBXdiN7ovgLUViB
 2jrqEL4iApQ5/9mE4kYnC1jWZEkI+XjE4orUXPYcutEjYuUjYxocf/xPZ6zAv1xLy4vK
 pc0/lMOvi4+caTksuwh/41gfbCXjyF4PeEg77Rba0p3FtFEA6fIh9kpyNuPemldMMkIm
 E46g==
X-Gm-Message-State: AOAM530J3BQwql4ckHXXEDsQ9w2HHh4Fm8Ak6qaM2anLMavzRqkP86Va
 I00ikeusAB+G4akZSlOE0pX3ELJ3FcJd3qfIaW+Fn4gH3MLR2aZxfRlDlNTK3GZzbzVg5su/FSK
 QQGJ23VVQ1WFM9epZKngUg6qqsTTkKtKM
X-Received: by 2002:a17:906:f88a:: with SMTP id
 lg10mr4363911ejb.39.1614865117665; 
 Thu, 04 Mar 2021 05:38:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxggMDSjQQFCKjj5w9R7gOyQG8g99FhdQswp5k69KW2fdMug7MAE6qUSw556i1kut2aBGX9cg==
X-Received: by 2002:a17:906:f88a:: with SMTP id
 lg10mr4363894ejb.39.1614865117479; 
 Thu, 04 Mar 2021 05:38:37 -0800 (PST)
Received: from localhost ([151.66.54.126])
 by smtp.gmail.com with ESMTPSA id mc10sm9780451ejb.56.2021.03.04.05.38.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 05:38:36 -0800 (PST)
Date: Thu, 4 Mar 2021 14:38:33 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] mt76: mt7663s: make all of packets 4-bytes aligned
 in sdio tx aggregation
Message-ID: <YEDi2VvIBEe7DRuY@lore-desk>
References: <801a2aa986f5486a0e789065feef7b77c612ea7b.1614863741.git.objelf@gmail.com>
 <8f6807d6161efbed6d585a2ca041d4b126b30451.1614863741.git.objelf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <8f6807d6161efbed6d585a2ca041d4b126b30451.1614863741.git.objelf@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lorenzo.bianconi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Content-Type: multipart/mixed; boundary="===============0690024663561577536=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============0690024663561577536==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9L+8xSSpwTrxyrty"
Content-Disposition: inline

--9L+8xSSpwTrxyrty
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> Each packet should be padded with the additional zero to become 4-bytes
> alignment in sdio tx aggregation.
>=20
> Fixes: 1522ff731f84 ("mt76: mt7663s: introduce sdio tx aggregation")
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7615/sdio_txrx.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/sdio_txrx.c b/driv=
ers/net/wireless/mediatek/mt76/mt7615/sdio_txrx.c
> index 9fb506f2ace6..2d3b7d1e2c92 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/sdio_txrx.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/sdio_txrx.c
> @@ -218,6 +218,7 @@ static int mt7663s_tx_run_queue(struct mt76_dev *dev,=
 struct mt76_queue *q)
>  =09int qid, err, nframes =3D 0, len =3D 0, pse_sz =3D 0, ple_sz =3D 0;
>  =09bool mcu =3D q =3D=3D dev->q_mcu[MT_MCUQ_WM];
>  =09struct mt76_sdio *sdio =3D &dev->sdio;
> +=09u8 pad;
> =20
>  =09qid =3D mcu ? ARRAY_SIZE(sdio->xmit_buf) - 1 : q->qid;
>  =09while (q->first !=3D q->head) {
> @@ -234,7 +235,8 @@ static int mt7663s_tx_run_queue(struct mt76_dev *dev,=
 struct mt76_queue *q)
>  =09=09=09goto next;
>  =09=09}
> =20
> -=09=09if (len + e->skb->len + 4 > MT76S_XMIT_BUF_SZ)
> +=09=09pad =3D roundup(e->skb->len, 4) - e->skb->len;
> +=09=09if (len + e->skb->len + pad + 4 > MT76S_XMIT_BUF_SZ)
>  =09=09=09break;
> =20
>  =09=09if (mt7663s_tx_pick_quota(sdio, mcu, e->buf_sz, &pse_sz,
> @@ -252,6 +254,9 @@ static int mt7663s_tx_run_queue(struct mt76_dev *dev,=
 struct mt76_queue *q)
>  =09=09=09len +=3D iter->len;
>  =09=09=09nframes++;
>  =09=09}
> +
> +=09=09memset(sdio->xmit_buf[qid] + len, 0, pad);
> +=09=09len +=3D pad;

maybe it is better to do something like:

=09=09if (unlikely(pad)) {
=09=09=09memset(sdio->xmit_buf[qid] + len, 0, pad);
=09=09=09len +=3D pad;
=09=09}

Regards,
Lorenzo

>  next:
>  =09=09q->first =3D (q->first + 1) % q->ndesc;
>  =09=09e->done =3D true;
> --=20
> 2.25.1

--9L+8xSSpwTrxyrty
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYEDi1wAKCRA6cBh0uS2t
rBOnAQCp0+5Oy1w/amImTdQwjIk8T+zQYy2ESYYTieRZJI1rDwEAnt+LOxc5buBv
aUfPeEt8StGvDJn/5WPLlwaswFFplgM=
=7B1A
-----END PGP SIGNATURE-----

--9L+8xSSpwTrxyrty--



--===============0690024663561577536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0690024663561577536==--


