From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [RFC PATCH] PCI/portdrv: Support for subtractive decode bridge
Date: Thu, 7 Feb 2019 13:52:30 -0600
Message-ID: <20190207195230.GJ7268@google.com>
References: <1544758829-10327-1-git-send-email-honghui.zhang@mediatek.com>
 <20190207151816.GI7268@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190207151816.GI7268@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: honghui.zhang@mediatek.com
Cc: youlin.pei@mediatek.com, lorenzo.pieralisi@arm.com, poza@codeaurora.org, fred@fredlawl.com, linux-pci@vger.kernel.org, rafael.j.wysocki@intel.com, linux-kernel@vger.kernel.org, jianjun.wang@mediatek.com, ryder.lee@mediatek.com, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Thu, Feb 07, 2019 at 09:18:16AM -0600, Bjorn Helgaas wrote:
> On Fri, Dec 14, 2018 at 11:40:29AM +0800, honghui.zhang@mediatek.com wrote:
> > From: Honghui Zhang <honghui.zhang@mediatek.com>
> > 
> > The Class Code for subtractive decode PCI-to-PCI bridge is 060401h,
> > change the class_mask values to make portdrv support this type bridge.
> 
> I assume you have a Root Port or Switch Port that supports subtractive
> decode?  I'm trying to understand how such a device would work.
> 
> Out of curiosity, can you show the "lspci -vv" output for the device
> and the downstream devices of interest?

Actually, since subtractive decode has to do with how the bridge
interacts with its *peers*, what would be interesting is the host
bridge window information from ACPI _CRS or DT and the lspci info for
everything under that host bridge.

Assuming we're talking about a Root Port, I guess that would mean
anything inside the host bridge windows but outside the positive
decode windows (the normal PCI-PCI bridge apertures in the Root Ports)
would be claimed by the subtractive decode Root Port?

I guess you would want this because this path ultimately leads to an
ISA or similar bus where you don't know what resources the device
actually consumes?

Bjorn
