From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH V4 11/11] soc: mediatek: PMIC wrap: add MT2701/7623
 support
Date: Mon, 1 Feb 2016 12:25:14 +0100
Message-ID: <56AF409A.2040705@gmail.com>
References: <1453894149-44127-1-git-send-email-blogic@openwrt.org>
 <1453894149-44127-11-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453894149-44127-11-git-send-email-blogic@openwrt.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Crispin <blogic@openwrt.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Henry Chen <henryc.chen@mediatek.com>, Thierry Reding <treding@nvidia.com>, Flora Fu <flora.fu@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On 27/01/16 12:29, John Crispin wrote:

[...]

>
> +static int pwrap_mt2701_init_reg_clock(struct pmic_wrapper *wrp)
> +{
> +	switch (wrp->slave->type) {
> +	case PMIC_MT6397:
> +		pwrap_writel(wrp, 0xc, PWRAP_RDDMY);
> +		pwrap_writel(wrp, 0x4, PWRAP_CSHEXT_WRITE);
> +		pwrap_writel(wrp, 0x0, PWRAP_CSHEXT_READ);
> +		pwrap_writel(wrp, 0x2, PWRAP_CSLEXT_START);
> +		pwrap_writel(wrp, 0x2, PWRAP_CSLEXT_END);
> +		break;
> +
> +	case PMIC_MT6323:
> +		pwrap_writel(wrp, 0x8, PWRAP_RDDMY);
> +		pwrap_dew_write(wrp, PWRAP_DEW_RDDMY_NO, 0x8);
> +		pwrap_writel(wrp, 0x5, PWRAP_CSHEXT_WRITE);
> +		pwrap_writel(wrp, 0x0, PWRAP_CSHEXT_READ);
> +		pwrap_writel(wrp, 0x2, PWRAP_CSLEXT_START);
> +		pwrap_writel(wrp, 0x2, PWRAP_CSLEXT_END);
> +		break;
> +	}
> +
> +	return 0;
> +}
> +

I forgot this:
So mt2701 can be used with both PMICs? Just wondering, as from what I 
know, SoC and PMIC a tightly coupled.

In general this series looks quite good to me.

Regards,
Matthias
