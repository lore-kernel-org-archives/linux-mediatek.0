Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCDF6C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Mar 2022 09:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=edHnhbRUB2lm52yTMa104y3/QRWBILS21Cha+DRfPnU=; b=Xa4lMJdBI3T2gKifPhIB3HJ/mE
	tvjR3q8wTVGN2GEvIO66PyYiwmRnaf6dYwp+byw6PZQtrAYemLHZxXH042t4GNHiEggfKNOeVsvbL
	jtaSq7bfhtP/ogqixnkiapxoRESY8+FqR5AZTVFbIfTxCSji82PqgYcmzLxALBisnqrhWeJDs/bOF
	JRVLfl/RQcEKasENQ16aSaFUjCfpztGV0vF5mfj8ehBPNEBUuw1YNrXEECx4GNwFlVNfBFbfNYJOB
	RTNT5N52CgJ3uCKmRyABBmFdYEU68V7ywRQ2m1dZoDXYBVTlmtoLR9Surk/EXM20M+55Ag+E60tKv
	L//vOtQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQQR6-00D1pN-L1; Sat, 05 Mar 2022 09:10:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQQR3-00D1nY-HN
 for linux-mediatek@lists.infradead.org; Sat, 05 Mar 2022 09:10:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646471443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZZrmZK1SofDvRpfwtg14KKk1bJFHoZMR0F05LWYzd38=;
 b=WCRgISFR25kFQD/7ShChbRTP5Grs5FKZqXOOv+ss+JwhGLY+ZpImERiAb88t3U6nniSudI
 g+LnHOfkdosRpZsot/kJv7kfJ5HGrbQm0LCmT7M9lB4pZGa2WmlucmiJ26bRHgsiLjG3cP
 CoPdIl8OaNaNal1sbVhAIm7dIFOvs7s=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-1Su_tt9mM9S6uArnO7AX4A-1; Sat, 05 Mar 2022 04:10:41 -0500
X-MC-Unique: 1Su_tt9mM9S6uArnO7AX4A-1
Received: by mail-ej1-f69.google.com with SMTP id
 hr26-20020a1709073f9a00b006d6d1ee8cf8so5372320ejc.19
 for <linux-mediatek@lists.infradead.org>; Sat, 05 Mar 2022 01:10:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZZrmZK1SofDvRpfwtg14KKk1bJFHoZMR0F05LWYzd38=;
 b=dN1gJz51fES98Z6E/Akgm0/k1S0wlqRwum4lKk9/gtomfqQMIDqLVYeuTIiNk09Vcm
 y5ci8zkiU8pFqTiMljMbQzoPIEsuTyE/SD6Xd96y/hasAlABdL86qulJQNmrSOYspGFN
 WLWiWPa5DLLWhM+6vByQ7XudhMQX5A3CMic1dbjpoUXVCTMluWHomOl/W/IdfCjk+Q/q
 DaUFzWzCFO9yDuWZB2+9bLU8ubLLRlNqd7DITjLNlJYUK81K5RGjOx6O9EVLF2Z9ske4
 cDVxeVnLMGLygbkTKGM25g2qUaUIZQSJo+wI3xdrg8EyeqIa7svqxZlvyeMpcLfg2P0K
 +/eQ==
X-Gm-Message-State: AOAM533DbAeaRAow7NJ8FTDz3CAOYmSJG/MmCaUy6TPJ6XriOB7xQXVB
 nivZ2vqA17fkARQ6k+rLDAQpZe8gN+S9c6GkJk7nnuUGy2MHr7/AoTMZNwPzOE0rK3j0TJAM7WC
 Gf0e9DrOB9imbsdEHZ0/J9Fr4j1R8g936
X-Received: by 2002:a17:906:2584:b0:6d6:e5c9:221b with SMTP id
 m4-20020a170906258400b006d6e5c9221bmr2119766ejb.514.1646471440595; 
 Sat, 05 Mar 2022 01:10:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxwO7FrT0LfBJwjA34pK47wDRiVVNrXRiG5aaLAVt1/yLCwhDkZ5CCuW6ldpKLr/kD42W6UpA==
X-Received: by 2002:a17:906:2584:b0:6d6:e5c9:221b with SMTP id
 m4-20020a170906258400b006d6e5c9221bmr2119759ejb.514.1646471440323; 
 Sat, 05 Mar 2022 01:10:40 -0800 (PST)
Received: from localhost ([37.183.9.66]) by smtp.gmail.com with ESMTPSA id
 bq23-20020a170906d0d700b006db0372d3a2sm385886ejb.20.2022.03.05.01.10.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Mar 2022 01:10:39 -0800 (PST)
Date: Sat, 5 Mar 2022 10:10:37 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, Deren.Wu@mediatek.com, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/9] introduce mt7921u driver
Message-ID: <YiMpDQq8zMS9FWVd@lore-desk>
References: <cover.1646235785.git.lorenzo@kernel.org>
 <1646461027-5374-1-git-send-email-sean.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1646461027-5374-1-git-send-email-sean.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220305_011045_882593_860E96CB 
X-CRM114-Status: GOOD (  15.47  )
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
Content-Type: multipart/mixed; boundary="===============2077996111866618079=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============2077996111866618079==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QITdTzB0R+dIiE3F"
Content-Disposition: inline


--QITdTzB0R+dIiE3F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar 05, Sean Wang wrote:
> From: Sean Wang <sean.wang@mediatek.com>
>=20
> >Introduce support for MT7921U 802.11ax 2x2:2SS wireless devices.
> >
>=20
> Tested the whole series with sta and monitor mode and it is working well.
>=20
> Tested-by: Sean Wang <sean.wang@mediatek.com>

thx Sean for testing. I will post v2 with some fixes.

Regards,
Lorenzo

>=20
> >Lorenzo Bianconi (9):
> >  mt76: usb: add req_type to ___mt76u_rr signature
> >  mt76: usb: add req_type to ___mt76u_wr signature
> >  mt76: usb: introduce __mt76u_init utility routine
> >  mt76: mt7921: disable runtime pm for usb
> >  mt76: mt7921: update mt7921_skb_add_usb_sdio_hdr to support usb
> >  mt76: mt7921: move mt7921_usb_sdio_tx_prepare_skb in common mac code
> >  mt76: mt7921: move mt7921_usb_sdio_tx_complete_skb in common mac code.
> >  mt76: mt7921: move mt7921_usb_sdio_tx_status_data in mac common code.
> >  mt76: mt7921: add mt7921u driver
> >
> > drivers/net/wireless/mediatek/mt76/mt76.h     |  12 +-
> > .../net/wireless/mediatek/mt76/mt7615/usb.c   |  68 ++-
> > .../net/wireless/mediatek/mt76/mt76x0/usb.c   |   2 +-
> > .../net/wireless/mediatek/mt76/mt76x2/usb.c   |   2 +-
> > .../net/wireless/mediatek/mt76/mt7921/Kconfig |  11 +
> > .../wireless/mediatek/mt76/mt7921/Makefile    |   2 +
> > .../wireless/mediatek/mt76/mt7921/debugfs.c   |   6 +
> > .../net/wireless/mediatek/mt76/mt7921/init.c  |  12 +-
> > .../net/wireless/mediatek/mt76/mt7921/mac.c   |  91 ++++
> > .../net/wireless/mediatek/mt76/mt7921/mac.h   |   1 +
> > .../net/wireless/mediatek/mt76/mt7921/main.c  |   3 +-
> > .../wireless/mediatek/mt76/mt7921/mt7921.h    |  25 +-
> > .../net/wireless/mediatek/mt76/mt7921/regs.h  |  36 +-
> > .../net/wireless/mediatek/mt76/mt7921/sdio.c  |   6 +-
> > .../wireless/mediatek/mt76/mt7921/sdio_mac.c  |  83 ----
> > .../wireless/mediatek/mt76/mt7921/sdio_mcu.c  |   2 +-
> > .../net/wireless/mediatek/mt76/mt7921/usb.c   | 397 ++++++++++++++++++
> > drivers/net/wireless/mediatek/mt76/usb.c      | 125 ++----
> > 18 files changed, 689 insertions(+), 195 deletions(-)  create mode 1006=
44 drivers/net/wireless/mediatek/mt76/mt7921/usb.c
> >
> >--
> >2.35.1
> >
> >
>=20
>=20

--QITdTzB0R+dIiE3F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYiMpDQAKCRA6cBh0uS2t
rGMcAP9LXM0FH4wlPliwvk4rYwOfYzcMVxjq6kKix3HMMuFmbwEA1a4PdrscMp/l
TPVtQExE06vAOPXg1naTWkTiPg8IjgM=
=FkVr
-----END PGP SIGNATURE-----

--QITdTzB0R+dIiE3F--



--===============2077996111866618079==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2077996111866618079==--


