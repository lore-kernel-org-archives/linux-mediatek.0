From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH 1/2] usb: xhci: Make it possible to not have a secondary
 HCD (3.0)
Date: Mon, 6 May 2019 16:21:53 +0300
Message-ID: <6844539f-3d5e-e3ff-b498-390cdc731880@linux.intel.com>
References: <20190502045631.229386-1-drinkcat@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190502045631.229386-1-drinkcat@chromium.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Boichat <drinkcat@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Khuong Dinh <khuong@os.amperecomputing.com>, Hoan Tran <hoan@os.amperecomputing.com>
List-Id: linux-mediatek@lists.infradead.org

On 2.5.2019 7.56, Nicolas Boichat wrote:
> Some XHCI controllers may not have any USB 3.0 port, in this case, it
> is not useful to create add hcd->shared_hcd, which has 2 main
> downsides:
>   - A useless USB 3.0 root hub is created.
>   - A warning is thrown on boot:
> hub 2-0:1.0: config failed, hub doesn't have any ports! (err -19)
> 
> The change is mostly about checking if hcd->shared_hcd is NULL before
> accessing it. The one special case is in xhci_run, where we need to
> call xhci_run_finished immediately, if there is no secondary hcd.

To me it looks like this creates an controller starting issue for
xHC hardware that have both usb2 and usb3 ports.

When we have usb3 ports xhci->shared_hcd is not set yet when xhci_run is called
the first time. We will end up starting the xHC before properly setting up the secondary hcd.

See further down for details

> 
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> ---
> 
> This is a respin of https://lore.kernel.org/patchwork/patch/863993/,
> hopefully addressing the comments there. Note that I dropped the change
> in xhci-plat.c, as I do not have a device to test it, but made a
> similar change in xhci-mtk.c, in the next patch.
> 
> (the @apm.com addresses seem to bounce, so I added some
> @amperecomputing.com instead, if somebody there can track back the
> original issue, I'm happy to provide a patch for xhci-plat.c as well)
> 
> drivers/usb/host/xhci-hub.c |  7 ++++--
>   drivers/usb/host/xhci.c     | 45 +++++++++++++++++++++++++++----------
>   2 files changed, 38 insertions(+), 14 deletions(-)
> 

...

> @@ -698,6 +703,10 @@ int xhci_run(struct usb_hcd *hcd)
>   
>   	xhci_debugfs_init(xhci);
>   
> +	/* There is no secondary HCD, start the host controller immediately. */
> +	if (!xhci->shared_hcd)
> +		return xhci_run_finished(xhci);
> +

PCI xHC controllers with both usb2 and usb3 ports will be started before usb3 parts are properly set up.

xhci_pci_probe()
   usb_hcd_pci_probe()
     usb_add_hcd()
       hcd->driver->start(hcd)  // .start = xhci_run
         xhci_run()
           if (!xhci->shared_hcd)  // TRUE as xhci->shared_hcd is not yet set,
	    return xhci_run_finished(xhci)  // starting controller too early here
   xhci->shared_hcd = usb_create_shared_hcd()   // now xhci->shared_hcd is set.

-Mathias
