Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE5CFC46467
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 18:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PkT0cysy+FxecAuEegqoIzMHcxej0PKOCevVj35BZ0U=; b=KU5blrEKuePiVB20HiNPHI24Qj
	gsm3vU/CWhrq0GKheMC3ftOZOD9qULJkbNH57aAIClBCPdFPgxlTZMGDknw99itSWofkq3jpLZpE+
	zSU9rD0eD9cbS3WM+cxIN4k+LisCi3gvzzMJN73Lv5uAM2lHFRneBuAE9zNq3sh/kJSnsAwscZgvr
	1AqAWXUZbXHgEaQftOnRx/+xmtMGQ3ByY1bmu8zHbQR7v3ctDJr5RFpiGOXB4kkZZlTfNvBY4vvmH
	iwokrpHH2WakNVNm1oZiuukJE9OXfFF49bcueD5E5JDMfblLknS3JLMNPJg0WDkRe6fHFtCtWQ7Op
	lS0YQDAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIZYc-006XEu-Cz; Thu, 19 Jan 2023 18:22:38 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIZYN-006X8N-LN; Thu, 19 Jan 2023 18:22:25 +0000
Received: by mail-wm1-x32d.google.com with SMTP id f19-20020a1c6a13000000b003db0ef4dedcso4162971wmc.4;
        Thu, 19 Jan 2023 10:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PkT0cysy+FxecAuEegqoIzMHcxej0PKOCevVj35BZ0U=;
        b=qPISyl2PgMZSakzvfLevnCw1T47CDwwswcEAdxTEY89OIKyHie+CZYVAaUWvcIQN8T
         AdZSZM3SUdNJS7C+xjSOH4yr+PQGwrIV1u+Rrs40cxAIfznggxJkfyA0g2jA8idfCloW
         FB6XhQCmZmAlcHfvSZwISyU45rXtcT3pZjXEHQSj5NY2V/CcE/Yp/SOUUmBrhYKHDSta
         9NGKKhUcgMaJBgZ7rv0dmcE3Q6fBm4opDPP9xWZdN87lf7jYJJi1Lz/jtGcXowe0WNau
         mF22XOdp63tgEJlzmLal0xlmVajeOvzeArPqrf8yDhOfgAqsPn76NwCFESjMViGEubJz
         EfOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PkT0cysy+FxecAuEegqoIzMHcxej0PKOCevVj35BZ0U=;
        b=L5Bzc6tfEWmyZgI+5pDYgd4HRrg3vRM8uuzwynmFns+Cv3vsVGlQT5uI8M4CH8d+4a
         AZFRueUoeVaZdhyL5tdBg8ZoMKlD9OFn3sO0hRuU5OsxsUN32GckyKHLDZH97UeQ3M39
         p2yeWhQY0ovaU4dCor3XR0El5TS41/T1++m5LOvBv91AKQh0s//FLNqkYsW4i7t8w2ho
         u5EgOyOS7MP3Bvzc+PPl+YFh5xpwFUe2AjtOBDJTvwIPi96C23pnXDJq5pZOVEhi/Y7K
         50fK2xPW27lGhXwX6Vi7BcNMXW8iDBBhFFC7oppjuWlweXMf3hIEhwCCUZ4BR0Erlq8/
         FCOQ==
X-Gm-Message-State: AFqh2kpTbIE1CfFMQA6eGv90YiePaf5n95aNw9U6BzUWZZVX0WreTQoC
	HTdgHkSz4OSi4t+XzuxFaTosjBUy3DkU4Q==
X-Google-Smtp-Source: AMrXdXtlJ+BqjAv7TuLog+rZuaq6u1JMgaw1kapSbEZsIn63mSSX9fAYaQxezDKK1PjMtcJBS8eYyQ==
X-Received: by 2002:a05:600c:3555:b0:3c6:e63d:fcfc with SMTP id i21-20020a05600c355500b003c6e63dfcfcmr11254139wmq.35.1674152542216;
        Thu, 19 Jan 2023 10:22:22 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id q10-20020a1cf30a000000b003d1e3b1624dsm5444546wmq.2.2023.01.19.10.22.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 10:22:21 -0800 (PST)
Message-ID: <6ecedcf7-e6ca-b118-e2f2-4f1ba0fbe7c6@gmail.com>
Date: Thu, 19 Jan 2023 19:22:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] arm64: dts: mediatek: mt8173-elm: Move display to ps8640
 auxiliary bus
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230111140724.294533-1-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230111140724.294533-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_102223_766561_DC19D5FF 
X-CRM114-Status: GOOD (  14.14  )
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



On 11/01/2023 15:07, AngeloGioacchino Del Regno wrote:
> Move the display to an aux-bus subnode of the PS8640 eDP bridge.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 26 +++++++++++---------
>   1 file changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> index 18e214464a2d..f9b10c7027cf 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> @@ -90,18 +90,6 @@ switch-volume-up {
>   		};
>   	};
>   
> -	panel: panel {
> -		compatible = "lg,lp120up1";
> -		power-supply = <&panel_fixed_3v3>;
> -		backlight = <&backlight>;
> -
> -		port {
> -			panel_in: endpoint {
> -				remote-endpoint = <&ps8640_out>;
> -			};
> -		};
> -	};
> -
>   	panel_fixed_3v3: regulator1 {
>   		compatible = "regulator-fixed";
>   		regulator-name = "PANEL_3V3";
> @@ -282,6 +270,20 @@ ps8640_out: endpoint {
>   				};
>   			};
>   		};
> +
> +		aux-bus {
> +			panel: panel {
> +				compatible = "lg,lp120up1";
> +				power-supply = <&panel_fixed_3v3>;
> +				backlight = <&backlight>;
> +
> +				port {
> +					panel_in: endpoint {
> +						remote-endpoint = <&ps8640_out>;
> +					};
> +				};
> +			};
> +		};
>   	};
>   };
>   

