Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24348CDB481
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Oct 2023 19:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=COzAazG7xm6ZbQ01lr2YH5zu0RKGIDZJUo5a7lVFtfU=; b=XHAgsOfUhRNB49Kqr0hrFae4Q3
	Wn+Tu9E7j5iD4Th4ScE0xP86O2377uxbbu6n3TsDHOX6dhWYaOhqUPRBpt2SWxfWXT/UCDU6BIITJ
	IudRjCr46BWEwM9xgWJh7wc3z6jRWg949QmNe33GfzH7Wvs2Q73AfdUZrsH64jNjBK0IrtEttemUQ
	usdTnzv8DUwnsxJu+byHu7I0T94CIKVEVvNFmbLtTSnRbCAKjnt1oZHhFdyZsWILXprDrlthhtyv+
	VKFysuRKJW6mLw/JiRqWMeSGr0WIOBrG1zvybVb1eE6Y5LHJGuqJfFHZ2Q9g6fZb8vZ0OcuMnJwYs
	gsMz6y8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqewM-00GYLp-09;
	Wed, 11 Oct 2023 19:32:18 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqewG-00GYIr-1G;
	Wed, 11 Oct 2023 19:32:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CAD73CE2527;
	Wed, 11 Oct 2023 19:32:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9236BC433C7;
	Wed, 11 Oct 2023 19:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697052728;
	bh=4k1m5qmcSDaP+SZOYD02LNDbpXJtj+6QzJq4iZ0fBT4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=PkSkfYndzZuEdhim2WqdUnaFkJa6/ULgDeXVhLamNMtNqjpEjDLFAOpinVDtpOf9t
	 AUQ8IuXuDRsbGSvvuJcBOkesPKE+B6LOW3w499tPS1H5C+DTTGZEpqDhTJv73Rngtf
	 R8n/q+wpIprV9354P5kNeMO1/5OdiCJZC921zzltoOp4qhTV4cqy8e0kXbMRCaqp4/
	 wgSGTdLCtZ0E1cvfJh/3oqFSKgGnYoWCp1qvbc5VbvIvmnclEI+2/Ls3QSTesrpdOn
	 1i9kPgcJmtJ/9DGNbL1W+mb7/ZJBeiArthYq4x+V47gI24Zx4H0qwEfuzJhfUtgURt
	 hjOYzB4aN6mlQ==
Date: Wed, 11 Oct 2023 14:32:06 -0500
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
Subject: Re: [PATCH v2 04/13] PCI/ASPM: Move L0S/L1/sub states mask
 calculation into a helper
Message-ID: <20231011193206.GA1039708@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230918131103.24119-5-ilpo.jarvinen@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_123212_805787_CD3BB6C4 
X-CRM114-Status: GOOD (  19.89  )
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

On Mon, Sep 18, 2023 at 04:10:54PM +0300, Ilpo Järvinen wrote:
> ASPM service driver does the same L0S / L1S / sub states allowed
> calculation in __pci_disable_link_state() and
> pci_set_default_link_state().

Is there a typo or something here?  This patch only adds a call to
__pci_disable_link_state(), not to pci_set_default_link_state().

> Create a helper to calculate the mask for the allowed states.
> 
> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> ---
>  drivers/pci/pcie/aspm.c | 33 +++++++++++++++++++++------------
>  1 file changed, 21 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
> index ec6d7a092ac1..91dc95aca90f 100644
> --- a/drivers/pci/pcie/aspm.c
> +++ b/drivers/pci/pcie/aspm.c
> @@ -1034,6 +1034,26 @@ static struct pcie_link_state *pcie_aspm_get_link(struct pci_dev *pdev)
>  	return bridge->link_state;
>  }
>  
> +static u8 pci_link_state_mask(int state)
> +{
> +	u8 result = 0;
> +
> +	if (state & PCIE_LINK_STATE_L0S)
> +		result |= ASPM_STATE_L0S;
> +	if (state & PCIE_LINK_STATE_L1)
> +		result |= ASPM_STATE_L1;
> +	if (state & PCIE_LINK_STATE_L1_1)
> +		result |= ASPM_STATE_L1_1;
> +	if (state & PCIE_LINK_STATE_L1_2)
> +		result |= ASPM_STATE_L1_2;
> +	if (state & PCIE_LINK_STATE_L1_1_PCIPM)
> +		result |= ASPM_STATE_L1_1_PCIPM;
> +	if (state & PCIE_LINK_STATE_L1_2_PCIPM)
> +		result |= ASPM_STATE_L1_2_PCIPM;
> +
> +	return result;
> +}
> +
>  static int __pci_disable_link_state(struct pci_dev *pdev, int state, bool sem)
>  {
>  	struct pcie_link_state *link = pcie_aspm_get_link(pdev);
> @@ -1063,18 +1083,7 @@ static int __pci_disable_link_state(struct pci_dev *pdev, int state, bool sem)
>  	if (sem)
>  		down_read(&pci_bus_sem);
>  	mutex_lock(&aspm_lock);
> -	if (state & PCIE_LINK_STATE_L0S)
> -		link->aspm_disable |= ASPM_STATE_L0S;
> -	if (state & PCIE_LINK_STATE_L1)
> -		link->aspm_disable |= ASPM_STATE_L1;
> -	if (state & PCIE_LINK_STATE_L1_1)
> -		link->aspm_disable |= ASPM_STATE_L1_1;
> -	if (state & PCIE_LINK_STATE_L1_2)
> -		link->aspm_disable |= ASPM_STATE_L1_2;
> -	if (state & PCIE_LINK_STATE_L1_1_PCIPM)
> -		link->aspm_disable |= ASPM_STATE_L1_1_PCIPM;
> -	if (state & PCIE_LINK_STATE_L1_2_PCIPM)
> -		link->aspm_disable |= ASPM_STATE_L1_2_PCIPM;
> +	link->aspm_disable |= pci_link_state_mask(state);
>  	pcie_config_aspm_link(link, policy_to_aspm_state(link));
>  
>  	if (state & PCIE_LINK_STATE_CLKPM)
> -- 
> 2.30.2
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

