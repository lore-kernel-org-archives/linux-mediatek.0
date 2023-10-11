Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 640AECDB483
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Oct 2023 20:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=nuHtuJcat11Ph8EGYTCc19HTYl+WgluSNwJYw1DXN1A=; b=zGLtBzam2swXSp4ivhMEE1N1hE
	NWzmYPcurMV+4+RHqSdwhxUMgoMpqrTtrlc1zJtRHBb/o3gWBHVkkw0hMmq5Wbl2p+X3YkfrWymo4
	RwCDEI0Gk1oRLlJmJY2PKzu383Fi/5BTe8xD4sbduBMlC/g3StVJdTHTl8FAXanfTRAFb8WpSB2Po
	FHwEB6bRU6/FyuGiEkRdrY/PoSc1oHDTUCUIWwlQS1kOewOXdMz/PWNj/AJhTTcYKvlA+Zg2zmBCt
	1NvQ66QT5fzCnV9hwZXoQIhWnOf9o68ReZnp22rUAJbTJdqGvLZauFYR9byyIZcLqxanI1q81is3I
	/1rwQzpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqfRt-00GblU-1D;
	Wed, 11 Oct 2023 20:04:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqfRo-00Gbil-1n;
	Wed, 11 Oct 2023 20:04:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8991261717;
	Wed, 11 Oct 2023 20:04:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C058EC433C9;
	Wed, 11 Oct 2023 20:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697054685;
	bh=t2sCnofhI5I34TZiS4s4NHjldG0nyqjMLSLnRs5CtWE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=UY/5BqjjHcpXPAmr7QKoHAYWU1fIi3bcQa2ocPxFmtEy00FccPy1ytLe6GRpDBxHd
	 2cTbNjBrJTNUdToEBDxcUSzaoYeoPDjVN3gfWLc43XA1Ly1t4lFuI/f5CxLUJNNr6t
	 gf7sZzyaOhrBlFVLaM7ZGuZub0mDErySLAFUojE28e0ZtFhDBsv9WKURqpkLkqMJdQ
	 mYJ0vzxHpU7PFtLQDMIVaDLiOj3wPGRN35RqDcfBML64GW9CTvPKlZgLpcVC4DeotT
	 ihJfhl/yrCSwFwuxX+f1NRhXUb2f67KEzSWLkuULmUO1oYjBIfhhO+Sa/HYwpGklof
	 wLnqE4QtkAYOA==
Date: Wed, 11 Oct 2023 15:04:42 -0500
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
Message-ID: <20231011200442.GA1040348@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230918131103.24119-4-ilpo.jarvinen@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_130448_690604_23C4CA95 
X-CRM114-Status: GOOD (  45.63  )
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
> 
> A number of drivers have added workarounds to force ASPM off with own
> writes into the Link Control Register (some even with comments
> explaining why PCI core does not disable it under some circumstances).
> According to the comments, some drivers require ASPM to be off for
> reliable operation.
> 
> Having custom ASPM handling in drivers is problematic because the state
> kept in the ASPM service driver is not updated by the changes made
> outside the link state management API.
> 
> As the first step to address this issue, make pci_disable_link_state()
> to unconditionally disable ASPM so the motivation for drivers to come
> up with custom ASPM handling code is eliminated.
> 
> Place the minimal ASPM disable handling into own file as it is too
> complicated to fit into a header as static inline and it has almost no
> overlap with the existing, more complicated ASPM code in
> drivers/pci/pce/aspm.c.
> 
> Make pci_disable_link_state() function comment to comply kerneldoc
> formatting while changing the description.
> 
> Link: https://lore.kernel.org/all/CANUX_P3F5YhbZX3WGU-j1AGpbXb_T9Bis2ErhvKkFMtDvzatVQ@mail.gmail.com/
> Link: https://lore.kernel.org/all/20230511131441.45704-1-ilpo.jarvinen@linux.intel.com/
> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> ---
>  drivers/pci/pcie/Makefile       |  1 +
>  drivers/pci/pcie/aspm.c         | 33 ++++++++++-------
>  drivers/pci/pcie/aspm_minimal.c | 66 +++++++++++++++++++++++++++++++++
>  include/linux/pci.h             |  6 +--
>  4 files changed, 88 insertions(+), 18 deletions(-)
>  create mode 100644 drivers/pci/pcie/aspm_minimal.c
> 
> diff --git a/drivers/pci/pcie/Makefile b/drivers/pci/pcie/Makefile
> index 8de4ed5f98f1..ec7f04037b01 100644
> --- a/drivers/pci/pcie/Makefile
> +++ b/drivers/pci/pcie/Makefile
> @@ -6,6 +6,7 @@ pcieportdrv-y			:= portdrv.o rcec.o
>  
>  obj-$(CONFIG_PCIEPORTBUS)	+= pcieportdrv.o
>  
> +obj-y				+= aspm_minimal.o

Can we put this code in drivers/pci/pci.c instead of creating a new
file for it?  pci.c is kind of a dumping ground and isn't ideal
either, but we do have a few other things there that we *always* want
even though they're related to a separate Kconfig feature, e.g.,
pci_bridge_reconfigure_ltr(), pcie_clear_device_status(),
pcie_clear_root_pme_status().

>  obj-$(CONFIG_PCIEASPM)		+= aspm.o

Or maybe it would be better to just put it in aspm.c, drop this
compilation guard, and wrap the rest of the file in #ifdef
CONFIG_PCIEASPM.  Then everything would be in one file, which is a
major boon for code readers.

What do you think?

>  obj-$(CONFIG_PCIEAER)		+= aer.o err.o
>  obj-$(CONFIG_PCIEAER_INJECT)	+= aer_inject.o
> diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
> index 860bc94974ec..ec6d7a092ac1 100644
> --- a/drivers/pci/pcie/aspm.c
> +++ b/drivers/pci/pcie/aspm.c
> @@ -1042,16 +1042,23 @@ static int __pci_disable_link_state(struct pci_dev *pdev, int state, bool sem)
>  		return -EINVAL;
>  	/*
>  	 * A driver requested that ASPM be disabled on this device, but
> -	 * if we don't have permission to manage ASPM (e.g., on ACPI
> +	 * if we might not have permission to manage ASPM (e.g., on ACPI
>  	 * systems we have to observe the FADT ACPI_FADT_NO_ASPM bit and
> -	 * the _OSC method), we can't honor that request.  Windows has
> -	 * a similar mechanism using "PciASPMOptOut", which is also
> -	 * ignored in this situation.
> +	 * the _OSC method), previously we chose to not honor disable
> +	 * request in that case. Windows has a similar mechanism using
> +	 * "PciASPMOptOut", which is also ignored in this situation.
> +	 *
> +	 * Not honoring the requests to disable ASPM, however, led to
> +	 * drivers forcing ASPM off on their own. As such changes of ASPM
> +	 * state are not tracked by this service driver, the state kept here
> +	 * became out of sync.
> +	 *
> +	 * Therefore, honor ASPM disable requests even when OS does not have
> +	 * ASPM control. Plain disable for ASPM is assumed to be slightly
> +	 * safer than fully managing it.
>  	 */
> -	if (aspm_disabled) {
> -		pci_warn(pdev, "can't disable ASPM; OS doesn't have ASPM control\n");
> -		return -EPERM;
> -	}
> +	if (aspm_disabled)
> +		pci_warn(pdev, "OS doesn't have ASPM control, disabling ASPM anyway\n");

I think this is better than the previous situation, but I think we
should taint the kernel here because it's possible the firmware had a
reason for retaining ASPM control, so we might be stepping on
something.  Arguably the message is already enough of a signal, but
checking for a taint is potentially a little more automatable.

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
> +
> +	ret = pcie_capability_read_word(parent, PCI_EXP_LNKCTL, &linkctl);
> +	if (ret != PCIBIOS_SUCCESSFUL)
> +		return pcibios_err_to_errno(ret);
> +	aspm_enabled = linkctl & PCI_EXP_LNKCTL_ASPMC;

In this case, we don't care about the shift offset of the
PCI_EXP_LNKCTL_ASPMC bitfield, but if we use FIELD_GET() in most/all
other cases where we look at PCI_EXP_LNKCTL, maybe it would be worth
using it here as well?

Tangent, but I'm always dubious about the idea that e1000e is so
special that only there do we need the "_locked" variant of this
function.  No suggestion though; no need to do anything about it in
this series ;)

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
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(pci_disable_link_state_locked);

