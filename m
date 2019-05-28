From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [v3 PATCH] usb: create usb_debug_root for gadget only
Date: Tue, 28 May 2019 16:49:45 +0800
Message-ID: <1559033385.10179.443.camel@mhfsdcap03>
References: <cffd6d75f69e4d908c8f39b8a60ddae27d6b7c88.1559028752.git.chunfeng.yun@mediatek.com>
         <87k1ebj8vt.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87k1ebj8vt.fsf@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

Hi Felipe,
On Tue, 2019-05-28 at 11:11 +0300, Felipe Balbi wrote:
> Hi,
> 
> Chunfeng Yun <chunfeng.yun@mediatek.com> writes:
> > diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
> > index 7fcb9f782931..88b3ee03a12d 100644
> > --- a/drivers/usb/core/usb.c
> > +++ b/drivers/usb/core/usb.c
> > @@ -1190,7 +1190,7 @@ EXPORT_SYMBOL_GPL(usb_debug_root);
> >  
> >  static void usb_debugfs_init(void)
> >  {
> > -	usb_debug_root = debugfs_create_dir("usb", NULL);
> > +	usb_debug_root = debugfs_create_dir(USB_DEBUG_ROOT_NAME, NULL);
> >  	debugfs_create_file("devices", 0444, usb_debug_root, NULL,
> >  			    &usbfs_devices_fops);
> >  }
> 
> might be a better idea to move this to usb common. 
Good idea, I forgot there is a common file.

> Then have a function
> which can be called by both host and gadget to maybe create the
> directory:
I'll try it.

Thanks a lot

> 
> static struct dentry *usb_debug_root;
> 
> struct dentry *usb_debugfs_init(void)
> {
> 	if (!usb_debug_root)
>         	usb_debug_root = debugfs_create_dir("usb", NULL);
> 
> 	return usb_debug_root;
> }
> 
> 
> Then usb core would be updated to something like:
> 
> static void usb_core_debugfs_init(void)
> {
> 	struct dentry *root = usb_debugfs_init();
> 
> 	debugfs_create_file("devices", 0444, root, NULL, &usbfs_devices_fops);
> }
> 
