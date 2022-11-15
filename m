Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D59C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 10:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=myaQTYekEEvCf76a4+gISy0XqIGFzl2LwV2cgISui5Q=; b=4Gk6CK+3RYnzfzHYLUz/qgNPCj
	DIk5uVhB39q3Z2g2g6+DCBV1cr/gIHV/mgjF3TV6rY3nkxHfJ0+OmHTpGE7BN2jIU5Zbdt0Jndxhn
	AaYJY91wuEqVnj98HuOxXN0wK/fRULzOLFQPHKXxt3gKmdZao4MagP2Bd+ZbwPqVllqtObJMzNH6G
	P7qaMwFb/SbGXvuk7uG94o19U4q60+W2+B5/tTsY17y5RHiwcE5QwDPFdIVi3Sj2hG7uXrqdI7Snq
	JUGL/gBORmQeITJN8n5nhb07bVJMeQG7mRL55zHJPGbLJYfF1K/IzQOn20j9HT6yDcqxDH2bYI72I
	g303mxhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ousls-009gHv-UA; Tue, 15 Nov 2022 10:02:24 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ousWL-009XlB-A8
	for linux-mediatek@lists.infradead.org; Tue, 15 Nov 2022 09:46:22 +0000
Received: by mail-lj1-x22c.google.com with SMTP id d3so16807387ljl.1
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Nov 2022 01:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=myaQTYekEEvCf76a4+gISy0XqIGFzl2LwV2cgISui5Q=;
        b=X1IWKQj3w5D972UXgMdWCTaFrnyGHi/VzgHqCFHZRaKPGXuud6oEjzpTNLbEydjTpb
         zyxE+Xz/mdfV8rXm1CRknMStZnl73HBDzMzSTD+6nKbeZG35NzG+rl+fG/huKbN6ESdL
         a9X5OiPLc+ecSaWltKRK4+b/8cwiTtwKwC1/3SRzkzyJI8WNPcVUVE6JoNWyxGQeQufX
         xOiPXLNq1SQDpPaCbFv4pjtCeFhkavS5B8RT3aP3BLlKeMBDFplc3RlgH/4Gsp0zWzuM
         y2g3h6SKJlgFj9eDXHXJQ5hR1UOiG/nY1E9LyDHNkDmb21kXWIBWpkKXMlca9QaXKJjx
         ES0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=myaQTYekEEvCf76a4+gISy0XqIGFzl2LwV2cgISui5Q=;
        b=MLPIwmrgge35HG7FUJe7sYOqA9I0rNfCO/MypI3LoAcEh7x3/72z7S0GlYfdBrzGox
         pyceDm/lJUms+SJfwj2XRUuE36FVTwi7IW6Ny4mwWvzBWyOLeG4FK5XYVObqNEbbPw3m
         K7Kdo3a8B4G6oBIAa9y/6YWUaT+KTy/zJEJruWto3IQaoOf7Ot/YltFQFcIDuYnSmXAb
         MPTHH1/tXeZWiSzqrZ8jhc9yvXSlN4fjbQM8HGx1TH13C6bvNm7WbK1VtKixj64ft2bb
         3YgJtaz1cDVr3uu4gR2AKtztj3hOP07fRbzbzdCn9spbdychFTx8PVl6mtigEOMP2eEE
         UZkQ==
X-Gm-Message-State: ANoB5pm89f27DcV65AiOV3d+nz9pdZrPql7hodRbUPVlmh7lUG7xZgXA
	ftR95XM3/X++9brcBoR1MtNc2w==
X-Google-Smtp-Source: AA0mqf4LhGjamVr1Hys8y0bwuIu6sZlCP5+dinsuwstOAf/Naygjc5ex3Zg7j1wIEjz5EXY0OnuBcw==
X-Received: by 2002:a2e:8892:0:b0:277:9847:286a with SMTP id k18-20020a2e8892000000b002779847286amr5124555lji.309.1668505578768;
        Tue, 15 Nov 2022 01:46:18 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id t10-20020a195f0a000000b0049c86ca95bfsm2143300lfb.52.2022.11.15.01.46.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 01:46:18 -0800 (PST)
Message-ID: <13220449-5b86-e79c-54ce-2f8883b7a036@linaro.org>
Date: Tue, 15 Nov 2022 10:46:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 11/15] dt-bindings: pinctrl: add bindings for Mediatek
 MT8365 SoC
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
References: <20221107211001.257393-1-bero@baylibre.com>
 <20221115025421.59847-1-bero@baylibre.com>
 <20221115025421.59847-12-bero@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221115025421.59847-12-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_014621_407225_9D2E52A8 
X-CRM114-Status: GOOD (  13.89  )
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

On 15/11/2022 03:54, Bernhard Rosenkränzer wrote:
> Add devicetree bindings for Mediatek MT8365 pinctrl driver.
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
> ---
>  .../pinctrl/mediatek,mt8365-pinctrl.yaml      | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
> new file mode 100644
> index 0000000000000..bddff8c2fd382
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/mediatek,mt8365-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT8365 Pin Controller
> +
> +maintainers:
> +  - Bernhard Rosenkränzer <bero@baylibre.com>
> +
> +description: |+

I am not going to review this - please go through comments you received.


Best regards,
Krzysztof


