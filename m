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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3343DC433C1
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 22:39:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9DC26191B
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 22:39:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9DC26191B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vIhV8eirYc2EHQz1iD1p5MTPE12v9dj7Y+ZARAM9hAo=; b=U6viToYw1ljolD3WsaTiKhIC/
	mnfUq3nvY2UqxgrLrxsIm2yc7VhnOCwN/BMRRm1V19JrGXsD2SId+nMgi9CYVErK/LuauhWI4O+po
	HrL/8mGwXR3lR84V/axEv2rW9iHQaTOUdOuFncfsJtmaWPs6gL7qWlRtAr1g5um0WHn+awl0Wvp+q
	2z7c1CLJFysnNSV5+Hqs14qrwjuEEu3v2vsk/vgftqBKuetTViZdFrMAMKIAju6CyS2JUDTjuDahG
	vmgDeEsRdnDBJLNMBMuSTR3I9nwat8fdEj1nT/gaYwyyrU8Eikxymm2NX39rmCxlmcWlobVRNdkqx
	GeWWFO8Hg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR0XM-001iyI-B3; Mon, 29 Mar 2021 22:39:08 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQsEx-000gs2-Pr; Mon, 29 Mar 2021 13:47:37 +0000
Received: by mail-wr1-x432.google.com with SMTP id j9so11211724wrx.12;
 Mon, 29 Mar 2021 06:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=W351MbtZPqv7qJ77tVXfGqMA3tn9hsjpLQoPGH58vV8=;
 b=kv9ZybA80zOhmjIBaoGreSnFdPukXvit1IprLD7Pj8qvKyCG8ihu/NxhFgwvitOqHi
 dq5d8RnhSkjLBM6wEqSPE+4KSOApPXXvgleqU5k69B9rqOa+b/ZBstCyRoYLN7ZS4/OU
 cFUedqJrQK+OlhQE9E6P2IE2AxlqGOtmiKbHKwSX7tPBvSz9t1wSloGR2LFkvzu34gIP
 X8GhRbpV4w2bRsfwXl7OYzwDP0GSSVLZBrXJ0e+1b7GswWv9eGPWvPQyC5dLilbfPse1
 DUYCohPbFZHsJUb82fcaosrC7kGPWquSYV+otG/sqeaRAYLMW42ngT6QMoDepk5K5PKL
 rDNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W351MbtZPqv7qJ77tVXfGqMA3tn9hsjpLQoPGH58vV8=;
 b=IAEQiah4DZbRQkfzgQacvQ/FNjrXUlgoChfxxW6GvGgVV+urDlagNCNcg31WgPvx+m
 9EX4/SBaIg23hQKQpMVsGEtTOoDx+gxQtrfqQgQdk5g7GxwyVT+7MUsB0iE4mOAEZslr
 6kN06d5UOB1fwTyJUNxp6hkj/pJdt9i1UO0362bDbN82aiNpeHKDR+hpmHXmkgzZBeEp
 MPE88PwenxfrHYccfQzWvS7caZwiP0HwfQYR2oFZ0EgtyGl7qkdiF36325/HwiC+6EFR
 sGbViq7vw97WByV+nKM1u2GNfqb7XZct2WoyZ1VS+CxbYx4WUISunVixPrO62QHRpXX/
 4Wig==
X-Gm-Message-State: AOAM5308JHiQSjLrerNsIBVAJE45l58X3NUzt/21yVSiJ5rZeFWZhNpj
 8gsb3E7melYmBJazJWMD8SEX3wmnjxHkbg==
X-Google-Smtp-Source: ABdhPJxXGO9R/wMWd+TlB3G9feBlnxdBno7a47GaOgQqdLwM1OVa5hsBBhlZM+crSXpVxfzoxa6z2w==
X-Received: by 2002:adf:c10a:: with SMTP id r10mr29868077wre.40.1617025655240; 
 Mon, 29 Mar 2021 06:47:35 -0700 (PDT)
Received: from ziggy.stardust (80.174.240.175.dyn.user.ono.com.
 [80.174.240.175])
 by smtp.gmail.com with ESMTPSA id x25sm28790150wmj.14.2021.03.29.06.47.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 06:47:34 -0700 (PDT)
Subject: Re: [PATCH v5 12/13] arm: dts: mt7623: harmonize node names and
 compatibles
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jie Qiu <jie.qiu@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Cawa Cheng <cawa.cheng@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20210316092232.9806-1-chunfeng.yun@mediatek.com>
 <20210316092232.9806-12-chunfeng.yun@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <a262f3aa-4a79-da90-81e4-6a3b2a9c7828@gmail.com>
Date: Mon, 29 Mar 2021 15:47:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210316092232.9806-12-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_144735_935584_BF11B66F 
X-CRM114-Status: GOOD (  16.37  )
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



On 16/03/2021 10:22, Chunfeng Yun wrote:
> This is used to fix dtbs_check warning
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Applied now to v5.12-next/dts32

> ---
> v2~v5: no changes
> ---
>  arch/arm/boot/dts/mt7623.dtsi  | 26 ++++++++++++++------------
>  arch/arm/boot/dts/mt7623n.dtsi |  4 ++--
>  2 files changed, 16 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
> index aea6809500d7..3c11f7cfcc40 100644
> --- a/arch/arm/boot/dts/mt7623.dtsi
> +++ b/arch/arm/boot/dts/mt7623.dtsi
> @@ -787,8 +787,9 @@
>  		};
>  	};
>  
> -	pcie0_phy: pcie-phy@1a149000 {
> -		compatible = "mediatek,generic-tphy-v1";
> +	pcie0_phy: t-phy@1a149000 {
> +		compatible = "mediatek,mt7623-tphy",
> +			     "mediatek,generic-tphy-v1";
>  		reg = <0 0x1a149000 0 0x0700>;
>  		#address-cells = <2>;
>  		#size-cells = <2>;
> @@ -804,8 +805,9 @@
>  		};
>  	};
>  
> -	pcie1_phy: pcie-phy@1a14a000 {
> -		compatible = "mediatek,generic-tphy-v1";
> +	pcie1_phy: t-phy@1a14a000 {
> +		compatible = "mediatek,mt7623-tphy",
> +			     "mediatek,generic-tphy-v1";
>  		reg = <0 0x1a14a000 0 0x0700>;
>  		#address-cells = <2>;
>  		#size-cells = <2>;
> @@ -823,7 +825,7 @@
>  
>  	usb1: usb@1a1c0000 {
>  		compatible = "mediatek,mt7623-xhci",
> -			     "mediatek,mt8173-xhci";
> +			     "mediatek,mtk-xhci";
>  		reg = <0 0x1a1c0000 0 0x1000>,
>  		      <0 0x1a1c4700 0 0x0100>;
>  		reg-names = "mac", "ippc";
> @@ -836,9 +838,9 @@
>  		status = "disabled";
>  	};
>  
> -	u3phy1: usb-phy@1a1c4000 {
> -		compatible = "mediatek,mt7623-u3phy",
> -			     "mediatek,mt2701-u3phy";
> +	u3phy1: t-phy@1a1c4000 {
> +		compatible = "mediatek,mt7623-tphy",
> +			     "mediatek,generic-tphy-v1";
>  		reg = <0 0x1a1c4000 0 0x0700>;
>  		#address-cells = <2>;
>  		#size-cells = <2>;
> @@ -864,7 +866,7 @@
>  
>  	usb2: usb@1a240000 {
>  		compatible = "mediatek,mt7623-xhci",
> -			     "mediatek,mt8173-xhci";
> +			     "mediatek,mtk-xhci";
>  		reg = <0 0x1a240000 0 0x1000>,
>  		      <0 0x1a244700 0 0x0100>;
>  		reg-names = "mac", "ippc";
> @@ -877,9 +879,9 @@
>  		status = "disabled";
>  	};
>  
> -	u3phy2: usb-phy@1a244000 {
> -		compatible = "mediatek,mt7623-u3phy",
> -			     "mediatek,mt2701-u3phy";
> +	u3phy2: t-phy@1a244000 {
> +		compatible = "mediatek,mt7623-tphy",
> +			     "mediatek,generic-tphy-v1";
>  		reg = <0 0x1a244000 0 0x0700>;
>  		#address-cells = <2>;
>  		#size-cells = <2>;
> diff --git a/arch/arm/boot/dts/mt7623n.dtsi b/arch/arm/boot/dts/mt7623n.dtsi
> index 1880ac9e32cf..bcb0846e29fd 100644
> --- a/arch/arm/boot/dts/mt7623n.dtsi
> +++ b/arch/arm/boot/dts/mt7623n.dtsi
> @@ -246,7 +246,7 @@
>  		status = "disabled";
>  	};
>  
> -	mipi_tx0: mipi-dphy@10010000 {
> +	mipi_tx0: dsi-phy@10010000 {
>  		compatible = "mediatek,mt7623-mipi-tx",
>  			     "mediatek,mt2701-mipi-tx";
>  		reg = <0 0x10010000 0 0x90>;
> @@ -265,7 +265,7 @@
>  		status = "disabled";
>  	};
>  
> -	hdmi_phy: phy@10209100 {
> +	hdmi_phy: hdmi-phy@10209100 {
>  		compatible = "mediatek,mt7623-hdmi-phy",
>  			     "mediatek,mt2701-hdmi-phy";
>  		reg = <0 0x10209100 0 0x24>;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
