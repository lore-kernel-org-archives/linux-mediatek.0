Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1833C8303C
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jul 2025 14:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FNpVb/nMDP7hj3MLmxppsJZtO2Gs5x5oBsiSaJBuIB4=; b=H6p/t5XOj9Wb5fS4p2/2CtQFUG
	mfWNTM6HPriCd8wEyOdKLYT61M3hnsyW8YYOeZ8gHpkC976D7uaG0Q1z/0fJ5DsGaRQ7Wg4DhcnfM
	dQdo7cp76ZyQrOl5iKgtAzc6/Kz1uNPTRCpEeNwy08rZDScUREAXNLSefwCvi5gCGJ3+l34cA4A/Y
	pWxPBcO2q+5TsNIMBnXY8eLStdGdDTH36vhSGjL9aVrTJHD9ighDySQlG4X+bT0XB2gmEhqfpdWji
	5k+3qjZ9LgQHtPpRiL2v2wtoNrlGzyAwe0ifRQNbHoVTHst/ieNZrqejRoqYXiec0DO2xRw5gtGC+
	MXDWVQUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYmd2-00000002fI3-2l7L;
	Mon, 07 Jul 2025 14:15:32 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYm5h-00000002a4o-329S
	for linux-mediatek@lists.infradead.org;
	Mon, 07 Jul 2025 13:41:09 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-60c4521ae2cso5469623a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 07 Jul 2025 06:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751895664; x=1752500464; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FNpVb/nMDP7hj3MLmxppsJZtO2Gs5x5oBsiSaJBuIB4=;
        b=k429sYAjRbQY6I7dIgNLWttgYeyFxck6KWd4wJ0lIDewz7HtU0m6xj9DUKpTRQdvjO
         izqfrbhUoVydLgTrumJqWnSyrYuxbWNBeR5Gtib44MaIoOR212Sml3hATZohsfxw2+4+
         0Lfnvx+IsllZVu2ext2SaeVi0sjSJaCQrDD6gvdmBy63k/xkeKXqwVIxZ4sK7Voe5Evx
         fmjAEPp0qIz7ObAWigawWhWFGU9oQJS5R8FvxtjzDar3mOhUaTaMZy0ZjV/Hm97k1/Lj
         Xkh+KMgt0UPvMiN1RnrxyULtkRY91nDL2clEEaDoU1K3JfPi83HrsJ3/bu8fDKzJuIke
         VIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751895664; x=1752500464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNpVb/nMDP7hj3MLmxppsJZtO2Gs5x5oBsiSaJBuIB4=;
        b=cvr1vj6L1ls4tic+gcsFR7SQEcV5R63rC7miv4cJ25egaj5W1IE7/IQiiJk8lIK0kq
         4FbZ+RTKYbbHA04h62u6EFn2hGWhIS6LVTviXYb4/q67DaWhQxp+aMT68lFUUwRc/7hr
         cOw0NGlONtyq6Y+TLDvSSNDvMztOUPjMZXX4HQJ7EbOP5hPPrOgov86Uvht4hl119eI4
         jmnpgFu9LWHHQeyhmZK6JyLMwEkSkpAXIB+hvnsp4s7TQwAY1OOJlD7qkQywS/U0LrcB
         QvLRwRJX/mxGf7ApOc9l5PBgUQFtQJ6GaienrLvhVtPWc1438tZY8SitOA51aZYP5TZp
         1RpA==
X-Forwarded-Encrypted: i=1; AJvYcCW+MHc+NOd7RIp1vgfWOAVQXQdJA7qURdwh4GYmGjniecrJ96UXyd4wtQ3gwyFEQVbZxStzP4jJ8Aq70loeFA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyb5W6MS3+oUDTCUmtUZ3a9xYwzCbla4LsCqvr6ldu1BxhFtiT6
	w/WA5roA3SzPRTLoxoWAxHq27SVKJBeLF0S/rXQeL3+L6mSot/4sW3dfLHaKxaHWOfw=
X-Gm-Gg: ASbGncszNJuzGH4u+Ue8gQbeE8E+FWEg5/BedniCuGjYw0sCU92bysv93ijlKiMhGQE
	2FJXQgXNt+3I/X9aNmHOPYOUsjZcW07RK5K67KdzqAlbJOaoBWwJJTEywC7bhr3fT8c4P6W2+3i
	wgam9R2f67ZCVKUrECLO+GVECLtxIbKw/DeMgiZt7OhA9eO+Tlk1Jm7vH4APEKhsMOYGam90Zme
	EKpGK/+dWcepV1esCrz254Z2o/Y2mHT0oD5lOKu9lWlsiPyRO+KyoHt05UBptNuButas8++/cTV
	056WpDVTBrXCkYYmTwlqONfkdzvJPvb9aOQZ4letut7EcSEP9ebL1YF+uDIobeRZ0tYqaw27pY4
	oDA==
X-Google-Smtp-Source: AGHT+IEVEQQKSyWO8J/KHI1EhymIFStABHRr6vUfPIXgyPnnTgZXYb+sbCsOm6oQazMQbqKjsU4K6Q==
X-Received: by 2002:a17:907:1b23:b0:ae3:635c:53c1 with SMTP id a640c23a62f3a-ae410a62cdbmr922365066b.54.1751895663516;
        Mon, 07 Jul 2025 06:41:03 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ae411a54227sm471065266b.74.2025.07.07.06.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 06:41:02 -0700 (PDT)
Date: Mon, 7 Jul 2025 15:41:00 +0200
From: "u.kleine-koenig@baylibre.com" <u.kleine-koenig@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yong Wu =?utf-8?B?KOWQtOWLhyk=?= <Yong.Wu@mediatek.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
	"krzk@kernel.org" <krzk@kernel.org>, "iommu@lists.linux.dev" <iommu@lists.linux.dev>
Subject: Re: NULL pointer exception in drivers/memory/mtk-smi.c
Message-ID: <c2fhyerjrb5qgtgyo7jojcyolsryvdp6injgbbzdkbzoaubdnk@37aw7p2f6rbj>
References: <allge3h2abtjfj77idsnwccurxi2jnbcv6qcxar5f5m3jjmpvs@a4mmfghdhtv4>
 <lri2gdwioe3on3unzrnmezv4pnxke6lmixrsvargeupdcywweo@j6xoz36xjdoh>
 <1dbebbf290413eae9af13312028c2d19d3441a09.camel@mediatek.com>
 <d818cad4-9eff-4fd6-b46c-d1fc24f7130b@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o3dz544qscs7qsyr"
Content-Disposition: inline
In-Reply-To: <d818cad4-9eff-4fd6-b46c-d1fc24f7130b@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_064105_974234_CA516870 
X-CRM114-Status: GOOD (  44.24  )
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


--o3dz544qscs7qsyr
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: NULL pointer exception in drivers/memory/mtk-smi.c
MIME-Version: 1.0

On Mon, Jul 07, 2025 at 10:47:53AM +0200, AngeloGioacchino Del Regno wrote:
> Il 07/07/25 09:24, Yong Wu (=E5=90=B4=E5=8B=87) ha scritto:
> > On Thu, 2025-07-03 at 18:41 +0200, Uwe Kleine-K=C3=B6nig wrote:
> > > Hello,
> > >=20
> > > [expanding the audience a bit according to the drivers that are
> > > involved
> > > now that the problem is better understood]
> > >=20
> > > On Tue, Jun 17, 2025 at 05:18:30PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > > > on a 6.16-rc2 kernel running on an mt8365-evk I occasionally hit
> > > > the
> > > > following during boot:
> > >=20
> > > I invested some time now to understand the issue. So here comes what
> > > I
> > > understood, maybe that helps someone to spot the fix to the described
> > > problem.
> > >=20
> > > With a configuration that has all drivers built-in but
> > >=20
> > > 	CONFIG_DRM_MEDIATEK=3Dm
> > > 	CONFIG_MTK_IOMMU=3Dm
> > >=20
> > > and
> > >=20
> > > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > > index cb95fecf6016..d4320db7cd2d 100644
> > > --- a/drivers/iommu/mtk_iommu.c
> > > +++ b/drivers/iommu/mtk_iommu.c
> > > @@ -1387,14 +1387,15 @@ static int mtk_iommu_probe(struct
> > > platform_device *pdev)
> > >   		goto out_list_del;
> > >   	ret =3D iommu_device_register(&data->iommu, &mtk_iommu_ops, dev);
> > >   	if (ret)
> > >   		goto out_sysfs_remove;
> > >   	if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_MM)) {
> > > +		msleep(10000);
> > >   		ret =3D component_master_add_with_match(dev,
> > > &mtk_iommu_com_ops, match);
> > >   		if (ret)
> > >   			goto out_device_unregister;
> > >   	}
> > >   	return ret;
> > >   out_device_unregister:
> > >=20
> > > I can reliably trigger the race.
> > >=20
> > > With that sleep in place iommu_device_register() completes quickly
> > > which
> > > enables probing of the devices with drivers contained in the
> > > drm_mediatek module (because the modules are loaded in parallel on
> > > a different CPU).
> > >=20
> > > Then generic driver code calls resume on all suppliers for devices to
> > > bind, among them the four larb devices. However due to
> > > component_master_add_with_match() not being called yet, the larb
> > > devices
> > > are not yet bound to the iommu device and so larb->mmu is still NULL.
> > > The latter is a problem in mtk_smi_larb_config_port_gen2_general()
> > > which
> > > is called from mtk_smi_larb_resume().
> >=20
> > Hi Uwe,
> >=20
> > Thanks for your help. In this case, it looks like the disp probe occurs
> > before the smi_larb_bind operation, we need to let disp wait for the
> > bind to complete.
> >=20
> > --- a/drivers/memory/mtk-smi.c
> > +++ b/drivers/memory/mtk-smi.c
> > @@ -666,6 +666,10 @@ static int __maybe_unused
> > mtk_smi_larb_resume(struct device *dev)
> >          if (MTK_SMI_CAPS(larb->larb_gen->flags_general,
> > MTK_SMI_FLAG_SLEEP_CTL))
> >                  mtk_smi_larb_sleep_ctrl_disable(larb);
> >=20
> > +     /* The larb_bind operation may be later than the master probe. */
> > +       if (!larb->mmu)
> > +               return -EPROBE_DEFER;
> > +

A .resume callback isn't supposed to return -EPROBE_DEFER.

> >          /* Configure the basic setting for this larb */
> >=20
> >=20
> > Hi Angelo,
> >   Do you have any suggestion?
> >=20
>=20
> I don't have the necessary bandwidth to really broadly research about thi=
s, but
> there's two ideas:
>=20
> 1. What if we disable PM OPS until MMU is bound? That would avoid calls to
>    larb_resume().....

I think the key question here is: Is the iommu functional without the
larbs bound? If not I'd claim that iommu_device_register() should only
happen if all larbs are present and ready.

> 2. Instead of component, we could register a device - which carries its o=
wn suspend
>    and resume ops; the device would be registered only after all local ar=
biters
>    are bound, so there would be no suspend/resume ops until everything is=
 in place.
>    That's more or less how it's done in drivers/usb/core/port.c
>=20
> Probably N.1 would work best - we could...
>=20
> probe:
> pm_runtime_set_active(larb->smi.dev);
> pm_runtime_forbid(larb->smi.dev);
>=20
> bind:
> larb->mmu =3D ...
> larb->bank =3D ...
>=20
> pm_runtime_set_suspended(larb->smi.dev);
> pm_runtime_allow(larb->smi.dev);
>=20
>=20
> ...the next usage/wakeup should then call resume() but at that point we'r=
e sure
> that larb->mmu is actually initialized, because we allowed PM resume only=
 after
> binding.

Not knowing the details of the hardware that feels wrong. IMHO a device
that is operational should be able to do PM ops.

Best regards
Uwe

--o3dz544qscs7qsyr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhrzmkACgkQj4D7WH0S
/k4UPAf9FwUgM0aTRuE8AAy349MmsZSjSNcSHXZ+3SALeNHgKMZmzXZ9h4traUjW
/786sSywNT+YsF6M/FtH66NcqGodQkwZzjC+ftAnYhmvydMfaAxOkLWpiqIXW8Zk
92oO27jqoKq+4AiIij4GAM4iPNza20nzsZvxsxv6NAI5rluVWWk9+klgloLqFj/T
+iDnQ4VMVrMEaCyfQqGastonqdZlj0VJkigQpd6RWOY7kXS9NxOzaw/V1KaYIkAf
tmHutlkfA+8EQQXfr5g+ciIlA90wVI5VM1EZVLybfT96FZ3kTvlksBIbdDo69URq
NgTabIBVTmeKlrzY0uaZLRC/5pQq/w==
=BFbu
-----END PGP SIGNATURE-----

--o3dz544qscs7qsyr--

