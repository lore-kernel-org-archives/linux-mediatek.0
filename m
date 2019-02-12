From: Honghui Zhang <honghui.zhang@mediatek.com>
Subject: Re: [RFC PATCH] PCI/portdrv: Support for subtractive decode bridge
Date: Tue, 12 Feb 2019 11:12:44 +0800
Message-ID: <1549941164.4980.64.camel@mhfsdcap03>
References: <1544758829-10327-1-git-send-email-honghui.zhang@mediatek.com>
         <20190207151816.GI7268@google.com> <20190207195230.GJ7268@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190207195230.GJ7268@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: youlin.pei@mediatek.com, lorenzo.pieralisi@arm.com, poza@codeaurora.org, fred@fredlawl.com, linux-pci@vger.kernel.org, rafael.j.wysocki@intel.com, linux-kernel@vger.kernel.org, jianjun.wang@mediatek.com, ryder.lee@mediatek.com, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Thu, 2019-02-07 at 13:52 -0600, Bjorn Helgaas wrote:
> On Thu, Feb 07, 2019 at 09:18:16AM -0600, Bjorn Helgaas wrote:
> > On Fri, Dec 14, 2018 at 11:40:29AM +0800, honghui.zhang@mediatek.com wrote:
> > > From: Honghui Zhang <honghui.zhang@mediatek.com>
> > > 
> > > The Class Code for subtractive decode PCI-to-PCI bridge is 060401h,
> > > change the class_mask values to make portdrv support this type bridge.
> > 
> > I assume you have a Root Port or Switch Port that supports subtractive
> > decode?  I'm trying to understand how such a device would work.
> > 
> > Out of curiosity, can you show the "lspci -vv" output for the device
> > and the downstream devices of interest?
> 
> Actually, since subtractive decode has to do with how the bridge
> interacts with its *peers*, what would be interesting is the host
> bridge window information from ACPI _CRS or DT and the lspci info for
> everything under that host bridge.
> 
> Assuming we're talking about a Root Port, I guess that would mean
> anything inside the host bridge windows but outside the positive
> decode windows (the normal PCI-PCI bridge apertures in the Root Ports)
> would be claimed by the subtractive decode Root Port?

Per my understanding, mediatek's Root Port does not claim anything, or
it's fine to assign no resource which is dedicated to this bridge. Those
information could be got through lspci output which is attached in the
last mail. All the resource it claimed is from the subordinate device,
bridge itself does not need any special resource.
> 
> I guess you would want this because this path ultimately leads to an
> ISA or similar bus where you don't know what resources the device
> actually consumes?
> 
I was not get to that far, I just want to start a discussion about this,
since spec does not forbidden subtractive bridge to support port
service.

Thanks.

> Bjorn
