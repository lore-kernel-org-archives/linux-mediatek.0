Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE49EC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Nov 2022 09:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NhaAoMbJhGQMnMhdyosjIQZJTrE7LNn7NxDqAdkTKn8=; b=tp2m51y5WUks/btFs536DEN7dr
	1l04grB1incwPwHkE/eyB9q767HAx5yb3o4PPz2GXrWhZR4MR6/ngOTrAg7p2noN6WuX9ZVWDjNET
	FBuVb7a9jlxlzaCuOYrDoxy+QUfr2QYmk5hRymHvWsXDFAIogLY570w1ch9EvDjCM4ubIe5JH0lj0
	jHSq/tNknZpuXEyUTtOI+lcrF+nZC7klDeQxB2KIHpBxX+qlcm2jBPv7a02LukYnuu6K0nNpZu4F0
	tCL9xv4BQqHC3iogkgl3Iqr9RITqfNg2MNVRhfJ8PY75CHd918eOJ+Nx5G2FgxiqzCdDwO91nggTK
	QPThg6tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0JME-00F02W-Dy; Wed, 30 Nov 2022 09:26:22 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0JJs-00Eymf-Ed; Wed, 30 Nov 2022 09:23:58 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7DB6D660036C;
	Wed, 30 Nov 2022 09:23:53 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669800234;
	bh=b/rlfin9Tu9Zg934405VE93p9gBOHlJBLcSBvPpyPXY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TU92YAgRkOWnyIP3bvJqgwHT2x7OsuuBfGtxWnADsoddRRL8dVNwSOLIIq9iXGClu
	 ZDyOpAR+4FH4w9JKcC44yCrAf4ixqxqnVDX5y+K75zqEWqfKgMip80ugRc6dDiETe/
	 9zWuM7Na3x2jr/eQrOfmVK2+5Thg9HnFJ3w8hjUdULKHkDeHnNCs4Az1H4oJ0WlWNV
	 UqX5DNxYmvAdcMmXYji0csNn9FYeBB0kM0zF4/9R/meuF9UXgo41Z+kOdQciVMRs4q
	 yRajDFgWP2KaE6U/ctk5oMmNuB6ojJs5YGZigiTQW8HaZtO0YFNUeeqAjuRxQ/FBV2
	 DBUYJpgsDmQEg==
Message-ID: <a1c556de-a9a4-5f90-1c46-a9e54daf463b@collabora.com>
Date: Wed, 30 Nov 2022 10:23:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 2/6] dt-bindings: mediatek: modify VDOSYS0 mmsys device
 tree Documentations for MT8188
Content-Language: en-US
To: "nathan.lu" <nathan.lu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: "jason-jh . lin" <jason-jh.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, lancelot.wu@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221129143503.16638-1-nathan.lu@mediatek.com>
 <20221129143503.16638-3-nathan.lu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221129143503.16638-3-nathan.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_012356_755700_A1D3EF40 
X-CRM114-Status: GOOD (  14.44  )
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

Il 29/11/22 15:34, nathan.lu ha scritto:
> From: Nathan Lu <nathan.lu@mediatek.com>
> 
> modify VDOSYS0 mmsys device tree Documentations for MT8188.
> 
> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
> ---
>   .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml      | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index 0711f1834fbd..3e7fb33201c5 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -47,6 +47,10 @@ properties:
>             - const: mediatek,mt2701-mmsys
>             - const: syscon
>   
> +      - items:
> +          - const: mediatek,mt8188-vdosys0

The devicetree node will be like:
	something: something@somewhere {
		compatible = "mediatek,mt8188-vdosys0", "syscon";
		....
	};

....and will never get any additional compatible string, as when you'll add
vdosys1 support, we'll get a similar node like:

	something_else: something_else@somewhere_else {
		comaptible = "mediatek,mt8188-vdosys1", "syscon";
		....
	};

...so this should go upper in the enum that's listing all of the
mediatek,mtXXXX-mmsys compatibles, specifically after `mediatek,mt8186-mmsys`.

Please fix.

Regards,
Angelo


