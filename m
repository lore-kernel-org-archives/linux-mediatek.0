From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] Staging: mt7621-dma: mtk-hsdma: fix a coding style issue
Date: Wed, 3 Jul 2019 18:32:32 +0200
Message-ID: <20190703163232.GA29325@kroah.com>
References: <20190702080632.27470-1-fatihaltinpinar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190702080632.27470-1-fatihaltinpinar@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: fatihaltinpinar@gmail.com
Cc: matthias.bgg@gmail.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Tue, Jul 02, 2019 at 11:06:32AM +0300, fatihaltinpinar@gmail.com wrote:
> From: Fatih ALTINPINAR <fatihaltinpinar@gmail.com>
> 
> Fixed a coding style issue. Removed curly brackets of an one
> line if statement.
> 
> Signed-off-by: Fatih ALTINPINAR <fatihaltinpinar@gmail.com>
> ---
>  drivers/staging/mt7621-dma/mtk-hsdma.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/mt7621-dma/mtk-hsdma.c b/drivers/staging/mt7621-dma/mtk-hsdma.c
> index 0fbb9932d6bb..a58725dd2611 100644
> --- a/drivers/staging/mt7621-dma/mtk-hsdma.c
> +++ b/drivers/staging/mt7621-dma/mtk-hsdma.c
> @@ -664,9 +664,8 @@ static int mtk_hsdma_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  
>  	hsdma = devm_kzalloc(&pdev->dev, sizeof(*hsdma), GFP_KERNEL);
> -	if (!hsdma) {
> +	if (!hsdma)
>  		return -EINVAL;
> -	}
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	base = devm_ioremap_resource(&pdev->dev, res);

This change is already in my tree, always be sure to work against the
proper kernel tree for doing new development.

thanks,

greg k-h
