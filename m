Return-Path: <SRS0=FJ4T=K2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6960DC47082
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 May 2021 16:37:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26AEE6024A
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 May 2021 16:37:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26AEE6024A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qFdUILOxDTU9AHLuKI/FcxTE9IoofXFfmzXw19DgeWA=; b=OTAP6X2bJcfsQJdYSO1JSbH+DK
	fv7C0g8Caq1ixFs4zaFwDMROQztbczUmsBeFeXyGMSV32msGnwhIRb9fNAWIAvF7hNmfhLdcAo2um
	L3cli/fFMSiwyS9AwuJ+hCQ/7wvUxGbjFLunUAq9wZhaQyKndZ9X8WX4s//IWRXwY7CFi08Bi5cP6
	6gaEo/LJQOZO1h0McmVZd7iWWzwdi3cC+57NDb6Vv8S12iXe3Q534Lyt0PnYNN9L5TWu1b7CblwQ9
	yIlb6RvZ8mvUU/G9QXkrTjm923dZkCaQoD9pPUWNTvO0MGJLieVEoKEefhyo8YVEG4/WDecI+3mmk
	8W5tkkUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnkuf-00Csh2-5E; Mon, 31 May 2021 16:37:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnkub-00Csg5-J4
 for linux-mediatek@lists.infradead.org; Mon, 31 May 2021 16:37:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622479026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X33GyqQQ84BDfh2Wihl53zR1l1KTSPegr40Op0VGmlI=;
 b=WW9Pk5JKg3LTB7o6wOBZhDKjzJt8q41z74s3xyofCEGsoImzrdiWcPP7KTCHgDlEL4yp/8
 7W5Om/IMpzWux42xE4VAXvxB0D9h0tWFnrj3730tsnq6OA1hLZJEz8US5GnabTM0KINVcr
 reWz5vfcvf9u0BenaYHvQKnegx9jLe4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-EbZfqu8bOqusX34Y9XUxVg-1; Mon, 31 May 2021 12:37:02 -0400
X-MC-Unique: EbZfqu8bOqusX34Y9XUxVg-1
Received: by mail-ed1-f69.google.com with SMTP id
 z16-20020aa7d4100000b029038feb83da57so806943edq.4
 for <linux-mediatek@lists.infradead.org>; Mon, 31 May 2021 09:37:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vRiaPq4HrVEZoadvbfaVcc8TG6Dzr80c9q09+g6SHSA=;
 b=EBinudZs9cuG+uFHMZ90Ha+d4lNy5gMGZoAIbdVdT8XgO7quOimqSqzZ1Bbe5BDkoR
 kPBTbZFSz+ai9ODQCQosBivbRR1EcQdYsPHKJB/1CwBZHhne/tnV0zDRjZjRlrGMBSNB
 CTUxT47WH/yO0Uv7f0ODODRyrjBGhbEnHL7hL2vkkLicUK3Dn/Ubngo9eYwDgRk5wVf1
 DQy0/4T+9WDpFb1E6PjMUSepcZzZRhqCrBUMS4eWNOse7NZmOVIyeNwRvtp4VjWiyrjG
 ycgQI5gd0V1R8x0Y1obb3QY0M/MjNC9/zHQyFGTPCP/YOc2MGizA81RbdoJCxPiiA48v
 +F7g==
X-Gm-Message-State: AOAM532F4OoW7vcfknFeayoZN8eSOt6ifp3D7313e2Xy1ejtiiOMjHUf
 kkDGeo1bDza+kZQtn9xGtHgsPpfhfpGhz1DJX3YiDr53mSUAvICm/7732pyaA/9t3LAxhEBDV6v
 mcDVx634gJB7x3xRm0JFWLb4ddR6TMhKT
X-Received: by 2002:aa7:d294:: with SMTP id w20mr11467888edq.229.1622479020664; 
 Mon, 31 May 2021 09:37:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvS/6Ym1pqZPPg1Kkro2Oc+uWf6FJ0dXo00/t+ZtJRpvh+39HKAPQXNBnjmjSnrJqTC6GEeQ==
X-Received: by 2002:aa7:d294:: with SMTP id w20mr11467860edq.229.1622479020456; 
 Mon, 31 May 2021 09:37:00 -0700 (PDT)
Received: from localhost (net-93-71-117-34.cust.vodafonedsl.it. [93.71.117.34])
 by smtp.gmail.com with ESMTPSA id c26sm7157400edu.42.2021.05.31.09.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 May 2021 09:36:59 -0700 (PDT)
Date: Mon, 31 May 2021 18:36:56 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: Deren Wu <Deren.Wu@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
 Soul Huang <Soul.Huang@mediatek.com>,
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>,
 Eric-SY Chang <Eric-SY.Chang@mediatek.com>,
 KM Lin <km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>,
 CH Yeh <ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>,
 Eric Liang <Eric.Liang@mediatek.com>,
 Stella Chang <Stella.Chang@mediatek.com>, jemele@google.com,
 yenlinlai@google.com, linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] mt76: mt7921: enable random mac address during sched_scan
Message-ID: <YLUQqIqbojUNRZVA@lore-desk>
References: <14360a28083d56520a2cabc87841d9dee3d97a01.1622476643.git.deren.wu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <14360a28083d56520a2cabc87841d9dee3d97a01.1622476643.git.deren.wu@mediatek.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lorenzo.bianconi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_093709_732064_8261075F 
X-CRM114-Status: GOOD (  14.44  )
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
Content-Type: multipart/mixed; boundary="===============7719691491764508076=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============7719691491764508076==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/UgLne4xHOsvro2G"
Content-Disposition: inline

--/UgLne4xHOsvro2G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Deren Wu <deren.wu@mediatek.com>
>=20
> Enable src address randomization during scheduled scanning
>=20
> Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>

Here we are missing my SoB, it should be:

Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

> Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> ---
>  .../net/wireless/mediatek/mt76/mt76_connac_mcu.c   | 14 ++++++++------
>  .../net/wireless/mediatek/mt76/mt76_connac_mcu.h   |  4 +++-
>  drivers/net/wireless/mediatek/mt76/mt7921/init.c   |  3 ++-
>  3 files changed, 13 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drive=
rs/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> index 73359defa176..b155e7b8d89d 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> @@ -1515,14 +1515,16 @@ int mt76_connac_mcu_sched_scan_req(struct mt76_ph=
y *phy,
>  =09req->version =3D 1;
>  =09req->seq_num =3D mvif->scan_seq_num | ext_phy << 7;
> =20
> -=09if (is_mt7663(phy->dev) &&
> -=09    (sreq->flags & NL80211_SCAN_FLAG_RANDOM_ADDR)) {
> -=09=09get_random_mask_addr(req->mt7663.random_mac, sreq->mac_addr,
> -=09=09=09=09     sreq->mac_addr_mask);
> +=09if (sreq->flags & NL80211_SCAN_FLAG_RANDOM_ADDR) {
> +=09=09u8 *addr =3D is_mt7663(phy->dev) ? req->mt7663.random_mac
> +=09=09=09=09=09       : req->mt7921.random_mac;
> +
>  =09=09req->scan_func =3D 1;
> -=09} else if (is_mt7921(phy->dev)) {
> -=09=09req->mt7921.bss_idx =3D mvif->idx;
> +=09=09get_random_mask_addr(addr, sreq->mac_addr,
> +=09=09=09=09     sreq->mac_addr_mask);
>  =09}
> +=09if (is_mt7921(phy->dev))
> +=09=09req->mt7921.bss_idx =3D mvif->idx;
> =20
>  =09req->ssids_num =3D sreq->n_ssids;
>  =09for (i =3D 0; i < req->ssids_num; i++) {
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drive=
rs/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> index d64b8058b744..3076417ead5f 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> @@ -779,7 +779,9 @@ struct mt76_connac_sched_scan_req {
>  =09=09} mt7663;
>  =09=09struct {
>  =09=09=09u8 bss_idx;
> -=09=09=09u8 pad2[63];
> +=09=09=09u8 pad2[19];
> +=09=09=09u8 random_mac[ETH_ALEN];
> +=09=09=09u8 pad3[38];
>  =09=09} mt7921;
>  =09};
>  } __packed;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/n=
et/wireless/mediatek/mt76/mt7921/init.c
> index 59da29032645..19ce9ca72542 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> @@ -76,7 +76,8 @@ mt7921_init_wiphy(struct ieee80211_hw *hw)
>  =09wiphy->flags |=3D WIPHY_FLAG_HAS_CHANNEL_SWITCH;
>  =09wiphy->reg_notifier =3D mt7921_regd_notifier;
> =20
> -=09wiphy->features |=3D NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR;
> +=09wiphy->features |=3D NL80211_FEATURE_SCHED_SCAN_RANDOM_MAC_ADDR |
> +=09=09=09   NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR;
>  =09wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_SET_SCAN_DWELL);
> =20
>  =09ieee80211_hw_set(hw, SINGLE_SCAN_ON_ALL_BANDS);
> --=20
> 2.18.0
>=20

--/UgLne4xHOsvro2G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYLUQowAKCRA6cBh0uS2t
rOwXAP9J1ny4dm2+BniqHq6bBBulK4VdbKtFPJKhnCp002GyrgD/U2sfaKpHQBFy
cE3lFXkvdUPo8gi9E+OFBQEuM7vH2g0=
=1H2n
-----END PGP SIGNATURE-----

--/UgLne4xHOsvro2G--



--===============7719691491764508076==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7719691491764508076==--


