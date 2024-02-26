Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1BC9C5478C
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Feb 2024 08:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sOtwp2+YuJ8UBPFstYRACZ2H4HwBwXZePhdwPBPOWXI=; b=x4n3AwBTQNMg3sN1acanlrPJKl
	+Orl2kc9UnTUcIbol07xqAq7pNSUTTLkdmrOJL5jqfHLccj0DnYQEgOcuKTV6Ay3kCarzZXF/Yyj+
	52m4W6O03Qh2XqsMbyX+UUZbQEeO5vSkUIQkXZvh8Fhow+IG3TatR+05TNP03rmZ2zMcXq9TO6m0c
	sqHfceYGVMpi0iD72qI06bho9nshktLlCkxE3bc2QBon0nHJDujz+nWSVVpYzgt9EYhn2mGTqWRCT
	9ede5mRs0LnKsmXUQLZRHMIa+GohjCTaEiXCCDXLhX39cfd0movZVfXPVvhxQh3JAGHAy0kuP00vN
	9GQCiX7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reWlV-0000000HA5q-1VkH;
	Mon, 26 Feb 2024 08:55:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reWlH-0000000H9yS-3oiS;
	Mon, 26 Feb 2024 08:54:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=sOtwp2+YuJ8UBPFstYRACZ2H4HwBwXZePhdwPBPOWXI=; b=jjy8BhTcjzmJiwrICqBUxVtuv+
	n/SE1Fqtg/0qpJTcHwi+pXgwsB5SeSm4yiEw3KN1DqeDkBnIpqieZA9uJXFG2DnoVxI8hIm9NddUy
	2vJmTz5PM5CoA4HLoLgPCQBKLxPtH7500h/G+5XLWEhJpM3MGzsnR1dOSBD1v7PpBrcLuoESllV1u
	FRnhDQRe3DcpMsmr9csiYv++4Hjfs9Pve2ZWz24a09KCUBDYhzc/fgvr1DjCRpHd+9iO06wOrx9yc
	sFSdVYOJJ2NVwfFzzZP5YWCdaJmXq4vu94BTx1fOxwP8m2HMhRcBrlST8fHNCqXt4DOzX3vnyv8eV
	5LDjuyxg==;
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reWka-000000014pv-4C3J;
	Mon, 26 Feb 2024 08:54:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708937648;
	bh=pjv2fhOW94iLLWS4VEuh49cFeCknKUZZbCQ8xc1tWOc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Y8uHFjKcveo1pVJZlRfFNFHwPbJMhQ6YfKl5FXTPDX1/vf96Z9+SBvqwh0BWUs/7Q
	 ppn6luqf/Aci81+xb2qMABaa5fK7ROaTv0m+VA4rEqwAIesYC1QXzIvNZVuLEokSmw
	 eRflYxpwL1Y13iMSmu2lf2GCsVv5Se+8ToY38OvsnoPDgbexRtcCT9SSccFaeQ0rm6
	 xh4Xr9IAQph6NrfOog4b56SusB90LxmG634DJ7dEhi/8UXfnJ0Yyla8QriLbdemgaU
	 +HcqatEWq+XMHbKqDKZDxRWCdtJ9hI0wUhLXi+nyCz2ikSNZeTbIJEYCH3UD7v30nm
	 G1rXyzsxbPPnw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1CE373781183;
	Mon, 26 Feb 2024 08:54:08 +0000 (UTC)
Message-ID: <feab2039-5745-41a4-87c3-44fa266efc1d@collabora.com>
Date: Mon, 26 Feb 2024 09:54:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8183: Add power-domains properity
 to mfgcfg
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Ikjoon Jang <ikjn@chromium.org>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>
References: <20240223091122.2430037-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240223091122.2430037-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_085418_083133_A39C1993 
X-CRM114-Status: GOOD (  18.63  )
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

Il 23/02/24 10:11, Chen-Yu Tsai ha scritto:
> From: Ikjoon Jang <ikjn@chromium.org>
> 
> mfgcfg clock is under MFG_ASYNC power domain.
> 
> Fixes: e526c9bc11f8 ("arm64: dts: Add Mediatek SoC MT8183 and evaluation board dts and Makefile")
> Fixes: 37fb78b9aeb7 ("arm64: dts: mediatek: Add mt8183 power domains controller")
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> This patch is long overdue. Could we merge it for fixes for this or the
> next release?
> 

A clock controller that needs a power domain? Can you please describe the issue
that you're trying to solve with this?

It's not very uncommon but I'm not entirely convinced that this is right, because
the MFG_BG3D is a gate - and it's *not* outputting a clock rate on its own: the
mfgcfg is entirely GPU related and if there is no GPU support this clock is not
even ever needed.

MediaTek, can you please clarify if (and why) this gate clock needs a MTCMOS to
be ungated?

Thanks,
Angelo

> Changes since v2:
> - Rebased onto current tree
> - Added Fixes tags
> - Fix up subject prefix
> 
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 93dfbf130231..774ae5d9143f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -1637,6 +1637,7 @@ mfgcfg: syscon@13000000 {
>   			compatible = "mediatek,mt8183-mfgcfg", "syscon";
>   			reg = <0 0x13000000 0 0x1000>;
>   			#clock-cells = <1>;
> +			power-domains = <&spm MT8183_POWER_DOMAIN_MFG_ASYNC>;
>   		};
>   
>   		gpu: gpu@13040000 {



