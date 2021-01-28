Return-Path: <SRS0=CkUm=G7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA0E7C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 14:28:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A6B864DD9
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 14:28:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A6B864DD9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4NyTbX2tgIALUsIIk6Z1WxbnhOJMFmuQ78+I8SvYcQ4=; b=2UWHWZKwjS8RCtclWIFnvKY7E
	uwI/8HIk1lMAZ+gLUjIxeuHCo2NEYMT6BFi9k/hsRe8qQs6cvIWHcL830W6j0j5SfFV51PDYBMpAs
	kNFeJ4DpWA7Y92lidcQRDlfCuhA+e3U380K1ICebJwA8edfgHyBnl7NrpH6jFipkmA5UKU4gUyNbE
	c6LZNjgRPHaZdTYRNo3dqeegiVQxXbQ1UOIrgapGu8SYU9+QXr64Fss0X2AXWg98fNhdqDwJQTqy/
	XWPOYF1IXGLTJaVWfngKvEDSJNouI8m7uij8f1mxkaMecgQhXCdhfhIZ2zYJ7WZVOTltHPQ6xPWU/
	gBSEJKGeA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l58HC-0006TA-NS; Thu, 28 Jan 2021 14:28:02 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l58H7-0006Qp-BK; Thu, 28 Jan 2021 14:27:58 +0000
IronPort-SDR: qi9AgKA8Wlx4ocgeRCoHXC9U4HvDOccEJcb4t3gx6Td9OJuF+Whov7nSeq8tEi0HFB1qSn2ztY
 GxJJl+dEhRpQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9877"; a="180317647"
X-IronPort-AV: E=Sophos;i="5.79,382,1602572400"; d="scan'208";a="180317647"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2021 06:27:48 -0800
IronPort-SDR: +PFPIvlRjek6MWrX9uP9iaFFhGEDkOin/OloFocOFfpB2UombOfcu9lElfPgCPSR9ahsCgLNZN
 pBm+PFjtZHqw==
X-IronPort-AV: E=Sophos;i="5.79,382,1602572400"; d="scan'208";a="363775047"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2021 06:27:44 -0800
Received: by lahna (sSMTP sendmail emulation); Thu, 28 Jan 2021 16:27:42 +0200
Date: Thu, 28 Jan 2021 16:27:42 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: mingchuang.qiao@mediatek.com
Subject: Re: [v2] PCI: Avoid unsync of LTR mechanism configuration
Message-ID: <20210128142742.GV2542@lahna.fi.intel.com>
References: <20210128100531.2694-1-mingchuang.qiao@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210128100531.2694-1-mingchuang.qiao@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_092757_598072_AA6C6319 
X-CRM114-Status: GOOD (  21.25  )
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
Cc: kerun.zhu@mediatek.com, linux-pci@vger.kernel.org,
 lambert.wang@mediatek.com, rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
 matthias.bgg@gmail.com, alex.williamson@redhat.com,
 linux-mediatek@lists.infradead.org, utkarsh.h.patel@intel.com,
 haijun.liu@mediatek.com, bhelgaas@google.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Thu, Jan 28, 2021 at 06:05:31PM +0800, mingchuang.qiao@mediatek.com wrote:
> From: Mingchuang Qiao <mingchuang.qiao@mediatek.com>
> 
> In bus scan flow, the "LTR Mechanism Enable" bit of DEVCTL2 register is
> configured in pci_configure_ltr(). If device and bridge both support LTR
> mechanism, the "LTR Mechanism Enable" bit of device and bridge will be
> enabled in DEVCTL2 register. And pci_dev->ltr_path will be set as 1.
> 
> If PCIe link goes down when device resets, the "LTR Mechanism Enable" bit
> of bridge will change to 0 according to PCIe r5.0, sec 7.5.3.16. However,
> the pci_dev->ltr_path value of bridge is still 1.
> 
> For following conditions, check and re-configure "LTR Mechanism Enable" bit
> of bridge to make "LTR Mechanism Enable" bit mtach ltr_path value.
>    -before configuring device's LTR for hot-remove/hot-add
>    -before restoring device's DEVCTL2 register when restore device state
> 
> Signed-off-by: Mingchuang Qiao <mingchuang.qiao@mediatek.com>
> ---
> changes of v2
>  -modify patch description
>  -reconfigure bridge's LTR before restoring device DEVCTL2 register
> ---
>  drivers/pci/pci.c   | 25 +++++++++++++++++++++++++
>  drivers/pci/probe.c | 19 ++++++++++++++++---
>  2 files changed, 41 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index b9fecc25d213..88b4eb70c252 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -1437,6 +1437,24 @@ static int pci_save_pcie_state(struct pci_dev *dev)
>  	return 0;
>  }
>  
> +static void pci_reconfigure_bridge_ltr(struct pci_dev *dev)
> +{
> +#ifdef CONFIG_PCIEASPM
> +	struct pci_dev *bridge;
> +	u32 ctl;
> +
> +	bridge = pci_upstream_bridge(dev);
> +	if (bridge && bridge->ltr_path) {
> +		pcie_capability_read_dword(bridge, PCI_EXP_DEVCTL2, &ctl);
> +		if (!(ctl & PCI_EXP_DEVCTL2_LTR_EN)) {
> +			pci_dbg(bridge, "re-enabling LTR\n");
> +			pcie_capability_set_word(bridge, PCI_EXP_DEVCTL2,
> +						 PCI_EXP_DEVCTL2_LTR_EN);
> +		}
> +	}
> +#endif
> +}
> +
>  static void pci_restore_pcie_state(struct pci_dev *dev)
>  {
>  	int i = 0;
> @@ -1447,6 +1465,13 @@ static void pci_restore_pcie_state(struct pci_dev *dev)
>  	if (!save_state)
>  		return;
>  
> +	/*
> +	 * Downstream ports reset the LTR enable bit when link goes down.
> +	 * Check and re-configure the bit here before restoring device.
> +	 * PCIe r5.0, sec 7.5.3.16.
> +	 */
> +	pci_reconfigure_bridge_ltr(dev);
> +
>  	cap = (u16 *)&save_state->cap.data[0];
>  	pcie_capability_write_word(dev, PCI_EXP_DEVCTL, cap[i++]);
>  	pcie_capability_write_word(dev, PCI_EXP_LNKCTL, cap[i++]);
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index 953f15abc850..4ad172517fd2 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -2132,9 +2132,22 @@ static void pci_configure_ltr(struct pci_dev *dev)
>  	 * Complex and all intermediate Switches indicate support for LTR.
>  	 * PCIe r4.0, sec 6.18.
>  	 */
> -	if (pci_pcie_type(dev) == PCI_EXP_TYPE_ROOT_PORT ||
> -	    ((bridge = pci_upstream_bridge(dev)) &&
> -	      bridge->ltr_path)) {
> +	if (pci_pcie_type(dev) == PCI_EXP_TYPE_ROOT_PORT) {
> +		pcie_capability_set_word(dev, PCI_EXP_DEVCTL2,
> +					 PCI_EXP_DEVCTL2_LTR_EN);
> +		dev->ltr_path = 1;
> +		return;
> +	}
> +
> +	bridge = pci_upstream_bridge(dev);
> +	if (bridge && bridge->ltr_path) {
> +		pcie_capability_read_dword(bridge, PCI_EXP_DEVCTL2, &ctl);
> +		if (!(ctl & PCI_EXP_DEVCTL2_LTR_EN)) {
> +			pci_dbg(bridge, "re-enabling LTR\n");
> +			pcie_capability_set_word(bridge, PCI_EXP_DEVCTL2,
> +						 PCI_EXP_DEVCTL2_LTR_EN);
> +		}
> +

Can't you use pci_reconfigure_bridge_ltr() here too?

Otherwise looks good.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
