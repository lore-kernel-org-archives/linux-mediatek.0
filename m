Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9411C48297
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Feb 2024 08:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fnCrhn21vWL6SEx2t/cU1/iOloadAGhb69ALqjTsVS0=; b=VO+Nr9PBMtKa5uilPBoBvL8FSp
	O7Wyi23YJCz9NuTB9DItyDTbw/pA/rXGg/7AxCet5xYzgK03utiqcijfXdMcX9mxlv9Q/NqG+0jxI
	iXHi/bNqXx6agCmdcNu+SOX+NGKA6jNT2zqb5+qDjoiNG5GXamIwLRkzOf/bJh/p51lms2tF7zMmc
	m7ThoqlIaeVPoViTUpkDJMl/1dgr1sENFWk2LFM/yqpkgOKSOlvfwcWENmQb0sqUXly8765lVY5HQ
	GXfZtm0jUKqn8qZ0wFKtda3pkUAG3wxdtIt61RvesWa6kWG+Lso4E2uyyrD/egmgCyPhyQogavpES
	LdqIX8iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYMdQ-0000000GVIM-16xl;
	Fri, 09 Feb 2024 08:53:24 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYMdM-0000000GVG1-0Yhy;
	Fri, 09 Feb 2024 08:53:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707468799;
	bh=30icvp5V3/sN88X5yZ5Qu/GuxcwktWzuh4T4oylBLLM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=og1eab/P3zYG4XIff5Tzr59qJhbZSaeeoG4aGvVSriIqow5keEhjlYxUdPUGkr1Bb
	 dinNWGwZ367ad6BycXdiHtXo+Ba2DwIazn8S9beJLq5yEmxb0maXqc1TBzmOtRORot
	 i3YIjpXLZe74qPqvXooQdhr51SuWNb03mYd6VQodEtpD05ZiAk1qPi82WOieRhOhwz
	 mXCbgiYVO5KNP6yjtM0xws4+cJrQktkCJxtUalRP1gGNWR/qdERPI0HOdLlTtOyNHq
	 wmxwHxseaT0NfCc78o2mwk0L3ijI9aVMPVrURWeHZ3v52YnRn+R+Hc0uOMgFdTEZsc
	 piYoRWqubbWqg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2E9533782069;
	Fri,  9 Feb 2024 08:53:18 +0000 (UTC)
Message-ID: <d4a4a468-4a81-413e-9de6-060c2ba9e0b6@collabora.com>
Date: Fri, 9 Feb 2024 09:53:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/3] dt-bindings: arm: mediatek: convert hifsys to the
 json-schema clock
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240208215926.10085-1-zajec5@gmail.com>
 <20240208215926.10085-2-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240208215926.10085-2-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240209_005320_350287_E99367F7 
X-CRM114-Status: GOOD (  16.81  )
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

Il 08/02/24 22:59, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This helps validating DTS files. Introduced changes:
> 1. Documented "reg" property
> 2. Documented "#reset-cells" property
> 3. Dropped "syscon" as it was incorrectly used
> 4. Adjusted "compatible" and "reg" in example
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>   .../bindings/arm/mediatek/mediatek,hifsys.txt | 26 ----------
>   .../clock/mediatek,mt2701-hifsys.yaml         | 51 +++++++++++++++++++
>   2 files changed, 51 insertions(+), 26 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,hifsys.txt
>   create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,hifsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,hifsys.txt
> deleted file mode 100644
> index 323905af82c3..000000000000
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,hifsys.txt
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -Mediatek hifsys controller
> -============================
> -
> -The Mediatek hifsys controller provides various clocks and reset
> -outputs to the system.
> -
> -Required Properties:
> -
> -- compatible: Should be:
> -	- "mediatek,mt2701-hifsys", "syscon"
> -	- "mediatek,mt7622-hifsys", "syscon"
> -	- "mediatek,mt7623-hifsys", "mediatek,mt2701-hifsys", "syscon"
> -- #clock-cells: Must be 1
> -
> -The hifsys controller uses the common clk binding from
> -Documentation/devicetree/bindings/clock/clock-bindings.txt
> -The available clocks are defined in dt-bindings/clock/mt*-clk.h.
> -
> -Example:
> -
> -hifsys: clock-controller@1a000000 {
> -	compatible = "mediatek,mt2701-hifsys", "syscon";
> -	reg = <0 0x1a000000 0 0x1000>;
> -	#clock-cells = <1>;
> -	#reset-cells = <1>;
> -};
> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml
> new file mode 100644
> index 000000000000..eb429337cdf4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/mediatek,mt2701-hifsys.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek hifsys controller

Please, "MediaTek HIFSYS controller"

> +
> +description:
> +  The Mediatek hifsys controller provides various clocks and reset outputs to
> +  the system.

Same here, "The MediaTek HIFSYS controller..."

Anyway, apart from that

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers!

