Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C08CC27C4F
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Jun 2024 13:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZJfg4YFBFDxwpXcWmw6ubcs1lxwXeseY4JkfMOtsQQU=; b=mkK1oC1sny/0zwTuYItYIWuyEL
	XI+n/jWmLnb9js6GPbl79PPp1sVp5CH9Q/NKuvr99BVsxnasFg5p8vT7sWy9w02uEy9tzBwHRjDp1
	eTwFo/fNPMKiT3tx4fwvyIPPjvM+6WAKzhKKKhce9vgK7Z44aTvStV18LlS1Wo+t2YUV8jMfaqrdE
	yfSltGPYzP3pJYKnBRq9jYSHn76PQY98fu5YGyvhE+s5hOZGShVeuY3b4oGjdkm/JLP9VOSlNtp3t
	nJjwmpXc+ehKLQstCXgKGHUOdgAxTylMf8zgnNUBYxOG+YSGEDJxd0vRvelLFKUKImf5rvvq+m/7g
	EbfbQAkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNYHG-0000000GSlD-147h;
	Sat, 29 Jun 2024 13:38:06 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNYH5-0000000GSiU-1fcX;
	Sat, 29 Jun 2024 13:37:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1424ACE11AD;
	Sat, 29 Jun 2024 13:37:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C300EC2BBFC;
	Sat, 29 Jun 2024 13:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719668272;
	bh=QYzIwoDSwjddkb499/EKg87JPomcxVyhRm2s4gnORDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R60em4vZnP8S0zyRiFAWiDWvgcX2ZVkpCZeuB9QQEDGcxH2ceEmuHcugVZly/D4X5
	 4k0Y/KhpkHrugFNuJwbeGqgZEu/fWWBSalQY2psjZzjI/iCst+ry7F+Y9VZzI676yk
	 9UX6JgkbOIVmXq6sZkvLHLeX+e7KbIYRUFH9+bU9sp+OE32dUK/laDwT3F2mjo4YrA
	 mCslujW1nwKMY2EjjWJJk8lu6Azs/IfBnsSLQN/rHMjgQG09p4tG4DS9GRSOAUUMp2
	 iuCXhESnJJQnEt66lpp+jo40NnP2Ast3PJ79u7hMSLufmsWgUigZNB2BbWxD+LvVNQ
	 ffRIFSICYOBWg==
Date: Sat, 29 Jun 2024 15:37:48 +0200
From: "lorenzo@kernel.org" <lorenzo@kernel.org>
To: Jianjun Wang =?utf-8?B?KOeOi+W7uuWGmyk=?= <Jianjun.Wang@mediatek.com>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"nbd@nbd.name" <nbd@nbd.name>, "dd@embedd.com" <dd@embedd.com>,
	"robh@kernel.org" <robh@kernel.org>, "kw@linux.com" <kw@linux.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	Ryder Lee <Ryder.Lee@mediatek.com>,
	"lorenzo.bianconi83@gmail.com" <lorenzo.bianconi83@gmail.com>,
	upstream <upstream@airoha.com>
Subject: Re: [PATCH v2 4/4] PCI: mediatek-gen3: Add Airoha EN7581 support
Message-ID: <ZoAOLIiwa4VrVYAo@lore-desk>
References: <cover.1719475568.git.lorenzo@kernel.org>
 <b2c794b21e15ec85a57de144006db9582ce0c949.1719475568.git.lorenzo@kernel.org>
 <d817ac92756c9c7d96d8f8cc8a8538bbcabd85f1.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9/tn1eEvOs4Ib4Jn"
Content-Disposition: inline
In-Reply-To: <d817ac92756c9c7d96d8f8cc8a8538bbcabd85f1.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240629_063755_878877_6ECC8ACB 
X-CRM114-Status: GOOD (  32.24  )
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


--9/tn1eEvOs4Ib4Jn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi Lorenzo,

Hi Jianjun,

>=20
> On Thu, 2024-06-27 at 10:12 +0200, Lorenzo Bianconi wrote:
> >  	=20
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >  Introduce support for Airoha EN7581 PCIe controller to mediatek-gen3
> > PCIe controller driver.
> >=20
> > Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  drivers/pci/controller/Kconfig              |  2 +-
> >  drivers/pci/controller/pcie-mediatek-gen3.c | 96
> > ++++++++++++++++++++-
> >  2 files changed, 96 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/pci/controller/Kconfig
> > b/drivers/pci/controller/Kconfig
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
> > diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c
> > b/drivers/pci/controller/pcie-mediatek-gen3.c
> > index 438a5222d986..af567b4355fa 100644
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
> > @@ -15,6 +16,8 @@
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> >  #include <linux/msi.h>
> > +#include <linux/of_device.h>
> > +#include <linux/of_pci.h>
> >  #include <linux/pci.h>
> >  #include <linux/phy/phy.h>
> >  #include <linux/platform_device.h>
> > @@ -29,6 +32,7 @@
> >  #define PCI_CLASS(class)		(class << 8)
> >  #define PCIE_RC_MODE			BIT(0)
> > =20
> > +#define PCIE_EQ_PRESET_01_REF		0x100
> Should be PCIE_EQ_PRESET_01_REG

ack, I will fix it in v3.

>=20
> >  #define PCIE_CFGNUM_REG			0x140
> >  #define PCIE_CFG_DEVFN(devfn)		((devfn) & GENMASK(7,
> > 0))
> >  #define PCIE_CFG_BUS(bus)		(((bus) << 8) & GENMASK(15, 8))
> > @@ -68,6 +72,7 @@
> >  #define PCIE_MSI_SET_ENABLE_REG		0x190
> >  #define PCIE_MSI_SET_ENABLE		GENMASK(PCIE_MSI_SET_NUM - 1,
> > 0)
> > =20
> > +#define PCIE_PIPE4_PIE8_REG		0x338
> >  #define PCIE_MSI_SET_BASE_REG		0xc00
> >  #define PCIE_MSI_SET_OFFSET		0x10
> >  #define PCIE_MSI_SET_STATUS_OFFSET	0x04
> > @@ -100,7 +105,17 @@
> >  #define PCIE_ATR_TLP_TYPE_MEM		PCIE_ATR_TLP_TYPE(0)
> >  #define PCIE_ATR_TLP_TYPE_IO		PCIE_ATR_TLP_TYPE(2)
> > =20
> > -#define MAX_NUM_PHY_RESETS		1
> > +/* EN7581 */
> > +#define PCIE_PEXTP_DIG_GLB44_P0_REG	0x10044
> > +#define PCIE_PEXTP_DIG_LN_RX30_P0_REG	0x15030
> > +#define PCIE_PEXTP_DIG_LN_RX30_P1_REG	0x15130
> These registers belong to PHY, I think they should be added in the phy
> driver, which is located at drivers/phy/mediatek/phy-mtk-pcie.c.

ack, I will move this configuration in the pcie-phy driver.

>=20
> > +
> > +/* PCIe-PHY initialization delay in ms */
> > +#define PHY_INIT_TIME_MS		30
> > +/* PCIe reset line delay in ms */
> > +#define PCIE_RESET_TIME_MS		100
> > +
> > +#define MAX_NUM_PHY_RESETS		3
> > =20
> >  struct mtk_gen3_pcie;
> > =20
> > @@ -847,6 +862,74 @@ static int mtk_pcie_parse_port(struct
> > mtk_gen3_pcie *pcie)
> >  	return 0;
> >  }
> > =20
> > +static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
> > +{
> > +	struct device *dev =3D pcie->dev;
> > +	int err;
> > +
> > +	/* Wait for bulk assert completion in mtk_pcie_setup */
> > +	mdelay(PCIE_RESET_TIME_MS);
> > +
> > +	/* Setup Tx-Rx detect time */
> > +	writel_relaxed(0x23020133, pcie->base +
> > PCIE_PEXTP_DIG_GLB44_P0_REG);
> Please also add definitions for each field, the layout for
> PCIE_PEXTP_DIG_GLB44_P0_REG is:
> Bit[7:0]=20
>   Name: rg_xtp_rxdet_vcm_off_stb_t_sel
>   Description: Stable Time Selection of tx_cmkp_en De-Assert (DC Common
> Mode Turn-Off) During RX Detection, unit: 4 us
> Bit[15:8]
>   Name: rg_xtp_rxdet_en_stb_t_sel
>   Description: Stable Time Selection of tx_rxdet_en Assert During RX
> Detection, unit: 1 us
> Bit[23:16]
>   Name: rg_xtp_rxdet_finish_stb_t_sel
>   Description: rxdet finish stable time selection, unit: 1 tx250m_ck
> Bit[27:24]
>   Name: rg_xtp_txpd_tx_data_en_dly
>   Description: ckpd_tx_data_en_sync delay selection, unit: 1 tx250m_ck
> Bit[28:28]
>   Name: rg_xtp_txpd_rxdet_done_cdt
>   Description: rxdet_done cdt selection, 0: !pipe_tx_detect_rx  1:
> pipe_phy_status
> Bit[31:29]
>   Name: rg_xtp_rxdet_latch_stb_t_sel
>   Description: rxdet_latch state stable time selection, unit: 1
> tx250m_ck
>=20
> > +	/* Setup Rx AEQ training time */
> > +	writel_relaxed(0x50500032, pcie->base +
> > PCIE_PEXTP_DIG_LN_RX30_P0_REG);
> > +	writel_relaxed(0x50500032, pcie->base +
> > PCIE_PEXTP_DIG_LN_RX30_P1_REG);
> Layout for PEXTP_DIG_LN_RX30:
> Bit[7:0] rg_xtp_ln_rx_pdown_l1p2_exit_wait_cnt
> Bit[8] rg_xtp_ln_rx_pdown_t2rlb_dig_en
> Bit[28:16] rg_xtp_ln_rx_pdown_e0_aeqen_wait_us
>=20
> > +
> > +	err =3D phy_init(pcie->phy);
> > +	if (err) {
> > +		dev_err(dev, "failed to initialize PHY\n");
> > +		return err;
> > +	}
> > +	mdelay(PHY_INIT_TIME_MS);
> > +
> > +	err =3D phy_power_on(pcie->phy);
> > +	if (err) {
> > +		dev_err(dev, "failed to power on PHY\n");
> > +		goto err_phy_on;
> > +	}
> > +
> > +	err =3D reset_control_bulk_deassert(pcie->soc-
> > >phy_resets.num_resets, pcie->phy_resets);
> > +	if (err) {
> > +		dev_err(dev, "failed to deassert PHYs\n");
> > +		goto err_phy_deassert;
> > +	}
> > +	mdelay(PCIE_RESET_TIME_MS);
> > +
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
> Bit[6:0] val_ln0_dn
>   Bit [3:0]: Downstream port transmitter preset
>   Bit [6:4]: Downstream port receiver preset hint
> Bit[14:8] val_ln0_up
>   Bit [11:8]: Upstream port transmitter preset
>   Bit [14:12]: Upstream port receiver preset hint
> Bit[22:16] val_ln1_dn
>   Bit [19:16]: Downstream port transmitter preset
>   Bit [22:20]: Downstream port receiver preset hint
> BIt[30:24] val_ln1_up
>   Bit [27:24]: Upstream port transmitter preset
>   Bit [30:28]: Upstream port receiver preset hint
>=20
> > +	writel_relaxed(0x1018020f, pcie->base + PCIE_PIPE4_PIE8_REG);
> Bit[5:0] k_finetune_max
> Bit[7:6] k_finetune_err
> Bit[18:8] k_preset_to_use
> Bit[19:19] k_phyparam_query
> Bit[20:20] k_query_timeout
> Bit[31:21] k_preset_to_use_16g
>=20

ack, thx for the clarification. I will add them in v4.

Regards,
Lorenzo

> Thanks.
>=20
> > +
> > +	err =3D clk_bulk_enable(pcie->num_clks, pcie->clks);
> > +	if (err) {
> > +		dev_err(dev, "failed to prepare clock\n");
> > +		goto err_clk_enable;
> > +	}
> > +
> > +	return 0;
> > +
> > +err_clk_enable:
> > +	clk_bulk_unprepare(pcie->num_clks, pcie->clks);
> > +err_clk_prepare:
> > +	pm_runtime_put_sync(dev);
> > +	pm_runtime_disable(dev);
> > +	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets,
> > pcie->phy_resets);
> > +err_phy_deassert:
> > +	phy_power_off(pcie->phy);
> > +err_phy_on:
> > +	phy_exit(pcie->phy);
> > +
> > +	return err;
> > +}
> > +
> >  static int mtk_pcie_power_up(struct mtk_gen3_pcie *pcie)
> >  {
> >  	struct device *dev =3D pcie->dev;
> > @@ -1113,8 +1196,19 @@ static const struct mtk_gen3_pcie_pdata
> > mtk_pcie_soc_mt8192 =3D {
> >  	},
> >  };
> > =20
> > +static const struct mtk_gen3_pcie_pdata mtk_pcie_soc_en7581 =3D {
> > +	.power_up =3D mtk_pcie_en7581_power_up,
> > +	.phy_resets =3D {
> > +		.id[0] =3D "phy-lane0",
> > +		.id[1] =3D "phy-lane1",
> > +		.id[2] =3D "phy-lane2",
> > +		.num_resets =3D 3,
> > +	},
> > +};
> > +
> >  static const struct of_device_id mtk_pcie_of_match[] =3D {
> >  	{ .compatible =3D "mediatek,mt8192-pcie", .data =3D
> > &mtk_pcie_soc_mt8192 },
> > +	{ .compatible =3D "airoha,en7581-pcie", .data =3D
> > &mtk_pcie_soc_en7581 },
> >  	{},
> >  };
> >  MODULE_DEVICE_TABLE(of, mtk_pcie_of_match);
> > --=20
> > 2.45.2
> >=20

--9/tn1eEvOs4Ib4Jn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZoAOLAAKCRA6cBh0uS2t
rKcdAP4udH/FA1kqGICbwUA39JKy7rSUZuzATSP7OTOAZ+3j6wD8Ct3kmI/AVvgQ
Sokyo7wqeh+NESGdnNPGXYYaVGPCJQE=
=A7ol
-----END PGP SIGNATURE-----

--9/tn1eEvOs4Ib4Jn--

