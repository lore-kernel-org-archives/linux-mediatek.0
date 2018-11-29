From: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [V3] usb/mtu3: power down device ip at setup
Date: Thu, 29 Nov 2018 09:20:56 +0800
Message-ID: <CANMq1KDNqLrsGWOtgvN+auD8TcVJ60jz5gNT99rxxa4rUg8OnA@mail.gmail.com>
References: <20181128092953.41541-1-hsinyi@chromium.org> <20181128095358.42498-1-hsinyi@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181128095358.42498-1-hsinyi@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, chunfeng.yun@mediatek.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org, lkml <linux-kernel@vger.kernel.org>
List-Id: linux-mediatek@lists.infradead.org

FYI, the subject line should be [PATCH v3] (not just [V3])

On Wed, Nov 28, 2018 at 5:54 PM Hsin-Yi, Wang <hsinyi@chromium.org> wrote:
>
> Originally, when dr_mode is USB_DR_MODE_HOST, it didn't power down device ip,
> so host ip sleep will fail at ssusb_host_disable.
>
> Power down device ip at ssusb_host_setup.
>
> Signed-off-by: Hsin-Yi, Wang <hsinyi@chromium.org>
> ---

Next time, add a changelog here (e.g. changes from v1: - ...).

>  drivers/usb/mtu3/mtu3_plat.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
> index 46551f6d16fd..792c420fd4ad 100644
> --- a/drivers/usb/mtu3/mtu3_plat.c
> +++ b/drivers/usb/mtu3/mtu3_plat.c
> @@ -200,6 +200,13 @@ static void ssusb_ip_sw_reset(struct ssusb_mtk *ssusb)
>         mtu3_setbits(ssusb->ippc_base, U3D_SSUSB_IP_PW_CTRL0, SSUSB_IP_SW_RST);
>         udelay(1);
>         mtu3_clrbits(ssusb->ippc_base, U3D_SSUSB_IP_PW_CTRL0, SSUSB_IP_SW_RST);
> +
> +       /*
> +        * device ip maybe poweron in LK/BROM stage before enter kernel stage;

I'd replace LK with a more generic "firmware" term. e.g.
"device ip may be powered on in firmware/BROM stage before entering
kernel stage;"

> +        * power down device ip, otherwise ip-sleep will fail when works as host

s/works/working/

> +        * only mode
> +        */
> +       mtu3_setbits(ssusb->ippc_base, U3D_SSUSB_IP_PW_CTRL2, SSUSB_IP_DEV_PDN);
>  }
>
>  /* ignore the error if the clock does not exist */
> --
> 2.18.1
>

Thanks.
