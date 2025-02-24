Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF847C021A4
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Feb 2025 10:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fS+26Rl3p7nRkB21uVSt1gR8cYHE4RYncr2QkHVX3p0=; b=aVUwyOouA5vZPmFy19G60M3fDb
	COb/TEivKnPtOVuxywmmD0SPq1tkKoUwQC65edbOpt2hUKBiUH1RfTi9GQ1I557dIDGwjwdTZTHVw
	bbuqH7EjIwF7JUNkVLzyV5Gve2EUz+Wod0VPJAavUzRZ6sEF3VBQl36Shsn+octpvr/Dh4GDo8Q2A
	isLor5Y0YT1To1c4X0oxSKtl0eDfvD/47ycc301PKz18GD5I/Y/eghBZR+BF0JBx0LbUAh0G0gvkt
	IwCi7xT4ovZ4DYeC6YydOEm5spPkY9pt/LxSzhIY02T29xDQncMAXRcC67mMuVZsKCZRS8oN/HgCK
	T3R9LBMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmVVf-0000000D5Hl-3boH;
	Mon, 24 Feb 2025 10:16:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmVLa-0000000D2rp-04FO;
	Mon, 24 Feb 2025 10:05:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B0DF661189;
	Mon, 24 Feb 2025 10:05:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 881C1C4CED6;
	Mon, 24 Feb 2025 10:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740391527;
	bh=wEPIfbmOGYU8PFcnIOPk2XbR2HBdhU31GqS8u7rbNnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P5Pc+1tmhpkcRZCCeN11NsfalT6DwwEIx2gIyIrWPAeoRIBi2eurs9bxsWgiJ87eX
	 OVSKflTtnS5ZGxn+6TR7ibhqEe2h337VuaeQ3WzEhoKbvv+8sPSQ6JYezBtZK/1Yda
	 CicWrE0UKmdulEgb8TNqdjuA7ZGzLy7EHRzSPn7/lY3hd7ukOxVHKvdqY20aqw51kN
	 4TKQeXN9ysstGViRPBQh+ljrdBWGjlifPXl5K3KuU43t0d/BO0BLgpmNgIpTJzGhpp
	 GiuO60mVLEpEHeKbc16uSt7U4OWBaGunMfgB1nZSmiJ3BhFUrzfvDDVz3slPQZj/V4
	 K4CZvSz3lEBCA==
Date: Mon, 24 Feb 2025 11:05:24 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: Re: [PATCH v3 2/2] PCI: mediatek-gen3: Configure PBUS_CSR registers
 for EN7581 SoC
Message-ID: <Z7xEZPpWLQjTMnIz@lore-desk>
References: <20250222-en7581-pcie-pbus-csr-v3-0-e0cca1f4d394@kernel.org>
 <20250222-en7581-pcie-pbus-csr-v3-2-e0cca1f4d394@kernel.org>
 <20250224055216.o23dzwimrghbr2ow@thinkpad>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9HSvn9LCGzDjJLIz"
Content-Disposition: inline
In-Reply-To: <20250224055216.o23dzwimrghbr2ow@thinkpad>
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


--9HSvn9LCGzDjJLIz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Sat, Feb 22, 2025 at 11:43:45AM +0100, Lorenzo Bianconi wrote:

[...]

> > +
> > +	entry =3D resource_list_first_type(&host->windows, IORESOURCE_MEM);
> > +	if (!entry)
> > +		return -EINVAL;
>=20
> -ENODEV or -ENOMEM

ack, I will fix it in v4

>=20
> > +
> > +	addr =3D entry->res->start - entry->offset;
> > +	err =3D regmap_write(pbus_regmap, args[0], lower_32_bits(addr));
> > +	if (err)
>=20
> MMIO write is not supposed to fail.

ack, I will fix it in v4

>=20
> > +		return err;
> > +
> > +	size =3D lower_32_bits(resource_size(entry->res));
> > +	mask =3D size ? GENMASK(31, __fls(size)) : 0;
>=20
> Size of MEM region could be 0?

I added this check since we consider just lower_32_bits().
Do you think we should remove it?

>=20
> > +	err =3D regmap_write(pbus_regmap, args[1], mask);
> > +	if (err)
>=20
> MMIO write is not supposed to fail.

ack, I will fix it in v4

BTW I will remove your Reviwed-by tag since the patch has changed
with respect to the one you added it. Please let me know if you
prepfer to keep it.

Regards,
Lorenzo

>=20
> - Mani
>=20
> --=20
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D

--9HSvn9LCGzDjJLIz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ7xEZAAKCRA6cBh0uS2t
rDHbAQCOVe744bx7qYVotAU7cnjssZp8JuF9Yjujz5rxPDkOmQEAiu1GLPn0lTz9
yCYh9rg8gckaHCPDrNtWImF2kRicoQ8=
=UbPO
-----END PGP SIGNATURE-----

--9HSvn9LCGzDjJLIz--

