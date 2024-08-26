Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C42C5321E
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Aug 2024 15:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PRU0+c0CHEt4VPCU4Vn3s4mL4zloi3iJUzYHX1hL90s=; b=jPz6P9TpVRMM7HKwmlAKtDv3L2
	sGbfKesVsdVrN3aq3HHuSEN7UAShAlunZdTCI1CGEDsqCc+Q3CB7QSo4Y9wnbBeeG5NsMtd+KtPXz
	5N6hjyIsXAY1wHCwxFX5vg0kE1vQtuM6bciaUGWAmYmZD40AyfAflSfe8h/KuIGoUViiFpWeksnBo
	jmt8cLwco6vow0oC1x7iHp+h3r1Jx359mKv9UKqStElXOL+NDELgiEMqqdWANoQ8/IXcI4LLRN9/i
	P/T3dz0CTCQ1CC9gf68tJNeBFZQCdW2zLps+oRU3QEmtFE+DJHfEP6S435xLp/vTubbB3okOUCvk0
	0dpGmilg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sic2K-00000007tbm-0T1w;
	Mon, 26 Aug 2024 15:53:44 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sic19-00000007tPz-0a41;
	Mon, 26 Aug 2024 15:52:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1EE98A41437;
	Mon, 26 Aug 2024 15:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42C43C52FC6;
	Mon, 26 Aug 2024 15:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724687124;
	bh=CfjXIIFwVytbq3DboLG6ZBWEAA+dSeHjisriqW8r0BE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=htMdAFLsy/VWzrv7KZVdB83Fj8TsnzeXUCuS9+1biIW6Kz7P8Dh4rwbfWNSqJJqre
	 Q1MZP6OCv9ymTfXGiisyVBc+61y6NAxzsv6wDxYFf5QOVk3E6F1SdlnZlTgnLyvLUk
	 xGhaNHFVHg41UQPJVCIlCt9x7T8c8vEm6euiuW1Ji+u2wjGKZj5Z1k6YJKd8iilFou
	 5mWQxV/v0ThrpnBGxODG0RJYZn8GV2MSa4PwDuybSumLl0NoB9uxXYUWMGxjeBCins
	 b3mdgVqy03FfugQveIMy1T9NJUxZZFqEhPXLI8ecrU6Pea4SGSpIWZOmz7VUrzxLkd
	 hGAtk1fD1/VbQ==
Message-ID: <39a2971d-8776-4e5f-8d72-ae447ea88362@kernel.org>
Date: Mon, 26 Aug 2024 17:45:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mfd: mediatek,mt6357: Fixup reference to
 pwrap node
To: Macpaul Lin <macpaul.lin@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Alexandre Mergnat <amergnat@baylibre.com>, Flora Fu <flora.fu@mediatek.com>
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>,
 Chris-qj chen <chris-qj.chen@mediatek.com>,
 MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20240826065415.19641-1-macpaul.lin@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240826065415.19641-1-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_085231_308935_516635EB 
X-CRM114-Status: GOOD (  21.22  )
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

On 26/08/2024 08:54, Macpaul Lin wrote:
> The mt6357 is a subnode of pwrap node. Previously, the documentation
> only included a note in the description of mt6357. This change adds the
> appropriate $ref for pwrap to ensure clarity and correctness.

Heh? The schema described mt6357, not pwrap. Why are you changing it?

> 
>   $ref: /schemas/soc/mediatek/mediatek,pwrap.yaml
> 
> Additionally, the indentation for the pmic section has been adjusted
> to match the corresponding structure.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  .../bindings/mfd/mediatek,mt6357.yaml         | 124 +++++++++---------
>  1 file changed, 65 insertions(+), 59 deletions(-)
> 
> Changes for v1:
>  - This patch has been made based on linux-next/master branch.
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
> index b67fbe0..5f4f540 100644
> --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
> @@ -22,69 +22,75 @@ description: |
>  
>    It is interfaced to host controller using SPI interface by a proprietary hardware
>    called PMIC wrapper or pwrap. This MFD is a child device of pwrap.
> -  See the following for pwrap node definitions:
> -  Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
>  
>  properties:
> -  compatible:
> -    const: mediatek,mt6357

How does this schema is being selected without compatible?

> -
> -  interrupts:
> -    maxItems: 1
> -
> -  interrupt-controller: true
> -
> -  "#interrupt-cells":
> -    const: 2
> -
> -  mediatek,hp-pull-down:
> -    description:
> -      Earphone driver positive output stage short to
> -      the audio reference ground.
> -    type: boolean
> -
> -  mediatek,micbias0-microvolt:
> -    description: Selects MIC Bias 0 output voltage.
> -    enum: [1700000, 1800000, 1900000, 2000000,
> -           2100000, 2500000, 2600000, 2700000]
> -    default: 1700000
> -
> -  mediatek,micbias1-microvolt:
> -    description: Selects MIC Bias 1 output voltage.
> -    enum: [1700000, 1800000, 1900000, 2000000,
> -           2100000, 2500000, 2600000, 2700000]
> -    default: 1700000
> -
> -  regulators:
> -    type: object
> -    $ref: /schemas/regulator/mediatek,mt6357-regulator.yaml
> -    unevaluatedProperties: false
> -    description:
> -      List of MT6357 BUCKs and LDOs regulators.
> -
> -  rtc:
> +  pwrap:

With the diff it is tricky to say what you are doing, but it feels
wrong. I don't understand the rationale, the problem being fixed here,
and considering unusual diff, this just looks wrong approach.

Bindings do not work like that - you do not reference the parent inside
the child. There is nowhere example for that, so I have no clue how did
you come up with it.

Best regards,
Krzysztof


