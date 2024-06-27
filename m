Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B4AC2BD09
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 07:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eOek+kVq/WEQ2cVN2kdNRPJZT5YtwGgMMF852X8IoAc=; b=Dv5VXOy/FxacG/7YoVF48YJ1lJ
	k23uoZUNdEEDS2dFXianeU//1yZMu5fWnBtYv03y8opEe0chl7ExbXS894YINyrnxPQGq90CAlROP
	vK2jD7Vq2XrK7ZJs9rn3BsEbGC0e/PlQEFL/F/H20yZoTqIYenQkwGltyCfcKdxq2XHpwcC5qmE5S
	14+8nFyAVZXpetE7Vyhhpt+itgEnAxjRI2ISZm+KLGeOjacEBxxyBinHecGVPJEJDwoemXldgJ/r7
	H42RuFO1koDl5MSmmwUgIOENqgYAztMQdit049ky3kRnhoXe0ElazpgzH5go+Uq+O7pbyyNPg76q8
	g8OWFSBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMjAc-00000009UOo-1wKd;
	Thu, 27 Jun 2024 07:03:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMjAT-00000009UM4-11wZ;
	Thu, 27 Jun 2024 07:03:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3ED0361B77;
	Thu, 27 Jun 2024 07:03:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50C70C2BBFC;
	Thu, 27 Jun 2024 07:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719471818;
	bh=edmrATqWfwDQp7TUO5fi4qh+vRbNRuaAI4fOnDLa3vc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R/JG439TiDTUxtn+UkgDW473rP2JUcGU1EZh6BUoofM45pzIfepiPTsA2CHGXSG8e
	 WWLlfPG+yE5Y5Bzrc8uOUgq2l7UY44+nKCJqkAWS4WgxR4ERDWj2cC4Zfam0UHN8Y0
	 6im6SMvyH2W9M8YfzZDma/oNOrr9o5sqIN9K6nPjT7cPowhOIrAefZi/OlseLWmnxV
	 JZtRJvjWgnBRPSKy1PqxflO/b9tyG+LADo838wlzYTmpr+2lbARZ1O0C3NjxKNQZ5z
	 dNl+4iRK1WLwEvyTQfKt8b5wrSObTCcdI1PR0BKPM/HrNWNQhau28ahbBGTs+SH3To
	 ytnqvGlqT9tQQ==
Date: Thu, 27 Jun 2024 09:03:35 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pci@vger.kernel.org, ryder.lee@mediatek.com,
	lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, linux-mediatek@lists.infradead.org,
	lorenzo.bianconi83@gmail.com, linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
	nbd@nbd.name, dd@embedd.com, upstream@airoha.com
Subject: Re: [PATCH 3/4] PCI: mediatek-gen3: rely on reset_bulk APIs for phy
 reset lines
Message-ID: <Zn0Ox8HTfNLQddsR@lore-desk>
References: <cover.1718980864.git.lorenzo@kernel.org>
 <e8ab615a56759a4832833211257d83f56bf64303.1718980864.git.lorenzo@kernel.org>
 <ee7ef59d-a698-41ba-a3a6-1e9e32313e2d@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sxHPfjnzL9+afZ9G"
Content-Disposition: inline
In-Reply-To: <ee7ef59d-a698-41ba-a3a6-1e9e32313e2d@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_000341_545678_3B3003E3 
X-CRM114-Status: GOOD (  25.67  )
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


--sxHPfjnzL9+afZ9G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Il 21/06/24 16:48, Lorenzo Bianconi ha scritto:
> > Use reset_bulk APIs to manage phy reset lines. This is a preliminary
> > patch in order to add Airoha EN7581 pcie support.
> >=20
> > Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >   drivers/pci/controller/pcie-mediatek-gen3.c | 49 ++++++++++++++++-----
> >   1 file changed, 37 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/=
controller/pcie-mediatek-gen3.c
> > index 4859bd875bc4..9842617795a9 100644
> > --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> > +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> > @@ -100,14 +100,21 @@
> >   #define PCIE_ATR_TLP_TYPE_MEM		PCIE_ATR_TLP_TYPE(0)
> >   #define PCIE_ATR_TLP_TYPE_IO		PCIE_ATR_TLP_TYPE(2)
> > +#define MAX_NUM_PHY_RSTS		1
> > +
> >   struct mtk_gen3_pcie;
> >   /**
> >    * struct mtk_pcie_soc - differentiate between host generations
> >    * @power_up: pcie power_up callback
> > + * @phy_resets: phy reset lines SoC data.
> >    */
> >   struct mtk_pcie_soc {
> >   	int (*power_up)(struct mtk_gen3_pcie *pcie);
> > +	struct {
> > +		const char *id[MAX_NUM_PHY_RSTS];
> > +		int num_rsts;
>=20
> Well, it's just two chars after all, so "num_resets" looks better imo.

ack, fine. Naming is always hard :)

>=20
> > +	} phy_resets;
> >   };
> >   /**
> > @@ -128,7 +135,7 @@ struct mtk_msi_set {
> >    * @base: IO mapped register base
> >    * @reg_base: physical register base
> >    * @mac_reset: MAC reset control
> > - * @phy_reset: PHY reset control
> > + * @phy_resets: PHY reset controllers
> >    * @phy: PHY controller block
> >    * @clks: PCIe clocks
> >    * @num_clks: PCIe clocks count for this port
> > @@ -148,7 +155,7 @@ struct mtk_gen3_pcie {
> >   	void __iomem *base;
> >   	phys_addr_t reg_base;
> >   	struct reset_control *mac_reset;
> > -	struct reset_control *phy_reset;
> > +	struct reset_control_bulk_data phy_resets[MAX_NUM_PHY_RSTS];
> >   	struct phy *phy;
> >   	struct clk_bulk_data *clks;
> >   	int num_clks;
> > @@ -790,8 +797,8 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pcie=
 *pcie)
> >   {
> >   	struct device *dev =3D pcie->dev;
> >   	struct platform_device *pdev =3D to_platform_device(dev);
> > +	int i, ret, num_rsts =3D pcie->soc->phy_resets.num_rsts; >   	struct =
resource *regs;
> > -	int ret;
> >   	regs =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "pcie-ma=
c");
> >   	if (!regs)
> > @@ -804,12 +811,13 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pc=
ie *pcie)
> >   	pcie->reg_base =3D regs->start;
> > -	pcie->phy_reset =3D devm_reset_control_get_optional_exclusive(dev, "p=
hy");
> > -	if (IS_ERR(pcie->phy_reset)) {
> > -		ret =3D PTR_ERR(pcie->phy_reset);
> > -		if (ret !=3D -EPROBE_DEFER)
> > -			dev_err(dev, "failed to get PHY reset\n");
> > +	for (i =3D 0; i < num_rsts; i++)
> > +		pcie->phy_resets[i].id =3D pcie->soc->phy_resets.id[i];
> > +	ret =3D devm_reset_control_bulk_get_optional_shared(dev, num_rsts,
> > +							  pcie->phy_resets);
>=20
> 92 columns is ok, you can use one line for that.

I usually prefer to stay below 79 column limit, but I do not have a strong
opinion about it. I will fix it and even all below.

Regards,
Lorenzo

>=20
> > +	if (ret) {
> > +		dev_err(dev, "failed to get PHY bulk reset\n");
> >   		return ret;
> >   	}
> > @@ -846,7 +854,12 @@ static int mtk_pcie_power_up(struct mtk_gen3_pcie =
*pcie)
> >   	int err;
> >   	/* PHY power on and enable pipe clock */
> > -	reset_control_deassert(pcie->phy_reset);
> > +	err =3D reset_control_bulk_deassert(pcie->soc->phy_resets.num_rsts,
> > +					  pcie->phy_resets);
> > +	if (err) {
> > +		dev_err(dev, "failed to deassert PHYs\n");
> > +		return err;
> > +	}
> >   	err =3D phy_init(pcie->phy);
> >   	if (err) {
> > @@ -882,7 +895,8 @@ static int mtk_pcie_power_up(struct mtk_gen3_pcie *=
pcie)
> >   err_phy_on:
> >   	phy_exit(pcie->phy);
> >   err_phy_init:
> > -	reset_control_assert(pcie->phy_reset);
> > +	reset_control_bulk_assert(pcie->soc->phy_resets.num_rsts,
> > +				  pcie->phy_resets);
>=20
> same here
>=20
> >   	return err;
> >   }
> > @@ -897,7 +911,8 @@ static void mtk_pcie_power_down(struct mtk_gen3_pci=
e *pcie)
> >   	phy_power_off(pcie->phy);
> >   	phy_exit(pcie->phy);
> > -	reset_control_assert(pcie->phy_reset);
> > +	reset_control_bulk_assert(pcie->soc->phy_resets.num_rsts,
> > +				  pcie->phy_resets);
>=20
> ditto
>=20
> >   }
> >   static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
> > @@ -912,7 +927,13 @@ static int mtk_pcie_setup(struct mtk_gen3_pcie *pc=
ie)
> >   	 * The controller may have been left out of reset by the bootloader
> >   	 * so make sure that we get a clean start by asserting resets here.
> >   	 */
> > -	reset_control_assert(pcie->phy_reset);
> > +	reset_control_bulk_deassert(pcie->soc->phy_resets.num_rsts,
> > +				    pcie->phy_resets);
>=20
> and again...
>=20
> > +	usleep_range(5000, 10000);
> > +	reset_control_bulk_assert(pcie->soc->phy_resets.num_rsts,
> > +				  pcie->phy_resets);
>=20
> .... :-)
>=20
> Cheers,
> Angelo
>=20
> > +	msleep(100);
> > +
> >   	reset_control_assert(pcie->mac_reset);
> >   	usleep_range(10, 20);
> > @@ -1090,6 +1111,10 @@ static const struct dev_pm_ops mtk_pcie_pm_ops =
=3D {
> >   static const struct mtk_pcie_soc mtk_pcie_soc_mt8192 =3D {
> >   	.power_up =3D mtk_pcie_power_up,
> > +	.phy_resets =3D {
> > +		.id[0] =3D "phy",
> > +		.num_rsts =3D 1,
> > +	},
> >   };
> >   static const struct of_device_id mtk_pcie_of_match[] =3D {
>=20

--sxHPfjnzL9+afZ9G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZn0OxwAKCRA6cBh0uS2t
rBlFAP4i50NyDltoQcWvAv3AXWyJjkeLhRpWwkB/MOAcyLSctwD+KcjoGcHz6lYT
vGpHOSROki0wf8rwx97eI48jsmQDhA8=
=1Y6c
-----END PGP SIGNATURE-----

--sxHPfjnzL9+afZ9G--

