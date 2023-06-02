Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73FBBC77B7A
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jun 2023 08:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S6o32+EXqkQOwwvwWTyyFIWUzWvHCRd3bW8dtLzYc0M=; b=FxfYcYICiKFX3lvBSRzEeBCY31
	W/rfczGIt9SgZEBhRX9ioRAx10110gRufyGf22YWjyakfHzE8QiQs6aPlFSGdT3Tu4/eKnsUCutxO
	MEnu2CG6mwwtMvww1zQjaHtBy+Wa2Ft3cIjgFbAd/MPopxrWaBoz0LDapM8fd/bWoAGA+MnmKSmPe
	yCrAyotlUBu94I28in3M7efc4+I9GOF8faoAWsmOJL4Rcpy3i63mYrd+iZnEFxxpCiPPUmvtEDXVH
	+5jzt4n51HTj//tQbHIXObCIKWTcdhq1KVMQlo7U8FaZuT6r9/GMWTlhswPdV/hVbTvgJdZmbs5w0
	lSsFbQlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q50DV-006ABJ-31;
	Fri, 02 Jun 2023 08:33:01 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q50DS-006A9B-1s
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Jun 2023 08:32:59 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-97458c97333so128185066b.2
        for <linux-mediatek@lists.infradead.org>; Fri, 02 Jun 2023 01:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685694774; x=1688286774;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S6o32+EXqkQOwwvwWTyyFIWUzWvHCRd3bW8dtLzYc0M=;
        b=SF+7px9QcZH1m1Vj1b2GfXALro+NdRTuZIllFGdKVav7TEBvES/2uDpWKVI9xCZWZj
         Iv4bT38X4VR2ZAahaID8tl7YnfQCN+dfYwrgfbmTjOg1U7rD7NSOfjpjrWHShz7TJyZY
         YcTLPTBP6SIuO7QCpCu72aRFZO6EQUipoA2O/r+AmyTKNT45OebGXlQrEew7g4fHcWMF
         OVrAocSDqDleCKKAaH70gdYegshPK3bxyqFB5qSxqTmvtlaZcG4jmIc5e0rMFKGEzSJA
         Tysc9o6h3haQDhWXsvkxQhM8zCT2RaiSSLJOfFY3rkol/FC7XZY12Jh9hC8Fk6fX5yEm
         ajHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685694774; x=1688286774;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S6o32+EXqkQOwwvwWTyyFIWUzWvHCRd3bW8dtLzYc0M=;
        b=Qvm/GU2z1wkIXjamZ3mZeTuXr0eTBQc8/QMWC2dDonFb5gylqpS4tb6nZeHns/sr89
         z1V4hM6tuoVdzzBd2DQZrs+5E1l4e3jjA4DUM2AAW8iSXpz6X+03rUfl3r+Z+a8fOR9t
         DhYpSPWgNeQF8n5wPXOYQ+N8etDmmBQ7VGru06AKVONq4DXwBsSW9W5JCnBKEP6AmYn8
         mt5BXP25FUiUK51K91f6IsxC6G+GeFB+3A3/hKQ1zxrT/jj8h3YopvAIH8zYD6EDExLo
         KnaS7V3YEsSLFvWurvN6f1Gmsg3DgTlq+qSM+Lji12r7fmCUcCX48R5p1AhooA3dU+Ww
         4ttg==
X-Gm-Message-State: AC+VfDzgwwwI8Cmz91CmC1Rj6Te5J9e6pHHmrtqAYEC5bRHUQh2BFbP4
	/WnLkDC2wFgMzgMy0qwbkxSYXA==
X-Google-Smtp-Source: ACHHUZ5bbkg1zhdbdLCCj6ww+0OpxboaT0r5ApjCE5h604Y3MUUFQIlVUcvBkPvczEmb5mkg4VqJdw==
X-Received: by 2002:a17:907:a42a:b0:96f:912d:7922 with SMTP id sg42-20020a170907a42a00b0096f912d7922mr9551134ejc.53.1685694773958;
        Fri, 02 Jun 2023 01:32:53 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id y26-20020a17090668da00b00947ed087a2csm461979ejr.154.2023.06.02.01.32.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jun 2023 01:32:53 -0700 (PDT)
Message-ID: <75d78713-fc8f-24a9-a422-2b4d57c5d488@linaro.org>
Date: Fri, 2 Jun 2023 10:32:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3 3/8] dt-bindings: leds: leds-mt6323: Support WLED
 output
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 pavel@ucw.cz
Cc: lee@kernel.org, sean.wang@mediatek.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20230601110813.2373764-1-angelogioacchino.delregno@collabora.com>
 <20230601110813.2373764-4-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230601110813.2373764-4-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_013258_666778_58E00D55 
X-CRM114-Status: GOOD (  12.71  )
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

On 01/06/2023 13:08, AngeloGioacchino Del Regno wrote:
> Some PMICs have a separated WLED string output: add a property
> `mediatek,is-wled` to indicate which LED string is a WLED.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/leds/leds-mt6323.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-mt6323.txt b/Documentation/devicetree/bindings/leds/leds-mt6323.txt
> index 052dccb8f2ce..904b2222a5fe 100644
> --- a/Documentation/devicetree/bindings/leds/leds-mt6323.txt
> +++ b/Documentation/devicetree/bindings/leds/leds-mt6323.txt
> @@ -30,6 +30,7 @@ Optional properties for the LED child node:
>  - label : See Documentation/devicetree/bindings/leds/common.txt
>  - linux,default-trigger : See Documentation/devicetree/bindings/leds/common.txt
>  - default-state: See Documentation/devicetree/bindings/leds/common.txt
> +- mediatek,is-wled: LED string is connected to WLED output

Why would it matter to what the output is connected to?

Best regards,
Krzysztof


