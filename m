Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48F8C30653
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 15:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4NJaQ10lbyHINB/IIYZk0j/7yzwJnPb3urSOvGu6XXE=; b=e3x0TPQjhcD8ExcMcIsFfZ1Ia2
	u9p7/qePMYh7Id2G9XsDninztJzYBZXpzhfg3evPLS1EnZsg6hVCPvRyuD4uj1GFzV/5wPltGPBKr
	xDEWbsJ3RYcoyzHiE326ybEVllpPDohzL45pehFXXSqNiM7mDDvZMW0mbBb30Oc2QIT6PiJIoM7ei
	HYU2u1aQvsHml34uCPu6jVufxuAlV0/S1DdE6Ei/4CMJqRean+WFBSynk+QzQt+6i3b6YYxz1xKrO
	Gn31e9T9LmZsK/9V1NjrSS4PXRXT/cKdK0jMToQ0vp8eAKtZqkjfe+U+jX+JrpWlKnt9C42eWlYLs
	oXDPBLnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP26k-0000000AixS-1hO5;
	Wed, 03 Jul 2024 15:41:22 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP26W-0000000AiuQ-2xx7;
	Wed, 03 Jul 2024 15:41:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 12348CE2CCE;
	Wed,  3 Jul 2024 15:41:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03F73C2BD10;
	Wed,  3 Jul 2024 15:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720021266;
	bh=qNF4mrVfx5AQWFS7p9pT6gLM7OgpbW8ynfjACZWYQr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CilsAVSCce0+7YMR2aIY6rC2xwsqNYF0VhQFcC4NQGmMt1G1d8L6njuKzrBU/STal
	 YAvgoT7PgSmtiuqka5F6BM/64fYA6SKSVbBIRkzbQNHKD6S9BRCyXyXkA4+dPaN9ud
	 AP0SiCCI6/ck4dOJJCU3j2wyh91lSveVAUV8UxLGcYlVu+0U/MQpnAAcTiqxdpJR5G
	 g0f4U8JzqMcXdZDFULUO6mYNMHklGEGvnDqZYZ0FvQLl+RzS3Wb1ihy33NcxRSac46
	 TxqgoISLpJ+hH/YSrU4/HMvwmiSNwFr421RQ9D1Pul+c6bSdbmLR+gA909gP7GcRM7
	 8SfRkqFn1RGXw==
Date: Wed, 3 Jul 2024 17:41:02 +0200
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
Subject: Re: [PATCH v3 4/4] PCI: mediatek-gen3: Add Airoha EN7581 support
Message-ID: <ZoVxDgxqH9pxlcjN@lore-desk>
References: <cover.1719668763.git.lorenzo@kernel.org>
 <27d28fabbf761e7a38bc6c8371234bf6a6462473.1719668763.git.lorenzo@kernel.org>
 <d04c396556612307b690c07a9b3fda7f0d4238ee.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/ROTeEc7ctHaENRg"
Content-Disposition: inline
In-Reply-To: <d04c396556612307b690c07a9b3fda7f0d4238ee.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_084109_148564_0AF6783D 
X-CRM114-Status: GOOD (  22.52  )
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


--/ROTeEc7ctHaENRg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Sat, 2024-06-29 at 15:51 +0200, Lorenzo Bianconi wrote:
> >  	=20
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >  Introduce support for Airoha EN7581 PCIe controller to mediatek-gen3
> > PCIe controller driver.
> >=20
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  drivers/pci/controller/Kconfig              |   2 +-
> >  drivers/pci/controller/pcie-mediatek-gen3.c | 108
> > +++++++++++++++++++-
> >  2 files changed, 108 insertions(+), 2 deletions(-)
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
> > index 438a5222d986..f3f76d1bfd4c 100644
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
> > @@ -29,6 +32,12 @@
> >  #define PCI_CLASS(class)		(class << 8)
> >  #define PCIE_RC_MODE			BIT(0)
> > =20
> > +#define PCIE_EQ_PRESET_01_REG		0x100
> > +#define PCIE_VAL_LN0_DOWNSTREAM		GENMASK(6, 0)
> > +#define PCIE_VAL_LN0_UPSTREAM		GENMASK(14, 8)
> > +#define PCIE_VAL_LN1_DOWNSTREAM		GENMASK(22, 16)
> > +#define PCIE_VAL_LN1_UPSTREAM		GENMASK(30, 24)
> > +
> >  #define PCIE_CFGNUM_REG			0x140
> >  #define PCIE_CFG_DEVFN(devfn)		((devfn) & GENMASK(7,
> > 0))
> >  #define PCIE_CFG_BUS(bus)		(((bus) << 8) & GENMASK(15, 8))
> > @@ -68,6 +77,14 @@
> >  #define PCIE_MSI_SET_ENABLE_REG		0x190
> >  #define PCIE_MSI_SET_ENABLE		GENMASK(PCIE_MSI_SET_NUM - 1,
> > 0)
> > =20
> > +#define PCIE_PIPE4_PIE8_REG		0x338
> > +#define PCIE_K_FINETUNE_MAX		GENMASK(5, 0)
> > +#define PCIE_K_FINETUNE_ERR		GENMASK(7, 6)
> > +#define PCIE_K_PRESET_TO_USE		GENMASK(18, 8)
> > +#define PCIE_K_PHYPARAM_QUERY		BIT(19)
> > +#define PCIE_K_QUERY_TIMEOUT		BIT(20)
> > +#define PCIE_K_PRESET_TO_USE_16G	GENMASK(31, 21)
> > +
> >  #define PCIE_MSI_SET_BASE_REG		0xc00
> >  #define PCIE_MSI_SET_OFFSET		0x10
> >  #define PCIE_MSI_SET_STATUS_OFFSET	0x04
> > @@ -100,7 +117,13 @@
> >  #define PCIE_ATR_TLP_TYPE_MEM		PCIE_ATR_TLP_TYPE(0)
> >  #define PCIE_ATR_TLP_TYPE_IO		PCIE_ATR_TLP_TYPE(2)
> > =20
> > -#define MAX_NUM_PHY_RESETS		1
> > +#define MAX_NUM_PHY_RESETS		3
> > +
> > +/* EN7581 */
> > +/* PCIe-PHY initialization delay in ms */
> > +#define PHY_INIT_TIME_MS		30
>=20
> Since we have already moved the PHY related settings to the PHY driver,
> can we also move this init time to the PHY driver?
>=20
> Thanks.

ack, I will do in the next revision.

Regards,
Lorenzo

>=20
> > +/* PCIe reset line delay in ms */
> > +#define PCIE_RESET_TIME_MS		100
> > =20
> >  struct mtk_gen3_pcie;
> >=20

--/ROTeEc7ctHaENRg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZoVxDgAKCRA6cBh0uS2t
rGfGAQDIriAbkLJknBu1tBTxYNqinQr+iUOxkoVRaXkkrIA5gQD/XIXKIQ7grira
ndUBnqqJrxPYzzTP0aN8DGTR2EaRFwk=
=E8/M
-----END PGP SIGNATURE-----

--/ROTeEc7ctHaENRg--

