Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7AEC27C4F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jun 2024 22:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rrokd19VaP50wmqgeE398SV1HtbHL4I/Bs6tAe1YXgg=; b=dagHLUMzFa5o8dmCyzSLTwjek5
	Smxok94k540xBF1zrmsjR3ENX0fF1rmvOvpyhP4kI56mmrc5Ofvem2/D353b80HpFahCc7fm14USs
	Wr6H77h5wQPOifpA5tUoWnVVEQXQ6ZKWFDwchfhlFzN02TvhtiBmBnfjeBwtqu0dYWzU14M95fYB/
	ZJ1ReDHEG+hFby+GWyxFKAM5sK+ffQPEZjgm/B1+ZD/ShUUUdqVWVjqtJ7j0bb84E0D/quZE5xkkN
	yPwFD98jBkhZvL3vtW2Huic9ZfQ9/TVXb40v5H8BupONvxsL39EJUi63T8Iks4NbSi8UKwzdLhV1L
	GMUDkz9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKmMb-0000000Agmo-0erS;
	Fri, 21 Jun 2024 22:04:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKmMW-0000000AglC-2FJQ;
	Fri, 21 Jun 2024 22:04:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1CD7B625F1;
	Fri, 21 Jun 2024 22:04:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50967C2BBFC;
	Fri, 21 Jun 2024 22:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719007442;
	bh=/Du/16Fm/7+7K5Nz0r9Yf9xRXhOT4EhavnWXHlF818E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=taMpRQ6/ggVqSTEK+68ZtBCvG2LgqjACMZG1EKqG0Cda0bAKNqcQc3mvY2oAmplnh
	 MoLkzjgsGzWrmf5zxDT8BaYrH7JNt37zF+eY+7RD2JB+hIN7PwkPuSCXlzk0epeiCc
	 v5Ik6vrsXVv96RLpWv5NkV004zn4/wUX8FnrUoM2M+ikI4K5BYXOl105a8d6/pWqxF
	 Nfk9r5W6cn3COgxuiHICz7exkRHU5f08ttTxS5Z4mCnAQdRpKPs4ZXUDTpVcBp2712
	 ji87ROWGTCX4pacYhBfneURF0XAq/lR6g68708osiQkggdOH6zdUxxySlRhzD8PydQ
	 KjbAq2PxN25MQ==
Date: Sat, 22 Jun 2024 00:03:59 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, ryder.lee@mediatek.com,
	lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, linux-mediatek@lists.infradead.org,
	lorenzo.bianconi83@gmail.com, linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
	nbd@nbd.name, dd@embedd.com, upstream@airoha.com,
	angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH 4/4] PCI: mediatek-gen3: Add Airoha EN7581 support
Message-ID: <ZnX4z9-UxXYdyBPT@lore-desk>
References: <f044eb44654522801d4a93e94918a32c72c4c49f.1718980864.git.lorenzo@kernel.org>
 <20240621180250.GA1396831@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3EmFiM8r3ZH3wxen"
Content-Disposition: inline
In-Reply-To: <20240621180250.GA1396831@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_150404_730338_DBEB3F54 
X-CRM114-Status: GOOD (  24.97  )
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


--3EmFiM8r3ZH3wxen
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Fri, Jun 21, 2024 at 04:48:50PM +0200, Lorenzo Bianconi wrote:
> > Introduce support for Airoha EN7581 pcie controller to mediatek-gen3
> > pcie controller driver.
>=20
> s/pcie/PCIe/ (twice)
>=20

ack, I will fix them in v2

> > Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  drivers/pci/controller/Kconfig              |  2 +-
> >  drivers/pci/controller/pcie-mediatek-gen3.c | 84 ++++++++++++++++++++-
> >  2 files changed, 84 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kc=
onfig
> > index e534c02ee34f..3bd6c9430010 100644
> > --- a/drivers/pci/controller/Kconfig
> > +++ b/drivers/pci/controller/Kconfig
> > @@ -196,7 +196,7 @@ config PCIE_MEDIATEK
> > =20
> >  config PCIE_MEDIATEK_GEN3
> >  	tristate "MediaTek Gen3 PCIe controller"
> > -	depends on ARCH_MEDIATEK || COMPILE_TEST
> > +	depends on ARCH_AIROHA || ARCH_MEDIATEK || COMPILE_TEST
> >  	depends on PCI_MSI
> >  	help
> >  	  Adds support for PCIe Gen3 MAC controller for MediaTek SoCs.
> > diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/=
controller/pcie-mediatek-gen3.c
> > index 9842617795a9..2dacfed665c6 100644
> > --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> > +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> > @@ -7,6 +7,7 @@
> >   */
> > =20
> >  #include <linux/clk.h>
> > +#include <linux/clk-provider.h>
> >  #include <linux/delay.h>
> >  #include <linux/iopoll.h>
> >  #include <linux/irq.h>
> > @@ -21,6 +22,8 @@
> >  #include <linux/pm_domain.h>
> >  #include <linux/pm_runtime.h>
> >  #include <linux/reset.h>
> > +#include <linux/of_pci.h>
> > +#include <linux/of_device.h>
>=20
> Existing list of includes is sorted.  Preserve that sorted order.

ack, I will fix them in v2

>=20
> > +static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
> > +{
> > +	struct device *dev =3D pcie->dev;
> > +	int err;
> > +
> > +	writel_relaxed(0x23020133, pcie->base + 0x10044);
> > +	writel_relaxed(0x50500032, pcie->base + 0x15030);
> > +	writel_relaxed(0x50500032, pcie->base + 0x15130);
>=20
> Magic.  Needs #defines at least for the registers.  These offsets are
> HUGE, far bigger than the existing offsets:

ack. Anyway they are in pcie mapped regions (I have not posted the dts chan=
ges
yet):

pcie0: reg =3D <0x0 0x1fc00000 0x0 0x20000>;
pcie1: reg =3D <0x0 0x1fc20000 0x0 0x20000>;

But they are undocumented. I will try to get some info for them.

>=20
>   #define PCIE_CFGNUM_REG                 0x140
>   #define PCIE_CFG_OFFSET_ADDR            0x1000
>   #define PCIE_TRANS_TABLE_BASE_REG       0x800
>   #define PCIE_MSI_SET_BASE_REG           0xc00
>   #define PCIE_MSI_SET_ADDR_HI_BASE       0xc80
>   #define PCIE_MSI_SET_ENABLE_REG         0x190
>   #define PCIE_INT_ENABLE_REG             0x180
>   #define PCIE_SETTING_REG                0x80
>   #define PCIE_PCI_IDS_1                  0x9c
>   #define PCIE_MISC_CTRL_REG              0x348
>   #define PCIE_RST_CTRL_REG               0x148
>   #define PCIE_LINK_STATUS_REG            0x154
>   #define PCIE_LTSSM_STATUS_REG           0x150
>   #define PCIE_INT_STATUS_REG             0x184
>=20
> > +	err =3D phy_init(pcie->phy);
> > +	if (err) {
> > +		dev_err(dev, "failed to initialize PHY\n");
> > +		return err;
> > +	}
> > +	mdelay(30);
>=20
> Source?  Cite the spec that requires this delay and add a #define if
> possible.

They are undocumented in the vendor sdk, I will try some info for them (and
even for the ones below).

Regards,
Lorenzo

>=20
> > +	err =3D phy_power_on(pcie->phy);
> > +	if (err) {
> > +		dev_err(dev, "failed to power on PHY\n");
> > +		goto err_phy_on;
> > +	}
> > +
> > +	err =3D reset_control_bulk_deassert(pcie->soc->phy_resets.num_rsts,
> > +					  pcie->phy_resets);
> > +	if (err) {
> > +		dev_err(dev, "failed to deassert PHYs\n");
> > +		goto err_phy_deassert;
> > +	}
> > +	usleep_range(5000, 10000);
>=20
> Source?
>=20
> > +	pm_runtime_enable(dev);
> > +	pm_runtime_get_sync(dev);
> > +
> > +	err =3D clk_bulk_prepare(pcie->num_clks, pcie->clks);
> > +	if (err) {
> > +		dev_err(dev, "failed to prepare clock\n");
> > +		goto err_clk_prepare;
> > +	}
> > +
> > +	writel_relaxed(0x41474147, pcie->base + PCIE_EQ_PRESET_01_REF);
> > +	writel_relaxed(0x1018020f, pcie->base + PCIE_PIPE4_PIE8_REG);
> > +	mdelay(10);
>=20
> Source?

--3EmFiM8r3ZH3wxen
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZnX4zgAKCRA6cBh0uS2t
rLeCAQCFBOcP+pRhRD/u3Qw4FOgCe5z9/sbvOwpJaImvU67BlAD/XMMbMXVmeSDQ
r6i2QxAtvWovWR/oUbE94cvwl082LgE=
=kaKN
-----END PGP SIGNATURE-----

--3EmFiM8r3ZH3wxen--

