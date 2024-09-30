Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A50CF649E
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Sep 2024 09:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mqXJbQ9jIp2dDPFw1R2cFxNlMKpHzV9PGLe7OchYR0Y=; b=VszgX6mDqfCuLuzoG8j1FOPLkM
	VJbMZnRnSe1tRhOl1j4pI1exF8FHhAhUHxtC2pgSpKjZhFw6cz6ylvP9a7WH5xhZZ8vE3vw9eVPqY
	LCSli53zIIInlrXU7gimygrfQ4uXdntNNs/7SNP/jFbmJwlJeIA2ngDSistAk1zuUrfLpUAOW/n/Z
	Vrng1UnkPxfK5XSSHfIgcO3cDcdI5xs/K6hnt1lNaHD0XQqMdAHN87AahOAqKNOWA+rAdSQQkvDVK
	434z4gD5Y8EDL6uXLiiWKLjDZgk4H/zc9C3vLx+4eLYq6tsyT5l0ZI7tr22BQs/GzLflL+2GvUrlY
	eu5Ts65w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svCkO-0000000GXEU-3BFm;
	Mon, 30 Sep 2024 09:31:16 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svCcp-0000000GV0Z-0C2a;
	Mon, 30 Sep 2024 09:23:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727688204;
	bh=H78v4z8F6OouxmM7kvdruy1KbUGRwDt9Sl8HITuykgI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b/TUIaH9WcMHPZxb+dWhv/n3SDpnlPtKLp9X4Fax/mdh4Pe9c4JSl604D4ZHWsiQd
	 FDtNQhE6l1BrnLLzhpk395sWaVkz7Q3hoUGlDs+ZaUnFU6xIXtPZqQPvfcu/bEfDUT
	 QiLOYSCxzCt5t/r6+roLhdmsHVaEBmX958BQEuoP45X/FKKWa/pOjG47Z8e9YpOCFH
	 synU7eiVevxVQU9rBifj5ajrMDlHmMoW6WIJxYY8MCUE6x7pT/1N1CZ1DLBNWKzdBr
	 oShgrkE6Y87PP/70HH6M7L6ymeEdY/akD7c8buKeThLcusS4OQFj5bERg7hpBRVS6I
	 2UFobEu5a6NBA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0251017E1091;
	Mon, 30 Sep 2024 11:23:23 +0200 (CEST)
Message-ID: <2c5614f7-0ada-453a-bd81-2f0054a919a0@collabora.com>
Date: Mon, 30 Sep 2024 11:23:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: mediate: Introduce MT8186
 Chinchou/Chinchou360 Chromebooks
To: =?UTF-8?Q?Albert_Jakie=C5=82a?= <jakiela@google.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 wenst@chromium.org, rafal@milecki.pl, hsinyi@chromium.org,
 nfraprado@collabora.com, sean.wang@mediatek.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240927122940.4190949-1-jakiela@google.com>
 <20240927122940.4190949-2-jakiela@google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240927122940.4190949-2-jakiela@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_022327_324029_7A70D514 
X-CRM114-Status: GOOD (  16.93  )
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

Il 27/09/24 14:29, Albert Jakieła ha scritto:
> The MT8186 Chinchou/Chinchou360, also known as the Asus Chromebook
> CZ12/CZ11 Flip, is a clamshell or convertible device with touchscreen,
> stylus and extra buttons.
> 

You have a typo in your commit title `mediate` -> `mediatek`

> Signed-off-by: Albert Jakieła <jakiela@google.com>
> ---
> Changes in v2:
> - PATCH 2/2: Remove sku2147483647, remove duplicate nodes, add model
> 	and remove uneccecery nodes from sound card.
> - Link to v1: https://lore.kernel.org/all/20240925080353.2362879-2-jakiela@google.com/
> 
> ---
>   arch/arm64/boot/dts/mediatek/Makefile         |   3 +
>   .../mediatek/mt8186-corsola-chinchou-sku0.dts |  18 +
>   .../mediatek/mt8186-corsola-chinchou-sku1.dts |  34 ++
>   .../mt8186-corsola-chinchou-sku16.dts         |  28 ++
>   .../dts/mediatek/mt8186-corsola-chinchou.dtsi | 432 ++++++++++++++++++
>   5 files changed, 515 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou.dtsi
> 

..snip..


> diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou.dtsi
> new file mode 100644
> index 000000000000..96cc3c267c20
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou.dtsi
> @@ -0,0 +1,432 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright 2023 Google LLC
> + */
> +
> +/dts-v1/;
> +#include "mt8186-corsola.dtsi"
> +
> +/ {

..snip..

> +
> +&sound {
> +	status = "okay";
> +
> +	compatible = "mediatek,mt8186-mt6366-rt5650-sound";

Why did you keep the compatible string override?

> +	model = "mt8186_rt5650";
> +

Regards,
Angelo





