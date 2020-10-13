Return-Path: <SRS0=564r=DU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 133F9C433E7
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 16:55:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8434F252F8
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 16:55:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RCUPyWua"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8434F252F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9+Q95j6v692QlqnpoV3tcoJjYSd07eXr+OhniNp1LaY=; b=RCUPyWuayvenZkXXTmW0U/i4G
	K2IlFmSchx+Srs50O1dbjCuMoHSf7gAUyYtXp8S/QIXkDGYHuHzB8hQwnhctJcroa0XxaYaujkJuj
	w9zzJNbBYulxsfNcgmYXpxDPMnHlfKbVhRk3DtmL1nbgB34rXkaU5ucnlK9zEPCcdfURyML/nwpKQ
	4rn2407uTKaFVpcMy5uMYVY+wBpbaS/a93Sn4Xgb3aWVl/ckRIkA+jFn/k8exjAVFCnV9+HIohY/x
	II9i+IhR1aeMg5++IfKV3jT4CKQnbyhZqqqJvV7tGbEFSHPVH2+sL0TjbjoMdOlQfzlpLpuZw80Tg
	1Fp1WbDrQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSNaV-00082C-9w; Tue, 13 Oct 2020 16:55:47 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSNaP-00080S-Ai; Tue, 13 Oct 2020 16:55:42 +0000
Received: by mail-oi1-f194.google.com with SMTP id w204so124911oiw.1;
 Tue, 13 Oct 2020 09:55:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1Oz6Xfj76J5UebP7W/wnJQsjdJjBRc1UsbNsPfdE2SU=;
 b=jfT4ojSFsj6FL5GFLl12+U8BMnjoWxBhADF9Deb33bWHqewWHqlsBn9Rk4lRgH5cDb
 fZG0IkBQ5Y4bLO9xjpk3BOMlc9Wnct2e7SEnVajDa6Vp0AFXToNVEvn6kMQVAkLmhUpO
 N7RPArifBZy4DNPGaDAcgNgpXuMj2DUGIw50CPS0gJkrSCDR8yBkFFtP8nEN/g5bApB/
 N7PsSg4Awd41iUxDO60gVfeeVp6yncUKZ0R1ttynn0ionip8ztgH72nQ1b9xeJorXWvg
 LNGWEyVGjMAWyQtGSHOX4puS0Vyz/d7d54kkxVZ0kfzmDd1+p2rRbQ7FD+dzN43Bgrwk
 ZirQ==
X-Gm-Message-State: AOAM531g8hKupsHx7H4Zh+7mD85W6w8B0aIegwYtaPfng7O65Z9byzoV
 kg31W/VDRxd+Wk+UaQ58cA==
X-Google-Smtp-Source: ABdhPJybTuOcoxZ4SOf+C3/3IaOFYEcbMnTh6G+tmhKIT0Nm26q4BedGaMMNk77+QFkru5lJJlOl+A==
X-Received: by 2002:aca:afcc:: with SMTP id y195mr430066oie.30.1602608140255; 
 Tue, 13 Oct 2020 09:55:40 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r80sm164332oor.31.2020.10.13.09.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 09:55:39 -0700 (PDT)
Received: (nullmailer pid 3684302 invoked by uid 1000);
 Tue, 13 Oct 2020 16:55:38 -0000
Date: Tue, 13 Oct 2020 11:55:38 -0500
From: Rob Herring <robh@kernel.org>
To: Wenbin Mei <wenbin.mei@mediatek.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: mmc: Convert mtk-sd to json-schema
Message-ID: <20201013165538.GA3678156@bogus>
References: <20201012124547.16649-1-wenbin.mei@mediatek.com>
 <20201012124547.16649-2-wenbin.mei@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201012124547.16649-2-wenbin.mei@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_125541_386573_CC41C5E7 
X-CRM114-Status: GOOD (  27.52  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 srv_heupstream@mediatek.com, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Oct 12, 2020 at 08:45:44PM +0800, Wenbin Mei wrote:
> Convert the mtk-sd binding to DT schema format using json-schema.
> 
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> ---
>  .../devicetree/bindings/mmc/mtk-sd.txt        |  75 --------
>  .../devicetree/bindings/mmc/mtk-sd.yaml       | 163 ++++++++++++++++++
>  2 files changed, 163 insertions(+), 75 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mmc/mtk-sd.txt
>  create mode 100644 Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.txt b/Documentation/devicetree/bindings/mmc/mtk-sd.txt
> deleted file mode 100644
> index 26a8f320a156..000000000000
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.txt
> +++ /dev/null
> @@ -1,75 +0,0 @@
> -* MTK MMC controller
> -
> -The MTK  MSDC can act as a MMC controller
> -to support MMC, SD, and SDIO types of memory cards.
> -
> -This file documents differences between the core properties in mmc.txt
> -and the properties used by the msdc driver.
> -
> -Required properties:
> -- compatible: value should be either of the following.
> -	"mediatek,mt8135-mmc": for mmc host ip compatible with mt8135
> -	"mediatek,mt8173-mmc": for mmc host ip compatible with mt8173
> -	"mediatek,mt8183-mmc": for mmc host ip compatible with mt8183
> -	"mediatek,mt8516-mmc": for mmc host ip compatible with mt8516
> -	"mediatek,mt6779-mmc": for mmc host ip compatible with mt6779
> -	"mediatek,mt2701-mmc": for mmc host ip compatible with mt2701
> -	"mediatek,mt2712-mmc": for mmc host ip compatible with mt2712
> -	"mediatek,mt7622-mmc": for MT7622 SoC
> -	"mediatek,mt7623-mmc", "mediatek,mt2701-mmc": for MT7623 SoC
> -	"mediatek,mt7620-mmc", for MT7621 SoC (and others)
> -
> -- reg: physical base address of the controller and length
> -- interrupts: Should contain MSDC interrupt number
> -- clocks: Should contain phandle for the clock feeding the MMC controller
> -- clock-names: Should contain the following:
> -	"source" - source clock (required)
> -	"hclk" - HCLK which used for host (required)
> -	"source_cg" - independent source clock gate (required for MT2712)
> -	"bus_clk" - bus clock used for internal register access (required for MT2712 MSDC0/3)
> -- pinctrl-names: should be "default", "state_uhs"
> -- pinctrl-0: should contain default/high speed pin ctrl
> -- pinctrl-1: should contain uhs mode pin ctrl
> -- vmmc-supply: power to the Core
> -- vqmmc-supply: power to the IO
> -
> -Optional properties:
> -- assigned-clocks: PLL of the source clock
> -- assigned-clock-parents: parent of source clock, used for HS400 mode to get 400Mhz source clock
> -- hs400-ds-delay: HS400 DS delay setting
> -- mediatek,hs200-cmd-int-delay: HS200 command internal delay setting.
> -				This field has total 32 stages.
> -				The value is an integer from 0 to 31.
> -- mediatek,hs400-cmd-int-delay: HS400 command internal delay setting
> -				This field has total 32 stages.
> -				The value is an integer from 0 to 31.
> -- mediatek,hs400-cmd-resp-sel-rising:  HS400 command response sample selection
> -				       If present,HS400 command responses are sampled on rising edges.
> -				       If not present,HS400 command responses are sampled on falling edges.
> -- mediatek,latch-ck: Some SoCs do not support enhance_rx, need set correct latch-ck to avoid data crc
> -		     error caused by stop clock(fifo full)
> -		     Valid range = [0:0x7]. if not present, default value is 0.
> -		     applied to compatible "mediatek,mt2701-mmc".
> -- resets: Phandle and reset specifier pair to softreset line of MSDC IP.
> -- reset-names: Should be "hrst".
> -
> -Examples:
> -mmc0: mmc@11230000 {
> -	compatible = "mediatek,mt8173-mmc", "mediatek,mt8135-mmc";
> -	reg = <0 0x11230000 0 0x108>;
> -	interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_LOW>;
> -	vmmc-supply = <&mt6397_vemc_3v3_reg>;
> -	vqmmc-supply = <&mt6397_vio18_reg>;
> -	clocks = <&pericfg CLK_PERI_MSDC30_0>,
> -	         <&topckgen CLK_TOP_MSDC50_0_H_SEL>;
> -	clock-names = "source", "hclk";
> -	pinctrl-names = "default", "state_uhs";
> -	pinctrl-0 = <&mmc0_pins_default>;
> -	pinctrl-1 = <&mmc0_pins_uhs>;
> -	assigned-clocks = <&topckgen CLK_TOP_MSDC50_0_SEL>;
> -	assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL_D2>;
> -	hs400-ds-delay = <0x14015>;
> -	mediatek,hs200-cmd-int-delay = <26>;
> -	mediatek,hs400-cmd-int-delay = <14>;
> -	mediatek,hs400-cmd-resp-sel-rising;
> -};
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> new file mode 100644
> index 000000000000..21a2fce5b7ba
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -0,0 +1,163 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MTK MSDC Storage Host Controller Binding
> +
> +maintainers:
> +  - Chaotian Jing <chaotian.jing@mediatek.com>
> +  - Wenbin Mei <wenbin.mei@mediatek.com>
> +
> +allOf:
> +  - $ref: mmc-controller.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +        - mediatek,mt2701-mmc
> +        - mediatek,mt2712-mmc
> +        - mediatek,mt6779-mmc
> +        - mediatek,mt7620-mmc
> +        - mediatek,mt7622-mmc
> +        - mediatek,mt8135-mmc
> +        - mediatek,mt8173-mmc
> +        - mediatek,mt8183-mmc
> +        - mediatek,mt8516-mmc
> +      - items:
> +        - const: mediatek,mt7623-mmc
> +        - const: mediatek,mt2701-mmc
> +
> +  clocks:
> +    description:
> +      Should contain phandle for the clock feeding the MMC controller.
> +    minItems: 2
> +    maxItems: 4
> +    items:
> +      - description: source clock (required).
> +      - description: HCLK which used for host (required).
> +      - description: independent source clock gate (required for MT2712).
> +      - description: bus clock used for internal register access (required for MT2712 MSDC0/3).
> +
> +  clock-names:
> +    minItems: 2
> +    maxItems: 4
> +    items:
> +      - const: source
> +      - const: hclk
> +      - const: source_cg
> +      - const: bus_clk
> +
> +  pinctrl-names:
> +    items:
> +      - const: default
> +      - const: state_uhs
> +
> +  pinctrl-0:
> +    description:
> +      should contain default/high speed pin ctrl.
> +    maxItems: 1
> +
> +  pinctrl-1:
> +    description:
> +      should contain uhs mode pin ctrl.
> +    maxItems: 1
> +
> +  assigned-clocks:
> +    description:
> +      PLL of the source clock.
> +    maxItems: 1
> +
> +  assigned-clock-parents:
> +    description:
> +      parent of source clock, used for HS400 mode to get 400Mhz source clock.
> +    maxItems: 1
> +
> +  hs400-ds-delay:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      HS400 DS delay setting.
> +    minimum: 0
> +    maximum: 0xffffffff
> +
> +  mediatek,hs200-cmd-int-delay:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      HS200 command internal delay setting.
> +      This field has total 32 stages.
> +      The value is an integer from 0 to 31.
> +    minimum: 0
> +    maximum: 31
> +
> +  mediatek,hs400-cmd-int-delay:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      HS400 command internal delay setting.
> +      This field has total 32 stages.
> +      The value is an integer from 0 to 31.
> +    minimum: 0
> +    maximum: 31
> +
> +  mediatek,hs400-cmd-resp-sel-rising:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      HS400 command response sample selection.
> +      If present, HS400 command responses are sampled on rising edges.
> +      If not present, HS400 command responses are sampled on falling edges.
> +
> +  mediatek,latch-ck:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Some SoCs do not support enhance_rx, need set correct latch-ck to avoid
> +      data crc error caused by stop clock(fifo full) Valid range = [0:0x7].
> +      if not present, default value is 0.
> +      applied to compatible "mediatek,mt2701-mmc".
> +    minimum: 0
> +    maximum: 7
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    const: hrst
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - pinctrl-names
> +  - pinctrl-0
> +  - pinctrl-1
> +  - vmmc-supply
> +  - vqmmc-supply

Add:

unevaluatedProperties: false

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
