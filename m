From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH -next 08/15] thermal: tsens: use devm_platform_ioremap_resource()
 to simplify code
Date: Thu, 5 Sep 2019 11:45:30 +0530
Message-ID: <CAHLCerOVuNEAkCggBoDU4NgbzhTVxpdJXeTXVrTs5tp7ZVtSMg@mail.gmail.com>
References: <20190904122939.23780-1-yuehaibing@huawei.com> <20190904122939.23780-9-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190904122939.23780-9-yuehaibing@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: YueHaibing <yuehaibing@huawei.com>
Cc: miquel.raynal@bootlin.com, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Eric Anholt <eric@anholt.net>, wahrenst@gmx.net, f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com, Markus Mayer <mmayer@broadcom.com>, computersforpeace@gmail.com, gregory.0xf0@gmail.com, Matthias Brugger <matthias.bgg@gmail.com>, Andy Gross <agross@kernel.org>, Heiko Stuebner <heiko@sntech.de>, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, Marc Gonzalez <marc.w.gonzalez@free.fr>, mans@mansr.com, talel@amazon.com, Jun Nie <jun.nie@linaro.org>, Shawn Guo <shawnguo@kernel.org>, phil@raspberrypi.org, gregkh@linuxfoundation.org, david.hernandezsanchez@st.com, horms+renesas@verge.net.au, wsa+renesas@sang-engineering.c
List-Id: linux-mediatek@lists.infradead.org

On Wed, Sep 4, 2019 at 6:05 PM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Acked-by: Amit Kucheria <amit.kucheria@linaro.org>

> ---
>  drivers/thermal/qcom/tsens-common.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/thermal/qcom/tsens-common.c b/drivers/thermal/qcom/tsens-common.c
> index 528df88..43ce4fb 100644
> --- a/drivers/thermal/qcom/tsens-common.c
> +++ b/drivers/thermal/qcom/tsens-common.c
> @@ -155,7 +155,6 @@ int __init init_common(struct tsens_priv *priv)
>  {
>         void __iomem *tm_base, *srot_base;
>         struct device *dev = priv->dev;
> -       struct resource *res;
>         u32 enabled;
>         int ret, i, j;
>         struct platform_device *op = of_find_device_by_node(priv->dev->of_node);
> @@ -166,8 +165,7 @@ int __init init_common(struct tsens_priv *priv)
>         if (op->num_resources > 1) {
>                 /* DT with separate SROT and TM address space */
>                 priv->tm_offset = 0;
> -               res = platform_get_resource(op, IORESOURCE_MEM, 1);
> -               srot_base = devm_ioremap_resource(&op->dev, res);
> +               srot_base = devm_platform_ioremap_resource(op, 1);
>                 if (IS_ERR(srot_base)) {
>                         ret = PTR_ERR(srot_base);
>                         goto err_put_device;
> @@ -184,8 +182,7 @@ int __init init_common(struct tsens_priv *priv)
>                 priv->tm_offset = 0x1000;
>         }
>
> -       res = platform_get_resource(op, IORESOURCE_MEM, 0);
> -       tm_base = devm_ioremap_resource(&op->dev, res);
> +       tm_base = devm_platform_ioremap_resource(op, 0);
>         if (IS_ERR(tm_base)) {
>                 ret = PTR_ERR(tm_base);
>                 goto err_put_device;
> --
> 2.7.4
>
>
