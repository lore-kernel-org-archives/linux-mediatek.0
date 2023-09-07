Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F2FEE14D4
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Sep 2023 09:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uc8KVN8KgZ6EPIB8WjaVdf2jzIUXma1kDhKCxRnvlNQ=; b=wk9rawBkXlPC2N1giIn8jFbpDA
	9MnuHjVfx6mazQcHHm5YnOlVECbMJlvK50of+78oU22ZswqFKgVfPgPGzEWFub25lOBd7VJL7nKq0
	uhCqODXYIysWy+rOCV4qWHxpnWFUonKOlCWdAIjV9/gchFAa2dC4XUEduwNK7yu36u/94gtOHdlXu
	ByyizDphHNXIPB5ame9gRqzfT5u8rY4o0b9klI1oSFjdCAK0R9K1lYtU6ReYrwPO8o8ii4nHUTxCg
	1kc0zlVutPQ69DB9gsODJ+YYqxiKEAXXRu8OclO57h9RyaVUZ24NRyPD6Kb882WHmr1Umi5JMLXK/
	InwDJZwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeB6b-00BfHz-2G;
	Thu, 07 Sep 2023 09:15:17 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeB6Z-00BfHG-0O;
	Thu, 07 Sep 2023 09:15:16 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 128E466072EE;
	Thu,  7 Sep 2023 10:15:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694078113;
	bh=Rxr9wSnatrcikI+JJAyDpY5hrb72I1tP/ucCHPKp+4U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oAnhasf8H14BX1NPjT3BsrDvEucrf2ZGAoLRd5zQlOXr2R0oZIJjohj6HyskepAZO
	 Y2CLeVG9KcJ2d641YVHNYos39QTXEJOQkclRgbDNhxuBSMkQcamneh5PUmIXF+0vuJ
	 o9KbG1RvRDyJLh/4RJ9VB0bTM240n1lUcoLAIe0iuQrkgGq0vNZC7GFupZHUPZeYmp
	 lHQoVPQYl+B9+YPIUUIZDq1Cy3K6XIu/ePkByJXIN/CxpHv2GExeT35w0BMlCZpsoc
	 WbAgNLd3wGJDhH/5s2ljSs5qYw0z87wfXz+opNESPPgUHCoKrLSzN8LxUyyLqdX9Ye
	 52ifx7/NZ5jYg==
Message-ID: <99510f2c-82cb-a3ed-764f-9411a16cac09@collabora.com>
Date: Thu, 7 Sep 2023 11:15:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 1/2] arm64: dts: mediatek: mt8195-demo: fix the memory
 size to 8GB
Content-Language: en-US
To: Macpaul Lin <macpaul.lin@mediatek.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Fabien Parent <fparent@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, stable@vger.kernel.org
References: <20230825114623.16884-1-macpaul.lin@mediatek.com>
 <20230905034511.11232-1-macpaul.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230905034511.11232-1-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_021515_287984_3A66A005 
X-CRM114-Status: GOOD (  15.90  )
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

Il 05/09/23 05:45, Macpaul Lin ha scritto:
> The onboard dram of mt8195-demo board is 8GB.
> 
> Cc: stable@vger.kernel.org      # 6.1, 6.4, 6.5
> Fixes: 6147314aeedc ("arm64: dts: mediatek: Add device-tree for MT8195 Demo board")
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Changes for v2:
> Changes for v3:
>   - No change.
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> index b2485ddfd33b..ff363ab925e9 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> @@ -48,7 +48,7 @@
>   
>   	memory@40000000 {
>   		device_type = "memory";
> -		reg = <0 0x40000000 0 0x80000000>;
> +		reg = <0 0x40000000 0x2 0x00000000>;
>   	};
>   
>   	reserved-memory {


