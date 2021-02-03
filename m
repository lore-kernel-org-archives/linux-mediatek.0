Return-Path: <SRS0=J04E=HF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A99C5C433E9
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 02:14:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28B9864F7E
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 02:14:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28B9864F7E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qaQkZfW5Gh83lie7G4iZloBvOfr55Cna1JkgEqYkPME=; b=LFplcfV4yMuLWqZGON8XvxErh
	5J129l+U61K+DnCgAj0iR8qdNcP2XWx1/+EhzmsWWWADgEKyAxqueIUiukl+V+vA0fyfrblvdZxLH
	n/lduYObxUUUo/DEQLD0MLvun9y6lFXT5+vZIKv8KzsqMrvXc526NTA6NBn1RMIr974jWoYjCTJO+
	N00+R++ub0J9uzLFPhQOIjZIMsUAO7d2NscRec0HlU+1z+IJv7C3bdgFoyO1oimPP3RFgriX3fXKP
	hsm1dczRApealMbXvWtMcIQ77xWdNKHknabfn+151/IjB8LYhRyYQ4mMxAE+W3GG7nKXaF+lbbiOh
	whBEESeQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l77gZ-0003wk-2K; Wed, 03 Feb 2021 02:14:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l77gV-0003w5-G0; Wed, 03 Feb 2021 02:14:25 +0000
X-UUID: 5f5a90040581450cb55031e33e39d9d5-20210202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=qcupwzAFEh+APVu6uj0OTOjq7j3sY9giePPVcQ3oRe4=; 
 b=cQ13ghAEPhEiHasWmWZ6HqVLbj4P8N8nqaqkv8iU6unUsiE/CA3ECGJywvaivMQl4KhOJxZIEXINx7T7Be1IAJk5g+tPvUfyP2q9LglPIEMIiQ15XD6mfLOAlIPQ1YbIxKTU+2PMq1gvMuasXcpjM0od17Y0S531SZafgxxLhVE=;
X-UUID: 5f5a90040581450cb55031e33e39d9d5-20210202
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <mingchuang.qiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1692218744; Tue, 02 Feb 2021 18:14:13 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Feb 2021 18:14:05 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 3 Feb 2021 10:14:02 +0800
Received: from [10.19.240.15] (10.19.240.15) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 3 Feb 2021 10:14:01 +0800
Message-ID: <1612318441.5980.142.camel@mcddlt001>
Subject: Re: [v3] PCI: Avoid unsync of LTR mechanism configuration
From: Mingchuang Qiao <mingchuang.qiao@mediatek.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Date: Wed, 3 Feb 2021 10:14:01 +0800
In-Reply-To: <20210201113217.GL2542@lahna.fi.intel.com>
References: <20210129071137.8743-1-mingchuang.qiao@mediatek.com>
 <20210201113217.GL2542@lahna.fi.intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: BD886473CF1087390027C2AE76042FAC1D87D9F19E38A3BC9E3AFD7AA807C52E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_211423_904886_8AF27CD0 
X-CRM114-Status: GOOD (  30.50  )
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

On Mon, 2021-02-01 at 13:32 +0200, Mika Westerberg wrote:
> Hi,
> 
> On Fri, Jan 29, 2021 at 03:11:37PM +0800, mingchuang.qiao@mediatek.com wrote:
> > From: Mingchuang Qiao <mingchuang.qiao@mediatek.com>
> > 
> > In bus scan flow, the "LTR Mechanism Enable" bit of DEVCTL2 register is
> > configured in pci_configure_ltr(). If device and bridge both support LTR
> > mechanism, the "LTR Mechanism Enable" bit of device and bridge will be
> > enabled in DEVCTL2 register. And pci_dev->ltr_path will be set as 1.
> > 
> > If PCIe link goes down when device resets, the "LTR Mechanism Enable" bit
> > of bridge will change to 0 according to PCIe r5.0, sec 7.5.3.16. However,
> > the pci_dev->ltr_path value of bridge is still 1.
> > 
> > For following conditions, check and re-configure "LTR Mechanism Enable" bit
> > of bridge to make "LTR Mechanism Enable" bit mtach ltr_path value.
> 
> Typo mtach -> match.
> 
> >    -before configuring device's LTR for hot-remove/hot-add
> >    -before restoring device's DEVCTL2 register when restore device state
> > 
> > Signed-off-by: Mingchuang Qiao <mingchuang.qiao@mediatek.com>
> > ---
> > changes of v2
> >  -modify patch description
> >  -reconfigure bridge's LTR before restoring device DEVCTL2 register
> > changes of v3
> >  -call pci_reconfigure_bridge_ltr() in probe.c
> 
> Hmm, which part of this patch takes care of the reset path? It is not
> entirely clear to me at least.
> 

When device resets and link goes down, there seems to have two methods
to recover for software. 
   -One is that trigger device removal and rescan.
   -The other is that restore device with pci_restore_state() after link
comes back up.
For above both scenarios, we need check and reconfigure "LTR Mechanism
Enable" bit of bridge. It's also this patch intends to do.
   -For the rescan scenario, it's done in pci_configure_ltr().
   -For the restore scenario, it's done in pci_restore_pcie_state().

> > ---
> >  drivers/pci/pci.c   | 25 +++++++++++++++++++++++++
> >  drivers/pci/pci.h   |  1 +
> >  drivers/pci/probe.c | 13 ++++++++++---
> >  3 files changed, 36 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> > index b9fecc25d213..12b557c8f062 100644
> > --- a/drivers/pci/pci.c
> > +++ b/drivers/pci/pci.c
> > @@ -1437,6 +1437,24 @@ static int pci_save_pcie_state(struct pci_dev *dev)
> >  	return 0;
> >  }
> >  
> > +void pci_reconfigure_bridge_ltr(struct pci_dev *dev)
> > +{
> > +#ifdef CONFIG_PCIEASPM
> > +	struct pci_dev *bridge;
> > +	u32 ctl;
> > +
> > +	bridge = pci_upstream_bridge(dev);
> > +	if (bridge && bridge->ltr_path) {
> > +		pcie_capability_read_dword(bridge, PCI_EXP_DEVCTL2, &ctl);
> > +		if (!(ctl & PCI_EXP_DEVCTL2_LTR_EN)) {
> > +			pci_dbg(bridge, "re-enabling LTR\n");
> > +			pcie_capability_set_word(bridge, PCI_EXP_DEVCTL2,
> > +						 PCI_EXP_DEVCTL2_LTR_EN);
> > +		}
> > +	}
> > +#endif
> > +}
> > +
> >  static void pci_restore_pcie_state(struct pci_dev *dev)
> >  {
> >  	int i = 0;
> > @@ -1447,6 +1465,13 @@ static void pci_restore_pcie_state(struct pci_dev *dev)
> >  	if (!save_state)
> >  		return;
> >  
> > +	/*
> > +	 * Downstream ports reset the LTR enable bit when link goes down.
> > +	 * Check and re-configure the bit here before restoring device.
> > +	 * PCIe r5.0, sec 7.5.3.16.
> > +	 */
> > +	pci_reconfigure_bridge_ltr(dev);
> > +
> >  	cap = (u16 *)&save_state->cap.data[0];
> >  	pcie_capability_write_word(dev, PCI_EXP_DEVCTL, cap[i++]);
> >  	pcie_capability_write_word(dev, PCI_EXP_LNKCTL, cap[i++]);
> > diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> > index 5c59365092fa..a660a01358c5 100644
> > --- a/drivers/pci/pci.h
> > +++ b/drivers/pci/pci.h
> > @@ -111,6 +111,7 @@ void pci_free_cap_save_buffers(struct pci_dev *dev);
> >  bool pci_bridge_d3_possible(struct pci_dev *dev);
> >  void pci_bridge_d3_update(struct pci_dev *dev);
> >  void pci_bridge_wait_for_secondary_bus(struct pci_dev *dev);
> > +void pci_reconfigure_bridge_ltr(struct pci_dev *dev);
> 
> Nit: calling it pci_bridge_reconfigure_ltr() would match better with the
> other function names.
> 

Thanks for the suggestion. I will update the name in next patch :)

> >  
> >  static inline void pci_wakeup_event(struct pci_dev *dev)
> >  {
> > diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> > index 953f15abc850..fa6075093f3b 100644
> > --- a/drivers/pci/probe.c
> > +++ b/drivers/pci/probe.c
> > @@ -2132,9 +2132,16 @@ static void pci_configure_ltr(struct pci_dev *dev)
> >  	 * Complex and all intermediate Switches indicate support for LTR.
> >  	 * PCIe r4.0, sec 6.18.
> >  	 */
> > -	if (pci_pcie_type(dev) == PCI_EXP_TYPE_ROOT_PORT ||
> > -	    ((bridge = pci_upstream_bridge(dev)) &&
> > -	      bridge->ltr_path)) {
> > +	if (pci_pcie_type(dev) == PCI_EXP_TYPE_ROOT_PORT) {
> > +		pcie_capability_set_word(dev, PCI_EXP_DEVCTL2,
> > +					 PCI_EXP_DEVCTL2_LTR_EN);
> > +		dev->ltr_path = 1;
> > +		return;
> > +	}
> > +
> > +	bridge = pci_upstream_bridge(dev);
> > +	if (bridge && bridge->ltr_path) {
> > +		pci_reconfigure_bridge_ltr(dev);
> >  		pcie_capability_set_word(dev, PCI_EXP_DEVCTL2,
> >  					 PCI_EXP_DEVCTL2_LTR_EN);
> >  		dev->ltr_path = 1;
> > -- 
> > 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
