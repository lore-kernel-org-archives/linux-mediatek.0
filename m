From: Sean Wang <sean.wang-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] media: mtk-cir: lower de-glitch counter for rc-mm
 protocol
Date: Sun, 14 Jul 2019 00:00:50 -0700
Message-ID: <CAGp9Lzq+RcizFgP4LJMxaH3K6Jcbk8jit8bv+3M2fwqwwV4NvA@mail.gmail.com>
References: <20190712224700.11285-1-sean@mess.org>
 <20190712224700.11285-3-sean@mess.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20190712224700.11285-3-sean-hENCXIMQXOg@public.gmane.org>
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
> The rc-mm protocol can't be decoded by the mtk-cir since the de-glitch
> filter removes pulses/spaces shorter than 294 microseconds.
>
> Tested on a BananaPi R2.

Thanks for grabbing the board and do the test voluntarily.

>
> Signed-off-by: Sean Young <sean-hENCXIMQXOg@public.gmane.org>

Acked-by: Sean Wang <sean.wang-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> ---
>  drivers/media/rc/mtk-cir.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/media/rc/mtk-cir.c b/drivers/media/rc/mtk-cir.c
> index 9dc467ebae24..8027181de985 100644
> --- a/drivers/media/rc/mtk-cir.c
> +++ b/drivers/media/rc/mtk-cir.c
> @@ -35,6 +35,11 @@
>  /* Fields containing pulse width data */
>  #define MTK_WIDTH_MASK           (GENMASK(7, 0))
>
> +/* IR threshold */
> +#define MTK_IRTHD               0x14
> +#define MTK_DG_CNT_MASK                 (GENMASK(12, 8))
> +#define MTK_DG_CNT(x)           ((x) << 8)
> +
>  /* Bit to enable interrupt */
>  #define MTK_IRINT_EN             BIT(0)
>
> @@ -400,6 +405,9 @@ static int mtk_ir_probe(struct platform_device *pdev)
>         mtk_w32_mask(ir, val, ir->data->fields[MTK_HW_PERIOD].mask,
>                      ir->data->fields[MTK_HW_PERIOD].reg);
>
> +       /* Set de-glitch counter */
> +       mtk_w32_mask(ir, MTK_DG_CNT(1), MTK_DG_CNT_MASK, MTK_IRTHD);
> +
>         /* Enable IR and PWM */
>         val = mtk_r32(ir, MTK_CONFIG_HIGH_REG);
>         val |= MTK_OK_COUNT(ir->data->ok_count) |  MTK_PWM_EN | MTK_IR_EN;
> --
> 2.21.0
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
