From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] usb: xhci: remove unused member 'parent' in xhci_regset
 struct
Date: Wed, 30 Jan 2019 08:12:59 +0100
Message-ID: <20190130071259.GC1204@kroah.com>
References: <1548814341-15116-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1548814341-15116-1-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Alan Stern <stern@rowland.harvard.edu>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Wed, Jan 30, 2019 at 10:12:21AM +0800, Chunfeng Yun wrote:
> The member @parent of xhci_regset struct is not used in fact,
> so remove it
> 
> Change-Id: Ic6727c28f7200782fe4516bcb41c789b427318a2

No need for this line :(
