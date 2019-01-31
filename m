From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH] usb: xhci: remove unused member 'parent' in xhci_regset
 struct
Date: Thu, 31 Jan 2019 09:46:45 +0800
Message-ID: <1548899205.6058.9.camel@mhfsdcap03>
References: <1548814341-15116-1-git-send-email-chunfeng.yun@mediatek.com>
         <20190130071259.GC1204@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190130071259.GC1204@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Alan Stern <stern@rowland.harvard.edu>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Wed, 2019-01-30 at 08:12 +0100, Greg Kroah-Hartman wrote:
> On Wed, Jan 30, 2019 at 10:12:21AM +0800, Chunfeng Yun wrote:
> > The member @parent of xhci_regset struct is not used in fact,
> > so remove it
> > 
> > Change-Id: Ic6727c28f7200782fe4516bcb41c789b427318a2
> 
> No need for this line :(
Oh, my bad, I'll resend it, thanks
