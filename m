From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH] mmc: mediatek: Fixed size in dma_free_coherent
Date: Mon, 29 May 2017 16:43:19 +0200
Message-ID: <CAPDyKFqdH=PuLiFWitYRCuz+1oWwz5ESA2KY314-eTunih0e5Q@mail.gmail.com>
References: <1495612432-16669-1-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <1495612432-16669-1-git-send-email-narmstrong@baylibre.com>
Sender: linux-mmc-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Phong LE <ple@baylibre.com>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-mediatek@lists.infradead.org

On 24 May 2017 at 09:53, Neil Armstrong <narmstrong@baylibre.com> wrote:
> From: Phong LE <ple@baylibre.com>
>
> The dma gpd dma_free_coherent call size in invalid.
>
> Fixes: 208489032bdd ("mmc: mediatek: Add Mediatek MMC driver")
> Signed-off-by: Phong LE <ple@baylibre.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Thanks, applied for next!

Kind regards
Uffe

> ---
>  drivers/mmc/host/mtk-sd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 5c1e178..5a672a5 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -1774,7 +1774,7 @@ static int msdc_drv_remove(struct platform_device *pdev)
>         pm_runtime_disable(host->dev);
>         pm_runtime_put_noidle(host->dev);
>         dma_free_coherent(&pdev->dev,
> -                       sizeof(struct mt_gpdma_desc),
> +                       2 * sizeof(struct mt_gpdma_desc),
>                         host->dma.gpd, host->dma.gpd_addr);
>         dma_free_coherent(&pdev->dev, MAX_BD_NUM * sizeof(struct mt_bdma_desc),
>                         host->dma.bd, host->dma.bd_addr);
> --
> 2.7.4
>
