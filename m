Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E5CC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 09:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xXPynTigvTJS9CxTsktt3ZmT0xRrYAFVfC6WUYPX+EY=; b=fNhKCCwGoz2QBbZBtjmbVITBB0
	g1qoAPKAAkAF2ZfFMMAiFHxLNYLeGHzm5gCQ703nPH23x75pdrrmwelhEh3Tkf75eUe169iqx+bZu
	nA17ouBzD36OICNTlYYwTwETgxwSao2McQJdEyYAvDTFVhr8QbIbBLjS+U7754RPLbvO3hrBXUBqp
	/vbC+ElXGZSgX1wYIm9dCvSwoUJVnb0Lln+rI0p91CixnLtio8I1pzxb0Ad27vOkHfXfrcpSAqIJp
	YCxRVMpxSFhy2w75fo7OmphAscB6E6AsXYrOfhH3WYU+JXVxTmVOQRekbACr9sqcfQhKPpJLGHOsZ
	VgXq0WLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7w0o-005BIo-Oc; Thu, 13 Jan 2022 09:03:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7w0m-005BHb-4i
 for linux-mediatek@lists.infradead.org; Thu, 13 Jan 2022 09:03:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642064589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4BMbfxnLngu6+tWdj31HdrfID8NRhhshpgTOYA0eHr4=;
 b=Q1NBXAOwizH7RfoT8fEUGRNh5D1K8Ho4hW6dW5H7T1SkSEm1Gz0cIiryh6AsngD5nAjcZc
 WwSeIYNODHcUCtcRHvkkp3hk7yf1l+2YH4OZg4rfa+S45TvYSCLtxXT+JNqQ859mz1bhwI
 9saZ1xHKlGaOoeAp4Dyb2/Vy+wSKN8I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-VIb_dx1gMS2HEV-TJO0R_Q-1; Thu, 13 Jan 2022 04:03:07 -0500
X-MC-Unique: VIb_dx1gMS2HEV-TJO0R_Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 r2-20020a05600c35c200b00345c3b82b22so5515882wmq.0
 for <linux-mediatek@lists.infradead.org>; Thu, 13 Jan 2022 01:03:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1mqmBL+C9EoY87rSv9X6H8gKMuL/4Q06aTTAYFVKzpI=;
 b=YwKbGyHiZjiW9EC/ohdIlhcGvcL7I+YZQ7//TD2YTb+Gssnu37NX4SjIyG/dNH79Cz
 F49luZ7cbAl4706Sq4s6E9bdL7+O/73hX3DAQZ7S3BNDi0ivW3yEyCvxDfbcSuI4CrDz
 1Dq1zckt16+e/PwvqU1XFj9khwRtChiF7ewLTCe7qp2XG1DdqO5/rEXgritgPa3XNC2s
 JyQvAlI1dwzY5s9sr6WhI4KkIHp9/oUiBcNSrdqMA37ltZoOcxbgD9bz7TG9qbNGqlL/
 oV2Ss/5V2KL/VmQRJIZ2Z/G4DFn4xekfKlfRsw3XXzx+0CkqfQv24XpHtEDtHhvTQco+
 2UuA==
X-Gm-Message-State: AOAM531f+Pb4aQ3/LHeb50WUxuRZXXci2TFwVhvWSzOvpWwrVHfiAtzP
 HbAlqAeCFSrcPT8X+NZIlU+94n0sSqpSOCRlLxN1GTUlLs/JZMrH17c+B8C7QCEZJh7/oy7iQHJ
 c39TgqCyxB16rVQAnLJVdvYsdOS6Nmbvp
X-Received: by 2002:adf:cd92:: with SMTP id q18mr3027206wrj.705.1642064586788; 
 Thu, 13 Jan 2022 01:03:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJynf47rm6EnbVMm/rqE81wiQKddc4pAT6+vAyNI4ydsepmMXmyoL1xxq6SktqSaVnrxGzWdGQ==
X-Received: by 2002:adf:cd92:: with SMTP id q18mr3027180wrj.705.1642064586525; 
 Thu, 13 Jan 2022 01:03:06 -0800 (PST)
Received: from localhost (net-93-146-37-237.cust.vodafonedsl.it.
 [93.146.37.237])
 by smtp.gmail.com with ESMTPSA id f5sm2044102wri.52.2022.01.13.01.03.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 01:03:06 -0800 (PST)
Date: Thu, 13 Jan 2022 10:03:03 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, Soul.Huang@mediatek.com, YN.Chen@mediatek.com,
 Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com,
 Mark-YW.Chen@mediatek.com, Deren.Wu@mediatek.com,
 km.lin@mediatek.com, jenhao.yang@mediatek.com,
 robin.chiu@mediatek.com, Eddie.Chen@mediatek.com,
 ch.yeh@mediatek.com, posh.sun@mediatek.com, ted.huang@mediatek.com,
 Eric.Liang@mediatek.com, Stella.Chang@mediatek.com,
 Tom.Chou@mediatek.com, steve.lee@mediatek.com, jsiuda@google.com,
 frankgor@google.com, jemele@google.com, abhishekpandit@google.com,
 shawnku@google.com, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 3/3] mt76: mt7921s: run sleep mode by default
Message-ID: <Yd/qxxa5NRB4Nh6a@lore-desk>
References: <651a010d8ff888909b5b8363fa4b243aadc62d45.1642061035.git.objelf@gmail.com>
 <9025e5bd5212cab4bd72fd76d35b205980499056.1642061035.git.objelf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <9025e5bd5212cab4bd72fd76d35b205980499056.1642061035.git.objelf@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lorenzo.bianconi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_010312_302915_B1581D47 
X-CRM114-Status: GOOD (  14.95  )
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
Content-Type: multipart/mixed; boundary="===============3574644832021932640=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============3574644832021932640==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mm8FNAEshZDj3JtJ"
Content-Disposition: inline

--mm8FNAEshZDj3JtJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> Apply sleep mode by default to reduce power consumption as possible.
>=20
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7921/init.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/n=
et/wireless/mediatek/mt76/mt7921/init.c
> index ad59ef9839dc..0166a5503aef 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> @@ -226,12 +226,8 @@ int mt7921_register_device(struct mt7921_dev *dev)
>  =09dev->pm.idle_timeout =3D MT7921_PM_TIMEOUT;
>  =09dev->pm.stats.last_wake_event =3D jiffies;
>  =09dev->pm.stats.last_doze_event =3D jiffies;
> -
> -=09/* TODO: mt7921s run sleep mode on default  */
> -=09if (mt76_is_mmio(&dev->mt76)) {
> -=09=09dev->pm.enable =3D true;
> -=09=09dev->pm.ds_enable =3D true;
> -=09}
> +=09dev->pm.enable =3D true;
> +=09dev->pm.ds_enable =3D true;

cool :)
can you please rebase this patch ontop of the following one?
Regards,
Lorenzo

https://patchwork.kernel.org/project/linux-wireless/patch/f6ad709b1a64152b5=
955e71b7eef9f9c4c7f127e.1641893305.git.lorenzo@kernel.org/

> =20
>  =09if (mt76_is_sdio(&dev->mt76))
>  =09=09hw->extra_tx_headroom +=3D MT_SDIO_TXD_SIZE + MT_SDIO_HDR_SIZE;
> --=20
> 2.25.1
>=20

--mm8FNAEshZDj3JtJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYd/qxwAKCRA6cBh0uS2t
rET2AQCQobzcikTcuq/BEtdjFrocGaxYJ2gcUDNGrg/jvZGC1AEAxxOQFaeI1dOl
lNegHjX9lDFExvmumSwGF/YgAShJGgQ=
=5lz0
-----END PGP SIGNATURE-----

--mm8FNAEshZDj3JtJ--



--===============3574644832021932640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3574644832021932640==--


