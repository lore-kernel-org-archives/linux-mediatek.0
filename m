Return-Path: <SRS0=tzuU=55=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36E7EC2BA19
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Apr 2020 16:57:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0973720739
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Apr 2020 16:57:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tSwgE99b";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qrQL6k8m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0973720739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pxiQRG2dmc06HlM+WifzwD9YTJbgYmn/0vN9KZpyp5U=; b=tSwgE99bLA55Ke
	9q7yP4332UJrtQFrLWp62uckhsAAVmK09vU2TDGiYPG5UxPu6YcwyQpI1ejys5X5gJ44MWZaLRWrA
	sguohVbxIPKZYPgoTTyKSDvG0a/olr4qXXWuNR0/ehhhvPD7r8IA48gVirYWRaUhufhCjX8PX5dFS
	wgrMfrQ0knQxXPR2bxFGE6atHQwKy/AbgI11n88eVcy6rGNqUaXTVkaFLA7CxBuyq9Wh3A9WL7P5v
	MoW00poSVcN8Iu9N1+oEbSacTCMyrLAI4HOYTFePFnO0K1yvt8GKZzBI39938XMIJDdOorWoDolWq
	H2I2pchq6PXXUilg+0VA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jO2Or-0004t5-IX; Mon, 13 Apr 2020 16:57:33 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jO2Ob-0004eW-Lr; Mon, 13 Apr 2020 16:57:19 +0000
Received: by mail-wm1-x342.google.com with SMTP id r26so10687568wmh.0;
 Mon, 13 Apr 2020 09:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mTpx6Z0OKTLIJPkJ7Yh8VEwdZmjdLhJUA6nbN5ppiEE=;
 b=qrQL6k8mIe333DRTkKehUyZNRhe3bactg8WMTrWAfRvbP9QXHYBQF1uyMNdWpG+bVV
 ZR5Bs42ZB6+oSnMcb7XSrmTQpKGnGE1dpZWnCdHUSs1NBLf5ndfJ+ohDrH2lfsAamHnY
 fO3ZiFKvnxsLB7k1GpL5jaNOSi/J5g8pdwgUke0/5hoRF26lhNlTiMzOxQAY5he8iSKJ
 dIn7wC1nBq66L3GRt9gjXr0/9kUopyHeWuvItyJV4zlpgXPIG6Vk3+7yRepRxyNti6K+
 Z+uYLO94LvBbLYfgU/H9GJHsxuVZA/W1MkxTelwZalDFsCe9N6SouzjA98nGAPPsJGnC
 2EbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mTpx6Z0OKTLIJPkJ7Yh8VEwdZmjdLhJUA6nbN5ppiEE=;
 b=gunE2MszcxdIGcFEvuKDJjvBzmBm+5lYPhm9X0hGnPfOSxMMyFCK1YVKyThew/bG5d
 8RFJO2oXK72caImdXkzVltNKO27tyyJqeq2HvETSGF8sLdujQ8xxGpDqqINjqJ/dt+Hd
 /nlam9iZllWOqm1kkZJCMqzZlCIenEk938L+oz0b59XdudmwtE100yJjdSawybrTJznN
 aFqri1iimHiHm/sJaP+z4RzLbHFSzBptCtxe7VgVozuIM+jZDqUMzjJFBy4MBYoXO2A2
 DLoyft3i0Lhz0bYritkqHU292lyJq0QSOlBrxPJ2H2CG1wIaABDqx5X6XWT5Wsh5zCTG
 y4QQ==
X-Gm-Message-State: AGi0PuY1N8n9PSmZCCODBjseKcbnERZyOxP/Hrt+ZGF1O8VISO4Ou+TD
 KR64snOohrOynmVhVCjcsag=
X-Google-Smtp-Source: APiQypLcKYqiy17tJMR9wM00PZxGuCAJar8Ngo68RhBhAo1IY9kUsqEObXdIXuwbnnwkQCLa37T8aw==
X-Received: by 2002:a1c:ba09:: with SMTP id k9mr19020911wmf.176.1586797036339; 
 Mon, 13 Apr 2020 09:57:16 -0700 (PDT)
Received: from linux-gy6r.site ([213.195.113.243])
 by smtp.gmail.com with ESMTPSA id g186sm16227344wmg.36.2020.04.13.09.57.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Apr 2020 09:57:15 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: mt8183: adjust cpuidle target residency
To: Ikjoon Jang <ikjn@chromium.org>, linux-mediatek@lists.infradead.org,
 James Liao <jamesjj.liao@mediatek.com>
References: <20200225080752.200952-1-ikjn@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
X-Pep-Version: 2.0
Message-ID: <e8c4314a-466e-8ba4-d5ea-d50eab7a709b@gmail.com>
Date: Mon, 13 Apr 2020 18:57:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200225080752.200952-1-ikjn@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200413_095717_744194_F5360E4D 
X-CRM114-Status: GOOD (  14.94  )
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
Cc: devicetree@vger.kernel.org, drinkcat@chromium.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 hsinyi@chromium.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 2/25/20 9:07 AM, Ikjoon Jang wrote:
> Split a cluster level cpuidle state into two, so mt8183 variant
> boards can adjust parameters for each cluster, and reduce cluster0's
> default target residency to 1000us as power measurements showed that
> its minimum residency is slightly less than cluster1's 1300us.
> 
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>

Applied to v5.7-next/dts64

Thanks!

> ---
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 26 ++++++++++++++++--------
>  1 file changed, 17 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index f1381e77918b..5c7dd262eaf3 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -74,7 +74,7 @@ cpu0: cpu@0 {
>  			reg = <0x000>;
>  			enable-method = "psci";
>  			capacity-dmips-mhz = <741>;
> -			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
> +			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP0>;
>  		};
>  
>  		cpu1: cpu@1 {
> @@ -83,7 +83,7 @@ cpu1: cpu@1 {
>  			reg = <0x001>;
>  			enable-method = "psci";
>  			capacity-dmips-mhz = <741>;
> -			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
> +			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP0>;
>  		};
>  
>  		cpu2: cpu@2 {
> @@ -92,7 +92,7 @@ cpu2: cpu@2 {
>  			reg = <0x002>;
>  			enable-method = "psci";
>  			capacity-dmips-mhz = <741>;
> -			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
> +			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP0>;
>  		};
>  
>  		cpu3: cpu@3 {
> @@ -101,7 +101,7 @@ cpu3: cpu@3 {
>  			reg = <0x003>;
>  			enable-method = "psci";
>  			capacity-dmips-mhz = <741>;
> -			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
> +			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP0>;
>  		};
>  
>  		cpu4: cpu@100 {
> @@ -110,7 +110,7 @@ cpu4: cpu@100 {
>  			reg = <0x100>;
>  			enable-method = "psci";
>  			capacity-dmips-mhz = <1024>;
> -			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
> +			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP1>;
>  		};
>  
>  		cpu5: cpu@101 {
> @@ -119,7 +119,7 @@ cpu5: cpu@101 {
>  			reg = <0x101>;
>  			enable-method = "psci";
>  			capacity-dmips-mhz = <1024>;
> -			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
> +			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP1>;
>  		};
>  
>  		cpu6: cpu@102 {
> @@ -128,7 +128,7 @@ cpu6: cpu@102 {
>  			reg = <0x102>;
>  			enable-method = "psci";
>  			capacity-dmips-mhz = <1024>;
> -			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
> +			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP1>;
>  		};
>  
>  		cpu7: cpu@103 {
> @@ -137,7 +137,7 @@ cpu7: cpu@103 {
>  			reg = <0x103>;
>  			enable-method = "psci";
>  			capacity-dmips-mhz = <1024>;
> -			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
> +			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP1>;
>  		};
>  
>  		idle-states {
> @@ -152,7 +152,15 @@ CPU_SLEEP: cpu-sleep {
>  				min-residency-us = <800>;
>  			};
>  
> -			CLUSTER_SLEEP: cluster-sleep {
> +			CLUSTER_SLEEP0: cluster-sleep@0 {
> +				compatible = "arm,idle-state";
> +				local-timer-stop;
> +				arm,psci-suspend-param = <0x01010001>;
> +				entry-latency-us = <250>;
> +				exit-latency-us = <400>;
> +				min-residency-us = <1000>;
> +			};
> +			CLUSTER_SLEEP1: cluster-sleep@1 {
>  				compatible = "arm,idle-state";
>  				local-timer-stop;
>  				arm,psci-suspend-param = <0x01010001>;
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
