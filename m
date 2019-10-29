Return-Path: <SRS0=h+tY=YW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28C15CA9EC4
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Oct 2019 15:59:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E28B120856
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Oct 2019 15:59:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fLmFzuC7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="R58RieOy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E28B120856
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OZJiiivBN6fuWIoGjUQPWfXML269ws2jUyajiaGSfmA=; b=fLmFzuC7gntyVk
	A1ZJX32jUB3RG0q3Ttj/DtR6C/xy0Top/HWZv/KLhf7RaBkhq9KaCe+MtfiKs+lL8gVG/PIM6PgHe
	96dSa8mUQEapJB39u9t2q1ix99Mae8ISxB86I5SSpT1no0E7WHf15JuRQbVEaoMwyOreZ3zvgQgHl
	MknIiVZnSYtv3T/4oiUufcFNcANNm/BWvb/Q6kCFgdKUe8xhPyme92JQ1ICNy+upg4POfMyUBHAcT
	kFDycpSD2B4Q6dL1lWapYlf1BGH6g0khM8Xv5g4mfLi3rVAwhe2SdJiQX0cXSb3Z4NyTu7OghMSDH
	yQkJXNSzgUqiL659PgKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPTuR-0001i1-FK; Tue, 29 Oct 2019 15:59:51 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPTuO-0001gi-0l
 for linux-mediatek@lists.infradead.org; Tue, 29 Oct 2019 15:59:50 +0000
Received: by mail-wm1-x344.google.com with SMTP id 6so2305996wmf.0
 for <linux-mediatek@lists.infradead.org>; Tue, 29 Oct 2019 08:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jW6z4fKWJsBlYxKn7twBcd7IWPitytMCLX6jbiyT3C8=;
 b=R58RieOynQzxeOkYflDGPYNaowJp2iGxd/hBMRiOQ6dXaUV6q/dEFJAfuprFleLnbr
 2UZ5Py8YcpQPPN5KcmEqcPFoA8f7jGrIj/2s3Lca0AM9uzgIy+YlDBbF1PbzWdoY0MnS
 tbwtvlpJiWkIC5PmqYdS4J3BO6xh9HNEDLYkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jW6z4fKWJsBlYxKn7twBcd7IWPitytMCLX6jbiyT3C8=;
 b=HanpKGJOl4BMZVDSmjmBn1ruk0AQryGYxu8XJcECaogKIB85l2bEtxSSInmVWIDN8O
 DVCxVWA26FtelUrZbs3UILCzvI2+4aHVSdJ+a2fitZuLtqejK3MUQKxytRgOnUHWRhrC
 M4NFpiSkjn1pEDCJiA6BqtBDTQJyDral/22XSr9BlC3gtEnU3FsIrI1J78Bg+GShDR2G
 BOxXHZBPBzqc8vekQqAp0ocaonocx09j613yPTxGQUoYkk4r5ZkgyC9UHXHvCKOcRHxC
 sZOPL3JNBPyfKA4vT6e+fvXa0o8om+lyNI/LqBk/D4poqXsuoH5VZYN2kR8kW+MppJmw
 A0HQ==
X-Gm-Message-State: APjAAAVyMs/zmoz6eqqFnJUawCP6C47NzaBEO6ahEHbPFmcXW0wGrmvf
 BQvQBmpVX5LkvGs2mGzn0Q8bzE7uxXEf46U5UY6/TQ==
X-Google-Smtp-Source: APXvYqyUalWNgn46AHsfEyAbE1JclhNBGQx9jhMwfsntmJynyRXE6Rw4WOC1O2HAw7rZ07ZQDAROcByNyjIizGr51ZM=
X-Received: by 2002:a05:600c:142:: with SMTP id
 w2mr4773242wmm.121.1572364786709; 
 Tue, 29 Oct 2019 08:59:46 -0700 (PDT)
MIME-Version: 1.0
References: <20191028163256.8004-1-robh@kernel.org>
 <20191028163256.8004-24-robh@kernel.org>
In-Reply-To: <20191028163256.8004-24-robh@kernel.org>
From: Srinath Mannam <srinath.mannam@broadcom.com>
Date: Tue, 29 Oct 2019 21:29:35 +0530
Message-ID: <CABe79T4p-YJp7nNx0iyyx46PFWBC57H-2+VL=RM9rKK-X4qdFg@mail.gmail.com>
Subject: Re: [PATCH v3 23/25] PCI: iproc: Use inbound resources for setup
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191029_085948_070534_EF25C36D 
X-CRM114-Status: GOOD (  19.49  )
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
Cc: Heiko Stuebner <heiko@sntech.de>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, linux-pci@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Toan Le <toan@os.amperecomputing.com>, Will Deacon <will@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Michal Simek <michal.simek@xilinx.com>, Christoph Hellwig <hch@infradead.org>,
 linux-rockchip@lists.infradead.org,
 BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
 Shawn Lin <shawn.lin@rock-chips.com>, Ray Jui <rjui@broadcom.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Ryder Lee <ryder.lee@mediatek.com>,
 linux-mediatek@lists.infradead.org, Andrew Murray <andrew.murray@arm.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>, Jingoo Han <jingoohan1@gmail.com>,
 rfi@lists.rocketboards.org, linux-renesas-soc@vger.kernel.org,
 Tom Joseph <tjoseph@cadence.com>, Simon Horman <horms@verge.net.au>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Ley Foon Tan <lftan@altera.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Rob,

I reviewed and verified this change.. It is working fine.

Regards,
Srinath.

On Mon, Oct 28, 2019 at 10:03 PM Rob Herring <robh@kernel.org> wrote:
>
> Now that the helpers provide the inbound resources in the host bridge
> 'dma_ranges' resource list, convert Broadcom iProc host bridge to use
> the resource list to setup the inbound addresses.
>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Ray Jui <rjui@broadcom.com>
> Cc: Scott Branden <sbranden@broadcom.com>
> Cc: bcm-kernel-feedback-list@broadcom.com
> Reviewed-by: Andrew Murray <andrew.murray@arm.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v2:
>  - Fix iproc_pcie_paxb_v2_msi_steer() to use resource_entry
> ---
>  drivers/pci/controller/pcie-iproc.c | 77 +++++++----------------------
>  1 file changed, 17 insertions(+), 60 deletions(-)
>
> diff --git a/drivers/pci/controller/pcie-iproc.c b/drivers/pci/controller/pcie-iproc.c
> index 223335ee791a..f4d78e66846e 100644
> --- a/drivers/pci/controller/pcie-iproc.c
> +++ b/drivers/pci/controller/pcie-iproc.c
> @@ -1122,15 +1122,16 @@ static int iproc_pcie_ib_write(struct iproc_pcie *pcie, int region_idx,
>  }
>
>  static int iproc_pcie_setup_ib(struct iproc_pcie *pcie,
> -                              struct of_pci_range *range,
> +                              struct resource_entry *entry,
>                                enum iproc_pcie_ib_map_type type)
>  {
>         struct device *dev = pcie->dev;
>         struct iproc_pcie_ib *ib = &pcie->ib;
>         int ret;
>         unsigned int region_idx, size_idx;
> -       u64 axi_addr = range->cpu_addr, pci_addr = range->pci_addr;
> -       resource_size_t size = range->size;
> +       u64 axi_addr = entry->res->start;
> +       u64 pci_addr = entry->res->start - entry->offset;
> +       resource_size_t size = resource_size(entry->res);
>
>         /* iterate through all IARR mapping regions */
>         for (region_idx = 0; region_idx < ib->nr_regions; region_idx++) {
> @@ -1182,66 +1183,19 @@ static int iproc_pcie_setup_ib(struct iproc_pcie *pcie,
>         return ret;
>  }
>
> -static int iproc_pcie_add_dma_range(struct device *dev,
> -                                   struct list_head *resources,
> -                                   struct of_pci_range *range)
> -{
> -       struct resource *res;
> -       struct resource_entry *entry, *tmp;
> -       struct list_head *head = resources;
> -
> -       res = devm_kzalloc(dev, sizeof(struct resource), GFP_KERNEL);
> -       if (!res)
> -               return -ENOMEM;
> -
> -       resource_list_for_each_entry(tmp, resources) {
> -               if (tmp->res->start < range->cpu_addr)
> -                       head = &tmp->node;
> -       }
> -
> -       res->start = range->cpu_addr;
> -       res->end = res->start + range->size - 1;
> -
> -       entry = resource_list_create_entry(res, 0);
> -       if (!entry)
> -               return -ENOMEM;
> -
> -       entry->offset = res->start - range->cpu_addr;
> -       resource_list_add(entry, head);
> -
> -       return 0;
> -}
> -
>  static int iproc_pcie_map_dma_ranges(struct iproc_pcie *pcie)
>  {
>         struct pci_host_bridge *host = pci_host_bridge_from_priv(pcie);
> -       struct of_pci_range range;
> -       struct of_pci_range_parser parser;
> -       int ret;
> -       LIST_HEAD(resources);
> -
> -       /* Get the dma-ranges from DT */
> -       ret = of_pci_dma_range_parser_init(&parser, pcie->dev->of_node);
> -       if (ret)
> -               return ret;
> +       struct resource_entry *entry;
> +       int ret = 0;
>
> -       for_each_of_pci_range(&parser, &range) {
> -               ret = iproc_pcie_add_dma_range(pcie->dev,
> -                                              &resources,
> -                                              &range);
> -               if (ret)
> -                       goto out;
> +       resource_list_for_each_entry(entry, &host->dma_ranges) {
>                 /* Each range entry corresponds to an inbound mapping region */
> -               ret = iproc_pcie_setup_ib(pcie, &range, IPROC_PCIE_IB_MAP_MEM);
> +               ret = iproc_pcie_setup_ib(pcie, entry, IPROC_PCIE_IB_MAP_MEM);
>                 if (ret)
> -                       goto out;
> +                       break;
>         }
>
> -       list_splice_init(&resources, &host->dma_ranges);
> -
> -       return 0;
> -out:
> -       pci_free_resource_list(&resources);
>         return ret;
>  }
>
> @@ -1276,13 +1230,16 @@ static int iproce_pcie_get_msi(struct iproc_pcie *pcie,
>  static int iproc_pcie_paxb_v2_msi_steer(struct iproc_pcie *pcie, u64 msi_addr)
>  {
>         int ret;
> -       struct of_pci_range range;
> +       struct resource_entry entry;
> +
> +       memset(&entry, 0, sizeof(entry));
> +       entry.res = &entry.__res;
>
> -       memset(&range, 0, sizeof(range));
> -       range.size = SZ_32K;
> -       range.pci_addr = range.cpu_addr = msi_addr & ~(range.size - 1);
> +       msi_addr &= ~(SZ_32K - 1);
> +       entry.res->start = msi_addr;
> +       entry.res->end = msi_addr + SZ_32K - 1;
>
> -       ret = iproc_pcie_setup_ib(pcie, &range, IPROC_PCIE_IB_MAP_IO);
> +       ret = iproc_pcie_setup_ib(pcie, &entry, IPROC_PCIE_IB_MAP_IO);
>         return ret;
>  }
>
> --
> 2.20.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
