Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2261CD129C
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 07:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RQgu6jf3JgNRa9PmtJbYRXaJRn+tFmhvejvKui4isMw=; b=ZFLckaOLOtmspDh23EYRuXvjh9
	W+gwq0PXN8q4xGa8aToQrkoHm8snlX/BOZ4MWIppFY7y71F0Q4xpVzbOOdChNduwp1rd5xArc643d
	vhQf5uhbk97Su92UgYcbBaKcfBV1xw7RfLBgQP3b1JYdo+ezasViNPBFfeb/pZLAdM6ordNqWvI32
	zQsAlEIrgB7O6uKaJi6TXxI+NEx1XZea60WtKsCd99bKGfysc907NG+uYq4OTyM2h9AiA96GS0m5u
	jbEmRoXAKiLr9x4CLqc8sI6mTHeQTu8zFSHprw7K/EVUgeWmVwK/HNxjUNpOaZ7qf3yq+mPkhqABz
	dIYVg9OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruScX-00000005fSZ-0csI;
	Wed, 10 Apr 2024 07:43:49 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruScQ-00000005fPL-0iQA;
	Wed, 10 Apr 2024 07:43:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712735016;
	bh=DeSfzPYFn0N6NR18R8H3GpZboC/iGhCg4ALFCzEZRKI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bvIwJ3sB7OrZj3KC8gn3eqW08Bc/4c5JWCeL7YUzBTi01GKdRDY4XUkN/+bOZxlLK
	 wAIgyFw5srJUU8UK1IcEYrTE3SwnZ+3MG9i+NHeIR1BhqjQXgrCJoCQMRG33h3fRDl
	 KBgKF7ZC4ROOI/+FkGQNR+F5rN76GWGqTa22lTfOE6RkK2JrsYJ+fG2tDDSFTn1a9p
	 /XyF2JXQ9x4cCWbTHDKPylDtmQG2lvC0C+pGI7ZlPocIp8GrrdwMqtX+ixTn+cX6G4
	 OCpftAVgB11ICqHOXZKQ7qL0WbA2076iATeGWAsMA/rbx9nUsj9bgMo6Oso55buHqU
	 hDW+4eetblGbQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 48F1A3780C13;
	Wed, 10 Apr 2024 07:43:35 +0000 (UTC)
Message-ID: <c3d05b3e-f784-4606-9634-52dc6feee318@collabora.com>
Date: Wed, 10 Apr 2024 09:43:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8192: Add missing trip point in
 thermal zone
To: Hsin-Te Yuan <yuanhsinte@chromium.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?=
 <nfraprado@collabora.com>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?=
 <bero@baylibre.com>, Balsam CHIHI <bchihi@baylibre.com>,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240410-upstream-torvalds-master-v1-1-852e903f0cec@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240410-upstream-torvalds-master-v1-1-852e903f0cec@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_004344_970319_482AB772 
X-CRM114-Status: GOOD (  15.63  )
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

Il 10/04/24 08:20, Hsin-Te Yuan ha scritto:
> Add the missing passive trip point which is expected by kernel.
> 
> Fixes: c7a728051f4e ("arm64: dts: mediatek: mt8192: Add thermal nodes and thermal zones")
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>

Sorry, I don't understand what you're trying to solve here.

All of the thermal zones in mt8192.dtsi already do have a passive trip point
which is also used in cooling-maps.

Can you please describe the issue?

Thanks,
Angelo

> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 40 ++++++++++++++++++++++++++++++++
>   1 file changed, 40 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 05e401670bced..08d8bccc84669 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -1959,6 +1959,11 @@ cpu0-thermal {
>   			thermal-sensors = <&lvts_mcu MT8192_MCU_LITTLE_CPU0>;
>   
>   			trips {
> +				cpu0_thres: trip-point {
> +					temperature = <68000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
>   				cpu0_alert: trip-alert {
>   					temperature = <85000>;
>   					hysteresis = <2000>;
> @@ -1989,6 +1994,11 @@ cpu1-thermal {
>   			thermal-sensors = <&lvts_mcu MT8192_MCU_LITTLE_CPU1>;
>   
>   			trips {
> +				cpu1_thres: trip-point {
> +					temperature = <68000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
>   				cpu1_alert: trip-alert {
>   					temperature = <85000>;
>   					hysteresis = <2000>;
> @@ -2019,6 +2029,11 @@ cpu2-thermal {
>   			thermal-sensors = <&lvts_mcu MT8192_MCU_LITTLE_CPU2>;
>   
>   			trips {
> +				cpu2_thres: trip-point {
> +					temperature = <68000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
>   				cpu2_alert: trip-alert {
>   					temperature = <85000>;
>   					hysteresis = <2000>;
> @@ -2049,6 +2064,11 @@ cpu3-thermal {
>   			thermal-sensors = <&lvts_mcu MT8192_MCU_LITTLE_CPU3>;
>   
>   			trips {
> +				cpu3_thres: trip-point {
> +					temperature = <68000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
>   				cpu3_alert: trip-alert {
>   					temperature = <85000>;
>   					hysteresis = <2000>;
> @@ -2079,6 +2099,11 @@ cpu4-thermal {
>   			thermal-sensors = <&lvts_mcu MT8192_MCU_BIG_CPU0>;
>   
>   			trips {
> +				cpu4_thres: trip-point {
> +					temperature = <68000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
>   				cpu4_alert: trip-alert {
>   					temperature = <85000>;
>   					hysteresis = <2000>;
> @@ -2109,6 +2134,11 @@ cpu5-thermal {
>   			thermal-sensors = <&lvts_mcu MT8192_MCU_BIG_CPU1>;
>   
>   			trips {
> +				cpu5_thres: trip-point {
> +					temperature = <68000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
>   				cpu5_alert: trip-alert {
>   					temperature = <85000>;
>   					hysteresis = <2000>;
> @@ -2139,6 +2169,11 @@ cpu6-thermal {
>   			thermal-sensors = <&lvts_mcu MT8192_MCU_BIG_CPU2>;
>   
>   			trips {
> +				cpu6_thres: trip-point {
> +					temperature = <68000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
>   				cpu6_alert: trip-alert {
>   					temperature = <85000>;
>   					hysteresis = <2000>;
> @@ -2169,6 +2204,11 @@ cpu7-thermal {
>   			thermal-sensors = <&lvts_mcu MT8192_MCU_BIG_CPU3>;
>   
>   			trips {
> +				cpu7_thres: trip-point {
> +					temperature = <68000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
>   				cpu7_alert: trip-alert {
>   					temperature = <85000>;
>   					hysteresis = <2000>;
> 
> ---
> base-commit: 20cb38a7af88dc40095da7c2c9094da3873fea23
> change-id: 20240410-upstream-torvalds-master-40aeff5416c7
> 
> Best regards,


