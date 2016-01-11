From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [RESEND PATCH v2] usb: xhci-mtk: fix AHB bus hang up caused by
 roothubs polling
Date: Mon, 11 Jan 2016 16:01:44 +0200
Message-ID: <5693B5C8.6090201@linux.intel.com>
References: <1452216517-3765-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452216517-3765-1-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Mathias Nyman <mathias.nyman@intel.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Felipe Balbi <balbi@ti.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org, Daniel Kurtz <djkurtz@chromium.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: linux-mediatek@lists.infradead.org

On 08.01.2016 03:28, Chunfeng Yun wrote:
> when ip fails to enter sleep mode, register access protection will
> be disabled, at the same time if all clocks are disabled, access
> register will hang up AHB bus.
> the common case causes ip sleep failure is that after all ports
> enter U3 but before ip enters sleep mode, a port receives a resume
> signal('K'). this will happens when such as clicks mouse to try to
> do remote-wakeup to stop system enter suspend.
> so stop polling root hubs to avoid access xHCI register on bus
> suspend, and restart it when bus resumes.
>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>   drivers/usb/host/xhci-mtk.c | 23 +++++++++++++++++++++++

The xhci Mediatek (xhci-mtk etc) support is in usb-next and should be available first time
in 4.5-rc1 kernel.

I'll forward fixes for it once 4.5-rc1 is out, they should end up in final 4.5

-Mathias
