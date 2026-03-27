Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D9D10F284E
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Mar 2026 16:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=dN3Yo1tiHtQQiO563L68qVFk02sj41NJkCj8KyGm4i0=; b=GVar4cYIqOJGy2
	u4g7r9gATZCaMI0V9zCA/8CtPwj79MN7705qX7CHJz2+bHVK9MquYc1ITepcVYGClVKqRHu/bQaSO
	OsMNS2cYoMGS18OPeGdUJQjA3KfGvKL93E965bZFvWQJ1cDYW3YauMOh8yvcy6uwknPbEm+V3eN5y
	KdkzUzjzUgcnvy0LJayz6WNTs1XLamEHKfBCGBLC8JYh/WmlKYlidoiwxmpRKX/q3Kffp1GHqx3K4
	J9RVrIyBfffwwA/AZLJu2etE/GGySQscMT9Rqs0R+7Ex2zyZ0v6auJPVMT5SkJISNuwoFjZSMDRt7
	kXhpL2KlsIeTG8FMe6VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6AGs-00000007nC9-1UQ4;
	Fri, 27 Mar 2026 16:42:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6AGr-00000007nBj-0LvY;
	Fri, 27 Mar 2026 16:42:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 274DE60054;
	Fri, 27 Mar 2026 16:42:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7162C19423;
	Fri, 27 Mar 2026 16:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774629771;
	bh=1H+anKqAj6Tq4LBNW0lKVeIqT1Ggz4JI2pHYhsTtQEI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ftfgFWUiv2uIubpclBsTMgch+7bJqtUKOxfMVaaCQtoLdH8F8J1p1cp4toGBDqkXT
	 sJ831ziotFibjYpRgrSCx4HUgGpsvsLk2TrWdLSEKIv0GFInB4FCfzank/hsbzjTph
	 1QporGojGUe6IEdMqfTJsyYg2KvgX2wSANQVlM1602xbg+UTyyx3kRi1pg9TOuA8mh
	 a4wctNMVne9H+wKlG8LvuvC8GMGDl4dPO+0Z8G73IEwmHb3C2c0aTPjV5UWDVSSNeD
	 NfDAcpIJWg7aBEOfbglGtBdJBFHQA5o5jVEQDIiuhWelclc0gRawFLpRjQX42v5SDs
	 dTggbqCGp+6Ug==
Date: Fri, 27 Mar 2026 11:42:50 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: lpieralisi@kernel.org, jingoohan1@gmail.com, mani@kernel.org,
	kwilczynski@kernel.org, bhelgaas@google.com,
	florian.fainelli@broadcom.com, jim2101024@gmail.com,
	robh@kernel.org, ilpo.jarvinen@linux.intel.com,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, claudiu.beznea.uj@bp.renesas.com,
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-omap@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	shawn.lin@rock-chips.com
Subject: Re: [PATCH v9 0/5] PCI: of: Remove max-link-speed generation
 validation
Message-ID: <20260327164250.GA1513325@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313165522.123518-1-18255117159@163.com>
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

On Sat, Mar 14, 2026 at 12:55:17AM +0800, Hans Zhang wrote:
> Hi,
> 
> This series moves the validation from the common OF function to the
> individual PCIe controller drivers.  To protect against out-of-bounds
> accesses to the pcie_link_speed[] array, we first introduce a helper
> function pcie_get_link_speed() that safely returns the speed value
> (or PCI_SPEED_UNKNOWN) for a given generation number.
> 
> Then all direct uses of pcie_link_speed[] as an array are converted to
> use the new helper, ensuring that even if an invalid generation number
> reaches those code paths, no out-of-bounds access occurs.
> 
> For several drivers that read the "max-link-speed" property
> (pci-j721e, brcmstb, mediatek-gen3, rzg3s-host), we add an explicit
> validation step: if the value is missing, out of range, or unsupported
> by the hardware, a safe default is used (usually Gen2). Other drivers
> (mainly DesignWare glue drivers) rely on the helper to safely handle
> invalid values, but do not yet include fallback logic or warnings.
> 
> Finally, the range check is removed from of_pci_get_max_link_speed(),
> so that future PCIe generations can be supported without modifying
> drivers/pci/of.c.

Thanks for this series.

We still have a couple references to pcie_link_speed[] that bypass
pcie_get_link_speed().  These are safe because PCI_EXP_LNKSTA_CLS is
0xf and pcie_link_speed[] is size 16, but I'm not sure the direct
reference is necessary.

The array itself is exported, which I suppose we needed for modular
PCI controller drivers, but we probably don't need it now that
pcie_get_link_speed() is exported?

  $ git grep "\<pcie_link_speed\>"
  drivers/pci/pci-sysfs.c:        speed = pcie_link_speed[linkstat & PCI_EXP_LNKSTA_CLS];
  drivers/pci/pci.c:      return pcie_link_speed[FIELD_GET(PCI_EXP_LNKSTA_CLS, lnksta)];
  drivers/pci/pci.h:extern const unsigned char pcie_link_speed[];
  drivers/pci/pci.h:      bus->cur_bus_speed = pcie_link_speed[linksta & PCI_EXP_LNKSTA_CLS];
  drivers/pci/probe.c:const unsigned char pcie_link_speed[] = {
  drivers/pci/probe.c:EXPORT_SYMBOL_GPL(pcie_link_speed);
  drivers/pci/probe.c:    if (speed >= ARRAY_SIZE(pcie_link_speed))
  drivers/pci/probe.c:    return pcie_link_speed[speed];
  drivers/pci/probe.c:            bus->max_bus_speed = pcie_link_speed[linkcap & PCI_EXP_LNKCAP_SLS];


