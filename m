Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7928C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 07:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ApHylGtPh8+N9QGoEcei6/NJD8bY3cOG0K2OStZZXqk=; b=FNYUz7M/3vToPg
	2WY25JhiCDDlE7KU7lOvdasEAA0z9DGHDy3Oy/b9mFATfw8pacrjC95tCbVSuagH1pJ40jKiWlc1h
	NP1q+UrLoirY40gPfJkPhKe4skR1Xo7Pb5Jfcv4ht0zQRJJuqY30sL1yRKDmQVFmk4vcdr3Ui7PZD
	iJEYTqaeoVrMKX4uo4NlC6drT8LO2IdQGrGTSrlT5JNLkFq8J3M80xB5fV/NpSgn3HiShiOV52sk5
	TuXeVubH0jX/4fiYpBLFI38FcxaigPfrwSk56/fcRqZCupmICAcWm+YjBZJFOWTZhqpinKe7bBNU5
	Rk3VFG+jmwN4W7mJ849Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNV34-003b3g-Em; Fri, 25 Feb 2022 07:29:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNV2q-003b16-0M; Fri, 25 Feb 2022 07:29:42 +0000
X-UUID: 084f25c1f2e04984a115872fe866570c-20220225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=zXB2qenMrx1gcjB8Plw8l8aya75heCozhcAcJrmZ8vw=; 
 b=XjfF3KudD3sjR/JpD2c0YoGCWdnuPxrUaWQkHVWIBSRjimehLOO60i/QMww+bicOYmunr8HCVOpzd1bjVdNypUqrueRijkpKsq2kYxf6ZQvkB23vklNBmoipHgk5zt/PpyibTzcJSHkaxnXktSxls2j46v5Bz/POO6TDOAQvPr0=;
X-UUID: 084f25c1f2e04984a115872fe866570c-20220225
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2137666309; Fri, 25 Feb 2022 00:29:32 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Feb 2022 23:19:29 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 25 Feb 2022 15:19:28 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Feb 2022 15:19:27 +0800
Message-ID: <918bfe38f716c2e1ca411ae42a5a9ab0bf810692.camel@mediatek.com>
Subject: Re: [v2, 1/4] dt-bindings: pwm: Convert pwm-mtk-disp.txt to
 mediatek, pwm-disp.yaml format
From: xinlei.lee <xinlei.lee@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>
CC: <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>,
 <lee.jones@linaro.org>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>,
 <jitao.shi@mediatek.com>, <allen-kh.cheng@mediatek.com>,
 <linux-pwm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Xinlei Lee
 <xinlei.lee@mediatek.corp-partner.google.com>
Date: Fri, 25 Feb 2022 15:19:41 +0800
In-Reply-To: <CAGXv+5EQ5SzzHm9r0wPuE2+J=V4s8f5AopC0xFK1Eaqx_MzyhQ@mail.gmail.com>
References: <1645003971-16908-1-git-send-email-xinlei.lee@mediatek.com>
 <1645003971-16908-2-git-send-email-xinlei.lee@mediatek.com>
 <CAGXv+5EQ5SzzHm9r0wPuE2+J=V4s8f5AopC0xFK1Eaqx_MzyhQ@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_232940_102843_BBE50259 
X-CRM114-Status: GOOD (  30.03  )
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

On Fri, 2022-02-25 at 14:24 +0800, Chen-Yu Tsai wrote:
> On Wed, Feb 16, 2022 at 5:43 PM <xinlei.lee@mediatek.com> wrote:
> > 
> > From: Xinlei Lee <xinlei.lee@mediatek.corp-partner.google.com>
> > 
> > Convert pwm-mtk-disp.txt to mediatek,pwm-disp.yaml format as
> > suggested by maintainer
> > 
> > Signed-off-by: Xinlei Lee <
> > xinlei.lee@mediatek.corp-partner.google.com>
> > ---
> >  .../bindings/pwm/mediatek,pwm-disp.yaml       | 71
> > +++++++++++++++++++
> >  .../devicetree/bindings/pwm/pwm-mtk-disp.txt  | 44 ------------
> >  2 files changed, 71 insertions(+), 44 deletions(-)
> >  create mode 100755
> > Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/pwm/pwm-mtk-
> > disp.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-
> > disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-
> > disp.yaml
> > new file mode 100755
> > index 000000000000..edf2a2e9ea72
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> > @@ -0,0 +1,71 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Mediatek PWM Controller Device Tree Bindings
> > +
> > +maintainers:
> > +  - Jitao Shi <jitao.shi@mediatek.com>
> > +  - Xinlei Lee <xinlei.lee@mediatek.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - mediatek,mt2701-disp-pwm
> > +      - mediatek,mt6595-disp-pwm
> > +      - mediatek,mt8173-disp-pwm
> > +      - mediatek,mt8183-disp-pwm
> 
> mt8183 was not in the original text file binding. Please split this
> out.
> Also, the combination "mediatek,mt8167-disp-pwm", "mediatek,mt8173-
> disp-pwm"
> is missing.
> 
> ChenYu
> 
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  "#pwm-cells":
> > +    description:
> > +      Number of cells in a PWM specifier.
> > +
> > +  clocks:
> > +    items:
> > +      - description: Main Clock
> > +      - description: Mm Clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: main
> > +      - const: mm
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - power-domains
> > +  - "#pwm-cells"
> > +  - clocks
> > +  - clock-names
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/mt8183-clk.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/power/mt8183-power.h>
> > +
> > +    pwm: pwm@1100e000 {
> > +        compatible = "mediatek,mt8183-disp-pwm";
> > +        reg = <0x1100e000 0x1000>;
> > +        interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_LOW>;
> > +        power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> > +        #pwm-cells = <2>;
> > +        clocks = <&topckgen CLK_TOP_MUX_DISP_PWM>,
> > +                 <&infracfg CLK_INFRA_DISP_PWM>;
> > +        clock-names = "main", "mm";
> > +    };
> > diff --git a/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt 
> > b/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt
> > deleted file mode 100644
> > index 902b271891ae..000000000000
> > --- a/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt
> > +++ /dev/null
> > @@ -1,44 +0,0 @@
> > -MediaTek display PWM controller
> > -
> > -Required properties:
> > - - compatible: should be "mediatek,<name>-disp-pwm":
> > -   - "mediatek,mt2701-disp-pwm": found on mt2701 SoC.
> > -   - "mediatek,mt6595-disp-pwm": found on mt6595 SoC.
> > -   - "mediatek,mt8167-disp-pwm", "mediatek,mt8173-disp-pwm": found
> > on mt8167 SoC.
> > -   - "mediatek,mt8173-disp-pwm": found on mt8173 SoC.
> > - - reg: physical base address and length of the controller's
> > registers.
> > - - #pwm-cells: must be 2. See pwm.yaml in this directory for a
> > description of
> > -   the cell format.
> > - - clocks: phandle and clock specifier of the PWM reference clock.
> > - - clock-names: must contain the following:
> > -   - "main": clock used to generate PWM signals.
> > -   - "mm": sync signals from the modules of mmsys.
> > - - pinctrl-names: Must contain a "default" entry.
> > - - pinctrl-0: One property must exist for each entry in pinctrl-
> > names.
> > -   See pinctrl/pinctrl-bindings.txt for details of the property
> > values.
> > -
> > -Example:
> > -       pwm0: pwm@1401e000 {
> > -               compatible = "mediatek,mt8173-disp-pwm",
> > -                            "mediatek,mt6595-disp-pwm";
> > -               reg = <0 0x1401e000 0 0x1000>;
> > -               #pwm-cells = <2>;
> > -               clocks = <&mmsys CLK_MM_DISP_PWM026M>,
> > -                        <&mmsys CLK_MM_DISP_PWM0MM>;
> > -               clock-names = "main", "mm";
> > -               pinctrl-names = "default";
> > -               pinctrl-0 = <&disp_pwm0_pins>;
> > -       };
> > -
> > -       backlight_lcd: backlight_lcd {
> > -               compatible = "pwm-backlight";
> > -               pwms = <&pwm0 0 1000000>;
> > -               brightness-levels = <
> > -                         0  16  32  48  64  80  96 112
> > -                       128 144 160 176 192 208 224 240
> > -                       255
> > -               >;
> > -               default-brightness-level = <9>;
> > -               power-supply = <&mt6397_vio18_reg>;
> > -               enable-gpios = <&pio 95 GPIO_ACTIVE_HIGH>;
> > -       };
> > --
> > 2.18.0
> > 
> > 
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek

Hi chenyu:

Thanks for your suggestion!
If you think there is no 8183 in the original .txt file, I can put it
in another patch similar to 8192/8186 operation.
In the latest pwm-mtk-disp.c I didn't find 8167 related compatiable, do
I still need to add it to the new .yaml file?

Best Regards!
xinlei


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
