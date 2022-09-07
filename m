Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C9AC54EE9
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Sep 2022 20:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=upXcPuQ+AymjlAP813ikt1+Dlj+izCoKBqGmw9TwiEA=; b=v8EXBwvREDxrE958/WZZuaUwfx
	g4qUFskvFFEjnqFnxxlRDdJRYpG6Bmk82uWHevImn/xqHgmgM1pwHe8PD6siU0/iCCGeWcWBc5PUu
	djA5GIwbgghb3h6Gbf6AkmAVSgh9kJJMzD9pFXN4NHpwOd9RZCeFbaOOpLOUBj8G1qwByAWhgRq0B
	KP7v5buv2jx6Y868KqhvU4gbDZXYRxs9cRuy8YXRXViU6UyOVo+c+ju9TdePb2qgqQ0neXPC5/il/
	DsINRsTbSvwIslrZWReasdM9IzKcf01vHbIudIJ6qrGB1pfT3mry6gQJ/ozNEu3APi9z5taXMh89s
	F8zLoBkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW1wC-009kDw-61; Wed, 07 Sep 2022 20:46:20 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW1vt-009k3v-QW; Wed, 07 Sep 2022 20:46:03 +0000
Received: by mail-ot1-f44.google.com with SMTP id m21-20020a9d6ad5000000b00638df677850so11062157otq.5;
        Wed, 07 Sep 2022 13:45:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=upXcPuQ+AymjlAP813ikt1+Dlj+izCoKBqGmw9TwiEA=;
        b=6BsrDnssnfpZhMLo9z/Iu0Y2xqrYVr4PSP4hMcf4BEeIYXcfIDneun6oSNr7ZdF51n
         PB69h8ygesHDS2oZuyk8TzPY3cv0XSyvmFvtS61nRqblhElU71To8oCfGFsuk/Ezr4L7
         ntc8c+3BG90G2c57tqkUQtb3zOgcGs8WN9o16GgLMYeXEY3AxsEcoFN0bcY5pBedrGjC
         ui3wbIgF3JbLkDah1IjXkrliOIuoHZn/rEnc56VsXFHtdd62Cyqx9x7EwFR29zFOWCX9
         dhfkKZmlPYSN7z/JLNSKKvIFqb7B69RbM+mGlNy27Eq5CIR1c2diHYG5oMgBZN7lwv60
         3S+Q==
X-Gm-Message-State: ACgBeo3gdv2Stw0ar0BhFP0q1gPXUxkOHOaESjIG0YUkGsCdOvYt8bq2
	lo7Q8dNTWBW+7ocssyf0TA==
X-Google-Smtp-Source: AA6agR7XOBU/6/O2TwW9lBjbS8h05cyYcmFka/myRzOWQ4uhgMLB77hg5WkWiwvPbKFR5xw241HTpg==
X-Received: by 2002:a05:6830:4386:b0:637:3636:e29f with SMTP id s6-20020a056830438600b006373636e29fmr2072794otv.294.1662583558179;
        Wed, 07 Sep 2022 13:45:58 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y2-20020a4ae7c2000000b0042859bebfebsm5410539oov.45.2022.09.07.13.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 13:45:57 -0700 (PDT)
Received: (nullmailer pid 312607 invoked by uid 1000);
	Wed, 07 Sep 2022 20:45:56 -0000
Date: Wed, 7 Sep 2022 15:45:56 -0500
From: Rob Herring <robh@kernel.org>
To: Peter Chiu <chui-hao.chiu@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Ryder Lee <ryder.Lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Sam Shih <sam.shih@mediatek.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: update bindings for MT7986 SoC
Message-ID: <20220907204556.GA307930-robh@kernel.org>
References: <20220902024719.31943-1-chui-hao.chiu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220902024719.31943-1-chui-hao.chiu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_134601_923309_0B5818D8 
X-CRM114-Status: GOOD (  19.53  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Sep 02, 2022 at 10:47:19AM +0800, Peter Chiu wrote:
> Add wifi pins in the description and set groups to string-array to support
> multiple groups in a node.
> 
> Reviewed-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
> ---
>  .../pinctrl/mediatek,mt7986-pinctrl.yaml      | 48 +++++++++++--------
>  1 file changed, 28 insertions(+), 20 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
> index 4eadea55df10..b08a0a8076e0 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
> @@ -117,6 +117,10 @@ patternProperties:
>            "i2s"             "audio"     62, 63, 64, 65
>            "switch_int"      "eth"       66
>            "mdc_mdio"        "eth"       67
> +          "wf_2g"           "wifi"      74, 75, 76, 77, 78, 79, 80, 81, 82, 83
> +          "wf_5g"           "wifi"      91, 92, 93, 94, 95, 96, 97, 98, 99, 100
> +          "wf_dbdc"         "wifi"      74, 75, 76, 77, 78, 79, 80, 81, 82, 83,
> +                                        84, 85
>  
>          $ref: "/schemas/pinctrl/pinmux-node.yaml"
>          properties:
> @@ -234,7 +238,9 @@ patternProperties:
>              then:
>                properties:
>                  groups:
> -                  enum: [wf_2g, wf_5g, wf_dbdc]
> +                  $ref: /schemas/types.yaml#/definitions/string-array

'groups' already has a type. You can redefine it here.

> +                  items:
> +                    enum: [wf_2g, wf_5g, wf_dbdc]
>        '.*conf.*':
>          type: object
>          additionalProperties: false
> @@ -248,25 +254,27 @@ patternProperties:
>                An array of strings. Each string contains the name of a pin.
>                There is no PIN 41 to PIN 65 above on mt7686b, you can only use
>                those pins on mt7986a.
> -            enum: [SYS_WATCHDOG, WF2G_LED, WF5G_LED, I2C_SCL, I2C_SDA, GPIO_0,
> -                   GPIO_1, GPIO_2, GPIO_3, GPIO_4, GPIO_5, GPIO_6, GPIO_7,
> -                   GPIO_8, GPIO_9, GPIO_10, GPIO_11, GPIO_12, GPIO_13, GPIO_14,
> -                   GPIO_15, PWM0, PWM1, SPI0_CLK, SPI0_MOSI, SPI0_MISO, SPI0_CS,
> -                   SPI0_HOLD, SPI0_WP, SPI1_CLK, SPI1_MOSI, SPI1_MISO, SPI1_CS,
> -                   SPI2_CLK, SPI2_MOSI, SPI2_MISO, SPI2_CS, SPI2_HOLD, SPI2_WP,
> -                   UART0_RXD, UART0_TXD, PCIE_PERESET_N, UART1_RXD, UART1_TXD,
> -                   UART1_CTS, UART1_RTS, UART2_RXD, UART2_TXD, UART2_CTS,
> -                   UART2_RTS, EMMC_DATA_0, EMMC_DATA_1, EMMC_DATA_2,
> -                   EMMC_DATA_3, EMMC_DATA_4, EMMC_DATA_5, EMMC_DATA_6,
> -                   EMMC_DATA_7, EMMC_CMD, EMMC_CK, EMMC_DSL, EMMC_RSTB, PCM_DTX,
> -                   PCM_DRX, PCM_CLK, PCM_FS, MT7531_INT, SMI_MDC, SMI_MDIO,
> -                   WF0_DIG_RESETB, WF0_CBA_RESETB, WF0_XO_REQ, WF0_TOP_CLK,
> -                   WF0_TOP_DATA, WF0_HB1, WF0_HB2, WF0_HB3, WF0_HB4, WF0_HB0,
> -                   WF0_HB0_B, WF0_HB5, WF0_HB6, WF0_HB7, WF0_HB8, WF0_HB9,
> -                   WF0_HB10, WF1_DIG_RESETB, WF1_CBA_RESETB, WF1_XO_REQ,
> -                   WF1_TOP_CLK, WF1_TOP_DATA, WF1_HB1, WF1_HB2, WF1_HB3,
> -                   WF1_HB4, WF1_HB0, WF1_HB0_B, WF1_HB5, WF1_HB6, WF1_HB7,
> -                   WF1_HB8]
> +            $ref: /schemas/types.yaml#/definitions/string-array
> +            items:

Same for 'pins'.

> +              enum: [SYS_WATCHDOG, WF2G_LED, WF5G_LED, I2C_SCL, I2C_SDA, GPIO_0,
> +                     GPIO_1, GPIO_2, GPIO_3, GPIO_4, GPIO_5, GPIO_6, GPIO_7,
> +                     GPIO_8, GPIO_9, GPIO_10, GPIO_11, GPIO_12, GPIO_13, GPIO_14,
> +                     GPIO_15, PWM0, PWM1, SPI0_CLK, SPI0_MOSI, SPI0_MISO, SPI0_CS,
> +                     SPI0_HOLD, SPI0_WP, SPI1_CLK, SPI1_MOSI, SPI1_MISO, SPI1_CS,
> +                     SPI2_CLK, SPI2_MOSI, SPI2_MISO, SPI2_CS, SPI2_HOLD, SPI2_WP,
> +                     UART0_RXD, UART0_TXD, PCIE_PERESET_N, UART1_RXD, UART1_TXD,
> +                     UART1_CTS, UART1_RTS, UART2_RXD, UART2_TXD, UART2_CTS,
> +                     UART2_RTS, EMMC_DATA_0, EMMC_DATA_1, EMMC_DATA_2,
> +                     EMMC_DATA_3, EMMC_DATA_4, EMMC_DATA_5, EMMC_DATA_6,
> +                     EMMC_DATA_7, EMMC_CMD, EMMC_CK, EMMC_DSL, EMMC_RSTB, PCM_DTX,
> +                     PCM_DRX, PCM_CLK, PCM_FS, MT7531_INT, SMI_MDC, SMI_MDIO,
> +                     WF0_DIG_RESETB, WF0_CBA_RESETB, WF0_XO_REQ, WF0_TOP_CLK,
> +                     WF0_TOP_DATA, WF0_HB1, WF0_HB2, WF0_HB3, WF0_HB4, WF0_HB0,
> +                     WF0_HB0_B, WF0_HB5, WF0_HB6, WF0_HB7, WF0_HB8, WF0_HB9,
> +                     WF0_HB10, WF1_DIG_RESETB, WF1_CBA_RESETB, WF1_XO_REQ,
> +                     WF1_TOP_CLK, WF1_TOP_DATA, WF1_HB1, WF1_HB2, WF1_HB3,
> +                     WF1_HB4, WF1_HB0, WF1_HB0_B, WF1_HB5, WF1_HB6, WF1_HB7,
> +                     WF1_HB8]
>  
>            bias-disable: true
>  
> -- 
> 2.18.0
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 

