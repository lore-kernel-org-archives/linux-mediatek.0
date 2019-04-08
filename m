From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH V8 3/5] drm/mediatek: using new factor for tvdpll in
 MT2701
Date: Mon, 8 Apr 2019 11:54:42 +0800
Message-ID: <1554695682.25248.2.camel@mtksdaap41>
References: <20190402093605.82004-1-wangyan.wang@mediatek.com>
         <20190402093605.82004-4-wangyan.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190402093605.82004-4-wangyan.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: wangyan wang <wangyan.wang@mediatek.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, chunhui dai <chunhui.dai@mediatek.com>, Colin Ian King <colin.king@canonical.com>, Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, srv_heupstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

Hi, Wangyan:

On Tue, 2019-04-02 at 17:36 +0800, wangyan wang wrote:
> From: Wangyan Wang <wangyan.wang@mediatek.com>
> 
> This is the second step to make MT2701 HDMI stable.
> The factor depends on the divider of DPI in MT2701, therefore,
> we should fix this factor to the right and new one.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Wangyan Wang <wangyan.wang@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 69c6e42dad6b..4a2f4a650494 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -662,13 +662,11 @@ static unsigned int mt8173_calculate_factor(int clock)
>  static unsigned int mt2701_calculate_factor(int clock)
>  {
>  	if (clock <= 64000)
> -		return 16;
> -	else if (clock <= 128000)
> -		return 8;
> -	else if (clock <= 256000)
>  		return 4;
> -	else
> +	else if (clock <= 128000)
>  		return 2;
> +	else
> +		return 1;
>  }
>  
>  static const struct mtk_dpi_conf mt8173_conf = {
