Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE27C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 17:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O207rP3QyNC+tRGZoqcLw31FRJCZzonDFKhkQ0K5kc8=; b=KCGWTXLHnZY+YLEeAy51egFn8C
	uToGiSC+pkLnpJTC1c/Tb/I0GlZNEw1peldcd4eE+sQNJgmq722jMCPMIBIpqZk27cUm7xCF6ZDlZ
	33XmjHe9MMApXK1lpmmpUAlqtU/9ZJZIm5+LnEhZ/giGdGVUk75pU2ZAK0qn6/k5UMFfiK7NOqoPb
	P7j8Qp8idSQvBGb+Wz4LpK5gBlNLadH27Fpwto2DjyopXYX7AWDd3ZkBCXVe0aEV80gGab86A2r+V
	UlDvKOFma40sN0FFFwO29e4FvnEQwAL7N7PgCqIi6Y0ypMboSivN1fAGDYvCYODmLOXk8e8DCpsOf
	xMXWEvMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUXC2-00DtRW-64; Wed, 16 Mar 2022 17:12:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUXAz-00DspN-1A
 for linux-mediatek@lists.infradead.org; Wed, 16 Mar 2022 17:11:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647450665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XlihbDg7cQ33/RZefEfKPqV6TU+bN7s1DmA66a15ROQ=;
 b=XeT4F1QRja/M4SRMgILUwxajtxyi/3DiWxlDmHNPPEZvHZeEfRHxncNgUrlN9KoJttj+zx
 qHJaT1UMplBlf4sm3/tUwprlXWxCldg2rY9kLEcbnIqij7Ow0RQ+SzvtR880K4tcPcUfmX
 H3pM6oH9Q9LDVCHyT5o+nL+lvGtRaAI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-372-aW0YD16DOtitbHm5U6P4KA-1; Wed, 16 Mar 2022 13:11:03 -0400
X-MC-Unique: aW0YD16DOtitbHm5U6P4KA-1
Received: by mail-ej1-f72.google.com with SMTP id
 zd21-20020a17090698d500b006df778721f7so1506510ejb.3
 for <linux-mediatek@lists.infradead.org>; Wed, 16 Mar 2022 10:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XlihbDg7cQ33/RZefEfKPqV6TU+bN7s1DmA66a15ROQ=;
 b=6rpDaOQLVCfVvoQyULiUZF2aItBRnbnOTulqW8uyfrz+9sDC63T1xB1v7ryB0IuHsC
 zqwzYrmc36WG48Enwtf3aXzZOKnZ3wQ//mnWNvrHFE91YoMYDYLZnk+x7K70rWz8Z4Mz
 y/I5ct+r2//cReLO+0Gxee0H7xkJVJ9F6MEssFO178dN/5+LUtEzmEsEGEbbgN7m6+Cd
 aUCGITHtheEI+pMHkRC6xued2SpJx9Cmqr1CaoP9JwA6QYEHD08ibVg6ARiDuyE00347
 47iwT5k+XTSl1VHdaS4DOVNnhqXWSAJorzuZ3+AqIeQqAZdKctORLnMRh4EP/2H0xjIT
 yI9A==
X-Gm-Message-State: AOAM5326tM5dFJt+I2kcCZ20wlzL5WlMqohLk6/TNfHRzja2z2YSOLUI
 NLASf948xQZNUeFyxSifK1bWBWvE2PcIZDrPUB3uHqAVy6HD557y5YmrJG0UGbHY627Ut1t4dqI
 xvpMdatXluikx/2dV25i0bcKPY+GujcvK
X-Received: by 2002:a17:906:b157:b0:6d0:9f3b:a6aa with SMTP id
 bt23-20020a170906b15700b006d09f3ba6aamr768773ejb.365.1647450662572; 
 Wed, 16 Mar 2022 10:11:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysl79FB4NHENPw2CZv5ieSfCIyiyw42T7IAMHdtSiDaQ+TpF1nG90KDDu4PzrUVmXRwdp87A==
X-Received: by 2002:a17:906:b157:b0:6d0:9f3b:a6aa with SMTP id
 bt23-20020a170906b15700b006d09f3ba6aamr768755ejb.365.1647450662360; 
 Wed, 16 Mar 2022 10:11:02 -0700 (PDT)
Received: from localhost (mob-31-159-59-198.net.vodafone.it. [31.159.59.198])
 by smtp.gmail.com with ESMTPSA id
 u4-20020aa7db84000000b004136c2c357csm1295682edt.70.2022.03.16.10.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 10:11:01 -0700 (PDT)
Date: Wed, 16 Mar 2022 16:15:36 +0100
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
Subject: Re: [PATCH] mt76: fix monitor rx FCS error in DFS channel
Message-ID: <YjH/GCCfQoZ5OPPM@localhost.localdomain>
References: <7243650f3d51b1919bd4fd0017ff8b0186149e54.1647421054.git.deren.wu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <7243650f3d51b1919bd4fd0017ff8b0186149e54.1647421054.git.deren.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_101109_346969_C4AA349A 
X-CRM114-Status: GOOD (  15.37  )
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
Content-Type: multipart/mixed; boundary="===============0016303199572695004=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============0016303199572695004==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qGeKCzL1sC2OXSsX"
Content-Disposition: inline


--qGeKCzL1sC2OXSsX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Deren Wu <deren.wu@mediatek.com>
>=20
> When setup monitor mode in DFS channel, mt76 send CH_SWITCH_DFS to
> fw for channel config. This would cause rx performance bad while
> monitoring frames. Settings CH_SWITCH_NORMAL in monitor mode would
> get the same performance as normal channels.

Hi Deren,

>=20
> Reviewed-by: Shayne Chen <shayne.chen@mediatek.com>
> Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 3 ++-
>  drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 3 ++-
>  drivers/net/wireless/mediatek/mt76/mt7921/mcu.c | 3 ++-
>  3 files changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7615/mcu.c
> index 390add3144c2..97e2a85cb728 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> @@ -2151,7 +2151,8 @@ int mt7615_mcu_set_chan_info(struct mt7615_phy *phy=
, int cmd)
>  		.center_chan2 =3D ieee80211_frequency_to_channel(freq2),
>  	};
> =20
> -	if (cmd =3D=3D MCU_EXT_CMD(SET_RX_PATH))
> +	if (cmd =3D=3D MCU_EXT_CMD(SET_RX_PATH) ||
> +	    dev->mt76.hw->conf.flags & IEEE80211_CONF_MONITOR)

is this patch compliant with 802.11h DFS standard?

Regards,
Lorenzo

>  		req.switch_reason =3D CH_SWITCH_NORMAL;
>  	else if (phy->mt76->hw->conf.flags & IEEE80211_CONF_OFFCHANNEL)
>  		req.switch_reason =3D CH_SWITCH_SCAN_BYPASS_DPD;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7915/mcu.c
> index 10dc4bf5adec..c56d48342aaf 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> @@ -2833,7 +2833,8 @@ int mt7915_mcu_set_chan_info(struct mt7915_phy *phy=
, int cmd)
>  	}
>  #endif
> =20
> -	if (cmd =3D=3D MCU_EXT_CMD(SET_RX_PATH))
> +	if (cmd =3D=3D MCU_EXT_CMD(SET_RX_PATH) ||
> +	    dev->mt76.hw->conf.flags & IEEE80211_CONF_MONITOR)
>  		req.switch_reason =3D CH_SWITCH_NORMAL;
>  	else if (phy->mt76->hw->conf.flags & IEEE80211_CONF_OFFCHANNEL)
>  		req.switch_reason =3D CH_SWITCH_SCAN_BYPASS_DPD;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/mcu.c
> index 5ef8b24f0ab3..da2be050ed7c 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> @@ -863,7 +863,8 @@ int mt7921_mcu_set_chan_info(struct mt7921_phy *phy, =
int cmd)
>  	else
>  		req.channel_band =3D chandef->chan->band;
> =20
> -	if (cmd =3D=3D MCU_EXT_CMD(SET_RX_PATH))
> +	if (cmd =3D=3D MCU_EXT_CMD(SET_RX_PATH) ||
> +	    dev->mt76.hw->conf.flags & IEEE80211_CONF_MONITOR)
>  		req.switch_reason =3D CH_SWITCH_NORMAL;
>  	else if (dev->mt76.hw->conf.flags & IEEE80211_CONF_OFFCHANNEL)
>  		req.switch_reason =3D CH_SWITCH_SCAN_BYPASS_DPD;
> --=20
> 2.18.0
>=20

--qGeKCzL1sC2OXSsX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYjH/DwAKCRA6cBh0uS2t
rF9YAP9Ox9jPWfxbiA2T4XjcII2rxrXGYiAg+x0hhromc9pEBgD/R4XK+Ueyo2R0
7wp0X4yKB541uW2Kv6Kia5CQkbKOqwg=
=dB/z
-----END PGP SIGNATURE-----

--qGeKCzL1sC2OXSsX--



--===============0016303199572695004==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0016303199572695004==--


