From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [next PATCH] usb: mtu3: fix up undefined reference to
 usb_debug_root
Date: Sun, 5 May 2019 08:40:14 -0700
Message-ID: <493f7e77-2c84-9812-2c27-760496610522@infradead.org>
References: <2b79c411c5d07a6846967c41803b328e300df8c6.1557035810.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2b79c411c5d07a6846967c41803b328e300df8c6.1557035810.git.chunfeng.yun@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On 5/4/19 11:02 PM, Chunfeng Yun wrote:
> When CONFIG_USB is not set, and CONFIG_USB_GADGET is set,
> there is an issue:
> 
> ld:
> drivers/usb/mtu3/mtu3_debugfs.o: in function 'ssusb_debugfs_create_root':
> mtu3_debugfs.c:(.text+0xba3): undefined reference to 'usb_debug_root'
> 
> usb_debug_root is only built when CONFIG_USB is enabled, so here drop it
> and use NULL instead.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.

> ---
>  drivers/usb/mtu3/mtu3_debugfs.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/mtu3/mtu3_debugfs.c b/drivers/usb/mtu3/mtu3_debugfs.c
> index c96e5dab0a48..3ed666f94dd9 100644
> --- a/drivers/usb/mtu3/mtu3_debugfs.c
> +++ b/drivers/usb/mtu3/mtu3_debugfs.c
> @@ -528,8 +528,7 @@ void ssusb_dr_debugfs_init(struct ssusb_mtk *ssusb)
>  
>  void ssusb_debugfs_create_root(struct ssusb_mtk *ssusb)
>  {
> -	ssusb->dbgfs_root =
> -		debugfs_create_dir(dev_name(ssusb->dev), usb_debug_root);
> +	ssusb->dbgfs_root = debugfs_create_dir(dev_name(ssusb->dev), NULL);
>  }
>  
>  void ssusb_debugfs_remove_root(struct ssusb_mtk *ssusb)
> 


-- 
~Randy
