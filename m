Return-Path: <SRS0=cnxW=N4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49D52C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 05:36:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0066E6044F
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 05:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0066E6044F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4oZRbKjxZjXq1pWQDdAHls1m1EyKWQrw2dRoabY0rZE=; b=dKjxcKC+wYlpy+
	8jHMTxm831Oajz5b9ABeAZNGtKs3M/3cphKhjyifRG2TzxTRUN9xe+5VCUWK09JLZJq0+lnN7N4IG
	H/8rXOuVjATUrgRWLL2zaaa7xDWxf8JhMij2AeJhSJ7aXnD17Nnf9rfEpREu2QQsOjmCmsufUEL6M
	71p02O5kXmIhyAlnbXBJ0WIxwwEesJIrQF6WH8bSoIMKHFiEG9dK2anY/KDdwvxfgd3h3Gu86vMv1
	+dysp7HS+1JcXl1xp1fVuCAlyBqfW/dgladkTygrB+YN89SL3NditxrJ4+nVikdm/ujwYuNnmKpfM
	78tJipXRSvQzOgkunTkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mN7Ix-00HJhY-KG; Mon, 06 Sep 2021 05:36:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mN7Is-00HJgi-3x; Mon, 06 Sep 2021 05:36:25 +0000
X-UUID: ace64ca79a5746dea67b843966d79bf3-20210905
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=3GVhXi/JoV/t4HxqlSqOoLTvFkr0OMh36QfzIuSd7aA=; 
 b=dtzGEUIDHI+QDbFyxHFa+/9Ip/NYLs+NAxv7lcY+lMHeP5jIt8jRRCIx4izE2GoDKHGWCjZ33yA1ShPBspuFMP1SZmOtAKSnZplm6dFt5ktuEeXvvcSsX6XYWYHEZg7o5grOR6hxezxk4zl/sMnuBdQyELzdUT5Emi9Zh7LUYWw=;
X-UUID: ace64ca79a5746dea67b843966d79bf3-20210905
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mingchuang.qiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1769267451; Sun, 05 Sep 2021 22:36:18 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 5 Sep 2021 22:36:17 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Sep 2021 13:36:15 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 mtkcas10.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Mon, 6 Sep 2021 13:36:14 +0800
Message-ID: <3a48bce6723c5588170dc0c399e7a266cb3b1817.camel@mediatek.com>
Subject: Re: [v4] PCI: Avoid unsync of LTR mechanism configuration
From: mingchuang qiao <mingchuang.qiao@mediatek.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: <kerun.zhu@mediatek.com>, <linux-pci@vger.kernel.org>,
 <lambert.wang@mediatek.com>, <rjw@rjwysocki.net>,
 <linux-kernel@vger.kernel.org>, <matthias.bgg@gmail.com>,
 <alex.williamson@redhat.com>, <linux-mediatek@lists.infradead.org>,
 <utkarsh.h.patel@intel.com>, <haijun.liu@mediatek.com>,
 <bhelgaas@google.com>, <mika.westerberg@linux.intel.com>,
 <linux-arm-kernel@lists.infradead.org>, <mingchuang.qiao@mediatek.com>
Date: Mon, 6 Sep 2021 13:36:14 +0800
In-Reply-To: <20210218165006.GA983767@bjorn-Precision-5520>
References: <20210218165006.GA983767@bjorn-Precision-5520>
X-Mailer: Evolution 3.28.1-2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210905_223623_614216_67FB4DF3 
X-CRM114-Status: GOOD (  43.09  )
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
> On Thu, Feb 04, 2021 at 05:51:25PM +0800, mingchuang.qiao@mediatek.co
> m wrote:
> > From: Mingchuang Qiao <mingchuang.qiao@mediatek.com>
> > 
> > In bus scan flow, the "LTR Mechanism Enable" bit of DEVCTL2
> > register is
> > configured in pci_configure_ltr(). If device and bridge both
> > support LTR
> > mechanism, the "LTR Mechanism Enable" bit of device and bridge will
> > be
> > enabled in DEVCTL2 register. And pci_dev->ltr_path will be set as
> > 1.
> > 
> > If PCIe link goes down when device resets, the "LTR Mechanism
> > Enable" bit
> > of bridge will change to 0 according to PCIe r5.0, sec 7.5.3.16.
> > However,
> > the pci_dev->ltr_path value of bridge is still 1.
> > 
> > For following conditions, check and re-configure "LTR Mechanism
> > Enable" bit
> > of bridge to make "LTR Mechanism Enable" bit match ltr_path value.
> >    -before configuring device's LTR for hot-remove/hot-add
> >    -before restoring device's DEVCTL2 register when restore device
> > state
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

A friendly ping.
Any further process shall I make to get this patch merged?

> > Signed-off-by: Mingchuang Qiao <mingchuang.qiao@mediatek.com>
> > ---
> > changes of v4
> >  -fix typo of commit message
> >  -rename: pci_reconfigure_bridge_ltr()-
> > >pci_bridge_reconfigure_ltr()
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
> > @@ -1437,6 +1437,24 @@ static int pci_save_pcie_state(struct
> > pci_dev *dev)
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
> > +		pcie_capability_read_dword(bridge,
> > PCI_EXP_DEVCTL2, &ctl);
> > +		if (!(ctl & PCI_EXP_DEVCTL2_LTR_EN)) {
> > +			pci_dbg(bridge, "re-enabling LTR\n");
> > +			pcie_capability_set_word(bridge,
> > PCI_EXP_DEVCTL2,
> > +						 PCI_EXP_DEVCTL2_L
> > TR_EN);
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
> [1] https://lore.kernel.org/linux-pci/20201218174011.340514-2-s.miros
> hnichenko@yadro.com/
> 
> > +		}
> > +	}
> > +#endif
> > +}
> > +
> >  static void pci_restore_pcie_state(struct pci_dev *dev)
> >  {
> >  	int i = 0;
> > @@ -1447,6 +1465,13 @@ static void pci_restore_pcie_state(struct
> > pci_dev *dev)
> >  	if (!save_state)
> >  		return;
> >  
> > +	/*
> > +	 * Downstream ports reset the LTR enable bit when link
> > goes down.
> > +	 * Check and re-configure the bit here before restoring
> > device.
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
> > @@ -111,6 +111,7 @@ void pci_free_cap_save_buffers(struct pci_dev
> > *dev);
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
> > @@ -2132,9 +2132,16 @@ static void pci_configure_ltr(struct pci_dev
> > *dev)
> >  	 * Complex and all intermediate Switches indicate support
> > for LTR.
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
