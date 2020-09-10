Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EADA2C433E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 10:52:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82B9C20BED
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 10:52:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jzi1SBIW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hc08PSXf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82B9C20BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=emyJkrpc6jDID7Yfp4lKIAQbsJH9pBVoWssG1J8h5Es=; b=jzi1SBIWauXPeUOgqN7U5rbp3
	a3pGUlLVSNfdP53mfv5/PElnLik/FM9wlynJ7/hQG3J5MG6M5h0dv1LDrfcYksFU3P+LnsZzKCIXt
	r0KY5p3OQaoBCEBazM9L49CmZTcRqZ/Xqm0ELeHlDd9j8qOiKnm3OUWNSQEVAVNzASdEq2RDu6jE6
	mHCJazlJC2cpWHxT2Az8BNIUNt1drtPLx4aCHd/swPtx2ZLeR54CK6BsFdnYcQbulGMyQJW1b7fAB
	CCyU1QzLdGdrjhYnLR4GuAyVvH6vvoOgslMtyd3D5ZSzhBRED62OW06deOZl0GdRHmIMnMXlxNjag
	d7jYKAntg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGKC0-00079R-6f; Thu, 10 Sep 2020 10:52:40 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGKBy-00078c-HC; Thu, 10 Sep 2020 10:52:39 +0000
Received: by mail-wm1-x342.google.com with SMTP id a65so5149605wme.5;
 Thu, 10 Sep 2020 03:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xqxwM/Mvfa18vvLY/SDCcgMXW/SBJ2dGdITvWLFzj1E=;
 b=hc08PSXfEdHk3COElKF3/mNchbHltsWM1NVW016Nef7xJ/Bu/gVPH54E6MsFKRgL3h
 GKHbCyPIpoZqCeDsQzs5wMDpvQDI4pRY07pPOost7/lMarWSz+k7apLCCdPhDXN1RkGX
 czsCIFE4B+dW3XXOyBCy1/5/CJac4LLyQjD+peyjlO+cxyRxlYewCTGAS/2oowKqjh+a
 byRfHewsPXge4IFC+gMrI5ax1hyBFY/5rMBmMfc9KvD2qSyIhqwZ+7hHhk8JqCw3zSbb
 xMC6QkmkvtdhzCMh6TIDMpAxtn4kCukPD5PHdN5pzWbgnAvGJnS8DqtTqscJYfyyVqZH
 i3Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xqxwM/Mvfa18vvLY/SDCcgMXW/SBJ2dGdITvWLFzj1E=;
 b=fIj+lBNzDjXbv8X4OZV1AIQ9LxYyMk3N2QVAiIo0cJsIQ6iLNlz/KVLiP7dKtcibrj
 zO4fl5sX6ZXn5IVkqFsICWKB0p758dZxfbol7BS3T1EoEXjY3MVX4jXC2x/zGYbnfFEe
 ozelMNeMHkZHkZOuzWStS4WHPasCgwXac/CsOFusIbhby82uWGBqD5H0o4E82cx++zu+
 SqMCEQP80lngjUHTZ5U6eV+8lH5YQiuREfjNWQuSXLrBiQNc0mIXC4asPI/GpwHYzmdn
 NIO6c1hdPHxgRZV5hAZxDyltWChyb9lA0aPO7haHiBkWUyPW5epIxkEkGf421Khh9oWy
 4b6g==
X-Gm-Message-State: AOAM530YFaU44OckEAhvmXHAO/XdgjP2SgFL9+DmjGumtgD/pz2iYMO+
 lo/q/sH3CkAiB6wqfgJ0ISgTjc2muw0=
X-Google-Smtp-Source: ABdhPJwk1Wpe3AlLx/+HN1qYohBdzkjzG9xzrHBAw7o7z5BWCvFB04lhR2xSpqcNQYSX+4AgqzKdNg==
X-Received: by 2002:a1c:cc0d:: with SMTP id h13mr7614433wmb.44.1599735157246; 
 Thu, 10 Sep 2020 03:52:37 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id a74sm3129769wme.11.2020.09.10.03.52.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2020 03:52:36 -0700 (PDT)
Subject: Re: [PATCH v2] arm64: dts: mt8183-kukui: add scp node
To: Pi-Hsun Shih <pihsun@chromium.org>
References: <20200909081422.2412795-1-pihsun@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <161d403a-2a3a-3365-1bb2-5067e8fb7cb8@gmail.com>
Date: Thu, 10 Sep 2020 12:52:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200909081422.2412795-1-pihsun@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_065238_587904_6CB3F9FB 
X-CRM114-Status: GOOD (  18.51  )
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

Applied to v5.9-next/dts64

I squashed this fix with the first patch to maintain bisectability.

Thanks!

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
