Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3AEAC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 03:07:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A59964E15
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 03:07:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A59964E15
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Dd2r+//zX0YA5iPG7LmIXnF9nD2d41q0McvQWnd4WHE=; b=ddf4AEO4TNuMbEgB+DgQs+Shb
	Q/nejFf7n1tR9EQWxuXJYncztx0ITXtetZV1TnGESY3LycSklx1drtFznCErCDr8IdmVJ/hprSyTB
	zpbxhjLIX+mtJdEW4B7iMqtJB5A8u3uekFXW60u2cLGMfBFCeA3QBNw0ityfmC1Bgf270FTMRh++n
	H6KyFlG6BGO41Wf+E0+BGsqgyuv/vcbcTfqBc05rKzYyoMo5y+w9FsM1xQQTdYEHrz307rEgV/Lg/
	vszbcXMX1KUt9tewF5igRRuR/mde76S4/ODrJKIXJjZtPrtbOLz/vXJrQygqaarNfSyNdITUHnM+4
	TaxkaWXtg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6PYS-0008LL-6M; Mon, 01 Feb 2021 03:07:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6PYN-0008Ki-97; Mon, 01 Feb 2021 03:07:06 +0000
X-UUID: 2779f736884744cfbaa8abeeab3396a7-20210131
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=4DaRnR0RDonEuYHoySDMzHFlzRHmLObfdyELeUP0L7A=; 
 b=S+hdQzQiqrfQVr9s1EszAIw9rfagaWlpNkmlESTn9a3ymUqbjfmPNgOuJ5S90D5lvDJKYPM4Tka9WewCRRxzDwlxXXblPjuOvdc453wYS+QiitXTJrzbdbtzZ2auNa8KFjm0/oFHgaRS1B9omq0QfMIaFEUJQAw5z1HVcPSZmqA=;
X-UUID: 2779f736884744cfbaa8abeeab3396a7-20210131
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mingchuang.qiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 946655426; Sun, 31 Jan 2021 19:06:57 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 31 Jan 2021 19:01:36 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 1 Feb 2021 11:01:27 +0800
Received: from [10.19.240.15] (10.19.240.15) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 1 Feb 2021 11:01:26 +0800
Message-ID: <1612148486.5980.115.camel@mcddlt001>
Subject: Re: [v2] PCI: Avoid unsync of LTR mechanism configuration
From: Mingchuang Qiao <mingchuang.qiao@mediatek.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Date: Mon, 1 Feb 2021 11:01:26 +0800
In-Reply-To: <20210128142742.GV2542@lahna.fi.intel.com>
References: <20210128100531.2694-1-mingchuang.qiao@mediatek.com>
 <20210128142742.GV2542@lahna.fi.intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: F3737F1BBDFC02D87822EE46E76318472CAB920FD28DF5C228C7598C6FB5B9F92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210131_220703_502401_0CE57711 
X-CRM114-Status: GOOD (  26.13  )
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

On Thu, 2021-01-28 at 16:27 +0200, Mika Westerberg wrote:
> Hi,
> 
> On Thu, Jan 28, 2021 at 06:05:31PM +0800, mingchuang.qiao@mediatek.com wrote:
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
> >    -before configuring device's LTR for hot-remove/hot-add
> >    -before restoring device's DEVCTL2 register when restore device state
> > 
> > Signed-off-by: Mingchuang Qiao <mingchuang.qiao@mediatek.com>
> > ---
> > changes of v2
> >  -modify patch description
> >  -reconfigure bridge's LTR before restoring device DEVCTL2 register
> > ---
> >  drivers/pci/pci.c   | 25 +++++++++++++++++++++++++
> >  drivers/pci/probe.c | 19 ++++++++++++++++---
> >  2 files changed, 41 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> > index b9fecc25d213..88b4eb70c252 100644
> > --- a/drivers/pci/pci.c
> > +++ b/drivers/pci/pci.c
> > @@ -1437,6 +1437,24 @@ static int pci_save_pcie_state(struct pci_dev *dev)
> >  	return 0;
> >  }
> >  
> > +static void pci_reconfigure_bridge_ltr(struct pci_dev *dev)
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
> > diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> > index 953f15abc850..4ad172517fd2 100644
> > --- a/drivers/pci/probe.c
> > +++ b/drivers/pci/probe.c
> > @@ -2132,9 +2132,22 @@ static void pci_configure_ltr(struct pci_dev *dev)
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
> > +		pcie_capability_read_dword(bridge, PCI_EXP_DEVCTL2, &ctl);
> > +		if (!(ctl & PCI_EXP_DEVCTL2_LTR_EN)) {
> > +			pci_dbg(bridge, "re-enabling LTR\n");
> > +			pcie_capability_set_word(bridge, PCI_EXP_DEVCTL2,
> > +						 PCI_EXP_DEVCTL2_LTR_EN);
> > +		}
> > +
> 
> Can't you use pci_reconfigure_bridge_ltr() here too?
> 
> Otherwise looks good.

Thanks for review. I have sent a new patch for this.
https://lore.kernel.org/linux-arm-kernel/20210129071137.8743-1-mingchuang.qiao@mediatek.com/ 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
