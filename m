Return-Path: <SRS0=Hr4j=P3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 457B0C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Nov 2021 10:10:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09AA561181
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Nov 2021 10:10:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 09AA561181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1stqvOCWFYHRxTww4IJSCu2z1zRKfIimVbCun8Kq8yY=; b=ApYKR41ej7fVhy8pSnH1S93a+D
	8EoD1RM+f4DplvhAAqXQ/TJyJSlMR3oZzQ1NBU91rI5Sn0l6bKm33F3IJ9OjqnJa2dxWvA0CrGMii
	isiL8nq70WRH/e4h7igrun0jUeCVHxyypseyDEMMq+bge8kFKjNdq0MhZTAhtQgoBi/64MCWiWFGU
	ywo9Qdgtr1KyKX1GFm4/Mjx0rdKz35D0hbQuxWcToXRUkYuNIQvkpPmY4I2vFjEXgVKPSV59q6jw1
	8Nru1SxRh1bin1ctfHkTXwROeo2i16W/cSzjO6bDij2OdW/+580WsP5R0U3kmT2HQgdYHR+wL140H
	pNP7C5xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk1bp-00FyaC-U8; Mon, 08 Nov 2021 10:10:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk1bl-00FyYy-Vk
 for linux-mediatek@lists.infradead.org; Mon, 08 Nov 2021 10:10:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636366232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=50bOBG08IAPQsOeYxYBVxGL/Ymqj+MgAeiGYuydbA5s=;
 b=C+dpwjB29y4ceSTz/vAR+PdzfkiZlaCkgi8A1lTarGYEJmctT0KK5e+ur2dZxePg1nr40A
 cEREmhLRYIJC/3y5SDV6g6G2o7kXiB4Erep3WoOBZIaQD7yhNncQ+1YzWZV/JWLmEFqTSv
 nqRkWZYqw/xfsv9uMxdpBJOypNatRiQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-5Yc5wLSmOnaKmltneQ21qg-1; Mon, 08 Nov 2021 05:10:30 -0500
X-MC-Unique: 5Yc5wLSmOnaKmltneQ21qg-1
Received: by mail-ed1-f72.google.com with SMTP id
 x13-20020a05640226cd00b003e2bf805a02so13949217edd.23
 for <linux-mediatek@lists.infradead.org>; Mon, 08 Nov 2021 02:10:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KXW6AMI8MXj+MQHQ58vJfdzGmjddNlorclH16glEsdw=;
 b=REXtwQpJtN2fyh2AYD9jDglnv1AzICXyue1WSxbQT8uDRQ5x6IIxOcAHcLLpXne63N
 7wP0i2KH6G7sGV+ARjZFFdHX/bK5DerMOppFtZmLVvkMX0DftbiXN8gXWDS9QB7oaTQ1
 BCaqykDtP+Fgfe6KDAUHz2Qsb2UoVRp8daIuo6YedvwroBA1ypB9wunO6gsxWZsLS07s
 19VAxmGPa0TM9WQ2S+UVpUuYpsGadvR5jc4JOktRPaE5ZP5kCXlF2ThjdhXe3qTiHGjV
 C5/NZRGHr7F3rg9fkMsTczD9qZmaijbxoEU9IPQfu1INHPCqI9mn59roB9eoVoGzpHtr
 WEOw==
X-Gm-Message-State: AOAM532XY/aYktIK8tIjwv/53kfeZ4P/8sVz73NMkA7KKqqTGWvfnI/b
 3sUTJOoN5AQ2CV3WGmzecBo4Rwaq7i+BVjeG0U6ZqZ/8K0Vw1wgeUzwJieYQUBwYRVW6GVZGkVv
 gKj0ZvAOIXpMvedc5uuyNMsj2edudpdJT
X-Received: by 2002:a05:6402:26c5:: with SMTP id
 x5mr48998306edd.156.1636366229414; 
 Mon, 08 Nov 2021 02:10:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxezOdH8WnAoMyjSTYWFmpw7TLlY8Nz1Xr00+4fu6NZ6ltyNejIQvmt6qFK8ObaOjS2YqkTQw==
X-Received: by 2002:a05:6402:26c5:: with SMTP id
 x5mr48998279edd.156.1636366229183; 
 Mon, 08 Nov 2021 02:10:29 -0800 (PST)
Received: from localhost (net-37-119-217-95.cust.vodafonedsl.it.
 [37.119.217.95])
 by smtp.gmail.com with ESMTPSA id q8sm3023365edd.26.2021.11.08.02.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 02:10:28 -0800 (PST)
Date: Mon, 8 Nov 2021 11:10:26 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: Deren Wu <deren.wu@mediatek.com>
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
Subject: Re: [PATCH] mt76: mt7921: introduce 160 MHz channel bandwidth support
Message-ID: <YYj3kibdi2RB4ZT5@lore-desk>
References: <d4e93e0ffa11d7126b2ab48a34d0b4a4a17f2134.1636207928.git.deren.wu@mediatek.com>
 <YYeuMs+QD067Fc5R@lore-desk>
 <8780cd7315953270b14d491dd426032a697fba0b.camel@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <8780cd7315953270b14d491dd426032a697fba0b.camel@mediatek.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lorenzo.bianconi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_021034_138880_FEE9D1F1 
X-CRM114-Status: GOOD (  21.37  )
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
Content-Type: multipart/mixed; boundary="===============9140223418333275225=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============9140223418333275225==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yvWV5q0m1emAfDVB"
Content-Disposition: inline

--yvWV5q0m1emAfDVB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi Lore,
>=20
> The definition of cap->max_bw is identical to
> ieee80211_sta_rx_bandwidth. For now, the value would be=20
> IEEE80211_STA_RX_BW_160 if the chip supports bw160.

ok, so why not something like:

dev->phy.cap.has_bw160 =3D cap->max_bw =3D=3D IEEE80211_STA_RX_BW_160;

Regards,
Lorenzo

>=20
>=20
> Regards,
> Deren
>=20
> On Sun, 2021-11-07 at 11:45 +0100, Lorenzo Bianconi wrote:
> > > From: Deren Wu <deren.wu@mediatek.com>
> > >=20
> > > Introduce the basic configuration for chips with BW160 capability
> > >=20
> > > Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> > > ---
> > >  drivers/net/wireless/mediatek/mt76/mt76.h            |  1 +
> > >  drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c |  1 +
> > >  drivers/net/wireless/mediatek/mt76/mt7921/init.c     |  4 ++++
> > >  drivers/net/wireless/mediatek/mt76/mt7921/main.c     | 12
> > > ++++++++++++
> > >  4 files changed, 18 insertions(+)
> > >=20
> > > diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h
> > > b/drivers/net/wireless/mediatek/mt76/mt76.h
> > > index e2da720a91b6..babca8086027 100644
> > > --- a/drivers/net/wireless/mediatek/mt76/mt76.h
> > > +++ b/drivers/net/wireless/mediatek/mt76/mt76.h
> > > @@ -346,6 +346,7 @@ struct mt76_hw_cap {
> > >  =09bool has_2ghz;
> > >  =09bool has_5ghz;
> > >  =09bool has_6ghz;
> > > +=09bool has_bw160;
> > >  };
> > > =20
> > >  #define MT_DRV_TXWI_NO_FREE=09=09BIT(0)
> > > diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> > > b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> > > index 26b4b875dcc0..4da20537aaf9 100644
> > > --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> > > +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> > > @@ -1775,6 +1775,7 @@ static void
> > > mt76_connac_mcu_parse_phy_cap(struct mt76_dev *dev,
> > >  =09dev->phy.chainmask =3D dev->phy.antenna_mask;
> > >  =09dev->phy.cap.has_2ghz =3D cap->hw_path & BIT(WF0_24G);
> > >  =09dev->phy.cap.has_5ghz =3D cap->hw_path & BIT(WF0_5G);
> > > +=09dev->phy.cap.has_bw160 =3D (cap->max_bw >=3D
> > > IEEE80211_STA_RX_BW_160);
> >=20
> > Hi Deren,
> >=20
> > just out of my curiosity, what are the possible values of cap->max_bw=
=20
> > here?
> >=20
> > Regards,
> > Lorenzo
> >=20
> > >  }
> > > =20
> > >  int mt76_connac_mcu_get_nic_capability(struct mt76_phy *phy)
> > > diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> > > b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> > > index 210998f086ab..30c0246fba3a 100644
> > > --- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> > > +++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> > > @@ -264,6 +264,10 @@ int mt7921_register_device(struct mt7921_dev
> > > *dev)
> > >  =09=09=09IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE |
> > >  =09=09=09IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE |
> > >  =09=09=09(3 << IEEE80211_VHT_CAP_BEAMFORMEE_STS_SHIFT);
> > > +=09if (dev->mt76.phy.cap.has_bw160)
> > > +=09=09dev->mphy.sband_5g.sband.vht_cap.cap |=3D
> > > +=09=09=09IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160MHZ |
> > > +=09=09=09IEEE80211_VHT_CAP_SHORT_GI_160;
> > > =20
> > >  =09dev->mphy.hw->wiphy->available_antennas_rx =3D dev-
> > > >mphy.chainmask;
> > >  =09dev->mphy.hw->wiphy->available_antennas_tx =3D dev-
> > > >mphy.chainmask;
> > > diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> > > b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> > > index 633c6d2a57ac..af8c675f909f 100644
> > > --- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> > > +++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> > > @@ -128,11 +128,23 @@ mt7921_init_he_caps(struct mt7921_phy *phy,
> > > enum nl80211_band band,
> > >  =09=09=09=09IEEE80211_HE_PHY_CAP9_RX_1024_QAM_LESS_
> > > THAN_242_TONE_RU |
> > >  =09=09=09=09IEEE80211_HE_PHY_CAP9_RX_FULL_BW_SU_USI
> > > NG_MU_WITH_COMP_SIGB |
> > >  =09=09=09=09IEEE80211_HE_PHY_CAP9_RX_FULL_BW_SU_USI
> > > NG_MU_WITH_NON_COMP_SIGB;
> > > +
> > > +=09=09=09if (phy->mt76->cap.has_bw160) {
> > > +=09=09=09=09he_cap_elem->phy_cap_info[0] |=3D
> > > +=09=09=09=09=09IEEE80211_HE_PHY_CAP0_CHANNEL_W
> > > IDTH_SET_160MHZ_IN_5G;
> > > +=09=09=09=09he_cap_elem->phy_cap_info[8] |=3D
> > > +=09=09=09=09=09IEEE80211_HE_PHY_CAP8_20MHZ_IN_
> > > 160MHZ_HE_PPDU |
> > > +=09=09=09=09=09IEEE80211_HE_PHY_CAP8_80MHZ_IN_
> > > 160MHZ_HE_PPDU;
> > > +=09=09=09}
> > >  =09=09=09break;
> > >  =09=09}
> > > =20
> > >  =09=09he_mcs->rx_mcs_80 =3D cpu_to_le16(mcs_map);
> > >  =09=09he_mcs->tx_mcs_80 =3D cpu_to_le16(mcs_map);
> > > +=09=09if (phy->mt76->cap.has_bw160) {
> > > +=09=09=09he_mcs->rx_mcs_160 =3D cpu_to_le16(mcs_map);
> > > +=09=09=09he_mcs->tx_mcs_160 =3D cpu_to_le16(mcs_map);
> > > +=09=09}
> > > =20
> > >  =09=09memset(he_cap->ppe_thres, 0, sizeof(he_cap-
> > > >ppe_thres));
> > >  =09=09if (he_cap_elem->phy_cap_info[6] &
> > > --=20
> > > 2.18.0
> > >=20
> >=20
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek
>=20

--yvWV5q0m1emAfDVB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYYj3kgAKCRA6cBh0uS2t
rEk8AQDSHZqT0RGI+/wxoyUgOaN0CB/nhxXVBythnuhNNJWtIwD/USeppwop+3cM
yUN7UkWhx9mDQt1ioEQDWStbEiquhgY=
=qvzV
-----END PGP SIGNATURE-----

--yvWV5q0m1emAfDVB--



--===============9140223418333275225==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============9140223418333275225==--


