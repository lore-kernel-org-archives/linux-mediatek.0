Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0DA6C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Dec 2021 20:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bDfKujQtf4OL+GI8Ff8wWcNRkkqaJvsv21N6HYaqfwo=; b=MNvXOud4WiTT/ZhkJ8PuP8ee2B
	rIYt8yJ91Ofewu2H7UAgL9BZrw7D/2fAaFr3sjiJZwSkKr7mDTEz8j/9zBrpr/QUM2qs2lemDHZpm
	B+1QPdZMI6lQgda/8qhVmnNqaKw8UWba7crIu57pwgrQ8NOG9I/tIm3hfeKge3jbcl7Ar9aeUcYNm
	wiWGPrxR03I/FdxHAwApnmF9o7WrTWqi1oEKsbiHPJskn9WusvYt2o8QDCRM6CV9VHNxTAPkzojwQ
	uRIcI6dQou4qLhpgrH1maMJW7npf4HIsLfS6a3pONs1PNc9chSLbOWU79ED3uveY6hgFBM15VGQVT
	f9AHdA+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mugl4-009z2R-5f; Tue, 07 Dec 2021 20:08:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mugl1-009z1c-9h
 for linux-mediatek@lists.infradead.org; Tue, 07 Dec 2021 20:08:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638907690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F8zzokBpVhqyVEh6FYhVKGMP/Mg3r+q2m+63DkVRI/E=;
 b=WHCj554WrbOBrVIHzJfHMxIHAVDRaOg+BHfKOI8WFDsGC2V22zYO9C1/H7PuN3Ug1XEBNi
 Im/+yz5n7HlZYzY8vD1sqHY0LmnWM8OCsnmEyiL7S1N/K2xMzwynlsJhV8PvP11pdjsBKV
 HGP9awJ/jt+cWQflEBBqtZmwbjoHoM0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-332-ykYvzD0PPfGt_rQABdXU5A-1; Tue, 07 Dec 2021 15:08:09 -0500
X-MC-Unique: ykYvzD0PPfGt_rQABdXU5A-1
Received: by mail-qt1-f199.google.com with SMTP id
 a26-20020ac8001a000000b002b6596897dcso399831qtg.19
 for <linux-mediatek@lists.infradead.org>; Tue, 07 Dec 2021 12:08:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eBvl6LFe+aw+Rh35aeMDmSH951L6XzA7tNWjg1mtFG8=;
 b=hnlGqlYnI5C6cNR28+L+XTspJbxfWwouL1O8DCbMlf3Nb0F2TOd/718fMYY9U/4rNZ
 aJUjJIumMXW9npKjtolsurhpx6rxeZhkRIvztWl2MZk4bsD1SNFmCwNFwPevaEpvIAyL
 082gxhRkqX+6m6iAb6IHyv3pvuDRrBu3lehTXBCCUm1GEIdzNJv1VWtPjQFnS98Y6edS
 jholb2eGbYbI1u5gvA6UN7KsmB8xXLpt2GM8hxTO3eUjQ5sSqRDzTW1/opIK6KoVjl6L
 rUDSiG0nrZTylDoejUO9FMpGBVgmKZwtXJMZ6zhVFVBXpQ8BPS+1k8VBdeGCpwaUEFZt
 KN3w==
X-Gm-Message-State: AOAM5331B7stH0q42IoEwxbTIXoZoASk5uSc+Wa8+uCTzlOPBllc4hfj
 mMr3VRN2CqrjnM9oTWuHVQlFaUKN147avMLIRtX6L+rIzIJX72IPd3NH0uRHCnBDzWmfeThcWwb
 aHTJCOBonYGBh3QEuzHR4OMmcOUzDcDOs
X-Received: by 2002:a05:620a:a09:: with SMTP id
 i9mr1614346qka.768.1638907688628; 
 Tue, 07 Dec 2021 12:08:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx0skii4m+c+RFKdfj7DFNZr066Mgdfx30R34dkotQ/yRz5s9AsXxgsHMtbzJuR+BG5wkfEPg==
X-Received: by 2002:a05:620a:a09:: with SMTP id
 i9mr1614300qka.768.1638907688385; 
 Tue, 07 Dec 2021 12:08:08 -0800 (PST)
Received: from localhost (net-37-182-17-175.cust.vodafonedsl.it.
 [37.182.17.175])
 by smtp.gmail.com with ESMTPSA id v2sm418115qkp.72.2021.12.07.12.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 12:08:07 -0800 (PST)
Date: Tue, 7 Dec 2021 21:08:04 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, Soul.Huang@mediatek.com, YN.Chen@mediatek.com,
 Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com,
 Mark-YW.Chen@mediatek.com, Deren.Wu@mediatek.com,
 km.lin@mediatek.com, robin.chiu@mediatek.com,
 Eddie.Chen@mediatek.com, ch.yeh@mediatek.com, posh.sun@mediatek.com,
 ted.huang@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, Tom.Chou@mediatek.com,
 steve.lee@mediatek.com, jsiuda@google.com, frankgor@google.com,
 jemele@google.com, abhishekpandit@google.com, shawnku@google.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mt76: mt7921: fix possible resume failure
Message-ID: <Ya+/JNMaq2O3BKwb@lore-desk>
References: <Ya8ysehFjoEGGEf+@lore-desk--annotate>
 <1638897717-14465-1-git-send-email-sean.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1638897717-14465-1-git-send-email-sean.wang@mediatek.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lorenzo.bianconi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_120811_444869_40052619 
X-CRM114-Status: GOOD (  22.53  )
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
Content-Type: multipart/mixed; boundary="===============6080043668081527183=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============6080043668081527183==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="S3T/g1lnhrSI4XOY"
Content-Disposition: inline

--S3T/g1lnhrSI4XOY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> >> From: Sean Wang <sean.wang@mediatek.com>
> >>
> >> Fix the possible resume failure due to mt76_connac_mcu_set_hif_suspend
> >> timeout.
> >>
> >> That is because clearing the flag pm->suspended too early opened up a
> >> race window, where mt7921_poll_tx/rx scheduled a ps_work to put the
> >> device in doze mode, that is unexpected for the device is being
> >> resumed from the suspend state and would make the remaining MCU
> >> comamnds in resume handler failed to execute.
> >
> >do we have a similar issue in mt7921s_resume()?
>=20
> We don't have the same issue found in mt7921s_resume because the driver
> guarantees all MCU commands (even in mt7921s_resume) always work in the a=
ctive
> state.
>=20
> But we can have the same patch for mt7921s just to make code consistent w=
ith
> mt7921e.

ack, agree.

Regards,
Lorenzo

>=20
> >
> >>
> >> Fixes: ffa1bf97425b ("mt76: mt7921: introduce PM support")
> >> Co-developed-by: YN Chen <YN.Chen@mediatek.com>
> >> Signed-off-by: YN Chen <YN.Chen@mediatek.com>
> >> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> >> ---
> >>  drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 7 +++++--
> >>  1 file changed, 5 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> >> b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> >> index 5635de3c80b1..21a48f02ab60 100644
> >> --- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> >> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> >> @@ -315,7 +315,6 @@ static int mt7921_pci_resume(struct pci_dev *pdev)
> >>=09struct mt76_connac_pm *pm =3D &dev->pm;
> >>=09int i, err;
> >>
> >> -=09pm->suspended =3D false;
> >>=09err =3D pci_set_power_state(pdev, PCI_D0);
> >>=09if (err)
> >>=09=09return err;
> >> @@ -353,7 +352,11 @@ static int mt7921_pci_resume(struct pci_dev *pdev=
)
> >>=09if (!pm->ds_enable)
> >>=09=09mt76_connac_mcu_set_deep_sleep(&dev->mt76, false);
> >>
> >> -=09return mt76_connac_mcu_set_hif_suspend(mdev, false);
> >> +=09err =3D mt76_connac_mcu_set_hif_suspend(mdev, false);
> >> +
> >> +=09pm->suspended =3D false;
> >> +
> >> +=09return err;
> >>  }
> >>  #endif /* CONFIG_PM */
> >>
> >> --
> >> 2.25.1
> >>
> >
>=20

--S3T/g1lnhrSI4XOY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYa+/JAAKCRA6cBh0uS2t
rP8HAQCJ8HWqVgvcuEgmYSstf5h0Sei/dsGM3SatXC1xegI7swD/ZNVyb1+PBtF8
uInGuoNrgIY7N6DVud2XrvNWF6dBjQ4=
=6lcp
-----END PGP SIGNATURE-----

--S3T/g1lnhrSI4XOY--



--===============6080043668081527183==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6080043668081527183==--


