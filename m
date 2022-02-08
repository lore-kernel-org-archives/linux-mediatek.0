Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8E4C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 23:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yqv3QtMnuxWCuA5EgoSIiEaWkoR6AniyPM16/5NU6Vo=; b=OdoGAcP+MNMIc7Pbotf0GHQC9/
	f1ftV5oR9YUwk/JRr30/nwRF4KCjigVdQIAxiizQI+UzihPkblpuq4WgrW68aGC7ZJTC7+n7X9EMD
	h0ULuVLQqCx/swBkKqfgvOGDxKexQzDz4JxIaExFXrCUybLuKBsufhcxdTdJzl/fVwGijHSxlfoud
	gCpzoYTGN2iKSImkd7PGGWfJx3u1+VmmnLu5uZbhWDN0w8iLQUZF9i4dxaObJbfCurXgIIDeuxkrJ
	otJn/wSGzajIOkwg6lU+XwYLPg5V9k1NVz+NrMPgRgfRw/JrlBjJ6MIhXpuA3nWBOcFExtJ7QjZAd
	P1vmvo8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHa1h-00FoCf-Ci; Tue, 08 Feb 2022 23:36:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHa1e-00FoCD-MB
 for linux-mediatek@lists.infradead.org; Tue, 08 Feb 2022 23:36:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644363357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4gUWiq+74QlIEUtV8k6AMm5Mexy3uHfwzxBHghknuDU=;
 b=P1X+WiIuIqGeX7psQRlO/5pEmYEcLgi6SGCOZJO6cZIP7BJ5iEWDWEWbAdV5YhyYiPjGpE
 /21q/ACm2KgB1P/QhkJy0yclQRqe/JFEIeQJNUn1tcmVB6McMcTIzkKukw4/YtCPuaDWwE
 K/Lm1SdA03MzjXMKm6FD9ierLdso9WU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-ROJDvnPzO4epfwcxyOmMcg-1; Tue, 08 Feb 2022 18:35:56 -0500
X-MC-Unique: ROJDvnPzO4epfwcxyOmMcg-1
Received: by mail-qv1-f70.google.com with SMTP id
 gi11-20020a056214248b00b0042c2cc3c1b9so426651qvb.9
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Feb 2022 15:35:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4gUWiq+74QlIEUtV8k6AMm5Mexy3uHfwzxBHghknuDU=;
 b=qwqmDoHs2wFoszpFZtZh6PuNKKIOj4uoHNcsiHT6W6PWmxiiYYjnhIz11l6Z1VsS8F
 I04wD4awDxlmOIf8/DJXbikiG052reRXYd86+4LX1nL+XOPGUitUJ3jkxgL3ljyjnge0
 QlKOj6wKF5soIk8iAnTLryqNphxWhQANM7vEhLGOQjlOg1ndo5BA4x7uS4hReCDX247Z
 nKu0P5XK2U/fg3D8kIi6kSUmOuQv/HV0yTtbAcGjua8XrLF/JFkIV0pPe3K91MDf1QGi
 ccPezfTapy5b8dVEBPfFjN/tre/5MFo8uw7ALsI85/GW8QwyfFinCMqsc6E2CXjKh4/X
 eNpA==
X-Gm-Message-State: AOAM533uKE7GEPTEsz1LMb2wpsLGaqUUDZPh8n3DqEKl0CTVk+CehDVQ
 ew2To0nVaCTxTfqstfT1jDxjR+gXq6XtyHL4XUJ/eNeLb+0tmRKV5gD1xgFqWeBDpirjZKqa31s
 dZOo/Hy+ehMRaKJj8O4fHo03U4op9AT/e
X-Received: by 2002:ad4:5cae:: with SMTP id q14mr4879623qvh.126.1644363356017; 
 Tue, 08 Feb 2022 15:35:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJymTkuKZ9jsxgG+GM5tzqj9PrsVW8WIR5EMx5S8AEODNHEcrSqfncfbdu5p2sySdZo+Qrf/lQ==
X-Received: by 2002:ad4:5cae:: with SMTP id q14mr4879592qvh.126.1644363355806; 
 Tue, 08 Feb 2022 15:35:55 -0800 (PST)
Received: from localhost (net-37-182-17-113.cust.vodafonedsl.it.
 [37.182.17.113])
 by smtp.gmail.com with ESMTPSA id u63sm7555887qkh.43.2022.02.08.15.35.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 15:35:55 -0800 (PST)
Date: Wed, 9 Feb 2022 00:35:52 +0100
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
Subject: Re: [PATCH] mt76: mt7921s: fix missing fc type/sub-type for 802.11
 pkts
Message-ID: <YgL+WITtN7um1Rlt@lore-desk>
References: <33dd8e4b7f7f72d191e8eca88b33b32dbf2595d2.1644313224.git.deren.wu@mediatek.com>
 <YgL+HfN/xaiA40yc@lore-desk>
MIME-Version: 1.0
In-Reply-To: <YgL+HfN/xaiA40yc@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_153558_825626_42DAEF2B 
X-CRM114-Status: GOOD (  18.95  )
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
Content-Type: multipart/mixed; boundary="===============5804423660051594460=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============5804423660051594460==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FsvhqALiCu0TIavk"
Content-Disposition: inline


--FsvhqALiCu0TIavk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> >=20
> > For non-mmio devices, should set fc values to proper txwi config
> >=20
> > Fixes: 48fab5bbef40 ("mt76: mt7921: introduce mt7921s support")
> > Co-developed-by: Leon Yen <Leon.Yen@mediatek.com>
> > Signed-off-by: Leon Yen <Leon.Yen@mediatek.com>
> > Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> > ---
> >  drivers/net/wireless/mediatek/mt76/mt7921/mac.c | 13 ++++++++++---
> >  drivers/net/wireless/mediatek/mt76/mt7921/mac.h |  3 +++
> >  2 files changed, 13 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/=
net/wireless/mediatek/mt76/mt7921/mac.c
> > index d17558349a17..e403f0225b77 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
> > @@ -852,6 +852,7 @@ mt7921_mac_write_txwi_80211(struct mt7921_dev *dev,=
 __le32 *txwi,
> >  	__le16 fc =3D hdr->frame_control;
> >  	u8 fc_type, fc_stype;
> >  	u32 val;
> > +	bool is_mmio =3D mt76_is_mmio(&dev->mt76);
> > =20
> >  	if (ieee80211_is_action(fc) &&
> >  	    mgmt->u.action.category =3D=3D WLAN_CATEGORY_BACK &&
> > @@ -912,9 +913,15 @@ mt7921_mac_write_txwi_80211(struct mt7921_dev *dev=
, __le32 *txwi,
> >  		txwi[3] |=3D cpu_to_le32(val);
> >  	}
> > =20
> > -	val =3D FIELD_PREP(MT_TXD7_TYPE, fc_type) |
> > -	      FIELD_PREP(MT_TXD7_SUB_TYPE, fc_stype);
> > -	txwi[7] |=3D cpu_to_le32(val);
> > +	if (is_mmio) {
>=20
> Nit: we do need is_mmio variable since it is used just here.

s/do need/do not need/

>=20
> Regards,
> Lorenzo
>=20
> > +		val =3D FIELD_PREP(MT_TXD7_TYPE, fc_type) |
> > +		      FIELD_PREP(MT_TXD7_SUB_TYPE, fc_stype);
> > +		txwi[7] |=3D cpu_to_le32(val);
> > +	} else {
> > +		val =3D FIELD_PREP(MT_TXD8_L_TYPE, fc_type) |
> > +		      FIELD_PREP(MT_TXD8_L_SUB_TYPE, fc_stype);
> > +		txwi[8] |=3D cpu_to_le32(val);
> > +	}
> >  }
> > =20
> >  void mt7921_mac_write_txwi(struct mt7921_dev *dev, __le32 *txwi,
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.h b/drivers/=
net/wireless/mediatek/mt76/mt7921/mac.h
> > index 544a1c33126a..12e1cf8abe6e 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.h
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.h
> > @@ -284,6 +284,9 @@ enum tx_mcu_port_q_idx {
> >  #define MT_TXD7_HW_AMSDU		BIT(10)
> >  #define MT_TXD7_TX_TIME			GENMASK(9, 0)
> > =20
> > +#define MT_TXD8_L_TYPE			GENMASK(5, 4)
> > +#define MT_TXD8_L_SUB_TYPE		GENMASK(3, 0)
> > +
> >  #define MT_TX_RATE_STBC			BIT(13)
> >  #define MT_TX_RATE_NSS			GENMASK(12, 10)
> >  #define MT_TX_RATE_MODE			GENMASK(9, 6)
> > --=20
> > 2.18.0
> >=20



--FsvhqALiCu0TIavk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYgL+WAAKCRA6cBh0uS2t
rJd1AQCPuX2XQPFZEKJ9O+QfqtnV7HMWbS3JtgXJCN9E4HTMGQEAlxJO/0yDjJu3
cNFZLPa4lTc5Ii9D7zo9QnsZHgeHogA=
=5SV3
-----END PGP SIGNATURE-----

--FsvhqALiCu0TIavk--



--===============5804423660051594460==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5804423660051594460==--


