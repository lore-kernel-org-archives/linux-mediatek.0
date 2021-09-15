Return-Path: <SRS0=Ndyv=OF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7F18C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 13:31:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81D2061251
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 13:31:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 81D2061251
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tkh+Db1mvWHdvdW7FNL6bOp4vwSaT6d0K+UoGHbH16g=; b=5BkR0KhZ9zAZN7IzBIRvT+e4g9
	F/FmP+KJdXDW3p9X85I6UrctY/7p4dut35H4KM59PCtbilPbv7JqJspTFsABXZazRb8foKz1/Pe7l
	V5CnYHzCKLclJ8EYW/gLz1I9XC2zAqV9X4A/T5C22pu4JAm+Nud6ttfLarUWxlx3MnIck3Pu0OnQd
	TV5gO+HHGZQmat4mI00OSQlCZBXnRkEGt3c2RE4U1hxHxPgnZJrjkLy2pTx6AJeqKgDaxUfvsG8eo
	4WQPU8vos9e4sDDPwGjvMuCVIi2B1lE7lwlaMhdotmInqe7HUMuGDHue9xxLe2yZyzjSn9y1cOCMI
	Mz2/EXRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQV0q-009CP7-NL; Wed, 15 Sep 2021 13:31:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQV0n-009COd-U3
 for linux-mediatek@lists.infradead.org; Wed, 15 Sep 2021 13:31:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631712700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a5+0moqB3IMzSizhHNF0cktyzC0aeiyp/XLT5yVFXto=;
 b=Zgk1eS4iTw8BWpyEabJHwx9UBjRDTfK5ElYbjDKPqMdX0VI7hQxiL2GlnTuRTerDevsvl5
 PqJTNPAYcAZzniXB3YknoNvP1MI0Yxi8RpQIeSTO8bde976qJqHovfjL1wCiRElsdLa2Rf
 1xWv+QPHU2lE7UMAZZe57pXk+6nX6gA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-gPtxUhahMFys8gZoxI8Q4A-1; Wed, 15 Sep 2021 09:31:39 -0400
X-MC-Unique: gPtxUhahMFys8gZoxI8Q4A-1
Received: by mail-ed1-f71.google.com with SMTP id
 w24-20020a056402071800b003cfc05329f8so1619456edx.19
 for <linux-mediatek@lists.infradead.org>; Wed, 15 Sep 2021 06:31:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/azogsROZACSNc4T7vf4fDs5jXSzRpucSpuRzV2HagU=;
 b=L5WOYPK7UAQLSHJ9wRqS8N4wltEqbbsyEizCUrhsvgHuYftUrffh0VcSp6GE04+a5g
 9mJqPkhuiY3SUVrI0fO3O+1M/EAP+vKCNb5dh5VPCNFK1lBAesZpifdnb+bcyIAy9AJ0
 f7N7hTlOzikFAHhA0UC3se2UPwh/0Rng3Y5GVio/qTudOJKFpgXLxktYSPbfMpYtAmVn
 FR98KrXFgU/XDR+fmOKGse09X6Q1xOVzXThGIDP5gMK267QFI/k6mXGfzIjUC5+7vg4z
 6YYWJaBGVF6jBwmG3Wiz5mmMkirvw5sughcfaFWmShZVp2nZDkjzDGc4uJwbFW7X7INA
 6vtw==
X-Gm-Message-State: AOAM533kU/wqYS4YyjxzjP60AS1c9tVNw8LRuNiMpQIdURqwrzosShwX
 FJ0wCWsxoQsOFEpDkfMJLCIbTpkIsq0TzUABuVgej3pJntETJzDbQ4rfTQcVJSQEj7E68cK+Vmd
 Epm8j3MWqFPiTSjKTUlIrNu1IZOdG/alm
X-Received: by 2002:a17:906:8cd:: with SMTP id
 o13mr24842800eje.341.1631712698239; 
 Wed, 15 Sep 2021 06:31:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsEjBkbEWkA2+9StiChwyA1m/NVzj/aZQdIcFpRw/sIkzpDGntf371lM7p3BYYBx2RdOrhkA==
X-Received: by 2002:a17:906:8cd:: with SMTP id
 o13mr24842784eje.341.1631712698070; 
 Wed, 15 Sep 2021 06:31:38 -0700 (PDT)
Received: from localhost (net-130-25-199-50.cust.vodafonedsl.it.
 [130.25.199.50])
 by smtp.gmail.com with ESMTPSA id n11sm1087754edr.51.2021.09.15.06.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 06:31:37 -0700 (PDT)
Date: Wed, 15 Sep 2021 15:31:34 +0200
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
Message-ID: <YUH1tvJA0EUQzLaA@lore-desk>
References: <cover.1631667941.git.objelf@gmail.com>
 <764759a9a2befe09000863f04676287665675555.1631667941.git.objelf@gmail.com>
 <YUHz/gbfzmFszods@lore-desk>
MIME-Version: 1.0
In-Reply-To: <YUHz/gbfzmFszods@lore-desk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lorenzo.bianconi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_063142_101946_7630F3CA 
X-CRM114-Status: GOOD (  18.89  )
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
Content-Type: multipart/mixed; boundary="===============5874574904958587760=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============5874574904958587760==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pTOOomLTkB8wTJhp"
Content-Disposition: inline

--pTOOomLTkB8wTJhp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > From: Sean Wang <sean.wang@mediatek.com>
> >=20
> > The longer event such as the event for mcu_get_nic_capability would hol=
d
> > the data in paged fragment skb for the SDIO device so we turn the skb t=
o
> > be linearized skb before accessing it to reuse the same event parser
> > betweem mt7921s and mt7921e.
> >=20
> > Tested-by: Deren Wu <deren.wu@mediatek.com>
> > Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> > ---
> >  drivers/net/wireless/mediatek/mt76/mt7921/mcu.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/=
net/wireless/mediatek/mt76/mt7921/mcu.c
> > index f5a8f7fa4244..8e49df20a8cb 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> > @@ -458,7 +458,14 @@ mt7921_mcu_rx_unsolicited_event(struct mt7921_dev =
*dev, struct sk_buff *skb)
> > =20
> >  void mt7921_mcu_rx_event(struct mt7921_dev *dev, struct sk_buff *skb)
> >  {
> > -=09struct mt7921_mcu_rxd *rxd =3D (struct mt7921_mcu_rxd *)skb->data;
> > +=09struct mt7921_mcu_rxd *rxd;
> > +=09int ret;
> > +
> > +=09ret =3D skb_linearize(skb);
>=20
> is it true for sdio only? if so what about doing something like:
>=20
> if (mt76_is_sdio() && skb_linearize(skb))
> =09return;

please ignore this comment, it is already in skb_linearize()

>=20
> > +=09if (ret)
> > +=09=09return;
> > +
> > +=09rxd =3D (struct mt7921_mcu_rxd *)skb->data;
> > =20
> >  =09if (rxd->eid =3D=3D 0x6) {
> >  =09=09mt76_mcu_rx_event(&dev->mt76, skb);
> > --=20
> > 2.25.1
> >=20



--pTOOomLTkB8wTJhp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYUH1tAAKCRA6cBh0uS2t
rMkyAQDUa3R2Xm/43qa/WcpdImu0zoJb2NOBQIPNJicSkJYLFQEAx99u7hzZHeFi
rHHCgQlXtyx6c+rtwKLoXbvCzLAlYgg=
=BEBo
-----END PGP SIGNATURE-----

--pTOOomLTkB8wTJhp--



--===============5874574904958587760==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5874574904958587760==--


