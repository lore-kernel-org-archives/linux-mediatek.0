Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BB9CF9C71
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Sep 2024 21:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Msr4e2aktGMwp7wsjBm8wr8s1DK/j+37ksdEXI7Qv90=; b=XajVbryIYu6TvD2PVpsroPRi9O
	ZUlsaOYb31Pg6Qj5AbMCcx/O0c/c3mp4iYaxnIxUrIvgsUjtda5rhAnQNRPQ26hdNUtV56sVAmfxl
	m0P7wAZ4N2uvZ65XDTJ5vSvyakg5WmkzEVouQ5U1QIPVESPJA6yEofbx4gaScRfZOa9qzVQxRilTm
	HFSEx6ZRjfpuDF9idwtTFivtx7FiZQ/RE0b5YWcMzvY07kUsaQIEonIqN6IrPQlXlk9KTlVjlmPeo
	ukZx6tsDPEZ4x+5swPdt7S+D1KgWW8BFZa7+yGFgpQfTHX47a4KjOEFahWg/heVV7Cddk23z09WM5
	q1VCZ91g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssqdd-00000000Vwp-3s5W;
	Mon, 23 Sep 2024 21:30:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssqcV-00000000VsJ-2NUR;
	Mon, 23 Sep 2024 21:29:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D5477A42857;
	Mon, 23 Sep 2024 21:29:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8551C4CEC4;
	Mon, 23 Sep 2024 21:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727126961;
	bh=aPsXlsQTc4iQomHCqP6FGAc3aR0AhJ/h9kmcL5q8DMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pZBBLzsnMF6VS0JNZsP3ofiiVwXFaZtz84STcAEp+Xv/m3w39J39wh4dpHhrPsoGU
	 NRGrrev2gSKkyM08YBIpjf5+KRcDD2ZKFLOz0yRhHZ9cRzp30aLb/U0H0L/ZwTSyg1
	 NJzxxGp5v/GqYyYY34E2dPdLH6hDPnQCCQq/RYw28hJcGSCRAD3tYbr8alBpnosMe4
	 H9qHnUxNoNtGmcaTCHtUoHKCqn3lRaR561QimVpdE2xqeiKOo4DsemGjdJxP2lPP1r
	 vyf8qu3GiTzlkOiOZRetxMjXjDyC2tng226uUnKUrnCm7l2hqoAkEdH11Ewh9Nn6cI
	 tqmnHk5YiDaDg==
Date: Mon, 23 Sep 2024 23:29:18 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, upstream@airoha.com,
	Hui Ma <hui.ma@airoha.com>
Subject: Re: [PATCH] PCI: mediatek-gen3: Avoid PCIe resetting for Airoha
 EN7581 SoC
Message-ID: <ZvHdrsx0PZhKWU_6@lore-desk>
References: <20240920-pcie-en7581-rst-fix-v1-1-1043fb63ffc9@kernel.org>
 <20240923171041.GA1158802@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CeZNBjXD8FkiuUtc"
Content-Disposition: inline
In-Reply-To: <20240923171041.GA1158802@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_142923_764290_345D0C12 
X-CRM114-Status: GOOD (  30.81  )
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


--CeZNBjXD8FkiuUtc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Fri, Sep 20, 2024 at 10:26:28AM +0200, Lorenzo Bianconi wrote:
> > The PCIe controller available on the EN7581 SoC does not support reset
> > via the following lines:
> > - PCIE_MAC_RSTB
> > - PCIE_PHY_RSTB
> > - PCIE_BRG_RSTB
> > - PCIE_PE_RSTB
> >=20
> > Introduce the reset callback in order to avoid resetting the PCIe port
> > for Airoha EN7581 SoC.
> >=20
> > Tested-by: Hui Ma <hui.ma@airoha.com>
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  drivers/pci/controller/pcie-mediatek-gen3.c | 44 ++++++++++++++++++---=
--------
> >  1 file changed, 28 insertions(+), 16 deletions(-)
> >=20
> > diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/=
controller/pcie-mediatek-gen3.c
> > index 5c19abac74e8..9cea67e92d98 100644
> > --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> > +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> > @@ -128,10 +128,12 @@ struct mtk_gen3_pcie;
> >  /**
> >   * struct mtk_gen3_pcie_pdata - differentiate between host generations
> >   * @power_up: pcie power_up callback
> > + * @reset: pcie reset callback
> >   * @phy_resets: phy reset lines SoC data.
> >   */
> >  struct mtk_gen3_pcie_pdata {
> >  	int (*power_up)(struct mtk_gen3_pcie *pcie);
> > +	void (*reset)(struct mtk_gen3_pcie *pcie);
> >  	struct {
> >  		const char *id[MAX_NUM_PHY_RESETS];
> >  		int num_resets;
> > @@ -373,6 +375,28 @@ static void mtk_pcie_enable_msi(struct mtk_gen3_pc=
ie *pcie)
> >  	writel_relaxed(val, pcie->base + PCIE_INT_ENABLE_REG);
> >  }
> > =20
> > +static void mtk_pcie_reset(struct mtk_gen3_pcie *pcie)
> > +{
> > +	u32 val;
> > +
> > +	/* Assert all reset signals */
> > +	val =3D readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
> > +	val |=3D PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RSTB;
> > +	writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> > +
> > +	/*
> > +	 * Described in PCIe CEM specification sections 2.2 (PERST# Signal)
> > +	 * and 2.2.1 (Initial Power-Up (G3 to S0)).
> > +	 * The deassertion of PERST# should be delayed 100ms (TPVPERL)
> > +	 * for the power and clock to become stable.
> > +	 */
> > +	msleep(100);
>=20
> I see you're just moving this, but it's a good chance to use
> PCIE_T_PVPERL_MS.

ack, I will add it.

>=20
> > +
> > +	/* De-assert reset signals */
> > +	val &=3D ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RS=
TB);
> > +	writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> > +}
> > +
> >  static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
> >  {
> >  	struct resource_entry *entry;
> > @@ -402,22 +426,9 @@ static int mtk_pcie_startup_port(struct mtk_gen3_p=
cie *pcie)
> >  	val |=3D PCIE_DISABLE_DVFSRC_VLT_REQ;
> >  	writel_relaxed(val, pcie->base + PCIE_MISC_CTRL_REG);
> > =20
> > -	/* Assert all reset signals */
> > -	val =3D readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
> > -	val |=3D PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RSTB;
> > -	writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> > -
> > -	/*
> > -	 * Described in PCIe CEM specification sections 2.2 (PERST# Signal)
> > -	 * and 2.2.1 (Initial Power-Up (G3 to S0)).
> > -	 * The deassertion of PERST# should be delayed 100ms (TPVPERL)
> > -	 * for the power and clock to become stable.
> > -	 */
> > -	msleep(100);
> > -
> > -	/* De-assert reset signals */
> > -	val &=3D ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RS=
TB);
> > -	writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> > +	/* Reset the PCIe port if requested by the hw */
>=20
> I don't see any real "request" from the hardware.  IIUC, this is more
> like "assert reset if this hardware supports it".

ack, %s/requested/supported. I will fix it.

Regards,
Lorenzo

>=20
> > +	if (pcie->soc->reset)
> > +		pcie->soc->reset(pcie);
> > =20
> >  	/* Check if the link is up or not */
> >  	err =3D readl_poll_timeout(pcie->base + PCIE_LINK_STATUS_REG, val,
> > @@ -1207,6 +1218,7 @@ static const struct dev_pm_ops mtk_pcie_pm_ops =
=3D {
> > =20
> >  static const struct mtk_gen3_pcie_pdata mtk_pcie_soc_mt8192 =3D {
> >  	.power_up =3D mtk_pcie_power_up,
> > +	.reset =3D mtk_pcie_reset,
> >  	.phy_resets =3D {
> >  		.id[0] =3D "phy",
> >  		.num_resets =3D 1,
> >=20
> > ---
> > base-commit: f2024903cb387971abdbc6398a430e735a9b394c
> > change-id: 20240920-pcie-en7581-rst-fix-8161658c13c4
> >=20
> > Best regards,
> > --=20
> > Lorenzo Bianconi <lorenzo@kernel.org>
> >=20

--CeZNBjXD8FkiuUtc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZvHdrgAKCRA6cBh0uS2t
rEONAP4qiHrP6to/gC9PCjS4UG9xJ16SJrG/IlXBo0VmZrPJtAD7B2K8bXfQksAS
+/PGKL0/4VYtA7fNZEnlTYRxqoOQVw0=
=OoIH
-----END PGP SIGNATURE-----

--CeZNBjXD8FkiuUtc--

