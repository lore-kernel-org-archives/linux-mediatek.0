Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E29C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Nov 2022 09:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5exqSysqc7YHZXiStWHpWi8OBaqisnDZY31klCw8FDo=; b=RAY8q3kDHt4oLh
	SQqntauZXtGV29CA9pROD5p/9ZF+vPhbZuSMjLkbybvoaerIlIZA6lXdTqZMSREp/lR6kv01JBT42
	hBkczlZN77eifeZqAw+iUnIDUtWkSe1Ys8uS1GikbdZB8N/PzLXmc4D1Lu492kCn429FmqWcLzSdz
	39w+rmMr4eJmYG8IzogECV0LeUxKj5+2etaseWNlqDJHg2HQv9i/TND9an40NsRD8vL7t1UyWsiti
	XK/EbKPd+D3tYWD7yacf9hgmf1LZH8Ik0d5fGmWbcnU4wi5/sQP+QJ8RDdWSCsB9matSOtZqBTHLm
	q/WS04YjBqf9gIdMUH4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otPzF-00EUgM-HV; Fri, 11 Nov 2022 09:06:09 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otPzC-00EUdU-TG; Fri, 11 Nov 2022 09:06:08 +0000
Received: by mail-wr1-x433.google.com with SMTP id cl5so5601208wrb.9;
        Fri, 11 Nov 2022 01:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5exqSysqc7YHZXiStWHpWi8OBaqisnDZY31klCw8FDo=;
        b=NbF4F7dz0fofp/f43N2ow0yB/tAABhFhEVMbbwLgVZndPW6oTtV6gh8DOaaOdIMNpr
         pUOTcRj3CvL1AdR8JZuB99ujecuBtJ/0wC3FCevUUbOlsrb6GjYi0pwQ7U1C9Adl230+
         TC3VqpN8as2xq9K+IrPNrIK7gjV5l9lzxIovFesk8zAlRozMYMOAjZL3I8Dm/Xzthw5H
         5q6nDg32nXx7vzbKn9gemP0SoTYg834FtwkZsYAt4vNRFBGVl5jJ2qEFSA+Xxk+Tl/qM
         slYN6velNyNjsYR4fTMHFjipz+SUcKPpPUxRODiJrTHBOiMN8YOyTTKMaKorzvVte4lo
         aLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5exqSysqc7YHZXiStWHpWi8OBaqisnDZY31klCw8FDo=;
        b=qX7p+ocowyIbvd5VLR5APsx0MFlwz2Zwdkwnymt9awjSTP/F4WcEutXrKriPBf8q+7
         11J72ACu/Fhleximn3ctyeJ0IXwmrQuqFvdDDIKFrgie6/l/FttL+TkUicZS36T3O5G0
         AldYhKJLRnHlppTl6d3ZG5wp5M6BX2DL71ZaQwJmnXemz8URatbU+A/2WK3092V67VXd
         g+gOAGu0CP2NqCm8juFpwbADYLmPPwZA2hQQv/qUsTEsNTaNnaX2XynDf9L5dZUWsSE/
         CZMmdQ2KSwZky1WPJtlKMHu6hsbFt/75RWWwzsG7/ATK+yShmzCQDHAkUsV5qOLryzQj
         Tdsw==
X-Gm-Message-State: ANoB5pkI5ji59jcABwdqnbhXgzfVnt/ZVXvTyaP8rSfwAgGd6kzLaAUV
	MriNa/JgZbJ1aTNBymIP3Vc=
X-Google-Smtp-Source: AA0mqf7NqydisRfGc/xHd5/cqwAgF58CN4sU4/ZLqyyjDVsYUbAuedLMEKJjiAC5d/zeN5+rhpPjnA==
X-Received: by 2002:a5d:6a12:0:b0:22e:3664:ffce with SMTP id m18-20020a5d6a12000000b0022e3664ffcemr664681wru.131.1668157565241;
        Fri, 11 Nov 2022 01:06:05 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id p7-20020a05600c430700b003cf6a55d8e8sm2202375wme.7.2022.11.11.01.06.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 01:06:03 -0800 (PST)
Message-ID: <68e4f061-af72-fe13-2a49-f62a9c542685@gmail.com>
Date: Fri, 11 Nov 2022 10:06:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [RFC v3 06/11] arm64: dts: mt7986: add i2c node
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20221106085034.12582-1-linux@fw-web.de>
 <20221106085034.12582-7-linux@fw-web.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221106085034.12582-7-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_010606_973040_A0764A72 
X-CRM114-Status: GOOD (  13.62  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 06/11/2022 09:50, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add i2c Node to mt7986 devicetree.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Applied, thanks

> ---
>   arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> index 32c26b239ae6..a1a788db113a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> @@ -261,6 +261,20 @@ uart2: serial@11004000 {
>   			status = "disabled";
>   		};
>   
> +		i2c0: i2c@11008000 {
> +			compatible = "mediatek,mt7986-i2c";
> +			reg = <0 0x11008000 0 0x90>,
> +			      <0 0x10217080 0 0x80>;
> +			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
> +			clock-div = <5>;
> +			clocks = <&infracfg CLK_INFRA_I2C0_CK>,
> +				 <&infracfg CLK_INFRA_AP_DMA_CK>;
> +			clock-names = "main", "dma";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
>   		ssusb: usb@11200000 {
>   			compatible = "mediatek,mt7986-xhci",
>   				     "mediatek,mtk-xhci";

