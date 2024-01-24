Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A8AC46CD2
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jan 2024 08:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1n63iUdsSjtZx+blV+rMuKXtfre3He6vno39SFQTCJE=; b=zdyQNAw/TXXrNZULe/qQGgh0Nf
	VNONQ7KGnj58fDONqCUYAKgLYfXZ8ztoWnxmlaPMpaf4oxQbVAfpShol7lK50tJ8014vn4uZL2+ew
	84dOFI4Tujmy63d/G3E8TpxUddd6Nb4+1RnoCPW/DlsDRJNCU7ZSeGgIOkHK2G2aejFRGBySAfZkS
	1Gx0OXS0DXAwEAVg3sS8xW5xbp1i50A/6StbhDr0cpvymdFPO5Mmm89cGTJNCs5y1c0nv2X9kdM1b
	Yu0cVbONPZpwRu52cpApg/QCVulCqQpVimTy1Un2joMnkU64iY2a3XyWl6HFp6knA2Hoq4VoJTNGE
	kTw4uvUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSYbo-0020kv-03;
	Wed, 24 Jan 2024 08:27:44 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSYbk-0020jM-1p;
	Wed, 24 Jan 2024 08:27:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706084856;
	bh=D/3W7RJsCcBLtUtTh+4k2/CoFhq/vowhmOY8IGXc+KY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GUdmYU31XCa+Z1vt3C9m2f0rfVL1OZ9JKUXOaN4LdVZVjs17LHcviQj0irZzOeTY6
	 O/f3aAMZClPhrwsB66gVFkT+FCi2ZxYtDuuPKzo9gKd1cbnxhmjZoC0hpV+CmeEaEH
	 /bxiC0t59kRvGt5L5ayeha5x4O0IglqFxWchpx46q54mLXov9m3/o/nhg8gI7yFNct
	 kOrc2H3CruKpZgDHHf7CF1ifpQHRJMADYx2grxbIy+Kdpi71DUQ28NKrew5wUZs8pY
	 lR9OvIH4igtikPQsyIw5I+TIsJhCVMqcDI25Y7YHpXpmLy0PinRVqQsUdpKBcpjH71
	 e+33HKPdsW3yw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1D5AE3782074;
	Wed, 24 Jan 2024 08:27:36 +0000 (UTC)
Message-ID: <786c85c7-7b38-4a2a-85ec-282196de7b5e@collabora.com>
Date: Wed, 24 Jan 2024 09:27:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: mt8195-cherry-tomato: change watchdog
 reset boot flow
To: Hsin-Te Yuan <yuanhsinte@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Hsin-Te Yuan <yuanhsinte@google.com>
References: <20240124-send-upstream-v3-1-5097c9862a73@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240124-send-upstream-v3-1-5097c9862a73@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_002740_772152_93F711CB 
X-CRM114-Status: GOOD (  15.75  )
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

Il 24/01/24 08:51, Hsin-Te Yuan ha scritto:
> From: Hsin-Te Yuan <yuanhsinte@google.com>
> 
> The external output reset signal was originally disabled and sent from
> firmware. However, an unfixed bug in the firmware on tomato prevents
> the signal from being sent, causing the device to fail to boot. To fix
> this, enable external output reset signal to allow the device to reboot
> normally.
> 
> Fixes: 5eb2e303ec6b ("arm64: dts: mediatek: Introduce MT8195 Cherry platform's Tomato")
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>

Can't trigger the bug, but also this commit gives no side effects, so:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


> ---
> Changes in v3:
> - Add Fixes tag
> 
> Changes in v2:
> - Limit the effect only on tomato.
> ---
>   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts | 4 ++++
>   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts | 4 ++++
>   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts | 4 ++++
>   3 files changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
> index 2d5e8f371b6de..a82d716f10d44 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
> @@ -23,3 +23,7 @@ &sound {
>   &ts_10 {
>   	status = "okay";
>   };
> +
> +&watchdog {
> +	/delete-property/ mediatek,disable-extrst;
> +};
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
> index 2586c32ce6e6f..2fe20e0dad836 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
> @@ -43,3 +43,7 @@ &sound {
>   &ts_10 {
>   	status = "okay";
>   };
> +
> +&watchdog {
> +	/delete-property/ mediatek,disable-extrst;
> +};
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
> index f54f9477b99da..dd294ca98194c 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
> @@ -44,3 +44,7 @@ &sound {
>   &ts_10 {
>   	status = "okay";
>   };
> +
> +&watchdog {
> +	/delete-property/ mediatek,disable-extrst;
> +};
> 
> ---
> base-commit: 64b50fcb03649ca7f0d762a50e7a3484cfc1d586
> change-id: 20230818-send-upstream-e91e615a893c
> 
> Best regards,


