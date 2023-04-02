Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E784BC7619A
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Apr 2023 17:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rAKxm6MzCphy5Z2gvE2Jr+LH4ajwExyKc8Eoh3hOm1A=; b=NkCdFxkg4Izf+UQcR9WEhxFkpf
	7n0Hk4oWyT+pReG8Et/mCHtLdkDnCHASpF7q5RjsEDVJaF9mOAS/t4EXBNXsGcou1dT6R8qmn5T6C
	56rxnKCjFt0UKxyC11enTRQjcYTmw7fqiG/5QiaOHmaNddYs+XeVbvKM233nWY76u91TUITje96L7
	bo6RVQhKwh0bIU+mc06Bxdm1k+kFXgurRgKkyPOt9d89PfOLnb1rcAbQho6NUc4ntcWTXKti5Txhc
	zuab6MuqOXrKAPU9pxHXrG0tbo5rVl+pRzVKmJjk9k8CkfwuNPnwlc/xylAH8PpytDqpk5nVVn6DJ
	Vy6lSeSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pj1eW-00Cx43-2t;
	Sun, 02 Apr 2023 17:38:04 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pj1eT-00Cx2y-1X;
	Sun, 02 Apr 2023 17:38:02 +0000
Received: by mail-wm1-x334.google.com with SMTP id v6-20020a05600c470600b003f034269c96so6522429wmo.4;
        Sun, 02 Apr 2023 10:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680457079;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rAKxm6MzCphy5Z2gvE2Jr+LH4ajwExyKc8Eoh3hOm1A=;
        b=dtm9ymYqBU5D/2K0eq/oNxuYV0djmKwUOmlQ0PWCBYr+JSm412ciULUeuUFZbq3vL/
         cnuDuLULPh2rOEAY5MVcLpn4WACpjF0ENO5xN1gAqBurSRfYMHlceYlp81tL3Co5ZBbo
         v1Ni3ifdgStxMXh2hB79hbUrh3XcV3dsefBjEYMkU+Y3zThU7XLx5QDkPOtiXnI84Zl4
         vu/W8b/gCRhsOTv0KmOY24HdK/MHDWS/6W+C2dVnWXlgRT757bTMxD5eYsghoYZmVZXm
         neFvBoR5cMRKmlxnT9Qbact8NIq7e4QloBRZmrXRXiIuCMrnVlJCUPFzQaiEAhj8czdx
         GqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680457079;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rAKxm6MzCphy5Z2gvE2Jr+LH4ajwExyKc8Eoh3hOm1A=;
        b=FDLrpcJhnTFuMygSv3uZ9SW62L0DG4blsNuFqo2T8xyJFFUqblo+x5379AnztiR4Pz
         OarOvE6PUEEYf3C9QEMlu44NcLqQINOVwJr+Jp0gs4jKPIB5X7yBHFtpqjW/mIqwQkGB
         PfLqvy5T0Cpydh6NJPnBYOAwQ9nvPW6FSyzM2Yzq0KbwECQ0zWxXHU3cQ7jIQOV8J8pW
         MbPvDcU1HMCdNgcSk7DzPHZFXIQ7NVTkEv5gIf96tiif5ctePiPLw6uK/3FKAPGecoYK
         kldmvyNT/2ajNDyFStwpifottfLq5Razrf46Mir8Ot0Wnn/KcKVR8YOJ7gIg8WDiCPLu
         VsBg==
X-Gm-Message-State: AO0yUKVyx6KDdls3zsaIx8e7EWRT7cn6n8I6oYxMIFEM0Nh+zju95v76
	/DU2kvgVEkXrE26aCQ5FQ3A=
X-Google-Smtp-Source: AK7set84pyQWNwhP6zk2k0vqJMXn1mqREdZavTBb2sWu3uESiHjFSV4SYgnJic1228mXwbwRwdDCJA==
X-Received: by 2002:a7b:cd87:0:b0:3ed:de58:1559 with SMTP id y7-20020a7bcd87000000b003edde581559mr26298914wmj.2.1680457079332;
        Sun, 02 Apr 2023 10:37:59 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id v13-20020a05600c444d00b003ee8ab8d6cfsm17066115wmn.21.2023.04.02.10.37.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Apr 2023 10:37:58 -0700 (PDT)
Message-ID: <0b743983-1534-d860-5ce8-7fcb67382474@gmail.com>
Date: Sun, 2 Apr 2023 19:37:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] arm64: dts: mediatek: mt8173: correct GPIO keys wakeup
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230304123301.33952-1-krzysztof.kozlowski@linaro.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230304123301.33952-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_103801_531207_BBFDE4EE 
X-CRM114-Status: GOOD (  14.44  )
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



On 04/03/2023 13:33, Krzysztof Kozlowski wrote:
> gpio-keys,wakeup is a deprecated property.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied, thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> index d452cab28c67..d77f6af19065 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> @@ -58,7 +58,7 @@ switch-lid {
>   			gpios = <&pio 69 GPIO_ACTIVE_LOW>;
>   			linux,code = <SW_LID>;
>   			linux,input-type = <EV_SW>;
> -			gpio-key,wakeup;
> +			wakeup-source;
>   		};
>   
>   		switch-power {
> @@ -66,7 +66,7 @@ switch-power {
>   			gpios = <&pio 14 GPIO_ACTIVE_HIGH>;
>   			linux,code = <KEY_POWER>;
>   			debounce-interval = <30>;
> -			gpio-key,wakeup;
> +			wakeup-source;
>   		};
>   
>   		switch-tablet-mode {
> @@ -74,7 +74,7 @@ switch-tablet-mode {
>   			gpios = <&pio 121 GPIO_ACTIVE_HIGH>;
>   			linux,code = <SW_TABLET_MODE>;
>   			linux,input-type = <EV_SW>;
> -			gpio-key,wakeup;
> +			wakeup-source;
>   		};
>   
>   		switch-volume-down {

