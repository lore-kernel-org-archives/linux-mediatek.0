Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1780FC32774
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 08:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JKH4ft/HojJoLFaDDgeksLkaodkyHdDC/mjKTNTZhPs=; b=qxcey5NTSqZYUmsRkRWyjT3ukP
	dD2WaAvIak61cCmSXnsHh8i/4zUKNXlSg4M+nqrGTy95aT4WnatQrMdsZB8npC7Aa+c+QupdLbf22
	GZtUSOs7xBFmpBvK8CqA5TZmX0cw8qMXVrPPYA98Y91GXL6gvUcDzrxyr8If7L8JpPU5chH0hiADY
	aB521eq9fQ9+fDzCiGpiQrrtn4lD8+rIxpnFps9OKOwt/AjpX/pjUPu6+AlnytDPe8eX77GADlo2h
	jLApCNdIfx3X4PyShfA1x80xB8wIvg6t6iVWlw4FbyJHikKezF04dfXiL/xLnZPkqH+CYdXtke9rm
	DzZPu+jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQPQg-0045X5-On; Tue, 23 Aug 2022 08:38:35 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQPQb-0045Su-Ng
	for linux-mediatek@lists.infradead.org; Tue, 23 Aug 2022 08:38:32 +0000
Received: by mail-lj1-x229.google.com with SMTP id v10so12825601ljh.9
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Aug 2022 01:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=JKH4ft/HojJoLFaDDgeksLkaodkyHdDC/mjKTNTZhPs=;
        b=oEmXzyGTsY1Jm/8QDV/fL0tMWnA8/aqTqARmji/gwW4uTPzoaSR9ltEOjszs48LwHm
         zyX/2IkiLkYutSnRSWpOccw4/fVZC22paPUEgeX0TFhWjMkc3Eq31lWv0gtcXzhHctXf
         yo/hfbmujNbjQSELNCY9smsLaTfejwC11ajGhW+AvQqxRQgVPa2G/n7j3SOr1l0A5TiP
         mr1ekZIM6Ipy1b1AOHF/Xjlj6p8M4AQonkKqaiLQJhZcJhu4wO8rMbt8qed8m9jSjyf5
         z2XDb1tNAeBwxdP1JbNfNAYNi34zvD0AmyZ+Zf2rVyIj5J31nKNeZl/wWO2qgzSRjokk
         9dWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=JKH4ft/HojJoLFaDDgeksLkaodkyHdDC/mjKTNTZhPs=;
        b=GoEOANvXAdlI9a08P+2+kYfBKvnQr5IyXUQEBbbNAC2xcSAU6VpJ7ZE5Vp6aXRwq/Z
         9nrI0NbymevAMLUKRRKb8JMaxtdSR0XiqNh/C6P1kTQvNH//vYcKhRLmGC9NGIDtBMnh
         EbVImreJdlm0Uw5EOBXbdokQ2Y2asqE5WB08obRGqG4D/jY4J4YCxFS6PNaBAPNSpVws
         w8OKis74bsVKIT2X5e0O7tP3D/wuu+49897KeskUzjXHOevXsAgEYnGLb8XiQBdTwMBN
         pS/CDGrxhl3P0q7rFTLT9hdMXHfRWWQGs1W4zIAo9/giC2rgwNcijFt8AJFHckCmIM1n
         XKLQ==
X-Gm-Message-State: ACgBeo0dAndZSPdTsWNhgyLLo6szbxDGcbTXh4pmifVrn1tSQkTJtXwJ
	9+sycfrY2G2ihFH4Vgy/ZWPbFw==
X-Google-Smtp-Source: AA6agR4YBTjnWyro2PJsJoAncXN9rtMdAV8mFoIfbItwV+OsR3C7RYb9maJWlvJph7+5H40eCY+DFA==
X-Received: by 2002:a05:651c:210c:b0:25e:6a39:23ed with SMTP id a12-20020a05651c210c00b0025e6a3923edmr6546406ljq.43.1661243908301;
        Tue, 23 Aug 2022 01:38:28 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
        by smtp.gmail.com with ESMTPSA id n2-20020a2e7202000000b00261d619fb16sm329148ljc.82.2022.08.23.01.38.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 01:38:27 -0700 (PDT)
Message-ID: <2bbafb3f-3f69-c014-b86c-476f56d93659@linaro.org>
Date: Tue, 23 Aug 2022 11:38:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/3] dt-bindings: mediatek: Add gamma compatible for
 mt8195
Content-Language: en-US
To: "zheng-yan.chen" <zheng-yan.chen@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220822091945.21343-1-zheng-yan.chen@mediatek.com>
 <20220822091945.21343-2-zheng-yan.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220822091945.21343-2-zheng-yan.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_013829_825031_A2F89C95 
X-CRM114-Status: GOOD (  15.96  )
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

On 22/08/2022 12:19, zheng-yan.chen wrote:
> mt8195 uses 10bit-to-12bit gamma-LUT, which is different from
> current 9bit-to-10bit gamma-LUT, so this patch add its own compatible
> for mt8195.

I am not sure if this explains the need for change. Is mt8195 still
compatible with mt8183 or not? Your driver change suggests that it is
and points that this commit is wrong.

> 
> Signed-off-by: zheng-yan.chen <zheng-yan.chen@mediatek.com>
> 
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml   | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> index a89ea0ea7542..fbd7b9664a78 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> @@ -25,11 +25,12 @@ properties:
>            - const: mediatek,mt8173-disp-gamma
>        - items:
>            - const: mediatek,mt8183-disp-gamma
> +      - items:
> +          - const: mediatek,mt8195-disp-gamma
>        - items:
>            - enum:
>                - mediatek,mt8186-disp-gamma
>                - mediatek,mt8192-disp-gamma
> -              - mediatek,mt8195-disp-gamma


Best regards,
Krzysztof

