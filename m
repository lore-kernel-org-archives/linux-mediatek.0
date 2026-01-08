Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7B9CF6A89
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jan 2026 09:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8k/b4lMLPWGH11i0DzNrq/NFtMO6sqZ/qkQdoh6+9Ys=; b=AH8sLVVvHoyVsRsdOey4nhkS9Z
	n6A1nzwccZEpnCvz/Mm4tKLrJB2umCURZmN6LFMeVea37ArSAYIgSI/My06AjiJU+zx0i5q5hWCDX
	J3A1hj904lKXW4wl2LufAEseMpazLf2R+CBEnt0BWJlBFbYa9ef0hC0/ek2/OKQ759JIQD2yxBc9A
	UfCd9aAGiUupsW0LV+f2aBsncjl+hFxm4BeHwyBrrLuwf233B+Bf5MBgIZOguIIzmuE7/2QaxN6Ih
	RWTjOEgEydwfpMRpwXQv5Ul3TWfY8MrfBDldLngm+TDiQoe8o09viZXebM0aNhOgN7Yz46Fe/JKaB
	d5gumpQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdmLE-0000000GTIs-1MOm;
	Thu, 08 Jan 2026 09:30:04 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdmLB-0000000GTHU-2UXO;
	Thu, 08 Jan 2026 09:30:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767864598;
	bh=dsS5OrslEDAfTARqkmhtPqWZh6i14SkuduUVlsumjw8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WbEJJX9B2vP1Nh2AXNd1NpB5kxEfnWnK0SnvfAUSKpKF5vYa+7AyWaByWIqUlyNUQ
	 A4v6brnQfBoDxagJhcuZStBRU6nr9VRB1QK2xCL+fgCrgC3RTvSPYucmdmPjb5qUgS
	 JF/qG6ncT+KR+GwDYs29LrBJ3yCWKqMdz3Qdmhj3cevIUV/okig8ug9mlhecUn7hWJ
	 xButQ4sl0+Spld7LivqZtwIGrJV1LUcW6t/BE8GQOVlOIBu7z//p4m6YgimYsaWd5X
	 P9jkVL9FGys8MdaCeWSZWKcm84r7itBNvZB1SEst3oHjgX/OFbkrrlqmAfz1hti6Ht
	 yagpkGduh+cPg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2FE0E17E0CB0;
	Thu,  8 Jan 2026 10:29:58 +0100 (CET)
Message-ID: <5c798936-95be-4428-9c4e-251e1dff3001@collabora.com>
Date: Thu, 8 Jan 2026 10:29:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/13] dt-bindings: soc: mediatek: dvfsrc: Add support
 for MT8196
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Henry Chen <henryc.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Georgi Djakov <djakov@kernel.org>
References: <20251124-mt8196-dvfsrc-v2-0-d9c1334db9f3@collabora.com>
 <20251124-mt8196-dvfsrc-v2-1-d9c1334db9f3@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251124-mt8196-dvfsrc-v2-1-d9c1334db9f3@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_013001_857911_F5243945 
X-CRM114-Status: GOOD (  12.21  )
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

Il 24/11/25 12:06, Nicolas Frattaroli ha scritto:
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Add a compatible for the MediaTek MT8196 Chromebook SoC's
> DVFSRC hardware, introducing capability to communicate with it.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

dt maintainers, please, can anyone ack this patch so that I can pick it?

Thanks,
Angelo

> ---
>   .../devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml         | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml
> index 4c96d4917967..5673d242afcb 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml
> @@ -26,6 +26,7 @@ properties:
>             - mediatek,mt6893-dvfsrc
>             - mediatek,mt8183-dvfsrc
>             - mediatek,mt8195-dvfsrc
> +          - mediatek,mt8196-dvfsrc
>         - items:
>             - const: mediatek,mt8192-dvfsrc
>             - const: mediatek,mt8195-dvfsrc
> 



