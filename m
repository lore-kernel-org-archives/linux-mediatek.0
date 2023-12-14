Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91174C4167B
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Dec 2023 06:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1iMbqEZR5eaXa4dTgt4nUw5UGW6RlRrufIGjK+6wcTM=; b=mpwrXoJXrbzTyy
	9nTEl+Pdi1OxO8DVVt83Q1EHC8yJzW3As5KEjK+9Ma4Uu8z/cznvN/WRAAcr6n8ttIEPFsE7RoxLk
	qDnC21z1qL5hUnAL6QFRaiFfawivdeRpwukkImdReoyb9K97Cv6OHIWyJpihGo82dRpzZLULO5q36
	P5GOYQisQnF7WRW35UF/2GRwUEzDiyrO8UuGLtX6WgjBs89qWTPYV/rmq4ObPXX481swfPRPqZhpe
	ZF7JibcV+u6WukIMF10vk/BUJERblNVqPBE/p8wCccY4rpOFljTmvNKJSCP4Mq3zTJ4WAcLRhmV5T
	NG8bNsTXJHbNVi/PHEzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDfR6-00H0om-1s;
	Thu, 14 Dec 2023 06:43:08 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDfR3-00H0na-20;
	Thu, 14 Dec 2023 06:43:07 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-55202565d48so1459840a12.0;
        Wed, 13 Dec 2023 22:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702536184; x=1703140984; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1iMbqEZR5eaXa4dTgt4nUw5UGW6RlRrufIGjK+6wcTM=;
        b=ab3N6CN3oGsAhk2MiRl+uuZokirNLwaLqxu94vApg5rXu2/DI1uWYHM5QUa9/fiqsp
         Sj+m4t0rJoEfC1uaCKHis31U5LyETz5ZuipgRSddkYhY/vIHt50EZZ29aKAQLeCA442t
         0PEba5+i6n9nC0zdxQyNSgONEYyguxyB6aMA6RGaruYF1jYQbrHNjVwkGV/1nxLIwS7t
         O26RZbch1/zpVguQy4wMG7M6iH4G8yXp5fDPWbtHmD0+B70auv5leRGGKkSlgU6f1kTM
         tYs/KU5TjM39O/MIV6+PMZFLJ+qo31Mj+xTCYMqIS9FzgXvOPcUaU5IUddR/SVNtA5cd
         LxjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702536184; x=1703140984;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1iMbqEZR5eaXa4dTgt4nUw5UGW6RlRrufIGjK+6wcTM=;
        b=U/EJV6w84oJ9Ktt3Xn3S2ZmkSNxmZEwrDHtF+PnA+kky2RwNIVb729hB/Ol8njd/mI
         8BbSPfFmr+/dU6mv8qcVqPhLS6Z+G/ATLBWgwB/r6/00WBEvlifETc5V98VkuRBKqKKj
         /+344TnGzP46sx27huxBL3Ax9Od6p4f2K161yoMQWgMfgSsPUpubQEW+zuSwbqlEy44T
         SOQJw0WXoe/cYXxOgwGIC2nxPVrM1kj7QQK2VaMhVy1zDCXIURZz3UDEs1qrCmnUf90u
         YC8jzXCVoGhApH6T7n0CY+nIFMfUrQ4NnfjY15vXAuVUE/poYBYZw/KZphDfE2kI41Va
         IW5g==
X-Gm-Message-State: AOJu0YzEQ4trj6i84WzCSa5Xhuqn+aZ78w0q2DyDlU+xa5qTu5akI3yM
	iAIEPMLEjLMsi44RJZQjGlM=
X-Google-Smtp-Source: AGHT+IHbL6T33tZSZlPZzC11uXyFcBsmtHS/gkkr7kg1JyHY7NIkaY1VviDHvP8WgTQtelpkHjQp9Q==
X-Received: by 2002:a50:f68e:0:b0:552:7ecf:8651 with SMTP id d14-20020a50f68e000000b005527ecf8651mr51148edn.17.1702536183444;
        Wed, 13 Dec 2023 22:43:03 -0800 (PST)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id r10-20020a508d8a000000b0054cb88a353dsm6333909edh.14.2023.12.13.22.43.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 22:43:03 -0800 (PST)
Message-ID: <a5113b85-e29c-454f-b776-ac7abbca771f@gmail.com>
Date: Thu, 14 Dec 2023 07:43:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt7986: fix reference to PWM in fan
 node
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20231116130816.4932-1-zajec5@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20231116130816.4932-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_224305_659646_C3537CB5 
X-CRM114-Status: GOOD (  17.71  )
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
Cc: devicetree@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-mediatek@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi guys,

On 16.11.2023 14:08, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This fixes typo and resolves following validation error:
> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: pwm-fan: pwms: [[54, 0, 10000], [0]] is too long
>          from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml#
> 
> Fixes: c26f779a2295 ("arm64: dts: mt7986: add pwm-fan and cooling-maps to BPI-R3 dts")
> Cc: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

I sent those few trivial fixes weeks ago:
[PATCH] arm64: dts: mediatek: mt7986: fix reference to PWM in fan node
[PATCH 1/2] arm64: dts: mediatek: mt7986: fix SPI bus width properties
[PATCH 2/2] arm64: dts: mediatek: mt7986: fix SPI nodename
[PATCH] arm64: dts: mediatek: mt7986: drop crypto's unneeded/invalid clock name

Could someone pick them up, please?


P.S.
FWIW there is also my Acelink EW-7886CAX work but I can understand if
that needs to sit for another week or so.

> ---
>   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> index af4a4309bda4..ba65e3e72bf6 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> @@ -43,7 +43,7 @@ fan: pwm-fan {
>   		#cooling-cells = <2>;
>   		/* cooling level (0, 1, 2) - pwm inverted */
>   		cooling-levels = <255 96 0>;
> -		pwms = <&pwm 0 10000 0>;
> +		pwms = <&pwm 0 10000>;
>   		status = "okay";
>   	};
>   


