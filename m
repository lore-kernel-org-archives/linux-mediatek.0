From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] pwm: Add MediaTek MT8183 display PWM driver support
Date: Wed, 16 Jan 2019 11:25:18 +0100
Message-ID: <43c39979-e5be-0f4a-51ec-d89ea2b8bfff@gmail.com>
References: <20190116075252.24124-1-jitao.shi@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190116075252.24124-1-jitao.shi@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jitao Shi <jitao.shi@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, David Airlie <airlied@linux.ie>
Cc: Thierry Reding <treding@nvidia.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, Inki Dae <inki.dae@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>, Sean Paul <seanpaul@chromium.org>, Vincent Palatin <vpalatin@chromium.org>, Andy Yan <andy.yan@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>, Russell King <rmk+kernel@arm.linux.org.uk>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, yingjoe.chen@mediatek.com, eddie.huang@mediatek.com, sj.huang@mediatek.com, bibby.hsieh@mediatek.com, ck.hu@mediatek.com
List-Id: linux-mediatek@lists.infradead.org



On 16/01/2019 08:52, Jitao Shi wrote:
> Use the mtk_pwm_data struction to define different registers
> and add MT8183 specific register operations, such as MT8183
> have commit register, needs to enable double buffer

has_commit is set to false, so I suppose you mean that MT8183 does not have a
commit register.

Regards,
Matthias

> before writing register, and needs to select commit mode
> and use PWM_PERIOD/PWM_HIGH_WIDTH.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  drivers/pwm/pwm-mtk-disp.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
> index 893940d45f0d..15803c71fe80 100644
> --- a/drivers/pwm/pwm-mtk-disp.c
> +++ b/drivers/pwm/pwm-mtk-disp.c
> @@ -277,10 +277,21 @@ static const struct mtk_pwm_data mt8173_pwm_data = {
>  	.commit_mask = 0x1,
>  };
>  
> +static const struct mtk_pwm_data mt8183_pwm_data = {
> +	.enable_mask = BIT(0),
> +	.con0 = 0x18,
> +	.con0_sel = 0x0,
> +	.con1 = 0x1c,
> +	.has_commit = false,
> +	.bls_debug = 0x80,
> +	.bls_debug_mask = 0x3,
> +};
> +
>  static const struct of_device_id mtk_disp_pwm_of_match[] = {
>  	{ .compatible = "mediatek,mt2701-disp-pwm", .data = &mt2701_pwm_data},
>  	{ .compatible = "mediatek,mt6595-disp-pwm", .data = &mt8173_pwm_data},
>  	{ .compatible = "mediatek,mt8173-disp-pwm", .data = &mt8173_pwm_data},
> +	{ .compatible = "mediatek,mt8183-disp-pwm", .data = &mt8183_pwm_data},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, mtk_disp_pwm_of_match);
> 
