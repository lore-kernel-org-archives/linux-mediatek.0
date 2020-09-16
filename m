Return-Path: <SRS0=dHEP=CZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A9F3C433E2
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2020 13:01:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D861522268
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2020 13:01:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eLB4dFm+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qAhL+36b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D861522268
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1R5knkKlZmRLM1SSVN69CTj77j2U0TUjTGieEQNqU68=; b=eLB4dFm+0N9dPyvvHcf9Cf/uf
	cSjkf4/RfHcujmJ7NOvUwvN1/VT3p7GvYOVvZYxJd8waIIHTMxpMUghrZ1CPNcYqrSa6Q5zNWdagC
	7fSRPStCei3kDHy9aYX87u977rCfhRXMeOmHx/CbbsVKsPqI5Uh//6XZxlkVDIqq//+PC2ckuVETa
	xdQ+IM+UPMzoCwxWmA0Xhsa+8oyr04Rk+OwSxQxhAyHnFs0Qma73lSiUgj//qGzC71xNLkZtlJsRm
	LJwyZXsDywAVJV2rkfSN9o96XuaaA+H55QLRX8uyImk3IKXM9vShfS57ssBG4iH6dXGpNpYg5S5Fz
	MhcM/ZZFA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIX3u-0002dk-8J; Wed, 16 Sep 2020 13:01:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIX3q-0002ct-Ps; Wed, 16 Sep 2020 13:01:25 +0000
X-UUID: 6b61a71826f14ed3b4e3a9fa84c7b886-20200916
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=GDMjgBdQ+nW6DZ85orJ6vHwVjwV5AIjLkautMBIp2u8=; 
 b=qAhL+36bShIE+tdnaU+szVUfYXflbxHQiim6Uzm9L9TYRoK4EqZWBbi9YDA9nH4qeFZgVf4TqYPhgsH0TLHgzmBwuRBbGBjyXFxRb91o+tNWSJbTjDsyoIdbmxl+ZBxR3aIYFulK/xsjGEIgUDwyNn9jYyCYi2OAYynJray84fo=;
X-UUID: 6b61a71826f14ed3b4e3a9fa84c7b886-20200916
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 970026750; Wed, 16 Sep 2020 05:01:14 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Sep 2020 05:51:13 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs05n1.mediatek.inc
 (172.21.101.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 16 Sep 2020 20:51:08 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 16 Sep 2020 20:51:08 +0800
Message-ID: <1600260543.2521.56.camel@mhfsdcap03>
Subject: Re: [v2,2/3] PCI: mediatek: Add new generation controller support
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Wed, 16 Sep 2020 20:49:03 +0800
In-Reply-To: <CAL_JsqJ0sBK0pSDec3KBwNNq9metxn2x1-O9ANzPOktboRxc1A@mail.gmail.com>
References: <20200910034536.30860-1-jianjun.wang@mediatek.com>
 <20200910034536.30860-3-jianjun.wang@mediatek.com>
 <20200911224434.GA2905744@bogus> <1600081533.2521.49.camel@mhfsdcap03>
 <CAL_JsqJ0sBK0pSDec3KBwNNq9metxn2x1-O9ANzPOktboRxc1A@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_090123_032176_F2AC172D 
X-CRM114-Status: GOOD (  28.23  )
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
Cc: devicetree@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 PCI <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sj Huang <sj.huang@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Bjorn
 Helgaas <bhelgaas@google.com>, David Miller <davem@davemloft.net>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-09-14 at 08:32 -0600, Rob Herring wrote:
> On Mon, Sep 14, 2020 at 5:07 AM Jianjun Wang <jianjun.wang@mediatek.com> wrote:
> >
> > On Fri, 2020-09-11 at 16:44 -0600, Rob Herring wrote:
> > > On Thu, Sep 10, 2020 at 11:45:35AM +0800, Jianjun Wang wrote:
> > > > MediaTek's PCIe host controller has three generation HWs, the new
> > > > generation HW is an individual bridge, it supoorts Gen3 speed and
> > > > up to 256 MSI interrupt numbers for multi-function devices.
> > > >
> > > > Add support for new Gen3 controller which can be found on MT8192.
> > > >
> > > > Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> > > > Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> > > > ---
> > > >  drivers/pci/controller/Kconfig              |   14 +
> > > >  drivers/pci/controller/Makefile             |    1 +
> > > >  drivers/pci/controller/pcie-mediatek-gen3.c | 1076 +++++++++++++++++++
> > > >  3 files changed, 1091 insertions(+)
> > > >  create mode 100644 drivers/pci/controller/pcie-mediatek-gen3.c
> > > >
> > > > diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
> > > > index f18c3725ef80..83daa772595b 100644
> > > > --- a/drivers/pci/controller/Kconfig
> > > > +++ b/drivers/pci/controller/Kconfig
> > > > @@ -239,6 +239,20 @@ config PCIE_MEDIATEK
> > > >       Say Y here if you want to enable PCIe controller support on
> > > >       MediaTek SoCs.
> > > >
> > > > +config PCIE_MEDIATEK_GEN3
> > > > +   tristate "MediaTek GEN3 PCIe controller"
> > > > +   depends on ARCH_MEDIATEK || COMPILE_TEST
> > > > +   depends on OF
> > > > +   depends on PCI_MSI_IRQ_DOMAIN
> > > > +   help
> > > > +     Adds support for PCIe Gen3 MAC controller for MediaTek SoCs.
> > > > +     This PCIe controller provides the capable of Gen3, Gen2 and
> > > > +     Gen1 speed, and support up to 256 MSI interrupt numbers for
> > > > +     multi-function devices.
> > > > +
> > > > +     Say Y here if you want to enable Gen3 PCIe controller support on
> > > > +     MediaTek SoCs.
> > > > +
> > > >  config PCIE_TANGO_SMP8759
> > > >     bool "Tango SMP8759 PCIe controller (DANGEROUS)"
> > > >     depends on ARCH_TANGO && PCI_MSI && OF
> > > > diff --git a/drivers/pci/controller/Makefile b/drivers/pci/controller/Makefile
> > > > index bcdbf49ab1e4..9c1b96777597 100644
> > > > --- a/drivers/pci/controller/Makefile
> > > > +++ b/drivers/pci/controller/Makefile
> > > > @@ -27,6 +27,7 @@ obj-$(CONFIG_PCIE_ROCKCHIP) += pcie-rockchip.o
> > > >  obj-$(CONFIG_PCIE_ROCKCHIP_EP) += pcie-rockchip-ep.o
> > > >  obj-$(CONFIG_PCIE_ROCKCHIP_HOST) += pcie-rockchip-host.o
> > > >  obj-$(CONFIG_PCIE_MEDIATEK) += pcie-mediatek.o
> > > > +obj-$(CONFIG_PCIE_MEDIATEK_GEN3) += pcie-mediatek-gen3.o
> > > >  obj-$(CONFIG_PCIE_TANGO_SMP8759) += pcie-tango.o
> > > >  obj-$(CONFIG_VMD) += vmd.o
> > > >  obj-$(CONFIG_PCIE_BRCMSTB) += pcie-brcmstb.o
> > > > diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> > > > new file mode 100644
> > > > index 000000000000..f8c8bdf88d33
> > > > --- /dev/null
> > > > +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> > > > @@ -0,0 +1,1076 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +/*
> > > > + * MediaTek PCIe host controller driver.
> > > > + *
> > > > + * Copyright (c) 2020 MediaTek Inc.
> > > > + * Author: Jianjun Wang <jianjun.wang@mediatek.com>
> > > > + */
> > > > +
> > > > +#include <linux/clk.h>
> > > > +#include <linux/delay.h>
> > > > +#include <linux/iopoll.h>
> > > > +#include <linux/irq.h>
> > > > +#include <linux/irqchip/chained_irq.h>
> > > > +#include <linux/irqdomain.h>
> > > > +#include <linux/kernel.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/msi.h>
> > > > +#include <linux/of_address.h>
> > > > +#include <linux/of_clk.h>
> > > > +#include <linux/of_pci.h>
> > > > +#include <linux/of_platform.h>
> > > > +#include <linux/pci.h>
> > > > +#include <linux/phy/phy.h>
> > > > +#include <linux/platform_device.h>
> > > > +#include <linux/pm_domain.h>
> > > > +#include <linux/pm_runtime.h>
> > > > +#include <linux/reset.h>
> > > > +
> > > > +#include "../pci.h"
> > > > +
> > > > +#define PCIE_SETTING_REG           0x80
> > > > +#define PCIE_PCI_IDS_1                     0x9c
> > > > +#define PCI_CLASS(class)           (class << 8)
> > > > +#define PCIE_RC_MODE                       BIT(0)
> > > > +
> > > > +#define PCIE_CFGNUM_REG                    0x140
> > > > +#define PCIE_CFG_DEVFN(devfn)              ((devfn) & GENMASK(7, 0))
> > > > +#define PCIE_CFG_BUS(bus)          (((bus) << 8) & GENMASK(15, 8))
> > > > +#define PCIE_CFG_BYTE_EN(bytes)            (((bytes) << 16) & GENMASK(19, 16))
> > > > +#define PCIE_CFG_FORCE_BYTE_EN             BIT(20)
> > > > +#define PCIE_CFG_OFFSET_ADDR               0x1000
> > > > +#define PCIE_CFG_HEADER(devfn, bus) \
> > > > +   (PCIE_CFG_DEVFN(devfn) | PCIE_CFG_BUS(bus))
> > > > +
> > > > +#define PCIE_CFG_HEADER_FORCE_BE(devfn, bus, bytes) \
> > > > +   (PCIE_CFG_HEADER(devfn, bus) | PCIE_CFG_BYTE_EN(bytes) \
> > > > +    | PCIE_CFG_FORCE_BYTE_EN)
> > > > +
> > > > +#define PCIE_RST_CTRL_REG          0x148
> > > > +#define PCIE_MAC_RSTB                      BIT(0)
> > > > +#define PCIE_PHY_RSTB                      BIT(1)
> > > > +#define PCIE_BRG_RSTB                      BIT(2)
> > > > +#define PCIE_PE_RSTB                       BIT(3)
> > > > +
> > > > +#define PCIE_MISC_STATUS_REG               0x14C
> > > > +#define PCIE_LTR_MSG_RECEIVED              BIT(0)
> > > > +#define PCIE_PCIE_MSG_RECEIVED             BIT(1)
> > > > +
> > > > +#define PCIE_LTSSM_STATUS_REG              0x150
> > > > +#define PCIE_LTSSM_STATE_MASK              GENMASK(28, 24)
> > > > +#define PCIE_LTSSM_STATE(val)              ((val & PCIE_LTSSM_STATE_MASK) >> 24)
> > > > +#define PCIE_LTSSM_STATE_L0                0x10
> > > > +#define PCIE_LTSSM_STATE_L1_IDLE   0x13
> > > > +#define PCIE_LTSSM_STATE_L2_IDLE   0x14
> > > > +
> > > > +#define PCIE_LINK_STATUS_REG               0x154
> > > > +#define PCIE_PORT_LINKUP           BIT(8)
> > > > +
> > > > +#define PCIE_MSI_SET_NUM           8
> > > > +#define PCIE_MSI_IRQS_PER_SET              32
> > > > +#define PCIE_MSI_IRQS_NUM \
> > > > +   (PCIE_MSI_IRQS_PER_SET * (PCIE_MSI_SET_NUM))
> > > > +
> > > > +#define PCIE_INT_ENABLE_REG                0x180
> > > > +#define PCIE_MSI_MASK                      GENMASK(PCIE_MSI_SET_NUM + 8 - 1, 8)
> > > > +#define PCIE_MSI_SHIFT                     8
> > > > +#define PCIE_INTX_SHIFT                    24
> > > > +#define PCIE_INTX_MASK                     GENMASK(27, 24)
> > > > +#define PCIE_MSG_MASK                      BIT(28)
> > > > +#define PCIE_AER_MASK                      BIT(29)
> > > > +#define PCIE_PM_MASK                       BIT(30)
> > > > +
> > > > +#define PCIE_INT_STATUS_REG                0x184
> > > > +#define PCIE_MSI_SET_ENABLE_REG            0x190
> > > > +
> > > > +#define PCIE_LOW_POWER_CTRL_REG            0x194
> > > > +#define PCIE_DIS_LOWPWR_MASK               GENMASK(3, 0)
> > > > +#define PCIE_DIS_L0S_MASK          BIT(0)
> > > > +#define PCIE_DIS_L1_MASK           BIT(1)
> > > > +#define PCIE_DIS_L11_MASK          BIT(2)
> > > > +#define PCIE_DIS_L12_MASK          BIT(3)
> > > > +#define PCIE_FORCE_DIS_LOWPWR              GENMASK(11, 8)
> > > > +#define PCIE_FORCE_DIS_L0S         BIT(8)
> > > > +#define PCIE_FORCE_DIS_L1          BIT(9)
> > > > +#define PCIE_FORCE_DIS_L11         BIT(10)
> > > > +#define PCIE_FORCE_DIS_L12         BIT(11)
> > > > +
> > > > +#define PCIE_ICMD_PM_REG           0x198
> > > > +#define PCIE_TURN_OFF_LINK         BIT(4)
> > > > +
> > > > +#define PCIE_MSI_ADDR_BASE_REG             0xc00
> > > > +#define PCIE_MSI_SET_OFFSET                0x10
> > > > +#define PCIE_MSI_STATUS_OFFSET             0x04
> > > > +#define PCIE_MSI_ENABLE_OFFSET             0x08
> > > > +
> > > > +#define PCIE_TRANS_TABLE_BASE_REG  0x800
> > > > +#define PCIE_ATR_SRC_ADDR_MSB_OFFSET       0x4
> > > > +#define PCIE_ATR_TRSL_ADDR_LSB_OFFSET      0x8
> > > > +#define PCIE_ATR_TRSL_ADDR_MSB_OFFSET      0xc
> > > > +#define PCIE_ATR_TRSL_PARAM_OFFSET 0x10
> > > > +#define PCIE_ATR_TLB_SET_OFFSET            0x20
> > > > +
> > > > +#define PCIE_MAX_TRANS_TABLES              8
> > > > +#define ATR_EN                             BIT(0)
> > > > +#define ATR_SIZE(size)                     ((((size) - 1) << 1) & GENMASK(6, 1))
> > > > +#define ATR_ID(id)                 (id & GENMASK(3, 0))
> > > > +#define ATR_PARAM(param)           (((param) << 16) & GENMASK(27, 16))
> > > > +
> > > > +/**
> > > > + * struct mtk_pcie_msi - MSI information for each set
> > > > + * @base: IO mapped register base
> > > > + * @hwirq: Hardware interrupt number
> > > > + * @irq: MSI set Interrupt number
> > > > + * @index: MSI set number
> > > > + * @msg_addr: MSI message address
> > > > + * @domain: IRQ domain
> > > > + */
> > > > +struct mtk_pcie_msi {
> > > > +   void __iomem *base;
> > > > +   int hwirq;
> > > > +   int irq;
> > > > +   int index;
> > > > +   phys_addr_t msg_addr;
> > > > +   struct irq_domain *domain;
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct mtk_pcie_port - PCIe port information
> > > > + * @dev: PCIe device
> > > > + * @base: IO mapped register base
> > > > + * @reg_base: Physical register base
> > > > + * @mac_reset: mac reset control
> > > > + * @phy_reset: phy reset control
> > > > + * @phy: PHY controller block
> > > > + * @clks: PCIe clocks
> > > > + * @num_clks: PCIe clocks count for this port
> > > > + * @is_suspended: device suspend state
> > > > + * @irq: PCIe controller interrupt number
> > > > + * @intx_domain: legacy INTx IRQ domain
> > > > + * @msi_domain: MSI IRQ domain
> > > > + * @msi_top_domain: MSI IRQ top domain
> > > > + * @msi_info: MSI sets information
> > > > + * @lock: lock protecting IRQ bit map
> > > > + * @msi_irq_in_use: bit map for assigned MSI IRQ
> > > > + */
> > > > +struct mtk_pcie_port {
> > > > +   struct device *dev;
> > > > +   void __iomem *base;
> > > > +   phys_addr_t reg_base;
> > > > +   struct reset_control *mac_reset;
> > > > +   struct reset_control *phy_reset;
> > > > +   struct phy *phy;
> > > > +   struct clk **clks;
> > > > +   int num_clks;
> > > > +   bool is_suspended;
> > > > +
> > > > +   int irq;
> > > > +   struct irq_domain *intx_domain;
> > > > +   struct irq_domain *msi_domain;
> > > > +   struct irq_domain *msi_top_domain;
> > > > +   struct mtk_pcie_msi **msi_info;
> > > > +   struct mutex lock;
> > > > +   DECLARE_BITMAP(msi_irq_in_use, PCIE_MSI_IRQS_NUM);
> > > > +};
> > > > +
> > > > +static int mtk_pcie_config_read(struct pci_bus *bus, unsigned int devfn,
> > > > +                               int where, int size, u32 *val)
> > > > +{
> > > > +   struct mtk_pcie_port *port = bus->sysdata;
> > > > +   int bytes;
> > > > +
> > > > +   bytes = ((1 << size) - 1) << (where & 0x3);
> > > > +   writel(PCIE_CFG_HEADER_FORCE_BE(devfn, bus->number, bytes),
> > > > +          port->base + PCIE_CFGNUM_REG);
> > > > +
> > > > +   *val = readl(port->base + PCIE_CFG_OFFSET_ADDR + (where & ~0x3));
> > > > +
> > > > +   if (size <= 2)
> > > > +           *val = (*val >> (8 * (where & 0x3))) & ((1 << (size * 8)) - 1);
> > > > +
> > > > +   return PCIBIOS_SUCCESSFUL;
> > > > +}
> > > > +
> > > > +static int mtk_pcie_config_write(struct pci_bus *bus, unsigned int devfn,
> > > > +                                int where, int size, u32 val)
> > > > +{
> > > > +   struct mtk_pcie_port *port = bus->sysdata;
> > > > +   int bytes;
> > > > +
> > > > +   bytes = ((1 << size) - 1) << (where & 0x3);
> > > > +   writel(PCIE_CFG_HEADER_FORCE_BE(devfn, bus->number, bytes),
> > > > +          port->base + PCIE_CFGNUM_REG);
> > > > +
> > > > +   if (size <= 2)
> > > > +           val = (val & ((1 << (size * 8)) - 1)) << ((where & 0x3) * 8);
> > > > +
> > > > +   writel(val, port->base + PCIE_CFG_OFFSET_ADDR + (where & ~0x3));
> > > > +
> > > > +   return PCIBIOS_SUCCESSFUL;
> > > > +}
> > > > +
> > > > +static struct pci_ops mtk_pcie_ops = {
> > > > +   .read  = mtk_pcie_config_read,
> > > > +   .write = mtk_pcie_config_write,
> > > > +};
> > > > +
> > > > +static void mtk_pcie_set_trans_window(void __iomem *reg,
> > > > +                                 resource_size_t cpu_addr,
> > > > +                                 resource_size_t pci_addr, size_t size)
> > > > +{
> > > > +   writel(lower_32_bits(cpu_addr) | ATR_SIZE(fls(size) - 1) | ATR_EN, reg);
> > > > +   writel(upper_32_bits(cpu_addr), reg + PCIE_ATR_SRC_ADDR_MSB_OFFSET);
> > > > +   writel(lower_32_bits(pci_addr), reg + PCIE_ATR_TRSL_ADDR_LSB_OFFSET);
> > > > +   writel(upper_32_bits(pci_addr), reg + PCIE_ATR_TRSL_ADDR_MSB_OFFSET);
> > > > +   writel(ATR_ID(0) | ATR_PARAM(0), reg + PCIE_ATR_TRSL_PARAM_OFFSET);
> > > > +}
> > > > +
> > > > +static int mtk_pcie_set_trans_table(void __iomem *reg,
> > > > +                               resource_size_t cpu_addr,
> > > > +                               resource_size_t pci_addr, size_t size,
> > > > +                               int num)
> > > > +{
> > > > +   void __iomem *table_base;
> > > > +
> > > > +   if (num > PCIE_MAX_TRANS_TABLES)
> > > > +           return -ENODEV;
> > > > +
> > > > +   table_base = reg + num * PCIE_ATR_TLB_SET_OFFSET;
> > > > +   mtk_pcie_set_trans_window(table_base, cpu_addr, pci_addr, size);
> > > > +
> > > > +   return 0;
> > > > +}
> > > > +
> > > > +static int mtk_pcie_startup_port(struct mtk_pcie_port *port)
> > > > +{
> > > > +   struct resource_entry *entry;
> > > > +   struct pci_host_bridge *host = pci_host_bridge_from_priv(port);
> > > > +   u32 val;
> > > > +   int err = 0, table_index = 0;
> > > > +
> > > > +   /* Set as RC mode */
> > > > +   val = readl(port->base + PCIE_SETTING_REG);
> > > > +   val |= PCIE_RC_MODE;
> > > > +   writel(val, port->base + PCIE_SETTING_REG);
> > > > +
> > > > +   /* Set class code */
> > > > +   val = readl(port->base + PCIE_PCI_IDS_1);
> > > > +   val &= ~GENMASK(31, 8);
> > > > +   val |= PCI_CLASS(PCI_CLASS_BRIDGE_PCI << 8);
> > > > +   writel(val, port->base + PCIE_PCI_IDS_1);
> > > > +
> > > > +   /* Assert all reset signals */
> > > > +   val = readl(port->base + PCIE_RST_CTRL_REG);
> > > > +   val |= PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RSTB;
> > > > +   writel(val, port->base + PCIE_RST_CTRL_REG);
> > > > +
> > > > +   /* De-assert reset signals*/
> > > > +   val &= ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB);
> > > > +   writel(val, port->base + PCIE_RST_CTRL_REG);
> > > > +
> > > > +   usleep_range(100 * 1000, 120 * 1000);
> > >
> > > Seems like a long delay...
> >
> > Yes, it's truly a long delay, the PCI Express Card Electromechanical
> > Specification suggests that the de-assertion of PERST# should be delayed
> > 100ms to wait the reference clocks become stable.I will discuss with the
> > designers to check if we really need that long time and try to make it
> > shorter.
> 
> Just add a comment as to what the delay is for or based on.
> 
> [...]
> 
> > > > +static int __maybe_unused mtk_pcie_suspend_noirq(struct device *dev)
> > >
> > > Why do you need the noirq variant?
> >
> > I think the suspend of bus controller should be the last callback
> > function which will be called, so I add noirq variant to make sure it's
> > called after the device driver's suspend function.
> 
> The Linux driver model will ensure that. Child devices will be
> suspended before the parent. If there's some non parent-child
> dependency, that should get handled with devlinks.
> 
> Rob

Hi Rob,

If I want to trigger the PCIe link to L2 state, disable clocks and power
off the MAC and PHY when system suspend, should I use the *noirq*
callbacks to do so or just the normal suspend is sufficient? 

Thanks.
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
