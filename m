From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] usb: xhci-mtk: fix AHB bus hang up caused by roothubs
 polling
Date: Fri, 4 Dec 2015 16:24:32 +0300
Message-ID: <56619410.4000705@cogentembedded.com>
References: <1449196807-31785-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449196807-31785-1-git-send-email-chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Hello.

    Sorry for the grammar nitpicking but since it's in the comments, I felt 
the necessity to comment.

On 12/4/2015 5:40 AM, Chunfeng Yun wrote:

> when ip fail to enter sleep mode, register access protection will

    Fails.

> be disabed, at the same time if all clocks are disabled, access
      ^^^^^^^ disabled

> register will hang up AHB bus.
> the common case causes ip sleep fail is that after all ports enter

    Failure.

> U3 but before ip enters sleep mode, a port receives a resume
> signal('K'). this will happens when such as clicks mouse to try to
> do remote wakeup to stop system enter suspend.

    Wake up.

> so stop polling roothubs to avoid access xHCI register on bus

    Root hubs. Accessing.

> suspend, and restart it when bus resume.

    Resumes. Or "is resumed", maybe?

> Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>   drivers/usb/host/xhci-mtk.c | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
>
> diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> index c9ab6a4..38635fb 100644
> --- a/drivers/usb/host/xhci-mtk.c
> +++ b/drivers/usb/host/xhci-mtk.c
> @@ -696,9 +696,24 @@ static int xhci_mtk_remove(struct platform_device *dev)
>   }
>
>   #ifdef CONFIG_PM_SLEEP
> +/*
> + * if ip sleep fail, and all clocks are disabled, access register will hang

    Fails.

> + * AHB bus, so stop poll roothubs to avoid regs access on bus suspend.

    Polling.

> + * and no need to check whether ip sleep fail or not; this will cause SPM to

    Failed.

> + * wakeup system immediately after system suspend complete if ip sleep

    Wake up.

> + * fail, it is what we wanted.

    Fails.

> + */
[...]

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
