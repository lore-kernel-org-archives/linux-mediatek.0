From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH] usb: mtu3: fix EXTCON dependency
Date: Wed, 27 Mar 2019 14:56:19 +0800
Message-ID: <1553669779.10179.172.camel@mhfsdcap03>
References: <20190325135440.2166315-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190325135440.2166315-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

Hi Arnd,

On Mon, 2019-03-25 at 14:54 +0100, Arnd Bergmann wrote:
> When EXTCON is a loadable module, mtu3 fails to link as built-in:
> 
> drivers/usb/mtu3/mtu3_plat.o: In function `mtu3_probe':
> mtu3_plat.c:(.text+0x690): undefined reference to `extcon_get_edev_by_phandle'
> 
> Add a Kconfig dependency to force mtu3 also to be a loadable module
> if extconn is, but still allow it to be built without extcon.
     ^^ extcon

> 
> Fixes: d0ed062a8b75 ("usb: mtu3: dual-role mode support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/usb/mtu3/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/mtu3/Kconfig b/drivers/usb/mtu3/Kconfig
> index bcc23486c4ed..928c2cd6fc00 100644
> --- a/drivers/usb/mtu3/Kconfig
> +++ b/drivers/usb/mtu3/Kconfig
> @@ -6,6 +6,7 @@ config USB_MTU3
>  	tristate "MediaTek USB3 Dual Role controller"
>  	depends on USB || USB_GADGET
>  	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	depends on EXTCON || !EXTCON
>  	select USB_XHCI_MTK if USB_SUPPORT && USB_XHCI_HCD
>  	help
>  	  Say Y or M here if your system runs on MediaTek SoCs with

Tested-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Thank you!
