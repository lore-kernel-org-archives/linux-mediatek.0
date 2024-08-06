Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3888AC49EA1
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Aug 2024 13:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KjZ+B7CJjhqP+m/bO5FTOcwF44QxPo4QaXX1t94Cl0s=; b=XA+9uySjb2hEG9k/5KulSwY9aC
	NbNTHz7o5zUT/r7rUPeqvSip8fJSOv2Bv+QlugJYQ6ykQr3hnV0TsbnnTu5N5qYe/sUv25KiK0Z7r
	l1txOfD5nmEq3vGObXQxT1d0Dx7PlFWVr1PTaEfpnZeWyRvcDJ7pHMXW+M8BuAhoLZMtnDogwi3Tf
	Ew3k2XU5vjQhJAjTjtLv4VXyBEwcD+v1COgSMNxn8rMQ4Ej9t36YHccqXrsLCJrRadMaXfO7z8u2Z
	ai8KZG9RLr2F7Mme/15tme/9j/Q6pVNRNLUWPzlKbkDlgDzxELYl1lC5aU3c3s5hqTzTIzZpo6G9g
	UTtpzx+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbKRd-00000001p5j-0nhG;
	Tue, 06 Aug 2024 13:41:45 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbKR4-00000001p0k-2rqs
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Aug 2024 13:41:13 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5a156557026so660153a12.2
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Aug 2024 06:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722951668; x=1723556468; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KjZ+B7CJjhqP+m/bO5FTOcwF44QxPo4QaXX1t94Cl0s=;
        b=yvbPBpIK22Vw6IHG1rfVhFkEQPgtpCpZgUilkhm0ZzGsv6C49st5V0qoEWY4yzVnSR
         memtKsb74+w6uiqW2Zu7mriWhB55FB+mVDFdSIdhx7X3LbYem6LosWW6Tn9cxrROMN/t
         OhPkm2NdJFBK+sosRUKuThL9Xd3GoyoLFtdocqpvAX4y1U+1W9Jc3EQ39anQe4NpmtE0
         p++vLO67w67dLMuCtcWX8Nz+bfeIhtGZHmhPlWdOVuM4+sBjMAD5F2oko5NhXwXfnCTl
         08YFAzC+FYB1txhE1/wnenafcgquUFWOnEjo2bnoWl4rh/ilaM5x/Vy/P7WrsnXjHvtJ
         Q5vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722951668; x=1723556468;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KjZ+B7CJjhqP+m/bO5FTOcwF44QxPo4QaXX1t94Cl0s=;
        b=vYH/SaeSTrZ5STvGuRlazfD2lOUggDlGluwQ8MZs/8TGwhDIja8vQOLJ2yWEt5Hkgk
         NIfHBNpC0dvDGo8yTQ0SGIcF9J7WJVfEST7S/1crYjRIpaJyQPsQnrVERh6Z5o5ZFLsJ
         k4F8Y3N8mvLbjfrV2Lt6Ww6oA1XFN4z5J2y8bSGf03+Gw66XZXg5noWAZ6fuSjYCbJKz
         DhXs+SOszpv+TVU7yp8jISdASEzj6RlbFPQTxBfJ7t5Qf3Ttq/P6gkFNaEJZE8p5Eaq8
         noM/nAeIQoT+1bt/3mH0zWL/6yzO3QMvp0iQ9BzMfe0ocZNEh0sC3/iAoY8dtyshCBvv
         HXbg==
X-Forwarded-Encrypted: i=1; AJvYcCUGhgBpa0r+j/9qjo83fi30brvH4evBOP349ulJvjtnofAxPeexoYYodnh6+3DJJebVcrJK/DkPUVx4EIW+qG+33YvS7l2FArfimxMs7ufZ89X/
X-Gm-Message-State: AOJu0YyOl4MZtZhSlBfgCfAD1UCrkG2l1jRZcTNnnM1tmaO56BZgHPYi
	5OglCx/H149mnSlhsxqPUChaJUB6SMgobOjg0FJlMo6hPPeKgQ+ZkQheVy8rfpA=
X-Google-Smtp-Source: AGHT+IEr9YokcXMFBhP43yTLvzGZokvFgQOPmaCReSryinLWQzINmjuvffqaX2333pZrwtWihkAxXg==
X-Received: by 2002:a50:e613:0:b0:5a2:6502:b2ff with SMTP id 4fb4d7f45d1cf-5b7f36f8ac8mr10861582a12.3.1722951667914;
        Tue, 06 Aug 2024 06:41:07 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5b83bc4b902sm5938140a12.79.2024.08.06.06.41.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 06:41:07 -0700 (PDT)
Message-ID: <dcc40975-93f6-440e-8887-7a40a0cb3898@linaro.org>
Date: Tue, 6 Aug 2024 15:41:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: regulator: mediatek,mt6397-regulator:
 convert to YAML
To: Macpaul Lin <macpaul.lin@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>,
 Jason-ch Chen <Jason-ch.Chen@mediatek.com>,
 Chris-qj chen <chris-qj.chen@mediatek.com>,
 MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20240806122507.2766-1-macpaul.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240806122507.2766-1-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_064110_733166_8BDFA0EC 
X-CRM114-Status: GOOD (  10.59  )
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

On 06/08/2024 14:25, Macpaul Lin wrote:
> Convert the MediaTek MT6397 regulator bindings to DT schema.
> 
> Signed-off-by: Sen Chu <sen.chu@mediatek.com>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>


> +
> +patternProperties:
> +  "^(buck_)?v(core|drm|gpu|io18|pca(7|15)|sramca(7|15))$":
> +    description: Buck regulators
> +    type: object
> +    $ref: regulator.yaml#
> +    properties:
> +      regulator-allowed-modes:
> +        description: |
> +          BUCK regulators can set regulator-initial-mode and regulator-allowed-modes to
> +          values specified in dt-bindings/regulator/mediatek,mt6397-regulator.h
> +        items:
> +          enum: [0, 1]
> +      regulator-compatible:
> +        pattern: "^(buck_)?v(core|drm|gpu|io18|pca(7|15)|sramca(7|15))$"

This should not be needed. Same in every other place.

> +    unevaluatedProperties: false
> +
> +  "^(ldo_)?v(tcxo|(a|io)28)$":
> +    description: LDOs with fixed 2.8V output and 0~100/10mV tuning
> +    type: object
> +    $ref: regulator.yaml#
> +    properties:
> +      regulator-allowed-modes: false
> +      regulator-compatible:
> +        pattern: "^(ldo_)?v(tcxo|(a|io)28)$"
> +    unevaluatedProperties: false
> +
> +  "^(ldo_)?vusb$":
> +    description: LDOs with fixed 3.0V output and 0~100/10mV tuning
> +    type: object
> +    $ref: regulator.yaml#
> +    properties:
> +      regulator-allowed-modes: false
> +      regulator-compatible:
> +        pattern: "^(ldo_)?vusb$"
> +    unevaluatedProperties: false
> +
> +  "^(ldo_)?v(cama|emc3v3|gp[123456]|ibr|mc|mch)$":
> +    description: LDOs with variable output and 0~100/10mV tuning
> +    type: object
> +    $ref: regulator.yaml#
> +    properties:
> +      regulator-allowed-modes: false
> +      regulator-compatible:
> +        pattern: "^(ldo_)?v(cama|emc3v3|gp[123456]|ibr|mc|mch)$"
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    pwrap {
> +       	pmic {
> +            compatible = "mediatek,mt6397";

Messed indentation.

Use 4 spaces for example indentation.

Anyway, drop top node or better move the example to the parent device
schema making it complete.

> +
> +            mt6397regulator: mt6397regulator {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +                compatible = "mediatek,mt6397-regulator";
> +
> +                mt6397_vpca15_reg: buck_vpca15 {
> +                    regulator-compatible = "buck_vpca15";

Drop, same in other places

> +                    regulator-name = "vpca15";
> +                    regulator-min-microvolt = < 850000>;
> +                    regulator-max-microvolt = <1350000>;
> +                    regulator-ramp-delay = <12500>;
> +                    regulator-enable-ramp-delay = <200>;
> +                };
> +


;

Best regards,
Krzysztof


