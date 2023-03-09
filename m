Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40DAFC64EC4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 15:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XnRMDJsVtaLTah7fPLTSux/usKHTSQtwCxUKSMu5Eg4=; b=XqvhWNK+T1tjcw8K1WDZI04NLQ
	YJzEDG3lSf3dV+0y4OTXEYG/pf/Coh0MSsgxblFWW5QvxD2cUDWAcbrC1GLJhegrEFdiPezrz8Xl6
	uftQQse7hginBpOALMbP5QqhdrNG641ydS1ZSOy9kYn50RFQ4bAjXBDA/w++uhqdpPT+JjrCDtMoD
	ql7ICRxNJeCnEYIDPCE6U2sBUptC/9At3Ff6iKjBztg3zTZcRVb/+To2CwoC+ZEHwjkRrvqy3bGTb
	8VyR5YYMuxOws7io7c7RyqlQ0QVOzJWrFzRqIMJROs9TSJtG12gWcUTPBJvGQaoS+I/IAXAdjwtHN
	Nqy+8CyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paINh-00AyOp-7h; Thu, 09 Mar 2023 15:40:37 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paI5J-00ArMy-Ft; Thu, 09 Mar 2023 15:21:39 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BB598660304C;
	Thu,  9 Mar 2023 15:21:32 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678375293;
	bh=9nQJQnCKbrb4KyGEURRImR/OMn2QuOxR8XFtRl35qr8=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=eCxYuAvDoUj6hHpZC5PYkYWMWUiG7uhp9zBZFfhSggOZvJ2PI3d/ct+eiTMkLCG7I
	 rO989CP+wpq9ukZjjY6x7wRayNpanPHLt/3Ew6A0uRhmbr65Vane5p0BlKVGi0z4bK
	 Y/hN8zryvtqjjIEplsuf+Jvd1oO6Jer9IJzh4OmM8ctWLHvqK8gHxB4JtFyjTk+uWg
	 CaWIUMivoOqf0or3Uk8V1p6Pk0Xk58W8mA3dkiB1RYe0czYTYlNLWnBF/ecTzDigpu
	 076PhgAa9jRPoOrZq7isygKz62/clJFhaTqazvkNlbUIcLa+VzFwpY3ST2365Gqr2j
	 Lg6CSOT1bZtpg==
Message-ID: <42e0c0fe-3ee5-91df-302a-20193ec64bd3@collabora.com>
Date: Thu, 9 Mar 2023 16:21:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v10 3/3] arm64: dts: mediatek: Initial mt8365-evk support
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, matthias.bgg@gmail.com,
 gregkh@linuxfoundation.org, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, maz@kernel.org, tglx@linutronix.de
References: <20230309143459.401783-1-bero@baylibre.com>
 <20230309143459.401783-4-bero@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230309143459.401783-4-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_072137_781093_70610170 
X-CRM114-Status: GOOD (  15.47  )
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

Il 09/03/23 15:34, Bernhard Rosenkränzer ha scritto:
> From: Fabien Parent <fparent@baylibre.com>
> 
> This adds minimal support for the Mediatek 8365 SOC and the EVK reference
> board, allowing the board to boot to initramfs with serial port I/O.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> [bero@baylibre.com: Removed parts depending on drivers that aren't upstream yet, cleanups, add CPU cache layout, add systimer, fix GIC]
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
> [aouledameur@baylibre.com: Fix systimer properties]
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> Tested-by: Kevin Hilman <khilman@baylibre.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   arch/arm64/boot/dts/mediatek/Makefile       |   1 +
>   arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 168 +++++++++
>   arch/arm64/boot/dts/mediatek/mt8365.dtsi    | 377 ++++++++++++++++++++
>   3 files changed, 546 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8365-evk.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8365.dtsi
> 

..snip..

> diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> new file mode 100644
> index 0000000000000..5d6763ebcf869
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> @@ -0,0 +1,377 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * (C) 2018 MediaTek Inc.
> + * Copyright (C) 2022 BayLibre SAS
> + * Fabien Parent <fparent@baylibre.com>
> + * Bernhard Rosenkränzer <bero@baylibre.com>
> + */

..snip..

> +
> +	systimer: timer@10017000 {
> +		compatible = "mediatek,mt8365-systimer", "mediatek,mt6795-timer";

You mean "mediatek,67 -> 6 <- 5-timer", right? :-P

Cheers,
Angelo

> +		reg = <0 0x10017000 0 0x100>;
> +		interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&system_clk>;
> +		clock-names = "clk13m";
> +	};
> +};


