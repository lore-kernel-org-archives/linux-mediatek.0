From: chunfeng yun <chunfeng.yun@mediatek.com>
Subject: Re: [RESEND PATCH v2] usb: xhci-mtk: fix AHB bus hang up caused by
 roothubs polling
Date: Tue, 12 Jan 2016 09:48:24 +0800
Message-ID: <1452563304.28863.1.camel@mhfsdcap03>
References: <1452216517-3765-1-git-send-email-chunfeng.yun@mediatek.com>
	 <5693B5C8.6090201@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5693B5C8.6090201@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Felipe Balbi <balbi@ti.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org, Daniel Kurtz <djkurtz@chromium.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: linux-mediatek@lists.infradead.org

Hi,
On Mon, 2016-01-11 at 16:01 +0200, Mathias Nyman wrote:
> On 08.01.2016 03:28, Chunfeng Yun wrote:
> > when ip fails to enter sleep mode, register access protection will
> > be disabled, at the same time if all clocks are disabled, access
> > register will hang up AHB bus.
> > the common case causes ip sleep failure is that after all ports
> > enter U3 but before ip enters sleep mode, a port receives a resume
> > signal('K'). this will happens when such as clicks mouse to try to
> > do remote-wakeup to stop system enter suspend.
> > so stop polling root hubs to avoid access xHCI register on bus
> > suspend, and restart it when bus resumes.
> >
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> >   drivers/usb/host/xhci-mtk.c | 23 +++++++++++++++++++++++
> 
> The xhci Mediatek (xhci-mtk etc) support is in usb-next and should be available first time
> in 4.5-rc1 kernel.
> 
> I'll forward fixes for it once 4.5-rc1 is out, they should end up in final 4.5
> 
Thank you!

> -Mathias
> 
