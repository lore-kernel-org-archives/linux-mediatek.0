From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH V5 10/11] soc: mediatek: PMIC wrap: add mt6323 slave
 support
Date: Thu, 11 Feb 2016 12:27:41 +0100
Message-ID: <56BC702D.8030806@gmail.com>
References: <1454841778-35529-1-git-send-email-blogic@openwrt.org>
 <1454841778-35529-11-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454841778-35529-11-git-send-email-blogic@openwrt.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Crispin <blogic@openwrt.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Henry Chen <henryc.chen@mediatek.com>, Thierry Reding <treding@nvidia.com>, Flora Fu <flora.fu@mediatek.com>, Steven Liu <steven.liu@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org



On 07/02/16 11:42, John Crispin wrote:
> Add support for MT6323 slaves. This PMIC can be found on MT2701 and MT7623
> EVB. The only function that we need to touch is pwrap_init_cipher().
>
> Signed-off-by: John Crispin <blogic@openwrt.org>
> ---
>   drivers/soc/mediatek/mtk-pmic-wrap.c |   47 ++++++++++++++++++++++++++++++++++
>   1 file changed, 47 insertions(+)
>
> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
> index 2628271..5fbdd5c 100644
> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> @@ -91,6 +91,31 @@ enum dew_regs {
>   	PWRAP_DEW_CIPHER_RDY,
>   	PWRAP_DEW_CIPHER_MODE,
>   	PWRAP_DEW_CIPHER_SWRST,
> +
> +	/* MT6323 only regs */
> +	PWRAP_DEW_CRC_SWRST,
> +	PWRAP_DEW_CIPHER_EN,
> +	PWRAP_DEW_RDDMY_NO,
> +	PWRAP_DEW_RDATA_DLY_SEL,
> +};

We just use PWRAP_DEW_CIPHER_EN, right?
I think it makes the code more readable if we just declare the registers 
we actually need.

Thanks,
Matthias
