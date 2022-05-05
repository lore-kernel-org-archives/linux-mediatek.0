Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA608C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 12:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4mz1qS+LpAInCeOZVK9zwqtw6ag6cviaBgirA+fOluE=; b=fdkdwce79znwP0680+1xaD9dag
	8d/sjE8VaCIRbFgg3j2mnnloWq2JXv6zgKcCDp7RkvYpbKzi9D4Wxb802QTAKvdovdmGajjUNJRJO
	Kr6ASAE01Vp1rHAekH+UXZ3CcWBCisIoujDfb6OY7Zal9FZzzaZWu1AbCBytNoJ7H096XdARjS6NP
	eq+23OvTo4Akslf6oYLkVbu0+VyVLw5gHrVyJ5jA9h/C3qkEpSyyz8p2cHMbn+zuIkk7/OyQt3z9g
	hsDr6DtOOiKwPYilizBm8S6SRDLgqCOL/krnpcUVJGpaCNW7hIGQT3q5xWM5TD8SSZiyIuWMkNJAo
	bm1xe4tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmaUr-00FmxY-CS; Thu, 05 May 2022 12:22:17 +0000
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmaUo-00FmuJ-0P
 for linux-mediatek@lists.infradead.org; Thu, 05 May 2022 12:22:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651753329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GshgH8iXfCF4+xTmbDXAF0RSdFsyNvlSWCbyGAs7kcQ=;
 b=DBL31m+usrIBVW2mWtCMBkOjUJaPg8me8krsOrTih5FjYy/lBFYb2QH/XAktb4pc76dY/Q
 JxX+5rogOAT4+3UGlphz/0OqGNFrmIi3zokU2esakFevzXsUp4O9/S28kSKUUKSMzJgeJY
 T2L4M4aoLkuOBFu3ONgV2M2goolXCys=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-370-FRlEulsBNqi-Ovo1rU0EyQ-1; Thu, 05 May 2022 08:22:08 -0400
X-MC-Unique: FRlEulsBNqi-Ovo1rU0EyQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 p129-20020a37a687000000b0069fc31a594bso2722505qke.4
 for <linux-mediatek@lists.infradead.org>; Thu, 05 May 2022 05:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GshgH8iXfCF4+xTmbDXAF0RSdFsyNvlSWCbyGAs7kcQ=;
 b=lSlzWkNan2S3Iv6gGChqdIBN1hZ0hnA1Jp9EsRa03yEwjlc1HLAI3OqrA/lQ9LSUqT
 85WTUiZopMV3BdAqqWMkuiMGnsEe5y3+2S9Z1fNNp4bxBNG/mBD3ml3QKbfmIQzOw8xY
 NLfTIkrGM2WZ+NBHLjqoVbjV18w4nslcgSJ1cIJxnSZimOS+kzIehazCc/nPDBrDpTLN
 Q24PupsBth2j7QpVJgpQ+MwCKu/aIONaiNLILZ32KAzkCF7aA9ghriUN7st5C6ccta3F
 GWhdqASQeYl30j9VBC2aFTK71Jpi8BbIYFUxLBJRO10YGaY5AR/3K5bwvvkaWyunm157
 oOVA==
X-Gm-Message-State: AOAM532ku2YLsRQaqzRTneQnE/sk7ZtGAKl4rVpj3OSicOjNp1brSuaZ
 pEMNT05p3gpTTjQB6nfFeph+74V7NhALO1SZYn31w8VqzwQYTJgXFs4EfVXGtFknr0dDRjocXbo
 yljvthoowCV4kvh7XxAlaWPxuZQrY4YdT
X-Received: by 2002:a05:6214:c64:b0:458:bcc:8562 with SMTP id
 t4-20020a0562140c6400b004580bcc8562mr21508226qvj.30.1651753327652; 
 Thu, 05 May 2022 05:22:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydl/J2ua638U63TRMQFayxe4xxABq/X4Zwv/dHtE23jUUlyxFZ8iGjJ5dwL/Iw7X7LUKIZNw==
X-Received: by 2002:a05:6214:c64:b0:458:bcc:8562 with SMTP id
 t4-20020a0562140c6400b004580bcc8562mr21508209qvj.30.1651753327373; 
 Thu, 05 May 2022 05:22:07 -0700 (PDT)
Received: from localhost (net-93-71-56-156.cust.vodafonedsl.it. [93.71.56.156])
 by smtp.gmail.com with ESMTPSA id
 c14-20020ac8518e000000b002f39b99f694sm742651qtn.46.2022.05.05.05.22.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 05:22:06 -0700 (PDT)
Date: Thu, 5 May 2022 14:22:03 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: Peter Chiu <chui-hao.chiu@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.Lee@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 3/4] mt76: mt7915: reject duplicated twt flows
Message-ID: <YnPBaw1d3nA791PP@lore-desk>
References: <20220505082554.16656-1-chui-hao.chiu@mediatek.com>
 <20220505082554.16656-3-chui-hao.chiu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20220505082554.16656-3-chui-hao.chiu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_052214_165282_DDD04B75 
X-CRM114-Status: GOOD (  18.72  )
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
Content-Type: multipart/mixed; boundary="===============1087985215968372689=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1087985215968372689==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JuvCUEvvWg5UF+kk"
Content-Disposition: inline


--JuvCUEvvWg5UF+kk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Reject twt flows with the same parameters to prevent some potential issues
> causing by duplicated establishment.
>=20
> Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
> Reviewed-by: Shayne Chen <shayne.chen@mediatek.com>
> Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
> ---
>  .../net/wireless/mediatek/mt76/mt7915/mac.c   | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7915/mac.c
> index 94a1871fbf43..ff60a3d2d26d 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
> @@ -2601,6 +2601,34 @@ static int mt7915_mac_check_twt_req(struct ieee802=
11_twt_setup *twt)
>  	return 0;
>  }
> =20
> +static inline bool
> +mt7915_mac_twt_param_equal(struct mt7915_sta *msta,
> +			   struct ieee80211_twt_params *twt_agrt)

nit: please do not use inline in .c files.

Regards,
Lorenzo

> +{
> +	u16 type =3D le16_to_cpu(twt_agrt->req_type);
> +	u8 exp;
> +	int i;
> +
> +	exp =3D FIELD_GET(IEEE80211_TWT_REQTYPE_WAKE_INT_EXP, type);
> +	for (i =3D 0; i < MT7915_MAX_STA_TWT_AGRT; i++) {
> +		struct mt7915_twt_flow *f;
> +
> +		if (!(msta->twt.flowid_mask & BIT(i)))
> +			continue;
> +
> +		f =3D &msta->twt.flow[i];
> +		if (f->duration =3D=3D twt_agrt->min_twt_dur &&
> +		    f->mantissa =3D=3D twt_agrt->mantissa &&
> +		    f->exp =3D=3D exp &&
> +		    f->protection =3D=3D !!(type & IEEE80211_TWT_REQTYPE_PROTECTION) &&
> +		    f->flowtype =3D=3D !!(type & IEEE80211_TWT_REQTYPE_FLOWTYPE) &&
> +		    f->trigger =3D=3D !!(type & IEEE80211_TWT_REQTYPE_TRIGGER))
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>  void mt7915_mac_add_twt_setup(struct ieee80211_hw *hw,
>  			      struct ieee80211_sta *sta,
>  			      struct ieee80211_twt_setup *twt)
> @@ -2634,6 +2662,9 @@ void mt7915_mac_add_twt_setup(struct ieee80211_hw *=
hw,
>  	exp =3D FIELD_GET(IEEE80211_TWT_REQTYPE_WAKE_INT_EXP, req_type);
>  	sta_setup_cmd =3D FIELD_GET(IEEE80211_TWT_REQTYPE_SETUP_CMD, req_type);
> =20
> +	if (mt7915_mac_twt_param_equal(msta, twt_agrt))
> +		goto unlock;
> +
>  	flow =3D &msta->twt.flow[flowid];
>  	memset(flow, 0, sizeof(*flow));
>  	INIT_LIST_HEAD(&flow->list);
> --=20
> 2.18.0
>=20

--JuvCUEvvWg5UF+kk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYnPBawAKCRA6cBh0uS2t
rE7yAQCwyZ8EMpuBz+ESZCMKM1SaVuEgp5HBcs74ZdVEEI3b+AD9E449nVB0v8VY
ZsqEefKcfYF7Jgq4zv0aEX8FR+2VdAE=
=3L4/
-----END PGP SIGNATURE-----

--JuvCUEvvWg5UF+kk--



--===============1087985215968372689==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1087985215968372689==--


