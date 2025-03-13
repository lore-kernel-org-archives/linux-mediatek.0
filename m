Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F87EC282DE
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Mar 2025 18:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YzVdvlh2X//ICivNx26NVRZvWFmd9zi3LqD4F5fsL68=; b=avqvG0199z7vZA0cwL1dRDEQOd
	D6sxqwD0AZ7LdlH7hbmWhK1H/CfmE8yHUDLe0kgoH3fjW4IYRrF5X3Pi+F5zlZWj5Sp8iEuxwsTWX
	W+c78zx+oHI044u63+SSzcEXqjSbcfl47mv7gDy/C3rrtsc5qetUIXNSH6rnEt5534niVC1LcFvyg
	nC393H4ciCe9s9eoJqmhmV6pKGhXk1p1m2thFW21ICVxSSj/A6YWQRCqFPqDl+Z2vFqGen9W/OG0h
	cM4qHVamDzpr9ATPDJ0EUoco7t++hNjtO2P0FzrVY5MZVrS//PBvpO7VOZ4Fobg64yJbj4oj2rJ8J
	WrnzZWew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsmu7-0000000C6Xt-1SSu;
	Thu, 13 Mar 2025 18:03:35 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsmPe-0000000C3Be-0bdc
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Mar 2025 17:32:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741887123;
	bh=HqzG7jGRRK4KmeDziW6iwOPxaTmHRDYm1A7LHk/FrA8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K5GQKXw0+C6nefK2dpjbWjdMRkYFPbtbovwBTPSnD+CBCApTkx19jbL1BbcARmvgs
	 C6b6rcyz0T9EE+vcTfJlVM9LLdZSyAHxarpYZXMeB59QEEeyReHZReQ5iCTC1jjIU2
	 ZiFDIiV2JY7roftjhfDJAhBjZJ6wkXUHRG9T2oS7uXu3uQP/1RItiZZjaz5gUgmMR7
	 eUq60ukl+BmwUWmOZ6CXaTmoC79LfwehkqhzIFDNDU3rmnvVmmSX9z6wQf/jD8wc3J
	 nGW4AOaof3VfYtKhur/NHXKj1dSqkAMC48dzY0XBYTXP/4BYTQryGgVbFM/Q4wqNAB
	 oOOi34wdY8DDw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6A60E17E0E8E;
	Thu, 13 Mar 2025 18:32:03 +0100 (CET)
Message-ID: <dcc62684-0579-4d03-a430-d4a276153ca1@collabora.com>
Date: Thu, 13 Mar 2025 18:32:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dts: arm64: mediatek: mt8188: add more thermal trip
 points
To: Nicolas Pitre <npitre@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <s2sp5o57-o534-qso0-2733-o0prs6028por@onlyvoer.pbz>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <s2sp5o57-o534-qso0-2733-o0prs6028por@onlyvoer.pbz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_103206_363169_AA171CB6 
X-CRM114-Status: GOOD (  13.49  )
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

Il 13/03/25 16:43, Nicolas Pitre ha scritto:
> Provide the "switch on" thermal trip point to be used by the power
> allocator governor.
> 

As far as I know, the power allocation is not supposed to be SoC-global, as that
does play with sustainable power values...

Sustainable power depends on multiple factors - besides the power that is actually
sustainable by intrinsic properties of the silicon, this mostly depends on the PCB
that it is soldered to.

Translated, this depends on the heat capacity of the copper layer(s) and of the
eventual additional passive heatsink, which is a physical property relative to a
board and not to the SoC by itself.

....which means.... that those nodes shall go to board specific devicetrees and
not to the SoC devicetree :-)

Unless I'm wrong - but if I am, please explain why :-)

Cheers,
Angelo

> Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> index 338120930b..262eab8fd3 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> @@ -472,6 +472,12 @@ cpu-little0-thermal {
>   			thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU0>;
>   
>   			trips {
> +				cpu_little0_switch_on: trip-switch-on {
> +					temperature = <68000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
>   				cpu_little0_alert0: trip-alert0 {
>   					temperature = <85000>;
>   					hysteresis = <2000>;
> @@ -510,6 +516,12 @@ cpu-little1-thermal {
>   			thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU1>;
>   
>   			trips {
> +				cpu_little1_switch_on: trip-switch-on {
> +					temperature = <68000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
>   				cpu_little1_alert0: trip-alert0 {
>   					temperature = <85000>;
>   					hysteresis = <2000>;
> @@ -548,6 +560,12 @@ cpu-little2-thermal {
>   			thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU2>;
>   
>   			trips {
> +				cpu_little2_switch_on: trip-switch-on {
> +					temperature = <68000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
>   				cpu_little2_alert0: trip-alert0 {
>   					temperature = <85000>;
>   					hysteresis = <2000>;
> @@ -586,6 +604,12 @@ cpu-little3-thermal {
>   			thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU3>;
>   
>   			trips {
> +				cpu_little3_switch_on: trip-switch-on {
> +					temperature = <68000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
>   				cpu_little3_alert0: trip-alert0 {
>   					temperature = <85000>;
>   					hysteresis = <2000>;
> @@ -624,6 +648,12 @@ cpu-big0-thermal {
>   			thermal-sensors = <&lvts_mcu MT8188_MCU_BIG_CPU0>;
>   
>   			trips {
> +				cpu_big0_switch_on: trip-switch-on {
> +					temperature = <68000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
>   				cpu_big0_alert0: trip-alert0 {
>   					temperature = <85000>;
>   					hysteresis = <2000>;
> @@ -658,6 +688,12 @@ cpu-big1-thermal {
>   			thermal-sensors = <&lvts_mcu MT8188_MCU_BIG_CPU1>;
>   
>   			trips {
> +				cpu_big1_switch_on: trip-switch-on {
> +					temperature = <68000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
>   				cpu_big1_alert0: trip-alert0 {
>   					temperature = <85000>;
>   					hysteresis = <2000>;



