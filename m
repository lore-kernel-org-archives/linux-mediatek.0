Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5859C64ED6
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Feb 2023 09:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WCRdBMPhspkb50DfIiuS8L7QiDlIoUaSCc2hzodthAA=; b=oh2AbzIICNv8MPC1a61Uw4AgEr
	P6HWS+Z2bYyzmMonc6R5iSYChPuoRcMXrRC3XndbOlWyVFW0a9Ph+xSgXXSukHMUEzdxkpjcg0Azr
	VWHQtZu7OLTmH3t421gbHgaFpYm5zdhkyUBBpw784CB6mtC9Mrj4E3Xdnk7wHEd5g/VYcAPAgKwsl
	YREFsqRCPXCLhqhr6eOUejytSiL5iztqXQ0iu+5ckRyNutBeAExQoty7RDZoFojQ/l8ikZM9WABTq
	f8yAYS+IzZkKrRUtut70t87ndK9yFx3D52Y5FmFbPz8exh6EmjKx5qyLD4Su+8G0P7JyVzbc3tiKf
	yd60Xv6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWZtd-009350-4K; Mon, 27 Feb 2023 09:34:13 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWZtR-00930w-8r; Mon, 27 Feb 2023 09:34:02 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 75C83660230B;
	Mon, 27 Feb 2023 09:33:59 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677490440;
	bh=6bITMM3X7ops1Eqv9YJjvYqu6g9ES8OyVqIhPepYAyY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A5tSYQzqp1GDoBnUX1PXYd9QDAOAx/1ctN2hVVeFbNZQ7XU//LUFDfVrUdQpfzWLP
	 BZUT63p1GPQg44HZ/KLQhM857gs2jBn3uQVnmAieczl1Fk1oE7gvucRUha8eYdruIW
	 dwHiLVnf0Kz+FL+KMFUa7k3+7uPuN+DAfytbrmNYVujgfD75jGjjQvIviK+xQK8TZw
	 qH4fFVrVPgJx9GbPB1SqkhcOm6WOPqLsqA5FBlTOKsFn1WF5gbwp7p/nVUMzRBApzV
	 WycZmIoR1Ht7VCiEUawY1lx/WQFgzAWW5d0y2679zL8J/wCEXhXDSxGGrx2U+G1aEe
	 z1eQI5UkkpcLg==
Message-ID: <d7f02983-121d-b2f6-c208-9b55d7150c80@collabora.com>
Date: Mon, 27 Feb 2023 10:33:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/3] dt-bindings: soc: mediatek: scpsys: Document MT6735
 SCPSYS compatible string
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230225101629.264206-1-y.oudjana@protonmail.com>
 <20230225101629.264206-3-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230225101629.264206-3-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_013401_479580_D08799EB 
X-CRM114-Status: GOOD (  14.57  )
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

Il 25/02/23 11:16, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add a compatible string for MT6735 SCPSYS.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>   Documentation/devicetree/bindings/soc/mediatek/scpsys.txt | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt b/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
> index 2bc367793aec..54ba2e06403a 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
> +++ b/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
> @@ -10,6 +10,7 @@ domain control.
>   The driver implements the Generic PM domain bindings described in
>   power/power-domain.yaml. It provides the power domains defined in
>   - include/dt-bindings/power/mt8173-power.h
> +- include/dt-bindings/power/mediatek,mt6735-scpsys.h
>   - include/dt-bindings/power/mt6797-power.h
>   - include/dt-bindings/power/mt6765-power.h
>   - include/dt-bindings/power/mt2701-power.h
> @@ -20,6 +21,7 @@ Required properties:
>   - compatible: Should be one of:
>   	- "mediatek,mt2701-scpsys"
>   	- "mediatek,mt2712-scpsys"
> +	- "mediatek,mt6735-scpsys"

NACK. Please implement in mtk-pm-domains instead.

>   	- "mediatek,mt6765-scpsys"
>   	- "mediatek,mt6797-scpsys"
>   	- "mediatek,mt7622-scpsys"


