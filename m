Return-Path: <SRS0=ytEc=GY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 337ECC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jan 2021 22:32:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E862A23A5F
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jan 2021 22:32:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E862A23A5F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:Subject:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=K8J5rKR1gdeWTlyH+zedfNHqjOnq3Z68WLKlWf7WYoM=; b=ZO20GasC097cGkVQht4W+572A
	XxUkGqLxjGm+mjyGqL+2775uxjgO6D6gSupy6VxEByDHmrU1l5A/oga6+V0MwGHSonxPRqbIUUDKF
	ICwY5nAsWj6pYwgb6q33lCnytUOKa7USo6rky1duq5g1pqvk/knUjFKBTyBD/G2xetiA5hFxrjMfw
	OvcpJVcpIsat74CBz05g/Ug3EA83tJSv7gaVx7Me/JBaMMeg12xaWSNJyheTi7Hprb94rr4nlMZSw
	k478NcnrboLaw/OKqhJeG2tJyw0ML7C3nyou+j+DAoDmpOdxFLeWGZBxWQ9w6u+WQvT35TGqx4/Y/
	RW3J0sLkw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2iUX-0007aU-CN; Thu, 21 Jan 2021 22:31:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2iUS-0007Yj-FZ; Thu, 21 Jan 2021 22:31:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 248C8239EF;
 Thu, 21 Jan 2021 22:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611268301;
 bh=EEf8rabDeI15xaIquULAh8d9pPh9A++4exLQ0e/ACdM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=byN+jFdhb7bSBDjr2iwxHKQVRmnDYUmTvXjhAtxBXtU69FjhISlVnP4oNAYtj97cj
 NXzfaCIQmuADYionFEpJq0GgE//3I0lCbuaGUjhkzolNhA0DOLeb6e5ljwC/0sGnzD
 97bmLd+bNkXSsErv9j7P1uVSHhxKOaiye6hb9rGcZR2i4HWQhyHsOAA/ifLMElysbY
 ecWPlg3IDRo3xF6JZQ0069/lN7oNjDOeU7p6csPluvEcdVdAHRODGEU65IezLghgjW
 Goe6G83GUVziPEWEzHkr/KwTj7p251a8CF8jy0XhqxVkHO7n8Uq95xhxlO03QWbDcK
 7pn+rHxWhNJEA==
Date: Thu, 21 Jan 2021 16:31:39 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2] PCI: Re-enable downstream port LTR if it was
 previously enabled
Message-ID: <20210121223139.GA2698934@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210119131410.27528-1-mika.westerberg@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210121_173144_645271_15AC4A76 
X-CRM114-Status: GOOD (  26.99  )
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
Cc: linux-pci@vger.kernel.org, lambert.wang@mediatek.com,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 matthias.bgg@gmail.com, Alex Williamson <alex.williamson@redhat.com>,
 linux-mediatek@lists.infradead.org,
 Utkarsh H Patel <utkarsh.h.patel@intel.com>, haijun.liu@mediatek.com,
 Bjorn Helgaas <bhelgaas@google.com>, mingchuang.qiao@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

[+cc Alex and Mingchuang et al from
https://lore.kernel.org/r/20210112072739.31624-1-mingchuang.qiao@mediatek.com]

On Tue, Jan 19, 2021 at 04:14:10PM +0300, Mika Westerberg wrote:
> PCIe r5.0, sec 7.5.3.16 says that the downstream ports must reset the
> LTR enable bit if the link goes down (port goes DL_Down status). Now, if
> we had LTR previously enabled and the PCIe endpoint gets hot-removed and
> then hot-added back the ->ltr_path of the downstream port is still set
> but the port now does not have the LTR enable bit set anymore.
> 
> For this reason check if the bridge upstream had LTR enabled previously
> and re-enable it before enabling LTR for the endpoint.
> 
> Reported-by: Utkarsh H Patel <utkarsh.h.patel@intel.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

I think this and Mingchuang's patch, which is essentially identical,
are right and solves the problem for hot-remove/hot-add.  In that
scenario we call pci_configure_ltr() on the hot-added device, and
with this patch, we'll re-enable LTR on the bridge leading to the new
device before enabling LTR on the new device itself.

But don't we have a similar problem if we simply do a Fundamental
Reset on a device?  I think the reset path will restore the device's
state, including PCI_EXP_DEVCTL2, but it doesn't do anything with the
upstream bridge, does it?

So if a bridge and a device below it both have LTR enabled, can't we
have the following:

  - bridge LTR enabled
  - device LTR enabled
  - reset device, e.g., via Secondary Bus Reset
  - link goes down, bridge disables LTR
  - link comes back up, LTR disabled in both bridge and device
  - restore device state, including LTR enable
  - device sends LTR message
  - bridge reports Unsupported Request

> ---
> Previous version can be found here:
> 
>   https://lore.kernel.org/linux-pci/20210114134724.79511-1-mika.westerberg@linux.intel.com/
> 
> Changes from the previous version:
> 
>   * Corrected typos in the commit message
>   * No need to call pcie_downstream_port()
> 
>  drivers/pci/probe.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index 0eb68b47354f..a4a8c0305fb9 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -2153,7 +2153,7 @@ static void pci_configure_ltr(struct pci_dev *dev)
>  {
>  #ifdef CONFIG_PCIEASPM
>  	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
> -	struct pci_dev *bridge;
> +	struct pci_dev *bridge = NULL;
>  	u32 cap, ctl;
>  
>  	if (!pci_is_pcie(dev))
> @@ -2191,6 +2191,21 @@ static void pci_configure_ltr(struct pci_dev *dev)
>  	if (pci_pcie_type(dev) == PCI_EXP_TYPE_ROOT_PORT ||
>  	    ((bridge = pci_upstream_bridge(dev)) &&
>  	      bridge->ltr_path)) {
> +		/*
> +		 * Downstream ports reset the LTR enable bit when the
> +		 * link goes down (e.g on hot-remove) so re-enable the
> +		 * bit here if not set anymore.
> +		 * PCIe r5.0, sec 7.5.3.16.
> +		 */
> +		if (bridge) {
> +			pcie_capability_read_dword(bridge, PCI_EXP_DEVCTL2, &ctl);
> +			if (!(ctl & PCI_EXP_DEVCTL2_LTR_EN)) {
> +				pci_dbg(bridge, "re-enabling LTR\n");
> +				pcie_capability_set_word(bridge, PCI_EXP_DEVCTL2,
> +							 PCI_EXP_DEVCTL2_LTR_EN);
> +			}
> +		}
> +		pci_dbg(dev, "enabling LTR\n");
>  		pcie_capability_set_word(dev, PCI_EXP_DEVCTL2,
>  					 PCI_EXP_DEVCTL2_LTR_EN);
>  		dev->ltr_path = 1;
> -- 
> 2.29.2
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
