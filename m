Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0900CC433B4
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 13:13:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95A6D613C6
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 13:13:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95A6D613C6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=egSxgkjDii4zPg6YQqm0BlAUeNtM+d6SZ+V4BXnQWCQ=; b=RQfPwWCGsapLqtrmn1lz6AFIP
	qLz2ZGG+FBJ6A9k6YparCzBYMro/goDVEoFXwCdM987iv7+ONOVcRLB9THqy1XhOzNnzqhhc2BxHt
	urTmXyrcH2LfkS3sp9bRAbM0AVBv4IaqP4FgyVxl3ZTZET56TgzmseCkJbYAH9TzXQOMNfqVjFOQb
	CGPooKLX3TRyBe+nuP83pAICxVT9p3LRo6oFVts0OBKHfFRdA0x6VqazArU8a3+omFMwhuYcAhFe4
	yBxyVftwg2X8VbzauoM47mdHduq57A/H42tSxkOCiAE83qx4dISi6F691i77jK3Ut2CM35hZpav0d
	w3TppNvSQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTlWI-002frK-22; Tue, 06 Apr 2021 13:13:26 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTlWE-002fqL-3B; Tue, 06 Apr 2021 13:13:24 +0000
Received: by mail-wr1-x42b.google.com with SMTP id a6so8177179wrw.8;
 Tue, 06 Apr 2021 06:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1reTPibzqrGVFT+HaxpJOSIl23ImGuDdQsAq06ZO/Os=;
 b=DI2zdnbiorjV/BiuA/2TO8JnwtvPJSK9Xrnt88nEYjGhmwM6LyfHehFMO6oNLKslNm
 qCJq/kBlKsePKFw6+8+OFE3TAmOzgXRbKDmbhcuu0JiiUB+V8wMfxwYtHQaLP/veILVv
 3iWaBMyxxQ1TnIt+dBqfvDbul3Tmnk48yhClA9cuYXB9GEXou1uU4Uc6U8A3XP4WNsc+
 WkYtO3s9jZ7oMSi01wV8Y/GYkDcXMJrZXDU0FHH2klFcgNXKQDECAJambHjADx+MQ1ks
 88kbF9JWkQGHK+koms02/S+b27akuptWxivt28eRQu2NoJ9uF7D9pgxOKkDJleWbKSZ9
 4qbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1reTPibzqrGVFT+HaxpJOSIl23ImGuDdQsAq06ZO/Os=;
 b=Gm+KGaM19nyLThzNHewBGqbFvheblLuOGNxlhLjj2P/ikl7GavoeQfezvnBu4Tibqn
 9UuzeWFhQiHk/SwCajHQCPQQHGBGadKTIzMGwpx4Sa/xMXEpts7g52V/6Of7TABTFg5Q
 kzXHuQpXXZM/odfgyTmeYFgJ3eZoV+7ZfQ8rmrhzNOXbdGo3TGRGVRU0qWQvho2pgFye
 SjMxiEhB2TsvqeFYuA3NcBSNCkdwJkzm8+u2bsce2le+/+NcVEGp+yjF/1Q5VcAlC+5H
 LWvA9urQCPrOfsBZwj+jgK9XkpqH+Wh0MFGlceD29McdjAan0AeI+nV0cW9vjWrB2b0X
 xJCw==
X-Gm-Message-State: AOAM531i6VUxGONti1uzC+IsBLyMrJAsUVIB9UfCFljzWoJabK+dE62+
 iihzf9MWs/giC0eGxehPrKJTLyEAz6yRaw==
X-Google-Smtp-Source: ABdhPJyHZmEn6eYBVg4t6dkfp3oa8GKNP6QfNTV/r9jX0JOf60dAFWffxjiwkJV89hjkfCyiTheTqw==
X-Received: by 2002:adf:8b4e:: with SMTP id v14mr34526578wra.103.1617714796849; 
 Tue, 06 Apr 2021 06:13:16 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id 24sm2752663wmg.19.2021.04.06.06.13.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 06:13:16 -0700 (PDT)
Subject: Re: [PATCH v3 1/3] arm64: dts: mediatek: mt8167: add larb nodes
To: Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>
Cc: mkorpershoek@baylibre.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210406113631.2675029-1-fparent@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <d554d512-34c2-db46-990f-ac3b4fc18557@gmail.com>
Date: Tue, 6 Apr 2021 15:13:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210406113631.2675029-1-fparent@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_141322_343351_436AF20B 
X-CRM114-Status: GOOD (  16.61  )
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



On 06/04/2021 13:36, Fabien Parent wrote:
> Add larb nodes for MT8167:
> * larb0 is used for display (dsi and hdmi)
> * larb1 is used for camera (csi)
> * larb2 is used for the video hardware decoder
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Whole series applied to v5.12-next/dts64-2

Thanks!

> ---
> 
> Note: This series is based on https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/log/?h=v5.12-next/dts64-2
> 
> V3:
> 	* Removed unicode character in commit summary
> V2:
> 	* Removed unneeded mediatek,larb-id property
> 
>  arch/arm64/boot/dts/mediatek/mt8167.dtsi | 30 ++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
> index 4b951f81db9e..bbddd4b22d3e 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
> @@ -140,5 +140,35 @@ smi_common: smi@14017000 {
>  			clock-names = "apb", "smi";
>  			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
>  		};
> +
> +		larb0: larb@14016000 {
> +			compatible = "mediatek,mt8167-smi-larb";
> +			reg = <0 0x14016000 0 0x1000>;
> +			mediatek,smi = <&smi_common>;
> +			clocks = <&mmsys CLK_MM_SMI_LARB0>,
> +				 <&mmsys CLK_MM_SMI_LARB0>;
> +			clock-names = "apb", "smi";
> +			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
> +		};
> +
> +		larb1: larb@15001000 {
> +			compatible = "mediatek,mt8167-smi-larb";
> +			reg = <0 0x15001000 0 0x1000>;
> +			mediatek,smi = <&smi_common>;
> +			clocks = <&imgsys CLK_IMG_LARB1_SMI>,
> +				 <&imgsys CLK_IMG_LARB1_SMI>;
> +			clock-names = "apb", "smi";
> +			power-domains = <&spm MT8167_POWER_DOMAIN_ISP>;
> +		};
> +
> +		larb2: larb@16010000 {
> +			compatible = "mediatek,mt8167-smi-larb";
> +			reg = <0 0x16010000 0 0x1000>;
> +			mediatek,smi = <&smi_common>;
> +			clocks = <&vdecsys CLK_VDEC_CKEN>,
> +				 <&vdecsys CLK_VDEC_LARB1_CKEN>;
> +			clock-names = "apb", "smi";
> +			power-domains = <&spm MT8167_POWER_DOMAIN_VDEC>;
> +		};
>  	};
>  };
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
