Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695EDC636CC
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Feb 2023 09:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m5N3YGTt575qRdFl3nvYRcyinQ+IGKdRd3i+TbEULrM=; b=cgk6KxoA+xsqd3hlFYei3B34Au
	Lc4QDCPfenQFGuqNRgbBlIAtvTWx1Vn5FvLZ+Z7bwmlVcjfmPDV3WT6TqjnBoylVUdYZeWs9hmhS7
	SR3iXgRqBH/sE9UNXc1JInOrkcYjoFF74Uv7MwEGbx2qu5eltrf4m/my8T0uXcjYjDIaVB/gSKvDX
	UFSZA3yzd6GB8mhP99EoOGofCX0s6SnH8jrHGKN2UJfW39w77eflA6OdWIztksWBsuAmrHezZ4Ni5
	6rDdtwfsZk6BdQVc6tDVjqrSoFzeGfUPL6b/YRen0xkTbZpLAwHh3zxOOAEDPh3zbxltZ9BlomKLC
	CEP7+0GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU2GJ-003TgW-QK; Mon, 20 Feb 2023 09:15:08 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU2Fq-003TZx-Qv; Mon, 20 Feb 2023 09:14:53 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C43AA6600872;
	Mon, 20 Feb 2023 09:14:36 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676884477;
	bh=EZthGgfp/+GzM9VK96C3TuKsvQok/Nr1qQ/r1iqt4Ps=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ohxoNWbmDg0dEYVGXB/7uh5vTOSjvABwd1PRfGd1SUwp921yneFhCyAx8oo0QWwD5
	 XNuEIX8aZIxyT/2hMgqnr1wRkkhuJW3tmubrAaOGrqpppswn+22JjtsEpaOqroe6ZA
	 WwZsbAntltwwria907eYGVFY7P2dZF8ZXnWaCmkJFRs6sAfuHFM3z4L/ZivzJTr6Pv
	 MMhlKnlkAZ7uJo60bx6qTm/02jdnQwfi3C70/y0Egl8yFtu6hsQ8yBiaIImwERrpus
	 su3/ZryAlqRrBzQLo3atqyn9rJJwlqbk1Yh7isrC3ngccuTjMKq+xCeQWHahtDHT7u
	 /zMXhrj0vsuJg==
Message-ID: <8df07281-e332-e25d-e0d7-035efbe3925b@collabora.com>
Date: Mon, 20 Feb 2023 10:14:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] arm64: dts: mediatek: Add cpufreq nodes for MT8192
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>
References: <20230220021915.9473-1-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230220021915.9473-1-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_011440_223459_C90B542F 
X-CRM114-Status: GOOD (  14.99  )
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

Il 20/02/23 03:19, Allen-KH Cheng ha scritto:
> Add the cpufreq nodes for MT8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
> Fix a address warning on dtbs_check
> https://patchwork.kernel.org/project/linux-mediatek/patch/1609223471-24325-1-git-send-email-andrew-sh.cheng@mediatek.com/
> [Allen-KH Cheng <allen-kh.cheng@mediatek.com>]
> ---
> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 424fc89cc6f7..181ec2db7a69 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -55,6 +55,7 @@ cpu0: cpu@0 {
>   			clock-frequency = <1701000000>;
>   			cpu-idle-states = <&cpu_sleep_l &cluster_sleep_l>;
>   			next-level-cache = <&l2_0>;
> +			performance-domains = <&performance 1>;

There's a mistake here: this should be <&performance 0>;

>   			capacity-dmips-mhz = <530>;
>   		};
>   
> @@ -66,6 +67,7 @@ cpu1: cpu@100 {
>   			clock-frequency = <1701000000>;
>   			cpu-idle-states = <&cpu_sleep_l &cluster_sleep_l>;
>   			next-level-cache = <&l2_0>;
> +			performance-domains = <&performance 1>;

Same here

>   			capacity-dmips-mhz = <530>;
>   		};
>   
> @@ -77,6 +79,7 @@ cpu2: cpu@200 {
>   			clock-frequency = <1701000000>;
>   			cpu-idle-states = <&cpu_sleep_l &cluster_sleep_l>;
>   			next-level-cache = <&l2_0>;
> +			performance-domains = <&performance 1>;

and here

>   			capacity-dmips-mhz = <530>;
>   		};
>   
> @@ -88,6 +91,7 @@ cpu3: cpu@300 {
>   			clock-frequency = <1701000000>;
>   			cpu-idle-states = <&cpu_sleep_l &cluster_sleep_l>;
>   			next-level-cache = <&l2_0>;
> +			performance-domains = <&performance 1>;

....and here.

Regards,
Angelo

