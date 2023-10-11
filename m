Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC2FACDB484
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Oct 2023 21:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=y056QQVvq8GciR/9NBZ9GPRzTQO/nxCrG1uPXZdPRpE=; b=stxsE1paAl8Bwf2FrRRpohbgzI
	ymJacb2O7Y4l5B7hoUN7i309RfnSwh/UlmPefdAUrcTSkEmUWUY8LruZgCKFPy+obNfBg2cKNzZqA
	1Ab8KMNBukguYo2FZbJBiGhJBGvoIGrL74hTXyQWeUIoRUsdqGRJlFz5yBVN1Saerts/AoljAA1m4
	6JnoaR1mUHAggDgMJICSCLiU3oDsVhFdCxR89EnRaJ83gDGILf04zsFgPSEwEqvAz5IP/Yya8gr79
	9StlLXJ1GDS454c0bPu522NrFlx4aE3kH9Q6+0P5IGObw84PcuVa6ed/kd4CUaQyinJ/PYs4ipsOU
	nS2goipw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqgem-00Gjk6-2Z;
	Wed, 11 Oct 2023 21:22:16 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqgeg-00Gjgd-2e;
	Wed, 11 Oct 2023 21:22:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 510AAB82264;
	Wed, 11 Oct 2023 21:22:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FCE2C433C8;
	Wed, 11 Oct 2023 21:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697059328;
	bh=qpNUqw05PLc7b1md/614fr1Zk6arYszd1WK9gMvl0Os=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ghyoFWHuCUoYAQQVImwLJec5By6IY8ldZU+IpgLhM86gHWNMMGsDK4I3bZN3O9HN6
	 DZ662abX5LzoV0AuEi9+5Ki6vZZQBQwOyiKdPRI4rA2aI7uLPzLKnygGYsAASzsGrz
	 QKdQ9RXXuApQ6HirgahUGTdW+uLPDMBSzhJdQjS18i+uHHpiCtlwWFOhjYSCOugggW
	 Duv0TMGaORQs/RXdvsCl/MbpQ76sczbG4Y1+Ext0ZSAafYpDZUgO9tYsFTZwJorZnI
	 X29tvX4dE26f0/NdjlsksaHY7OVFRWeD2ft2MA6pgB+n+l9lv7LOpuKtJ8H4lcIsBg
	 tvwjDEZAHbqog==
Date: Wed, 11 Oct 2023 16:22:06 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-pci@vger.kernel.org,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Lukas Wunner <lukas@wunner.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
	ath10k@lists.infradead.org, ath11k@lists.infradead.org,
	ath12k@lists.infradead.org, intel-wired-lan@lists.osuosl.org,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-rdma@vger.kernel.org, linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v2 03/13] PCI/ASPM: Disable ASPM when driver requests it
Message-ID: <20231011212206.GA1043224@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230918131103.24119-4-ilpo.jarvinen@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_142211_122002_05E1CC11 
X-CRM114-Status: GOOD (  22.63  )
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

On Mon, Sep 18, 2023 at 04:10:53PM +0300, Ilpo Järvinen wrote:
> PCI core/ASPM service driver allows controlling ASPM state through
> pci_disable_link_state() and pci_enable_link_state() API. It was
> decided earlier (see the Link below), to not allow ASPM changes when OS
> does not have control over it but only log a warning about the problem
> (commit 2add0ec14c25 ("PCI/ASPM: Warn when driver asks to disable ASPM,
> but we can't do it")). Similarly, if ASPM is not enabled through
> config, ASPM cannot be disabled.
> ...

> +#ifndef CONFIG_PCIEASPM
> +/*
> + * Always disable ASPM when requested, even when CONFIG_PCIEASPM is
> + * not build to avoid drivers adding code to do it on their own
> + * which caused issues when core does not know about the out-of-band
> + * ASPM state changes.
> + */
> +int pci_disable_link_state_locked(struct pci_dev *pdev, int state)
> +{
> +	struct pci_dev *parent = pdev->bus->self;
> +	struct pci_bus *linkbus = pdev->bus;
> +	struct pci_dev *child;
> +	u16 aspm_enabled, linkctl;
> +	int ret;
> +
> +	if (!parent)
> +		return -ENODEV;

P.S. I think this should look the same to the user (same dmesg log and
same taint, if we do that) as the CONFIG_PCIEASPM=y case.

> +	ret = pcie_capability_read_word(parent, PCI_EXP_LNKCTL, &linkctl);
> +	if (ret != PCIBIOS_SUCCESSFUL)
> +		return pcibios_err_to_errno(ret);
> +	aspm_enabled = linkctl & PCI_EXP_LNKCTL_ASPMC;
> +
> +	ret = pcie_capability_read_word(pdev, PCI_EXP_LNKCTL, &linkctl);
> +	if (ret != PCIBIOS_SUCCESSFUL)
> +		return pcibios_err_to_errno(ret);
> +	aspm_enabled |= linkctl & PCI_EXP_LNKCTL_ASPMC;
> +
> +	/* If no states need to be disabled, don't touch LNKCTL */
> +	if (state & aspm_enabled)
> +		return 0;
> +
> +	ret = pcie_capability_clear_word(parent, PCI_EXP_LNKCTL, PCI_EXP_LNKCTL_ASPMC);
> +	if (ret != PCIBIOS_SUCCESSFUL)
> +		return pcibios_err_to_errno(ret);
> +	list_for_each_entry(child, &linkbus->devices, bus_list)
> +		pcie_capability_clear_word(child, PCI_EXP_LNKCTL, PCI_EXP_LNKCTL_ASPMC);

This disables *all* ASPM states, unlike the version when
CONFIG_PCIEASPM is enabled.  I suppose there's a reason, and maybe a
comment could elaborate on it?

When CONFIG_PCIEASPM is not enabled, I don't think we actively
*disable* ASPM in the hardware; we just leave it as-is, so firmware
might have left it enabled.

> +
> +	return 0;
> +}

Conceptually it seems like the LNKCTL updates here should be the same
whether CONFIG_PCIEASPM is enabled or not (subject to the question
above).

When CONFIG_PCIEASPM is enabled, we might need to do more stuff, but
it seems like the core should be the same.

Bjorn

