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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0803CC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 22:36:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A83E2617C9
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 22:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A83E2617C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ho7nSOrd5EXNjo8v1Smnt3NdUIdc+B7ZyGs5wLsp4+g=; b=TEezq+cwj0QT3vaunlQF0uzIo
	dkCiW6l+cj6wNyzPC6FSuj6bjpGQw/3qOPBD2MiUHa+ciaj62YjXpoKY1074sngPEduk9NBeVrhIF
	go2+jhM5DkGn2mLWz0hTcGo+kBA/AiUYdgtYBHf5N3qJc0rUjUCbgNlukY9CZqehVUqPKktudE4G7
	r2ulDDLfgHLTTRUG5UuyL07s25htJfpzfxPctVzQvEdQ6c5jlbjVkxHRbyUCgqj7Lbp9nuVrQhNGN
	uvl8u4VwbvKzBYD4oezHdOkjuLyS9xNUYLW+kWIxxKRIAlcHVqBB5FzkAJEPFtZIQKXDS+IiJgClV
	izOfmk31g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR0UP-001hRo-Qc; Mon, 29 Mar 2021 22:36:06 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQsEO-000gpG-76; Mon, 29 Mar 2021 13:47:01 +0000
Received: by mail-wr1-x42f.google.com with SMTP id j7so12965072wrd.1;
 Mon, 29 Mar 2021 06:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LQo2IHbDrnsvLwx9E49b4vmdluvz5ztdZ0USfGdznpw=;
 b=hUH2tcrxar9RPvmx9tqIwFhRkLd9FYx4Q2uANYKC+xvb26EemiLSzxn08kH+GUKWcW
 9vyl3yVm8rAF2icwMClFF7/tHncCDp/MuSNXAdM0kHJYtO+AhrSSNJpmVYM6RlRuJr2a
 O7N4EqXkwFkLn8taYWfkLSRKBy/vS/v1DnlqULZJxrPr+8kKRQV6QeO4pf5Dm6DgEYuQ
 PZiTIX8+DB9xHxPFiUoTRmmcIWNIFqMiehQhVIyteOOUJs9/Xp2eKMiiEZP5D3b4DS/b
 JBEjIgzi0SXwDYua7diw0IGCh2zJ51u5gfb50O3+AcH49U2qgO1Lk5zpgp8yRsINOQBV
 L7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LQo2IHbDrnsvLwx9E49b4vmdluvz5ztdZ0USfGdznpw=;
 b=HQZ9JLjNgWbpL0JzTBRf0KGro8tGsdb7vZrAW4AktRs9HEtoPBugJ2/zyJZ5ebY/F1
 EwsRw1KsiYAtYyPfbiUtAOmoEbzGR8sF2cQiMzFlCSEriJcKFUknafesnb+gKR8LHll3
 41v+uVgCP/g5bZ0grXq0ih024+4avajy40ejjAMBVuilqYREbawiLXUwzKg8k9MblO7Y
 k4F5pXg0JjwXk+dFewv/uWjgEy3Vx1E6NKLXU3yykSnqMGvU4pDonrFvqTSwLTHIMUbs
 v0c/PVAONToj/fUKbhIz0VjL8+rQG/N2wxgx3chEF5FzZRpsywO75FdqTez/mVGVDlf+
 UrkQ==
X-Gm-Message-State: AOAM5330TFXm+QN3igPAoCGbhAzywIV++cvc/Z7FsIguHIqq7OKEhn2o
 97+D1UBDaFqDVbBCl1XjscN6Fyf5QYDnKA==
X-Google-Smtp-Source: ABdhPJysDSrMY/1qPw5vBQij0RgaU13OWCnbwhhrcG2Ij3e9ZtM+LI2TTKmj3RKJAuKWx8X8klEhaA==
X-Received: by 2002:a5d:6542:: with SMTP id z2mr17102271wrv.205.1617025619676; 
 Mon, 29 Mar 2021 06:46:59 -0700 (PDT)
Received: from ziggy.stardust (80.174.240.175.dyn.user.ono.com.
 [80.174.240.175])
 by smtp.gmail.com with ESMTPSA id b12sm31428854wrf.39.2021.03.29.06.46.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 06:46:59 -0700 (PDT)
Subject: Re: [PATCH v5 08/13] arm64: dts: mediatek: mt8516: harmonize node
 names and compatibles
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
 <20210316092232.9806-8-chunfeng.yun@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <ff4ab27b-5a76-0597-780c-7b101e1b0963@gmail.com>
Date: Mon, 29 Mar 2021 15:46:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210316092232.9806-8-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_144700_403397_D1A9ADBC 
X-CRM114-Status: GOOD (  17.69  )
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
> This is used to fix dtbs_check warning:
>   harmonize node names and compatibles;
>   add property "usb-role-switch" for connector dependence.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Applied now to v5.12-next/dts64

> ---
> v2~v5: no changes
> ---
>  arch/arm64/boot/dts/mediatek/mt8516.dtsi         | 9 +++++----
>  arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi | 1 +
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
> index b80e95574bef..bbe5a1419eff 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
> @@ -480,7 +480,7 @@
>  		};
>  
>  		usb0: usb@11100000 {
> -			compatible = "mediatek,mtk-musb";
> +			compatible = "mediatek,mt8516-musb", "mediatek,mtk-musb";
>  			reg = <0 0x11100000 0 0x1000>;
>  			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_LOW>;
>  			interrupt-names = "mc";
> @@ -493,7 +493,7 @@
>  		};
>  
>  		usb1: usb@11190000 {
> -			compatible = "mediatek,mtk-musb";
> +			compatible = "mediatek,mt8516-musb", "mediatek,mtk-musb";
>  			reg = <0 0x11190000 0 0x1000>;
>  			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_LOW>;
>  			interrupt-names = "mc";
> @@ -506,8 +506,9 @@
>  			status = "disabled";
>  		};
>  
> -		usb_phy: usb@11110000 {
> -			compatible = "mediatek,generic-tphy-v1";
> +		usb_phy: t-phy@11110000 {
> +			compatible = "mediatek,mt8516-tphy",
> +				     "mediatek,generic-tphy-v1";
>  			reg = <0 0x11110000 0 0x800>;
>  			#address-cells = <2>;
>  			#size-cells = <2>;
> diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
> index 63fd70086bb8..7d738f01cf8d 100644
> --- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
> @@ -188,6 +188,7 @@
>  &usb0 {
>  	status = "okay";
>  	dr_mode = "peripheral";
> +	usb-role-switch;
>  
>  	usb_con: connector {
>  		compatible = "usb-c-connector";
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
