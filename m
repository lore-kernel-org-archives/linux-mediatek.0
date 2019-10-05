From: Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: Re: [PATCH v2 4/4] ASoC: mt8183: fix audio playback
 slowly after playback during bootup
Date: Sat, 5 Oct 2019 14:07:31 +0800
Message-ID: <1570255651.29077.26.camel@mtksdaap41>
References: <1569580317-21181-1-git-send-email-jiaxin.yu@mediatek.com>
 <1569580317-21181-5-git-send-email-jiaxin.yu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1569580317-21181-5-git-send-email-jiaxin.yu@mediatek.com>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: mark.rutland@arm.com, alsa-devel@alsa-project.org, yong.liang@mediatek.com, robh+dt@kernel.org, lgirdwood@gmail.com, tzungbi@google.com, broonie@kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, eason.yen@mediatek.com, wim@linux-watchdog.org, linux@roeck-us.net
List-Id: linux-mediatek@lists.infradead.org

On Fri, 2019-09-27 at 18:31 +0800, Jiaxin Yu wrote:
> Before regmap_reinit_cache we must reset audio regs as default values.
> So we use reset controller unit(toprgu) to reset audio hw.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>


This one looks good to me. You could add this if you want


Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>


Joe.C

> ---
>  sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
> index 4a31106d3471..721632386a50 100644
> --- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
> +++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
> @@ -11,6 +11,7 @@
>  #include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/reset.h>
>  
>  #include "mt8183-afe-common.h"
>  #include "mt8183-afe-clk.h"
> @@ -1089,6 +1090,7 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
>  	struct mtk_base_afe *afe;
>  	struct mt8183_afe_private *afe_priv;
>  	struct device *dev;
> +	struct reset_control *rstc;
>  	int i, irq_id, ret;
>  
>  	afe = devm_kzalloc(&pdev->dev, sizeof(*afe), GFP_KERNEL);
> @@ -1126,6 +1128,19 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	rstc = devm_reset_control_get(dev, "audiosys");
> +	if (IS_ERR(rstc)) {
> +		ret = PTR_ERR(rstc);
> +		dev_err(dev, "could not get audiosys reset:%d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = reset_control_reset(rstc);
> +	if (ret) {
> +		dev_err(dev, "failed to trigger audio reset:%d\n", ret);
> +		return ret;
> +	}
> +
>  	/* enable clock for regcache get default value from hw */
>  	afe_priv->pm_runtime_bypass_reg_ctl = true;
>  	pm_runtime_get_sync(&pdev->dev);
