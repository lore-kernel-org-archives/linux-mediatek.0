Return-Path: <SRS0=Ntwg=IW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E41EEC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Mar 2021 12:56:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77D1E61A0E
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Mar 2021 12:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77D1E61A0E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Subject:Cc:To:
	From:Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eYx25/KEkv4Fhy8CELcbprd6sUIDVtlE50V4azCMFuk=; b=qjUdqpQXu56B4LumKcixUnTIh
	VzaSbhnYDqTMkSKobAi2Xh3e+xRuWlyKtb/+7ySeLw9Q5oxeoBoQR/qaEuN9/tktv8Nwdi2cJzLzx
	ISvWDFvs7WES5qkUPfZQkloM7m+9ApFisOMwW2+rF0tO368orxG33GC549jwYydVU2GdVzJKMvgRR
	eV7ANQBWzQvUsfeL14l9csi26rwsLdXGESlswFL4/tQX4c6xfETFSZybA7QTtgHMZZt+O3d0OQa8Y
	Wf1L08NgnTMMW1VsBBSkWIR52slZDs5V5rw4SLTBnTTzLBdD3F1UrfPBJxcmzqs7cTpVdyx7F2Anx
	mkFfVdKFA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lP33G-00H7c6-5P; Wed, 24 Mar 2021 12:55:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lP334-00H7b2-0J; Wed, 24 Mar 2021 12:55:49 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1A9A461A06;
 Wed, 24 Mar 2021 12:55:44 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why.misterjones.org)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1lP32z-003WS0-VE; Wed, 24 Mar 2021 12:55:42 +0000
Date: Wed, 24 Mar 2021 12:55:40 +0000
Message-ID: <878s6ck8xf.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Bharat Kumar Gogada <bharatku@xilinx.com>
Cc: "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Frank Wunderlich <frank-w@public-files.de>, Thierry Reding
 <treding@nvidia.com>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring
 <robh@kernel.org>, Will Deacon <will@kernel.org>, "K. Y. Srinivasan"
 <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Stephen
 Hemminger <sthemmin@microsoft.com>,
 Michael Kelley <mikelley@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>, Michal Simek <michals@xilinx.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-hyperv@vger.kernel.org"
 <linux-hyperv@vger.kernel.org>, "linux-tegra@vger.kernel.org"
 <linux-tegra@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "kernel-team@android.com"
 <kernel-team@android.com>
Subject: Re: [PATCH v2 04/15] PCI: xilinx: Don't allocate extra memory for the
 MSI capture address
In-Reply-To: <BYAPR02MB5559D4117C9096D70C5FFE76A5639@BYAPR02MB5559.namprd02.prod.outlook.com>
References: <20210322184614.802565-1-maz@kernel.org>
 <20210322184614.802565-5-maz@kernel.org>
 <BYAPR02MB5559D4117C9096D70C5FFE76A5639@BYAPR02MB5559.namprd02.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: bharatku@xilinx.com, lorenzo.pieralisi@arm.com,
 bhelgaas@google.com, frank-w@public-files.de, treding@nvidia.com,
 tglx@linutronix.de, robh@kernel.org, will@kernel.org, kys@microsoft.com,
 haiyangz@microsoft.com, sthemmin@microsoft.com, mikelley@microsoft.com,
 wei.liu@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
 ryder.lee@mediatek.com, marek.vasut+renesas@gmail.com,
 yoshihiro.shimoda.uh@renesas.com, michals@xilinx.com, paul.walmsley@sifive.com,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210324_125546_698875_0CC37380 
X-CRM114-Status: GOOD (  26.29  )
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

On Wed, 24 Mar 2021 12:35:58 +0000,
Bharat Kumar Gogada <bharatku@xilinx.com> wrote:
> 
> Thanks Marc for the patch.
> > Subject: [PATCH v2 04/15] PCI: xilinx: Don't allocate extra memory for the
> > MSI capture address
> > 
> > A long cargo-culted behaviour of PCI drivers is to allocate memory to obtain
> > an address that is fed to the controller as the MSI capture address (i.e. the
> > MSI doorbell).
> > 
> > But there is no actual requirement for this address to be RAM.
> > All it needs to be is a suitable aligned address that will
> > *not* be DMA'd to.
> > 
> > Use the physical address of the 'port' data structure as the MSI capture
> > address.
> > 
> > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > ---
> >  drivers/pci/controller/pcie-xilinx.c | 18 ++++++------------
> >  1 file changed, 6 insertions(+), 12 deletions(-)
> 
> ...
> > -	msg.address_hi = 0;
> > -	msg.address_lo = msg_addr;
> > +	msg.address_hi = upper_32_bits(msg_addr);
> > +	msg.address_lo = lower_32_bits(msg_addr);
> 
> The XILINX_PCIE_REG_MSIBASE2 register expects 4KB aligned address.
> The lower 12-bits are always set to 0 in this register. So we need
> to mask the address while programming address to

Thanks for the heads up, I'll fix this up. Does it work correctly once
the address is aligned?

	M.

-- 
Without deviation from the norm, progress is not possible.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
