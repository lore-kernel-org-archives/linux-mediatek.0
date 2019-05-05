From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: linux-next: Tree for May 2 (drivers/usb/mtu3/mtu3_debugfs.o)
Date: Sun, 5 May 2019 11:20:56 +0800
Message-ID: <1557026456.10179.261.camel@mhfsdcap03>
References: <20190502201028.707453d8@canb.auug.org.au>
 <3e56059c-e024-324f-f584-75a806d9b0e0@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <3e56059c-e024-324f-f584-75a806d9b0e0-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, Linux Next Mailing List <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Randy,
On Thu, 2019-05-02 at 08:17 -0700, Randy Dunlap wrote:
> On 5/2/19 3:10 AM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20190501:
> > 
> 
> on i386:
> 
> ld: drivers/usb/mtu3/mtu3_debugfs.o: in function `ssusb_debugfs_create_root':
> mtu3_debugfs.c:(.text+0xba3): undefined reference to `usb_debug_root'
> 
> CONFIG_USB_SUPPORT=y
> CONFIG_USB_COMMON=y
> CONFIG_USB_ARCH_HAS_HCD=y
> # CONFIG_USB is not set     <<<<< no host-side USB
> # CONFIG_USB_PCI is not set
> CONFIG_USB_MTU3=y
> CONFIG_USB_MTU3_GADGET=y     <<<<< gadget-only mode
> # CONFIG_USB_MTU3_DEBUG is not set
> CONFIG_USB_MUSB_HDRC=m
> CONFIG_USB_MUSB_GADGET=y
> 
> usb_debug_root is in drivers/usb/core/usb.c, which is only built
> when CONFIG_USB is set/enabled.
> 
I'll fix it ASAP.

Thanks a lot

> 
> 
> Full randconfig file is attached.
> 
