Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951CEC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 12:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sSghDZ5FSiaszAS8BX9khqn8uyqeof1kpcu8hEWrflc=; b=l4oEfU3bhnuGYdXPovOGu2i1HT
	+B9AuXSa0yIcrMn/xPJE+MQnykgCHHD5BTHO/OkCl5tu054PbAX45M30pASRqS+T9LySX9XD3o0A3
	KHVCEh2noHilD41ST+xl8+7kInJmPVsBVZbXvXc1CuIP/1V2ezY95Y6LS7KzD+9s8TrjGZn1uj3bO
	YevE1Pvoo6so0gI+tsyPrSCHRDoyeVXJHPLlksltMZvN24YBOl0Y2koEyej6lLyioYBsPa/2oYRO/
	FaQzEsktQUtQ+Hnxe6JUnKHMwRJNABO03pMUw1Llr5XatAKYY0CA40dvSnKj/Qoxn2/qAAVxN4zbm
	G5O3V51g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogQ04-002H76-4y; Thu, 06 Oct 2022 12:29:16 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogPz9-002GcD-OT; Thu, 06 Oct 2022 12:28:21 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BFF5566022FF;
	Thu,  6 Oct 2022 13:28:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665059298;
	bh=8Sr8yw+JBOQAiJk8C/U+JAHoxicfODTLrAVUrwfiToA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FN7s/832T+Xb+BqbvBlLY1QZKyUAOA8qjB0zl55D7jqCKQQVA180V2D0uSVhdq93H
	 F+uEIX4Ky13l9J8RVJlNM6AvqamuTRwXRTRauGaStR4a9ET4iZQb1z0pd6paOkjFlL
	 O2onoYr3/FPKPkCXumM/TOQrUcR/bQyBnsrJ05AnatrctQmi0qgsXVI6xvLHKABYKd
	 edJ2I+XtXTqe3MSiBy35MIOGfeFTrWo3pBvmwd6y/+kFGamssbZ/fpQRK+arsvI+3c
	 JOEt3QnnQqu6NL7gRolxLV6rqR0dhMNffEngkEU4raaR3tHoN3MaAJVbyhvVnzZGcr
	 8PMqFnVpjLrzw==
Message-ID: <579c8387-ba4b-22d1-79a6-5cff94769fb5@collabora.com>
Date: Thu, 6 Oct 2022 14:28:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 0/8] MediaTek watchdog: Convert mtk-wdt.txt to dt-schema
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 nfraprado@collabora.com
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20221006120715.24815-1-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221006120715.24815-1-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_052819_979130_8643B781 
X-CRM114-Status: GOOD (  14.26  )
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

Il 06/10/22 14:07, Allen-KH Cheng ha scritto:
> Based on tag: next-20221006 linux-next/master, We use [1] and [2] as
> references to send a new series.
> 

For me, it's all good to go. Thanks for respinning that series.

Cheers!
Angelo

> This series converts mtk-wdt.txt to dt-schema and contains
>   - Fix watchdog compatibles for MT8186, MT7986 and MT8195,
>   - Fix the watchdog name of mt8516
>   - Add mt6795 and MT8173 watchdog compatible
>   - Add support for toprgu reset on the MediaTek Helio X10 MT6795 SoC.
> 
> Changes since [1]:
>   - Drop "timeout-sec: true" and use unevaluatedProperties
> 
> [1] https://lore.kernel.org/all/20221005113517.70628-1-angelogioacchino.delregno@collabora.com/
> [2] https://lore.kernel.org/all/20220422121017.23920-3-allen-kh.cheng@mediatek.com/
> 
> Allen-KH Cheng (3):
>    arm64: dts: mediatek: mt7986: Fix watchdog compatible
>    arm64: dts: mediatek: mt8516: Fix the watchdog node name
>    dt-bindings: watchdog: mediatek,mtk-wdt: Add compatible for MT8173
> 
> AngeloGioacchino Del Regno (5):
>    arm64: dts: mediatek: mt8186: Fix watchdog compatible
>    arm64: dts: mediatek: mt8195: Fix watchdog compatible
>    dt-bindings: watchdog: mediatek: Convert mtk-wdt to json-schema
>    dt-bindings: watchdog: mediatek,mtk-wdt: Add compatible for MT6795
>    watchdog: mtk_wdt: Add support for MT6795 Helio X10 watchdog and
>      toprgu
> 
>   .../bindings/watchdog/mediatek,mtk-wdt.yaml   | 80 +++++++++++++++++++
>   .../devicetree/bindings/watchdog/mtk-wdt.txt  | 42 ----------
>   arch/arm64/boot/dts/mediatek/mt7986a.dtsi     |  3 +-
>   arch/arm64/boot/dts/mediatek/mt8186.dtsi      |  3 +-
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  3 +-
>   arch/arm64/boot/dts/mediatek/mt8516.dtsi      |  2 +-
>   drivers/watchdog/mtk_wdt.c                    |  6 ++
>   7 files changed, 90 insertions(+), 49 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
>   delete mode 100644 Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> 


