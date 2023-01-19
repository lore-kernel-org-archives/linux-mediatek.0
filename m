Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 053D5C004D4
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 18:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8dJmsDozdVRAs19D/c5MdA3A6jGV12O+/i00BReI/8E=; b=fI85qxA0xyhdu3pA4qAoMCQVh9
	GWsxMmXJ4Zvj2GTZruGIlMqIb1fCo0wcicJ4MOZ1Y55IaHveiHB4QP6NsNl2RV1CcujSpMY00G0o4
	CrU7aTyy3/kOVNNPSt+ubvO8zCvKSZNSyv+3ASJcElwRI0108KxRBcuSpUlxaX1CjXid2rOzY2cMt
	8RsJlMOUfJ5fGNEovGDjmqAynQqz6LgicrOMhiAKWUkAy9wCRor+6TzZlzWzLvoOmmRVsMJFskqHl
	IFY8Qcec93okU5f+ap855juQVnKypkrn7MSaokFacCzh7UeGSLwYny91/GjLZ19t3B+D0FP0zxdLg
	KOvuzRcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIZd0-006YXl-Ub; Thu, 19 Jan 2023 18:27:10 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIZcj-006YP3-SG; Thu, 19 Jan 2023 18:26:55 +0000
Received: by mail-wm1-x331.google.com with SMTP id q8so2223797wmo.5;
        Thu, 19 Jan 2023 10:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8dJmsDozdVRAs19D/c5MdA3A6jGV12O+/i00BReI/8E=;
        b=ZUtIQIKuikeEhvVTBOdwAnI5gTNkXBiK4ZGMgTMla0Iy6odLdVySNIU9pY/UVfzuFL
         vrgyBB8A+QbXeceKV9jz6VvH+L34aJ4TTNNezZUfK50L1nkEDMX16xEMdjv6xI/pd7/3
         Vmti+FHEld7qc4a19lF4bVG0gzPj0XBsIpW8M6fZmWZLcXmjZrI76e0zkk/FY/xYC/ak
         XGbX2lHBmkZQPXAYH0cKg3CjMvjREz2M10vovSfarsRtdV6LWWHZsk/IJJseOBJ8GDjB
         H2HoEQ4OJhZiuP/r7/yPqWT2nq4VrOd9Az0+UWFp/5RmhQYl46PuGKu2WP44iOoW2N9K
         EZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8dJmsDozdVRAs19D/c5MdA3A6jGV12O+/i00BReI/8E=;
        b=2Tbd00MpkQvPilpdFftizwg0wnO2RgJHiq0BxfIjM7DmSM7dt8Qeo73ZaEaouj4JLC
         jpjS8jN+4j47mzC1R2njkJaOf4TojWe/chiSQh2rZhLxuVzJKn9JE5l2LFSm2m6p2XW7
         sVLN4euBB4fXTjPm4JCInbyEMTof8bdhOdENK2SJggpYEMMad8AzhrPqp9RatzcJk+GH
         hS7Yy55Ei2oH/AiV9oO0oZvfai4xBznl7wzOfsdy7QtK4xD5bPbf/H/yvtBUF/rExnt5
         flGEEZcazUf3HiXdNw9Pvg3RtJA/SQc1PtXmnt/I2ZU8KA7cPisdgdzZtgivQB/eOCl/
         qwEQ==
X-Gm-Message-State: AFqh2krXNer8q6HeTSDL968BBmjE9pPvy6a5cmiZhPlQD4xvWGAslCcY
	l5CedJNC/Goh9swVlQzDGsVHSf5ucVbT5w==
X-Google-Smtp-Source: AMrXdXuLslVnlOzGTATGgcmq7IrSUmDZBaEvqzhg+QUBZdi3cGfnc1CRoFCFvFMq3Tc1gz9uh4APug==
X-Received: by 2002:a05:600c:54d0:b0:3da:f9c9:cec9 with SMTP id iw16-20020a05600c54d000b003daf9c9cec9mr11360079wmb.1.1674152810079;
        Thu, 19 Jan 2023 10:26:50 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id bg1-20020a05600c3c8100b003db09eaddb5sm6906139wmb.3.2023.01.19.10.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 10:26:49 -0800 (PST)
Message-ID: <a8d05899-edfa-8036-6672-c4e7e79d60d5@gmail.com>
Date: Thu, 19 Jan 2023 19:26:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] arm64: dts: mt8183: jacuzzi: Move panel under aux-bus
Content-Language: en-US
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20221228113204.1551180-1-hsinyi@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221228113204.1551180-1-hsinyi@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_102653_998014_FB406348 
X-CRM114-Status: GOOD (  14.53  )
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



On 28/12/2022 12:32, Hsin-Yi Wang wrote:
> Read edp panel edid through aux bus, which is a more preferred way. Also
> use a more generic compatible since each jacuzzi models use different
> panels.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Applied, thanks.

> ---
>   .../dts/mediatek/mt8183-kukui-jacuzzi.dtsi    | 26 ++++++++++---------
>   1 file changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> index 3ac83be53627..543286ce9cea 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> @@ -6,18 +6,6 @@
>   #include "mt8183-kukui.dtsi"
>   
>   / {
> -	panel: panel {
> -		compatible = "auo,b116xw03";
> -		power-supply = <&pp3300_panel>;
> -		backlight = <&backlight_lcd0>;
> -
> -		port {
> -			panel_in: endpoint {
> -				remote-endpoint = <&anx7625_out>;
> -			};
> -		};
> -	};
> -
>   	pp1200_mipibrdg: pp1200-mipibrdg {
>   		compatible = "regulator-fixed";
>   		regulator-name = "pp1200_mipibrdg";
> @@ -181,6 +169,20 @@ anx7625_out: endpoint {
>   				remote-endpoint = <&panel_in>;
>   			};
>   		};
> +
> +		aux-bus {
> +			panel: panel {
> +				compatible = "edp-panel";
> +				power-supply = <&pp3300_panel>;
> +				backlight = <&backlight_lcd0>;
> +
> +				port {
> +					panel_in: endpoint {
> +						remote-endpoint = <&anx7625_out>;
> +					};
> +				};
> +			};
> +		};
>   	};
>   };
>   

