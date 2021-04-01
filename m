Return-Path: <SRS0=qM2e=I6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E264BC433ED
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 09:40:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C2726108B
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 09:40:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C2726108B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=L1X+jrcr8bKt8ra3i0Cn/zI9d8fDJt5I+7FeAqUh2lo=; b=pipgPIavPVeRWOI0PfigzowNE
	zn02GidcMoWf5AF2mcNwKhLgw8T6Y795XJX2ciiG3qgF4rzq+y+QQIXMiS+SmxrovSyd3qY9K2G1x
	hfhQJMLT525GcgjnT7tC+LUvea+p9ZmKOgyzZuJqsYYnQwmOcZdcyssRxZJgEdpfuk3qJvs+WzKoC
	adZbrtSDF3TBVRxNzMNa3l3uXEx9IozcP7JuuKht5kBTSY3QfNYWcjvoqEtFBxrGpbcZL7d3aKuZv
	it2ttUFgrT7Q9mS/zN/P9TM9/g5P6MEQOzlFfZfLuT24/+92Hj9q2G2QNYetSH1kmPgAetGOOueYF
	xQg1kfEgA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRto6-0095nz-J3; Thu, 01 Apr 2021 09:40:07 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRtns-0095kB-RF; Thu, 01 Apr 2021 09:39:54 +0000
Received: by mail-wm1-x32e.google.com with SMTP id d191so725662wmd.2;
 Thu, 01 Apr 2021 02:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tVIUyZe1K8XZ+WdFPHcdsFBxCUN5Igt+uXBRDrDZlWE=;
 b=TQbrqEciyXKtf8PEikqo7E1hSDW3qgNmyiRsHCA0IIXASwSWq9dKlJDSXBgbbxh9Yb
 qrTWB13TlNzyDxfcV4I7H2ydX8tY+n4yfxrKwSn0Sosz1NhrkkBLdK+M/jyajOis6nxU
 CoGyDJ0uwhKx7wPlEqAiAqBwHlIskFI4aGdjZwVEqoCCksyHemkrkA9jS7m4H0M7h3i4
 oByH9G4/JrCeSrfuoIhL/hUBpa258Axk+OcDj7dRobCKkZL4SHD8l3bbGdDfgbaEsokq
 FCQllsuIhpCGSzd75LqM057WasNlA5VGaDhOQ9eQNFXVRotFu7DqHtmGM7W8pFDlMGpF
 wqhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tVIUyZe1K8XZ+WdFPHcdsFBxCUN5Igt+uXBRDrDZlWE=;
 b=GaNbkKBnWvo7hsX9OpSGR/KEPMjCH5WsJY3CXerAijFWR2v5H/M76abTCT6viX0St/
 ZSiZuRTe31ev3THXYvhdmB/tZkr8/8ncWQYvDLdUApI0nsOa6d4m6iypG4stMYPm0dQQ
 OdNd7LwmWK//zXygA+2QBgqN0t2Ezxvh5+U+CE6Zpo5KErexeiSkrllW7qZwTPFTinWY
 atpNoVOUhcyX3eJ6zNDoDUkJZkuX47AwO6HrdahzDzzAAa/XKWEwVc1UHDwo9wKfYq5O
 ui/UD3Qqh+R2fU0XVGCGr9EhdJEilSQ1HsqTqgYY/xrqCTSmdQu9m55Y+uSU0GMQH64F
 B26g==
X-Gm-Message-State: AOAM533MvW8smZRmGc6yINYGOUaazOgFNNR7exfIpaxA5t3fUXkDLG22
 Smdpb/77lFDsSrSnOFmdfoo=
X-Google-Smtp-Source: ABdhPJx7tXV7KufYJm5L5rvaDt05s6UtrVE88LDnXjIDMF0Nxw4Ld9XUNphxkTLcDKYvBCBOoMccjQ==
X-Received: by 2002:a7b:c8d9:: with SMTP id f25mr7159186wml.157.1617269992414; 
 Thu, 01 Apr 2021 02:39:52 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id 81sm7908130wmc.11.2021.04.01.02.39.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 02:39:52 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: mediatek: fix reset GPIO level on pumpkin
To: Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: mkorpershoek@baylibre.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20210223221826.2063911-1-fparent@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <46f49f9e-20a6-ea3b-a3c2-2249cdd3613b@gmail.com>
Date: Thu, 1 Apr 2021 11:39:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210223221826.2063911-1-fparent@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_103953_187263_867E9C2D 
X-CRM114-Status: GOOD (  16.58  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 23/02/2021 23:18, Fabien Parent wrote:
> The tca6416 chip is active low. Fix the reset-gpios value.
> 
> Fixes: e2a8fa1e0faa ("arm64: dts: mediatek: fix tca6416 reset GPIOs in pumpkin")
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Applied to v5.12-next/dts64

Thanks!

> ---
>  arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
> index 63fd70086bb8..9f27e7ed5e22 100644
> --- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
> @@ -56,7 +56,7 @@ &i2c0 {
>  	tca6416: gpio@20 {
>  		compatible = "ti,tca6416";
>  		reg = <0x20>;
> -		reset-gpios = <&pio 65 GPIO_ACTIVE_HIGH>;
> +		reset-gpios = <&pio 65 GPIO_ACTIVE_LOW>;
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&tca6416_pins>;
>  
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
