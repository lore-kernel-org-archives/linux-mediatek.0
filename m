Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682D2C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 12:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dZIXeUiW0107G77bJLoM4/TSj85YZbd9GBH6lw2c+1M=; b=z3hlmO5r/RT9xySqkSzkb2jFvy
	TmVsZUuvHgqY6b4VsINVBZkGDwFUL9Ilyp1AHwb7+2Tfq0t1ugiz4m2kjZSYBrWBFFlqDcY9sHGjk
	9w6LJX5GV6HMqU674geCuRvaoQlWcT+h6z6Ff7reYFCF2p2XKGkVVavunHA6nJz/tV/KF1uzeKM2j
	QBIY6K2At6iNFPAq3KPhyqKlrslRYFih6mP2QP8wu1RN69nveLHa0MDvA3kOHa/QLRc64MxRMveRs
	H+Z67K6rjjfIsk5GyNDVPuQh4kpS0Hn+lNX+AUIGG1CLEIAn+h72CYx3KmIL1vXJnvfUQbColDNjp
	IQbiiqtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmaWP-00FnOL-Fo; Thu, 05 May 2022 12:23:53 +0000
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmaWM-00FnNK-Mj
 for linux-mediatek@lists.infradead.org; Thu, 05 May 2022 12:23:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651753429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QcsOcEMvsqnCf6UZrePD7jQ/rSeh0SyWcmsGWJFMGXI=;
 b=aksvWjbosW5vK2opycTO9xBHejuI8OYiamTHGLATbbNn6Aqiqbj6hDEKGBNYOaEf+IZEqE
 SsY8GKQknU864G2b/J5g321NdNt/37/2Op/3yveI+zYKckKCcwrIC6++vXxJEPOV36MoBf
 0vQZaWQW7dTtcvv29dB2yNlO3nwVFu8=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-Je1WvZuaNWKjtgeKtqFlFA-1; Thu, 05 May 2022 08:23:46 -0400
X-MC-Unique: Je1WvZuaNWKjtgeKtqFlFA-1
Received: by mail-qt1-f199.google.com with SMTP id
 n4-20020ac85b44000000b002f3940d55eeso3173349qtw.19
 for <linux-mediatek@lists.infradead.org>; Thu, 05 May 2022 05:23:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QcsOcEMvsqnCf6UZrePD7jQ/rSeh0SyWcmsGWJFMGXI=;
 b=1cFB0Kqtrow5QKLyeTJE3fr3J6xMZPOjxmm6qT0jp/AwJAWJOocSJ/WznDb1nSvsEM
 RCoinuys7J9t+FT9SoBn+M9oVC1EBVg4kqHxZUNeT68MITtzWkkAKiHCrXVu+T+fQxes
 ZNwV6fZLdD0V+Z82+8UZ2sCFQTw0XA2Uzq1UWNU62R8Ht7sjRI8NqD3Ch3e4qmdPdyJO
 ube6pGVKdpK4asQcdclvPOjcEhjwIICR2Jvyx1Dx+N6izRdzkpvvw3UFLtxa5geRQbBd
 BlBvA1du2YemR63wjjKc7kqCGhno9S64OvTDjW1NrbMeRky+lr97yVG9ZugSKDkTKnXi
 pf4Q==
X-Gm-Message-State: AOAM532nu6kPRPUcQO7ZcHnK1LSRBD9hjLXdK8VyMjxnoCeIDt/rEc0E
 /wPuquncIS7+TUpynKcRLFsulAWs031KurUN8HfWTr7B9qP2BsJ1KC38np8sdOIq/bfeq9GzrHO
 GdLt6cp3kTuyHXxoyIs8ZwlPthIVfNerc
X-Received: by 2002:a05:622a:155:b0:2f3:9484:c38e with SMTP id
 v21-20020a05622a015500b002f39484c38emr23562463qtw.494.1651753426118; 
 Thu, 05 May 2022 05:23:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyJRla323wzGrhG3S0ilXmd71jkpt3k18ql7zftEjrnnjfMRtJ3Xq8s+j7dAMI8ks4/R8VFA==
X-Received: by 2002:a05:622a:155:b0:2f3:9484:c38e with SMTP id
 v21-20020a05622a015500b002f39484c38emr23562449qtw.494.1651753425862; 
 Thu, 05 May 2022 05:23:45 -0700 (PDT)
Received: from localhost (net-93-71-56-156.cust.vodafonedsl.it. [93.71.56.156])
 by smtp.gmail.com with ESMTPSA id
 h16-20020ac85690000000b002f39b99f6b0sm712531qta.74.2022.05.05.05.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 05:23:45 -0700 (PDT)
Date: Thu, 5 May 2022 14:23:43 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: Peter Chiu <chui-hao.chiu@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.Lee@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 4/4] mt76: mt7915: limit minimum twt duration
Message-ID: <YnPBz8uB6A5kAPRs@lore-desk>
References: <20220505082554.16656-1-chui-hao.chiu@mediatek.com>
 <20220505082554.16656-4-chui-hao.chiu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20220505082554.16656-4-chui-hao.chiu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_052350_874924_AAB36A14 
X-CRM114-Status: GOOD (  15.29  )
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
Content-Type: multipart/mixed; boundary="===============6850494626100978033=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6850494626100978033==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+n6cusc1+H32NyZz"
Content-Disposition: inline


--+n6cusc1+H32NyZz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> The minimum twt duration supported by mt7915 is 64 according to hardware
> design. Reply station with TWT_SETUP_CMD_DICTATE if min_twt_dur smaller
> than 64.
>=20
> Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7915/mac.c
> index ff60a3d2d26d..e912ecacb578 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
> @@ -2633,6 +2633,7 @@ void mt7915_mac_add_twt_setup(struct ieee80211_hw *=
hw,
>  			      struct ieee80211_sta *sta,
>  			      struct ieee80211_twt_setup *twt)
>  {
> +#define MT7915_MIN_TWT_DUR 64

nit: can you please move MT7915_MIN_TWT_DUR in mt7915.h since we have other=
 twt
defs there?

Regards,
Lorenzo

>  	enum ieee80211_twt_setup_cmd setup_cmd =3D TWT_SETUP_CMD_REJECT;
>  	struct mt7915_sta *msta =3D (struct mt7915_sta *)sta->drv_priv;
>  	struct ieee80211_twt_params *twt_agrt =3D (void *)twt->params;
> @@ -2654,6 +2655,12 @@ void mt7915_mac_add_twt_setup(struct ieee80211_hw =
*hw,
>  	if (hweight8(msta->twt.flowid_mask) =3D=3D ARRAY_SIZE(msta->twt.flow))
>  		goto unlock;
> =20
> +	if (twt_agrt->min_twt_dur < MT7915_MIN_TWT_DUR) {
> +		setup_cmd =3D TWT_SETUP_CMD_DICTATE;
> +		twt_agrt->min_twt_dur =3D MT7915_MIN_TWT_DUR;
> +		goto unlock;
> +	}
> +
>  	flowid =3D ffs(~msta->twt.flowid_mask) - 1;
>  	le16p_replace_bits(&twt_agrt->req_type, flowid,
>  			   IEEE80211_TWT_REQTYPE_FLOWID);
> --=20
> 2.18.0
>=20

--+n6cusc1+H32NyZz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYnPBzgAKCRA6cBh0uS2t
rIDQAQDhYHrCwxPJjf+p21ntsjh+bDF1Fl6SHSsDHIwXcbhO+gEAxiJlnm+G3ce6
aoT9Jliuc4p2blzcYR4vsx5a7D8BzQs=
=/2O9
-----END PGP SIGNATURE-----

--+n6cusc1+H32NyZz--



--===============6850494626100978033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6850494626100978033==--


