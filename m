From: Sean Wang <sean.wang@mediatek.com>
Subject: Re: [resend PATCH v4 5/5] drm: mediatek: Omit warning on probe defers
Date: Wed, 18 Jul 2018 11:04:17 +0800
Message-ID: <1531883057.8953.87.camel@mtkswgap22>
References: <20180717220328.792-1-matthias.bgg@kernel.org>
 <20180717220328.792-6-matthias.bgg@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180717220328.792-6-matthias.bgg@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: matthias.bgg@kernel.org
Cc: mark.rutland@arm.com, airlied@linux.ie, mturquette@baylibre.com, dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com, ulrich.hecht+renesas@gmail.com, lee.jones@linaro.org, linux-clk@vger.kernel.org, linux@armlinux.org.uk, ck.hu@mediatek.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, Matthias Brugger <mbrugger@suse.com>, gregkh@linuxfoundation.org, rdunlap@infradead.org, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, pi-cheng.chen@linaro.org, davem@davemloft.net
List-Id: linux-mediatek@lists.infradead.org

On Wed, 2018-07-18 at 00:03 +0200, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> It can happen that the clock drivers wasn't probed before the
> ddp driver gets invoked. The driver used to omit a warning
> that the driver failed to get the clocks. Omit this error on
> the defered probe path.
> 

so if we list drm device as a child device of mmsys we don't need the
patch, and that make more sense.

> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> Acked-by: CK Hu <ck.hu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> index bafc5c77c4fb..6b399348a2dc 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> @@ -374,7 +374,8 @@ static int mtk_ddp_probe(struct platform_device *pdev)
>  
>  	ddp->clk = devm_clk_get(dev, NULL);
>  	if (IS_ERR(ddp->clk)) {
> -		dev_err(dev, "Failed to get clock\n");
> +		if (PTR_ERR(ddp->clk) != -EPROBE_DEFER)
> +			dev_err(dev, "Failed to get clock\n");
>  		return PTR_ERR(ddp->clk);
>  	}
>  
