Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8329AEE49AB
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Aug 2023 19:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wP8V56gMXjaMA8xuJivdqqb4a/TtPfVwzUH0TySnGFk=; b=3eiiTtImhYwuSkHGQQERtSU5uL
	SmtHk4A0qtBTiIpxB/ks0CdlKTlLIoWEKFevhyK4ciFaOpN19ltRJQP7lR8k536g3YnCZu51uLtJ/
	fZAE7+XQTCWubca1ti2Z1Hgmb/kTp2rKf3W5mdmpfZZ8nvZbOcJxuC4j9MbGqcs37ZbjH/EzE85aF
	gY0iuF1HCMfQbeClwIjxH36HutLomNfKLgGPoLhVmYH6YnQ7rCeEzVCYrj/cjbnb7ftW1UyIv0fSe
	lOCslrqwJytY6tlouA/xoSm2JQn6YPriyk+ajqPHv4u9zNLFHatoXRvJDYkc6gfHm8gNXNWeMUnGB
	YJwGRCow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYXLa-00Gjtw-11;
	Tue, 22 Aug 2023 19:47:26 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYXLY-00GjtK-1T
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Aug 2023 19:47:25 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-99c93638322so1000449966b.1
        for <linux-mediatek@lists.infradead.org>; Tue, 22 Aug 2023 12:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692733643; x=1693338443;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wP8V56gMXjaMA8xuJivdqqb4a/TtPfVwzUH0TySnGFk=;
        b=LPcyBY6Q4QNpkQalwXGTtYZCiFulPmXItYy3/b8aUob4oxkCVmmRoW1RvqYR1saZM6
         wU5t4iP9L3wAty3cpb5TpDB9FVXbEqDs4Com3WHkbRwOHu/mzB7Zj+kVNerKiZl75Abl
         Crs2stECCBhYREA06BMqTSX0HW2BAZB/TQx5AyZ+JoHONbvFgQcM2XJtKCUSJc0bL87a
         31pWTfq1F4Zl7ZONEWWif7SLFEvcW3+VjebjI69zb1QsMwIdHkk3jvf/Zow1Z1Sz+q2C
         bhxr4MIdWMgcnXi6MBNfA5xLM28ZzQSXxBCF+3kgCZV3nBFTmaNVJubSFp3xdo5Y6mmC
         HN1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692733643; x=1693338443;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wP8V56gMXjaMA8xuJivdqqb4a/TtPfVwzUH0TySnGFk=;
        b=j9QEPFqhE3au0+IY43HMyZNFaghTDhCnb+ojOXpAkt9B6P40nn6LTmPs1TAYCTYbtS
         n2x1j0veFT/q8RZd8v6IRFGz2nSH7ehyp1XjOOQr39ActK1tdJnFhPqmpbLxibdMwQyd
         aLUTBEg+vZ8BEPH1ydKQ3voKt1jDgrxECH3CgALMG1vdrBcoQK0ssRr+Oe8VfHhlguH9
         QmvVtiHNjhPQ2KJg88bivCbF5AApdxXhVWMjN7SmSCcI6t2YVJOspTOATO76bmV10ulo
         JSJHxaNE4NzwAOeq3Fe8OWTbE8PtCCKOcLMoeA+aoWM6s8GKyOMhubTzp8t5XrvFxIXF
         021A==
X-Gm-Message-State: AOJu0YykoAL9oM4ip04w6JKOSj3PYnghDPWVBGLymIhtPdOvRIMnrbXr
	UwvFXQGCQFjSKoNKuxjWWfsF6g==
X-Google-Smtp-Source: AGHT+IFA6vaH037bqItmbCjTD2cq16Ead293Dy7L2D+0FCyaqdqwV2We88f45rka1i6WgI/a9bPy5w==
X-Received: by 2002:a17:906:c116:b0:993:f664:ce25 with SMTP id do22-20020a170906c11600b00993f664ce25mr11084012ejc.19.1692733642939;
        Tue, 22 Aug 2023 12:47:22 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id n12-20020a170906688c00b00982be08a9besm8870178ejr.172.2023.08.22.12.47.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 12:47:22 -0700 (PDT)
Message-ID: <5ad5ff92-1367-ba96-b126-da80511a2769@linaro.org>
Date: Tue, 22 Aug 2023 21:47:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 03/11] regulator: dt-bindings: mt6358: Convert to DT
 schema
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mark Brown <broonie@kernel.org>
Cc: Zhiyong Tao <zhiyong.tao@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230822084520.564937-1-wenst@chromium.org>
 <20230822084520.564937-4-wenst@chromium.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230822084520.564937-4-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_124724_491279_923EF03D 
X-CRM114-Status: GOOD (  13.69  )
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

On 22/08/2023 10:45, Chen-Yu Tsai wrote:
> Convert this from the old style text based binding to the new DT schema
> style. This will make adding the MT6366 portion easier.
> 
> The examples have been trimmed down considerably, and the remaining
> entries now match what is seen in actual device trees.

...

> +---
> +$id: http://devicetree.org/schemas/regulator/mediatek,mt6358-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6358 Regulator
> +
> +maintainers:
> +  - Zhiyong Tao <zhiyong.tao@mediatek.com>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  Regulator node of the PMIC. This node should under the PMIC's device node.
> +  All voltage regulators provided by the PMIC are described as sub-nodes of
> +  this node.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6358-regulator
> +
...


> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/regulator/mediatek,mt6397-regulator.h>

mt6397?

> +
> +    regulator {
> +        compatible = "mediatek,mt6358-regulator";
> +
> +        buck_vgpu {
> +            regulator-name = "vgpu";
> +            regulator-min-microvolt = <625000>;
> +            regulator-max-microvolt = <900000>;
> +            regulator-ramp-delay = <6250>;
> +            regulator-enable-ramp-delay = <200>;
> +            regulator-allowed-modes = <MT6397_BUCK_MODE_AUTO

mt6397?

Both cases look a bit confusing.

Best regards,
Krzysztof


