From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 4/9] drm/mediatek: fix the rate and divder of hdmi phy for
 MT2701
Date: Wed, 9 Jan 2019 17:54:13 +0100
Message-ID: <a3e37dde-2bab-be02-27ec-d15784bd560b@gmail.com>
References: <1546585439-30455-1-git-send-email-chunhui.dai@mediatek.com>
 <1546585439-30455-5-git-send-email-chunhui.dai@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1546585439-30455-5-git-send-email-chunhui.dai@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: chunhui dai <chunhui.dai@mediatek.com>, --to=Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, CK Hu <ck.hu@mediatek.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, Colin Ian King <colin.king@canonical.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, srv_heupstream@mediatek.com, bibby.hsieh@mediatek.com, jamesjj.liao@mediatek.com, jitao.shi@mediatek.com
List-Id: linux-mediatek@lists.infradead.org



On 04/01/2019 08:03, chunhui dai wrote:
> fix the rate and divder of hdmi phy for MT2701.

This is a bug? Then we would need a fixes tag.
Otherwise you should explain in the commit, that you need to change the
calculation due to previous commits.

Regards,
Matthias

> 
> Signed-off-by: chunhui dai <chunhui.dai@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c b/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
> index a28a32d..10b6235 100644
> --- a/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
> +++ b/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
> @@ -114,8 +114,8 @@ static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>  
>  	if (rate <= 64000000)
>  		pos_div = 3;
> -	else if (rate <= 12800000)
> -		pos_div = 1;
> +	else if (rate <= 128000000)
> +		pos_div = 2;
>  	else
>  		pos_div = 1;
>  
> 
