From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH 2/2] MAINTAINERS: add entry for mediatek usb3 DRD IP
 driver
Date: Thu, 3 Aug 2017 18:20:43 +0800
Message-ID: <1501755643.25536.110.camel@mhfsdcap03>
References: <1501749439-8837-1-git-send-email-chunfeng.yun@mediatek.com>
         <1501749439-8837-2-git-send-email-chunfeng.yun@mediatek.com>
         <87y3r1dmyq.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87y3r1dmyq.fsf@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Thu, 2017-08-03 at 12:23 +0300, Felipe Balbi wrote:
> Hi,
> 
> Chunfeng Yun <chunfeng.yun@mediatek.com> writes:
> > Add myself as maintainer of MediaTek USB3 DRD IP driver
> >
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> >  MAINTAINERS |    7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 205d397..0f0bcc7 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -8472,6 +8472,13 @@ M:      Sean Wang <sean.wang@mediatek.com>
> >  S:      Maintained
> >  F:      drivers/char/hw_random/mtk-rng.c
> >  
> > +MEDIATEK USB3 DRD IP DRIVER
> > +M:	Chunfeng Yun <chunfeng.yun@mediatek.com>
> > +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> > +L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
> 
> everything USB should go to linux-usb too.
Ok, I'll add it, thanks
> 
