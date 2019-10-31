Return-Path: <SRS0=DTTl=YY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAAEACA9EC3
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Oct 2019 10:57:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8236E2086D
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Oct 2019 10:57:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qE2ZOcjO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8236E2086D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rUqGhFWNwNnGfqR7xDZsMAlsu90tazsADVOcm6RoRjs=; b=qE2ZOcjOX3M5vP
	cNwgLz74R+SON/+EACFvgHxWME+T3QWzrzR/kfPZYDAXmRQOHwLvLwKi0o0g37wXNq7dHbeHYbMPi
	A8g3WF804A55gsdI64xc+H29azwepOIAMnmL4NzrCglGZBLS3BKsuwCydXfenHS9KW+u5vz8GKKyz
	5FHAK03nGEkW7KL4qKUCk0oshZRvoiXOG4vnBL1jHiYnQdi0n1BS1gkW5dRSwxfK80KGOdfxMMXIq
	H0WAgCf3lfaIIPm9EOeydsDEfSR+7oSPSx1a/3NGoyk23rrMq9ScbCZXk/ckksiZrwurOpFXIMcqd
	+Vdpap8edGLe70NbRa2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQ88m-0001nq-Lh; Thu, 31 Oct 2019 10:57:20 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQ88c-0001fX-Kf; Thu, 31 Oct 2019 10:57:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A76E446A;
 Thu, 31 Oct 2019 03:57:09 -0700 (PDT)
Received: from e121166-lin.cambridge.arm.com (unknown [10.1.196.255])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1AB5F3F719;
 Thu, 31 Oct 2019 03:57:05 -0700 (PDT)
Date: Thu, 31 Oct 2019 10:57:01 +0000
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 00/25] PCI host resource consolidation
Message-ID: <20191031105701.GA26080@e121166-lin.cambridge.arm.com>
References: <20191028163256.8004-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191028163256.8004-1-robh@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191031_035710_765494_E7932450 
X-CRM114-Status: GOOD (  16.37  )
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
 Ryder Lee <ryder.lee@mediatek.com>, Michal Simek <michal.simek@xilinx.com>,
 Christoph Hellwig <hch@infradead.org>, linux-rockchip@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, Shawn Lin <shawn.lin@rock-chips.com>,
 Ray Jui <rjui@broadcom.com>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
 Simon Horman <horms@verge.net.au>, linux-mediatek@lists.infradead.org,
 Andrew Murray <andrew.murray@arm.com>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Jingoo Han <jingoohan1@gmail.com>, rfi@lists.rocketboards.org,
 linux-renesas-soc@vger.kernel.org, Tom Joseph <tjoseph@cadence.com>,
 Srinath Mannam <srinath.mannam@broadcom.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Ley Foon Tan <lftan@altera.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Oct 28, 2019 at 11:32:31AM -0500, Rob Herring wrote:
> This started with just dma-ranges parsing consolidation, but has expanded
> to converting all host drivers to use pci_parse_request_of_pci_ranges()
> rather than devm_of_pci_get_host_bridge_resources(). This series moves
> the DT 'dma-ranges' parsing into common helpers utilizing a resource list.
> There's no (intended) functional change in this series though I'm also
> working on a separate series now in dt/next to improve the handling of
> 'dma-ranges' and dma masks.
> 
> The last patch may need to wait if there's any new users of
> devm_of_pci_get_host_bridge_resources.

I have applied it, along with the rest of the series, with v4 for:

PCI: of: Add inbound resource parsing to helpers

branch pci/mmio-dma-ranges, please let me know if there is something
I have missed.

Thanks,
Lorenzo

> Only versatile has been tested (on QEMU). The rest is compiled only. A git
> branch is here[1].
> 
> v3:
> - Fix >80 char lines
> - Rename resource_list_get_entry_of_type to resource_list_first_type
> 
> Rob
> 
> [1] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git pci-ranges-cleanup-v3
> 
> 
> Rob Herring (25):
>   resource: Add a resource_list_first_type helper
>   PCI: Export pci_parse_request_of_pci_ranges()
>   PCI: aardvark: Use pci_parse_request_of_pci_ranges()
>   PCI: altera: Use pci_parse_request_of_pci_ranges()
>   PCI: dwc: Use pci_parse_request_of_pci_ranges()
>   PCI: faraday: Use pci_parse_request_of_pci_ranges()
>   PCI: iproc: Use pci_parse_request_of_pci_ranges()
>   PCI: mediatek: Use pci_parse_request_of_pci_ranges()
>   PCI: mobiveil: Use pci_parse_request_of_pci_ranges()
>   PCI: rockchip: Use pci_parse_request_of_pci_ranges()
>   PCI: rockchip: Drop storing driver private outbound resource data
>   PCI: v3-semi: Use pci_parse_request_of_pci_ranges()
>   PCI: xgene: Use pci_parse_request_of_pci_ranges()
>   PCI: xilinx: Use pci_parse_request_of_pci_ranges()
>   PCI: xilinx-nwl: Use pci_parse_request_of_pci_ranges()
>   PCI: versatile: Use pci_parse_request_of_pci_ranges()
>   PCI: versatile: Remove usage of PHYS_OFFSET
>   PCI: versatile: Enable COMPILE_TEST
>   PCI: of: Add inbound resource parsing to helpers
>   PCI: ftpci100: Use inbound resources for setup
>   PCI: v3-semi: Use inbound resources for setup
>   PCI: xgene: Use inbound resources for setup
>   PCI: iproc: Use inbound resources for setup
>   PCI: rcar: Use inbound resources for setup
>   PCI: Make devm_of_pci_get_host_bridge_resources() static
> 
>  drivers/pci/controller/Kconfig                |  2 +-
>  .../pci/controller/dwc/pcie-designware-host.c | 29 ++----
>  drivers/pci/controller/pci-aardvark.c         | 60 +------------
>  drivers/pci/controller/pci-ftpci100.c         | 79 +++++-----------
>  drivers/pci/controller/pci-host-common.c      |  2 +-
>  drivers/pci/controller/pci-v3-semi.c          | 74 +++++----------
>  drivers/pci/controller/pci-versatile.c        | 71 ++++-----------
>  drivers/pci/controller/pci-xgene.c            | 73 +++++----------
>  drivers/pci/controller/pcie-altera.c          | 41 +--------
>  drivers/pci/controller/pcie-cadence-host.c    |  2 +-
>  drivers/pci/controller/pcie-iproc-platform.c  |  9 +-
>  drivers/pci/controller/pcie-iproc.c           | 82 ++++-------------
>  drivers/pci/controller/pcie-mediatek.c        | 43 +++------
>  drivers/pci/controller/pcie-mobiveil.c        | 27 ++----
>  drivers/pci/controller/pcie-rcar.c            | 48 ++++------
>  drivers/pci/controller/pcie-rockchip-host.c   | 89 +++++++------------
>  drivers/pci/controller/pcie-rockchip.h        |  5 --
>  drivers/pci/controller/pcie-xilinx-nwl.c      | 21 ++---
>  drivers/pci/controller/pcie-xilinx.c          | 18 +---
>  drivers/pci/of.c                              | 51 +++++++++--
>  drivers/pci/pci.h                             | 13 ---
>  include/linux/pci.h                           |  9 +-
>  include/linux/resource_ext.h                  | 12 +++
>  23 files changed, 261 insertions(+), 599 deletions(-)
> 
> --
> 2.20.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
