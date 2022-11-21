Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A4BC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 11:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QB3gNY6yaJMnXhVV7emf4yfo6x5OMz0IYCSWMhi+hEc=; b=e2SbWKNCORAf4RKNe3PZdm/hU8
	Hw0l/Ymv/vbifPg9+sUITbTIszb/+1rKPs5dNRIKr8FDR7dgai1j+oJhgIGsrIqJMHyW9Lb9iNOqE
	43VdnGYAvP4p56Q7NKQpxpaacl11i0OO8NmObyrDn5Go68+9ABkOg2KSQVvZwJgI+sKeN1ak9FlKf
	/DJ6I/G6bB3sze0Y9jRd1bRAQXgz/laF0BV6gUemgGguFCJldZ2bRqbZ0i0jE2jlzdBj5GxMxk6Cw
	W4QbstiTvlbpaNbXUDysdA/jsWMp2Dl+orNBkBSgbb1rSVGPP3TMI2V+IsKgRXV5mzGSh3kGlg0Dq
	YY3XCqtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox5O3-00D6uP-M1; Mon, 21 Nov 2022 11:54:55 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox5Np-00D6me-8i; Mon, 21 Nov 2022 11:54:42 +0000
Received: by mail-wm1-x332.google.com with SMTP id 84-20020a1c0257000000b003cfe48519a6so6314282wmc.0;
        Mon, 21 Nov 2022 03:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QB3gNY6yaJMnXhVV7emf4yfo6x5OMz0IYCSWMhi+hEc=;
        b=P+U1OHpHssZT7auV7/xQp9Brb8pDG6DU/KV7YI8GMe86bDpGxYvSv30QBbAWThUDJF
         FY6ychSgiFKhH8qFbXbsbp0b2ZJ/nlQBVL8V9JRNA9DBgG8xFA3pF/bWQgjmD4OHCnZz
         HmiJrKUozvlHT1cRscyxWXgUPsr+y47pZTb27di//zCtLKi2VxciO74sArOihoYsS8Uo
         KE4UiSSAPhd24pzMvJRhGCvbjb5Fi0Byc3RtX9ZnLzZLHd178saR07bvEt4kLnQY2uIe
         Mgvw+6FHZXZwL5CC5RAwblaXjI3voRomDYrV9M+zafQopTsTZB7v3a9gDlZibkSlbod4
         eMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QB3gNY6yaJMnXhVV7emf4yfo6x5OMz0IYCSWMhi+hEc=;
        b=EaT7fbkqkmmZzGBHpt8sk8V1bcni2vbzfy71PIA0s7bazuupD5AAwKwdtEJbnjKyHl
         x+uMHmugWy5kbtAHExu7r4LLEFEv02dOJs5brnerYQzYo6jHqfoKQNeFPjLNCr6/nckq
         5YzcgF/y32J4Y1Qpgp/zcTOnGssAzzb36W/BmFX6cI/oLM5E1gzpUAAIjfPzVilR2GPM
         boE15tm6e0flpv8OfRuXCJmzu6eyq5exqTztCo/rGCfy9S0grseafzP47sUBTBKqdKzL
         bu0kX5HkGz6+GH4NimwbwWMlPhh5N4TKyXxfRmx4/YaEvbLhDUW3kJa3zh2sPbG58jA1
         9jgQ==
X-Gm-Message-State: ANoB5pn+BNT5UQEIpXygcZU+7NF3Nd/9PzXeokrPIY4Br2GUHPxCcqR1
	z6slPxZ8e1rx+Z3K4hjkwWh44cKBUcg=
X-Google-Smtp-Source: AA0mqf5yPHbwfASaKwZ0hgwUWI2wZ/5w3j0QHXDZp6K/Ira6H0o+d3uT1LxH0796iYp7TEGBTIBqDg==
X-Received: by 2002:a7b:ce89:0:b0:3c6:c986:f2b9 with SMTP id q9-20020a7bce89000000b003c6c986f2b9mr12282679wmj.53.1669031676568;
        Mon, 21 Nov 2022 03:54:36 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id i6-20020a05600c354600b003cf894c05e4sm18918780wmq.22.2022.11.21.03.53.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 03:54:34 -0800 (PST)
Message-ID: <c1fbe477-8991-2ac4-7f0a-11360868ca11@gmail.com>
Date: Mon, 21 Nov 2022 12:53:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] arm64: dts: mediatek: mt8195: Fix CPUs capacity-dmips-mhz
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, tinghan.shen@mediatek.com,
 seiya.wang@mediatek.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221005093404.33102-1-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221005093404.33102-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_035441_340960_4036D915 
X-CRM114-Status: GOOD (  16.91  )
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



On 05/10/2022 11:34, AngeloGioacchino Del Regno wrote:
> The capacity-dmips-mhz parameter was miscalculated: this SoC runs
> the first (Cortex-A55) cluster at a maximum of 2000MHz and the
> second (Cortex-A78) cluster at a maximum of 3000MHz.
> 
> In order to calculate the right capacity-dmips-mhz, the following
> test was performed:
> 1. CPUFREQ governor was set to 'performance' on both clusters
> 2. Ran dhrystone with 500000000 iterations for 10 times on each cluster
> 3. Calculate the mean result for each cluster
> 4. Calculate DMIPS/MHz: dmips_mhz = dmips_per_second / cpu_mhz
> 5. Scale results to 1024:
>     result_c0 = (dmips_mhz_c0 - min_dmips_mhz(c0, c1)) /
>                 (max_dmips_mhz(c0, c1) - min_dmips_mhz(c0, c1)) * 1024
> 
> The mean results for this SoC are:
> Cluster 0 (LITTLE): 11990400 Dhry/s
> Cluster 1 (BIG): 59809036 Dhry/s
> 
> The calculated scaled results are:
> Cluster 0: 307,934312801831 (rounded to 308)
> Cluster 1: 1024
> 
> Fixes: 37f2582883be ("arm64: dts: Add mediatek SoC mt8195 and evaluation board")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied,

Thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 905d1a90b406..0b85b5874a4f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -36,7 +36,7 @@ cpu0: cpu@0 {
>   			enable-method = "psci";
>   			performance-domains = <&performance 0>;
>   			clock-frequency = <1701000000>;
> -			capacity-dmips-mhz = <578>;
> +			capacity-dmips-mhz = <308>;
>   			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
>   			next-level-cache = <&l2_0>;
>   			#cooling-cells = <2>;
> @@ -49,7 +49,7 @@ cpu1: cpu@100 {
>   			enable-method = "psci";
>   			performance-domains = <&performance 0>;
>   			clock-frequency = <1701000000>;
> -			capacity-dmips-mhz = <578>;
> +			capacity-dmips-mhz = <308>;
>   			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
>   			next-level-cache = <&l2_0>;
>   			#cooling-cells = <2>;
> @@ -62,7 +62,7 @@ cpu2: cpu@200 {
>   			enable-method = "psci";
>   			performance-domains = <&performance 0>;
>   			clock-frequency = <1701000000>;
> -			capacity-dmips-mhz = <578>;
> +			capacity-dmips-mhz = <308>;
>   			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
>   			next-level-cache = <&l2_0>;
>   			#cooling-cells = <2>;
> @@ -75,7 +75,7 @@ cpu3: cpu@300 {
>   			enable-method = "psci";
>   			performance-domains = <&performance 0>;
>   			clock-frequency = <1701000000>;
> -			capacity-dmips-mhz = <578>;
> +			capacity-dmips-mhz = <308>;
>   			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
>   			next-level-cache = <&l2_0>;
>   			#cooling-cells = <2>;

