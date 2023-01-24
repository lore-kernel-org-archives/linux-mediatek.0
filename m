Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A17CDC25B4E
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Jan 2023 10:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RFTOxBw9NaPQnI6THXMuofbHSHQFeu/Rlzz9vFYI6BQ=; b=gDI1evvRvi2YDgCAR086writxr
	YPR1LKLKvmguY6DBc+megY10M1BMgVda1c6T3AZdrqp4jZQBwS/nGiLIF1JyYTc/E5XpFeGVyVCOU
	wW8Wk8ZRYN+YiYruBPLMj0ull/Y/BuZz5mfWoENYXii7JEf/zXCtr+ya11NWpK3kBj9dj5tKchJ2B
	L17mdgri1ff0ndM79b4qgw4+79W5B7TQaUr/Bf6cENHS/Ni84Gjfqk4padS7zXH79m7snw6rgylMr
	WxoDEbQxzaJEOI0sWtAyJ4cVj2zFH/9GApGUBVAaTjxb9mQMD5j8mzs5DuGMqLHCZsD2uzkYHV6fS
	6jR7JO7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKGvZ-003GeU-TX; Tue, 24 Jan 2023 10:53:21 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKGvI-003GWX-NA; Tue, 24 Jan 2023 10:53:07 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A82A36602E2A;
	Tue, 24 Jan 2023 10:52:59 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674557580;
	bh=NWmvmgqxjDN/jBCODDrbg9zNDiVikX7EO6ENO6c0Zic=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=SNGCsNsHMDAFLtYIBRduuK0sPohTqsI2e0iD9w9vTLgyTcecBXdCzzSuyYX5oYdws
	 5lS2QTvUq6tENa2iDq84UgIT5m147bmipMRolxkbBv9s2LYDScN5l9sgUptByyUSP2
	 jzZPMOB9EpnWofduuZr/9SA7ZKT0KMb5xu32LcOhWZOSV7807S30YW93T7lLFF5If8
	 xOTowb3FWCsrWLUEOeQsfmz72K4+jptuFr3OGPd/u26uz5Idbidx5l5YH5/ymm1vHi
	 0p6Y3eQ2sB9bGfi5sluVrRxGqFlwvr+8QO4riFTTvrNiN7VhU7ud+IKPvrcjeiNbZl
	 6GxNtpeSeN4GA==
Message-ID: <dec754f9-e79d-e1ce-e3ef-5a7eb4385dd7@collabora.com>
Date: Tue, 24 Jan 2023 11:52:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v8 9/9] arm64: dts: mediatek: Initial mt8365-evk support
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, tglx@linutronix.de, maz@kernel.org,
 lee@kernel.org, linus.walleij@linaro.org, matthias.bgg@gmail.com,
 gregkh@linuxfoundation.org, daniel.lezcano@linaro.org,
 chunfeng.yun@mediatek.com, allen-kh.cheng@mediatek.com,
 nfraprado@collabora.com, andrew@lunn.ch, gtk3@inbox.ru,
 sean.wang@mediatek.com, zhiyong.tao@mediatek.com
References: <20230123163833.1007181-1-bero@baylibre.com>
 <20230123163833.1007181-10-bero@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230123163833.1007181-10-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_025304_934552_112930E0 
X-CRM114-Status: GOOD (  15.44  )
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

Il 23/01/23 17:38, Bernhard Rosenkränzer ha scritto:
> From: Fabien Parent <fparent@baylibre.com>
> 
> This adds minimal support for the Mediatek 8365 SOC and the EVK reference
> board, allowing the board to boot to initramfs with serial port I/O.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> [bero@baylibre.com: Removed parts depending on drivers that aren't upstream yet, cleanups, add CPU cache layout, add systimer, fix GIC]
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
> Tested-by: Kevin Hilman <khilman@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/Makefile       |   1 +
>   arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 169 +++++++++
>   arch/arm64/boot/dts/mediatek/mt8365.dtsi    | 378 ++++++++++++++++++++
>   3 files changed, 548 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8365-evk.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8365.dtsi
> 

..snip..

> diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> new file mode 100644
> index 0000000000000..04c666cab506a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> @@ -0,0 +1,378 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * (C) 2018 MediaTek Inc.
> + * Copyright (C) 2022 BayLibre SAS
> + * Fabien Parent <fparent@baylibre.com>
> + * Bernhard Rosenkränzer <bero@baylibre.com>
> + */
> +#include <dt-bindings/clock/mediatek,mt8365-clk.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/phy/phy.h>
> +#include <dt-bindings/thermal/thermal.h>

thermal.h is unused... please remove it for now and add it back in a commit
where you add the thermal node.

Otherwise,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



