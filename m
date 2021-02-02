Return-Path: <SRS0=G+wW=HE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F9EDC43381
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 14:25:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F40E164E9C
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 14:25:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F40E164E9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NlwScUsKwx/U6PEFx6uYrbRJYLtbmseXCUz5nVr1Aag=; b=iqpTbFzUpeofCsphUVk7R0Ctg
	gWnpFfFRo25C8+QA8rD20gUZZW+7enYMa3VA1/kkvFVHdsa/kq07N6uedoWuARW+goNqxQsAqMc1/
	TRMA9tJpe3dCrCkPQmvi59NG4MMCju2vfimmwOueKAvJA7xhO6i0ZcxE2x7J5Xkyvs22sAe6jKOk+
	UDEmqTFclABS6p13+Y1yp/76sxTqkPXo+5bm4gX+Fce9crz0iZyUGJIgxVq384GaMqlB7HG4MYCL5
	QuXqP/Q5qeVa5G1FBqcFRu5x3BwZQQS3RTOMgz9dKXUO4QxXaSqjzL+hhAPQEcjhsVaYdlPjYa+tu
	HQQN0Uicw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6wck-0000iW-Fi; Tue, 02 Feb 2021 14:25:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6wch-0000hb-Fq
 for linux-mediatek@lists.infradead.org; Tue, 02 Feb 2021 14:25:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0BBFC64E27;
 Tue,  2 Feb 2021 14:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612275941;
 bh=XrWwgaGjEka3YYtYl5RvUCX0ivrinAxjyRPgZCzKe6I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HSb2bdLxmcE1FswNWUgGhyJiw5saVTf+ud//jhf/MEpxlAsGgbeCL/zzaxi2Yhb2l
 mmNxRW1yVdvYguuZzwnk7kOpE/Pzf51Lzow0bNB3Uo29mW1KBEJS9LxC5HgR8Q8ypm
 FN8QlyWGLnb8rIFT89cT+vhiYrirkWDaZfrl2j1Gze6+NiKBC0H+oUonlSDyPH+1HQ
 mi8SHccGoC6Mj40jmVownUzqWZPoEnxnXapnqFChWHH5n7WgsRlgzFezuKDqwQcMhZ
 tvYEdKBhpkS6vQ/Hy7BFDluVrS1qZLVwb2eemhyJRsLNR0RrvfNQFPpuC+0OYeymG3
 VSBtAJb93kM9A==
Date: Tue, 2 Feb 2021 15:25:36 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: [PATCH] mt76: use PCI_VENDOR_ID_MEDIATEK to avoid open coded
Message-ID: <20210202142536.GA4823@lore-desk>
References: <404c3c6be07d4c8b2a9a7297c387509b801e62a5.1612274129.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <404c3c6be07d4c8b2a9a7297c387509b801e62a5.1612274129.git.ryder.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_092543_746601_E106770C 
X-CRM114-Status: GOOD (  13.15  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-mediatek@lists.infradead.org,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>, linux-wireless@vger.kernel.org,
 Felix Fietkau <nbd@nbd.name>
Content-Type: multipart/mixed; boundary="===============6063534198783534698=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6063534198783534698==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Use PCI standard defines.
>=20
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/wireless/mediatek/mt76/mt7603/pci.c | 2 +-
>  drivers/net/wireless/mediatek/mt76/mt7615/pci.c | 6 +++---
>  drivers/net/wireless/mediatek/mt76/mt76x0/pci.c | 6 +++---
>  drivers/net/wireless/mediatek/mt76/mt76x2/pci.c | 6 +++---
>  drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 2 +-
>  5 files changed, 11 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/pci.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7603/pci.c
> index 06fa28f645f2..aa6cb668b012 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7603/pci.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7603/pci.c
> @@ -7,7 +7,7 @@
>  #include "mt7603.h"
> =20
>  static const struct pci_device_id mt76pci_device_table[] =3D {
> -	{ PCI_DEVICE(0x14c3, 0x7603) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x7603) },
>  	{ },
>  };
> =20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/pci.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7615/pci.c
> index 71487f532f36..11f169cdd603 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/pci.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/pci.c
> @@ -13,9 +13,9 @@
>  #include "mcu.h"
> =20
>  static const struct pci_device_id mt7615_pci_device_table[] =3D {
> -	{ PCI_DEVICE(0x14c3, 0x7615) },
> -	{ PCI_DEVICE(0x14c3, 0x7663) },
> -	{ PCI_DEVICE(0x14c3, 0x7611) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x7615) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x7663) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x7611) },
>  	{ },
>  };
> =20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/pci.c b/drivers/ne=
t/wireless/mediatek/mt76/mt76x0/pci.c
> index 02d0aa0b815e..5847f943e8da 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76x0/pci.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt76x0/pci.c
> @@ -221,9 +221,9 @@ mt76x0e_remove(struct pci_dev *pdev)
>  }
> =20
>  static const struct pci_device_id mt76x0e_device_table[] =3D {
> -	{ PCI_DEVICE(0x14c3, 0x7610) },
> -	{ PCI_DEVICE(0x14c3, 0x7630) },
> -	{ PCI_DEVICE(0x14c3, 0x7650) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x7610) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x7630) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x7650) },
>  	{ },
>  };
> =20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2/pci.c b/drivers/ne=
t/wireless/mediatek/mt76/mt76x2/pci.c
> index ecaf85b483ac..adf288e50e21 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76x2/pci.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt76x2/pci.c
> @@ -10,9 +10,9 @@
>  #include "mt76x2.h"
> =20
>  static const struct pci_device_id mt76x2e_device_table[] =3D {
> -	{ PCI_DEVICE(0x14c3, 0x7662) },
> -	{ PCI_DEVICE(0x14c3, 0x7612) },
> -	{ PCI_DEVICE(0x14c3, 0x7602) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x7662) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x7612) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x7602) },
>  	{ },
>  };
> =20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/pci.c
> index 5570b4a50531..33ed952d7f4c 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> @@ -13,7 +13,7 @@
>  #include "../trace.h"
> =20
>  static const struct pci_device_id mt7921_pci_device_table[] =3D {
> -	{ PCI_DEVICE(0x14c3, 0x7961) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x7961) },
>  	{ },
>  };
> =20
> --=20
> 2.18.0
>=20

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYBlg3gAKCRA6cBh0uS2t
rItiAP9V6iTO4a/8xvCb0xHhu6LSiBh0FUw5huVrqaWwo0rF7AD+KgBLc+8GO/Ei
GnW/5GcqAC3vc52le6nv5whaoomXWQw=
=Hnp6
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--


--===============6063534198783534698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6063534198783534698==--

