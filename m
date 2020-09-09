Return-Path: <SRS0=qDs2=CS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80EB5C43461
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 08:58:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3266F218AC
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 08:58:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Riz4H2aV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n5LZ7Lm+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3266F218AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5sCk8fY7hYeFD5KKnazOr6JqkWrrmyR9ykJTRKmA/iA=; b=Riz4H2aVVqxr0SsVbhxpNNB9k
	A0fiibxVUFPIGzjiPYw9CXG/q+npIS7L/EQkVCqQ4tHK5jWz38XCDgVANCCaHCbKWVpzYFUAJnfL+
	6AzpKLjayGZ36g+9tiE5QixxqpYTziLlzd8bRUpvUg885OIVETf9mjiuF7jjuHImEsubrBpEbktLb
	j2DknN/epwg533pFMh+KwgyekJgm1X5M5uJApNrE9EEXWs6sXJ2EMO7i/tAZXrT8qwGfAb5F0XiDY
	34DA0ZsU0ByCHa+ShtfqzQfjwCf446bceRGANLQ7saRz14g/A6s1A37ubN95Eo9RcWySi2wC/7IRR
	HCR5Gj4gg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFvvX-0001E3-Nn; Wed, 09 Sep 2020 08:58:03 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFvvV-0001DU-Lq; Wed, 09 Sep 2020 08:58:02 +0000
Received: by mail-wr1-x443.google.com with SMTP id a17so2046933wrn.6;
 Wed, 09 Sep 2020 01:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mY/fzmuc9Z9J54FdM2ZzI/TWtsjmz4gHfBgSVB4ZBAo=;
 b=n5LZ7Lm+YDmFKKER+/ysMgI/kt0PyaoCrAXe1aD247+zCUUizrKYj6N+IvvXOS2kas
 NpY98kod+KZqr0NIu9MWhZcd+HqkWcYQJlrIXUhm0XObO0wFbjH13m0bKEM7LmG+mYir
 sPtBcQHjYxKxyMWQuBq5rFsOtKs+1nWxGNhHKmlJw39/mB9U6Kms6Eg+pRimya3W58+g
 CkuTu2/jgtvH6JWUn84QE+ADu1UmouhHMlYPdiI2Jezx2aUyuR/zRc3EWurt5tqIHsdM
 FRQkIXU2Z6LXkNSBnA1Kk1ZBG99ZFdsIt6kaFnnRgG7nGF0tuOD4Q81OdUeBnLd2DptB
 vsaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mY/fzmuc9Z9J54FdM2ZzI/TWtsjmz4gHfBgSVB4ZBAo=;
 b=ZcpvOn5BBgvZtDTqHxZjaE4X8JF7KwpIkQBtT+w9iownrles4YAjVwvF1jdawRmXt5
 ZIGNC7I8h2f1x8SaSQOS9ciDgSr9EeGGiT4vuBAGmw+THHmA0OdJwGCogIu9XQhUHeD7
 0r0dDCROzj64itMZn5/+XJi4q4pFWY1W3sypWV6w8yJl/iZgz8UdWXf6M1NJ5a5HJQRT
 wluzmEmOyo9wX7iIYC+NUCGIUrQ3kBYzhQhMvYa1r/p5LR0Vk04C7i75s05JqdA+lRWW
 jrlPOIqhC6JH8e1ysivxd/hp3e/Ry5jwHybW8RJZBB+dfmLhO6mI8m4VT3lDji1RbbYQ
 9uBA==
X-Gm-Message-State: AOAM533XdTOTzs08NEOHleoP8cioZaBn7p6u7U9JzYxF+5h1wSU7SNPN
 jJtc6A4bks8cZQDnDVnkKrs=
X-Google-Smtp-Source: ABdhPJxBlZkTjgNZg2GsUVOdYfL4ThVMkW2G4Y+Yebj4FIFY/o9pwrA+mol3aBqWMdivXg9XmXRlFg==
X-Received: by 2002:adf:f6c2:: with SMTP id y2mr2720456wrp.79.1599641880528;
 Wed, 09 Sep 2020 01:58:00 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id d2sm3339157wro.34.2020.09.09.01.57.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2020 01:57:59 -0700 (PDT)
Subject: Re: [PATCH v2] arm64: dts: mt8183-kukui: add scp node
To: Pi-Hsun Shih <pihsun@chromium.org>
References: <20200909081422.2412795-1-pihsun@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <dd5a6b8b-71dc-ce54-1f0d-7fa6b1dd6248@gmail.com>
Date: Wed, 9 Sep 2020 10:57:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200909081422.2412795-1-pihsun@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_045801_725980_65E01997 
X-CRM114-Status: GOOD (  20.06  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Erin Lo <erin.lo@mediatek.com>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Eddie Huang <eddie.huang@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 09/09/2020 10:14, Pi-Hsun Shih wrote:
> Add scp node to mt8183-kukui
> 
> Fixes: 0d5e41709f76 ("arm64: dts: mt8183: add scp node")
> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> ---
> 
> Change since v1:
> * Add Fixes tag.
> 
> ---
>   .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 30 +++++++++++++++++++
>   1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index f0a070535b34..85f7c33ba446 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -90,6 +90,18 @@ pp3300_alw: regulator6 {
>   		regulator-max-microvolt = <3300000>;
>   	};
>   
> +	reserved_memory: reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		scp_mem_reserved: scp_mem_region {
> +			compatible = "shared-dma-pool";
> +			reg = <0 0x50000000 0 0x2900000>;
> +			no-map;
> +		};
> +	};
> +

Do we expect other boards to have a different memory reservation? I can see that 
EVB and Kukui uses the same. If not, we should add the node in mt8183.dtsi instead.

Regards,
Matthias

>   	max98357a: codec0 {
>   		compatible = "maxim,max98357a";
>   		sdmode-gpios = <&pio 175 0>;
> @@ -524,6 +536,13 @@ pins_clk {
>   		};
>   	};
>   
> +	scp_pins: scp {
> +		pins_scp_uart {
> +			pinmux = <PINMUX_GPIO110__FUNC_TP_URXD1_AO>,
> +				 <PINMUX_GPIO112__FUNC_TP_UTXD1_AO>;
> +		};
> +	};
> +
>   	spi0_pins: spi0 {
>   		pins_spi{
>   			pinmux = <PINMUX_GPIO85__FUNC_SPI0_MI>,
> @@ -651,6 +670,17 @@ pins_wifi_wakeup {
>   	};
>   };
>   
> +&scp {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&scp_pins>;
> +
> +	cros_ec {
> +		compatible = "google,cros-ec-rpmsg";
> +		mtk,rpmsg-name = "cros-ec-rpmsg";
> +	};
> +};
> +
>   &soc_data {
>   	status = "okay";
>   };
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
