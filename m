From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] Staging: mt7621-mmc: Use DIV_ROUND_UP in function
 msdc_set_mclk
Date: Tue, 16 Apr 2019 13:44:27 +0200
Message-ID: <20190416114427.GA17623@kroah.com>
References: <20190403151608.27326-1-madhumithabiw@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190403151608.27326-1-madhumithabiw@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Madhumitha Prabakaran <madhumithabiw@gmail.com>
Cc: matthias.bgg@gmail.com, devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Wed, Apr 03, 2019 at 10:16:08AM -0500, Madhumitha Prabakaran wrote:
> Use DIV_ROUND_UP to make code simple and more understandable.
> 
> Signed-off-by: Madhumitha Prabakaran <madhumithabiw@gmail.com>
> ---
>  drivers/staging/mt7621-mmc/sd.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/mt7621-mmc/sd.c b/drivers/staging/mt7621-mmc/sd.c
> index 4b26ec896a96..b12ed2c988fd 100644
> --- a/drivers/staging/mt7621-mmc/sd.c
> +++ b/drivers/staging/mt7621-mmc/sd.c
> @@ -240,7 +240,7 @@ static void msdc_set_mclk(struct msdc_host *host, int ddr, unsigned int hz)
>  			div  = 1;         /* mean div = 1/4 */
>  			sclk = hclk >> 2; /* sclk = clk / 4 */
>  		} else {
> -			div  = (hclk + ((hz << 2) - 1)) / (hz << 2);
> +			div  = DIV_ROUND_UP(hclk, (hz << 2));
>  			sclk = (hclk >> 2) / div;
>  		}
>  	} else if (hz >= hclk) { /* bug fix */
> @@ -253,7 +253,7 @@ static void msdc_set_mclk(struct msdc_host *host, int ddr, unsigned int hz)
>  			div  = 0;         /* mean div = 1/2 */
>  			sclk = hclk >> 1; /* sclk = clk / 2 */
>  		} else {
> -			div  = (hclk + ((hz << 2) - 1)) / (hz << 2);
> +			div  = DIV_ROUND_UP(hclk, (hz << 2));
>  			sclk = (hclk >> 2) / div;
>  		}
>  	}

This file is no longer in the kernel tree :(
