From: Eddie Huang <eddie.huang@mediatek.com>
Subject: Re: [PATCH v2 2/2] clk: reset: Modify reset-controller driver
Date: Mon, 29 Apr 2019 14:35:51 +0800
Message-ID: <1556519751.15195.5.camel@mtksdaap41>
References: <1556262618-14281-1-git-send-email-yong.liang@mediatek.com>
 <1556262618-14281-2-git-send-email-yong.liang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1556262618-14281-2-git-send-email-yong.liang@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Yong Liang <yong.liang@mediatek.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, JamesJJ Liao =?UTF-8?Q?=28=E5=BB=96=E5=BB=BA=E6=99=BA=29?= <jamesjj.liao@mediatek.com>, "drinkcat@chromium.org" <drinkcat@chromium.org>, Weiyi Lu =?UTF-8?Q?=28=E5=91=82=E5=A8=81=E5=84=80=29?= <Weiyi.Lu@mediatek.com>, "chunhui.dai@mediatek.com" <chunhui.dai@mediatek.com>, "sboyd@kernel.org" <sboyd@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "jasu@njomotys.info" <jasu@njomotys.info>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Owen Chen =?UTF-8?Q?=28=E9=99=B3=E5=B3=BB=E6=96=8C=29?= <owen.chen@mediatek.com>, Erin Lo =?UTF-8?Q?=28=E7=BE=85=E9=9B=85=E9=BD=A1=29?= <erin.lo@mediatek.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Yong,

Please add reset controller maintainer in this mailing loop
  Philipp Zabel <p.zabel@pengutronix.de>


On Fri, 2019-04-26 at 15:10 +0800, Yong Liang wrote:
> From: "yong.liang" <yong.liang@mediatek.com>
> 
> Set reset signal by a register and clear reset signal by
> another register for 8183.

You should move your signed-off-by here, then add --- in next line to
avoid your notes appear in commit message when use git am to apply this
patch

> Base on https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git branch clk-next and https://patchwork.kernel.org/patch/10856987/
> 
> Changes in patch v2:
> Rollback modify for "_tuner_en_bit, _pcw_reg, _pcw_shift,"
> in drivers/clk/mediatek/clk-mt8183.c
> 
> Signed-off-by: yong.liang <yong.liang@mediatek.com>
> ---
>  drivers/clk/mediatek/clk-mt8183.c                  |   10 ++-
>  drivers/clk/mediatek/clk-mtk.h                     |    3 +
>  drivers/clk/mediatek/reset.c                       |   53 +++++++++++-
>  .../dt-bindings/reset-controller/mt8183-resets.h   |   89 ++++++++++++++++++++
>  4 files changed, 151 insertions(+), 4 deletions(-)
>  create mode 100644 include/dt-bindings/reset-controller/mt8183-resets.h
> 
> diff --git a/drivers/clk/mediatek/clk-mt8183.c b/drivers/clk/mediatek/clk-mt8183.c
> index 9d86510..cda5b91 100644
> --- a/drivers/clk/mediatek/clk-mt8183.c
> +++ b/drivers/clk/mediatek/clk-mt8183.c
> @@ -1156,6 +1156,7 @@ static int clk_mt8183_apmixed_probe(struct platform_device *pdev)
>  {
>  	struct clk_onecell_data *clk_data;
>  	struct device_node *node = pdev->dev.of_node;
> +	int r;
>  
>  	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
>  
> @@ -1164,7 +1165,14 @@ static int clk_mt8183_apmixed_probe(struct platform_device *pdev)
>  	mtk_clk_register_gates(node, apmixed_clks, ARRAY_SIZE(apmixed_clks),
>  		clk_data);
>  
> -	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +	if (r)
> +		dev_err(&pdev->dev,
> +			"%s(): could not register clock provider: %d\n",__func__, r);
> +
> +	mtk_register_reset_controller_set_clr(node, 4, 0x120);
> +
> +	return r;
>  }

You should call mtk_register_reset_controller_set_clr function in
clk_mt8183_infra_probe

Eddie
