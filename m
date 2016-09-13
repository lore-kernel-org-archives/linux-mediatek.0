From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] thermal: mtk_thermal: Check return value of
 devm_thermal_zone_of_sensor_register
Date: Tue, 13 Sep 2016 10:46:24 +0200
Message-ID: <bc716480-59f6-7f6f-6a18-dca7f0296015@gmail.com>
References: <1473240292-10116-1-git-send-email-axel.lin@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1473240292-10116-1-git-send-email-axel.lin@ingics.com>
Sender: linux-pm-owner@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>, Zhang Rui <rui.zhang@intel.com>
Cc: Eduardo Valentin <edubezval@gmail.com>, linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org



On 07/09/16 11:24, Axel Lin wrote:
> devm_thermal_zone_of_sensor_register can fail, so check it's return value.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
>  drivers/thermal/mtk_thermal.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
> index 7b233c7..34169c3 100644
> --- a/drivers/thermal/mtk_thermal.c
> +++ b/drivers/thermal/mtk_thermal.c
> @@ -584,6 +584,7 @@ static int mtk_thermal_probe(struct platform_device *pdev)
>  	struct resource *res;
>  	const struct of_device_id *of_id;
>  	u64 auxadc_phys_base, apmixed_phys_base;
> +	struct thermal_zone_device *tzdev;
>
>  	mt = devm_kzalloc(&pdev->dev, sizeof(*mt), GFP_KERNEL);
>  	if (!mt)
> @@ -666,11 +667,17 @@ static int mtk_thermal_probe(struct platform_device *pdev)
>
>  	platform_set_drvdata(pdev, mt);
>
> -	devm_thermal_zone_of_sensor_register(&pdev->dev, 0, mt,
> -					     &mtk_thermal_ops);
> +	tzdev = devm_thermal_zone_of_sensor_register(&pdev->dev, 0, mt,
> +						     &mtk_thermal_ops);
> +	if (IS_ERR(tzdev)) {
> +		ret = PTR_ERR(tzdev);
> +		goto err_disable_clk_peri_therm;
> +	}
>
>  	return 0;
>
> +err_disable_clk_peri_therm:
> +	clk_disable_unprepare(mt->clk_peri_therm);
>  err_disable_clk_auxadc:
>  	clk_disable_unprepare(mt->clk_auxadc);
>
>
