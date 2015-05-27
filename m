From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH] mfd: mediatek: Add GPIO sub module support into mfd.
Date: Wed, 27 May 2015 11:28:44 +0200
Message-ID: <20150527092844.GV6325@pengutronix.de>
References: <1432717835-16398-1-git-send-email-hongzhou.yang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1432717835-16398-1-git-send-email-hongzhou.yang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hongzhou Yang <hongzhou.yang@mediatek.com>
Cc: Lee Jones <lee.jones@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, dandan.he@mediatek.com, Samuel Ortiz <sameo@linux.intel.com>, srv_heupstream@mediatek.com, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, yingjoe.chen@mediatek.com, eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

The subject lacks the mt6397 keyword. In the subject you say this is
about GPIO, but the patch seems to be about pinctrl.

On Wed, May 27, 2015 at 02:10:35AM -0700, Hongzhou Yang wrote:
> Base on Lee Jones' comment, change pinctrl subnode name.

This is the changelog, should be below the three --- so that git am
doesn't add this to the commit message

> 
> ---
> Register pinctrl subnode into 6397 mfd cell.

This is the commit message, should be above the three ---

> 
> Signed-off-by: Hongzhou Yang <hongzhou.yang@mediatek.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/mfd/mt6397-core.c |    3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> index 09bc780..e50a9bc 100644
> --- a/drivers/mfd/mt6397-core.c
> +++ b/drivers/mfd/mt6397-core.c
> @@ -34,6 +34,9 @@ static const struct mfd_cell mt6397_devs[] = {
>  	}, {
>  		.name = "mt6397-clk",
>  		.of_compatible = "mediatek,mt6397-clk",
> +	}, {
> +		.name = "mt6397-pinctrl",
> +		.of_compatible = "mediatek,mt6397-pinctrl",
>  	},
>  };
>  

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
