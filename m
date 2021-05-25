Return-Path: <SRS0=AnEI=KU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C810C2B9F8
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 May 2021 09:03:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4617961409
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 May 2021 09:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4617961409
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZuULtn63C5MbB9x2BM1V3swjdQYnx1TuRm2cPkAh6DU=; b=MTc+68dykk4wus3huobQDYpu8F
	TrqM2x56xjy3cdljCXLg+Q1qXzO6l/PQw6VyLoqw0SME43LGrFlaRD7WJ3im5efpf9txbEtlby8kY
	Uu9hMsztFsWjrmKVlm7Skr+5jF+Q7d8B620Fjo+40sJLEJ1muDzJJ+mCZYYjZ53ChrpTFkKE79bvS
	8SlfOwBV9pVUdmT7zErkjnn6oEh1TIVd2UPfEXaEMmFmVv6atJtzMLfSuP/vM1aFiw2fe6Rezckst
	mrJFdisQsjKfm91Orgwo11eY2n2FlzQYM6FBHqX5tK2zVxoWF/DJv6ORrFIZgrJS6J2I1vqGHUlPR
	j2BdaPAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llSy3-004GIa-4D; Tue, 25 May 2021 09:03:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llSy0-004GGu-5X
 for linux-mediatek@lists.infradead.org; Tue, 25 May 2021 09:03:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621933391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uMjW2OOupkp1JPfSbYfN0aBu7BadnLsjNA3/UYWn8HY=;
 b=NnvT21ML64prAzkB9G5jeg7sGl426tSb/Sk1uEyHUdSmjrTE2hCpbpbqsBcE8MrnSPCdUb
 2b/jzELPFAx6LHHQZ2BWdKiJEHQrPw0MK7eSzwXOPFeRf+wSEk5+yFMiejqt1vVaTRT/oy
 1FyUGJtx8liWnzpIwgJKXJL9LRyVeaw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-hyWc8yeHOMq-NMlfw6jP7A-1; Tue, 25 May 2021 05:03:08 -0400
X-MC-Unique: hyWc8yeHOMq-NMlfw6jP7A-1
Received: by mail-ed1-f71.google.com with SMTP id
 u14-20020a05640207ceb029038d4bfbf3a6so13419677edy.9
 for <linux-mediatek@lists.infradead.org>; Tue, 25 May 2021 02:03:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=a2kNHkfYuDvhtz55vby6f2oRc2ENLoFARbVzBwJeBQ4=;
 b=Vw6VDPlgt3wZfWSK4DzJI3Xk3w9+3Ki1heEOzgqr012nUz9t5mqZpV2lYqQjtkOH55
 mfWd+Rgv9LOve2FmC7zGkts8TzMnBpZeDD7U4fkACDM2EFnup8Io31+85FyMO8Z9yDJg
 RjiuoDEMi0jmTVP5Ien9oTUdfrs5Nk6tX51B/ZR8olZHm3xWGjVSja++a9+Nr3pMJ7xN
 ajx/sn9JhcECbkSkmToGjoti5/VRatMzPXKCVDEH4gOSkRFAco8mUPlmVZLQXx8J8H8g
 fPzapf9vuw5BXncnggnwJxKyKsG46Ul86IS9Eykr17MZJqJrF81hGRbqEHXILtuGjn7O
 KpjA==
X-Gm-Message-State: AOAM532vurIbXhdNO9jR69ZPscW4RfWW3BrzGDKm/Epnw/xqLU1FVgqi
 72zScKi5eF9QErnNPDkE1pM0Cznq3nwLNq0cFz6hJhYXiIK6j9V6g1iyAmokqtWr9D9+WcYsPK2
 5NXNzzqEs2sstd2iEsU2jIEfn5mGLjwgT
X-Received: by 2002:a50:9f6b:: with SMTP id b98mr31056015edf.318.1621933387641; 
 Tue, 25 May 2021 02:03:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnRK2ZPRObjKxHo/vtL2A69CdhsgrDNtXNBQ3caZ72RPzMWV5eb250CZXjcRnmC4neCqoC+g==
X-Received: by 2002:a50:9f6b:: with SMTP id b98mr31056000edf.318.1621933387507; 
 Tue, 25 May 2021 02:03:07 -0700 (PDT)
Received: from localhost (net-93-66-91-66.cust.vodafonedsl.it. [93.66.91.66])
 by smtp.gmail.com with ESMTPSA id
 q26sm8790541ejc.3.2021.05.25.02.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 02:03:06 -0700 (PDT)
Date: Tue, 25 May 2021 11:03:03 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] mt76: mt7615: add .offset_tsf callback
Message-ID: <YKy9R82co40IqVSw@lore-desk>
References: <324aa6af6a191a1f929fd3054148b001acd0bd13.1621931743.git.ryder.lee@mediatek.com>
 <02303700150757de92fec3525fe51c04d1aca416.1621931743.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <02303700150757de92fec3525fe51c04d1aca416.1621931743.git.ryder.lee@mediatek.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lorenzo.bianconi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_020312_333127_97280E18 
X-CRM114-Status: GOOD (  17.51  )
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
Content-Type: multipart/mixed; boundary="===============4197663453915316363=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============4197663453915316363==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wDAorh6uHV8+h+wZ"
Content-Disposition: inline

--wDAorh6uHV8+h+wZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> It's much more accurate than .get_tsf + .set_tsf, and switch to use
> mt76_rmw to operate tsf registers.
>=20
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  .../net/wireless/mediatek/mt76/mt7615/mac.c   |  2 +-
>  .../net/wireless/mediatek/mt76/mt7615/main.c  | 32 +++++++++++++++++--
>  .../net/wireless/mediatek/mt76/mt7615/regs.h  |  2 ++
>  .../wireless/mediatek/mt76/mt7615/usb_sdio.c  |  2 +-
>  4 files changed, 34 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7615/mac.c
> index 71af122a0b38..2ac7d0b0eff4 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
> @@ -1125,7 +1125,7 @@ void mt7615_mac_set_rates(struct mt7615_phy *phy, s=
truct mt7615_sta *sta,
>  =09idx =3D idx > HW_BSSID_MAX ? HW_BSSID_0 : idx;
>  =09addr =3D idx > 1 ? MT_LPON_TCR2(idx): MT_LPON_TCR0(idx);
> =20
> -=09mt76_set(dev, addr, MT_LPON_TCR_MODE); /* TSF read */
> +=09mt76_rmw(dev, addr, MT_LPON_TCR_MODE, MT_LPON_TCR_READ); /* TSF read =
*/
>  =09sta->rate_set_tsf =3D mt76_rr(dev, MT_LPON_UTTR0) & ~BIT(0);
>  =09sta->rate_set_tsf |=3D rd.rateset;
> =20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7615/main.c
> index e36c52290985..3bd755634d5b 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
> @@ -891,7 +891,8 @@ mt7615_get_tsf(struct ieee80211_hw *hw, struct ieee80=
211_vif *vif)
> =20
>  =09mt7615_mutex_acquire(dev);
> =20
> -=09mt76_set(dev, reg, MT_LPON_TCR_MODE); /* TSF read */
> +=09/* TSF read */
> +=09mt76_rmw(dev, reg, MT_LPON_TCR_MODE, MT_LPON_TCR_READ);
>  =09tsf.t32[0] =3D mt76_rr(dev, MT_LPON_UTTR0);
>  =09tsf.t32[1] =3D mt76_rr(dev, MT_LPON_UTTR1);
> =20
> @@ -921,11 +922,37 @@ mt7615_set_tsf(struct ieee80211_hw *hw, struct ieee=
80211_vif *vif,
>  =09mt76_wr(dev, MT_LPON_UTTR0, tsf.t32[0]);
>  =09mt76_wr(dev, MT_LPON_UTTR1, tsf.t32[1]);
>  =09/* TSF software overwrite */
> -=09mt76_set(dev, reg, MT_LPON_TCR_WRITE);
> +=09mt76_rmw(dev, reg, MT_LPON_TCR_MODE, MT_LPON_TCR_WRITE);
> =20
>  =09mt7615_mutex_release(dev);
>  }
> =20
> +static void
> +mt7615_offset_tsf(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
> +=09=09  s64 timestamp)
> +{
> +=09struct mt7615_vif *mvif =3D (struct mt7615_vif *)vif->drv_priv;
> +=09struct mt7615_dev *dev =3D mt7615_hw_dev(hw);
> +=09union {
> +=09=09u64 t64;
> +=09=09u32 t32[2];
> +=09} tsf =3D { .t64 =3D timestamp, };

same here

> +=09u16 idx =3D mvif->mt76.omac_idx;
> +=09u32 reg;
> +
> +=09idx =3D idx > HW_BSSID_MAX ? HW_BSSID_0 : idx;
> +=09reg =3D idx > 1 ? MT_LPON_TCR2(idx): MT_LPON_TCR0(idx);
> +
> +=09mutex_lock(&dev->mt76.mutex);

mt7615_mutex_acquire(dev);=20

> +
> +=09mt76_wr(dev, MT_LPON_UTTR0, tsf.t32[0]);
> +=09mt76_wr(dev, MT_LPON_UTTR1, tsf.t32[1]);
> +=09/* TSF software adjust*/
> +=09mt76_rmw(dev, reg, MT_LPON_TCR_MODE, MT_LPON_TCR_ADJUST);
> +
> +=09mutex_unlock(&dev->mt76.mutex);

mt7615_mutex_release(dev);

Regards,
Lorenzo
> +}
> +
>  static void
>  mt7615_set_coverage_class(struct ieee80211_hw *hw, s16 coverage_class)
>  {
> @@ -1308,6 +1335,7 @@ const struct ieee80211_ops mt7615_ops =3D {
>  =09.get_stats =3D mt7615_get_stats,
>  =09.get_tsf =3D mt7615_get_tsf,
>  =09.set_tsf =3D mt7615_set_tsf,
> +=09.offset_tsf =3D mt7615_offset_tsf,
>  =09.get_survey =3D mt76_get_survey,
>  =09.get_antenna =3D mt76_get_antenna,
>  =09.set_antenna =3D mt7615_set_antenna,
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/regs.h b/drivers/n=
et/wireless/mediatek/mt76/mt7615/regs.h
> index 63c081bb04d0..6712ad9faeaa 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
> @@ -463,7 +463,9 @@ enum mt7615_reg_base {
>  #define MT_LPON_TCR0(_n)=09=09MT_LPON(0x010 + ((_n) * 4))
>  #define MT_LPON_TCR2(_n)=09=09MT_LPON(0x0f8 + ((_n) - 2) * 4)
>  #define MT_LPON_TCR_MODE=09=09GENMASK(1, 0)
> +#define MT_LPON_TCR_READ=09=09GENMASK(1, 0)
>  #define MT_LPON_TCR_WRITE=09=09BIT(0)
> +#define MT_LPON_TCR_ADJUST=09=09BIT(1)
> =20
>  #define MT_LPON_UTTR0=09=09=09MT_LPON(0x018)
>  #define MT_LPON_UTTR1=09=09=09MT_LPON(0x01c)
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c b/drive=
rs/net/wireless/mediatek/mt76/mt7615/usb_sdio.c
> index 75a05f8dd7e7..996d48cca18a 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c
> @@ -123,7 +123,7 @@ static int mt7663_usb_sdio_set_rates(struct mt7615_de=
v *dev,
>  =09idx =3D idx > HW_BSSID_MAX ? HW_BSSID_0 : idx;
>  =09addr =3D idx > 1 ? MT_LPON_TCR2(idx): MT_LPON_TCR0(idx);
> =20
> -=09mt76_set(dev, addr, MT_LPON_TCR_MODE); /* TSF read */
> +=09mt76_rmw(dev, addr, MT_LPON_TCR_MODE, MT_LPON_TCR_READ); /* TSF read =
*/
>  =09val =3D mt76_rr(dev, MT_LPON_UTTR0);
>  =09sta->rate_set_tsf =3D (val & ~BIT(0)) | rate->rateset;
> =20
> --=20
> 2.18.0
>=20

--wDAorh6uHV8+h+wZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYKy9QwAKCRA6cBh0uS2t
rN8IAQCQ4liOss2SnQgl2OWEh8uhfFUuIF6Fr4p2lF+rUv3U8gD/Q6V9q7MqyQ4U
uOjMWqhIHyqMEdDV4eFK0f9a3gXXQw4=
=YaBR
-----END PGP SIGNATURE-----

--wDAorh6uHV8+h+wZ--



--===============4197663453915316363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4197663453915316363==--


