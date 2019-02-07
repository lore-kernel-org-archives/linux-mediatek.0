From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v4 09/12] dt-bindings: soc: fix typo of MT8173 power
 dt-bindings
Date: Thu, 7 Feb 2019 16:35:11 +0100
Message-ID: <a8315d4b-3209-baca-ea39-10626a60f0e8@gmail.com>
References: <20190201083016.25856-1-weiyi.lu@mediatek.com>
 <20190201083016.25856-11-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190201083016.25856-11-weiyi.lu@mediatek.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Weiyi Lu <weiyi.lu@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh@kernel.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, stable@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org



On 01/02/2019 09:30, Weiyi Lu wrote:
> fix incorrect IC name that will affect the MT8183 power dt-bindings
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---

pushed to v5.0-next/soc

Thanks

>  include/dt-bindings/power/mt8173-power.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/include/dt-bindings/power/mt8173-power.h b/include/dt-bindings/power/mt8173-power.h
> index 15d531aa6e78..ef4a7f944848 100644
> --- a/include/dt-bindings/power/mt8173-power.h
> +++ b/include/dt-bindings/power/mt8173-power.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef _DT_BINDINGS_POWER_MT8183_POWER_H
> -#define _DT_BINDINGS_POWER_MT8183_POWER_H
> +#ifndef _DT_BINDINGS_POWER_MT8173_POWER_H
> +#define _DT_BINDINGS_POWER_MT8173_POWER_H
>  
>  #define MT8173_POWER_DOMAIN_VDEC	0
>  #define MT8173_POWER_DOMAIN_VENC	1
> @@ -13,4 +13,4 @@
>  #define MT8173_POWER_DOMAIN_MFG_2D	8
>  #define MT8173_POWER_DOMAIN_MFG		9
>  
> -#endif /* _DT_BINDINGS_POWER_MT8183_POWER_H */
> +#endif /* _DT_BINDINGS_POWER_MT8173_POWER_H */
> 
