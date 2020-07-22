Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D759DC433F1
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 21:06:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A077B2071A
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 21:06:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bxa0OIG3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="qCcFLMld"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A077B2071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:Subject:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=fdTR2N1XKCNrcU67uxlhJmiloMm4nkaeH+VT8Ajb0d8=; b=bxa0OIG3ey22vJkWZ8QDmqpU3
	JhtjbgATc3aFYYG7gwDnDh1PyPRY3eUgUjG3u/D+VZBnJkb2duWSqF++FobHpmYnR/QlpcO8hpUrL
	OTnZVIiBgT2+TuFUPM/B6/eIL/sJZm+iodM7JFLNn2iXZ1DM2utCBaqSSiVkHvWYDmQZJJLnLfJLD
	ymFZUp1NSLSAD9R4Xwt1/qvRy9+Du20io0PdHPie1DjVjcTwp3cGVKHbecMPfliXG6PIUMlhmRB7v
	GYpcB4K/89JOZDJXBGUj8nUBIO6uxRklEHOvkxht0xAPtk26v/xreO7L6ARR7zZwLuB8MpMH8A1Dm
	/SFde1HkA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyLwZ-0000q1-Cq; Wed, 22 Jul 2020 21:06:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyLwT-0000ow-VT; Wed, 22 Jul 2020 21:06:24 +0000
Received: from localhost (mobile-166-175-191-139.mycingular.net
 [166.175.191.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 87D892071A;
 Wed, 22 Jul 2020 21:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595451981;
 bh=0kXFnZ3eGvcksP1/5QGEmr83levSCrnfAw04C9aKAUg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=qCcFLMldUA/lEuy1Bs0znS3D/fRFo80D7/8OMxvC7nOUlNwSzA+1hurh+FLGFEMHy
 BIKMChOwtV2MdX3ldlZS050UVX51lsrhhhTLy/sQFGZnBVLgFU3pjt+GZi/R3oU1S0
 vByHkBAlX67Zki5PkuVfXiMopJA5FFUN9m8EBh44=
Date: Wed, 22 Jul 2020 16:06:19 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 00/19] PCI: Another round of host clean-ups
Message-ID: <20200722210619.GA1313543@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200722022514.1283916-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_170622_141616_FDB8F091 
X-CRM114-Status: GOOD (  19.26  )
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
 Shawn Lin <shawn.lin@rock-chips.com>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabio Estevam <festevam@gmail.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Will Deacon <will@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Murali Karicheri <m-karicheri2@ti.com>,
 NXP Linux Team <linux-imx@nxp.com>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
 Richard Zhu <hongxing.zhu@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Ryder Lee <ryder.lee@mediatek.com>, linux-mediatek@lists.infradead.org,
 Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-renesas-soc@vger.kernel.org, Tom Joseph <tjoseph@cadence.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jingoo Han <jingoohan1@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jul 21, 2020 at 08:24:55PM -0600, Rob Herring wrote:
> Here's another round PCI host bridge clean-ups. This one aims to
> reduce the amount of duplication in host probe functions by providing
> more default initialization of the pci_host_bridge. With the prior
> clean-ups, it's now possible to alloc and initialize the pci_host_bridge
> struct from DT in one step.
> 
> Patches 2 and 3 drop some pci_host_bridge init. Patches 4-11 clean-up
> handling of root bus number and bus ranges. Patches 12 and 13 are cleanups
> for Cadence driver. Patches 14 and 15 are clean-ups for rCar driver. Patch
> 16 makes missing non-prefetchable region just a warning instead of an
> error in order to work with rcar-gen2. Patch 17 converts rcar-gen2 to not
> use the arm32 specific PCI setup. Patch 18 updates how the DT resource
> parsing is done for all the controller drivers. Any other new controller
> drivers will need updating. Patch 19 moves the default IRQ mapping to
> the bridge init core code.
> 
> This is based on my previous series of clean-ups[1].
> 
> Compile tested only. Any testing would be appreciated as I don't have
> any of this h/w (well, I have a rock960c, but have not gotten PCIe to work
> on it).
> 
> Rob
> 
> [1] https://lore.kernel.org/linux-pci/20200522234832.954484-1-robh@kernel.org/
> 
> Rob Herring (19):
>   PCI: versatile: Drop flag PCI_ENABLE_PROC_DOMAINS
>   PCI: Set default bridge parent device
>   PCI: Drop unnecessary zeroing of bridge fields
>   PCI: aardvark: Use pci_is_root_bus() to check if bus is root bus
>   PCI: designware: Use pci_is_root_bus() to check if bus is root bus
>   PCI: mobiveil: Use pci_is_root_bus() to check if bus is root bus
>   PCI: xilinx-nwl: Use pci_is_root_bus() to check if bus is root bus
>   PCI: xilinx: Use pci_is_root_bus() to check if bus is root bus
>   PCI: rockchip: Use pci_is_root_bus() to check if bus is root bus
>   PCI: rcar: Use pci_is_root_bus() to check if bus is root bus
>   PCI: Move setting pci_host_bridge.busnr out of host drivers
>   PCI: cadence: Use bridge resources for outbound window setup
>   PCI: cadence: Remove private bus number and range storage
>   PCI: rcar: Use devm_pci_alloc_host_bridge()
>   PCI: rcar: Use struct pci_host_bridge.windows list directly
>   PCI: of: Reduce missing non-prefetchable memory region to a warning
>   PCI: rcar-gen2: Convert to use modern host bridge probe functions
>   PCI: Move DT resource setup into devm_pci_alloc_host_bridge()
>   PCI: Set bridge map_irq and swizzle_irq to default functions
> 
>  .../pci/controller/cadence/pcie-cadence-ep.c  |   6 +-
>  .../controller/cadence/pcie-cadence-host.c    |  65 +++----
>  drivers/pci/controller/cadence/pcie-cadence.c |   9 +-
>  drivers/pci/controller/cadence/pcie-cadence.h |   8 +-
>  drivers/pci/controller/dwc/pci-imx6.c         |   2 +-
>  drivers/pci/controller/dwc/pci-keystone.c     |   4 +-
>  .../pci/controller/dwc/pcie-designware-host.c |  28 +--
>  drivers/pci/controller/dwc/pcie-designware.h  |   2 -
>  .../controller/mobiveil/pcie-mobiveil-host.c  |  21 +--
>  .../pci/controller/mobiveil/pcie-mobiveil.h   |   1 -
>  drivers/pci/controller/pci-aardvark.c         |  25 +--
>  drivers/pci/controller/pci-ftpci100.c         |  10 --
>  drivers/pci/controller/pci-host-common.c      |  17 +-
>  drivers/pci/controller/pci-loongson.c         |   8 -
>  drivers/pci/controller/pci-mvebu.c            |   4 -
>  drivers/pci/controller/pci-rcar-gen2.c        | 162 +++++-------------
>  drivers/pci/controller/pci-tegra.c            |  10 --
>  drivers/pci/controller/pci-v3-semi.c          |  12 --
>  drivers/pci/controller/pci-versatile.c        |  13 +-
>  drivers/pci/controller/pci-xgene.c            |   9 -
>  drivers/pci/controller/pcie-altera.c          |  10 --
>  drivers/pci/controller/pcie-brcmstb.c         |   9 -
>  drivers/pci/controller/pcie-iproc-platform.c  |  10 +-
>  drivers/pci/controller/pcie-iproc.c           |   3 -
>  drivers/pci/controller/pcie-mediatek.c        |  16 --
>  drivers/pci/controller/pcie-rcar-host.c       |  73 +-------
>  drivers/pci/controller/pcie-rockchip-host.c   |  24 +--
>  drivers/pci/controller/pcie-rockchip.h        |   1 -
>  drivers/pci/controller/pcie-xilinx-nwl.c      |  20 +--
>  drivers/pci/controller/pcie-xilinx.c          |  22 +--
>  drivers/pci/of.c                              |  45 +++--
>  drivers/pci/pci.h                             |   8 +
>  drivers/pci/probe.c                           |   7 +
>  include/linux/pci.h                           |  12 --
>  34 files changed, 160 insertions(+), 516 deletions(-)

Beautiful, thanks for doing all this!

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
