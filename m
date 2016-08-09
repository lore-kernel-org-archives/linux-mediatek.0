From: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RESEND PATCH] usb: hub: change CLEAR_FEATURE to SET_FEATURE
Date: Tue, 9 Aug 2016 14:29:17 +0800
Message-ID: <CAL411-pcupjH7xBH9rR8hs5_EGDidcO3JFkRtE4ENpgq7qvmcQ@mail.gmail.com>
References: <1470713487-7596-1-git-send-email-yonglong.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1470713487-7596-1-git-send-email-yonglong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yonglong Wu <yonglong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

On Tue, Aug 9, 2016 at 11:31 AM, Yonglong Wu <yonglong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> From: Yonglong Wu <yonglong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>
> According to USB30 specification, the Function Remote Wakeup field can be
> modified by the SetFeature() requests. SetFeature() is recommended to use.
>
> Signed-off-by: Yonglong Wu <yonglong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  drivers/usb/core/hub.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index bee1351..a6f5095 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -3111,7 +3111,7 @@ static int usb_disable_remote_wakeup(struct usb_device *udev)
>                                 USB_CTRL_SET_TIMEOUT);
>         else
>                 return usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
> -                               USB_REQ_CLEAR_FEATURE, USB_RECIP_INTERFACE,
> +                               USB_REQ_SET_FEATURE, USB_RECIP_INTERFACE,
>                                 USB_INTRF_FUNC_SUSPEND, 0, NULL, 0,
>                                 USB_CTRL_SET_TIMEOUT);
>  }
> --
> 1.7.9.5
>

This requirement is so strange, would you please list the detail
chapter at specification.

Peter
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
