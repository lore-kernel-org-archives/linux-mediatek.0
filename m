From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH] usb: mtu3: fix U3 port link issue
Date: Wed, 28 Dec 2016 09:21:38 +0800
Message-ID: <1482888098.11166.0.camel@mhfsdcap03>
References: <1481095393-23198-1-git-send-email-chunfeng.yun@mediatek.com>
         <87lgv11usf.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87lgv11usf.fsf@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Oliver Neukum <oneukum@suse.com>, Alan Stern <stern@rowland.harvard.edu>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Pawel Moll <pawel.moll@arm.com>, Kumar Gala <galak@codeaurora.org>, Sascha Hauer <s.hauer@pengutronix.de>, Alan Cooper <alcooperx@gmail.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Hi,

On Tue, 2016-12-27 at 13:22 +0200, Felipe Balbi wrote:
> Hi,
> 
> Chunfeng Yun <chunfeng.yun@mediatek.com> writes:
> > the issue is introduced when @is_u3_ip is used in mtu3_device_enabe()
> > before initialized in mtu3_mem_alloc(), so get global IP information
> > at first before used by following functins.
> >
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> 
> patch doesn't apply to my testing/fixes. Please rebase
It's already accepted into kernel4.10-rc1
> 
