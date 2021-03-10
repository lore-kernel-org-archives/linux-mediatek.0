Return-Path: <SRS0=oSKo=II=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48748C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 19:30:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9C2964EF6
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 19:30:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9C2964EF6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=KGY0XC+TLhQX9Scl9zW0mTPwWo1HmV5RZcOT3HsOuBQ=; b=nC8gKm6KC4MDLGBAeMTTcFJnw
	3WYLnNJ5brYi9hb6xnA4SOO6DTzKdX2tQGjOZsu6RqdNOmO2YlwTweTXeTBlOQQh1Ydv/jZXJVZ9E
	kABDLYSfvdejtwb9GIj8upro4mbxn3Oo3BBgUIl4KCtCKbI0T9ZNEMQui7Q6skLJcDwpQcx8aWIP7
	BsqVhxFubCECcNtMtwsHSvJIJWHhuA6xtNt6HtBoqJ3wwV8WYSyd3USCdhj+IgH38+J1WVDvH2osS
	E//ctcsF1JBy54KOUzhP8j+AKK//LrF7JfO5jcmGUDNf1hdbz5hyqWFpqzIH0i2ZvR0TccSoOZ7sI
	Gb/upC95Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lK4X8-007cEC-Og; Wed, 10 Mar 2021 19:30:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lK4Wx-007cCN-K3; Wed, 10 Mar 2021 19:30:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0FA3F64EF6;
 Wed, 10 Mar 2021 19:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615404600;
 bh=e2Z2DQoJIeiblci+Xk9crwWl1In7MRqs54LMBzkItlg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=OnEKcfxiVfKnmrYB3LuZNSCzCJ5RObqvWa5z7S7UYzXT41zckhszQZK3URD5ZROrS
 mr/AK9os9EhYoQ7PyJyRNqsjKNmTWZueZLoSXevk8tn+f21HuOQRWzC1bNzJKdX9nD
 xlDbOAIJD6HeE8dQ1olV1H+X8urrhTauCwhKyfJV7cp/WWE5k1qMKvLUm08+e568+c
 +Yu/chwpdBMmupaC0y+yM2u2jEZuFDM8RVe1Z32xuNAghxpQwKdrVXV5hygXNaa3yy
 Xxq3HE2lNWKLQJ0FBFojwrg61Orlx6meI5fCKFT2m5ULbr+j0awHh8vAGTAKVnTtuB
 brXStsZQ/nJvQ==
Date: Wed, 10 Mar 2021 13:29:58 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Thierry Reding <treding@nvidia.com>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Will Deacon <will@kernel.org>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-hyperv@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 00/13] PCI: MSI: Getting rid of msi_controller, and other
 cleanups
Message-ID: <20210310192958.GA2032926@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210225151023.3642391-1-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_193004_014161_5C3827A2 
X-CRM114-Status: GOOD (  29.24  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Feb 25, 2021 at 03:10:10PM +0000, Marc Zyngier wrote:
> The msi_controller data structure was the first attempt at treating
> MSIs like any other interrupt. We replaced it a few years ago with the
> generic MSI framework, but as it turns out, some older drivers are
> still using it.
> 
> This series aims at converting these stragglers, drop msi_controller,
> and fix some other nits such as having ways for a host bridge to
> advertise whether it supports MSIs or not.
> 
> A few notes:
> 
> - The Tegra patch is the result of back and forth work with Thierry: I
>   wrote the initial patch, which didn't work (I didn't have any HW at
>   the time). Thierry made it work, and I subsequently fixed a couple
>   of bugs/cleanups. I'm responsible for the result, so don't blame
>   Thierry for any of it! FWIW, I'm now running a Jetson TX2 with its
>   root fs over NVME, and MSIs are OK.
> 
> - RCAR is totally untested, though Marek had a go at a previous
>   version. More testing required.
> 
> - The xilinx stuff is *really* untested. Paul, if you have a RISC-V
>   board that uses it, could you please give it a go? Michal, same
>   thing for the stuff you have at hand...
> 
> - hyperv: I don't have access to such hypervisor, and no way to test
>   it. Help welcomed.
> 
> - The patches dealing with the advertising of MSI handling are the
>   result of a long discussion that took place here[1]. I took the
>   liberty to rejig Thomas' initial patches, and add what I needed for
>   the MSI domain stuff. Again, blame me if something is wrong, and not
>   Thomas.
> 
> Feedback welcome.
> 
> 	M.
> 
> [1] https://lore.kernel.org/r/20201031140330.83768-1-linux@fw-web.de
> 
> Marc Zyngier (11):
>   PCI: tegra: Convert to MSI domains
>   PCI: rcar: Convert to MSI domains
>   PCI: xilinx: Convert to MSI domains
>   PCI: hyperv: Drop msi_controller structure
>   PCI: MSI: Drop use of msi_controller from core code
>   PCI: MSI: Kill msi_controller structure
>   PCI: MSI: Kill default_teardown_msi_irqs()
>   PCI: MSI: Let PCI host bridges declare their reliance on MSI domains
>   PCI: Make pci_host_common_probe() declare its reliance on MSI domains
>   PCI: MSI: Document the various ways of ending up with NO_MSI
>   PCI: quirks: Refactor advertising of the NO_MSI flag
> 
> Thomas Gleixner (2):
>   PCI: MSI: Let PCI host bridges declare their lack of MSI handling
>   PCI: mediatek: Advertise lack of MSI handling

All looks good to me; I'm guessing Lorenzo will want to apply it or at
least take a look since the bulk of this is in the native host
drivers.

s|PCI: MSI:|PCI/MSI:| above (I use "PCI/<FEATURE>:" and "PCI: <driver>:")
s|PCI: hyperv:|PCI: hv:| to match previous practice

Maybe:

  PCI: Refactor HT advertising of NO_MSI flag

since "HT" contains more information than "quirks"?

In the 03/13 commit log, s/appaling/appalling/ :)
In the patch, it sounds like the MSI capture address change might be
separable into its own patch?  If it were separate, it would be easier
to see the problem/fix and watch for it elsewhere.

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

>  drivers/pci/controller/Kconfig           |   4 +-
>  drivers/pci/controller/pci-host-common.c |   1 +
>  drivers/pci/controller/pci-hyperv.c      |   4 -
>  drivers/pci/controller/pci-tegra.c       | 343 ++++++++++++-----------
>  drivers/pci/controller/pcie-mediatek.c   |   4 +
>  drivers/pci/controller/pcie-rcar-host.c  | 342 +++++++++++-----------
>  drivers/pci/controller/pcie-xilinx.c     | 238 +++++++---------
>  drivers/pci/msi.c                        |  46 +--
>  drivers/pci/probe.c                      |   4 +-
>  drivers/pci/quirks.c                     |  15 +-
>  include/linux/msi.h                      |  17 +-
>  include/linux/pci.h                      |   4 +-
>  12 files changed, 463 insertions(+), 559 deletions(-)
> 
> -- 
> 2.29.2
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
