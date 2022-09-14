Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67085C6FA82
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 14:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zOs1QKwbZyIiYcD44wohoU5bGlws2KHw+g3vnQSorCQ=; b=I5cH720zhhzfwnif754gE6R8ie
	yxuJHe+Rr91I27HCyYxiSdDFhn4G7wQp5lLGatPcs5l8VYvsjIv+0czUMvhfPGGxiZRmkzJfUYqtk
	sjRSBCFikUhC4z1ybncLTwHLevKeZcOs+WBt+vWEQq/Rao873oQ0oSpCD8b46/pqSdOEYGGHfZ2IC
	s03S7GBcBv83fjxkZ2SbeaqPAoUqc+FaCvXXmkhQTfKDDqsoYSC90FQNJVoHToLWz//MSIhsSyRZI
	p2SHZxKnEDf4Vq/o9dB1pH1bnZ+XX4IMykZS2hPdMDKkYrnB/3l5E8mFqSA0Dy7DGE4L10n5jybOB
	0i9x7Hbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYTBp-001uok-JE; Wed, 14 Sep 2022 14:16:33 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYTBB-001tWN-28; Wed, 14 Sep 2022 14:15:54 +0000
Received: by mail-wr1-x42f.google.com with SMTP id cc5so16097969wrb.6;
        Wed, 14 Sep 2022 07:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=zOs1QKwbZyIiYcD44wohoU5bGlws2KHw+g3vnQSorCQ=;
        b=Ks2ZZ2IN9vBeYDzJ0s9jZhTQYhtlLUrRLYKvlMVyyF+fOG6cQTXOWPlmH7SnCj0oBN
         0xmRSYhQ7hlpYwFPu3mfH8C7Ausi9Cy8vkEBvWrSbbraws/ubtp/3x12f2bTL7Agaox5
         KVldTUUHDt2FtdfDZ5Zle50v9SNWt6CPMcCnkiQnT49u3x7ZVxVBp59xJkBzlLrnQE4z
         RcfgjOk6uUsHIuOpY+mlpl7LLgkTFyfYG9343COAOqBPxDodKIih9CbroSaqWXSllqWF
         G06iBnCr1pHfkDxMkzBfV5FGHAAtPRKLDyZ6j1V63/XjY/2MOv2HujUttLL0FRVpTOzk
         T+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=zOs1QKwbZyIiYcD44wohoU5bGlws2KHw+g3vnQSorCQ=;
        b=SRnCwDlx+q7BEPcOjmKMPMr2yoI2lOe+x3X8Ties7CgusvUAlyulmpruqMWHuGNTu4
         /tUTTilwhk9hxnI/bVQxHt2LBmM8zOLFgMNsqmXvTkzOkcKS+nUk07MXXSJjOwnUxY72
         FvP/vRIzaRQ6qZ0B9hez88nbcMJavzyy4iI9hSypnvCCkFC17c7wkGCll027AtQTvGZj
         i0BaR21SxiNBlzTzesRomktgp+UQng8LGilXa6GO/jhDLEs4NO9rV5jfX8t8xNmxxb9H
         3K4v7T1q7FhZeMbEXnt/isILlltBYgJ5ojdUsYXhcsGt46F7V/Pl24lDuQa5NjlAhcfz
         hDpQ==
X-Gm-Message-State: ACgBeo0raz1V73I82mpFkoTeGVx9gx2ydVcBKc2TXaT2C/wpfXJmJ6w9
	4cGDj7GSVKrEAgHWDQ6/lbY=
X-Google-Smtp-Source: AA6agR7Bu+ObYtkfeAMtim+ngA8n2IPmkQsqMg5NlIrP9uzCd4DPRq+COGJZeAVGftuRUF2LCdFdKQ==
X-Received: by 2002:a5d:6f03:0:b0:22a:2de6:9229 with SMTP id ay3-20020a5d6f03000000b0022a2de69229mr18997910wrb.91.1663164949659;
        Wed, 14 Sep 2022 07:15:49 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id o16-20020a056000011000b0021e4829d359sm13315939wrx.39.2022.09.14.07.15.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Sep 2022 07:15:48 -0700 (PDT)
Message-ID: <a8af4c54-12a2-a314-f190-f12859ef4ddd@gmail.com>
Date: Wed, 14 Sep 2022 16:15:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] arm64: dts: mediatek: mt8183: remove thermal zones
 without trips.
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220914131339.18348-1-aouledameur@baylibre.com>
Content-Language: en-US
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220914131339.18348-1-aouledameur@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_071553_194607_D65014E5 
X-CRM114-Status: GOOD (  17.08  )
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



On 14/09/2022 15:13, Amjad Ouled-Ameur wrote:
> Thermal zones without trip point are not registered by thermal core.
> 
> tzts1 ~ tzts6 zones of mt8183 were intially introduced for test-purpose
> only but are not supposed to remain on DT.
> 
> Remove the zones above and keep only cpu_thermal.
> 

My understanding is that this thermal zones exist but are not used. DTS should 
describe the HW as it is, so I propose to add
status = "disabled";
to the zones.

Regards,
Matthias

> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi | 57 ------------------------
>   1 file changed, 57 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 9d32871973a2..f65fae8939de 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -1182,63 +1182,6 @@ THERMAL_NO_LIMIT
>   					};
>   				};
>   			};
> -
> -			/* The tzts1 ~ tzts6 don't need to polling */
> -			/* The tzts1 ~ tzts6 don't need to thermal throttle */
> -
> -			tzts1: tzts1 {
> -				polling-delay-passive = <0>;
> -				polling-delay = <0>;
> -				thermal-sensors = <&thermal 1>;
> -				sustainable-power = <5000>;
> -				trips {};
> -				cooling-maps {};
> -			};
> -
> -			tzts2: tzts2 {
> -				polling-delay-passive = <0>;
> -				polling-delay = <0>;
> -				thermal-sensors = <&thermal 2>;
> -				sustainable-power = <5000>;
> -				trips {};
> -				cooling-maps {};
> -			};
> -
> -			tzts3: tzts3 {
> -				polling-delay-passive = <0>;
> -				polling-delay = <0>;
> -				thermal-sensors = <&thermal 3>;
> -				sustainable-power = <5000>;
> -				trips {};
> -				cooling-maps {};
> -			};
> -
> -			tzts4: tzts4 {
> -				polling-delay-passive = <0>;
> -				polling-delay = <0>;
> -				thermal-sensors = <&thermal 4>;
> -				sustainable-power = <5000>;
> -				trips {};
> -				cooling-maps {};
> -			};
> -
> -			tzts5: tzts5 {
> -				polling-delay-passive = <0>;
> -				polling-delay = <0>;
> -				thermal-sensors = <&thermal 5>;
> -				sustainable-power = <5000>;
> -				trips {};
> -				cooling-maps {};
> -			};
> -
> -			tztsABB: tztsABB {
> -				polling-delay-passive = <0>;
> -				polling-delay = <0>;
> -				thermal-sensors = <&thermal 6>;
> -				sustainable-power = <5000>;
> -				trips {};
> -				cooling-maps {};
> -			};
>   		};
>   
>   		pwm0: pwm@1100e000 {

