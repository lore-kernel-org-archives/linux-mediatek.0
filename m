Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B35FC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 17:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzklqbfAAgvj9PC/0pw5WYxo6LOoMPvVtiBugerBwFg=; b=X6fYdQtkdOvkQS52M5MnullNTu
	tPdMB+aleJWAPC12XBTEnIiz7KqCJtH09Vym4ZK67D1Tq8fzYr3pvE1SJlCJqL6J1qQ2ijIzqddjs
	nVluU1WMDLYH4QjP1gvZEieXw5sRJxWzJn6/eRJcl1U/HU4Q858IGC5BTZ9h3ucVadS50Jx9v0LH3
	xifDJkuQt6xlXPtn4obuA4meC7RMhUJjUIdlskSDLOS/cphSMMD7JmQTsxpXxyFvFxWTLEmDXV3PZ
	UIE80YoLntrXgPFePkYhEwctKYT4O8YPTqBkWe3T1ChTpPx6khcQqL6flZTuZpXQQr/X0nnaK9xXI
	u/Z59mZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxXA9-00B5GL-0s; Tue, 22 Nov 2022 17:34:25 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxX9w-00B5Ac-Jp; Tue, 22 Nov 2022 17:34:13 +0000
Received: by mail-wm1-x330.google.com with SMTP id h126-20020a1c2184000000b003d03017c6efso1513wmh.4;
        Tue, 22 Nov 2022 09:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jzklqbfAAgvj9PC/0pw5WYxo6LOoMPvVtiBugerBwFg=;
        b=EKtdox0xep5n1ykg8tUe1ZitEUVy3X4qOlX6tw80klPHuM5HhHANHAoUfT3eFrX7FR
         RvkApEzx7Q0CwVoCN6HkAlfMBsP6yWjiBoAGe5POkLQNhnTp+27KP2V8TcYrJbSfNJio
         2jH8+C7VUOW3j3alnRhZPkT/Yw+QMbFE+sOXSkqn0fOXMDAgXNy0aOP+sbtMakwJoFXK
         +R2BDroACspKPngkpxElwSbBshYr4xmLnFYpy+oi0svr0YW6OUfcoOsdoyQy22nG1cdv
         bhsv2upJN9LdMWcYVHmV5aNuq8lc021wmGPMCgNn9rFZHg9MYqBWTEuN8a1xYah3lIyg
         +J9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jzklqbfAAgvj9PC/0pw5WYxo6LOoMPvVtiBugerBwFg=;
        b=yfnph2QgeXJqEk/RXTRs7XrWbfFDSBoq6vqTlbEpOGFLCITlRgv5yFr5hiXUReHvKp
         /HYgiKmI9IiJaeTLYcrqsyOSo0bjQGGApdSiUrKrS9Rwz9QUUPob7Uz0MSOcu4cZ/lQx
         GSCXleoxmiVXCWRd8Pyl9us6Va3JmnpdK7AgWfcdYToQMFagsJGHs9f5T9Je7RE1tBHr
         H8CrWkBo7OIqyehy1uRiaxbN5mlMtCixSW6m/7p7y9sOJM5pW6Sae7MqzNlZHO0E4Ihb
         h+WEG+0QXpntNkciFrIHSYW8jB4brWr3tPdpnRdwvmTVK3toN/gpIugedPHqUJrsGW4B
         50gw==
X-Gm-Message-State: ANoB5pmHxtvcCEcx26ka6odeHvNG4ivKRM5x4Rcpy1cyrbZ/pgzCFZBU
	Haq2Uu1XUlGVI3FpBGZMN3g=
X-Google-Smtp-Source: AA0mqf5OOBdBWL4D+WDfrKGFanO92z4WqAf2USzQOiVUkhIBJXKLZCjTrty3XrW4md5tyWVWd9jvSg==
X-Received: by 2002:a05:600c:3393:b0:3cf:81f3:1e4a with SMTP id o19-20020a05600c339300b003cf81f31e4amr21285684wmp.4.1669138448948;
        Tue, 22 Nov 2022 09:34:08 -0800 (PST)
Received: from [192.168.0.25] ([37.222.251.204])
        by smtp.gmail.com with ESMTPSA id o9-20020a056000010900b00228692033dcsm14294563wrx.91.2022.11.22.09.34.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Nov 2022 09:34:07 -0800 (PST)
Message-ID: <2ef0ba5d-0c3c-df67-94f8-046ad22c1d53@gmail.com>
Date: Tue, 22 Nov 2022 18:34:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RESEND PATCH v2] arm64: dts: mediatek: mt8195-demo: fix the
 memory size of node secmon
Content-Language: en-US
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Miles Chen <miles.chen@mediatek.com>, Bear Wang <bear.wang@mediatek.com>,
 Pablo Sun <pablo.sun@mediatek.com>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, linux-usb@vger.kernel.org,
 stable@vger.kernel.org
References: <20221111095540.28881-1-macpaul.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221111095540.28881-1-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_093412_687087_CE5368BC 
X-CRM114-Status: GOOD (  25.89  )
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



On 11/11/2022 10:55, Macpaul Lin wrote:
> The size of device tree node secmon (bl31_secmon_reserved) was
> incorrect. It should be increased to 2MiB (0x200000).
> 
> The origin setting will cause some abnormal behavior due to
> trusted-firmware-a and related firmware didn't load correctly.
> The incorrect behavior may vary because of different software stacks.
> For example, it will cause build error in some Yocto project because
> it will check if there was enough memory to load trusted-firmware-a
> to the reserved memory.
> 
> When mt8195-demo.dts sent to the upstream, at that time the size of
> BL31 was small. Because supported functions and modules in BL31 are
> basic sets when the board was under early development stage.
> 
> Now BL31 includes more firmwares of coprocessors and maturer functions
> so the size has grown bigger in real applications. According to the value
> reported by customers, we think reserved 2MiB for BL31 might be enough
> for maybe the following 2 or 3 years.
> 
> Cc: stable@vger.kernel.org      # v5.19
> Fixes: 6147314aeedc ("arm64: dts: mediatek: Add device-tree for MT8195 Demo board")
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>

Applied now to v6.1-next/fixes

Thanks!

> ---
> Changes for v2
>   - Add more information about the size difference for BL31 in commit message.
>     Thanks for Miles's review.
> 
>   arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> index 4fbd99eb496a..dec85d254838 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> @@ -56,10 +56,10 @@
>   		#size-cells = <2>;
>   		ranges;
>   
> -		/* 192 KiB reserved for ARM Trusted Firmware (BL31) */
> +		/* 2 MiB reserved for ARM Trusted Firmware (BL31) */
>   		bl31_secmon_reserved: secmon@54600000 {
>   			no-map;
> -			reg = <0 0x54600000 0x0 0x30000>;
> +			reg = <0 0x54600000 0x0 0x200000>;
>   		};
>   
>   		/* 12 MiB reserved for OP-TEE (BL32)

