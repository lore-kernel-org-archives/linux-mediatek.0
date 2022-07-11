Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA98EC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jul 2022 10:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mMJKYMhHp7z2R/w6kxTtG5YFj+inen2wTWcKTCJ9fME=; b=VLFQpukQBoNZ1z78fWGvSpPqey
	qoTdBiRQDBHhLcEguJ481ey+FtCQGZyzQ1BS8cox95jGv3lkUsFfGZ2hrTDF6NAzNeyRraJpAg9MS
	B652gZZUke7pFoNBIk+GtEyMEiyLMXIC6xdNGmllVh3H1gRdTd7MyJBJfbOZDc3vf8gd6s/CX4oh8
	ReWetL3hSBth7EuwZ9cniwdsc6dufmn6S3T9iZRkta9h+dX+2s2zmr5k8cTLbPzD4ivmR68Wpisnn
	RnCwQoo+s5FR6F3w1L7ImwQB7Jt5PdSkmbByO2rrEKZz3Bd7pUXCtjG8QzM4GHcezECSFvnyapJkP
	4a0ZgS+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAqYf-000cxC-F6; Mon, 11 Jul 2022 10:22:29 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAqYU-000cue-Oe; Mon, 11 Jul 2022 10:22:20 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8B37F66016BD;
	Mon, 11 Jul 2022 11:22:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657534937;
	bh=bV1U1DKxcTKTqjYlyMTELSAITeuujTusjiLSnU/9yrk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A3Ctq1Zv7iQhRS2oUxLijFF7IVoJOUbMbnxuZHcVXamHBLfWA5JfUvbCkS3uMeQ2F
	 WjopG6tuVqOuQ4uMP717PNpVIJfYhmGOMgvohPGXZNAwIdJO6j4mXfF1tmNoz2swe3
	 MKiBG1tn6+qIht/QdjN5UiSk8XOwC1ZLmFgnFa0wanPNy3RsdKYfazh8L+cafylqCV
	 BInt4sdtrFy0K8EmrMmwCo/NkZPNvo4uANvcAFUT38ApezenUQ1RkTWVFg6WUmbbpM
	 VkAsRiUguleEZqvQ57aLU8q4kJyT/rGuXwxJqedDYOFYBfBS/hBouoHEltUrhOj/aM
	 BoVke4fYmuKEA==
Message-ID: <4f6fbc6e-fb9f-588a-41f9-30a0e0107526@collabora.com>
Date: Mon, 11 Jul 2022 12:22:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V3 2/2] dt-bindings: mediatek: Add axi clock in mt8173 dts
 example
Content-Language: en-US
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, bin.zhang@mediatek.com,
 benliang.zhao@mediatek.com, linux-mediatek@lists.infradead.org
References: <20220708021548.21453-1-xiangsheng.hou@mediatek.com>
 <20220708021548.21453-3-xiangsheng.hou@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220708021548.21453-3-xiangsheng.hou@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_032218_958748_C8C5D2E1 
X-CRM114-Status: GOOD (  14.48  )
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

Il 08/07/22 04:15, Xiangsheng Hou ha scritto:
> For mt8173, it is needed to add the axi clock for dma mode.
> 
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> ---
>   .../devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml         | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
> index 41e60fe4b09f..413b907eecf5 100644
> --- a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
> +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
> @@ -82,8 +82,8 @@ examples:
>           compatible = "mediatek,mt8173-nor";
>           reg = <0 0x1100d000 0 0xe0>;
>           interrupts = <1>;
> -        clocks = <&pericfg CLK_PERI_SPI>, <&topckgen CLK_TOP_SPINFI_IFR_SEL>;
> -        clock-names = "spi", "sf";
> +        clocks = <&pericfg CLK_PERI_SPI>, <&topckgen CLK_TOP_SPINFI_IFR_SEL>, <&pericfg CLK_PERI_NFI>;

This is going over 100 columns, which is too many.
Please fix.

> +        clock-names = "spi", "sf", "axi";
>           #address-cells = <1>;
>           #size-cells = <0>;
>   
> 


