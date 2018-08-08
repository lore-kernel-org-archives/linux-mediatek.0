From: Sean Wang <sean.wang@mediatek.com>
Subject: Re: [PATCH] soc: mediatek: pwrap: use true and false for boolean
 values
Date: Wed, 8 Aug 2018 15:35:42 +0800
Message-ID: <1533713742.3472.231.camel@mtkswgap22>
References: <20180805010201.GA7320@embeddedor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180805010201.GA7320@embeddedor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Sat, 2018-08-04 at 20:02 -0500, Gustavo A. R. Silva wrote:
> Return statements in functions returning bool should use true or false
> instead of an integer value.
> 
> This issue was detected with the help of Coccinelle.
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>  drivers/soc/mediatek/mtk-pmic-wrap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
> index 4e931fd..932470a 100644
> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> @@ -1096,7 +1096,7 @@ static bool pwrap_is_pmic_cipher_ready(struct pmic_wrapper *wrp)
>  	ret = pwrap_read(wrp, wrp->slave->dew_regs[PWRAP_DEW_CIPHER_RDY],
>  			 &rdata);
>  	if (ret)
> -		return 0;
> +		return false;
>  

Acked-by: Sean Wang <sean.wang@mediatek.com>

>  	return rdata == 1;
>  }
