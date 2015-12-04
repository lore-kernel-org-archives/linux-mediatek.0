From: Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: [PATCH] usb: xhci: fix config fail of FS hub behind a HS hub
 with MTT
Date: Fri, 04 Dec 2015 14:06:30 +0200
Message-ID: <566181C6.6090107@intel.com>
References: <1449123254-21654-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449123254-21654-1-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Felipe Balbi <balbi@ti.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org, Daniel Kurtz <djkurtz@chromium.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: linux-mediatek@lists.infradead.org

On 03.12.2015 08:14, Chunfeng Yun wrote:
> if a full speed hub connects to a high speed hub which
> supports MTT, the MTT field of its slot context will be set
> to 1 when xHCI driver setups an xHCI virtual device in
> xhci_setup_addressable_virt_dev(); once usb core fetch its
> hub descriptor, and need to update the xHC's internal data
> structures for the device, the HUB field of its slot context
> will be set to 1 too, meanwhile MTT is also set before,
> this will cause configure endpoint command fail, so in the
> case, we should clear MTT to 0 for full speed hub according
> to section 6.2.2
>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---

Thanks, patch added to queue

-Mathias
