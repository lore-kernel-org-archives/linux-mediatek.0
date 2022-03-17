Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E623C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Mar 2022 09:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=phWNNblko4C08ph+KUT/9tP5ehwCeTwh/L+GUgIuO54=; b=Jfx+QvkUZ/qVn8392r2b9cqiIe
	FaFbIJ6GE3CbZ/w62S9+JECkjVSGiz0p3wReL44qD5fsS8jHplrTgNQ3a4Uzgbz98lf71YlFx1ut3
	7o3vY8eiplokMTzNOrvV7BQiSimzfyUs/41ZbAPAdQ6TrEpe+hakx8qAdJnUKFUmpKaZlNioxoBhB
	K3TzsR0mJ2l/OD2H5zS/+QoAWdKu+rLbFTNG/egNda4hgOZ5A2Pd5iFhdUG4hAcLWPsPvu/GkyNG/
	GfPszxIlOvBkooHtBkcItV/eAZg7OFLE7EIR+rdxPoxRBl/s0Et8ad/21cKvgxSGf5urS38tBMiwY
	u6DTgE5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUm3A-00FT79-FZ; Thu, 17 Mar 2022 09:04:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUm38-00FT6E-D0
 for linux-mediatek@lists.infradead.org; Thu, 17 Mar 2022 09:04:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647507841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R9qqzVKD4bzKL/JelFivaINl/L/KOQW4w8HcJ8yqItI=;
 b=TDPk2emmLD3yzIg6Mb0dxw/rMPlX8hI528F9Hg47Q8N8dRUNQ4l5zVaCAr5kzbQXYj+YTi
 uP1NI/VuOoLr2R3wu390vTqoQWI8zZ4A5QiKO+cDMNrrMLB3GV881KBIkLKB2S0k3wtleD
 A8vGcPpPIWUA4wiL+VIk4kwMFoZND6k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-472-E7qYW7rpPMqM4laEbGmBvA-1; Thu, 17 Mar 2022 05:03:57 -0400
X-MC-Unique: E7qYW7rpPMqM4laEbGmBvA-1
Received: by mail-wm1-f69.google.com with SMTP id
 r83-20020a1c4456000000b00385c3f3defaso34719wma.3
 for <linux-mediatek@lists.infradead.org>; Thu, 17 Mar 2022 02:03:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=R9qqzVKD4bzKL/JelFivaINl/L/KOQW4w8HcJ8yqItI=;
 b=kmeH8uGvC08h2gZTpidoo6d827NyiHymAIcMsgtYtGfhvwTdOxbCZIfM0Wj8joITa9
 QGtWIMWoA387ZV1swuv5dHIh96KAnCzlFYYbTm6h06rmW6X5z1NjvGVzPPrvcJe2JHtP
 VdfB0zO4hranxjRpDmoSKSmmDirLwJWDhuW6gK4HIwDt1ELj7ydLBUWzE+sJ2g6VjiHB
 W257jAoFcHMlojWGNdUqkZl9o5WJduby2ZPP1LtEwMCjHlAXVlAzZBLSQLzSzSGBYa83
 bWJEu9c0yzsxXnmaP253oc49yJ0VRtCaDZEqNT8heZr1sQ/DmmQFyJtafitOtA1uk4oR
 cfMA==
X-Gm-Message-State: AOAM531zoRofdRO/N14uPZ+Dc0A73lFPOIoikSVbYwH3btPwBUj6CShF
 MaqsNuMshGAoppXSZzNagEHQSB+rQRDbXFOX6U+rUYK+06XGzNAR0kTsRDy0yXQ9UAwQwA8/QM6
 3qhZZAiLrUM+A4itZNGM987neGZiEhNrw
X-Received: by 2002:adf:816b:0:b0:203:7fae:a245 with SMTP id
 98-20020adf816b000000b002037faea245mr3072217wrm.619.1647507836525; 
 Thu, 17 Mar 2022 02:03:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzExt6iMQxlvIY5XabLDtCiG/Czc36a1klsSly4lwbam9nCGD9/JSLvaBuOG236YqudHLFxyg==
X-Received: by 2002:adf:816b:0:b0:203:7fae:a245 with SMTP id
 98-20020adf816b000000b002037faea245mr3072197wrm.619.1647507836205; 
 Thu, 17 Mar 2022 02:03:56 -0700 (PDT)
Received: from localhost (net-93-144-71-136.cust.vodafonedsl.it.
 [93.144.71.136]) by smtp.gmail.com with ESMTPSA id
 o41-20020a05600c512900b00389d8c3e2b9sm3850893wms.15.2022.03.17.02.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 02:03:55 -0700 (PDT)
Date: Thu, 17 Mar 2022 10:03:53 +0100
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
Subject: Re: [PATCH] mt76: fix monitor rx FCS error in DFS channel
Message-ID: <YjL5ecm51SUyxxpb@lore-desk>
References: <7243650f3d51b1919bd4fd0017ff8b0186149e54.1647421054.git.deren.wu@mediatek.com>
 <YjH/GCCfQoZ5OPPM@localhost.localdomain>
 <ef6a0d876587e3efaa228f9d28f5a6f7b97e4aef.camel@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <ef6a0d876587e3efaa228f9d28f5a6f7b97e4aef.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_020402_545307_CA86DA63 
X-CRM114-Status: GOOD (  22.81  )
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
Content-Type: multipart/mixed; boundary="===============7556106158216492036=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============7556106158216492036==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AuwHAuPZagE1dC5E"
Content-Disposition: inline


--AuwHAuPZagE1dC5E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi Lore,
>=20
> On Wed, 2022-03-16 at 16:15 +0100, Lorenzo Bianconi wrote:
> > > From: Deren Wu <deren.wu@mediatek.com>
> > >=20
> > > When setup monitor mode in DFS channel, mt76 send CH_SWITCH_DFS to
> > > fw for channel config. This would cause rx performance bad while
> > > monitoring frames. Settings CH_SWITCH_NORMAL in monitor mode would
> > > get the same performance as normal channels.
> >=20
> > Hi Deren,
> >=20
> > >=20
> > > Reviewed-by: Shayne Chen <shayne.chen@mediatek.com>
> > > Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> > > ---
> > >  drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 3 ++-
> > >  drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 3 ++-
> > >  drivers/net/wireless/mediatek/mt76/mt7921/mcu.c | 3 ++-
> > >  3 files changed, 6 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> > > b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> > > index 390add3144c2..97e2a85cb728 100644
> > > --- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> > > +++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> > > @@ -2151,7 +2151,8 @@ int mt7615_mcu_set_chan_info(struct
> > > mt7615_phy *phy, int cmd)
> > >  		.center_chan2 =3D ieee80211_frequency_to_channel(freq2),
> > >  	};
> > > =20
> > > -	if (cmd =3D=3D MCU_EXT_CMD(SET_RX_PATH))
> > > +	if (cmd =3D=3D MCU_EXT_CMD(SET_RX_PATH) ||
> > > +	    dev->mt76.hw->conf.flags & IEEE80211_CONF_MONITOR)
> >=20
> > is this patch compliant with 802.11h DFS standard?
>=20
> Monitor mode would not tx packets and still follow standard. We will
> keep tracking this point to avoid violations.

Hi Deren,

this IEEE80211_CONF_MONITOR flags indicates there is a monitor interface,
not it is the only one so we can have multiple vifs on the device
(e.g. AP + monitor). I was wondering if CH_SWITCH_SCAN_BYPASS_DPD is used
to avoid transmitting packets during chip calibration on DFS channels.

Regards,
Lorenzo

>=20
>=20
> Regards,
> Deren
>=20
>=20
> >=20
> > Regards,
> > Lorenzo
> >=20
> > >  		req.switch_reason =3D CH_SWITCH_NORMAL;
> > >  	else if (phy->mt76->hw->conf.flags & IEEE80211_CONF_OFFCHANNEL)
> > >  		req.switch_reason =3D CH_SWITCH_SCAN_BYPASS_DPD;
> > > diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> > > b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> > > index 10dc4bf5adec..c56d48342aaf 100644
> > > --- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> > > +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> > > @@ -2833,7 +2833,8 @@ int mt7915_mcu_set_chan_info(struct
> > > mt7915_phy *phy, int cmd)
> > >  	}
> > >  #endif
> > > =20
> > > -	if (cmd =3D=3D MCU_EXT_CMD(SET_RX_PATH))
> > > +	if (cmd =3D=3D MCU_EXT_CMD(SET_RX_PATH) ||
> > > +	    dev->mt76.hw->conf.flags & IEEE80211_CONF_MONITOR)
> > >  		req.switch_reason =3D CH_SWITCH_NORMAL;
> > >  	else if (phy->mt76->hw->conf.flags & IEEE80211_CONF_OFFCHANNEL)
> > >  		req.switch_reason =3D CH_SWITCH_SCAN_BYPASS_DPD;
> > > diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> > > b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> > > index 5ef8b24f0ab3..da2be050ed7c 100644
> > > --- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> > > +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> > > @@ -863,7 +863,8 @@ int mt7921_mcu_set_chan_info(struct mt7921_phy
> > > *phy, int cmd)
> > >  	else
> > >  		req.channel_band =3D chandef->chan->band;
> > > =20
> > > -	if (cmd =3D=3D MCU_EXT_CMD(SET_RX_PATH))
> > > +	if (cmd =3D=3D MCU_EXT_CMD(SET_RX_PATH) ||
> > > +	    dev->mt76.hw->conf.flags & IEEE80211_CONF_MONITOR)
> > >  		req.switch_reason =3D CH_SWITCH_NORMAL;
> > >  	else if (dev->mt76.hw->conf.flags & IEEE80211_CONF_OFFCHANNEL)
> > >  		req.switch_reason =3D CH_SWITCH_SCAN_BYPASS_DPD;
> > > --=20
> > > 2.18.0
> > >=20
>=20

--AuwHAuPZagE1dC5E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYjL5eQAKCRA6cBh0uS2t
rHeaAP9rpvWFTEXCqoSqp2KBbPfjlbHUhLkVwIYctyl72HZEXAD/TlpNfsswC5Of
65WCUQJGGY7nSTVIzV2Msoim8lT3RwY=
=e04/
-----END PGP SIGNATURE-----

--AuwHAuPZagE1dC5E--



--===============7556106158216492036==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7556106158216492036==--


