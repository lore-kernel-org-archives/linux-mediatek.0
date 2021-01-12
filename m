Return-Path: <SRS0=cYlk=GP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4A2EC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 21:37:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8174B2311F
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 21:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8174B2311F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:Subject:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=iPKW4pqc5uxqaGu2a82yM2H6tQELmP4F6c/UoI82RC8=; b=cm9NW+PxOIq2QeA/63g7L+Iaf
	r4C0CbN5XpEAedcD154gB2712VTV3aI2CsnRj1YmH6ZjECa5mXATUwkDT2J7Gwo1NF1Ez7b1ewbuJ
	e6YLu4wGRsFDm+Qy8004ijzyYFqakD1uhUSR1EPpBk2URKepcabVz+zVYLlXc2BXfi2mj4N+G37ko
	z1tU3Bpvb8h0aFvNQr8KW3dPTf/M7RyDVujAmbBGUviVeo2Av4Y3xuaowzv2u3A+f/LmyK9VJNgZe
	xnKeShg66K7ychWuWMFH69wFOJk4/FPbcWD8yYUa/BfCj6Gp/0FZAuY3VhiTceRKJhTD24X1QsI9z
	0Bp+tmZ3Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzRLJ-0004ES-IU; Tue, 12 Jan 2021 21:36:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzRLC-0004BT-Ee; Tue, 12 Jan 2021 21:36:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 730C723102;
 Tue, 12 Jan 2021 21:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610487396;
 bh=nkb3u9pf9yQMGIPyswxyCO0Px53gLOaH0dhJ7L6TPkM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=NcxiiEOfWj9HOVrCBrp9VtkT1NBUCvdlN+dgVvFpPWW9JEqRa347v2mhU/bYXNEPK
 FrxjuQozMo3c8tknVEpGisVTHnEMndS2YwIS4Epj9RZCPea7omsE3sp7U25k5Qaixe
 TN/51ORUcfLwlkBfQhkEcUpkJ5uaPksPjDTWTgB6TavTcEItBqbIGNvJX0mbuvZPjB
 NcJzBN1bj3HW7mRP+VRtf18x9+XAIrJ0TCxqPAV47zCiDOUOvU+xuetqxUTJnnF2vI
 bdGjoxulwev2XK5zlCDYAXoLBCnwhKOz3g2Edjka5fFl4Xwr1Ea6yjxy/Z0nwH0PB/
 8Lj70ePoqniLA==
Date: Tue, 12 Jan 2021 15:36:35 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: mingchuang.qiao@mediatek.com
Subject: Re: [PATCH] pci: avoid unsync of LTR mechanism configuration
Message-ID: <20210112213635.GA1854447@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210112072739.31624-1-mingchuang.qiao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_163638_782817_A031AEE8 
X-CRM114-Status: GOOD (  23.08  )
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
 lambert.wang@mediatek.com, linux-kernel@vger.kernel.org,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 haijun.liu@mediatek.com, bhelgaas@google.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Note subject line tips at https://lore.kernel.org/r/20171026223701.GA25649@bhelgaas-glaptop.roam.corp.google.com

On Tue, Jan 12, 2021 at 03:27:39PM +0800, mingchuang.qiao@mediatek.com wrote:
> From: Mingchuang Qiao <mingchuang.qiao@mediatek.com>
> 
> In pci bus scan flow, the LTR mechanism enable bit of DEVCTL2 register
> is configured in pci_configure_ltr(). If device and it's bridge both
> support LTR mechanism, LTR mechanism of device and it's bridge will
> be enabled in DEVCTL2 register. And the flag pci_dev->ltr_path will
> be set as 1.

s/it's/its/ twice above.
It's == It is.
Its == belonging to 'it'.
Weird, I know, but that's English for you :)

> For some pcie products, pcie link becomes down when device reset. And then
> the LTR mechanism enable bit of bridge will become 0 based on description
> in PCIE r4.0, sec 7.8.16. However, the pci_dev->ltr_path value of bridge
> is still 1. Remove and rescan flow could be triggered to recover after
> device reset. In the bus rescan flow, the LTR mechanism of device will be
> enabled in pci_configure_ltr() due to ltr_path of its bridge is still 1.

s/pcie/PCIe/ twice above.
s/PCIE/PCIe/; also reference r5.0 instead of r4.0 if possible.

This sounds like a general problem of most device config bits being
cleared by reset.  Usually these are restored by pci_restore_state().
Is that function missing a restore for PCI_EXP_DEVCTL2?  I'd rather
have a general-purpose way of restoring all the config state than
little pieces scattered all over.

> When device's LTR mechanism is enabled, device will send LTR message to
> bridge. Bridge receives the device's LTR message and found bridge's LTR
> mechanism is disabled. Then the bridge will generate unsupported request
> and other error handling flow will be triggered such as AER Non-Fatal
> error handling.
> 
> This patch is used to avoid this unsupported request and make the bridge's
> ltr_path value is aligned with DEVCTL2 register value. Check bridge
> register value if aligned with ltr_path in pci_configure_ltr(). If
> register value is disable and the ltr_path is 1, we need configure
> the register value as enable.
> 
> Signed-off-by: Mingchuang Qiao <mingchuang.qiao@mediatek.com>
> ---
>  drivers/pci/probe.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index 953f15abc850..49355cf4af54 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -2132,9 +2132,21 @@ static void pci_configure_ltr(struct pci_dev *dev)
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
> +			pcie_capability_set_word(bridge, PCI_EXP_DEVCTL2,
> +						 PCI_EXP_DEVCTL2_LTR_EN);
> +		}
> +
>  		pcie_capability_set_word(dev, PCI_EXP_DEVCTL2,
>  					 PCI_EXP_DEVCTL2_LTR_EN);
>  		dev->ltr_path = 1;
> -- 
> 2.18.0
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
