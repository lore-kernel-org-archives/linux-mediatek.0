Return-Path: <SRS0=XaoX=OK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67BE6C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Sep 2021 12:02:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E58060F56
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Sep 2021 12:02:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1E58060F56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R5s/9UxKFhYe1BQnF3H5cv/Gu3//T3dmFKo/UfLwnWg=; b=gscVz64CACoOSi
	UnXCtjUzG9LM2UXOj8Wj0c2lkcDL3hj8zMNF3kiYkSW7d5PbSBbowTPbWGu08RUDSLoZhINygamUl
	TVSMpF3jlLUUDxYvT+DGcvjF7wW7fifua4AdUu+6gPm/QVEwFPPuAq7lbpALjGFHej4iBeB3GdKYX
	XiWOcGnDloukC/Ky5z1YaGeEoNX4wtFRuKlJj2RzDQ83kRpSPv2KB+EdbBr0g9936xIyczibn5dUm
	SfIm6nrVEDy3KgeXzzWMOu+d7Np1aLokErWNhFrEEWj3Sp9gWtLYEE6PEHw/nIvNyBLIPm1JsYa+j
	bENSGHKR3NAWhAC3qELg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSHzl-001U4T-Le; Mon, 20 Sep 2021 12:02:01 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSHza-001U2D-JX; Mon, 20 Sep 2021 12:01:52 +0000
Received: by mail-wr1-x42e.google.com with SMTP id i23so28966411wrb.2;
 Mon, 20 Sep 2021 05:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Yps8bt2FBtfainwuMRQ1I6tWL0WG1SqRqPwtRgGpER4=;
 b=JDe7MHo0RI1UpNcpZf39X/27jmaP/aMAWtvE1/dDVxxn/oJ2gAgGx9A1qpGhMmhV79
 YN70g/+yWW/BtVo85C+RKq51xkDfDSh4wrGzD2DWXZJja7B0G+Mc5AflUCt+aUazZ4Wl
 a4BfwIdshkv9AImT0hPCUuaUNag85WDXUg34Sv1tXoiwCDAYAzGKnS2SbilLeu97YftR
 MgPKzyMuDg2AzYBdTBh+rqiBlmGHcqTc6jCIxLmrxae395a3cmGGchcQ5KO87enlREHW
 zGzfeLhkOw3M67J9yRQAuHFPBYcTJDgyimash9t0fm53QuFdQrSOev4VylpYuC67tkQK
 NUsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Yps8bt2FBtfainwuMRQ1I6tWL0WG1SqRqPwtRgGpER4=;
 b=crAjFto48RFQAnFM5Wo67YqjIj3f6f1ikM9GesM/nydjHnw39gklm80ZM6j4OpTuvO
 U8h4GtX+ukLWIhYFAdZZ2RWww8tSYksFg132xy7wpuHZufFEnwSPmpomkhk2+AOh1N85
 /ymlDx6kr3QqDsnNuqaycMqeqRddSu6Yt98D4pO7M7fj6QFvthZIZ8VMDFftHKJNBywM
 ZCWsYvXpgjTaFUm9n1WPiuKEoJ0sPvj3EjFuXhv6WJ97vHyHT2iD5eve3cI7fo3/lUKr
 BrLXl6mDY3tuT/85r3kKuNFQboFBUsuinGSttVYS7u/950PwZ5o3m4qLLearepMArzbf
 8XvA==
X-Gm-Message-State: AOAM5323L3d9eW5aKkVacfhuvo4/0msYQUV4jh2UF+dZiJwrw701o1mp
 NQx/a0E4tC2N48upce3EATE=
X-Google-Smtp-Source: ABdhPJyx3C28Wosr1fZfE90gYcZrE47TW0kXFU7wZa3TCVGEDUsYZ4KwRuT0cjqIUbwKpXSJGF73ow==
X-Received: by 2002:a5d:4212:: with SMTP id n18mr28494785wrq.37.1632139306631; 
 Mon, 20 Sep 2021 05:01:46 -0700 (PDT)
Received: from [192.168.2.177] ([206.204.146.29])
 by smtp.gmail.com with ESMTPSA id c30sm15963916wrb.74.2021.09.20.05.01.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 05:01:46 -0700 (PDT)
Message-ID: <a55fca55-78d3-554a-4ad0-f555beac3fa8@gmail.com>
Date: Mon, 20 Sep 2021 14:01:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Subject: Re: [PATCH v2] arm: dts: mt7623: add otg nodes for bpi-r2
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
Cc: Frank Wunderlich <frank-w@public-files.de>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210830145958.108605-1-linux@fw-web.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20210830145958.108605-1-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_050150_698011_33DAC188 
X-CRM114-Status: GOOD (  17.40  )
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



On 30/08/2021 16:59, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add OTG-Nodes for BananaPi-R2
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Applied to v5.15-next/dts32

Thanks

> ---
> patch is based on
> 
> "arm: dts: mt7623: add musb device nodes"
> 
> https://patchwork.kernel.org/project/linux-mediatek/patch/20210822041333.5264-2-mans0n@gorani.run/
> ---
> v2:
> 	rebase on plain 5.14, v1 was based on some not upstreamed work
> ---
>   arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts | 25 +++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
> index e96aa0ed1ebd..027c1b0c6a98 100644
> --- a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
> +++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
> @@ -366,6 +366,14 @@ &pcie1_phy {
>   	status = "okay";
>   };
>   
> +&pio {
> +	musb_pins: musb {
> +		pins-musb {
> +			pinmux = <MT7623_PIN_237_EXT_SDIO2_FUNC_DRV_VBUS>;
> +		};
> +	};
> +};
> +
>   &pwm {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&pwm_pins_a>;
> @@ -396,6 +404,19 @@ &uart2 {
>   	status = "okay";
>   };
>   
> +&usb0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&musb_pins>;
> +	status = "okay";
> +	usb-role-switch;
> +
> +	connector {
> +		compatible = "gpio-usb-b-connector", "usb-b-connector";
> +		type = "micro";
> +		id-gpios = <&pio 44 GPIO_ACTIVE_HIGH>;
> +	};
> +};
> +
>   &usb1 {
>   	vusb33-supply = <&reg_3p3v>;
>   	vbus-supply = <&reg_5v>;
> @@ -408,6 +429,10 @@ &usb2 {
>   	status = "okay";
>   };
>   
> +&u2phy1 {
> +	status = "okay";
> +};
> +
>   &u3phy1 {
>   	status = "okay";
>   };
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
