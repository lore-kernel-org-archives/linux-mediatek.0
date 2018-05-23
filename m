From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v2 1/4] drm/mediatek: update dt-bindings for mt2712
Date: Wed, 23 May 2018 11:30:58 +0800
Message-ID: <1527046258.2655.1.camel@mtksdaap41>
References: <20180523022517.12103-1-stu.hsieh@mediatek.com>
         <20180523022517.12103-2-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180523022517.12103-2-stu.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stu Hsieh <stu.hsieh@mediatek.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, srv_heupstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

Hi, Stu:

On Wed, 2018-05-23 at 10:25 +0800, Stu Hsieh wrote:
> Update device tree binding documentation for the display subsystem for
> Mediatek MT2712 SoCs.
> 

Acked-by: CK Hu <ck.hu@mediatek.com>

> Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> index 383183a89164..8469de510001 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> @@ -40,7 +40,7 @@ Required properties (all function blocks):
>  	"mediatek,<chip>-dpi"        - DPI controller, see mediatek,dpi.txt
>  	"mediatek,<chip>-disp-mutex" - display mutex
>  	"mediatek,<chip>-disp-od"    - overdrive
> -  the supported chips are mt2701 and mt8173.
> +  the supported chips are mt2701, mt2712 and mt8173.
>  - reg: Physical base address and length of the function block register space
>  - interrupts: The interrupt signal from the function block (required, except for
>    merge and split function blocks).
