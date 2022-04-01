Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D009C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Apr 2022 12:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kecqwN/e13/IxNwvb5w6iETQWc+514iTEtGOu5ry1JU=; b=3xWoodivqZVX8v
	9Jp//SIJ/yrx2KXk73khw1RQASiJ4R7TPbKZWTpbUTa/SR1G0ue5VVcrpgaJSwDBna+f4WTIbkTUH
	knqBcN0jRL4Gd/M/smytuZi+S7FPkvikPkFEhki88wsLRViWqDeo7VU1kEQV3oHCSvcInRiL8mdZe
	jEZxm8X4PK4tTbg8RV68TZ/7OhXGcOrbveeACg2f/UiMcMzGv91K56ET5ZrAyq8nuyxKWPlMChOr4
	PUYxqLOq9EefHxwIEE98xxSnp7LlEyh1xdgI7w3klCkmZfEZgv93fd9H4Xy5jCpG1yHaGHRpTWRXz
	RHtL1orpDD7GdPofeXew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naG9G-005b2p-2q; Fri, 01 Apr 2022 12:13:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naG9C-005b2A-O7; Fri, 01 Apr 2022 12:13:00 +0000
X-UUID: dee53ace94564992b9205d2084a0b262-20220401
X-UUID: dee53ace94564992b9205d2084a0b262-20220401
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 243488528; Fri, 01 Apr 2022 05:12:49 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 1 Apr 2022 05:12:47 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 1 Apr 2022 20:12:45 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 1 Apr 2022 20:12:45 +0800
Message-ID: <d8007c05af50397049a2ee03563848a9e8c7bb29.camel@mediatek.com>
Subject: Re: [PATCH v5,1/4] dt-bindings: pwm: Convert pwm-mtk-disp.txt to
 mediatek,pwm-disp.yaml format
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: <xinlei.lee@mediatek.com>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
 <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <linux-pwm@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <rex-bc.chen@mediatek.com>, <jitao.shi@mediatek.com>
Date: Fri, 1 Apr 2022 20:12:45 +0800
In-Reply-To: <1648730873-18505-2-git-send-email-xinlei.lee@mediatek.com>
References: <1648730873-18505-1-git-send-email-xinlei.lee@mediatek.com>
 <1648730873-18505-2-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_051258_840278_24A3C3C4 
X-CRM114-Status: GOOD (  21.06  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi xinlei,

On Thu, 2022-03-31 at 20:47 +0800, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Convert pwm-mtk-disp.txt to mediatek,pwm-disp.yaml format as
> suggested by maintainer
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/pwm/mediatek,pwm-disp.yaml       | 66
> +++++++++++++++++++
>  .../devicetree/bindings/pwm/pwm-mtk-disp.txt  | 45 -------------
>  2 files changed, 66 insertions(+), 45 deletions(-)
>  create mode 100644
> Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pwm/pwm-mtk-
> disp.txt
> 
> diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-
> disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-
> disp.yaml
> new file mode 100644
> index 000000000000..36f877f819fa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek DISP_PWM Controller Device Tree Bindings
> +
> +maintainers:
> +  - Jitao Shi <jitao.shi@mediatek.com>
> +  - Xinlei Lee <xinlei.lee@mediatek.com>
> +
> +allOf:
> +  - $ref: pwm.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - mediatek,mt2701-disp-pwm
> +          - mediatek,mt6595-disp-pwm
> +          - mediatek,mt8173-disp-pwm
> +          - mediatek,mt8183-disp-pwm
> +      - items:
> +          - const: mediatek,mt8167-disp-pwm
> +          - const: mediatek,mt8173-disp-pwm
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#pwm-cells":
> +    const: 2
> +
> +  clocks:
> +    items:
> +      - description: Main Clock
> +      - description: Mm Clock
> +
> +  clock-names:
> +    items:
> +      - const: main
> +      - const: mm
> +

Binding description is missing interrupt property [1]. 

Please add it for mt8192, thanks.

[1] lore.kernel.org/all/51f8baea-6562-1d6b-c409-9c362f0b2fc5@gmail.com/

> +required:
> +  - compatible
> +  - reg
> +  - "#pwm-cells"
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/mt8173-clk.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    pwm0: pwm@1401e000 {
> +        compatible = "mediatek,mt8173-disp-pwm";
> +        reg = <0x1401e000 0x1000>;
> +        #pwm-cells = <2>;
> +        clocks = <&mmsys CLK_MM_DISP_PWM026M>,
> +                 <&mmsys CLK_MM_DISP_PWM0MM>;
> +        clock-names = "main", "mm";
> +    };
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt
> b/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt
> deleted file mode 100644
> index 691e58b6c223..000000000000
> --- a/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -MediaTek display PWM controller
> -
> -Required properties:
> - - compatible: should be "mediatek,<name>-disp-pwm":
> -   - "mediatek,mt2701-disp-pwm": found on mt2701 SoC.
> -   - "mediatek,mt6595-disp-pwm": found on mt6595 SoC.
> -   - "mediatek,mt8167-disp-pwm", "mediatek,mt8173-disp-pwm": found
> on mt8167 SoC.
> -   - "mediatek,mt8173-disp-pwm": found on mt8173 SoC.
> -   - "mediatek,mt8183-disp-pwm": found on mt8183 SoC.$
> - - reg: physical base address and length of the controller's
> registers.
> - - #pwm-cells: must be 2. See pwm.yaml in this directory for a
> description of
> -   the cell format.
> - - clocks: phandle and clock specifier of the PWM reference clock.
> - - clock-names: must contain the following:
> -   - "main": clock used to generate PWM signals.
> -   - "mm": sync signals from the modules of mmsys.
> - - pinctrl-names: Must contain a "default" entry.
> - - pinctrl-0: One property must exist for each entry in pinctrl-
> names.
> -   See pinctrl/pinctrl-bindings.txt for details of the property
> values.
> -
> -Example:
> -	pwm0: pwm@1401e000 {
> -		compatible = "mediatek,mt8173-disp-pwm",
> -			     "mediatek,mt6595-disp-pwm";
> -		reg = <0 0x1401e000 0 0x1000>;
> -		#pwm-cells = <2>;
> -		clocks = <&mmsys CLK_MM_DISP_PWM026M>,
> -			 <&mmsys CLK_MM_DISP_PWM0MM>;
> -		clock-names = "main", "mm";
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&disp_pwm0_pins>;
> -	};
> -
> -	backlight_lcd: backlight_lcd {
> -		compatible = "pwm-backlight";
> -		pwms = <&pwm0 0 1000000>;
> -		brightness-levels = <
> -			  0  16  32  48  64  80  96 112
> -			128 144 160 176 192 208 224 240
> -			255
> -		>;
> -		default-brightness-level = <9>;
> -		power-supply = <&mt6397_vio18_reg>;
> -		enable-gpios = <&pio 95 GPIO_ACTIVE_HIGH>;
> -	};


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
