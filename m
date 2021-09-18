Return-Path: <SRS0=6guZ=OI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E618C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Sep 2021 10:16:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3F4C61074
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Sep 2021 10:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C3F4C61074
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zO98+vRd30E+bPbwZgxGJuw4oBomZp5XsA8w+6ECPNw=; b=yeJpP+ntfAv2djW798t4UsGL05
	IWhdJVW/xw4Kajs4o89Mk4B8cQ8t43LR9cKNpACKsR2bUSB33CxYv6H0vneNPpBn+mtMtAxKIxBNI
	I8v7SKmWvNF/bxOG+R7yYCiYYZYyKCvTnhAVBW/+dw7QqlexIeGNiYQ/feNdjFASei1D+SjiZdAkU
	EReWFJwfKDidAZKdnbNyjH0Tn8sWD26cAVGjSPVYuEulvcHIlfEUYhKhKed/A1fOicgfTFn9S2zlc
	4OL6AJ7WnrY6iltBJvwnF5rIZT5RvMCe/HWcpAQTsOv8fn2FGf2TdBAChiON9VWpnDSGDNnHYAU3r
	GnF4+HWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mRXOI-00FkkD-QA; Sat, 18 Sep 2021 10:16:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mRXOG-00Fkjd-Ji
 for linux-mediatek@lists.infradead.org; Sat, 18 Sep 2021 10:16:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631960171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ctlepN89cMSqBM4kx6J1c2+8dZMmxyLK6WXaSCjCGdw=;
 b=VDAaNeROMzZ26YIPgjbfVrN6hsPImbbDdT8H0Kkb1MP8FfGFIBlizUzIuKbl7nDDH0i2AV
 RwEQJS/PpaQgL5faBPZXJK8bF20dPdEu4E3jI091BxIeBSm2L8oDbPgpmTkrIhuBGevRWK
 KDdw7VtgCadXUGWZvNbCE8KmBoZx2js=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-nkk9FacBMfiuFL7DmkoHfw-1; Sat, 18 Sep 2021 06:16:07 -0400
X-MC-Unique: nkk9FacBMfiuFL7DmkoHfw-1
Received: by mail-ed1-f71.google.com with SMTP id
 m20-20020aa7c2d4000000b003d1add00b8aso11466698edp.0
 for <linux-mediatek@lists.infradead.org>; Sat, 18 Sep 2021 03:16:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wM6uic+F1/IRDYaLuFeaUrQpJFPWb8bNYjKi6M7eWmU=;
 b=aQC/kDNcw0WUrEN0BkbQIQ0TCeJ5Ca99FuaB+7HXItxIrlg8o8XF8CEa/+nlYZntl3
 Zs8sNXh2Ri9WAkr5otD2S+wn7ZeBOicZBqtgKtkwXDLo1QUz9I7SjaaDXEMrAhbRu2o+
 Wk8RVMYWGbhOIPS0yrgYGGMTv430taZFL0VonHeKGbVyL3YmTN36SAT6uveIZ4v3a60y
 qJkjzJW4YM9SlciHI5W1yKwSUBLzui7vTQVIXAXLp4tZCp7EuX9BCvmPM6yXHj93QTQ+
 S0D1fRf3mDkwOghLbu5Yf4AD0WZdS9Nyf33gIhzzZEUIviNdz8O9J9wNehNTZ+1ZaZTs
 Ck6w==
X-Gm-Message-State: AOAM533OLuCN28n4CLvN337Y0bSa994loLQFRvP9DwH7LUIk16Go73Pw
 ly6/6AyGGItcZMQqDK0LEWF8BvXc982OUBrUiR2UG4K6U1wSiKLFQQeWfYzCK9vuHI0UVDv6+3v
 8/97ybVWz1qcW5GcLOZfOdx1jFqFQ4OI+
X-Received: by 2002:a17:907:7613:: with SMTP id
 jx19mr17917976ejc.453.1631960166524; 
 Sat, 18 Sep 2021 03:16:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytssHuzY4z8XOtk4cJkfMT6K57I4C7VESQSmyNO/iQc4RJv8Qj6Z1bwq1Xgt7u6XMXTBxyWQ==
X-Received: by 2002:a17:907:7613:: with SMTP id
 jx19mr17917961ejc.453.1631960166314; 
 Sat, 18 Sep 2021 03:16:06 -0700 (PDT)
Received: from localhost (net-130-25-199-50.cust.vodafonedsl.it.
 [130.25.199.50])
 by smtp.gmail.com with ESMTPSA id u19sm2709958edr.15.2021.09.18.03.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 03:16:05 -0700 (PDT)
Date: Sat, 18 Sep 2021 12:16:02 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, Soul.Huang@mediatek.com, YN.Chen@mediatek.com,
 Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com,
 Deren.Wu@mediatek.com, km.lin@mediatek.com, robin.chiu@mediatek.com,
 Eddie.Chen@mediatek.com, ch.yeh@mediatek.com, posh.sun@mediatek.com,
 ted.huang@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, steve.lee@mediatek.com,
 jsiuda@google.com, frankgor@google.com, jemele@google.com,
 shawnku@google.com, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 08/16] mt76: mt7921: make all event parser reusable
 between mt7921s and mt7921e
Message-ID: <YUW8YqCxSYiKUF9o@lore-desk>
References: <cover.1631918993.git.objelf@gmail.com>
 <a6aebd446a9aa7902397a7e7b87fe427076fc9df.1631918993.git.objelf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <a6aebd446a9aa7902397a7e7b87fe427076fc9df.1631918993.git.objelf@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lorenzo.bianconi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210918_031612_793266_0DAD1432 
X-CRM114-Status: GOOD (  15.30  )
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
Content-Type: multipart/mixed; boundary="===============0240492126213024584=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============0240492126213024584==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iB/AOOZx2eOqKcCI"
Content-Disposition: inline

--iB/AOOZx2eOqKcCI
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
> index 866b8797f16e..863781895652 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> @@ -456,7 +456,14 @@ mt7921_mcu_rx_unsolicited_event(struct mt7921_dev *d=
ev, struct sk_buff *skb)
> =20
>  void mt7921_mcu_rx_event(struct mt7921_dev *dev, struct sk_buff *skb)
>  {
> -=09struct mt7921_mcu_rxd *rxd =3D (struct mt7921_mcu_rxd *)skb->data;
> +=09struct mt7921_mcu_rxd *rxd;
> +=09int ret;
> +
> +=09ret =3D skb_linearize(skb);

nit: we do not need ret variable here:

=09if (skb_linearize(skb))
=09=09return;

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

--iB/AOOZx2eOqKcCI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYUW8YAAKCRA6cBh0uS2t
rAr6AQCjszoFDH42lCFqN9Rgq8+TeNT953lr01/bQSjN/UBFiAD+M+t52BYRVxjT
vhExN7QXV8pHqF/sVAPJkx6v7hNrnQo=
=zu93
-----END PGP SIGNATURE-----

--iB/AOOZx2eOqKcCI--



--===============0240492126213024584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0240492126213024584==--


