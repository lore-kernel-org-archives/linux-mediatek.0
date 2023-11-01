Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED838C4167B
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Nov 2023 15:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xsqoYf19Nj3jN1AzYoKcH12P3D9fgKAXh71guXQrXYk=; b=fmwamP/tDOrX+9UE8nZWg5RWuq
	f4aQZriocNZ+mapp3gGYuF8Qpr/ufY8c6gG4f1qzxe80Y6/Xqi6tCe4O059SDbU+MEOFf83Cz0Ah3
	EhIPjEFiyhZEM0yaOa95oG7RaNUtNBMVd0yQa7K8Yj6leaC0refoI3LaO2GbYAxnqdSsTFlJC2EOQ
	EjeCsQROJssMDXgDPMsDehTW9BRsVcxefDwprxvt8En9L2DkzXce/bHffPhd05MhpHcBRJnTzY99u
	1gUuvoof8tkxHRbOhW0g19Daqai6vnj5ETbrZwRtRbrcvL6y5Awz9TJV81N4pE+DiE0FOLJYYnPic
	eihxv1Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyCi5-007hbe-2h;
	Wed, 01 Nov 2023 15:00:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyCi1-007hZ1-2J;
	Wed, 01 Nov 2023 15:00:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C53A061229;
	Wed,  1 Nov 2023 15:00:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB0C5C433C8;
	Wed,  1 Nov 2023 15:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698850840;
	bh=61VJ8pl4e3NGwPPj59m3HBRGj5+ApAztxPeXNk4KdN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C/H7TOP9PGYTmwk/6ArJ9rVSu9xTz850uhD7MPwufzxy0ADppO+ofF/Kg2me+Vrdi
	 yoqJwLr6lLXYnngLyzbAzxb2blibWSz+RIaHTlGDh5Buezwt4Bbp97SMuEu2D89dC/
	 W0mLnX8jIVpbDLYTOmqKkiAzTsjllZaO2MQrj/2D1nnRDe2pvnFGz482RQr7WRDf6Z
	 iBhTfXJX7ZOOERwko2yo99IaOSrVmT2X7pGYUaDlngsHMy2JOF9LSkvshcaGXqnrNC
	 31OuRZ3yZkvvQ3bpWv+3DPyW7TVt8cQThD3XlYQ/m5n61cAvOj3utUvHUmyD5SFQIZ
	 KNyPci3/0YpuQ==
Date: Wed, 1 Nov 2023 16:00:36 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Tom Waldron <tom@baremetal.dev>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/1] wifi: mt76: mt7921: Add a new VID/PID 0b48/7922 for
 MT7922
Message-ID: <ZUJoFAcKMrVD5Glo@lore-desk>
References: <20231101095533.45258-1-tom@baremetal.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wsOepGTnfH8POUN2"
Content-Disposition: inline
In-Reply-To: <20231101095533.45258-1-tom@baremetal.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_080041_810596_580ADC5D 
X-CRM114-Status: GOOD (  14.25  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--wsOepGTnfH8POUN2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Add VID/PID 0b48/7922 for MediaTek MT7922 wifi chip.
> Change tested on Redmi Book Pro 15 2023 (Fedora 38).
>=20
> Signed-off-by: Tom Waldron <tom@baremetal.dev>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/pci.c
> index 3dda84a93..ba805cb02 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> @@ -21,6 +21,8 @@ static const struct pci_device_id mt7921_pci_device_tab=
le[] =3D {
>  		.driver_data =3D (kernel_ulong_t)MT7921_FIRMWARE_WM },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x0616),
>  		.driver_data =3D (kernel_ulong_t)MT7922_FIRMWARE_WM },
> +	{ PCI_DEVICE(0x0b48, 0x7922),
> +		.driver_data =3D (kernel_ulong_t)MT7922_FIRMWARE_WM },

is PCI VID 0x0b48 PCI_VENDOR_ID_ITTIM?

Regards,
Lorenzo

>  	{ },
>  };
> =20
> --=20
> 2.41.0
>=20

--wsOepGTnfH8POUN2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZUJoFAAKCRA6cBh0uS2t
rAJOAP0caGBM5srfImXm+Ko83soD7yWACQIuY/L49z76kaIv1AEAvMHiruc7+J3r
WUbEUXvt6Qv/7cAabeUjYTV9C6lEJwI=
=ylh9
-----END PGP SIGNATURE-----

--wsOepGTnfH8POUN2--

