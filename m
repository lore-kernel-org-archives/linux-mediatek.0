Return-Path: <SRS0=zq7C=LL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B00C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 13:52:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBFAA611BE
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 13:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBFAA611BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CPadMOqPoXAN5tkARmaFGuwpn4oPbOUGy0g14/WGJaU=; b=qZn6pH0NUehrkCDgzog+vCuhfd
	CXUw5AWtRg9jcd5px4TLi9aFCYxnzo7bemSSphpWRvrUk2suH9htD1HA6qOf9uWR2sk+5Udyhmkuo
	uTV21GLaD+pfYl5mcGSv2JM6WoXYHHEVGdnuNx7RFvV0yzGsGO0CqYMsOM9pP5+GbM59ZrdpRlKw/
	ZxJ0dqbQ7eryBaddOIjI6SrgknEryTsP+TizmUmU+ltx7EQ4cfX2GkhobUZL6B7s2p0yjr4evwmv1
	hFhZFQe0luhd/4kX4FkC7SXRUDj74T5tLZusHkVYcy+XouzXi/ktzthNM1ZB2axrzE4b74eSl+2Qx
	jH70T2lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltsRe-00AZY8-Qj; Thu, 17 Jun 2021 13:52:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltsRd-00AZX0-2F
 for linux-mediatek@lists.infradead.org; Thu, 17 Jun 2021 13:52:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623937950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=siRGjISMhdx9RdJ41spfgGj0ry4KXVsxcMe9o6bokH0=;
 b=FPS9G6BshEo1jJYO/LpZ9YPhCNBaID37fMZrPu6wN1cnuJ8jolWMnFyKZbMVPQdkPTJL5r
 3Y0IK5Tcta+XPnzRvCUNKOt+7ybqSxKWUmRkdDpPm3Tnt/1i8dEzeDSz2ZL/ePTlKDJ6Ui
 lF1YNvOKkqdv9ckGrS54oAhl9DlNgvE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-ZpKYX4vyNBqFsyXiLEf6Yg-1; Thu, 17 Jun 2021 09:52:26 -0400
X-MC-Unique: ZpKYX4vyNBqFsyXiLEf6Yg-1
Received: by mail-ej1-f70.google.com with SMTP id
 gv42-20020a1709072beab02903eab8e33118so2229798ejc.19
 for <linux-mediatek@lists.infradead.org>; Thu, 17 Jun 2021 06:52:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8y98L/La9x4KilFgUirdLHSyWfxKWG7oJ+i1N0Sw+rE=;
 b=WLBx+Km7mwtP92ImRhvWHHX4/1FdRs9FMLV6U8aLa3tjX5uAyghcr6Nj/rOIzB7i+3
 HrKX6DbCmiAop49eOGtv6kkJ4w5vyd0V8z0ZVbrEdwlvD5gsrJD0fp1y5F9+7xU2pK9E
 yk/jnAYbp9t8CSB973lpjluCSyLE+unCV6eqzwyfROu4/0oJ8fYOougwEb91EYicByt2
 VkP2ojFbl4aRbXJALTjM0WkqFXtFZkrhWTjPgRfI41erOr3/SSP9xUK6sWa+qiO+kPSv
 ahqiLhDnjS8qzcKr0ETyJ/Ml+s0IXHLX8GMtfdT1Shh4Vsr3P2Ha8xAOMzW76YXsxBeJ
 WvKQ==
X-Gm-Message-State: AOAM530LUGYD+W/OfQz3Kg8BOa4O8HwD4rfUjXyuzGxSIhCEukewDazx
 XfxUV7XiJFynr7Yg6afW35YQrvaghSOWEXUjLavPiVBWt2YOFaoxGu3HUQzgHp4xfnHwBkr6N2R
 2Eqc2xdbx5otnf+exkryFCtC0YO5CU6qN
X-Received: by 2002:a17:906:ac4:: with SMTP id
 z4mr5401314ejf.303.1623937945425; 
 Thu, 17 Jun 2021 06:52:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVnvDt8sJxsVa0fDP6Dfi05+2CsBlMMecSDxuktxQNzHRmcOB6hhGTbOV8xxEslBGQUip1PQ==
X-Received: by 2002:a17:906:ac4:: with SMTP id
 z4mr5401288ejf.303.1623937945287; 
 Thu, 17 Jun 2021 06:52:25 -0700 (PDT)
Received: from localhost (net-130-25-105-72.cust.vodafonedsl.it.
 [130.25.105.72])
 by smtp.gmail.com with ESMTPSA id i15sm3849945ejk.30.2021.06.17.06.52.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 06:52:24 -0700 (PDT)
Date: Thu, 17 Jun 2021 15:52:21 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, Soul.Huang@mediatek.com, YN.Chen@mediatek.com,
 Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com,
 Deren.Wu@mediatek.com, km.lin@mediatek.com, robin.chiu@mediatek.com,
 ch.yeh@mediatek.com, posh.sun@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, jemele@google.com, yenlinlai@google.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mt76: mt7921: fix the coredump is being truncated
Message-ID: <YMtTlS3Nh4uGnJvq@lore-desk>
References: <2ebb95099102ffe62c0fa8aedd95d7e77b5ca385.1623884856.git.objelf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <2ebb95099102ffe62c0fa8aedd95d7e77b5ca385.1623884856.git.objelf@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lorenzo.bianconi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_065233_252324_E6B4AC24 
X-CRM114-Status: GOOD (  18.45  )
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
Content-Type: multipart/mixed; boundary="===============3458987681254351709=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============3458987681254351709==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/rucmuLPAqyrwX+6"
Content-Disposition: inline

--/rucmuLPAqyrwX+6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> Fix the maximum size of the coredump generated with current mt7921
> firmware. Otherwise, a truncated coredump would be reported to userland
> via dev_coredumpv.
>=20
> Also, there is an additional error handling enhanced in the patch to avoi=
d
> the possible invalid buffer access when the system failed to create the
> buffer to hold the coredump.
>=20
> Fixes: 0da3c795d07b ("mt76: mt7921: add coredump support")
> Co-developed-by: YN Chen <YN.Chen@mediatek.com>
> Signed-off-by: YN Chen <YN.Chen@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt76_connac.h | 2 +-
>  drivers/net/wireless/mediatek/mt76/mt7921/mac.c  | 9 ++++++---
>  2 files changed, 7 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h b/drivers/n=
et/wireless/mediatek/mt76/mt76_connac.h
> index 9b3f8d22f17e..d93ab1ece8ae 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
> @@ -13,7 +13,7 @@
>  #define MT76_CONNAC_MAX_SCAN_MATCH=09=0916
> =20
>  #define MT76_CONNAC_COREDUMP_TIMEOUT=09=09(HZ / 20)
> -#define MT76_CONNAC_COREDUMP_SZ=09=09=09(128 * 1024)
> +#define MT76_CONNAC_COREDUMP_SZ=09=09=09(1300 * 1024)
> =20
>  enum {
>  =09CMD_CBW_20MHZ =3D IEEE80211_STA_RX_BW_20,
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/mac.c
> index fb4de73df701..905dddbfbb0b 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
> @@ -1557,7 +1557,7 @@ void mt7921_coredump_work(struct work_struct *work)
>  =09=09=09break;
> =20
>  =09=09skb_pull(skb, sizeof(struct mt7921_mcu_rxd));
> -=09=09if (data + skb->len - dump > MT76_CONNAC_COREDUMP_SZ) {
> +=09=09if (!dump || data + skb->len - dump > MT76_CONNAC_COREDUMP_SZ) {

why not just return if dump allocation fails? Doing so we will reset the de=
vice
even if dump is NULL, do you think it is a real use-case?

Regards,
Lorenzo

>  =09=09=09dev_kfree_skb(skb);
>  =09=09=09continue;
>  =09=09}
> @@ -1567,7 +1567,10 @@ void mt7921_coredump_work(struct work_struct *work=
)
> =20
>  =09=09dev_kfree_skb(skb);
>  =09}
> -=09dev_coredumpv(dev->mt76.dev, dump, MT76_CONNAC_COREDUMP_SZ,
> -=09=09      GFP_KERNEL);
> +
> +=09if (dump)
> +=09=09dev_coredumpv(dev->mt76.dev, dump, MT76_CONNAC_COREDUMP_SZ,
> +=09=09=09      GFP_KERNEL);
> +
>  =09mt7921_reset(&dev->mt76);
>  }
> --=20
> 2.25.1
>=20

--/rucmuLPAqyrwX+6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYMtTkgAKCRA6cBh0uS2t
rIHjAQCqNVvge4z+NsfUu91P1Cey8w++PXYbKlGOEW8i9n++kgEAjU5Q6TPVUx/n
1Wzjj3kkXpDbJSvZuKl+IZJbOnRKzwo=
=rDOE
-----END PGP SIGNATURE-----

--/rucmuLPAqyrwX+6--



--===============3458987681254351709==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3458987681254351709==--


