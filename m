Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE81C10F1E
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Dec 2022 15:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzMfGFc+T+OIDYYl9okQ5zfw6NreFa0yZMhUyrOURHs=; b=X6t6U1Lhv8iWDdNpTZ5PBGmoWB
	x0B88YRIynH3CPokyEMLO9ZwlWfQ0sFyo4XFLAHErt4WWyqOJpV3KZSmVphN4y0jYAJYs2HIfB+4W
	D9odOooRisvhae3MiA/NAHsRkOOj41asjHs1XGRuqiHiEo97Ef6M6yJUd3vx5bpdsfOJ/HApYp7Ah
	W7zSeMNIgvqpKDCLKRD7nQibQvJ2gkx4BrCn+FZtN5t4e6hSx8Lw7N1Dh/2Kn7fPp2uFG5Zqs2rwX
	owV3hzF+qefwtfdyxzaHO8HJuv3B7oUk5He5Lul17o1xZG+PGx29qxW1ZBbgA+hzxHqmjai9T07p7
	6WVG/akQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7e9L-00H5wU-Js; Tue, 20 Dec 2022 15:03:23 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7e8B-00H5Rl-Il; Tue, 20 Dec 2022 15:02:12 +0000
Received: by mail-wm1-x331.google.com with SMTP id r204-20020a1c44d5000000b003d6b8e8e07fso78940wma.0;
        Tue, 20 Dec 2022 07:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pzMfGFc+T+OIDYYl9okQ5zfw6NreFa0yZMhUyrOURHs=;
        b=X2x/zvCz9r5+AAAYObauwRktUdYKTf4lUnGeUJrACEkwzXnzI6YdTHIg7dA+ZvO4Ay
         Ntvid8RN1oe7ceqskyB+IFwi0VpUow8r8odxL6gx13QaHzrMFj/ItDaCLZCgJOlJxGk8
         cZfrnwUzvInv9U8Kq6H1QcssTYUf1XxOCPqKQ6lR7e0D8n+IZoze9k3GaLMC1uRxXQFF
         EGbaZ974Nqqx03lCN41YPKacfVkZgYWBaHAZhq6fVRzSp/QM4b+eG25iR4wZeuzFLqig
         E5zxHz+Hx92yvp43E+wrD/VBVgRADusDLUjQyii6D5CxyAyFQxHTtXoAmxuvblzHQg3i
         MxIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pzMfGFc+T+OIDYYl9okQ5zfw6NreFa0yZMhUyrOURHs=;
        b=A1eTB6cD3luOj8685Ajx1Ua6d2aK0HYxotOJNOlAfkvpsDF8zyH3RyWdPSkMesLxlW
         yCQjvYBhAAdnFQts0NyYm33o51G1jslZhk8wFVT5vwXq62M/VeWsjex5xe1JqJd7tka5
         MR9vZADqic8G8sUixEil4bWKOnQ8Ui3hLDF+2xZCk469z10nN4F+k/FkYpBdXoOdg7tj
         wavX4cBCEQdJaSmhu3Q0CmDj82WC4t/YW3hXTGZ4CFviJYYet+hWbk+YiRKj4/wT5Y50
         UT6UIKLkyBX0KXdG2mz4V9OXM1QZzd8QcBu8vPf6xmiCWDWKPWIv7tdqDDDZhTrS2V/t
         5IGQ==
X-Gm-Message-State: ANoB5pmmbmykTY02VWEM5zKfbKAaZ8e2ReaBQj4vipH+dsyO2ZFnbQZQ
	tGuCnoJuGeciai2TtbMK/V8=
X-Google-Smtp-Source: AA0mqf4mnN7mbrBWMZrA3GgHFXd3WHHkBz0CyQ1EINScx97Fm6ED8gdAtihCqezouN1INwn+f5S4iw==
X-Received: by 2002:a05:600c:3544:b0:3d1:e04f:9bfa with SMTP id i4-20020a05600c354400b003d1e04f9bfamr35819264wmq.28.1671548529865;
        Tue, 20 Dec 2022 07:02:09 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id o31-20020a05600c511f00b003cf71b1f66csm17664025wms.0.2022.12.20.07.02.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Dec 2022 07:02:09 -0800 (PST)
Message-ID: <2f003afc-1375-56fa-f9e2-82ad3bb7cee2@gmail.com>
Date: Tue, 20 Dec 2022 16:02:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH resend] arm64: dts: mediatek: mt8192: Mark scp_adsp clock
 as broken
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221130031741.3176853-1-wenst@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221130031741.3176853-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_070211_660877_F04C9BB6 
X-CRM114-Status: GOOD (  16.48  )
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



On 30/11/2022 04:17, Chen-Yu Tsai wrote:
> The scp_adsp clock controller is under the SCP_ADSP power domain. This
> power domain is currently not supported nor defined.
> 
> Mark the clock controller as broken for now, to avoid the system from
> trying to access it, and causing the CPU or bus to stall.
> 
> Fixes: 5d2b897bc6f5 ("arm64: dts: mediatek: Add mt8192 clock controllers")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 6b20376191a7..ef91941848ae 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -575,6 +575,8 @@ scp_adsp: clock-controller@10720000 {
>   			compatible = "mediatek,mt8192-scp_adsp";
>   			reg = <0 0x10720000 0 0x1000>;
>   			#clock-cells = <1>;
> +			/* power domain dependency not upstreamed */
> +			status = "broken";
>   		};
>   
>   		uart0: serial@11002000 {

Looking into the DT spec, "broken" is no valid value. I suppose we want to have 
"fail" here.

Regards,
Matthias

