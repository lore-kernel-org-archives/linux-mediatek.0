Return-Path: <SRS0=pLce=IU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D13C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 00:51:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6EC061943
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 00:51:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6EC061943
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OqoyGqOuv6pXPCFshGq4QBbLKsiMsUR4UsznKXty0s8=; b=hsbh9kOrF/Py1V6X/Ghf5iPRv
	TmOOXbIRZbBxqZ27821aWuQJbgqqnSierQDBMjCjSNLwdKFsXF1RK0z8GImnZipKIOdeGDo1JHNHq
	nIOI+aQBRfBPxR/FwdcfjvN1wR5z/JcWxmKy7xf6bdXmWWk+rG7nP6EneHDE+9+66Oy2qAjbuiFMo
	+ABWJBut/WOoHWyG3ZnQ0kr3iotHe54Z/dRNBckwxP7yFqCdmQFXH2QT5gZohL81baSHoTfxBIBiM
	PGJ3pbo/kAQ5NmHOYtwVedehHGAHIgKtrWiHjJJIf/n0My2Ep8cuLKaBje9bTIJ9o+sc1Ia8PpwXR
	oXhkh1qrA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lO8n6-00Ad5p-IH; Mon, 22 Mar 2021 00:51:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lO8mz-00Ad5A-53; Mon, 22 Mar 2021 00:51:29 +0000
X-UUID: 30cd6078b4fd412a92c45c2cc122178e-20210321
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=4muBauSKgTiIkIQlLDPNxdeaf5zMlZsluIcD8f82raQ=; 
 b=X5ZbYhC8AgEg0KaMGOZjUz4Sos9WMhiursDV2JiHaIdpO+XThE19ETjhaDR2a7yttPkEO34ACanpp5QRmU6L5dQlXlapYsjbDZ1c1+Ms+M9pfe69MQxxlvjUS41ygf9UfMqSrvI1KZI58mvyKDbB9hKf6jiuJtA1YjilhOdOefk=;
X-UUID: 30cd6078b4fd412a92c45c2cc122178e-20210321
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mingchuang.qiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1479893167; Sun, 21 Mar 2021 16:51:17 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 21 Mar 2021 17:41:15 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 22 Mar 2021 08:41:12 +0800
Received: from [10.19.240.15] (10.19.240.15) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 22 Mar 2021 08:41:11 +0800
Message-ID: <1616373671.22219.3.camel@mcddlt001>
Subject: Re: [v4] PCI: Avoid unsync of LTR mechanism configuration
From: Mingchuang Qiao <mingchuang.qiao@mediatek.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: <kerun.zhu@mediatek.com>, <linux-pci@vger.kernel.org>,
 <lambert.wang@mediatek.com>, <rjw@rjwysocki.net>,
 <linux-kernel@vger.kernel.org>, <matthias.bgg@gmail.com>,
 <alex.williamson@redhat.com>, <linux-mediatek@lists.infradead.org>,
 <utkarsh.h.patel@intel.com>, <haijun.liu@mediatek.com>,
 <bhelgaas@google.com>, <mika.westerberg@linux.intel.com>,
 <linux-arm-kernel@lists.infradead.org>
Date: Mon, 22 Mar 2021 08:41:11 +0800
In-Reply-To: <20210218165006.GA983767@bjorn-Precision-5520>
References: <20210218165006.GA983767@bjorn-Precision-5520>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3581AC8A30CDC12967E2AF4ECF1C21D87B06653223B20DC321DC8AFBF22EBF582000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_005125_715190_C413F807 
X-CRM114-Status: GOOD (  43.39  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Bjorn,

On Thu, 2021-02-18 at 10:50 -0600, Bjorn Helgaas wrote:
> On Thu, Feb 04, 2021 at 05:51:25PM +0800, mingchuang.qiao@mediatek.com wrote:
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
> > of bridge to make "LTR Mechanism Enable" bit match ltr_path value.
> >    -before configuring device's LTR for hot-remove/hot-add
> >    -before restoring device's DEVCTL2 register when restore device state
> 
> There's definitely a bug here.  The commit log should say a little
> more about what it is.  I *think* if LTR is enabled and we suspend
> (putting the device in D3cold) and resume, LTR probably doesn't work
> after resume because LTR is disabled in the upstream bridge, which
> would be an obvious bug.
> 
> Also, if a device with LTR enabled is hot-removed, and we hot-add a
> device, I think LTR will not work on the new device.  Possibly also a
> bug, although I'm not convinced we know how to configure LTR on the
> new device anyway.
> 
> So I'd *like* to merge the bug fix for v5.12, but I think I'll wait
> because of the issue below.
> 

Thanks for review.
Any further process shall I make to get this patch merged?

> > Signed-off-by: Mingchuang Qiao <mingchuang.qiao@mediatek.com>
> > ---
> > changes of v4
> >  -fix typo of commit message
> >  -rename: pci_reconfigure_bridge_ltr()->pci_bridge_reconfigure_ltr()
> > changes of v3
> >  -call pci_reconfigure_bridge_ltr() in probe.c
> > changes of v2
> >  -modify patch description
> >  -reconfigure bridge's LTR before restoring device DEVCTL2 register
> > ---
> >  drivers/pci/pci.c   | 25 +++++++++++++++++++++++++
> >  drivers/pci/pci.h   |  1 +
> >  drivers/pci/probe.c | 13 ++++++++++---
> >  3 files changed, 36 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> > index b9fecc25d213..6bf65d295331 100644
> > --- a/drivers/pci/pci.c
> > +++ b/drivers/pci/pci.c
> > @@ -1437,6 +1437,24 @@ static int pci_save_pcie_state(struct pci_dev *dev)
> >  	return 0;
> >  }
> >  
> > +void pci_bridge_reconfigure_ltr(struct pci_dev *dev)
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
> 
> This pattern of updating the upstream bridge on behalf of "dev" is
> problematic because it's racy:
> 
>   CPU 1                     CPU 2
>   -------------------       ---------------------
>   ctl = read DEVCTL2        ctl = read(DEVCTL2)
>   ctl |= DEVCTL2_LTR_EN     ctl |= DEVCTL2_ARI
>   write(DEVCTL2, ctl)
>                             write(DEVCTL2, ctl)
> 
> Now the bridge has ARI set, but not LTR_EN.
> 
> We have the same problem in the pci_enable_device() path.  The most
> recent try at fixing it is [1].
> 
> [1] https://lore.kernel.org/linux-pci/20201218174011.340514-2-s.miroshnichenko@yadro.com/
> 
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
> > +	pci_bridge_reconfigure_ltr(dev);
> > +
> >  	cap = (u16 *)&save_state->cap.data[0];
> >  	pcie_capability_write_word(dev, PCI_EXP_DEVCTL, cap[i++]);
> >  	pcie_capability_write_word(dev, PCI_EXP_LNKCTL, cap[i++]);
> > diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> > index 5c59365092fa..b3a5e5287cb7 100644
> > --- a/drivers/pci/pci.h
> > +++ b/drivers/pci/pci.h
> > @@ -111,6 +111,7 @@ void pci_free_cap_save_buffers(struct pci_dev *dev);
> >  bool pci_bridge_d3_possible(struct pci_dev *dev);
> >  void pci_bridge_d3_update(struct pci_dev *dev);
> >  void pci_bridge_wait_for_secondary_bus(struct pci_dev *dev);
> > +void pci_bridge_reconfigure_ltr(struct pci_dev *dev);
> >  
> >  static inline void pci_wakeup_event(struct pci_dev *dev)
> >  {
> > diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> > index 953f15abc850..ade055e9fb58 100644
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
> > +		pci_bridge_reconfigure_ltr(dev);
> >  		pcie_capability_set_word(dev, PCI_EXP_DEVCTL2,
> >  					 PCI_EXP_DEVCTL2_LTR_EN);
> >  		dev->ltr_path = 1;
> > -- 
> > 2.18.0
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
