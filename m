Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2008CD98CC
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jun 2026 07:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cb1adLE4OteerCSBk+VBYHwOKwVKIC0OX9Sh5Jg4D0I=; b=TRwUpjXA61fvAwluTkKA68gITZ
	RLpAgtn0cVpVHv2LYaX0MNtD8wD5s4lrZcPHevJ81//I6w0GYDjHnmE01IeIvfPdgtfrZNBfvcv+T
	BOF7DOJcuacsw60D785hM52beX2UuOb7e5CTYVxuHoOwAFB0WDbGf+fwnPpOETJfTRCokMoxV3Vth
	9UYkAp4T0GW5Reb8ufx2WR4Epjcu3abKR3hN+6kaDcyvKxRXK2B8bJc5MgSgtme0O9eqFfIE4dWrk
	yRwQ3abLQECv8C0bjvohyrD9FWWmTBeT2Wwszb5Y/YfqfKOOmewoE7YFcJTr8vzj3pVTtN9+WnRZG
	gKk7sAuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXZaO-00000008rP8-270j;
	Thu, 11 Jun 2026 07:12:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXZaN-00000008rOr-0jZs
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Jun 2026 07:12:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 70C4A600AA;
	Thu, 11 Jun 2026 07:12:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF6551F00893;
	Thu, 11 Jun 2026 07:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781161938;
	bh=cb1adLE4OteerCSBk+VBYHwOKwVKIC0OX9Sh5Jg4D0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fiFBYq3PHbybtvQ0Ie7WxptQtEeUaCk6mxPymiXzx2z3zGvV4UAnunhiFpDcL+3ds
	 8T2iILHFOT5A0QEZ7fBhoMFfMu7p5pdP443UE44k4Op87dski55918WHX+SvKCTWH3
	 q+v+nE2/qmkjWRxh8ZAVFYaYRYvkSN6mmb8gnVGLWDqHg2r4kyfa74bFTSt+dKNj3Y
	 ASPKu70fz3eU/2+djxAYm/9Yxva6fleJpBa5FfW0yLlD6mJ1CqrEpgJTmgSLDT+aeB
	 8dP2VE/RzFF39igauJHUJwvKT1wdM6ivedxpLvfNDVSie0T1A1t0C/MU4X5FUZwHHm
	 v+w9+NxVjIkpQ==
Date: Thu, 11 Jun 2026 09:12:08 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-pci@vger.kernel.org, linux-mips@vger.kernel.org, 
	naseefkm@gmail.com, ryder.lee@mediatek.com, helgaas@kernel.org, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	ansuelsmth@gmail.com, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 0/3] Add EcoNet EN7528 (and EN751221) PCIe support.
Message-ID: <qwjq6jt3akjk6m4qp4s7xpqf2kzc3tyhsrmcoqhc3canknauxh@leu5dbmv5ngl>
References: <20260521171951.1495781-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260521171951.1495781-1-cjd@cjdns.fr>
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

On Thu, May 21, 2026 at 05:19:48PM +0000, Caleb James DeLisle wrote:
> Tested on TpLink Archer VR1200V-V2 (EN751221 with Gen2 device)
> 
> Changes since v8:
> * guard(rwsem_read)(&pci_bus_sem); in mtk_pcie_retrain
> * v8: https://lore.kernel.org/linux-mips/20260520183827.908243-1-cjd@cjdns.fr
> 
> Changes from v7:
> * mtk_pcie_retrain retrain all root ports not just first
> * Include fix from Manivannan Sadhasivam, wrong usage of virt_to_phys()
> * v7: https://lore.kernel.org/linux-mips/20260514151318.3444959-1-cjd@cjdns.fr
> 
> Changes from v6:
> * s/reset/resets/ in .yaml
> * s/re-train/retrain/g
> * s/Root bridge/Root port/
> * If module not builtin, log at mtk_pcie_startup_port_en7528()
> * Do not fail if error in mtk_pcie_retrain()
> * v6: https://lore.kernel.org/linux-mips/20260513191652.3200607-1-cjd@cjdns.fr
> 
> Changes from v5:
> * s/errno-base.h/errno.h/
> * Breakout mtk_pcie_retrain() into a function
> * Use for_each_pci_bridge() to find root bridge
> * v5: https://lore.kernel.org/linux-mips/20260413140339.16238-1-cjd@cjdns.fr/
> 
> Changes from v4:
> * Fixed missing Acked-by
> * Rebased to commit 66672af7a095 ("Add linux-next specific files for 20260410")
> * v4: https://lore.kernel.org/linux-mips/20260404182854.2183651-1-cjd@cjdns.fr/
> 
> Changes from v3:
> * s/initiallized/initialized/
> * Use PCIE_T_PVPERL_MS for sleep time
> * Use PCI_PM_D3COLD_WAIT for startup wait time
> * Clarify comment "Activate INTx interrupts"
> * Add MTK_PCIE_RETRAIN quirk for devices which require link re-train
> * Do not retrain *all* bridges, only root bridge
> * Better comments and logging in retraining logic
> * v3: https://lore.kernel.org/linux-mips/20260320094212.696671-1-cjd@cjdns.fr/
> 
> Changes from v2:
> * mediatek-pcie.yaml -> s/power-domain/power-domains/ and drop example
> * Patch 3 dropped as it has been applied (Thanks!)
> * v2: https://lore.kernel.org/linux-mips/20260316155157.679533-1-cjd@cjdns.fr/
> 
> Changes from v1:
> * mediatek-pcie.yaml slot0 needs device-type = "pci", fix dt_binding_check
> Link: https://lore.kernel.org/linux-mips/177334026016.3889069.9474337544951486443.robh@kernel.org
> * v1: https://lore.kernel.org/linux-mips/20260312165332.569772-1-cjd@cjdns.fr/
> 
> This was split from a larger PCIe patchset which crossed multiple
> subsystems. I'm not labeling this a v3 because it's a new patchset, but
> I'm keeping the historical record anyway.
> 
> Changes from econet-pcie v2:
> * mediatek-pcie.yaml add missing constraints to PCI node properties
> * econet-pcie v2: https://lore.kernel.org/linux-mips/20260309131818.74467-1-cjd@cjdns.fr
> 
> Changes from econet-pcie v1:
> * pcie-mediatek.c Exclude pcie_retrain_link() when building as a module
> * econet-pcie v1: https://lore.kernel.org/linux-mips/20260303190948.694783-1-cjd@cjdns.fr/
> 
> 
> Caleb James DeLisle (2):
>   dt-bindings: PCI: mediatek: Add support for EcoNet EN7528
>   PCI: mediatek: Add support for EcoNet EN7528 SoC

Patch 3 doesn't apply cleanly. So I applied patches 1 and 2. Please rebase patch
3 on top of pci/controller/mediatek branch and resend it.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

