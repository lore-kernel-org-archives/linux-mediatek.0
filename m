Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3A8C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jun 2022 17:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B7cbRCNg26UF8ivWTlzn2A7fgILQXWbzOIRhYJWq/FA=; b=0zzae6j8Fov1EDb2Cp81DWEOst
	N99e4L7bf+H6i4MWMmhiHw1naelBiosRLTxa7k0ANsRxXoWEhBogOtBtBRIAq3K1Lwkyozzorq2P0
	1jtDBvqvinvFKEophxuKAgad0FwIb5gzy0LtlwbNXExDoeKxXMZsg74aXDq3eWuLObR4RGcbTCkiP
	PcNEH3QQ/zXirh0djeNe1up44l78FVFOFJkAWPKkEI0xZ3w4jR2MNgDsrrDk+ot3e/dKFY+Sha2e/
	OmcidgFQ1/MQpbiCQAyhx5tpx6CJ8Ec9hWS+VGLd5kjmxcvjlBggE6owio7kgMDyR2Aa1yK9pR8jY
	C7w937+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1Wr0-00FhxQ-I3; Wed, 15 Jun 2022 17:30:54 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1Wqo-00Fhtj-Co
	for linux-mediatek@lists.infradead.org; Wed, 15 Jun 2022 17:30:43 +0000
Received: by mail-pf1-x42a.google.com with SMTP id 187so12038822pfu.9
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jun 2022 10:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=B7cbRCNg26UF8ivWTlzn2A7fgILQXWbzOIRhYJWq/FA=;
        b=supFxk6DUuphqiJojFl2H/H6UyNMffk7/gM9r72T4tQJooyDKuCJsbpMCf2eQPJBBi
         v5iY9l6cmhbAPuVM00qdGipMMDv1s3kJKf8Eimwj4CYElenmWpCzyUupdZac+rPTy6u/
         mXlk6dy2Kn/NVOvdBFZmLDhJW+Y6xnvsfExrXtX1qZIQQ5S6krDEMeKqGSW44w4YaIRS
         U85ylBHqi5abPMOLD0rhNIfcm0vydLlag3hWi4t3oEFTgH4/eg8LhI5x5o/x7N4sADiy
         jBE3Gyb7ZcWMvKebE6J2veK3U+hWIOXyyyz/gixScaVNvDi6oEhVKNknjc6biEJSDm2D
         Qehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=B7cbRCNg26UF8ivWTlzn2A7fgILQXWbzOIRhYJWq/FA=;
        b=i+xzX1bjBp9ht5fMxmp4dfJkuNUSSQCw+9b8pL4wVitBMyGOFuEunkkFlbgc2dyFua
         2RbgPpe289noaaJqIHKmhEByALmhnSN3dyOWk+PpnyEDzr9BRdjR1XTazMRJ09mA6rUv
         ndsVDNnxIlV5eG+09gw+50X3F7PI6kOYNBVnysT6FVV6L90EQCbQlUZadMQOIyN5FcFV
         mKdWhZEgBwPwQ4M9Y3UDEaXq+S8/+wveCjUlXI5+7bsE398Unlk6COUmh0h/t6RfCEYn
         kxYouFtnsgTxE3hLzaHsVo55c9kPUH8w0T1EoOHn/qcUcD4ySVOFeY6LaInAq23uH772
         jLtg==
X-Gm-Message-State: AJIora/D8tImGjMH4IAcBGWKfGMdsyYC1nz/LdAyqpFY/kd8U0ZS3zEB
	9XxmfxxcDnjOHH9iGM6Jq7D85A==
X-Google-Smtp-Source: AGRyM1vF1fpZCiYd10o5djR4cMTz3jxdy9U8gdmikmzDuQcqp0xKZtHSrVJLo09rh1zFFSO0GO4H/A==
X-Received: by 2002:a63:3fcc:0:b0:408:c856:dd6d with SMTP id m195-20020a633fcc000000b00408c856dd6dmr770211pga.354.1655314241467;
        Wed, 15 Jun 2022 10:30:41 -0700 (PDT)
Received: from [172.22.33.138] ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id t8-20020a1709028c8800b001677d4a9665sm9501331plo.267.2022.06.15.10.30.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jun 2022 10:30:41 -0700 (PDT)
Message-ID: <cb89dd3d-18d8-38ef-bb0f-00b6688bd54e@linaro.org>
Date: Wed, 15 Jun 2022 10:30:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/3] dt-bindings: dsp: mediatek: Use meaningful names
 for mbox
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>,
 YC Hung <yc.hung@mediatek.com>, Curtis Malainey <cujomalainey@chromium.org>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220609083101.24195-1-tinghan.shen@mediatek.com>
 <20220609083101.24195-2-tinghan.shen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220609083101.24195-2-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_103042_531866_724CF0F4 
X-CRM114-Status: GOOD (  14.09  )
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

On 09/06/2022 01:30, Tinghan Shen wrote:
> Rename mbox according to action instead of 'mbox0' and 'mbox1'.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  .../devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml        | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
> index b7e68b0dfa13..6cedd6868cc5 100644
> --- a/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
> +++ b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
> @@ -55,8 +55,8 @@ properties:
>  
>    mbox-names:
>      items:
> -      - const: mbox0
> -      - const: mbox1
> +      - const: rep
> +      - const: req
>  

More common is rx/tx, which I proposed last time.


Best regards,
Krzysztof

