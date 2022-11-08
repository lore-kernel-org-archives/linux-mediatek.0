Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEABAC43217
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 12:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YbJO9KqDk7Xkc6dEU4ClRlhFIchA8zzKrx3Cy0s+pcA=; b=grP693K8lq/COHH60l7bCUz94H
	1VwDz5mm6Nfu1z3JlyJYG3XlUungO0vvEQMhLRI5tDhspAFJ617WjTwVqVHGbvaJ/WAB88LGpvy4/
	uhf0Sz/6di1peQy6iunsQlqy822GmiQnb/WDoB+4boert6f0gj4DQhEzmZXHBN8uZMERhN4ijJK0v
	8viQlkovDt1QBfpWL+G1/flWNXVKJb1vxt9s82Ib4f6HofGkDG30yJeOJNTB7lgdIydW4ztqzp+cX
	x/Egb0aXh6pg5X65/vY5yB62uRwvEkX3YVKZGyduQqxgEXfnjqJ1xx+dXTWv3Rn8zG3pWCEqj0LMU
	sUwGj0Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osNxS-005JeN-M6; Tue, 08 Nov 2022 12:44:02 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osNxG-005JZT-Rp; Tue, 08 Nov 2022 12:43:52 +0000
Received: by mail-wr1-x42c.google.com with SMTP id h9so20840920wrt.0;
        Tue, 08 Nov 2022 04:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YbJO9KqDk7Xkc6dEU4ClRlhFIchA8zzKrx3Cy0s+pcA=;
        b=Lgmam9mhkOtQYFah9fRTHWscwGdNqA4Go8EUt/QdUEG8CGOlyy49cFhX8nWbcgZjQs
         cKDjUyu21tgP3r/SJGVZgt6sFkaSP8oZzPFg07KEzZnGqFPYMe9fit+Nw4pjwFwrQh7R
         ZD8lQAYBVambcUkn3RyTXFODHmOX/SPzHjNRfwoprv99fRzde+8pa0c74fbRdEU5A7tK
         11t+5C1NRjMsodDMYb3AFjmasQEIeyBjiE6LoqUO8X7rfSVaOpYP/ZqksGNmbWCYukXr
         66VYHa4tMlsWRe+h7VhUqvYBYF1HVPQvGLJMXH4ZOgzD3dTZ/yUMurCu6ebvHILuNuKJ
         n3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YbJO9KqDk7Xkc6dEU4ClRlhFIchA8zzKrx3Cy0s+pcA=;
        b=gKjGGieI6yEWkHdd/kVe8erOIl6nm+XJAu2U4Es4boFLOve1Y1ideuwYmM6haYBusx
         qhaNOi+rnsXo0IDyoasReYzPdE/eksf1zzbzI1HccQjJfMtH9oP5kVbC2StKbNcNd+oE
         yrNs9eKN/pN0D6XFi4DcnD9t8OwFAWrHIh4VDvY1lKm/+AoPg2v0Y2TuvUH7bIY+1Tur
         3ZGIm7J5/z3+0zK24ESvUej9AadK6EMsJJP2bCFhBwhlUSx0jYH7vIVIFFztAUQoVH/5
         yIrlS8dXv2VsN07bw4qTKQPulD7mViATMnsgA32fA6uFpqkAssFK0M0WClRJWUFT8Y9E
         1n6A==
X-Gm-Message-State: ACrzQf3BpbkeFWpaNrdhRaCTJbZugsTi1qSgDZ7o41fua9YZun4Lensw
	1anj4r9WL1pFDEMZVGQ8Xpw=
X-Google-Smtp-Source: AMsMyM4zMnkwa7yKd8CP1iszyfp2MdswvMN9cDFrCEW+w06/cvxr3ripNS3QQ6jOK0O0iFdHvammVA==
X-Received: by 2002:adf:f701:0:b0:236:e2b2:3b69 with SMTP id r1-20020adff701000000b00236e2b23b69mr25781904wrp.532.1667911427921;
        Tue, 08 Nov 2022 04:43:47 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id n41-20020a05600c502900b003c6c4639ac6sm11474295wmr.34.2022.11.08.04.43.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 04:43:46 -0800 (PST)
Message-ID: <f20356cf-4347-6bb7-20d4-ec5a154fa9e4@gmail.com>
Date: Tue, 8 Nov 2022 13:43:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 07/10] arm64: dts: mediatek: kukui: Remove i2s-share
 properties
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>
Cc: kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20220908161154.648557-1-nfraprado@collabora.com>
 <20220908161154.648557-8-nfraprado@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220908161154.648557-8-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_044350_915757_33697377 
X-CRM114-Status: GOOD (  14.58  )
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



On 08/09/2022 18:11, Nícolas F. R. A. Prado wrote:
> The i2sN-share properties were never documented in the dt-binding and
> thus shouldn't be used. Now that the ASoC machine drivers are setting
> the I2S clock sharing internally, these properties are no longer needed,
> so remove them.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Applied, thanks!

> ---
> 
>   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index b4b86bb1f1a7..42191b3025a9 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -221,11 +221,6 @@ tboard_thermistor2: thermal-sensor2 {
>   	};
>   };
>   
> -&afe {
> -	i2s3-share = "I2S2";
> -	i2s0-share = "I2S5";
> -};
> -
>   &auxadc {
>   	status = "okay";
>   };

