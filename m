From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH usb-next v4 0/2] fix HCD PHY suspend handling
Date: Thu, 5 Apr 2018 22:13:54 +0200
Message-ID: <20180405201354.GA3840@kroah.com>
References: <20180327212621.3400-1-martin.blumenstingl@googlemail.com>
 <851bcd3a-9ff6-e0ac-579a-a4973c619818@ti.com>
 <20180405133815.GC21390@kroah.com>
 <CAFBinCC6TQEyWdtSuqHsejy5b1EXXaJdyUegVTNVqxy9DcuBpw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAFBinCC6TQEyWdtSuqHsejy5b1EXXaJdyUegVTNVqxy9DcuBpw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: d-gerlach-l0cyMroinI0@public.gmane.org, j-keerthy-l0cyMroinI0@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

On Thu, Apr 05, 2018 at 10:08:23PM +0200, Martin Blumenstingl wrote:
> Hi Greg,
> 
> On Thu, Apr 5, 2018 at 3:38 PM, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org> wrote:
> > On Thu, Apr 05, 2018 at 11:47:11AM +0300, Roger Quadros wrote:
> >> Greg,
> >>
> >> On 28/03/18 00:26, Martin Blumenstingl wrote:
> >> > This is a follow-up to my previous series "initialize (multiple) PHYs
> >> > for a HCD": [0].
> >> >
> >> > Roger Quadros reported [1] that it "is breaking low power cases on TI
> >> > SoCs when USB is in host mode". He further explains that "Not doing the
> >> > phy_exit() here [when entering suspend] leaves the clocks enabled on
> >> > our SoC and we're no longer able to reach low power states on system
> >> > suspend."
> >> > Chunfeng Yun from Mediatek noted [2] that we cannot unconditionally call
> >> > phy_exit while entering system suspend, because this would "disconnect
> >> > plugged devices on MTK platforms, due to re-initialize u2 phys when
> >> > resume"
> >> >
> >> > In the discussion (which followed Roger's bug report: [1]) Roger,
> >> > Chunfeng and me came to the conclusion that we can fix suspend on the
> >> > TI SoCs without breaking it on the Mediatek SoCs by extending the
> >> > suspend and resume code in usb/core/phy.c by checking whether the USB
> >> > controller can wake up the system (which is the case for the Mediatek
> >> > MTU3 controller, but now for the dwc3 controller used on the TI SoCs):
> >> > - if the controller can wake up the system (Mediatek MTU3 use-case) we
> >> >   only call usb_phy_roothub_power_off (which calls phy_power_off) when
> >> >   entering system suspend
> >> > - if the controller however cannot wake up the system (dwc3 on TI SoCs)
> >> >   we additionally call usb_phy_roothub_exit (which calls phy_exit) when
> >> >   entering system suspend
> >> > - (we undo the previous steps during system resume)
> >> >
> >> > The goal of this series is to fix the issue reported by Roger without
> >> > breaking suspend/resume on the Mediatek SoCs.
> >> > Since I neither have a TI nor a Mediatek device I am sending this as
> >> > RFC. I have tested it on an Amlogic Meson GXM board (Khadas VIM2) which
> >> > does NOT support suspend/resume yet.
> >> >
> >> > this should be applied on top of [3] "usb: core: phy: fix return value
> >> > of usb_phy_roothub_exit()" (even though there's no strict dependency,
> >> > this is the order I wrote the patches in).
> >> >
> >> > changes since RFC v3 at [6]:
> >> > - added Chunfeng Yun's Tested-by and Roger Quadros' Reviewed-by (thank
> >> >   you!)
> >> > - dropped RFC prefix
> >> >
> >> > changes since RFC v2 at [5]:
> >> > - add missing INIT_LIST_HEAD call in usb_phy_roothub_add_phy (affects
> >> >   patch #1 - spotted by Roger Quadros, thank you!)
> >> > - fixed swapped conditions using device_may_wakeup() in
> >> >   usb_phy_roothub_resume because we need to call usb_phy_roothub_init
> >> >   if the controller cannot wake up the device (affects patch #2, spotted
> >> >   by Chunfeng Yun, thank you!)
> >> > - simplified the error condition to "undo" usb_phy_roothub_init if
> >> >   usb_phy_roothub_power_on failed in usb_phy_roothub_resume (suggested
> >> >   by Chunfeng Yun)
> >> > - updated the commit message (using Roger's wording) because (quote from
> >> >   Roger "it doesn't prevent the system from entering suspend but just
> >> >   prevents the system from reaching lowest power levels in the suspend
> >> >   state."
> >> >
> >> > Changes since RFC v1 (blob attachments) at [4]:
> >> > - use device_may_wakeup instead of device_can_wakeup as suggested by
> >> >   Roger Quadros
> >> > - use the controller device from hcd->self.controller as suggested by
> >> >   Chunfeng Yun
> >> > - compile time fixes thanks to Roger Quadros
> >> > - if usb_phy_roothub_power_on in usb_phy_roothub_resume failes then
> >> >   we now call usb_phy_roothub_exit to keep the PHYs in the correct
> >> >   state if usb_phy_roothub_resume partially failed
> >> >
> >> >
> >> > [0] http://lists.infradead.org/pipermail/linux-amlogic/2018-March/006599.html
> >> > [1] http://lists.infradead.org/pipermail/linux-amlogic/2018-March/006737.html
> >> > [2] http://lists.infradead.org/pipermail/linux-amlogic/2018-March/006758.html
> >> > [3] http://lists.infradead.org/pipermail/linux-amlogic/2018-March/006819.html
> >> > [4] http://lists.infradead.org/pipermail/linux-amlogic/2018-March/006794.html
> >> > [5] http://lists.infradead.org/pipermail/linux-amlogic/2018-March/006820.html
> >> > [6] http://lists.infradead.org/pipermail/linux-amlogic/2018-March/006847.html
> >> >
> >> > Martin Blumenstingl (2):
> >> >   usb: core: split usb_phy_roothub_{init,alloc}
> >> >   usb: core: use phy_exit during suspend if wake up is not supported
> >>
> >> Gentle ping on this one. Without this system suspend/resume is broken on TI platforms.
> >
> > Sorry, this missed my merge window, I can pick it up after 4.17-rc1 is
> > out.
> do you want me to re-send this based on v4.17-rc1 (once it's out)?
> I can re-spin this series so it includes:
> a) "usb: core: phy: fix return value of usb_phy_roothub_exit()" [0]
> b) the two patches from this series (they apply on top of [0])
> c) a missing forward declaration as well as a missing include guard
> (and a SPDX-License-Identifier) as suggested by Masahiro Yamada in [1]
> 
> (patches for c) are neither written nor posted yet, but they're minor
> and I can prepare and test them during the weekend)
> 
> just let me know whether you would like to take these three series
> individually or whether you would like them all in one "usb: core:
> phy: fixes for v4.17" series

Yes, please respin and resend.

thanks,

greg k-h
