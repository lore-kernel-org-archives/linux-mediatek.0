From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 1/2] mfd: mt6397: Use PLATFORM_DEVID_NONE macro instead of
 -1
Date: Tue, 18 Jun 2019 23:16:01 +0200
Message-ID: <15f5e052-69f5-274b-20e9-3ccf71b6651a@gmail.com>
References: <20190618154347.16991-1-fparent@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190618154347.16991-1-fparent@baylibre.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Fabien Parent <fparent@baylibre.com>, lee.jones@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org



On 18/06/2019 17:43, Fabien Parent wrote:
> Use the correct macro when adding the MFD devices instead of using
> directly '-1' value.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>  drivers/mfd/mt6397-core.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> index 337bcccdb914..190ed86ad93e 100644
> --- a/drivers/mfd/mt6397-core.c
> +++ b/drivers/mfd/mt6397-core.c
> @@ -299,9 +299,9 @@ static int mt6397_probe(struct platform_device *pdev)
>  		if (ret)
>  			return ret;
>  
> -		ret = devm_mfd_add_devices(&pdev->dev, -1, mt6323_devs,
> -					   ARRAY_SIZE(mt6323_devs), NULL,
> -					   0, pmic->irq_domain);
> +		ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE,
> +					   mt6323_devs, ARRAY_SIZE(mt6323_devs),
> +					   NULL, 0, pmic->irq_domain);
>  		break;
>  
>  	case MT6397_CID_CODE:
> @@ -314,9 +314,9 @@ static int mt6397_probe(struct platform_device *pdev)
>  		if (ret)
>  			return ret;
>  
> -		ret = devm_mfd_add_devices(&pdev->dev, -1, mt6397_devs,
> -					   ARRAY_SIZE(mt6397_devs), NULL,
> -					   0, pmic->irq_domain);
> +		ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE,
> +					   mt6397_devs, ARRAY_SIZE(mt6397_devs),
> +					   NULL, 0, pmic->irq_domain);
>  		break;
>  
>  	default:
> 
