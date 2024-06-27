Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE11C2BD09
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 06:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CDeQAHjPnSZDFxM1A+XKpZEzpro177UTYpTI4ucX8qE=; b=WTDw38JWQE7f0P1NsAjWew1Raa
	8ybrXTlrCj2QwoJOW5DeVPQfHUDUIogR42CgNW/DlAX9OZ56G5D7L+uaqkaX0QI4n9m/rdukJiGT1
	gvLvy1aqVM0bWrNIma8zy1zD0BnguduHZ4FTITNAjt7wqF/l4MRSUDTieY5MOuglI08ytLgvuBZ3Q
	ynd9/+dDywRjT//adsFyXpoYuN8ykytfN3ZVFksLC0vgtDryY1Cl/pKsJasvHtjQA7PToo8oR7SIG
	bB0LRD87oJqXx3VBTy87zxGf0jmPVflyJ7xsdHlGvKNiEr5zDK0TlrvhNWrkCcqXT2p+L+p4M4ck7
	digcwjuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMixr-00000009Qzw-2M83;
	Thu, 27 Jun 2024 06:50:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMixj-00000009Qy7-0f9Z;
	Thu, 27 Jun 2024 06:50:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0DFD66009F;
	Thu, 27 Jun 2024 06:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41918C2BBFC;
	Thu, 27 Jun 2024 06:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719471028;
	bh=Ibr63yKjW5xKaI/BECgFSLEZizZa+Q7V/5SONc3pJTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cNvqXL4v7P7AHvvv0si7ebvFbzb3MGRBFPPfAjXS7B1wr2J+vbO1WZS8a6e/a+uoU
	 ytrK4yk0LL/M7llObVa+dxKrkSDhcEQMxtn42rVbwqMTTBO1q0jm7sJvrb8wvhiouQ
	 2aiTWv4pMBxnN9zzK9iqiHJroAdWdVaB7GqI+l9SSAPAHZz6VjOgzvzoZRFXdnORvK
	 XB7vRLQcD2Jw9xcZyztcPT5RJHfAZz5v1el/RHaxmOQISqPAzHrxiN7tQOohp6NtRc
	 ku+v010EnJybwRPiHDU/BnlSLJIZ5upDiKpskMEsf0npUd5LnaPpCUkRdPeK9a4mpQ
	 WDdH3JsIl0Yog==
Date: Thu, 27 Jun 2024 08:50:25 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pci@vger.kernel.org, ryder.lee@mediatek.com,
	lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, linux-mediatek@lists.infradead.org,
	lorenzo.bianconi83@gmail.com, linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
	nbd@nbd.name, dd@embedd.com, upstream@airoha.com
Subject: Re: [PATCH 2/4] PCI: mediatek-gen3: Add mtk_pcie_soc data structure
Message-ID: <Zn0LsfE9xlwuEvuf@lore-desk>
References: <cover.1718980864.git.lorenzo@kernel.org>
 <a49a36c4ca336dee909e16865d6fec0dd83b3f38.1718980864.git.lorenzo@kernel.org>
 <c63ed7fc-f568-48b1-ad5d-a37b4b475016@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="D0ojh7sfDISA5znA"
Content-Disposition: inline
In-Reply-To: <c63ed7fc-f568-48b1-ad5d-a37b4b475016@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_235031_452776_5EFA9CF2 
X-CRM114-Status: GOOD (  21.22  )
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


--D0ojh7sfDISA5znA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Il 21/06/24 16:48, Lorenzo Bianconi ha scritto:
> > Introduce mtk_pcie_soc data structure in order to define multiple
> > callbacks for each supported SoC. This is a preliminary patch to
> > introduce EN7581 pcie support.
> >=20
> > Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >   drivers/pci/controller/pcie-mediatek-gen3.c | 24 ++++++++++++++++++---
> >   1 file changed, 21 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/=
controller/pcie-mediatek-gen3.c
> > index 975b3024fb08..4859bd875bc4 100644
> > --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> > +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> > @@ -100,6 +100,16 @@
> >   #define PCIE_ATR_TLP_TYPE_MEM		PCIE_ATR_TLP_TYPE(0)
> >   #define PCIE_ATR_TLP_TYPE_IO		PCIE_ATR_TLP_TYPE(2)
> > +struct mtk_gen3_pcie;
> > +
> > +/**
> > + * struct mtk_pcie_soc - differentiate between host generations
>=20
> mtk_gen3_pcie_pdata ?

ack, I will fix it in v2.

>=20
> > + * @power_up: pcie power_up callback
> > + */
> > +struct mtk_pcie_soc {
> > +	int (*power_up)(struct mtk_gen3_pcie *pcie);
> > +};
> > +
> >   /**
> >    * struct mtk_msi_set - MSI information for each set
> >    * @base: IO mapped register base
> > @@ -131,6 +141,7 @@ struct mtk_msi_set {
> >    * @msi_sets: MSI sets information
> >    * @lock: lock protecting IRQ bit map
> >    * @msi_irq_in_use: bit map for assigned MSI IRQ
> > + * @soc: pointer to SoC-dependent operations
> >    */
> >   struct mtk_gen3_pcie {
> >   	struct device *dev;
> > @@ -151,6 +162,8 @@ struct mtk_gen3_pcie {
> >   	struct mtk_msi_set msi_sets[PCIE_MSI_SET_NUM];
> >   	struct mutex lock;
> >   	DECLARE_BITMAP(msi_irq_in_use, PCIE_MSI_IRQS_NUM);
> > +
> > +	const struct mtk_pcie_soc *soc;
> >   };
> >   /* LTSSM state in PCIE_LTSSM_STATUS_REG bit[28:24] */
> > @@ -904,7 +917,7 @@ static int mtk_pcie_setup(struct mtk_gen3_pcie *pci=
e)
> >   	usleep_range(10, 20);
> >   	/* Don't touch the hardware registers before power up */
> > -	err =3D mtk_pcie_power_up(pcie);
> > +	err =3D pcie->soc->power_up(pcie);
> >   	if (err)
> >   		return err;
> > @@ -939,6 +952,7 @@ static int mtk_pcie_probe(struct platform_device *p=
dev)
> >   	pcie =3D pci_host_bridge_priv(host);
> >   	pcie->dev =3D dev;
> > +	pcie->soc =3D of_device_get_match_data(dev);
>=20
> device_get_match_data() can also be used here :-)

ack, I will fix it in v2.

Regards,
Lorenzo

>=20
> Cheers,
> Angelo
>=20

--D0ojh7sfDISA5znA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZn0LsAAKCRA6cBh0uS2t
rDqZAP9E+w0Rw2ZY2kG1NLWByHxMpjaweBhTMxAc2wIOcJkdYgD+LK8bI4DKDAeb
rCKBejLnONweNsqr8pSXAl3mCPZVygk=
=pZN7
-----END PGP SIGNATURE-----

--D0ojh7sfDISA5znA--

