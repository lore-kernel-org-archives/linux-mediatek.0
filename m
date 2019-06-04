From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [v3 PATCH] usb: create usb_debug_root for gadget only
Date: Tue, 4 Jun 2019 14:44:18 +0800
Message-ID: <1559630658.8487.61.camel@mhfsdcap03>
References: <cffd6d75f69e4d908c8f39b8a60ddae27d6b7c88.1559028752.git.chunfeng.yun@mediatek.com>
         <87k1ebj8vt.fsf@linux.intel.com> <1559201499.8487.40.camel@mhfsdcap03>
         <87sgsv2n54.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87sgsv2n54.fsf@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Fri, 2019-05-31 at 08:44 +0300, Felipe Balbi wrote:
> Hi,
> 
> Chunfeng Yun <chunfeng.yun@mediatek.com> writes:
> 
> > Hi Felipe,
> > On Tue, 2019-05-28 at 11:11 +0300, Felipe Balbi wrote:
> >> Hi,
> >> 
> >> Chunfeng Yun <chunfeng.yun@mediatek.com> writes:
> >> > diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
> >> > index 7fcb9f782931..88b3ee03a12d 100644
> >> > --- a/drivers/usb/core/usb.c
> >> > +++ b/drivers/usb/core/usb.c
> >> > @@ -1190,7 +1190,7 @@ EXPORT_SYMBOL_GPL(usb_debug_root);
> >> >  
> >> >  static void usb_debugfs_init(void)
> >> >  {
> >> > -	usb_debug_root = debugfs_create_dir("usb", NULL);
> >> > +	usb_debug_root = debugfs_create_dir(USB_DEBUG_ROOT_NAME, NULL);
> >> >  	debugfs_create_file("devices", 0444, usb_debug_root, NULL,
> >> >  			    &usbfs_devices_fops);
> >> >  }
> >> 
> >> might be a better idea to move this to usb common. Then have a function
> >> which can be called by both host and gadget to maybe create the
> >> directory:
> >> 
> >> static struct dentry *usb_debug_root;
> >> 
> >> struct dentry *usb_debugfs_init(void)
> >> {
> >> 	if (!usb_debug_root)
> >>         	usb_debug_root = debugfs_create_dir("usb", NULL);
> >> 
> >> 	return usb_debug_root;
> >> }
> >> 
> >> 
> >> Then usb core would be updated to something like:
> >> 
> >> static void usb_core_debugfs_init(void)
> >> {
> >> 	struct dentry *root = usb_debugfs_init();
> >> 
> >> 	debugfs_create_file("devices", 0444, root, NULL, &usbfs_devices_fops);
> >> }
> >> 
> > I find a problem when move usb_debugfs_init() and usb_debugfs_cleanup()
> > into usb common, it's easy to create "usb" directory, but difficult to
> > cleanup it:
> >
> > common/common.c
> >
> > struct dentry *usb_debugfs_init(void)
> > {
> >     if (!usb_debug_root)
> >         usb_debug_root = debugfs_create_dir("usb", NULL);
> >
> >     return usb_debug_root;
> > }
> >
> > void usb_debugfs_cleanup(void)
> > {
> >     debugfs_remove_recursive(usb_debug_root);
> >     usb_debug_root = NULL;
> > }
> >
> > core/usb.c
> >
> > static void usb_core_debugfs_init(void)
> > {
> >     struct dentry *root = usb_debugfs_init();
> >
> >     debugfs_create_file("devices", 0444, root, NULL,
> > &usbfs_devices_fops);
> > }
> >
> > static int __init usb_init(void)
> > {
> >     ...
> >     usb_core_debugfs_init();
> >     ...
> > }
> >
> > static void __exit usb_exit(void)
> > {
> >     ...
> >     usb_debugfs_cleanup();
> >     // will be error, gadget may use it.
> >     ...
> > }
> >
> > gadget/udc/core.c
> >
> > static int __init usb_udc_init(void)
> > {
> >     ...
> >     usb_debugfs_init();
> >     ...
> > }
> >
> > static void __exit usb_udc_exit(void)
> > {
> >     ...
> >     usb_debugfs_cleanup();
> >     // can't cleanup in fact, usb core may use it.
> > }
> >
> > How to handle this case? introduce a reference count? do you have any
> > suggestion?
> 
> I guess a simple refcount is the way to go:
> 
> struct dentry *usb_debugfs_init(void)
> {
> 	if (!usb_debug_root)
> 		usb_debug_root = debugfs_create_dir("usb", NULL);
> 
> 	usb_debug_root_refcnt++;
> 	return usb_debug_root;
> }
> 
> void usb_debugfs_cleanup(void)
> {
> 	if (!(--usb_debug_root_refcnt)) {
> 		debugfs_remove_recursive(usb_debug_root);
> 		usb_debug_root = NULL;
> 	}
> }
I'll try it, thanks

> 
> Or something along those lines
> 
