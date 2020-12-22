Return-Path: <SRS0=m1jb=F2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAABEC433E9
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Dec 2020 03:52:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8284022CB2
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Dec 2020 03:52:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8284022CB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=olWxVMACWYoZLukmxuFJVkMB2tiMY8BsOfrDO5/MtdQ=; b=aLd8xTLjCl9dWVrh6vOf1X0C1
	RsO4Wdv+vMLwo61hef8z4CDU7usMrlvgaq8o3hqvC+9lVlOhOtkWKqhiGeilKY4guDmoqeoqdlPf7
	l76HrVgi/Re+i9Tpli74/2rrj8BN6zbIe7HC8czrVh80TEwwwc/jhbJIULwgOS5NU5T+UZq3Pn9ke
	fWT7udgyJ0qmxaFbNr9lIaz1Cy0ChLsUo7/aGGqvsrOMH5nGndbnBygbD1cIDcoZoMi3LZNNFgAmY
	ppKrUBbgXqnbNoNLaGIbHqfvNj5fMn01JhRJ8yL+SoqXS5zUi70bjwA1hL9AfaLq1dWNK87kOHicz
	niA8aL6mg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krYix-0004iK-2V; Tue, 22 Dec 2020 03:52:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krYiu-0004hF-7D; Tue, 22 Dec 2020 03:52:34 +0000
X-UUID: 9d5b13931e114c679648bd9784cac4b5-20201221
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=5OtJXhy+uQdjmMwWXuLqLoFYUtmgpk77dScw+IQBNJE=; 
 b=Sc+J8jWRYKfBK68VcfWR0l/TEOh3D6nfLPrSIf9xoBwZPCU4HrHFkP6gASMZIHLLxhbIYIgW1m/C6TnRzVk/GCYYyPukOZJY+7OX6Y9TwqS2qW5n+SWlUpdqYStKSdX4LqYmvdmUJ0ZHB+eUPnGdgESIWF9olyfPWctz2H1gSVU=;
X-UUID: 9d5b13931e114c679648bd9784cac4b5-20201221
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1487145548; Mon, 21 Dec 2020 19:38:46 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Dec 2020 19:38:43 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 22 Dec 2020 11:38:40 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 22 Dec 2020 11:38:39 +0800
Message-ID: <1608608319.14736.97.camel@mhfsdcap03>
Subject: Re: [v5,2/3] PCI: mediatek-gen3: Add MediaTek Gen3 driver for MT8192
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 22 Dec 2020 11:38:39 +0800
In-Reply-To: <CANMq1KCSWf4PDMVhxFiLHOHe3dFqZbq1gzn4ph8aApVMX56MDg@mail.gmail.com>
References: <20201202133813.6917-1-jianjun.wang@mediatek.com>
 <20201202133813.6917-3-jianjun.wang@mediatek.com>
 <CANMq1KCSWf4PDMVhxFiLHOHe3dFqZbq1gzn4ph8aApVMX56MDg@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 68D23FE92533385F050B6E85D6FFF03063C34CA88579B1689B0552191E299AE02000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_225232_549118_4452B37D 
X-CRM114-Status: GOOD (  42.05  )
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
Cc: youlin.pei@mediatek.com, Devicetree List <devicetree@vger.kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, qizhong.cheng@mediatek.com,
 Chuanjia Liu <chuanjia.liu@mediatek.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-pci@vger.kernel.org,
 lkml <linux-kernel@vger.kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Sj Huang <sj.huang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Matthias
 Brugger <matthias.bgg@gmail.com>, sin_jieyang@mediatek.com, "David S .
 Miller" <davem@davemloft.net>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-12-21 at 10:18 +0800, Nicolas Boichat wrote:
> On Wed, Dec 2, 2020 at 9:39 PM Jianjun Wang <jianjun.wang@mediatek.com> wrote:
> >
> > MediaTek's PCIe host controller has three generation HWs, the new
> > generation HW is an individual bridge, it supports Gen3 speed and
> > up to 256 MSI interrupt numbers for multi-function devices.
> >
> > Add support for new Gen3 controller which can be found on MT8192.
> >
> > Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> > Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> 
> FWIW, I looked at Rob and Bjorn's comments on v4, and they seem to
> have been addressed (with one small nit highlighted below).
> 
> > ---
> > This patch dependents on "PCI: Export pci_pio_to_address() for module use"[1]
> > to build as a kernel module.
> >
> > This interface will be used by PCI host drivers for PIO translation,
> > export it to support compiling those drivers as kernel modules.
> >
> > [1]http://lists.infradead.org/pipermail/linux-mediatek/2020-December/019504.html
> > ---
> >  drivers/pci/controller/Kconfig              |   13 +
> >  drivers/pci/controller/Makefile             |    1 +
> >  drivers/pci/controller/pcie-mediatek-gen3.c | 1039 +++++++++++++++++++
> >  3 files changed, 1053 insertions(+)
> >  create mode 100644 drivers/pci/controller/pcie-mediatek-gen3.c
> >
> > [snip]
> > diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> > new file mode 100644
> > index 000000000000..d30ea734ac0a
> > --- /dev/null
> > +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> > @@ -0,0 +1,1039 @@
> > [snip]
> > +static int mtk_pcie_set_trans_table(struct mtk_pcie_port *port,
> > +                                   resource_size_t cpu_addr,
> > +                                   resource_size_t pci_addr,
> > +                                   resource_size_t size,
> > +                                   unsigned long type, int num)
> > +{
> > +       void __iomem *table;
> > +       u32 val = 0;
> 
> You don't need to init val to 0.
> 
> > +
> > +       if (num >= PCIE_MAX_TRANS_TABLES) {
> > +               dev_notice(port->dev, "not enough translate table[%d] for addr: %#llx, limited to [%d]\n",
> > +                          num, (unsigned long long) cpu_addr,
> > +                          PCIE_MAX_TRANS_TABLES);
> > +               return -ENODEV;
> > +       }
> > +
> > +       table = port->base + PCIE_TRANS_TABLE_BASE_REG +
> > +               num * PCIE_ATR_TLB_SET_OFFSET;
> > +
> > +       writel(lower_32_bits(cpu_addr) | PCIE_ATR_SIZE(fls(size) - 1), table);
> > +       writel(upper_32_bits(cpu_addr), table + PCIE_ATR_SRC_ADDR_MSB_OFFSET);
> > +       writel(lower_32_bits(pci_addr), table + PCIE_ATR_TRSL_ADDR_LSB_OFFSET);
> > +       writel(upper_32_bits(pci_addr), table + PCIE_ATR_TRSL_ADDR_MSB_OFFSET);
> > +
> > +       if (type == IORESOURCE_IO)
> > +               val = PCIE_ATR_TYPE_IO | PCIE_ATR_TLP_TYPE_IO;
> > +       else
> > +               val = PCIE_ATR_TYPE_MEM | PCIE_ATR_TLP_TYPE_MEM;
> > +
> > +       writel(val, table + PCIE_ATR_TRSL_PARAM_OFFSET);
> > +
> > +       return 0;
> > +}
> > +
> > +static int mtk_pcie_startup_port(struct mtk_pcie_port *port)
> > +{
> > +       struct resource_entry *entry;
> > +       struct pci_host_bridge *host = pci_host_bridge_from_priv(port);
> > +       unsigned int table_index = 0;
> > +       int err;
> > +       u32 val;
> > +
> > +       /* Set as RC mode */
> > +       val = readl(port->base + PCIE_SETTING_REG);
> > +       val |= PCIE_RC_MODE;
> > +       writel(val, port->base + PCIE_SETTING_REG);
> > +
> > +       /* Set class code */
> > +       val = readl(port->base + PCIE_PCI_IDS_1);
> > +       val &= ~GENMASK(31, 8);
> > +       val |= PCI_CLASS(PCI_CLASS_BRIDGE_PCI << 8);
> > +       writel(val, port->base + PCIE_PCI_IDS_1);
> > +
> > +       /* Assert all reset signals */
> > +       val = readl(port->base + PCIE_RST_CTRL_REG);
> > +       val |= PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RSTB;
> > +       writel(val, port->base + PCIE_RST_CTRL_REG);
> > +
> > +       /* De-assert reset signals */
> > +       val &= ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB);
> > +       writel(val, port->base + PCIE_RST_CTRL_REG);
> > +
> > +       /* Delay 100ms to wait the reference clocks become stable */
> > +       usleep_range(100 * 1000, 120 * 1000);
> 
> Any reason not to use msleep(100)?

No special reasons, but it seems the msleep() should be used when the
sleep time is more than 20ms (base on
Documentation/timers/timers-howto.rst).

I will replace to msleep(100) in the next version, thanks for your
review.
> 
> > +
> > +       /* De-assert PERST# signal */
> > +       val &= ~PCIE_PE_RSTB;
> > +       writel(val, port->base + PCIE_RST_CTRL_REG);
> > +
> > +       /* Check if the link is up or not */
> > +       err = readl_poll_timeout(port->base + PCIE_LINK_STATUS_REG, val,
> > +                       !!(val & PCIE_PORT_LINKUP), 20,
> > +                       50 * USEC_PER_MSEC);
> > +       if (err) {
> > +               val = readl(port->base + PCIE_LTSSM_STATUS_REG);
> > +               dev_notice(port->dev, "PCIe link down, ltssm reg val: %#x\n",
> > +                          val);
> > +               return err;
> > +       }
> > +
> > +       /* Set PCIe translation windows */
> > +       resource_list_for_each_entry(entry, &host->windows) {
> > +               struct resource *res = entry->res;
> > +               unsigned long type = resource_type(res);
> > +               resource_size_t cpu_addr;
> > +               resource_size_t pci_addr;
> > +               resource_size_t size;
> > +               const char *range_type;
> > +
> > +               if (type == IORESOURCE_IO) {
> > +                       cpu_addr = pci_pio_to_address(res->start);
> > +                       range_type = "IO";
> > +               } else if (type == IORESOURCE_MEM) {
> > +                       cpu_addr = res->start;
> > +                       range_type = "MEM";
> > +               } else {
> > +                       continue;
> > +               }
> > +
> > +               pci_addr = res->start - entry->offset;
> > +               size = resource_size(res);
> > +               err = mtk_pcie_set_trans_table(port, cpu_addr, pci_addr, size,
> > +                                              type, table_index);
> > +               if (err)
> > +                       return err;
> > +
> > +               dev_dbg(port->dev, "set %s trans window[%d]: cpu_addr = %#llx, pci_addr = %#llx, size = %#llx\n",
> > +                       range_type, table_index, (unsigned long long) cpu_addr,
> > +                       (unsigned long long) pci_addr,
> > +                       (unsigned long long) size);
> > +
> > +               table_index++;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > [snip]
> > +static irq_hw_number_t mtk_pcie_msi_get_hwirq(struct msi_domain_info *info,
> > +                                             msi_alloc_info_t *arg)
> > +{
> > +       struct msi_desc *entry = arg->desc;
> > +       struct mtk_pcie_port *port = info->chip_data;
> > +       int hwirq;
> > +
> > +       mutex_lock(&port->lock);
> > +
> > +       hwirq = bitmap_find_free_region(port->msi_irq_in_use, PCIE_MSI_IRQS_NUM,
> > +                                       order_base_2(entry->nvec_used));
> > +       if (hwirq < 0) {
> > +               mutex_unlock(&port->lock);
> > +               return -ENOSPC;
> > +       }
> > +
> > +       mutex_unlock(&port->lock);
> > +
> > +       return hwirq;
> 
> Code is good, but I had to look twice to make sure the mutex is
> unlocked. Is the following marginally better?
> 
> hwirq = ...;
> 
> mutex_unlock(&port->lock);
> 
> if (hwirq < 0)
>    return -ENOSPC;
> 
> return hwirq;

Impressive, I will fix it in the next version, and I think the hwirq can
be returned directly since it will be a negative value if
bitmap_find_free_region is failed. The code will be like the following:

hwirq = ...;

mutex_unlock(&port->lock);

return hwirq;

> 
> > +}
> > +
> > [snip]
> > +static void mtk_pcie_msi_handler(struct irq_desc *desc)
> > +{
> > +       struct mtk_pcie_msi *msi_info = irq_desc_get_handler_data(desc);
> > +       struct irq_chip *irqchip = irq_desc_get_chip(desc);
> > +       unsigned long msi_enable, msi_status;
> > +       unsigned int virq;
> > +       irq_hw_number_t bit, hwirq;
> > +
> > +       chained_irq_enter(irqchip, desc);
> > +
> > +       msi_enable = readl(msi_info->base + PCIE_MSI_ENABLE_OFFSET);
> > +       while ((msi_status = readl(msi_info->base + PCIE_MSI_STATUS_OFFSET))) {
> > +               msi_status &= msi_enable;
> 
> I don't know much about MSI, but what happens if you have a bit that
> is set in PCIE_MSI_STATUS_OFFSET register, but not in msi_enable?

If the bit that in PCIE_MSI_STATUS_OFFSET register is set but not in
msi_enable, it must be an abnormal usage of MSI or something goes wrong,
it should be ignored in case we can not find the corresponding handler.

> Sounds like you'll just spin-loop forever without acknowledging the
> interrupt.

The interrupt will be acknowledged in the irq_ack callback of
mtk_msi_irq_chip, which belongs to the msi_domain.

> 
> > +               for_each_set_bit(bit, &msi_status, PCIE_MSI_IRQS_PER_SET) {
> > +                       hwirq = bit + msi_info->index * PCIE_MSI_IRQS_PER_SET;
> > +                       virq = irq_find_mapping(msi_info->domain, hwirq);
> > +                       generic_handle_irq(virq);
> > +               }
> > +       }
> > +
> > +       chained_irq_exit(irqchip, desc);
> > +}
> > +
> > [snip]
> > +static int __maybe_unused mtk_pcie_suspend_noirq(struct device *dev)
> > +{
> > +       struct mtk_pcie_port *port = dev_get_drvdata(dev);
> > +       int err;
> > +       u32 val;
> > +
> > +       /* Trigger link to L2 state */
> > +       err = mtk_pcie_turn_off_link(port);
> > +       if (err) {
> > +               dev_notice(port->dev, "can not enter L2 state\n");
> 
> Rob suggested dev_error here.
> 
> (and IMHO, or lot of the other dev_notice above should probably get dev_error)

I will replace to dev_err, thanks for your review.
> 
> > +               return err;
> > +       }
> > +
> > +       /* Pull down the PERST# pin */
> > +       val = readl(port->base + PCIE_RST_CTRL_REG);
> > +       val |= PCIE_PE_RSTB;
> > +       writel(val, port->base + PCIE_RST_CTRL_REG);
> > +
> > +       dev_dbg(port->dev, "enter L2 state success");
> > +
> > +       clk_bulk_disable_unprepare(port->num_clks, port->clks);
> > +
> > +       phy_power_off(port->phy);
> > +
> > +       return 0;
> > +}
> > +
> > [snip]
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
