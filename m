Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208B7C04AA5
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 13:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LjNH+rDqugavNJp3hfKsPFFkZZAo40JmydtK1bPNImg=; b=Rx9SCe8qD4mu7W/PWgHOlcoT3U
	wiu6z0iR02mF1VA7G8BxeYvLNbQJfLTIpkrY3ed1yFJMlSo+0snJBrZC2WPNmpe5YuAiPkVK3+A9C
	tE+2NexGPTQqussp+8JD9HU2i9V+AH4M96HDYXXkYnxvPFZ5FDeTvU6Tmhe4oNtk+GBfHW9mbDIXO
	jiK6P+crfmdNdt5eSIzPuqx1dbsZHdGcy5C9YrHw/4PkhBdYeOv0TA0IILjOYI01rZRUofEYMVu9p
	gIEtGPecXl/OO6MbY/zvYB6CzTFfu0t5eWQMgljjtH0xDojJ/cLANpk5EM7Lj8jZwK7eiSwCZar5+
	tzylKKwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRCoW-00EkZP-Sw; Thu, 25 Aug 2022 13:22:28 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRCoD-00EkL3-3n; Thu, 25 Aug 2022 13:22:10 +0000
Received: by mail-wm1-x32e.google.com with SMTP id k17so10266251wmr.2;
        Thu, 25 Aug 2022 06:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=LjNH+rDqugavNJp3hfKsPFFkZZAo40JmydtK1bPNImg=;
        b=IBdWEMzcIojQZhI6OxSv036EP2WxO8Z5sdu1IsUfKrxTEe4fRKdC71m3L6wNR0n2BH
         p+44qjioNE2OML0H/G8/uxcmc1JPx2xSNQqDyRCMGpuPQHpx8YZUENODrvw2fskG3qMQ
         IgarLHEEsN/R93RwIag0s2En4aArQPmZhZu11nGTjYo0ed59bL1cYvnXQmGbpjE6f5bd
         wWNTJFlpl0VxSr7uniTQ12erkIG0f+P2S2zy9V24DJZ99vpEG6ahP6xlhlbuM3yOEk0K
         jNuEdxfN2rVyar9PSEkFNmVtzup41r2moXkXAxcy/a+kRkjS/uKMyxJH4EqZQcTep5oB
         5HUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=LjNH+rDqugavNJp3hfKsPFFkZZAo40JmydtK1bPNImg=;
        b=m9D1lP567wakPK6acgGGyURivQxO8H9l9FnUddmUW6WvpLi1d3MxS78JsWV7TNVvq7
         8o3B14JRe6FPiLD+yGIJwJ76PyHG12A5Ab5I837p22/7uEPfHCz353oh0OuKS7r+TPcK
         Lx6G4kflFiqowbc+g1uEkDe+uS6Ta9JxCLs9eKG604OtVjK+UzNXhV0MhCamcrBlP9yB
         MdcM0Gr89kPZmoIIkjhxPUCG9jUKsy0Eda9Hr1EYcfDo9i9v0dyOEfM6cCYuFSVcPnbv
         30yP+GaJKkeYdCaaSU7RBdHvxEj2U4l5T+NzKykofklG5Tg8o+nrsLwUk5+pL2i97sAB
         pNpg==
X-Gm-Message-State: ACgBeo22D6mjGeqPIA9oZliwW8OUMoKtrxfkaTeeS5/IrRLf1R+vwUAi
	w4PynrSOYQoFjGybEQ0r0lg=
X-Google-Smtp-Source: AA6agR7l+54/fC4VeqRxOTYKdGD9z1iXyk9d6Zeg/VujSTEWSl+r+eiSo8RmJd+yuHHXLVr7pwZS/A==
X-Received: by 2002:a1c:4c11:0:b0:3a5:4d01:54be with SMTP id z17-20020a1c4c11000000b003a54d0154bemr8559682wmf.32.1661433725318;
        Thu, 25 Aug 2022 06:22:05 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id m10-20020a5d56ca000000b002207cec45cesm23191455wrw.81.2022.08.25.06.22.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 06:22:04 -0700 (PDT)
Message-ID: <f07cf9b9-aec9-2564-03c6-bf2f0acf897c@gmail.com>
Date: Thu, 25 Aug 2022 15:22:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] dt-bindings: soc: mediatek: pwrap: add compatible for
 mt8188
Content-Language: en-US
To: Sen Chu <sen.chu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Hui Liu <hui.liu@mediatek.com>
References: <20220726104242.24839-1-sen.chu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220726104242.24839-1-sen.chu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_062209_195265_9F31E955 
X-CRM114-Status: GOOD (  13.22  )
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



On 26/07/2022 12:42, Sen Chu wrote:
> Add dt-binding documentation of pwrap for Mediatek MT8188
> 
> Signed-off-by: Sen Chu <sen.chu@mediatek.com>

Applied, thanks!


Matthias

> ---
>   Documentation/devicetree/bindings/soc/mediatek/pwrap.txt | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt b/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
> index 0581dbda4828..d24e2bc444be 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
> +++ b/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
> @@ -28,6 +28,7 @@ Required properties in pwrap device node.
>   	"mediatek,mt8173-pwrap" for MT8173 SoCs
>   	"mediatek,mt8183-pwrap" for MT8183 SoCs
>   	"mediatek,mt8186-pwrap" for MT8186 SoCs
> +	"mediatek,mt8188-pwrap", "mediatek,mt8195-pwrap" for MT8188 SoCs
>   	"mediatek,mt8195-pwrap" for MT8195 SoCs
>   	"mediatek,mt8516-pwrap" for MT8516 SoCs
>   - interrupts: IRQ for pwrap in SOC

