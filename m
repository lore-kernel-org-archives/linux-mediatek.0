Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7E6CCF9E9
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 08:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ss1DfJlgfc8UctGL9Snva1Bl2rjj53WlXFect8oYkN0=; b=qOMhFQX4Q2UVcoAQh0+Wm+iUrP
	7Rcs/c90jPTE5c0p60/OciEljzgGf58MerhzAFfOwJbmSPDXgeX14Oa/lxi5XGZHDCMur+IE1n+P0
	29kOUKM7GGli/7XJ9aeVSiExMNN9tV0lVnpTKXPRkeq7+uUU3iPErvbnpjta4RVbjFvgzJ2GThx8d
	RjxX6uQkYpbrWP+XnytH91rSzbA0Ik5ZY+N5zabdrO8hv3QEbB6wEuhFXpN12sgpd6/ho8HxoffG0
	3jduVxgTOWRRmY+lsjP4ouirOiB3v9Ek8T9p8s8I3Xv2bQGIbmhe6XbfpLLRRyMV+N5p6vbM4HWIG
	oEGGHVsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stk18-00000007iIC-2xQ9;
	Thu, 26 Sep 2024 08:38:30 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stjwS-00000007h31-1MD8;
	Thu, 26 Sep 2024 08:33:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727339618;
	bh=NpmX2svJJ4CDW8F4r8nC7PPzPmar7GK9o77BlzQWdfA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l33DEuPa37wbIu4/YTxgFXOpuv2+j9FQdVilxgCsG8RI9RKwwN0HlPCfcrhB0K8nU
	 7yrga93CjN7+86ZbMlgVApQ2mGcvyRaGs//EAe3O2/ZjR6vnBOqBAlyBzujhGhIPap
	 zCFTBZnuOaaivCMHHpbXVWvllqF34bM6MFN6JDf6JXo4S+87A/XBb0Ansfi/Oq4Zso
	 oNoJ5oKT92Q2sH7RGAJgNj9T9zqeimYaJeE1Zypg+V4q0CAIjBD4xKOZiPCsCFUKxN
	 E0sTKdwxfMo2dvCH1k9giTF8nR6wnNZiEfp4Y1FQ82mazKSk2Kaw1jeXgZWk5zG8vC
	 gtceF0la5YUfQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6715017E1048;
	Thu, 26 Sep 2024 10:33:38 +0200 (CEST)
Message-ID: <fbdbe9ff-586a-429c-a987-b8ec39b485e8@collabora.com>
Date: Thu, 26 Sep 2024 10:33:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] arm64: dts: mediatek: mt8188: Define CPU big core
 cluster
To: Fei Shao <fshao@chromium.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20240925110044.3678055-1-fshao@chromium.org>
 <20240925110044.3678055-4-fshao@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240925110044.3678055-4-fshao@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_013340_559392_1DAA5DB7 
X-CRM114-Status: GOOD (  13.38  )
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

Il 25/09/24 12:57, Fei Shao ha scritto:
> The MT8188 SoC features two CPU clusters: one with 6 little Cortex-A55
> cores, and the other with 2 big Cortex-A78 cores.

No, it doesn't. It features only one cluster, so...

> 
> Update the CPU topology to reflect the actual hardware configurations.

...the actual hardware configuration is already reflected by the currently
declared CPU topology, so for this commit: NAK.

This SoC uses the ARM DynamIQ technology and embeds both LITTLE and big
cores in one single cluster.
Check the MT8188 datasheet for more information :-)

Cheers,
Angelo

> 
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---
> 
>   arch/arm64/boot/dts/mediatek/mt8188.dtsi | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> index cd27966d2e3c..51bf08b2ff9b 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> @@ -195,12 +195,14 @@ core4 {
>   				core5 {
>   					cpu = <&cpu5>;
>   				};
> +			};
>   
> -				core6 {
> +			cluster1 {
> +				core0 {
>   					cpu = <&cpu6>;
>   				};
>   
> -				core7 {
> +				core1 {
>   					cpu = <&cpu7>;
>   				};
>   			};



