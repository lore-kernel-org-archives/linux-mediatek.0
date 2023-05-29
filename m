Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38178C77B7E
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 16:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B6oEUPyDe6k6imC6sIUryh04ys93Tehf8o/RTmSion4=; b=E3xXIe5FHru7B5WJe8tSsfAluP
	Il1JUNRFRuzTh9lkdh75OIrYMMWi3QbYzNLMGPhONbWoE2R05DyJ/T+FwhUnpeK1dV8Hq9pheyOZD
	JnZkiuxA3KY554u8tPCP86MVkG4C8mdr+W/ex4XGg0/qeSr56XeqvC4+lprZ2XFzT5qVvQFciwi3V
	Qa/MaRWdB8bDv8RlURxdu+u4ievjQjMKfqjwmLYHiR1DHxQjnDp+C5ScAvGfJttZWefwY+T/1oBvW
	GOw6KeNUQWKJ80DvAMHF4jZTsCRRPxz3xoFTQeR+SXs91aF8aGzrwQrb7sPmP4boPRDKOa5e9e34p
	dvx4cGAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3fY9-00B4io-1J;
	Mon, 29 May 2023 16:16:49 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3fY6-00B4gq-14;
	Mon, 29 May 2023 16:16:47 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f61530506aso36203335e9.1;
        Mon, 29 May 2023 09:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685377002; x=1687969002;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B6oEUPyDe6k6imC6sIUryh04ys93Tehf8o/RTmSion4=;
        b=ICGdINm3mLMU2/7rwAV/0Uxi8M0SM8JdOb5gppFed94uXWCvdHUrPYCrJ8BWcjHlHe
         zctcq0JIwa1/vkGO+PDpbS9q4f+v1BK7wP70DJpqDTv4buctUfZPm2jIW3lj4Jplzk9C
         +oDvhJRoPROvApnrOheaSI7bfAykBSIfG1jg9k/qo5HYWJIkfh0tYEgASKds60omE4rc
         GvylKXZhLyK/p/9sA+NKIfVvxMn98vDZEkQ4ptNIArNgP3fvudR20uWicFqt6A22EKOg
         zZvSoT83TWa7GFqfQcbKZeUsP94FZpGH8J01x1ilR94gyGbGLPke/awnY1Rlm+XjMelM
         TWGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685377002; x=1687969002;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B6oEUPyDe6k6imC6sIUryh04ys93Tehf8o/RTmSion4=;
        b=eTpiHOU9HtWvnMZpoD00Tmwz1ui2IBizJOeidNLF2Iu2J6EGcWHwcdcdfhbW+WzNn/
         X1Qo301bhuE8ba/Tuon9HaaF2QLA/JuCcppdUvHIyMnFLNgH7n4s9URMbLDF4ss1lD+j
         wKoJLNHM6V8UycWdX5cYUlLkqVn+JjJn8IIdUDTaxyhqGaDgpP5+lc+G8A/1rI1E81UQ
         hF7qPtjeqJLefpNgK1qq7TCefW8WAJzLxilSwpWRXX9TtNsbw/VvlpBPWMChBoeoimiZ
         RBdcefcqCfSPxzx8gcRHbVmmkQ/ZRIuoteBnQ8PkUvYEin7CezNde2id3a/m+564JmEv
         kyog==
X-Gm-Message-State: AC+VfDxN6hFjsmLdy/1jaK3Z3P63LCgtV19z8Rhg/PuEbzGycmabiJC1
	3Ek40DS7TI0XQUsi0J8sAYw=
X-Google-Smtp-Source: ACHHUZ75AMsCYyTd9+rBATqxtSpmcQNLV+356SY+CSM0VG6B9tAy5IrbZs0dtJ5u5DjvQseiEntplw==
X-Received: by 2002:a1c:4b10:0:b0:3f6:e79:3a8e with SMTP id y16-20020a1c4b10000000b003f60e793a8emr10807728wma.12.1685377002522;
        Mon, 29 May 2023 09:16:42 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id m7-20020a056000180700b003062d815fa6sm394876wrh.85.2023.05.29.09.16.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 09:16:41 -0700 (PDT)
Message-ID: <abef0fe6-ef80-283f-cfeb-e0a4366691fb@gmail.com>
Date: Mon, 29 May 2023 18:16:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] arm64: dts: mt8173: Power on panel regulator on boot
Content-Language: en-US, ca-ES, es-ES
To: Pin-yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Doug Anderson <dianders@chromium.org>
References: <20230417123956.926266-1-treapking@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230417123956.926266-1-treapking@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_091646_368174_6BEF0F2B 
X-CRM114-Status: GOOD (  16.00  )
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



On 17/04/2023 14:39, Pin-yen Lin wrote:
> Add "regulator-boot-on" to "panel_fixed_3v3" to save time on powering
> the regulator during boot.  Also add "off-on-delay-us" to the node to
> make sure the regulator never violates the panel timing requirements.
> 
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> 

Applied, thanks!

> ---
> 
>   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> index d77f6af19065..03d1ab2ca820 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> @@ -96,6 +96,8 @@ panel_fixed_3v3: regulator1 {
>   		regulator-min-microvolt = <3300000>;
>   		regulator-max-microvolt = <3300000>;
>   		enable-active-high;
> +		regulator-boot-on;
> +		off-on-delay-us = <500000>;
>   		gpio = <&pio 41 GPIO_ACTIVE_HIGH>;
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&panel_fixed_pins>;

