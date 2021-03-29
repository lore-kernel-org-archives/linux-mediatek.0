Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2928C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 23:04:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CB4861987
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 23:04:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CB4861987
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=P5C35FQzWDnGza1aOQWDtCnPPFWL6FqwXWlZ0S4GHVk=; b=QaTH7gLeXmMRwGDsFg+uevQbc
	3+0Z3K1RmvHVa1ZdEtLNFbuRNsi2bny42EbFHGajjhTUstftb2XKWhLgz1KdZQYCuWcT56ps2ZZRU
	7BGKlN9d1AoMhwz7dufdyB7+8rP/vz1jGCeERIffAxslvw4KD3I6WLUVobiETJeKk/VLBbvUirh7g
	+xvmNRB2eu7L0CqALq0fnApLKPLvJZiXLYFyjyhPMzk1nfB5k5SkOAcgtfxeiY1c4nyNjXlC52o+d
	o06W1cj7wE6/EqAvDkE5CCNhnEAXTxjeQMdprnDOuaBLGVsaYUwH9CrEh6Sg0rs/Pql01iNJqNLhc
	ofyZaSUJA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR0w3-001pIL-Iy; Mon, 29 Mar 2021 23:04:39 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQtmm-000jaV-Bw; Mon, 29 Mar 2021 15:26:38 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 12so6809892wmf.5;
 Mon, 29 Mar 2021 08:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pVsxfbxI3K7GA4FFYH0yy3ggGjDTL25VjE0xUpkqj58=;
 b=WXDtbKB0+76S9xXdtQ6UIVOL98eUnJU766WdbNd+xYvGjtL8AOwVQpm9tG+igKGair
 hk7lm4iFc2636sXASZJi9HHOi/Jv3dokvUDsdU8ZUutqY0YoSrpqlA3NNDlGgnjaCoc4
 oUM9G1dcGQpjhKtBC0oJDoVQBNYZG+t5eo1nmAsC5TgEwMMGTWBK2UmEHzYyy7V5XWF/
 2fOowYxTQkzlKH7ils/Dqbi9zfEAF0m6jjx4Sf3KSNWVazCnn4fIQdReIXI364uDdCwQ
 QVeDjB9y2DmpUj0w/uWOUTnhRFZA8GknPiVaXN5w4d6UphRKdaKYjOkcPytNVQvAI31w
 3a1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pVsxfbxI3K7GA4FFYH0yy3ggGjDTL25VjE0xUpkqj58=;
 b=K8MsihMZxAyG5RweD2De4C5Uhgvveez111U1id+/N9Lra6yMW9ILlsPKwS6qzfAvdj
 Pim16YpJk/key28nMYANx/Qdsc+vTjVZhvewP9tQNgM2z2uyQw0AkFymEnu0Gho2veRI
 1AuXhtxFUfpSY2vV8uWIm2LekRFb9IUpPKNIvKePcyP/kibc8JPmFgEVMm7aUN9OcNEF
 KbpHfBlEO3VjDX5478y2ORsAGhUR5siCeBF4dYjfEWWWz10lQccH/0wuCh1ZcpOj3HkZ
 mm2x3GqCGw03NOk6rhtTwjeY8gH6JzMrbOBpO55mUCjg+wul3o8Co38n+JqLCpAjSYyn
 7pJw==
X-Gm-Message-State: AOAM532Up0Lj21GrSfXJSeWh/VzZH+ljkMmWIFvgdUQL7L8oqqJh3+Bl
 wE2KWSQR1lFKLtHCDvgEGEU=
X-Google-Smtp-Source: ABdhPJzjfFaDdwLJ9ucjx+qAIuDEy4nFJSnA1nNxnCmsCL449bMsQm0G7Y9a/8Po9VAybCyw92ZR2A==
X-Received: by 2002:a05:600c:4f44:: with SMTP id
 m4mr25159222wmq.175.1617031590669; 
 Mon, 29 Mar 2021 08:26:30 -0700 (PDT)
Received: from ziggy.stardust (80.174.240.175.dyn.user.ono.com.
 [80.174.240.175])
 by smtp.gmail.com with ESMTPSA id e17sm34198560wra.65.2021.03.29.08.26.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 08:26:30 -0700 (PDT)
Subject: Re: [PATCH v2] arm64: dts: mt8183: Add gce client reg for display
 subcomponents
To: Hsin-Yi Wang <hsinyi@chromium.org>, linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210324070842.1037233-1-hsinyi@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <aa98e29a-3e8e-db22-50e8-e0b8fa496bdf@gmail.com>
Date: Mon, 29 Mar 2021 17:26:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210324070842.1037233-1-hsinyi@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_162636_624643_33B03636 
X-CRM114-Status: GOOD (  15.91  )
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



On 24/03/2021 08:08, Hsin-Yi Wang wrote:
> Add mediatek,gce-client-reg for mmsys, ccorr, aal, gamma, dither.
> 
> Fixes: 91f9c963ce79 ("arm64: dts: mt8183: Add display nodes for MT8183")
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Applied to v5.12-next/dts64

Thanks!

> ---
> v1->v2:
> Add for mmsys.
> ---
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 80519a145f13..16f4b1fc0fb9 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -983,6 +983,9 @@ mmsys: syscon@14000000 {
>  			compatible = "mediatek,mt8183-mmsys", "syscon";
>  			reg = <0 0x14000000 0 0x1000>;
>  			#clock-cells = <1>;
> +			mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST>,
> +				 <&gce 1 CMDQ_THR_PRIO_HIGHEST>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
>  		};
>  
>  		ovl0: ovl@14008000 {
> @@ -1058,6 +1061,7 @@ ccorr0: ccorr@1400f000 {
>  			interrupts = <GIC_SPI 232 IRQ_TYPE_LEVEL_LOW>;
>  			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
>  			clocks = <&mmsys CLK_MM_DISP_CCORR0>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xf000 0x1000>;
>  		};
>  
>  		aal0: aal@14010000 {
> @@ -1067,6 +1071,7 @@ aal0: aal@14010000 {
>  			interrupts = <GIC_SPI 233 IRQ_TYPE_LEVEL_LOW>;
>  			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
>  			clocks = <&mmsys CLK_MM_DISP_AAL0>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0 0x1000>;
>  		};
>  
>  		gamma0: gamma@14011000 {
> @@ -1075,6 +1080,7 @@ gamma0: gamma@14011000 {
>  			interrupts = <GIC_SPI 234 IRQ_TYPE_LEVEL_LOW>;
>  			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
>  			clocks = <&mmsys CLK_MM_DISP_GAMMA0>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x1000 0x1000>;
>  		};
>  
>  		dither0: dither@14012000 {
> @@ -1083,6 +1089,7 @@ dither0: dither@14012000 {
>  			interrupts = <GIC_SPI 235 IRQ_TYPE_LEVEL_LOW>;
>  			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
>  			clocks = <&mmsys CLK_MM_DISP_DITHER0>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x2000 0x1000>;
>  		};
>  
>  		dsi0: dsi@14014000 {
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
