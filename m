Return-Path: <SRS0=1nN3=KH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAF66C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 16:21:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0347361C96
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 16:21:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0347361C96
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QocurHXhAIsXxbvoO94YlZnTJCJgnnMQVDGThzGabGo=; b=Q2pfr5dWWwMc6y2s3YgDUlTku
	5qIJamK/1CYWQpm8lACspN9rctToFnwJ4yjJNDi0KWwA0OREp3XjNtFR9+QsUdAYY02qMUgkifnsZ
	DBa1oYEzlirkSOteG+BPZGoHodiJzCUXLi88RqZ1M9v6QuGLbFxjgZexj7+WvrGEfkUd9JIudVr41
	a5C8VRybFH6C5R/Znjq+2hP02AMXQyR4rnnMuPqsJ74LvIT2/JQOBP/vDp/2zLL2fmKIVQfufUlSw
	QaXAk5VouL6O922fLnXmX03GrFVaUKHymirCwbRIQmphz4QyDUCIH6a5XoQwobkGo69/kpkiLGeQN
	boIOugmAQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgrbU-003JEO-PY; Wed, 12 May 2021 16:20:56 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgrbT-003JE7-FI; Wed, 12 May 2021 16:20:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=g3cwY6Hzy6EqdwJaqVSzBqAF7NmFEme2hYX8gRSTBJ8=; b=GOrWpoSyapLccyI4em7K+BK5+N
 rlchwntkMO9PBp+ic4w3dpDoyq9G/5aKGoSCoKzbP/IpHcMA6YHNPGQY9tGicfgWcxKIGXssfdgEZ
 vxgN2HNBKGfE4OIuLLCgf65IoSDZqhwDGZWGz/rOr6saNUZvGYjBZOMevCRXWaO26WmyXamxNS7dT
 YdmmYShhvoYmFaApyECMSCtrto02JByE8TkkRIo7KFHak4HcGSEKL7YPWVEdBU9XaBeoRTpq30dtD
 PfYGLeRRfi02CZcOpjmT8KQ1jLUsuyMlglcP93jRCKpij5dZkt7XyA1ahN854Ide0+vEtxVHwgT2Q
 qHaQMl2g==;
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgrbQ-00AaPw-BB; Wed, 12 May 2021 16:20:53 +0000
Received: by mail-wr1-x430.google.com with SMTP id s8so24236712wrw.10;
 Wed, 12 May 2021 09:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=g3cwY6Hzy6EqdwJaqVSzBqAF7NmFEme2hYX8gRSTBJ8=;
 b=gC0znr5PRqA5wRxIgIiAmKgcHzgv0b4bKRjccuLX6Iwidd0KlUZ2dVEKJTX4BS6Qtn
 mI5KQGsRLvvomQg3r1/1EuhiaVFE3MPEuthJz3koNfy/MJItDQkBi/+PawpVMNsJwalC
 rPEk4mSaplt1hE0GFzt4Ku+/sK1bZF4w6A5yyLuqrz73ySV3uM6cB7yojp4KImi9JDhO
 iv6ajbxfjtSdxh87h+6h+9VE4LucPMWfTDDhDViS7Umn+ktC1mRacDEjrc+Helrg8dhj
 V7VWK8KnfqeqXjjL9lW3JSEt7a8kPfmPsJvV6dApGLFHwmMOqqW/Wgf8UQpvBroTgKLj
 6DFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g3cwY6Hzy6EqdwJaqVSzBqAF7NmFEme2hYX8gRSTBJ8=;
 b=QMTbWAfdWluMcVfq4m2izVsGBN3kZVTWzmkKB/8CvLjHhbrO3QKXDkz+1IU9ckBuXr
 bggAcBPt8zmYsz27jeIYXmMj1y/aze+/Uc1CM2iPDjTzvoS0gLQJvhynKN5s3K0Oh3tl
 lAfCERPGJptZ5J+ywvU/oSVr8FMtA5uXIzlZhXP8vM9IhagDvzwTE7OB+X9bf8qBJ9zo
 VlI8jdX+46NndTQ8F2eAtNj8B6FONwMlQqy7vqicn+L4nOL2lSTMPhQo5AR5h8E3VxpY
 6QyM52Rnbpu1SkH9i2gB878t8nekO+TChL4RvHYcHpPLDRhQA5G7ME1+CZoWz8qJvSHj
 WKQA==
X-Gm-Message-State: AOAM530D7XykPOen8FYNXufv/vXN2Stg9Vd0DxFbCI12ANSXG7NavqOD
 zgCPCfVcTJEpxKhvMux/vFqjRq49edxdbQ==
X-Google-Smtp-Source: ABdhPJwxmmhuNFN4Qj6xtMqbuk5mOqU/iFz28N2vLzffR4UhACjE+oiPI8EWzNhx1E44PPwQUX6Z7Q==
X-Received: by 2002:a5d:4a51:: with SMTP id v17mr42251239wrs.259.1620836449668; 
 Wed, 12 May 2021 09:20:49 -0700 (PDT)
Received: from ziggy.stardust ([37.223.140.37])
 by smtp.gmail.com with ESMTPSA id f7sm135279wmq.30.2021.05.12.09.20.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 09:20:49 -0700 (PDT)
Subject: Re: [PATCH v3 3/3] arm64: dts: mediatek: mt8167: add some DRM nodes
To: Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: mkorpershoek@baylibre.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210406113631.2675029-1-fparent@baylibre.com>
 <20210406113631.2675029-3-fparent@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <df4c57f9-115b-c4da-e656-e4bdec62c2d7@gmail.com>
Date: Wed, 12 May 2021 18:20:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210406113631.2675029-3-fparent@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_092052_421905_AC96A2D4 
X-CRM114-Status: GOOD (  19.28  )
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

Hi Fabien,

As you might remember this patch didn't hit mainline in the last merge window.
Actually there are some concerns about the driver architecture [1].

Apart from that small comment below.

[1]
https://lore.kernel.org/linux-mediatek/CAK8P3a2Qg-uz0kMXFMrvRjUv3NRvZXjTwS1P5MDvFk3feYaBzg@mail.gmail.com/

On 06/04/2021 13:36, Fabien Parent wrote:
> Add all the DRM nodes required to get DSI to work on MT8167 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
> Note: This series is based on https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/log/?h=v5.12-next/dts64-2
> 
> V3:
> 	* Removed unicode character in commit summary
> V2:
> 	* No changes
> 
>  arch/arm64/boot/dts/mediatek/mt8167.dtsi | 149 +++++++++++++++++++++++
>  1 file changed, 149 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
> index 9029051624a6..17942095944e 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
> @@ -16,6 +16,19 @@
>  / {
>  	compatible = "mediatek,mt8167";
>  
> +	aliases {
> +		aal0 = &aal;
> +		ccorr0 = &ccorr;
> +		color0 = &color;
> +		dither0 = &dither;
> +		dsi0 = &dsi;
> +		ovl0 = &ovl0;
> +		pwm0 = &disp_pwm;
> +		rdma0 = &rdma0;
> +		rdma1 = &rdma1;
> +		wdma0 = &wdma;
> +	};
> +
>  	soc {
>  		topckgen: topckgen@10000000 {
>  			compatible = "mediatek,mt8167-topckgen", "syscon";
> @@ -114,6 +127,13 @@ vdecsys: syscon@16000000 {
>  			#clock-cells = <1>;
>  		};
>  
> +		mutex: mutex@14015000 {
> +			compatible = "mediatek,mt8167-disp-mutex";
> +			reg = <0 0x14015000 0 0x1000>;
> +			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
> +		};
> +
>  		pio: pinctrl@1000b000 {
>  			compatible = "mediatek,mt8167-pinctrl";
>  			reg = <0 0x1000b000 0 0x1000>;
> @@ -126,6 +146,135 @@ pio: pinctrl@1000b000 {
>  			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  
> +		rdma1: rdma1@1400a000 {
> +			compatible = "mediatek,mt8167-disp-rdma",
> +				     "mediatek,mt2701-disp-rdma";
> +			reg = <0 0x1400a000 0 0x1000>;
> +			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
> +			clocks = <&mmsys CLK_MM_DISP_RDMA1>;
> +			iommus = <&iommu M4U_PORT_DISP_RDMA1>;
> +			mediatek,larb = <&larb0>;
> +		};
> +
> +		disp_pwm: disp_pwm@1100f000 {
> +			compatible = "mediatek,mt8167-disp-pwm",
> +				     "mediatek,mt8173-disp-pwn";

Should be "mediatek,mt8173-disp-pwm" right?
I'll un-stage this patch but keep the rest for v5.14. Please re-submit once the
driver binding is clarified.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
