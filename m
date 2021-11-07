Return-Path: <SRS0=P7oD=P2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77BA8C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Nov 2021 10:45:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32A0C61458
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Nov 2021 10:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 32A0C61458
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HCf5jlIfA6IcjHnVN4OfCaltj24AgQpUG38F5jqc50A=; b=V8b50i9rFHvmgx96JQG6hMRnVV
	R5JgfqyDqOszy43ASIZp3c2V+BpYy6Wt9Zw7i8T7KLZzrvgvXoONVSVPeMCauV8ElQW6GjCH1jQ23
	gz35zCW7HbAARcF2DM54GsuAWHwqBJFnahZ5Zd9krjZv/QIZUqemsS3nFjFA+6sDb9rTl3BYak+RG
	WRwaAI3OdhtUQA2knvxw4Gy0+5PBUh+NHgZnLoIDmBMMrVJa13nklytHVC3tFxR+zMWcW5sekHOl4
	hK4pkkwE1hCLo9jWTrnPdgDzyEMBb4Hpo2zclGC8Dom68iSKQFH86gtF+sx1FcLcvVgobOoyMuroa
	t0qHNeHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjffr-00EFtJ-Sh; Sun, 07 Nov 2021 10:45:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjffp-00EFsc-00
 for linux-mediatek@lists.infradead.org; Sun, 07 Nov 2021 10:45:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636281913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6oeObJFXhl/oniAr4oPszl48vc/jj1i1R0cpfxnp+LU=;
 b=OORDuZIUvhRrUuGNM6fggy8RTzc8zDUkzyqrX8e9nkRvrd6ty1PDbxsyn+w34NHu/O61Fm
 f6vgiT/KHaK/ysznC0xRdpUoslyRo7ROBfLJqmdIrAdvhoQsFwgvPiBYM4BmaPqWqRfOLG
 B46y/UeKvwdY+Mj0TRP+BtUP2i0eYzI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-LW5_Q1RmOnCQoEX1Pkd6iA-1; Sun, 07 Nov 2021 05:45:10 -0500
X-MC-Unique: LW5_Q1RmOnCQoEX1Pkd6iA-1
Received: by mail-ed1-f69.google.com with SMTP id
 v9-20020a50d849000000b003dcb31eabaaso12561224edj.13
 for <linux-mediatek@lists.infradead.org>; Sun, 07 Nov 2021 02:45:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RE6EFAuJXOYv4UHVe2iYkIAN9i0e/KfF1f5Ap0JKFL4=;
 b=uFBcQ/wTYSx8wDyG3Gvyy8eoO2Kmh5s47F+ctt8k8LQI5yYIgS2esV9OvbZTST4b3x
 hrD8POmZBU8xkKi8BnWWwKqzZ8v55ItFju9BcQN4YnJP0/2wsodIcC1W2XVCPpNPeK85
 TaF7paB0WfITQWombuElaPHecrKal+l0yadCXOPjOCK4h9HIcIZ7lA4XUPL2OX8hY/Et
 SxVE5ePI90BCkm5WgHRKbuhcO4hmxmt3LsCGIHwlUqYoDAkjdzt2b56UZGdgtxBmkEg/
 6IaBqyvSJkaCddr5B7M2WSD2SxiZQxBfpP0IWJLkyDxxdKc+R4tefdWklsnxNOKUbQU6
 dtqA==
X-Gm-Message-State: AOAM53209k1fMdHE4JShqFh+6Oc2ZaePof4+SsZVUjwAudpsp1T3NYLB
 30fcFHO/3aFAKeVVoVZlQxMfPW+nd1q/xox5KlLq/+okdmwOybHHrHPq1vpf0W9n+bi8jP4UMVs
 Y0MBu7cO/bxrTwE9x3QQwTxYGag6GCYuM
X-Received: by 2002:aa7:cd8a:: with SMTP id x10mr52255673edv.3.1636281909173; 
 Sun, 07 Nov 2021 02:45:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy4V9qqqwMnFSOOA4xPXMVq94YF5bwuZX+sW66L0U8om9LRXvWMJN5vnyhSCrVbIrMDGVTq+w==
X-Received: by 2002:aa7:cd8a:: with SMTP id x10mr52255632edv.3.1636281908927; 
 Sun, 07 Nov 2021 02:45:08 -0800 (PST)
Received: from localhost (net-37-119-217-95.cust.vodafonedsl.it.
 [37.119.217.95])
 by smtp.gmail.com with ESMTPSA id j3sm6532546ejo.2.2021.11.07.02.45.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 02:45:08 -0800 (PST)
Date: Sun, 7 Nov 2021 11:45:06 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: Deren Wu <Deren.Wu@mediatek.com>
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
Message-ID: <YYeuMs+QD067Fc5R@lore-desk>
References: <d4e93e0ffa11d7126b2ab48a34d0b4a4a17f2134.1636207928.git.deren.wu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <d4e93e0ffa11d7126b2ab48a34d0b4a4a17f2134.1636207928.git.deren.wu@mediatek.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lorenzo.bianconi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211107_024517_166582_C5D83450 
X-CRM114-Status: GOOD (  14.05  )
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
Content-Type: multipart/mixed; boundary="===============1406035918182835120=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============1406035918182835120==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pFtmkrBWDeyFXsfP"
Content-Disposition: inline

--pFtmkrBWDeyFXsfP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Deren Wu <deren.wu@mediatek.com>
>=20
> Introduce the basic configuration for chips with BW160 capability
>=20
> Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt76.h            |  1 +
>  drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c |  1 +
>  drivers/net/wireless/mediatek/mt76/mt7921/init.c     |  4 ++++
>  drivers/net/wireless/mediatek/mt76/mt7921/main.c     | 12 ++++++++++++
>  4 files changed, 18 insertions(+)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wire=
less/mediatek/mt76/mt76.h
> index e2da720a91b6..babca8086027 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76.h
> @@ -346,6 +346,7 @@ struct mt76_hw_cap {
>  =09bool has_2ghz;
>  =09bool has_5ghz;
>  =09bool has_6ghz;
> +=09bool has_bw160;
>  };
> =20
>  #define MT_DRV_TXWI_NO_FREE=09=09BIT(0)
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drive=
rs/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> index 26b4b875dcc0..4da20537aaf9 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> @@ -1775,6 +1775,7 @@ static void mt76_connac_mcu_parse_phy_cap(struct mt=
76_dev *dev,
>  =09dev->phy.chainmask =3D dev->phy.antenna_mask;
>  =09dev->phy.cap.has_2ghz =3D cap->hw_path & BIT(WF0_24G);
>  =09dev->phy.cap.has_5ghz =3D cap->hw_path & BIT(WF0_5G);
> +=09dev->phy.cap.has_bw160 =3D (cap->max_bw >=3D IEEE80211_STA_RX_BW_160)=
;

Hi Deren,

just out of my curiosity, what are the possible values of cap->max_bw here?

Regards,
Lorenzo

>  }
> =20
>  int mt76_connac_mcu_get_nic_capability(struct mt76_phy *phy)
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/n=
et/wireless/mediatek/mt76/mt7921/init.c
> index 210998f086ab..30c0246fba3a 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> @@ -264,6 +264,10 @@ int mt7921_register_device(struct mt7921_dev *dev)
>  =09=09=09IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE |
>  =09=09=09IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE |
>  =09=09=09(3 << IEEE80211_VHT_CAP_BEAMFORMEE_STS_SHIFT);
> +=09if (dev->mt76.phy.cap.has_bw160)
> +=09=09dev->mphy.sband_5g.sband.vht_cap.cap |=3D
> +=09=09=09IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160MHZ |
> +=09=09=09IEEE80211_VHT_CAP_SHORT_GI_160;
> =20
>  =09dev->mphy.hw->wiphy->available_antennas_rx =3D dev->mphy.chainmask;
>  =09dev->mphy.hw->wiphy->available_antennas_tx =3D dev->mphy.chainmask;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7921/main.c
> index 633c6d2a57ac..af8c675f909f 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> @@ -128,11 +128,23 @@ mt7921_init_he_caps(struct mt7921_phy *phy, enum nl=
80211_band band,
>  =09=09=09=09IEEE80211_HE_PHY_CAP9_RX_1024_QAM_LESS_THAN_242_TONE_RU |
>  =09=09=09=09IEEE80211_HE_PHY_CAP9_RX_FULL_BW_SU_USING_MU_WITH_COMP_SIGB =
|
>  =09=09=09=09IEEE80211_HE_PHY_CAP9_RX_FULL_BW_SU_USING_MU_WITH_NON_COMP_S=
IGB;
> +
> +=09=09=09if (phy->mt76->cap.has_bw160) {
> +=09=09=09=09he_cap_elem->phy_cap_info[0] |=3D
> +=09=09=09=09=09IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G;
> +=09=09=09=09he_cap_elem->phy_cap_info[8] |=3D
> +=09=09=09=09=09IEEE80211_HE_PHY_CAP8_20MHZ_IN_160MHZ_HE_PPDU |
> +=09=09=09=09=09IEEE80211_HE_PHY_CAP8_80MHZ_IN_160MHZ_HE_PPDU;
> +=09=09=09}
>  =09=09=09break;
>  =09=09}
> =20
>  =09=09he_mcs->rx_mcs_80 =3D cpu_to_le16(mcs_map);
>  =09=09he_mcs->tx_mcs_80 =3D cpu_to_le16(mcs_map);
> +=09=09if (phy->mt76->cap.has_bw160) {
> +=09=09=09he_mcs->rx_mcs_160 =3D cpu_to_le16(mcs_map);
> +=09=09=09he_mcs->tx_mcs_160 =3D cpu_to_le16(mcs_map);
> +=09=09}
> =20
>  =09=09memset(he_cap->ppe_thres, 0, sizeof(he_cap->ppe_thres));
>  =09=09if (he_cap_elem->phy_cap_info[6] &
> --=20
> 2.18.0
>=20

--pFtmkrBWDeyFXsfP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYYeuMgAKCRA6cBh0uS2t
rDZRAPwKmeF6/0MuMzQcTou3JM4/mLpNEXiHQKOGPkIdpHk6VQD/dtMQo54IVMUP
klNiHyYxzV/4+q+IExvrsnf65wJcbAo=
=6xyL
-----END PGP SIGNATURE-----

--pFtmkrBWDeyFXsfP--



--===============1406035918182835120==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1406035918182835120==--


