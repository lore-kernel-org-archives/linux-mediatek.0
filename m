From: John Crispin <blogic@openwrt.org>
Subject: Re: [PATCH] mfd: mt6397: irq domain should initialize before
 mfd_add_devices()
Date: Wed, 30 Mar 2016 11:18:19 +0200
Message-ID: <56FB99DB.6010901@openwrt.org>
References: <1459322708-21363-1-git-send-email-henryc.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459322708-21363-1-git-send-email-henryc.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Henry Chen <henryc.chen@mediatek.com>, Lee Jones <lee.jones@linaro.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, Flora Fu <flora.fu@mediatek.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Hi,

small nitpick inline

On 30/03/2016 09:25, Henry Chen wrote:
> Some sub driver like RTC module need irq domain from parent to create
> irq mapping when driver initialize. so move mt6397_irq_init() before
> mfd_add_devices().
> 
> Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
> ---
> This patch fixed the below warning based on "Linux kernel v4.6-rc1"
> WARNING: CPU: 1 PID: 132 at kernel/mediatek/kernel/irq/irqdomain.c:471
> irq_create_mapping+0xc4/0xd0
> ---
>  drivers/mfd/mt6397-core.c | 37 ++++++++++++++++++++++---------------
>  1 file changed, 22 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> index 8e8d932..a879223 100644
> --- a/drivers/mfd/mt6397-core.c
> +++ b/drivers/mfd/mt6397-core.c
> @@ -270,22 +270,36 @@ static int mt6397_probe(struct platform_device *pdev)
>  		goto fail_irq;
>  	}
>  
> +	pmic->irq = platform_get_irq(pdev, 0);
> +
>  	switch (id & 0xff) {
>  	case MT6323_CID_CODE:
> -		pmic->int_con[0] = MT6323_INT_CON0;
> -		pmic->int_con[1] = MT6323_INT_CON1;
> -		pmic->int_status[0] = MT6323_INT_STATUS0;
> -		pmic->int_status[1] = MT6323_INT_STATUS1;
> +		if (pmic->irq > 0) {

should this not be

		if (pmic->irq >= 0) {

i think the code before your patch was wrong as linux irqs start with 0.

	John


> +			pmic->int_con[0] = MT6323_INT_CON0;
> +			pmic->int_con[1] = MT6323_INT_CON1;
> +			pmic->int_status[0] = MT6323_INT_STATUS0;
> +			pmic->int_status[1] = MT6323_INT_STATUS1;
> +			ret = mt6397_irq_init(pmic);
> +			if (ret)
> +				return ret;
> +		}
> +
>  		ret = mfd_add_devices(&pdev->dev, -1, mt6323_devs,
>  				ARRAY_SIZE(mt6323_devs), NULL, 0, NULL);
>  		break;
>  
>  	case MT6397_CID_CODE:
>  	case MT6391_CID_CODE:
> -		pmic->int_con[0] = MT6397_INT_CON0;
> -		pmic->int_con[1] = MT6397_INT_CON1;
> -		pmic->int_status[0] = MT6397_INT_STATUS0;
> -		pmic->int_status[1] = MT6397_INT_STATUS1;
> +		if (pmic->irq > 0) {
> +			pmic->int_con[0] = MT6397_INT_CON0;
> +			pmic->int_con[1] = MT6397_INT_CON1;
> +			pmic->int_status[0] = MT6397_INT_STATUS0;
> +			pmic->int_status[1] = MT6397_INT_STATUS1;
> +			ret = mt6397_irq_init(pmic);
> +			if (ret)
> +				return ret;
> +		}
> +
>  		ret = mfd_add_devices(&pdev->dev, -1, mt6397_devs,
>  				ARRAY_SIZE(mt6397_devs), NULL, 0, NULL);
>  		break;
> @@ -296,13 +310,6 @@ static int mt6397_probe(struct platform_device *pdev)
>  		break;
>  	}
>  
> -	pmic->irq = platform_get_irq(pdev, 0);
> -	if (pmic->irq > 0) {
> -		ret = mt6397_irq_init(pmic);
> -		if (ret)
> -			return ret;
> -	}
> -
>  fail_irq:
>  	if (ret) {
>  		irq_domain_remove(pmic->irq_domain);
> 
