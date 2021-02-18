Return-Path: <SRS0=w+BI=HU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34C6CC433E6
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Feb 2021 12:16:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D19E264DA1
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Feb 2021 12:16:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D19E264DA1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=W9Ubhx6nZlkJDJJ7B+hJr1+a2SAn/3CL1c89Uqz10hQ=; b=Ra2HaO+7SPKh/XXB7+TP0YRph
	8dLaDu8WnVCROjETRBohZrgqPrV+dc4LYYJzURftqYBK4IQHKLrR0rE592IpZhPA725TbuuqA6Fpu
	stuT0jC5qCyjvXxUeDfP9VLT2IMeZ9Z1iMlghcdvAc7Lc8XZfDrT0fJrapIwAq3NmXQHkAsVdnENY
	DUG63Jn5whZLvgHvtsB09ths2BhoR3Pvh8yfPvVkDUb0RR4bHi0I7ZyRBNl6COPzbpYVVn2toWRxx
	kk2WYZg17L2OACbrwFHncvBYEmEMve88oHuzt7goW4Z3mBlcW64or1zyPccP2j3lnt0duFwjp5+sC
	AtM2T1Iig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCiE2-0004Bd-Df; Thu, 18 Feb 2021 12:16:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCiDy-0004BJ-PT
 for linux-mediatek@lists.infradead.org; Thu, 18 Feb 2021 12:16:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613650562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wjEm1oxLIXAchYhvEpcfBCqyKWfnSO/9m5gRMnCfJCU=;
 b=bLyX/ro2tLkEyNgarFPP0fm8qdBojTp4f3X3WaGxAna5WpcP7kEMf5yOYaz96tsIJ9UzXU
 8E2O+8KSTYUHqo8S7SZqEQlAU6IliIR6wpxeYVXaPjpwG2llNOR2rKAU5dYZOEY83WHFHy
 MfGLjHkOWExWWc/KSVMOCGUjzPXSbys=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-BxKyRf66OJOBE-mGVIoCNQ-1; Thu, 18 Feb 2021 07:14:02 -0500
X-MC-Unique: BxKyRf66OJOBE-mGVIoCNQ-1
Received: by mail-wm1-f71.google.com with SMTP id k65so647415wmb.3
 for <linux-mediatek@lists.infradead.org>; Thu, 18 Feb 2021 04:14:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MMPBpZME1t5tE5EnXODI2jTTAQWj8QKBprrlHU8JqQE=;
 b=JhRJqZ/U2jSrqd4qws99zrK9YYruUlS76FJ3FTe0lwMTdwqMeoHrEJlDuFeWoj9Hiv
 vj+7uIPMieUysELondQjVtaIl4I0Z63Q9jFbRjrhij2rCLBAAxsC/KPn95TAGB2vGMK3
 Pb2S7OJpF/ofZQetildZG1l6aBNo82gfxwtID439uYHAj+PgL8bny3GrxFvSfZKPaHeH
 0lRbrzHIntvisBsZa9va2wo8r69u6LaHw9M4p8sI1t1e8HvBQqM2DoAeIOzUzMtzVSiw
 K5sNfamTJHLcRj8cGv3NH0bfn3OZhgl7g9WkRSbOirSOuvuPUB+PnetgYteVxNI1DiFp
 BaTw==
X-Gm-Message-State: AOAM532/q0HB+Ot+QYQITrinMtKqcDpTFwfDcfQPRp0Ze0nLQR9oirIB
 /p0pmckW9eGtpmxwYwjVIxhUnA+Tc2EJYSGLlB+9K7fctvmPV4QgzaN1PFfWcFod6uaaJrjB6qr
 cGe9TohpQpDVmiRz8MGVTp66gmMPh11YI
X-Received: by 2002:a7b:c956:: with SMTP id i22mr3455939wml.85.1613650441296; 
 Thu, 18 Feb 2021 04:14:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzVB889STRI+0pQHvTHBhArsH2WRVsoMeokueejiOuVGEQYWifrmeW4g7v8jdtc6gkuzXnZEQ==
X-Received: by 2002:a7b:c956:: with SMTP id i22mr3455925wml.85.1613650441084; 
 Thu, 18 Feb 2021 04:14:01 -0800 (PST)
Received: from localhost ([151.66.54.126])
 by smtp.gmail.com with ESMTPSA id u14sm8617179wro.10.2021.02.18.04.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 04:14:00 -0800 (PST)
Date: Thu, 18 Feb 2021 13:13:57 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: [PATCH 1/3] mt76: mt7615: enable hw rx-amsdu de-aggregation
Message-ID: <YC5aBTfl3Hguglc0@lore-desk>
References: <b7883f5ee09d13f7cbdf5ab1d5fef61ebc79dcc4.1613603857.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <b7883f5ee09d13f7cbdf5ab1d5fef61ebc79dcc4.1613603857.git.ryder.lee@mediatek.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lorenzo.bianconi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210218_071602_908896_BE807EA3 
X-CRM114-Status: GOOD (  15.62  )
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
Cc: linux-mediatek@lists.infradead.org, Shayne Chen <shayne.chen@mediatek.com>,
 linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>
Content-Type: multipart/mixed; boundary="===============7318233862493117980=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============7318233862493117980==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="w/nz35jDHskm0eYh"
Content-Disposition: inline

--w/nz35jDHskm0eYh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Enable hw rx-amsdu de-aggregation support.
> This is a preliminary patch to enable rx checksum offload.
>=20
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>

For the series:

Tested-by Lorenzo Bianconi <lorenzo.bianconi@redhat.com>

> ---
>  drivers/net/wireless/mediatek/mt76/mt7615/init.c |  3 +--
>  drivers/net/wireless/mediatek/mt76/mt7615/mac.c  | 15 ++++++++++++++-
>  drivers/net/wireless/mediatek/mt76/mt7615/mac.h  |  3 +++
>  drivers/net/wireless/mediatek/mt76/mt7615/regs.h |  1 +
>  4 files changed, 19 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/n=
et/wireless/mediatek/mt76/mt7615/init.c
> index 571390fa4de7..a97cc723094c 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
> @@ -116,10 +116,9 @@ mt7615_mac_init(struct mt7615_dev *dev)
>  =09mt76_set(dev, MT_WF_RMAC_MIB_TIME0, MT_WF_RMAC_MIB_RXTIME_EN);
>  =09mt76_set(dev, MT_WF_RMAC_MIB_AIRTIME0, MT_WF_RMAC_MIB_RXTIME_EN);
> =20
> -=09/* disable hdr translation and hw AMSDU */
>  =09mt76_wr(dev, MT_DMA_DCR0,
>  =09=09FIELD_PREP(MT_DMA_DCR0_MAX_RX_LEN, 3072) |
> -=09=09MT_DMA_DCR0_RX_VEC_DROP);
> +=09=09MT_DMA_DCR0_RX_VEC_DROP | MT_DMA_DCR0_DAMSDU_EN);
>  =09/* disable TDLS filtering */
>  =09mt76_clear(dev, MT_WF_PFCR, MT_WF_PFCR_TDLS_EN);
>  =09mt76_set(dev, MT_WF_MIB_SCR0, MT_MIB_SCR0_AGG_CNT_RANGE_EN);
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7615/mac.c
> index 9bae2f66e1ce..928edd158f64 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
> @@ -238,7 +238,7 @@ static int mt7615_mac_fill_rx(struct mt7615_dev *dev,=
 struct sk_buff *skb)
>  =09bool unicast, remove_pad, insert_ccmp_hdr =3D false;
>  =09int phy_idx;
>  =09int i, idx;
> -=09u8 chfreq;
> +=09u8 chfreq, amsdu_info;
> =20
>  =09memset(status, 0, sizeof(*status));
> =20
> @@ -254,6 +254,9 @@ static int mt7615_mac_fill_rx(struct mt7615_dev *dev,=
 struct sk_buff *skb)
>  =09else
>  =09=09phy_idx =3D -1;
> =20
> +=09if (rxd2 & MT_RXD2_NORMAL_AMSDU_ERR)
> +=09=09return -EINVAL;
> +
>  =09unicast =3D (rxd1 & MT_RXD1_NORMAL_ADDR_TYPE) =3D=3D MT_RXD1_NORMAL_U=
2M;
>  =09idx =3D FIELD_GET(MT_RXD2_NORMAL_WLAN_IDX, rxd2);
>  =09status->wcid =3D mt7615_rx_get_wcid(dev, idx, unicast);
> @@ -446,6 +449,16 @@ static int mt7615_mac_fill_rx(struct mt7615_dev *dev=
, struct sk_buff *skb)
> =20
>  =09skb_pull(skb, (u8 *)rxd - skb->data + 2 * remove_pad);
> =20
> +=09amsdu_info =3D FIELD_GET(MT_RXD1_NORMAL_PAYLOAD_FORMAT, rxd1);
> +=09status->amsdu =3D !!amsdu_info;
> +=09if (status->amsdu) {
> +=09=09status->first_amsdu =3D amsdu_info =3D=3D MT_RXD1_FIRST_AMSDU_FRAM=
E;
> +=09=09status->last_amsdu =3D amsdu_info =3D=3D MT_RXD1_LAST_AMSDU_FRAME;
> +=09=09memmove(skb->data + 2, skb->data,
> +=09=09=09ieee80211_get_hdrlen_from_skb(skb));
> +=09=09skb_pull(skb, 2);
> +=09}
> +
>  =09if (insert_ccmp_hdr) {
>  =09=09u8 key_id =3D FIELD_GET(MT_RXD1_NORMAL_KEY_ID, rxd1);
> =20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.h b/drivers/ne=
t/wireless/mediatek/mt76/mt7615/mac.h
> index 169f4e17b5b4..ed009d085a53 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
> @@ -33,6 +33,9 @@ enum rx_pkt_type {
> =20
>  #define MT_RXD1_NORMAL_BSSID=09=09GENMASK(31, 26)
>  #define MT_RXD1_NORMAL_PAYLOAD_FORMAT=09GENMASK(25, 24)
> +#define MT_RXD1_FIRST_AMSDU_FRAME=09GENMASK(1, 0)
> +#define MT_RXD1_MID_AMSDU_FRAME=09=09BIT(1)
> +#define MT_RXD1_LAST_AMSDU_FRAME=09BIT(0)
>  #define MT_RXD1_NORMAL_HDR_TRANS=09BIT(23)
>  #define MT_RXD1_NORMAL_HDR_OFFSET=09BIT(22)
>  #define MT_RXD1_NORMAL_MAC_HDR_LEN=09GENMASK(21, 16)
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/regs.h b/drivers/n=
et/wireless/mediatek/mt76/mt7615/regs.h
> index 6e5db015b32c..4ebffe52cb8e 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
> @@ -368,6 +368,7 @@ enum mt7615_reg_base {
> =20
>  #define MT_DMA_DCR0=09=09=09MT_WF_DMA(0x000)
>  #define MT_DMA_DCR0_MAX_RX_LEN=09=09GENMASK(15, 2)
> +#define MT_DMA_DCR0_DAMSDU_EN=09=09BIT(16)
>  #define MT_DMA_DCR0_RX_VEC_DROP=09=09BIT(17)
> =20
>  #define MT_DMA_RCFR0(_band)=09=09MT_WF_DMA(0x070 + (_band) * 0x40)
> --=20
> 2.18.0
>=20

--w/nz35jDHskm0eYh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYC5aAgAKCRA6cBh0uS2t
rEi0AP9KwnYBVVtq5ZX2waySM5KsKinIFzXVn90VtiTmNU1LSgEA6szTuyw3/yLX
xPVEzg4gyzj/lkHjxyQOvOvJuzS/Qww=
=sRxR
-----END PGP SIGNATURE-----

--w/nz35jDHskm0eYh--



--===============7318233862493117980==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7318233862493117980==--


