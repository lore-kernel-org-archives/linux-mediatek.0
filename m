From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [usb-next, v2 PATCH] usb: xhci: skip phys initialization of
 shared hcd
Date: Thu, 22 Mar 2018 17:21:26 +0800
Message-ID: <1521710486.3717.146.camel@mhfsdcap03>
References: <643701fef843f91931e3a68779afe053c63c96f6.1521707846.git.chunfeng.yun@mediatek.com>
         <20180322090127.GA12048@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180322090127.GA12048@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Mathias Nyman <mathias.nyman@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Roger Quadros <rogerq@ti.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

hi, 
On Thu, 2018-03-22 at 10:01 +0100, Greg Kroah-Hartman wrote:
> On Thu, Mar 22, 2018 at 04:39:20PM +0800, Chunfeng Yun wrote:
> > The phys has already been initialized when add primary hcd,
> > including usb2 phys and usb3 phys also if exist, so needn't
> > re-parse "phys" property again.
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> >  drivers/usb/core/hcd.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> What changed from version 1?
V1: skip phys initialization when add shared HCD by setting
xhci->shared_hcd->skip_phy_initialization=1;
for both xhci-plat.c & xhci-mtk.c files.

V2: fix it in hcd.c suggested by Roger
> 
> Always put that below the --- line like the kernel documentation asks
> you to do.
> 
> v3?
> 
> thanks,
> 
> greg k-h
