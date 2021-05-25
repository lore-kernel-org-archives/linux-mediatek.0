Return-Path: <SRS0=AnEI=KU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62516C2B9F8
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 May 2021 09:01:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CF02610A5
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 May 2021 09:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CF02610A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gzr2LkkCDv7D2hPj5itbez/pgZ2LqGKy7KvPq6nh+m8=; b=4t8aXnJ7E2/HRQXQLEprjCO0IB
	Q9Bqv1PkZXunHgw7hE6awbDxADHHKoQDluWw6CYiQGWOG7WR/E2EyCmAzWb2a5oS+JpxNYQXK0JIp
	Z5lmA3OS8Ghu8BseXQTzhadyPV8++wcbLuFAkoaVi91MBRb0PILWE3iEKLoHDYoO9/vTyQ0gxHNZ5
	7QrqENRSOxtUiGuieT2Gd09PXjMBvUepEVehQUsdFB5D757onZfSULWAKs7ySNCCjOBf9jrqwXdes
	d7GRw1N1i3++H3p9i3iSnEhD8YUSlyQfrVrk+sLR04DOP1XDEtaRFT7yZnoBDVWpnVZAxy+y8waUq
	GT8P4nRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llSwe-004Fj3-BD; Tue, 25 May 2021 09:01:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llSwa-004FeM-CP
 for linux-mediatek@lists.infradead.org; Tue, 25 May 2021 09:01:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621933301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6uM+4WaXvY7d2e1kgAwLhyY9qJEdyOO4lPd1WY4QBYo=;
 b=IQeTz8bLvMkjUuDmjyZEarcgjIdLFNPu2A1BU/yJrFg5upZFmAEgz8j2ntmroHtV4ExxhB
 HsqIwc3L0pxB6IvNI2nQkuSsSL/4gaIjfN1EuH8AvJR1V/3hAklHibzGVrjUPcnrwQ3oQ8
 UKZNsB1cTW7lt4WuocvQ2v9eSqNZ4as=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-17ubptqdOdO9joCHGAeNfw-1; Tue, 25 May 2021 05:01:37 -0400
X-MC-Unique: 17ubptqdOdO9joCHGAeNfw-1
Received: by mail-ej1-f71.google.com with SMTP id
 x20-20020a1709061354b02903cff4894505so8512228ejb.14
 for <linux-mediatek@lists.infradead.org>; Tue, 25 May 2021 02:01:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7a8uccHKxMO4pJ6R9+M8IQk9eToV/9h1P/Rfg0CpgHo=;
 b=QMCe2dWzxryt5gqMiD+PqDcskVuAVemB7G2ufWVG/HPtQivFlyH0J3m9B6tQMcVCG0
 2Lu11IUJfSCMvDdo4w40D5ryjmB0QD5xNw/M1xlnR9SiETmLbJ2AzvEXzE8q9Yepr2fJ
 V0K0luPyT5mG/bfUqpy+odtgtYH9Dz9LCoURdRN/FbyennhL4l18nW7k8tetd6v8GsQJ
 Sp4u1qKcDtBqZJptTqWVh+Lz8Ggmntg9Cz4EonkMz41H+bxcna+h2sHu2+8gIkaOAiJ4
 c4uF8HW5k5RiMt+Y7ap229LI+SZceyDh3YkYr2HwEFvZnkv/3LZ3vfCHp+w+3DCcT1Zz
 DEQw==
X-Gm-Message-State: AOAM530MoxKrurD359wshv2nl+P9eJmmFq7At0WobQ24ONnQDb/4/MTb
 AXOtMHM5+ST4YcZLTRXoZUcoDO88VilMlOaYXPxMo2kcHBuWJpWrp/o4YHfOmTOCNxTIivrMGJc
 caTw0z/8U2hjqU5EcrQ0fhPx4fQ7U9v2i
X-Received: by 2002:a17:906:4a46:: with SMTP id
 a6mr27502832ejv.322.1621933296126; 
 Tue, 25 May 2021 02:01:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHVUngetbgXrhhvOXykp8L+UmaszxqzLb2qbERMC34AfxVSMSGdhMWtU6XbhMuJTQtYrM9Ww==
X-Received: by 2002:a17:906:4a46:: with SMTP id
 a6mr27502818ejv.322.1621933295955; 
 Tue, 25 May 2021 02:01:35 -0700 (PDT)
Received: from localhost (net-93-66-91-66.cust.vodafonedsl.it. [93.66.91.66])
 by smtp.gmail.com with ESMTPSA id
 i2sm10270089edc.96.2021.05.25.02.01.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 02:01:35 -0700 (PDT)
Date: Tue, 25 May 2021 11:01:32 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] mt76: mt7915: add .offset_tsf callback
Message-ID: <YKy87P+PcRTdNkwN@lore-desk>
References: <324aa6af6a191a1f929fd3054148b001acd0bd13.1621931743.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <324aa6af6a191a1f929fd3054148b001acd0bd13.1621931743.git.ryder.lee@mediatek.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lorenzo.bianconi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_020144_561128_3CA5583B 
X-CRM114-Status: GOOD (  15.78  )
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
Content-Type: multipart/mixed; boundary="===============2983108745420820775=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============2983108745420820775==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uVU+kXXvkjpZrYMy"
Content-Disposition: inline

--uVU+kXXvkjpZrYMy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> It's much more accurate than .get_tsf + .set_tsf, and switch to use
> mt76_rmw to operate tsf registers.
>=20
> Tested-by: Xing Song <xing.song@mediatek.com>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  .../net/wireless/mediatek/mt76/mt7915/main.c  | 33 +++++++++++++++++--
>  .../net/wireless/mediatek/mt76/mt7915/regs.h  |  2 ++
>  2 files changed, 33 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7915/main.c
> index 64f9ebe4424a..2485f65766e7 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
> @@ -816,7 +816,8 @@ mt7915_get_tsf(struct ieee80211_hw *hw, struct ieee80=
211_vif *vif)
> =20
>  =09n =3D mvif->omac_idx > HW_BSSID_MAX ? HW_BSSID_0 : mvif->omac_idx;
>  =09/* TSF software read */
> -=09mt76_set(dev, MT_LPON_TCR(band, n), MT_LPON_TCR_SW_MODE);
> +=09mt76_rmw(dev, MT_LPON_TCR(band, n), MT_LPON_TCR_SW_MODE,
> +=09=09 MT_LPON_TCR_SW_READ);
>  =09tsf.t32[0] =3D mt76_rr(dev, MT_LPON_UTTR0(band));
>  =09tsf.t32[1] =3D mt76_rr(dev, MT_LPON_UTTR1(band));
> =20
> @@ -845,7 +846,34 @@ mt7915_set_tsf(struct ieee80211_hw *hw, struct ieee8=
0211_vif *vif,
>  =09mt76_wr(dev, MT_LPON_UTTR0(band), tsf.t32[0]);
>  =09mt76_wr(dev, MT_LPON_UTTR1(band), tsf.t32[1]);
>  =09/* TSF software overwrite */
> -=09mt76_set(dev, MT_LPON_TCR(band, n), MT_LPON_TCR_SW_WRITE);
> +=09mt76_rmw(dev, MT_LPON_TCR(band, n), MT_LPON_TCR_SW_MODE,
> +=09=09 MT_LPON_TCR_SW_WRITE);
> +
> +=09mutex_unlock(&dev->mt76.mutex);
> +}
> +
> +static void
> +mt7915_offset_tsf(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
> +=09=09  s64 timestamp)
> +{
> +=09struct mt7915_vif *mvif =3D (struct mt7915_vif *)vif->drv_priv;
> +=09struct mt7915_dev *dev =3D mt7915_hw_dev(hw);
> +=09struct mt7915_phy *phy =3D mt7915_hw_phy(hw);
> +=09bool band =3D phy !=3D &dev->phy;
> +=09union {
> +=09=09u64 t64;
> +=09=09u32 t32[2];
> +=09} tsf =3D { .t64 =3D timestamp, };

nit: new line here after '{' and before '}'

Regards,
Lorenzo

> +=09u16 n;
> +
> +=09mutex_lock(&dev->mt76.mutex);
> +
> +=09n =3D mvif->omac_idx > HW_BSSID_MAX ? HW_BSSID_0 : mvif->omac_idx;
> +=09mt76_wr(dev, MT_LPON_UTTR0(band), tsf.t32[0]);
> +=09mt76_wr(dev, MT_LPON_UTTR1(band), tsf.t32[1]);
> +=09/* TSF software adjust*/
> +=09mt76_rmw(dev, MT_LPON_TCR(band, n), MT_LPON_TCR_SW_MODE,
> +=09=09 MT_LPON_TCR_SW_ADJUST);
> =20
>  =09mutex_unlock(&dev->mt76.mutex);
>  }
> @@ -1036,6 +1064,7 @@ const struct ieee80211_ops mt7915_ops =3D {
>  =09.get_stats =3D mt7915_get_stats,
>  =09.get_tsf =3D mt7915_get_tsf,
>  =09.set_tsf =3D mt7915_set_tsf,
> +=09.offset_tsf =3D mt7915_offset_tsf,
>  =09.get_survey =3D mt76_get_survey,
>  =09.get_antenna =3D mt76_get_antenna,
>  =09.set_antenna =3D mt7915_set_antenna,
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h b/drivers/n=
et/wireless/mediatek/mt76/mt7915/regs.h
> index efe0f2904c66..e36b30d84f07 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
> @@ -124,6 +124,8 @@
>  #define MT_LPON_TCR(_band, n)=09=09MT_WF_LPON(_band, 0x0a8 + (n) * 4)
>  #define MT_LPON_TCR_SW_MODE=09=09GENMASK(1, 0)
>  #define MT_LPON_TCR_SW_WRITE=09=09BIT(0)
> +#define MT_LPON_TCR_SW_ADJUST=09=09BIT(1)
> +#define MT_LPON_TCR_SW_READ=09=09GENMASK(1, 0)
> =20
>  /* MIB: band 0(0x24800), band 1(0xa4800) */
>  #define MT_WF_MIB_BASE(_band)=09=09((_band) ? 0xa4800 : 0x24800)
> --=20
> 2.18.0
>=20

--uVU+kXXvkjpZrYMy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYKy85wAKCRA6cBh0uS2t
rMEhAQDboiqJgm8kUrg/P/UTTQCE3imz7XDGPemtpIGhjdUcpwD/bv4UK3RBVx8e
iFphNPar4svpKwivVpq8WFxV38SuIgs=
=cQPB
-----END PGP SIGNATURE-----

--uVU+kXXvkjpZrYMy--



--===============2983108745420820775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2983108745420820775==--


