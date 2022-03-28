Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C4FC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Mar 2022 11:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6rfF+UTkcU+/dshtH6LZ7s1HYBMfSPs4v/Mr9dtUyhM=; b=oSr1g04QO7DXpp
	8JZfqD1OY7WpNU6ECXn8aVJmmo+pmkhA5WSmjwAHyKUQY+PI7iRc4M/lxxMuPWFT2nu9LLCLQ/nKa
	oX1Pf7Y3FB7/IA9fxMPZSbEvPUOJqVEacrHJc/TjayhUNvEiyp2iJAov+c2Z2YMKDYp92geI4dqnV
	bRshrEeOblrCCfHUm4EmHYdbWUr3QcrVON/aUnl4o22rg6RPJUHzaQ+EmB3LvdA1b/Hh3Hzdh0mid
	CRIY8Ds+y9oDwA5JF0ROleByLYAQJoMfdMn69hLMp4gUayranH5Dny1OpE9z185jnTz5ZU+5LZgKI
	8yV8+/jA6NObs4RhBlLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYnH8-008JGN-D9; Mon, 28 Mar 2022 11:11:06 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYnGr-008J9i-4X; Mon, 28 Mar 2022 11:10:50 +0000
Received: by mail-wr1-x42d.google.com with SMTP id b19so19802930wrh.11;
 Mon, 28 Mar 2022 04:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=YO5Ybs7Z8BiVv4Kteu2ySFfAWcGUm1ja/kydyOFD7Lg=;
 b=CKEsQTLqEPzq7MUVFUaoxlvKXGwAhnE1F7Y+/DcQg0ZaGnS8BOvynke/Wy+JfmqqjZ
 zzzdxZvLMEEbqabznWzGTrzJBRVDaI63vAwHRpV+g6tORgc9QOW30PPsd9ANuHFaeIDz
 vfmKYz9p9i08+PDK5Mnp16ajjhLiTeoLW/CfRML9RWqSGG9dkYZ6+Y2eXuAkYaq9oj1F
 Tw45Fmb86AgV2C2EE76qszAWfB3KXH49uRpsfJhl4OgnI2+VHFbI+gwvjBFFsjZdBm+g
 BRxTV3W0PA7zGdLbk7rhdZg4cqlmYzzg7beFXVaaxnFikxYOGFUwAxjEBN/YAUGDInKv
 YDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YO5Ybs7Z8BiVv4Kteu2ySFfAWcGUm1ja/kydyOFD7Lg=;
 b=bEDwwmCes6EuYnuIXwddXY9Q23AI7Ba7U7iJjqRu4LxiPFcfIUep9JCxzpv3cqhJYL
 EgcufbgW3fj6INqk+b4NIqiwI9k7gLQQTaYqDGPpJLyM0z/Pbkhq5/G0yu4XtgjtNI0n
 uzj1a84KkRhCXzQp1P6FVPRouG6n3hQ9nOXPFs8+813AdoLvMmo8imnKoF3twPvpYEeO
 2IsGNh61CS9pjY1oIh6tRJ2s8H+SZWBpHrh/TTpV/7zNQl5xTndT7Aog8+qgYJKEHxqc
 KtQVyeix5vWKwOQTjc/53c7bNWsZEBsHQNTYDqMLz3t/YFdjkwdD4qzjf1nDY0iZYbzz
 WV8w==
X-Gm-Message-State: AOAM530/TDvxIQe285p86HFUsXPfrbeUVhr6wmHzu1tXdh5sBINc+F4s
 1CZfCe4oP+3cYWdZKjXVJyk=
X-Google-Smtp-Source: ABdhPJzaAxJbsNW/3r4U3icUncEmZem0++QDKaBkIhG8tcgajESrnxuVR3yF/nCbwWz4+TMjtqn6fQ==
X-Received: by 2002:adf:d1e7:0:b0:205:8909:a67f with SMTP id
 g7-20020adfd1e7000000b002058909a67fmr22485894wrd.66.1648465847967; 
 Mon, 28 Mar 2022 04:10:47 -0700 (PDT)
Received: from [192.168.0.32] ([137.101.87.65])
 by smtp.gmail.com with ESMTPSA id
 r13-20020adfbb0d000000b00203e0efdd3bsm12270763wrg.107.2022.03.28.04.10.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 04:10:46 -0700 (PDT)
Message-ID: <51f8baea-6562-1d6b-c409-9c362f0b2fc5@gmail.com>
Date: Mon, 28 Mar 2022 13:10:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 22/22] arm64: dts: mt8192: Add pwm node
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-23-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220318144534.17996-23-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_041049_215308_D4CF9DDF 
X-CRM114-Status: GOOD (  18.07  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 18/03/2022 15:45, Allen-KH Cheng wrote:
> Add pwm node for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index f0f0f067c023..ea98b2230f18 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -625,6 +625,17 @@
>   			status = "disabled";
>   		};
>   
> +		pwm0: pwm@1100e000 {
> +			compatible = "mediatek,mt8183-disp-pwm";
> +			reg = <0 0x1100e000 0 0x1000>;
> +			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH 0>;

Binding description is missing interrupt property. Remeber that the DT should 
describe the HW, so we need to update the binding description.
I just wonder what the IRQ signals, as it is not used by the driver. Definitely 
a good candidate to make the commit message more sound. So please add it there.

Thanks!
Matthias

> +			#pwm-cells = <2>;
> +			clocks = <&topckgen CLK_TOP_DISP_PWM_SEL>,
> +				 <&infracfg CLK_INFRA_DISP_PWM>;
> +			clock-names = "main", "mm";
> +			status = "disabled";
> +		};
> +
>   		spi1: spi@11010000 {
>   			compatible = "mediatek,mt8192-spi",
>   				     "mediatek,mt6765-spi";

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
