Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46696C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 Apr 2022 14:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O8u8ivt9EnTxi36TWAQ4zwFRuk4OkYKqdBYgV+G0GRM=; b=QKLafGvo2QYkv9
	aPnVE6/3rVaPEh1GCsP0/Lf95uN34bGhp340e0Cto22WiERkI6IbOi4WgKCc6xBOFhaizhsKxRa2m
	xBJDUU836BPyGD4v16d5GfafrwcqPDSF+9/IMn/kE7glcVdyG+J1Rlrwv9w/Mnsiyon6Hd7HL31Ec
	65m0FEEe3a8XqjhsYsGjVV+EE2Hl0DY8daI4QLvJ8gqGF4HQJySlmbKU21/6KCyFW8kKZxWJJWa0O
	fjZkEM+WM6nFOAhQWJQrKETvmX811bQPsB6k7w3ahGfHcqWlpwRRBsj93bqnltynomZ3C2ziO93Ql
	zwqiBzSA9l4Uq5f80Qew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nida5-006k3Y-AC; Sun, 24 Apr 2022 14:51:21 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nidZv-006k1I-Cf
 for linux-mediatek@lists.infradead.org; Sun, 24 Apr 2022 14:51:13 +0000
Received: by mail-ej1-x62c.google.com with SMTP id bv19so25073226ejb.6
 for <linux-mediatek@lists.infradead.org>; Sun, 24 Apr 2022 07:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Jlt+fA+vOeb8IM3V8yMFQW99adzhPmpEhEfI7X3D0o8=;
 b=xeLzYyAxGEKZXJVZR8n/Z+L0TleSlbbCDYMIsekFHrLJJXhoc16KCrNshrqD7h+So7
 YJVCAjNJp/d3ON+3+w27WiDSyKh0Oiu0bkNnoc6V9NA+E9b5k0nCMBlz3BrMfsf7q6Kg
 ivH0w4+gfkiGJjyswvkGlbA9zr7I6sPSm3UHTKNHDZdlbGGTp7Nk0yPHqhLTd1ZHLI5O
 sJgsBZBbxMSuteX90eXV3OBk944DMYJmqoH8qjaIxWHiSPWf7os5eN371ckv9POny5An
 cSoJEDhre2uHahuJa4QizcOI3xbX7/d70Y4MqgVciQ8xR/uN2kCzAeb6IK8MpwXK0w6U
 GxeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Jlt+fA+vOeb8IM3V8yMFQW99adzhPmpEhEfI7X3D0o8=;
 b=y2zPnroTY2HA3dyyK4JITEhvgzXajBZL8eGy1Zrl/HGPXE5wzeDdv8uw2xaujDjbt+
 u9FjE4e112PLLN9DuIuTdl2ST5agL+pEdLTkn82QkaLZSpRgLfVd3qjHQLdXUYvA5NZC
 0RZA/hBg6Ma9jEUOLqWyIMgb0aWplw/kBHCXn9I+DbDOnivfNwIdh3lJiynmk+C3fkwc
 eocbGoeuRrrvpUe294e42guZDfpt12fwSEKzuCtgqBM5pS2wJS0oLyYjI3X+IrezdlbU
 6tKLSMOjg4OIQ1uclmVoSwd1aYi9aagyitCVuMuYiiAfnM7V/SSpMFhnZ6K/PwW4T5ui
 IZaA==
X-Gm-Message-State: AOAM530yMkHFwQnTOQtJkfg2Fn0ToUGdtpwXXeCD/i9Peku4oqLWFVh1
 dehhLMu9w5eLaHyXUXitRpsdSA==
X-Google-Smtp-Source: ABdhPJwVoYu3IEZHp02b1FMVj/R5bCFc9eYx5xl8CAE+uM+mYpF2alIbWgr36wrbYUlSz8v9RQqtdg==
X-Received: by 2002:a17:906:2709:b0:6f0:13d5:d58f with SMTP id
 z9-20020a170906270900b006f013d5d58fmr12392721ejc.443.1650811868117; 
 Sun, 24 Apr 2022 07:51:08 -0700 (PDT)
Received: from [192.168.0.235] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 mp8-20020a1709071b0800b006efc915e1ccsm2659478ejc.118.2022.04.24.07.51.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Apr 2022 07:51:07 -0700 (PDT)
Message-ID: <66e03e68-3a73-1b2e-0694-cba5b072d8e6@linaro.org>
Date: Sun, 24 Apr 2022 16:51:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/1] dt-bindings: timer: mediatek: Convert binding to YAML
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>
References: <20220422131317.25410-1-allen-kh.cheng@mediatek.com>
 <20220422131317.25410-2-allen-kh.cheng@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220422131317.25410-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_075111_478018_78FA1393 
X-CRM114-Status: GOOD (  11.81  )
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

On 22/04/2022 15:13, Allen-KH Cheng wrote:

You should also fix the DTSes to match the new schema.

> +$id: http://devicetree.org/schemas/timer/mediatek,mtk-timer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek SoCs timers bindings
> +
> +description:
> +  MediaTek SoCs have two different timers on different platforms,
> +  - GPT (General Purpose Timer)
> +  - SYST (System Timer)
> +
> +maintainers:
> +  - Fengquan Chen <fengquan.chen@mediatek.com>
> +  - Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> +
> +properties:
> +  $nodename:
> +    pattern: '^timer@[a-f0-9]+$'
> +
> +  compatible:
> +    oneOf:
> +      - const: mediatek,mt6577-timer
> +      - const: mediatek,mt6765-timer

These two entries should be an enum.

> +      - items:
> +          - enum:
> +              - mediatek,mt2701-timer
> +              - mediatek,mt6580-timer
> +              - mediatek,mt6582-timer
> +              - mediatek,mt6589-timer
> +              - mediatek,mt7623-timer
> +              - mediatek,mt8127-timer
> +              - mediatek,mt8135-timer
> +              - mediatek,mt8173-timer
> +              - mediatek,mt8516-timer
> +          - const: mediatek,mt6577-timer
> +      - items:
> +          - enum:
> +              - mediatek,mt7629-timer
> +              - mediatek,mt8183-timer
> +              - mediatek,mt8186-timer
> +              - mediatek,mt8192-timer
> +              - mediatek,mt8195-timer
> +          - const: mediatek,mt6765-timer
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: clk13m
> +      - const: bus

When is the bus clock optional?

> +
> +required:
> +  - compatible
> +  - reg

clocks are required in the old bindings

> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    timer@10008000 {
> +        compatible = "mediatek,mt6577-timer";
> +        reg = <0xd4014000 0x100>;

reg does not match unit address.


> +        interrupts = <13>;
> +        clocks = <&coreclk 2>;
> +    };
> +
> +...


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
