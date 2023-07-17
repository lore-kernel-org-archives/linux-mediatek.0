Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD4DC001B0
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 05:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GCWvgKUXfcW1CPS5sL1xeCdhcIZJ7olcj1eoB35DPKY=; b=o77aJxJqU2LpSrwWEuuS8FQlsZ
	V0FUY5oyOivPfAiKLZ9X3BT2SC/EerMwCfjzY0Vwn9KWmFUj2nhBH7gXNQ6Q6Ea42EDVmRh0+VIGH
	EYkjEOGYcnlEEXW0cC4XWVk/Nrr+6/o1QBof14nUJsQUuZ0MKzx+8iRVB/F3Pmv2XGAkH0F/GipIa
	P00xv2qO/ZV2rNZEXrCF04wp6VR01da7lCcREoZTXX4jn0FvbI0XZwwxrWyO2CYIP8eq0l85eMyLJ
	7t/oHr7X6i3m59i0OH2LHt51h6T+//99xB0idWSyOSBnSDVLOFnndMlSD4pC1gfUr1oTAxBgyVIit
	aOVZUgVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzkc-005Jbs-2S;
	Wed, 19 Jul 2023 05:29:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzkb-005JbJ-07
	for linux-mediatek@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:29:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=GCWvgKUXfcW1CPS5sL1xeCdhcIZJ7olcj1eoB35DPKY=; b=CR0cEZZh73JBiZ+tsnQAR/2g2P
	xxpgeNrmkplL7pdKo77KoWtatuwTuO8+SNPaXFeg48DCqVKhlt/Kgg8YexqdJ13efWQOMHA1dALzH
	Rz3XCGWEyZHznw+yuJL4L8MmhhRRJdmAerHHS7QNQd2AJ68pM7eln2yyhNQTJZIQWN4M4Dre+FZwg
	QqXZfQTUy1cgO03l2xfJMaDzRtPFVnCeGIfa0d+dvFaqu3Zr6aQ3i8y4/UKgRPJMglLJlEjd/UTYy
	5FUeLoR9oJblWhoLKtEUYEmed+8n5W5fNT+3pGBcjb5VA+nAJh6lhLbzKnzBCDXqnxYJIHYMGsIKP
	Mfa5G5LA==;
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLUO9-009HiW-2u
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Jul 2023 20:00:12 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-992b2249d82so699145366b.1
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Jul 2023 13:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689623888; x=1692215888;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GCWvgKUXfcW1CPS5sL1xeCdhcIZJ7olcj1eoB35DPKY=;
        b=FYiL78JQFAZQkZuMCP3Kkz2pXDfnIy2mkoW84p24YFfPCUYfyCa1OBXQXkps4rvxc0
         VVG8IbaU0LhSDVy7/6+1MaAWpftz2fjvsomf+J0PsaBBMXm6wXC2bphsw6ScSzh++TAq
         udgfArxo5zxNGgenWAZ9xms56ILBGMh25jhzYeaFYzuIEU62KlRSzh4xi3EfNGunnbCc
         6wcJ2g6LLLlJLc9gZMZlKrlxhuVOsPJ5rLjCH7UPRObW1FZKFcg1ilBr/2lIpxNIypcM
         wIsQuuPd8I+MHkU9nVqhjM1sayMZ8VHR93pQ46XXVYN81n33+o7FNZarAgcgxRzSGl+g
         mFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689623888; x=1692215888;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GCWvgKUXfcW1CPS5sL1xeCdhcIZJ7olcj1eoB35DPKY=;
        b=Aq2daPp7ICo9Cux+auRta8sqQVSC+pTo+g8UxlpDPcee+YP6xZs7o4KQsEijH0sICV
         JcpmM/R/N9QozERh/JAj+NzzUnBgvnyjU3G0dq9LiWZkV7PWm6762clJjzBf+9HlKGVL
         1QnXgcQe47D+Fvy0oQV5Y5gzhpnQHPR3j/wW/xYr4hFFDlfLvwcDBmXGsfHFGoeF2F8g
         u8D94zYgoCbzzEdkn/9ZQYVKk36i/vH2+5pDpJ+9c0NzjgQZxLNge+Wq3t+Bx9Gdb1b6
         pn7eSGQpT5QlQY6cvIdbFgPcxfu5hF81Z7OdlrfhH1o5i31Qb3vNrkOVJNPK7DWGjleD
         ae2w==
X-Gm-Message-State: ABy/qLbeyL9dEIoKuHDv3Ebv4s0igGGTilY133MKiyllzyRo/cYQhhZ5
	tpPoZt6QCpwQLUQo1sq3NVVWLg==
X-Google-Smtp-Source: APBJJlGPH/4WX3gvMsX76UHYK0bLVpi5LnmMFLDa/91Ewd2MMtPkpY4SnQrrAXgEujst5NHSR/yweg==
X-Received: by 2002:a17:907:7709:b0:94f:3521:394 with SMTP id kw9-20020a170907770900b0094f35210394mr10161706ejc.51.1689623888534;
        Mon, 17 Jul 2023 12:58:08 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id h10-20020a170906828a00b0094e7d196aa4sm82784ejx.160.2023.07.17.12.58.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 12:58:08 -0700 (PDT)
Message-ID: <43ecf0b0-4b55-ab11-3b80-b9243b971c2c@linaro.org>
Date: Mon, 17 Jul 2023 21:58:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 4/4] arm64: dts: Add MediaTek MT8188 dts and evaluation
 board and Makefile
Content-Language: en-US
To: Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?=
 <nfraprado@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230717120300.21388-1-jason-ch.chen@mediatek.com>
 <20230717120300.21388-5-jason-ch.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230717120300.21388-5-jason-ch.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_210010_454982_9552F222 
X-CRM114-Status: GOOD (  18.65  )
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

On 17/07/2023 14:03, Jason-ch Chen wrote:
> From: jason-ch chen <Jason-ch.Chen@mediatek.com>
> 
> MT8188 is a SoC based on 64bit ARMv8 architecture. It contains 6 CA55
> and 2 CA78 cores. MT8188 share many HW IP with MT65xx series.
> 
> We add basic chip support for MediaTek MT8188 on evaluation board.
> 
> Signed-off-by: jason-ch chen <Jason-ch.Chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/Makefile       |   1 +
>  arch/arm64/boot/dts/mediatek/mt8188-evb.dts | 401 +++++++++
>  arch/arm64/boot/dts/mediatek/mt8188.dtsi    | 951 ++++++++++++++++++++
>  3 files changed, 1353 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-evb.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188.dtsi
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index c99c3372a4b5..9bd2324259a3 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -44,6 +44,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku0.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku176.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-pumpkin.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-evb.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-evb.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-asurada-hayato-r1.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-asurada-spherion-r0.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-evb.dtb
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188-evb.dts b/arch/arm64/boot/dts/mediatek/mt8188-evb.dts
> new file mode 100644
> index 000000000000..d8906172390e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8188-evb.dts
> @@ -0,0 +1,401 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2023 MediaTek Inc.
> + */
> +/dts-v1/;
> +#include "mt8188.dtsi"
> +#include "mt6359.dtsi"
> +
> +/ {
> +	model = "MediaTek MT8188 evaluation board";
> +	compatible = "mediatek,mt8188-evb", "mediatek,mt8188";
> +
> +	aliases {
> +		serial0 = &uart0;
> +		i2c0 = &i2c0;
> +		i2c1 = &i2c1;
> +		i2c2 = &i2c2;
> +		i2c3 = &i2c3;
> +		i2c4 = &i2c4;
> +		i2c5 = &i2c5;
> +		i2c6 = &i2c6;
> +		mmc0 = &mmc0;
> +	};
> +
> +	chosen: chosen {
> +		stdout-path = "serial0:115200n8";
> +		kaslr-seed = <0 0>;

It does not look like you tested the DTS against bindings. Please run
`make dtbs_check` (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).

> +	};
> +
> +	memory@40000000 {
> +		device_type = "memory";
> +		reg = <0 0x40000000 0 0x80000000>;
> +	};
> +
> +	reserved_memory: reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		scp_mem_reserved: scp_mem_region {

No underscores in node names.

> +			compatible = "shared-dma-pool";
> +			reg = <0 0x50000000 0 0x2900000>;
> +			no-map;
> +		};
> +	};


Best regards,
Krzysztof


