From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] drm/mediatek: fix error handling
Date: Sun, 3 Jul 2016 07:51:31 +0200
Message-ID: <d49277ce-e45c-a706-0f3a-e0d6e5fc8891@gmail.com>
References: <1467524228-12546-1-git-send-email-christophe.jaillet@wanadoo.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1467524228-12546-1-git-send-email-christophe.jaillet@wanadoo.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, airlied@linux.ie, ck.hu@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org



On 07/03/2016 07:37 AM, Christophe JAILLET wrote:
> This is likely that checking 'phy_provider' instead of 'phy' is
> expected here.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/gpu/drm/mediatek/mtk_mipi_tx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_mipi_tx.c b/drivers/gpu/drm/mediatek/mtk_mipi_tx.c
> index cf8f38d..1c366f8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_mipi_tx.c
> +++ b/drivers/gpu/drm/mediatek/mtk_mipi_tx.c
> @@ -431,7 +431,7 @@ static int mtk_mipi_tx_probe(struct platform_device *pdev)
>  	phy_set_drvdata(phy, mipi_tx);
>
>  	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> -	if (IS_ERR(phy)) {
> +	if (IS_ERR(phy_provider)) {

Dan already send a patch for that:
http://www.spinics.net/lists/dri-devel/msg112031.html

Regards,
Matthias

>  		ret = PTR_ERR(phy_provider);
>  		return ret;
>  	}
>
