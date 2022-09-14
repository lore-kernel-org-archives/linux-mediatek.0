Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C17C6FA82
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 16:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0a1rSxvAJG0YnYk7+iIiw+NeG9+9V8j9zpStoZYAMfg=; b=kYrnttQcfDve8Yhm7n40Ytn63+
	g4S3AYIyMyYEXrJhK27H/t+aJL4WkI5SNV85YaLFmke0u6V/VoYkBr7vmqI2CSuo9lxxk3Y3GQQmM
	kmS8epm97lI+ZczRuZKq1XoGIhZSlZWZG3SAOJbDueoqA9BZpuX18VRvWyGxQwe0TjJ7DnEZK1/C9
	IwqqFWRqVbbdbfT4RM3n+9n8GqY0iW2QSiwxT3ypLfR3qNDc57FfCOZh7ppmsoebpx6EcydiDXM8X
	zKx79cWd4Mk8YOuNwnShuGMnwLZMTMIJLVixOPpWBhzjHcrrEc4t3matCcM6F56yka5+p4p7GN5Y4
	j6PPnbhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYUrL-004cKV-DL; Wed, 14 Sep 2022 16:03:31 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYUqf-004bWK-Dc
	for linux-mediatek@lists.infradead.org; Wed, 14 Sep 2022 16:02:52 +0000
Received: by mail-wr1-x434.google.com with SMTP id z12so8130050wrp.9
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Sep 2022 09:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date;
        bh=0a1rSxvAJG0YnYk7+iIiw+NeG9+9V8j9zpStoZYAMfg=;
        b=u7sQ9YzDa9AJttRF+k1/nMcRPdRO+kG+nfqYPxJ3nVXs9DRbmmGr7tuqKKhGqFWK4z
         kTXcHAfcLUGjEFEyZ0/r4eO8uWM23Fsq0qt+UY0ZHrpmm/WCs8GBsLK9Qnawv0/xn0tN
         3SMXx/1Dd4d77k/Yj6dxjyZ1c2V+ndnhDXQwdKY82wCixqLbhHm0PnCu0EWVFnIClXyw
         xUIrmpBknDUwOWb15hb82/S8XCUYzUnORQm1GcGvqo4Y3zLpf044H5WzbhXRif+JxQ8P
         EXeDQNwV0Mj7XtH3F17ztuSMhj0aNcoHyLdWi6pF66KjdJL17Anltq1bpS3U7DshrFmc
         ucXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=0a1rSxvAJG0YnYk7+iIiw+NeG9+9V8j9zpStoZYAMfg=;
        b=EfUPmE2XY8/LezPsjm5ZyFzckozdt+Y/7yrhJWCFXkD76yhAdVRtcWT+mmeJsgW5+G
         jjQR9nTEbZ093llvitLP/wnAT7h0aLCp8ydq/qfq9wdclrsBr02lEIYUBuWWFrvvh4/2
         LqwbtDNZmerL8tNKFHuaWYnsf2jDcAeIWvvUbB6Pt4vTbhM8GuHFnTPCyShWTB7UnI9l
         ukWGS3cX3o/TDUk2Z2R6RNAlt08owCEQNSGkM4skMJkIloqsAaP7eiqH3nIe5OPckQa6
         JvplE65ETufy6Ft/YjRftgHBAXxvnN/Z3b0pUeOpD56Y343zTsvNsdopGUsmr507Hn8R
         XZjQ==
X-Gm-Message-State: ACgBeo2IZofDCDARqTY6M7uOdysiWbhJVGzEX8nQjG2RRUo6fA662Ilt
	2daoxhjPrKWUDBQDOz3JNaXcAw==
X-Google-Smtp-Source: AA6agR7zCloyLg9dA6SkmO6teoejjwRwhuaiZfmAYiHwsaIJNXiwj59Jq8E/lGyPllk5k9+m78yl/Q==
X-Received: by 2002:a5d:47a8:0:b0:226:f124:ad74 with SMTP id 8-20020a5d47a8000000b00226f124ad74mr23034923wrb.18.1663171361878;
        Wed, 14 Sep 2022 09:02:41 -0700 (PDT)
Received: from localhost ([185.122.133.20])
        by smtp.gmail.com with ESMTPSA id h17-20020a05600c2cb100b003a5ca627333sm19229570wmc.8.2022.09.14.09.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 09:02:41 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 krzysztof.kozlowski+dt@linaro.org
Cc: dmitry.torokhov@gmail.com, robh+dt@kernel.org, matthias.bgg@gmail.com,
 chen.zhong@mediatek.com, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: input: Convert mtk-pmic-keys to DT
 schema
In-Reply-To: <20220914103021.43593-2-angelogioacchino.delregno@collabora.com>
References: <20220914103021.43593-1-angelogioacchino.delregno@collabora.com>
 <20220914103021.43593-2-angelogioacchino.delregno@collabora.com>
Date: Wed, 14 Sep 2022 17:02:40 +0100
Message-ID: <87leqmt04f.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_090249_498407_B741A461 
X-CRM114-Status: GOOD (  23.49  )
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

Hi Angelo,

On Wed, Sep 14, 2022 at 12:30, AngeloGioacchino Del Regno         <angelogioacchino.delregno@collabora.com> wrote:

> Convert the mtk-pmic-keys to DT schema format.
>
> The old binding was missing documentation for key press/release
> interrupts, even though it was supported in hardware and driver,
> so support for the same was added during the conversion.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/input/mediatek,pmic-keys.yaml    | 113 ++++++++++++++++++
>  .../bindings/input/mtk-pmic-keys.txt          |  46 -------
>  2 files changed, 113 insertions(+), 46 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
>  delete mode 100644 Documentation/devicetree/bindings/input/mtk-pmic-keys.txt

Thank you for doing this. I started this but it seemed you were faster
than me :)

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

>
> diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
> new file mode 100644
> index 000000000000..9d8a0c3aebca
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
> @@ -0,0 +1,113 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/mediatek,pmic-keys.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek PMIC Keys
> +
> +maintainers:
> +  - Chen Zhong <chen.zhong@mediatek.com>
> +
> +allOf:
> +  - $ref: input.yaml#
> +
> +description: |
> +  There are two key functions provided by MT6397, MT6323 and other MediaTek
> +  PMICs: pwrkey and homekey.
> +  The key functions are defined as the subnode of the function node provided
> +  by the PMIC that is defined as a Multi-Function Device (MFD).
> +
> +  For MediaTek MT6323/MT6397 PMIC bindings see
> +  Documentation/devicetree/bindings/mfd/mt6397.txt
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt6323-keys
> +      - mediatek,mt6358-keys
> +      - mediatek,mt6397-keys
> +
> +  power-off-time-sec: true
> +
> +  mediatek,long-press-mode:
> +    description: |
> +      Key long-press force shutdown setting
> +      0 - disabled
> +      1 - pwrkey
> +      2 - pwrkey+homekey
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 0
> +    maximum: 2
> +
> +patternProperties:
> +  "^((power|home)|(key-[a-z0-9-]+|[a-z0-9-]+-key))$":
> +    $ref: input.yaml#
> +
> +    properties:
> +      interrupts:
> +        minItems: 1
> +        items:
> +          - description: Key press interrupt
> +          - description: Key release interrupt
> +
> +      interrupt-names: true
> +
> +      linux-keycodes:
> +        maxItems: 1
> +
> +      wakeup-source: true
> +
> +    required:
> +      - linux,keycodes
> +
> +    if:
> +      properties:
> +        interrupt-names:
> +          contains:
> +            const: powerkey
> +    then:
> +      properties:
> +        interrupt-names:
> +          minItems: 1
> +          items:
> +            - const: powerkey
> +            - const: powerkey_r
> +    else:
> +      properties:
> +        interrupt-names:
> +          minItems: 1
> +          items:
> +            - const: homekey
> +            - const: homekey_r
> +
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/input/input.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    pmic {
> +        compatible = "mediatek,mt6397";
> +
> +        keys {
> +          compatible = "mediatek,mt6397-keys";
> +          mediatek,long-press-mode = <1>;
> +          power-off-time-sec = <0>;
> +
> +          key-power {
> +            linux,keycodes = <KEY_POWER>;
> +            wakeup-source;
> +          };
> +
> +          key-home {
> +            linux,keycodes = <KEY_VOLUMEDOWN>;
> +          };
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
> deleted file mode 100644
> index 9d00f2a8e13a..000000000000
> --- a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -MediaTek MT6397/MT6323 PMIC Keys Device Driver
> -
> -There are two key functions provided by MT6397/MT6323 PMIC, pwrkey
> -and homekey. The key functions are defined as the subnode of the function
> -node provided by MT6397/MT6323 PMIC that is being defined as one kind
> -of Muti-Function Device (MFD)
> -
> -For MT6397/MT6323 MFD bindings see:
> -Documentation/devicetree/bindings/mfd/mt6397.txt
> -
> -Required properties:
> -- compatible: Should be one of:
> -	- "mediatek,mt6397-keys"
> -	- "mediatek,mt6323-keys"
> -	- "mediatek,mt6358-keys"
> -- linux,keycodes: See Documentation/devicetree/bindings/input/input.yaml
> -
> -Optional Properties:
> -- wakeup-source: See Documentation/devicetree/bindings/power/wakeup-source.txt
> -- mediatek,long-press-mode: Long press key shutdown setting, 1 for
> -	pwrkey only, 2 for pwrkey/homekey together, others for disabled.
> -- power-off-time-sec: See Documentation/devicetree/bindings/input/input.yaml
> -
> -Example:
> -
> -	pmic: mt6397 {
> -		compatible = "mediatek,mt6397";
> -
> -		...
> -
> -		mt6397keys: mt6397keys {
> -			compatible = "mediatek,mt6397-keys";
> -			mediatek,long-press-mode = <1>;
> -			power-off-time-sec = <0>;
> -
> -			power {
> -				linux,keycodes = <116>;
> -				wakeup-source;
> -			};
> -
> -			home {
> -				linux,keycodes = <114>;
> -			};
> -		};
> -
> -	};
> -- 
> 2.37.2

