From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [RFC PATCH] PCI/portdrv: Support for subtractive decode bridge
Date: Wed, 13 Feb 2019 13:11:32 -0600
Message-ID: <20190213191132.GI96272@google.com>
References: <1544758829-10327-1-git-send-email-honghui.zhang@mediatek.com>
 <20190207151816.GI7268@google.com>
 <1549940249.4980.56.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1549940249.4980.56.camel@mhfsdcap03>
Sender: linux-kernel-owner@vger.kernel.org
To: Honghui Zhang <honghui.zhang@mediatek.com>
Cc: lorenzo.pieralisi@arm.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, ryder.lee@mediatek.com, matthias.bgg@gmail.com, youlin.pei@mediatek.com, poza@codeaurora.org, fred@fredlawl.com, rafael.j.wysocki@intel.com, jianjun.wang@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

On Tue, Feb 12, 2019 at 10:57:29AM +0800, Honghui Zhang wrote:
> On Thu, 2019-02-07 at 09:18 -0600, Bjorn Helgaas wrote:
> > On Fri, Dec 14, 2018 at 11:40:29AM +0800, honghui.zhang@mediatek.com wrote:
> > > From: Honghui Zhang <honghui.zhang@mediatek.com>
> > > 
> > > The Class Code for subtractive decode PCI-to-PCI bridge is 060401h,
> > > change the class_mask values to make portdrv support this type bridge.
> > 
> > I assume you have a Root Port or Switch Port that supports subtractive
> > decode?  I'm trying to understand how such a device would work.
> 
> Yes, most of Mediatek's RC device have set the class type as 060401h as
> HW default values, include mt2712 and mt7622.
> 
> Those RC device work fine with all I have tried EP device except that
> the portdrv was not attached to those device. But no scenario need those
> service as far as I know.
> 
> > Out of curiosity, can you show the "lspci -vv" output for the device
> > and the downstream devices of interest?
> > 
> lspci only read the class type 0604h, it does not care about the
> subordinate values of the class type. I will put the "lspci -vv" output
> at bottom of this mail.
> 
> > Do you happen to know whether this functionality is configurable,
> > e.g., is there some way software can enable or disable subtractive
> > decode?  I assume this would be some device-specific thing, because I
> > can't find anything in the Bridge Control register or similar.  The
> > PCIe spec doesn't even contain the word "subtractive".
> 
> Those class type values for Mediatek's RC has a register which could be
> used to change its values. We never touch this backdoor register since
> without the portdrv attached is fine, nobody ask for the port service
> yet.
> 
> I did some homework for the subtractive decode PCI-to-PCI bridge, and
> did not found much more information about that. I guess those port
> service should also support subtractive bridge since spec does not
> forbidden that.

OK, I guess that makes sense.

> > The "PCI Express to PCI/PCI-X Bridge Specification", r1.0, says a PCI
> > Express bridge (which would include Root Ports and Switch Ports) has a
> > Class Code of 0x060400 (Non-Subtractive PCI-PCI Bridge) (sec 1.1).
> > 
> > Sec 1.3.4 says subtractive decode on the primary interface is "not
> > applicable or outside the scope of this spec".

> # lspci -vvv
> 00:01.0 Class 0604: Device 14c3:5396
> ...

> > > Signed-off-by: Honghui Zhang <honghui.zhang@mediatek.com>
> > > ---
> > >  drivers/pci/pcie/portdrv_pci.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/pci/pcie/portdrv_pci.c b/drivers/pci/pcie/portdrv_pci.c
> > > index eef22dc..86926ea 100644
> > > --- a/drivers/pci/pcie/portdrv_pci.c
> > > +++ b/drivers/pci/pcie/portdrv_pci.c
> > > @@ -179,7 +179,7 @@ static void pcie_portdrv_err_resume(struct pci_dev *dev)
> > >   */
> > >  static const struct pci_device_id port_pci_ids[] = { {
> > >  	/* handle any PCI-Express port */
> > > -	PCI_DEVICE_CLASS(((PCI_CLASS_BRIDGE_PCI << 8) | 0x00), ~0),
> > > +	PCI_DEVICE_CLASS(((PCI_CLASS_BRIDGE_PCI << 8) | 0x00), ~0x01),

Can you please rework this slightly so it leaves the original entry
alone and just *adds* a new entry that matches the subtractive-decode
bridges?  I think that will make it more obvious what's changing.

> > >  	}, { /* end: all zeroes */ }
> > >  };
