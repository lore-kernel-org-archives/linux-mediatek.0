Return-Path: <SRS0=Gsgc=KQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37471C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 01:21:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAD2961353
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 01:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAD2961353
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lCY8naS0+VeafYkWWVe4qfwzFz53bcIfafUxKkWsEUU=; b=rg9hVZrC0+LNZiRulUEQXukNfu
	43O9ZeyrGwjRzgx6iBE0QXLiRh+eBA/leQkqBBmoI7ecjFR/WQAMeWIom/y2XGQ8exJ6/Xbfzv6kb
	3TkragU5pQZ5zglhxI7pxovd0SYB1GZCWvZMfqRrs9Y0BmVb0aBCF4i+2G91mFw66H63NR8epGaN0
	yORPM9dLKEENrsAiNzQMVQNYp00qW4HiASH/F8vnkA834Lha3cX2UihgGSz7U0qFUjSFzc7Ztn46k
	w74o6+wOmUrVFuJePMtPKlDPgaf0RmTiJ+UTY9czA02zLOyUgAQSmo9QLhhx4uLjsqDbK0i5ti01Q
	sZZxW3tg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljtqD-003EB3-LR; Fri, 21 May 2021 01:20:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljtpv-003EAI-Bm; Fri, 21 May 2021 01:20:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=L8yBjYQAgys656MK8UvpdfNfI8yFhToVlmHgAetNSy4=; b=SLjHylRT/Bzv4Pj0VPOowDb5fY
 cqQ5h2dXmSt9Eu24Dsk3DTkr20twuf7hXOuXce61/AZ3mkEWGP05J4D6BwXTI+MGzPCzYk1m5PEcZ
 3CWrSJzIHV2epp/tN6Qu9FNIq9MFZ0ljOMOLsblIUBfOqblP7DGz3yYDWayCaO2jF6kDVsgx/JckT
 88oqEgUfogj1TAqN/eQuM+nwbKf8jGp7/adOXGy7ffPlkvkdrzspiZocRyioR48vGkF5Jvnxpl+Nk
 FiHYlSoY23DR9PuKdti/FwD+QOZVjT7lg4Uc5cjdj5oGAYpJJBXYPOCHCZQKMBU57SlDo6k631Bqm
 jGjoLRMw==;
Received: from mail-ot1-f42.google.com ([209.85.210.42])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljtpr-00GkBT-VL; Fri, 21 May 2021 01:20:21 +0000
Received: by mail-ot1-f42.google.com with SMTP id
 i23-20020a9d68d70000b02902dc19ed4c15so16661757oto.0; 
 Thu, 20 May 2021 18:20:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=L8yBjYQAgys656MK8UvpdfNfI8yFhToVlmHgAetNSy4=;
 b=VH4DKje9W6EqMv7CRbWEyXbqK1uS44Z1ZrflAQqMhll1ZMr5Z9uZa9XWtlFCM9v5M+
 Bz+9zU2sd1CVrOGRedq+FB8bRdH/+tRR2At8KOqZlb3G6711osyPhBMVpoFG19/OlWnc
 44lRt9U/M2p4ffCAnhih2d8lQfp8n+bRU4Tjin/M5GaQ0XdRUEr27MzephHqrEEaKkQh
 0nyEmygJ2jN4AX0QU+agXCwF/2zmhYRsbpEW0O9yQYHWiOBBhNvdvuwpmx0IhlPk+vI+
 WwhorMGZb0yvCAZP/LQTyGakEFkubMLMdRQqkfM4jDWT6WA7xWw2+aPceqKJ/v3kW+lv
 /3pA==
X-Gm-Message-State: AOAM532DCVRglSlYL8LNRRufelVodkp7vwWPohP8DnIG7fSMCvcMm8yi
 1AtCl8kkDn9FKy3L5joLAw==
X-Google-Smtp-Source: ABdhPJwloniGyDrtyyk8GwSUBgwJrVccusdGH8bFeLm/IkJVIgSlu1dAYGnYt1qlN/bRKbEy1r88CA==
X-Received: by 2002:a9d:721e:: with SMTP id u30mr6028225otj.250.1621560017968; 
 Thu, 20 May 2021 18:20:17 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v19sm1000293otq.35.2021.05.20.18.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 18:20:17 -0700 (PDT)
Received: (nullmailer pid 2424374 invoked by uid 1000);
 Fri, 21 May 2021 01:20:16 -0000
Date: Thu, 20 May 2021 20:20:16 -0500
From: Rob Herring <robh@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 mkorpershoek@baylibre.com, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: pwm: pwm-mtk-disp: convert to YAML schema
Message-ID: <20210521012016.GA2421079@robh.at.kernel.org>
References: <20210518175422.2678665-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210518175422.2678665-1-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_182020_054538_7D317F1C 
X-CRM114-Status: GOOD (  24.21  )
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

On Tue, May 18, 2021 at 07:54:19PM +0200, Fabien Parent wrote:
> Convert the dt-binding documentation for pwm-mtk-disp to YAML.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  .../devicetree/bindings/pwm/pwm-mtk-disp.txt  | 44 ----------
>  .../devicetree/bindings/pwm/pwm-mtk-disp.yaml | 83 +++++++++++++++++++
>  2 files changed, 83 insertions(+), 44 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt
>  create mode 100644 Documentation/devicetree/bindings/pwm/pwm-mtk-disp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt b/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt
> deleted file mode 100644
> index 902b271891ae..000000000000
> --- a/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -MediaTek display PWM controller
> -
> -Required properties:
> - - compatible: should be "mediatek,<name>-disp-pwm":
> -   - "mediatek,mt2701-disp-pwm": found on mt2701 SoC.
> -   - "mediatek,mt6595-disp-pwm": found on mt6595 SoC.
> -   - "mediatek,mt8167-disp-pwm", "mediatek,mt8173-disp-pwm": found on mt8167 SoC.
> -   - "mediatek,mt8173-disp-pwm": found on mt8173 SoC.
> - - reg: physical base address and length of the controller's registers.
> - - #pwm-cells: must be 2. See pwm.yaml in this directory for a description of
> -   the cell format.
> - - clocks: phandle and clock specifier of the PWM reference clock.
> - - clock-names: must contain the following:
> -   - "main": clock used to generate PWM signals.
> -   - "mm": sync signals from the modules of mmsys.
> - - pinctrl-names: Must contain a "default" entry.
> - - pinctrl-0: One property must exist for each entry in pinctrl-names.
> -   See pinctrl/pinctrl-bindings.txt for details of the property values.
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
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.yaml b/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.yaml
> new file mode 100644
> index 000000000000..0f016c81cd53
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/pwm/pwm-mtk-disp.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: MediaTek display PWM controller
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Lee Jones <lee.jones@linaro.org>
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - mediatek,mt2701-disp-pwm
> +          - mediatek,mt6595-disp-pwm
> +          - mediatek,mt8173-disp-pwm
> +      - items:
> +          - const: mediatek,mt8167-disp-pwm
> +          - const: mediatek,mt8173-disp-pwm
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: clock used to generate PWM signals
> +      - description: sync signal from the mmsys module
> +
> +  clock-names:
> +    items:
> +      - const: main
> +      - const: mm
> +
> +  "#pwm-cells":
> +    const: 2
> +
> +  power-domains:
> +    description:
> +      List of phandles and PM domain specifiers, as defined by bindings of the
> +      PM domain provider (see also ../power_domain.txt).

Don't need to define what the common property is. You need to say how 
many.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8173-clk.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    pwm0: pwm@1401e000 {
> +      compatible = "mediatek,mt8173-disp-pwm";
> +      reg = <0x1401e000 0x1000>;
> +      #pwm-cells = <2>;
> +      clocks = <&mmsys CLK_MM_DISP_PWM026M>,
> +               <&mmsys CLK_MM_DISP_PWM0MM>;
> +      clock-names = "main", "mm";
> +      pinctrl-names = "default";
> +      pinctrl-0 = <&disp_pwm0_pins>;
> +    };
> +
> +    backlight_lcd: backlight_lcd {
> +      compatible = "pwm-backlight";
> +      pwms = <&pwm0 0 1000000>;
> +      brightness-levels = <
> +        0  16  32  48  64  80  96 112
> +        128 144 160 176 192 208 224 240
> +        255
> +      >;
> +      default-brightness-level = <9>;
> +      power-supply = <&mt6397_vio18_reg>;
> +      enable-gpios = <&pio 95 GPIO_ACTIVE_HIGH>;
> +    };
> -- 
> 2.31.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
