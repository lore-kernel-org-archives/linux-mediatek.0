Return-Path: <SRS0=Ndyv=OF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C292C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 13:24:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 446FE60BD3
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 13:24:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 446FE60BD3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mxKITSWAO+43PPIAqZ9FCwfm6y/Xw74YqcOGrxd4kDw=; b=xQkjzXTAaL9sjpSBvgICDK2gPj
	c86eoMwGyx1OEc1R4R4uqyel9e6Sl5d2pYXKBhrStK24w9H7nx1z9q2v3U/ZJD/pcXX54bEL6zcPd
	R93TvE+voZHIqpqCRIK0vutYBRjn0VwDDgCT7PpCeMEgX0CygWHHne+gdUxNxZsRxLeHLjfY5vJU5
	VukljtlMATP8p1IjUw57DqkZSf0wMMI/LOAotNlnwgHRjJQ1xNVDgTZV85GBwOOp62aPee9vcAfdv
	F8DVDMZGYVrXse3y8olbtsKqhRAnR0tWSBmGDXeqIwqBuGkHX8pYBPdZMHFP5X2TtPuHGy3JwN9if
	hh1ams6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQUtm-009Alb-PD; Wed, 15 Sep 2021 13:24:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQUtk-009AkY-5I
 for linux-mediatek@lists.infradead.org; Wed, 15 Sep 2021 13:24:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631712262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=px17d85bRMukwBqfTjayWe+5fD+uRAHJyBHJGoA0hPU=;
 b=IvoB7LPL5w971kXv6YFDA7n1YkOalpi9HE7WTkbl4eYOZbwMfqMO/EAeBQaQkH8fcIwaQo
 win6szi17txAeEwz9EOqqoiN6AY6DGGTTWyedsohkqRdXdvMaY2PdmkC3aaYsiYPmj0h5M
 jGh/yTynAoW3HiQTGSaMIxHl4MQRhqs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-4PvtXPHNPRmv5Exc4J5bVA-1; Wed, 15 Sep 2021 09:24:19 -0400
X-MC-Unique: 4PvtXPHNPRmv5Exc4J5bVA-1
Received: by mail-ej1-f70.google.com with SMTP id
 22-20020a170906301600b005ca77a21183so1495661ejz.20
 for <linux-mediatek@lists.infradead.org>; Wed, 15 Sep 2021 06:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+EQHPW1j/nr8yBB9ckR7pNX7dfQl5K4J9lCzHHL/teg=;
 b=kkaQ5jh79Ta6tgWN1/eD4lw3QEoB/OJAJ2VGwsWPBORurlo8qTs1IBczkxXSw1BY+j
 p2xxWR5Nhv3vEZfZ9Xly8ShStinaJG4GzfVDX9oqqH917ePzOF6A4N9gJV6PJ9ve/A2D
 EFrrcqpwCIS7cjwPeSdaiP+Zhx4Ympg1rADiJRTH5ptuZzN1jha98yDEMgHkk73k1C7v
 cVy556fiIZgDVwWhgx0+0iyY2QnLWBq67jBD/jw6RCwb1Ndbb9fd7gZTdf4jkK8h8P+z
 z4Jh3wwsbwmHdZvYi7XVHaBfIYStoqMXJcPxKQaZBodpDdHzaSPHLiDACB2qyG3nPEy5
 CFMA==
X-Gm-Message-State: AOAM531qJOFCfHpPV1qHldobCBQeWHyg59Vwpk0YZEQrHxH9SOgUidef
 TRZFsd5RulIcJdOiZebcgSR6KfcZBLzIM9uwL92xDxv+smYT2tn8fZHX/oJ9TiffTVLaXVvYUKK
 MYnfTWJu2U7BNFlx/Jr7qYi8yRHcXfkJe
X-Received: by 2002:a17:906:4482:: with SMTP id
 y2mr24782916ejo.484.1631712258473; 
 Wed, 15 Sep 2021 06:24:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGhhUn9t+zvG660uUbpSHBfnmNPN2Mz5JTmqPiz+EIA/vy6KNBIPqNqgzUtVR7IdJeSClfcg==
X-Received: by 2002:a17:906:4482:: with SMTP id
 y2mr24782887ejo.484.1631712258259; 
 Wed, 15 Sep 2021 06:24:18 -0700 (PDT)
Received: from localhost (net-130-25-199-50.cust.vodafonedsl.it.
 [130.25.199.50])
 by smtp.gmail.com with ESMTPSA id o15sm6277378ejj.10.2021.09.15.06.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 06:24:17 -0700 (PDT)
Date: Wed, 15 Sep 2021 15:24:14 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, Soul.Huang@mediatek.com, YN.Chen@mediatek.com,
 Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com,
 Deren.Wu@mediatek.com, km.lin@mediatek.com, robin.chiu@mediatek.com,
 Eddie.Chen@mediatek.com, ch.yeh@mediatek.com, posh.sun@mediatek.com,
 ted.huang@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, steve.lee@mediatek.com,
 jemele@google.com, shawnku@google.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v1 09/16] mt76: mt7921: make all event parser resuable
 between mt7921s and mt7921e
Message-ID: <YUHz/gbfzmFszods@lore-desk>
References: <cover.1631667941.git.objelf@gmail.com>
 <764759a9a2befe09000863f04676287665675555.1631667941.git.objelf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <764759a9a2befe09000863f04676287665675555.1631667941.git.objelf@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lorenzo.bianconi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_062424_321204_CFFB4253 
X-CRM114-Status: GOOD (  16.25  )
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
Content-Type: multipart/mixed; boundary="===============8605750656475052625=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============8605750656475052625==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gRsDsI6iq8aKspqC"
Content-Disposition: inline

--gRsDsI6iq8aKspqC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> The longer event such as the event for mcu_get_nic_capability would hold
> the data in paged fragment skb for the SDIO device so we turn the skb to
> be linearized skb before accessing it to reuse the same event parser
> betweem mt7921s and mt7921e.
>=20
> Tested-by: Deren Wu <deren.wu@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7921/mcu.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/mcu.c
> index f5a8f7fa4244..8e49df20a8cb 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> @@ -458,7 +458,14 @@ mt7921_mcu_rx_unsolicited_event(struct mt7921_dev *d=
ev, struct sk_buff *skb)
> =20
>  void mt7921_mcu_rx_event(struct mt7921_dev *dev, struct sk_buff *skb)
>  {
> -=09struct mt7921_mcu_rxd *rxd =3D (struct mt7921_mcu_rxd *)skb->data;
> +=09struct mt7921_mcu_rxd *rxd;
> +=09int ret;
> +
> +=09ret =3D skb_linearize(skb);

is it true for sdio only? if so what about doing something like:

if (mt76_is_sdio() && skb_linearize(skb))
=09return;

> +=09if (ret)
> +=09=09return;
> +
> +=09rxd =3D (struct mt7921_mcu_rxd *)skb->data;
> =20
>  =09if (rxd->eid =3D=3D 0x6) {
>  =09=09mt76_mcu_rx_event(&dev->mt76, skb);
> --=20
> 2.25.1
>=20

--gRsDsI6iq8aKspqC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYUHz/AAKCRA6cBh0uS2t
rOmDAQDa4ZdKxdoFQv8VDOfSAn6PVDgkDaohNhlO8SpBIZjhSwD/cvSbD2ZSHU+V
X1YvOeYxx7Ufgvgqszy80u3QzBjQ5wA=
=6LSj
-----END PGP SIGNATURE-----

--gRsDsI6iq8aKspqC--



--===============8605750656475052625==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8605750656475052625==--


