Return-Path: <SRS0=GRN7=PA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B48C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Oct 2021 08:03:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6954360F21
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Oct 2021 08:03:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6954360F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SoIqGPFdN+f+I43/Qx4DzPJ6Oakt8UbFYNydzYDwFWo=; b=pEiYXv9fG15DTL
	+h2tixhVQu5MHSvTisux+9vQE5IDtOEc6HQp9AyIOI3gt9FpNBo3qPNVFwiTFGvO4uUV/8isFoxjz
	jfQ1VsuRvsqvHgQWwVMDgLSuVz0seWsfP3CJzDqCs6/riNic+zzxhE9o4YYVB0vfqRc2m+RIDSkRs
	Bcedy2il7XfTjI84GNmKJuVU7Mj+Xix2OnwVcx2To0fP1cgx7hJZh5A/8sIqLetRB5+rM590JdaX1
	eaM6PFVKBawRdo1VbjLFSr4kVfcurLHiVf4Ccsawn0wAqv0yGIh4Ra2Vp92nT/+EF8ZA2nB2nYylD
	kmDpDFWvimaMDJGFaodQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maCkr-00Btzp-26; Tue, 12 Oct 2021 08:03:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maCjk-00BtWb-Ce; Tue, 12 Oct 2021 08:02:17 +0000
X-UUID: b32e6c3bc79440f2aa13d946c7f1a1f8-20211012
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=1fxw5Wy/1Cn8f9MKoHraZrSRl2YubPfQhjOnX9wMbxI=; 
 b=S5+i5vl1R9gN40H9TrFEazmuhLG26YK2sxWQ+vzGpK/7mBOtrCBV6sIOjJXbtwC0xFv4R1kltrIbrBT4sZ+EYSviIYCXn1R4CrDpIkOQzU5qfqiTKpkMmRiG0guDzw66v9X2lFTo1DfPmPT5MztIrAX1nSty3Z5VHhPtSDAMTt4=;
X-UUID: b32e6c3bc79440f2aa13d946c7f1a1f8-20211012
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mingchuang.qiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 393182928; Tue, 12 Oct 2021 01:02:07 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Oct 2021 01:01:16 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Oct 2021 16:01:15 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 12 Oct 2021 16:01:14 +0800
Message-ID: <14ca08ba9fe6fed0d19b1887484e39bdadad5837.camel@mediatek.com>
Subject: Re: [v4] PCI: Avoid unsync of LTR mechanism configuration
From: Mingchuang Qiao <mingchuang.qiao@mediatek.com>
To: Rajat Jain <rajatja@google.com>
CC: Bjorn Helgaas <helgaas@kernel.org>, <kerun.zhu@mediatek.com>,
 <linux-pci@vger.kernel.org>, <lambert.wang@mediatek.com>,
 <rjw@rjwysocki.net>, <linux-kernel@vger.kernel.org>,
 <matthias.bgg@gmail.com>, <alex.williamson@redhat.com>,
 <linux-mediatek@lists.infradead.org>, <utkarsh.h.patel@intel.com>,
 <haijun.liu@mediatek.com>, <bhelgaas@google.com>,
 <mika.westerberg@linux.intel.com>, <linux-arm-kernel@lists.infradead.org>
Date: Tue, 12 Oct 2021 16:01:13 +0800
In-Reply-To: <CACK8Z6Fto=Shxm4A2J8=zzukt0gNgiwWJ53WRPQtix6HsWE6ng@mail.gmail.com>
References: <20210930194853.GA903868@bhelgaas>
 <3a96ce7e536ff1645b263b193f3742f2c713c467.camel@mediatek.com>
 <CACK8Z6Fto=Shxm4A2J8=zzukt0gNgiwWJ53WRPQtix6HsWE6ng@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_010212_543945_E8431B97 
X-CRM114-Status: GOOD (  71.10  )
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

Hi,

On Mon, 2021-10-11 at 19:48 -0700, Rajat Jain wrote:
> Hello,
> 
> 
> On Thu, Oct 7, 2021 at 11:30 PM mingchuang qiao
> <mingchuang.qiao@mediatek.com> wrote:
> > 
> > Hi Bjorn,
> > 
> > Much appreciate the comments. See below for my response.
> > 
> > On Thu, 2021-09-30 at 14:48 -0500, Bjorn Helgaas wrote:
> > > On Thu, Sep 30, 2021 at 03:02:24PM +0800, mingchuang qiao wrote:
> > > > Hi Bjorn,
> > > > 
> > > > A friendly ping.
> > > > Thanks.
> > > 
> > > I pointed out a couple issues, but you never responded.  See
> > > below.
> > > 
> > > > On Mon, 2021-09-06 at 13:36 +0800, mingchuang qiao wrote:
> > > > > Hi Bjorn,
> > > > > 
> > > > > On Thu, 2021-02-18 at 10:50 -0600, Bjorn Helgaas wrote:
> > > > > > On Thu, Feb 04, 2021 at 05:51:25PM +0800, mingchuang.qiao@m
> > > > > > edia
> > > > > > tek.
> > > > > > co
> > > > > > m wrote:
> > > > > > > From: Mingchuang Qiao <mingchuang.qiao@mediatek.com>
> > > > > > > 
> > > > > > > In bus scan flow, the "LTR Mechanism Enable" bit of
> > > > > > > DEVCTL2
> > > > > > > register is
> > > > > > > configured in pci_configure_ltr(). If device and bridge
> > > > > > > both
> > > > > > > support LTR
> > > > > > > mechanism, the "LTR Mechanism Enable" bit of device and
> > > > > > > bridge
> > > > > > > will
> > > > > > > be
> > > > > > > enabled in DEVCTL2 register. And pci_dev->ltr_path will
> > > > > > > be
> > > > > > > set as
> > > > > > > 1.
> > > > > > > 
> > > > > > > If PCIe link goes down when device resets, the "LTR
> > > > > > > Mechanism
> > > > > > > Enable" bit
> > > > > > > of bridge will change to 0 according to PCIe r5.0, sec
> > > > > > > 7.5.3.16.
> > > > > > > However,
> > > > > > > the pci_dev->ltr_path value of bridge is still 1.
> > > > > > > 
> > > > > > > For following conditions, check and re-configure "LTR
> > > > > > > Mechanism
> > > > > > > Enable" bit
> > > > > > > of bridge to make "LTR Mechanism Enable" bit match
> > > > > > > ltr_path
> > > > > > > value.
> > > > > > >    -before configuring device's LTR for hot-remove/hot-
> > > > > > > add
> > > > > > >    -before restoring device's DEVCTL2 register when
> > > > > > > restore
> > > > > > > device
> > > > > > > state
> > > > > > 
> > > > > > There's definitely a bug here.  The commit log should say a
> > > > > > little
> > > > > > more about what it is.  I *think* if LTR is enabled and we
> > > > > > suspend
> > > > > > (putting the device in D3cold) and resume, LTR probably
> > > > > > doesn't
> > > > > > work
> > > > > > after resume because LTR is disabled in the upstream
> > > > > > bridge,
> > > > > > which
> > > > > > would be an obvious bug.
> > > 
> > > Here's one thing.  Above I was asking for more details.  In
> > > particular, how would a user notice this bug?  How did *you*
> > > notice
> > > the bug?
> > > 
> > 
> > I will update more details in the commit log.
> 
> Mingchuang: Can you please send a revised version of this patch with
> enhanced log as Bjorn suggested.
> 
> If you'd like, you can add that this problem was also noticed when
> PCIe devices (thunderbolt docks) were hot removed from chromebooks,
> and then hot-plugged back again. Once hotplugged back, the newer
> Intel
> chromebooks fail to go into S0ix low power state because of this LTR
> issue, and this patch fixes that.
> 

Thanks for your comments :)
I have sent a new version of this patch with more details in commit
log.

> Bjorn: this was also proposed earlier (but the patch was never
> merged) here:
> https://patchwork.kernel.org/project/linux-pci/patch/20210114134724.7
> 9511-1-mika.westerberg@linux.intel.com/
> (It says "superceded", but I couldn't find the patch that superceded
> Mika's patch. Perhaps it is *this* patch?)
> 
> > 
> > For the suspend(D3 cold) and resume case, the LTR enable bit value
> > of bridge is saved(by pci_save_state()) in suspend flow and
> > restored(by
> > pci_restore_state()) in resume flow.
> >   -If link goes down after bridge already does pci_save_state()
> >     LTR could work after resume due to pci_restore_state() will
> > enable
> > the LTR of bridge.
> >   -If link goes down before bridge does pci_save_state()
> >     LTR probably doesn't work after resume due to the LTR bit is
> > already disable when pci_save_state() and will not enable after
> > pci_restore_sate().
> > 
> > The sequence of link goes down and brdige suspend maybe platform
> > specific.
> > 
> > The issue is noticed by AER log as following shows.
> > 
> > pcieport 0000:00:1d.0: AER: Uncorrected (Non-Fatal) error received:
> > id=00e8
> > pcieport 0000:00:1d.0: PCIe Bus Error: severity=Uncorrected (Non-
> > Fatal), type=Transaction Layer, id=00e8(Requester ID)
> > pcieport 0000:00:1d.0:   device [8086:9d18] error
> > status/mask=00100000/00010000
> > pcieport 0000:00:1d.0:    [20] Unsupported Request    (First)
> 
> Yes, this is expected, because an LTR message from a downstream
> device
> shall be treated as unsupported request if LTR is disabled at the
> rootport.
> 
> > pcieport 0000:00:1d.0:   TLP Header: 34000000 03000010 00000000
> > 00000000
> > 
> > > > > > Also, if a device with LTR enabled is hot-removed, and we
> > > > > > hot-
> > > > > > add a
> > > > > > device, I think LTR will not work on the new
> > > > > > device.  Possibly
> > > > > > also
> > > > > > a
> > > > > > bug, although I'm not convinced we know how to configure
> > > > > > LTR on
> > > > > > the
> > > > > > new device anyway.
> > > > > > 
> > > > > > So I'd *like* to merge the bug fix for v5.12, but I think
> > > > > > I'll
> > > > > > wait
> > > > > > because of the issue below.
> > > > > > 
> > > > > 
> > > > > A friendly ping.
> > > > > Any further process shall I make to get this patch merged?
> > > > > 
> > > > > > > Signed-off-by: Mingchuang Qiao <mingchuang.qiao@mediatek.
> > > > > > > com>
> > > > > > > ---
> > > > > > > changes of v4
> > > > > > >  -fix typo of commit message
> > > > > > >  -rename: pci_reconfigure_bridge_ltr()-
> > > > > > > > pci_bridge_reconfigure_ltr()
> > > > > > > 
> > > > > > > changes of v3
> > > > > > >  -call pci_reconfigure_bridge_ltr() in probe.c
> > > > > > > changes of v2
> > > > > > >  -modify patch description
> > > > > > >  -reconfigure bridge's LTR before restoring device
> > > > > > > DEVCTL2
> > > > > > > register
> > > > > > > ---
> > > > > > >  drivers/pci/pci.c   | 25 +++++++++++++++++++++++++
> > > > > > >  drivers/pci/pci.h   |  1 +
> > > > > > >  drivers/pci/probe.c | 13 ++++++++++---
> > > > > > >  3 files changed, 36 insertions(+), 3 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> > > > > > > index b9fecc25d213..6bf65d295331 100644
> > > > > > > --- a/drivers/pci/pci.c
> > > > > > > +++ b/drivers/pci/pci.c
> > > > > > > @@ -1437,6 +1437,24 @@ static int
> > > > > > > pci_save_pcie_state(struct
> > > > > > > pci_dev *dev)
> > > > > > >       return 0;
> > > > > > >  }
> > > > > > > 
> > > > > > > +void pci_bridge_reconfigure_ltr(struct pci_dev *dev)
> > > > > > > +{
> > > > > > > +#ifdef CONFIG_PCIEASPM
> > > > > > > +     struct pci_dev *bridge;
> > > > > > > +     u32 ctl;
> > > > > > > +
> > > > > > > +     bridge = pci_upstream_bridge(dev);
> > > > > > > +     if (bridge && bridge->ltr_path) {
> > > > > > > +             pcie_capability_read_dword(bridge,
> > > > > > > PCI_EXP_DEVCTL2, &ctl);
> > > > > > > +             if (!(ctl & PCI_EXP_DEVCTL2_LTR_EN)) {
> > > > > > > +                     pci_dbg(bridge, "re-enabling
> > > > > > > LTR\n");
> > > > > > > +                     pcie_capability_set_word(bridge,
> > > > > > > PCI_EXP_DEVCTL2,
> > > > > > > +                                              PCI_EXP_DE
> > > > > > > V
> > > > > > > CTL2
> > > > > > > _L
> > > > > > > TR_EN);
> > > > > > 
> > > > > > This pattern of updating the upstream bridge on behalf of
> > > > > > "dev"
> > > > > > is
> > > > > > problematic because it's racy:
> > > > > > 
> > > > > >   CPU 1                     CPU 2
> > > > > >   -------------------       ---------------------
> > > > > >   ctl = read DEVCTL2        ctl = read(DEVCTL2)
> > > > > >   ctl |= DEVCTL2_LTR_EN     ctl |= DEVCTL2_ARI
> > > > > >   write(DEVCTL2, ctl)
> > > > > >                             write(DEVCTL2, ctl)
> > > > > > 
> > > > > > Now the bridge has ARI set, but not LTR_EN.
> > > > > > 
> > > > > > We have the same problem in the pci_enable_device()
> > > > > > path.  The
> > > > > > most
> > > > > > recent try at fixing it is [1].
> > > 
> > > I was hoping you would respond with "yes, I understand the
> > > problem,
> > > but don't think it's likely" or "no, this isn't actually a
> > > problem
> > > because ..."
> > > 
> > > I think it *is* a problem, but we're probably unlikely to hit it,
> > > so
> > > we can probably live with it for now.
> > > 
> > 
> > Yes, I understand the problem. I also think it unlikely to hit and
> > we
> > can probably live with it for now.
> > Thanks.
> 
> Given that LTR applies to only PCI Express devices, and 2 of such
> devices cannot be simultaneously hot-added under the same parent, I
> think it is highly unlikely to hit.
> I agree that it is a problem in general though. But It doesn't look
> like we are not any close to a merging the other patch series Bjorn
> pointed out (https://lore.kernel.org/linux-pci/20201218174011.340514-
> 2-s.miroshnichenko@yadro.com/).
> 
> So perhaps we could merge this patch, and while this patch may not be
> ideal, it helps in fixing the current set of issues seen with hotplug
> of thunderbolt devices (which are very noticable on Intel chromebooks
> atleast since it prevents them from going into S0ix)?
> 
> Thanks,
> 
> Rajat
> 
> 
> 
> > 
> > > > > > [1] https://lore.kernel.org/linux-pci/20201218174011.340514
> > > > > > -2-
> > > > > > s.mir
> > > > > > os
> > > > > > hnichenko@yadro.com/
> > > > > > 
> > > > > > > +             }
> > > > > > > +     }
> > > > > > > +#endif
> > > > > > > +}
> > > > > > > +
> > > > > > >  static void pci_restore_pcie_state(struct pci_dev *dev)
> > > > > > >  {
> > > > > > >       int i = 0;
> > > > > > > @@ -1447,6 +1465,13 @@ static void
> > > > > > > pci_restore_pcie_state(struct
> > > > > > > pci_dev *dev)
> > > > > > >       if (!save_state)
> > > > > > >               return;
> > > > > > > 
> > > > > > > +     /*
> > > > > > > +      * Downstream ports reset the LTR enable bit when
> > > > > > > link
> > > > > > > goes down.
> > > > > > > +      * Check and re-configure the bit here before
> > > > > > > restoring
> > > > > > > device.
> > > > > > > +      * PCIe r5.0, sec 7.5.3.16.
> > > > > > > +      */
> > > > > > > +     pci_bridge_reconfigure_ltr(dev);
> > > > > > > +
> > > > > > >       cap = (u16 *)&save_state->cap.data[0];
> > > > > > >       pcie_capability_write_word(dev, PCI_EXP_DEVCTL,
> > > > > > > cap[i++]);
> > > > > > >       pcie_capability_write_word(dev, PCI_EXP_LNKCTL,
> > > > > > > cap[i++]);
> > > > > > > diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> > > > > > > index 5c59365092fa..b3a5e5287cb7 100644
> > > > > > > --- a/drivers/pci/pci.h
> > > > > > > +++ b/drivers/pci/pci.h
> > > > > > > @@ -111,6 +111,7 @@ void pci_free_cap_save_buffers(struct
> > > > > > > pci_dev
> > > > > > > *dev);
> > > > > > >  bool pci_bridge_d3_possible(struct pci_dev *dev);
> > > > > > >  void pci_bridge_d3_update(struct pci_dev *dev);
> > > > > > >  void pci_bridge_wait_for_secondary_bus(struct pci_dev
> > > > > > > *dev);
> > > > > > > +void pci_bridge_reconfigure_ltr(struct pci_dev *dev);
> > > > > > > 
> > > > > > >  static inline void pci_wakeup_event(struct pci_dev *dev)
> > > > > > >  {
> > > > > > > diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> > > > > > > index 953f15abc850..ade055e9fb58 100644
> > > > > > > --- a/drivers/pci/probe.c
> > > > > > > +++ b/drivers/pci/probe.c
> > > > > > > @@ -2132,9 +2132,16 @@ static void
> > > > > > > pci_configure_ltr(struct
> > > > > > > pci_dev
> > > > > > > *dev)
> > > > > > >        * Complex and all intermediate Switches indicate
> > > > > > > support
> > > > > > > for LTR.
> > > > > > >        * PCIe r4.0, sec 6.18.
> > > > > > >        */
> > > > > > > -     if (pci_pcie_type(dev) == PCI_EXP_TYPE_ROOT_PORT ||
> > > > > > > -         ((bridge = pci_upstream_bridge(dev)) &&
> > > > > > > -           bridge->ltr_path)) {
> > > > > > > +     if (pci_pcie_type(dev) == PCI_EXP_TYPE_ROOT_PORT) {
> > > > > > > +             pcie_capability_set_word(dev,
> > > > > > > PCI_EXP_DEVCTL2,
> > > > > > > +                                      PCI_EXP_DEVCTL2_LT
> > > > > > > R
> > > > > > > _EN)
> > > > > > > ;
> > > > > > > +             dev->ltr_path = 1;
> > > > > > > +             return;
> > > > > > > +     }
> > > > > > > +
> > > > > > > +     bridge = pci_upstream_bridge(dev);
> > > > > > > +     if (bridge && bridge->ltr_path) {
> > > > > > > +             pci_bridge_reconfigure_ltr(dev);
> > > > > > >               pcie_capability_set_word(dev,
> > > > > > > PCI_EXP_DEVCTL2,
> > > > > > >                                        PCI_EXP_DEVCTL2_LT
> > > > > > > R
> > > > > > > _EN)
> > > > > > > ;
> > > > > > >               dev->ltr_path = 1;
> > > > > > > --
> > > > > > > 2.18.0
> > > > > > 
> > > > > > _______________________________________________
> > > > > > Linux-mediatek mailing list
> > > > > > Linux-mediatek@lists.infradead.org
> > > > > > http://lists.infradead.org/mailman/listinfo/linux-mediatek
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
