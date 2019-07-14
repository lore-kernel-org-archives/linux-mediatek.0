From: Sean Wang <sean.wang-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] media: mtk-cir: only allow protocols that have
 software decoders
Date: Sat, 13 Jul 2019 23:58:40 -0700
Message-ID: <CAGp9LzpVUExzvNZM2U2EcbTKg016xx3q0CGYXxqgaD+Y+UoRFA@mail.gmail.com>
References: <20190712224700.11285-1-sean@mess.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20190712224700.11285-1-sean-hENCXIMQXOg@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Sean Young <sean-hENCXIMQXOg@public.gmane.org>
Cc: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Frank Wunderlich <frank-w-SipyoOjXbOMoAHOVJHB0wA@public.gmane.org>, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Fri, Jul 12, 2019 at 3:47 PM Sean Young <sean-hENCXIMQXOg@public.gmane.org> wrote:
>
> RC_PROTO_BIT_ALL includes protocols like unknown and other that do not
> have IR decoders by definition. If these protocols are set in the
> allowed_protocols, they will show in the protocols sysfs file but cannot
> be enabled.
>
> Signed-off-by: Sean Young <sean-hENCXIMQXOg@public.gmane.org>

Acked-by: Sean Wang <sean.wang-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> ---
>  drivers/media/rc/mtk-cir.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/rc/mtk-cir.c b/drivers/media/rc/mtk-cir.c
> index 46101efe017b..9dc467ebae24 100644
> --- a/drivers/media/rc/mtk-cir.c
> +++ b/drivers/media/rc/mtk-cir.c
> @@ -342,7 +342,7 @@ static int mtk_ir_probe(struct platform_device *pdev)
>         ir->rc->map_name = map_name ?: RC_MAP_EMPTY;
>         ir->rc->dev.parent = dev;
>         ir->rc->driver_name = MTK_IR_DEV;
> -       ir->rc->allowed_protocols = RC_PROTO_BIT_ALL;
> +       ir->rc->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
>         ir->rc->rx_resolution = MTK_IR_SAMPLE;
>         ir->rc->timeout = MTK_MAX_SAMPLES * (MTK_IR_SAMPLE + 1);
>
> --
> 2.21.0
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
