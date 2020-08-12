Return-Path: <SRS0=Jt7l=BW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E493AC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 22:37:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B077A20774
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 22:37:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jWkjSd2s";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TZbiQ0EQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B077A20774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pVODfrinJydKtNYNgYRuCKWAi9IeiZs+KMEg+DgCLUE=; b=jWkjSd2s8Y1ZN0bWY3jg2CW2D
	WlYx6OfwcWwzn4TXfbWlPztMiSuKI0HkKq0hxvN6c4vJKxK3fxPA8Joe7rtz5eEPOGYp/KqfeZJl3
	dO4ULXeKwmAXgWRwOp5P4MuFD8MbUo6kiZxqvVjpEhZhjcXs2S5Ti38Uc06s/QmHjBnq/o+mq0yPx
	lyHdM/jBapU8xPGOnLThWAECRsRct8cFpacGOK1iepc28r8sYrKp0TrZE4GBoOx0cBY0sVzQE3ItH
	vdKk6JZj6kMlJHLqqq8vo/20FJEDha5qjjiLeCLZlA5n2YwRFSwmdvvRZd04jOL1qNoLUTjJFdnzN
	GKzbPCn9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5zN0-0000aV-U6; Wed, 12 Aug 2020 22:37:18 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5zMy-0000Zx-Dm; Wed, 12 Aug 2020 22:37:17 +0000
Received: by mail-pg1-x544.google.com with SMTP id h12so1774330pgm.7;
 Wed, 12 Aug 2020 15:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=M0mzyOw7T8Q1fOZrcOZc/fxVuVoJEqZckDUmqWvlGa0=;
 b=TZbiQ0EQZICBMmk6NGhb7VxPKZRs3HtXD+j4Ubk5CWG1QmywURlI+Wzc9vaTGIhB/M
 HIJnXe+HmLEUw3FMSzEJJp1YPass1Rf5lN4/yrguecl/epXEqF9xkgHOWbV7UBVIX8pC
 OX86kiv+kNHVhdNC3teOoGXnm0bRGlviA+VQqE6BU+x7QoomUPGP9T6LCWFU20MmLnRf
 pxfdUDuYnhKADovbKSp/LzgL4ruSl9j0WQvoFigxbcU6OsdqK4uP8Kt0ud7RHajmYvYZ
 0GTxHcNpSF9euS59CcHVdhNv+v/xcOElOtgGpS3AYEwy2RTeQHpBV0VXRsLzvdW9At/G
 r5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=M0mzyOw7T8Q1fOZrcOZc/fxVuVoJEqZckDUmqWvlGa0=;
 b=FVoBmFpQq6x7w5aCxKF6PYzJuSHsZ3DujDURGCDE98PgFFaVrLuG5V0Poj3sJ4fh9X
 /KbF3LaLfTx6VurXweCcfMyIkqBXrs5hSeMzQjhC75hjs1Jk/IqrTjGggl49icWkTG3d
 E6snLUAX8+/LGJMQB6Pzl86l96Dk+GTLFBK9eyCy8cFwa6vCo9hBcEUcflcJjXf22x3W
 Ur1rEKVTCqlqP2PozySYJu9dt7dSkP9oH5TMl62T9r2Hhljb9lFLDc5ACGt67vm9iUrF
 +5tj3Ge0fXnln3YLPrGvttvwIR3U+DZHBqasNHzEzv4e+7R42uuq161lEXARtPJn6SLM
 b4rQ==
X-Gm-Message-State: AOAM532eLcdeqGqDeo8lLIOBAUfBrUZCSyD7oS5kr22lKl6RWHn0psbr
 gEsTuakMh4HBs91Y/xuGBX8=
X-Google-Smtp-Source: ABdhPJy0Qr3vqJ++ena8fqbf5oBYsMHzL5MsqDW2HMeKTs13ehBPvCjo/9PjLs8r0sTBQMThjU8GnQ==
X-Received: by 2002:aa7:9f1b:: with SMTP id g27mr1548294pfr.215.1597271833977; 
 Wed, 12 Aug 2020 15:37:13 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
 by smtp.gmail.com with ESMTPSA id s6sm3361321pfb.50.2020.08.12.15.37.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 15:37:13 -0700 (PDT)
Date: Wed, 12 Aug 2020 15:37:11 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Fengping Yu <fengping.yu@mediatek.com>
Subject: Re: [PATCH v17 1/3] dt-bindings: Add bindings for Mediatek matrix
 keypad
Message-ID: <20200812223711.GT1665100@dtor-ws>
References: <20200810064058.6467-1-fengping.yu@mediatek.com>
 <20200810064058.6467-2-fengping.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200810064058.6467-2-fengping.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_183716_539063_B42C6CD8 
X-CRM114-Status: GOOD (  27.47  )
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
Cc: devicetree@vger.kernel.org, Marco Felsch <m.felsch@pengutronix.de>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-input@vger.kernel.org,
 Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Mon, Aug 10, 2020 at 02:40:57PM +0800, Fengping Yu wrote:
> From: "fengping.yu" <fengping.yu@mediatek.com>
> 
> This patch add devicetree bindings for Mediatek matrix keypad driver.
> 
> Signed-off-by: fengping.yu <fengping.yu@mediatek.com>
> ---
>  .../devicetree/bindings/input/mtk-kpd.yaml    | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/mtk-kpd.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/mtk-kpd.yaml b/Documentation/devicetree/bindings/input/mtk-kpd.yaml
> new file mode 100644
> index 000000000000..d74dd8a6fbde
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/mtk-kpd.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +version: 1
> +
> +$id: http://devicetree.org/schemas/input/mtk-keypad.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek's Keypad Controller device tree bindings
> +
> +maintainer:
> +  - Fengping Yu <fengping.yu@mediatek.com>
> +
> +description: |
> +  Mediatek's Keypad controller is used to interface a SoC with a matrix-type
> +  keypad device. The keypad controller supports multiple row and column lines.
> +  A key can be placed at each intersection of a unique row and a unique column.
> +  The keypad controller can sense a key-press and key-release and report the
> +  event using a interrupt to the cpu.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: "mediatek,mt6779-keypad"
> +      - const: "mediatek,mt6873-keypad"
> +
> +  clock-names:
> +    description: Names of the clocks listed in clocks property in the same order
> +    maxItems: 1
> +    items:
> +    	- const: kpd
> +
> +  clocks:
> +    description: Must contain one entry, for the module clock
> +    refs: devicetree/bindings/clocks/clock-bindings.txt for details.
> +
> +  interrupts:
> +    description: A single interrupt specifier
> +    maxItems: 1
> +
> +  linux,keymap:
> +    description: The keymap for keys as described in the binding document
> +    refs: devicetree/bindings/input/matrix-keymap.txt
> +    minItems: 1
> +
> +  reg:
> +    description: The base address of the Keypad register bank
> +    maxItems: 1
> +
> +  wakeup-source:
> +    description: use any event on keypad as wakeup event
> +    type: boolean
> +
> +  keypad,num-columns:
> +    description: Number of column lines connected to the keypad controller,
> +    it is not equal to PCB columns number, instead you should add required value
> +    for each IC. If not specified, the default value is 1.

What sets the default? matrix_keymap_parse_properties() will error out
if either property is not present....

> +
> +  keypad,num-rows:
> +    description: Number of row lines connected to the keypad controller, it is
> +    not equal to PCB rows number, instead you should add required value for each IC.
> +    If not specified, the default value is 1.
> +
> +  mediatek,debounce-us:
> +    description: Debounce interval in microseconds, if not specified, the default
> +    value is 16000
> +    maximum: 256000
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - linux,keymap
> +  - clocks
> +  - clock-names
> +
> +examples:
> +  - |
> +
> +  kp@10010000 {
> +    compatible = "mediatek,mt6779-keypad";

Should we call the driver mt6779-keypad ?

> +    reg = <0 0x10010000 0 0x1000>;
> +    linux,keymap = < MATRIX_KEY(0x00, 0x00, KEY_VOLUMEDOWN) >;
> +    interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_FALLING>;
> +    clocks = <&clk26m>;
> +    clock-names = "kpd";
> +  };
> -- 
> 2.18.0

Thanks.

-- 
Dmitry

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
