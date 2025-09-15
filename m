Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C44EECA101F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Sep 2025 07:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PVQnY6XPvZiTTyzyocltrSXRv7+9/Cwb/NOm/NT7nzQ=; b=YyG5bxifbNnppEMlMRuBU/V5JI
	hDjFgge3ixC/z0yVRE3F01xmzpNcHwnShYy7wZoiADtm9JLUpG4ekTmO2hmmHVhBwj4YiAb1NCNCE
	XfhQHycBZ+i1fmF9RfnoxoE/Vvjb0mmQLRjn00hLi5lHdX3zFRZRCorf9Rvsv3upunfrTeluAUv3K
	2F3kj8BirYf3+XYNaEX6eK1fH/3udqgtqSqz7cuIssmW7EIrVE+EnyuCx5yuzrFKcVwU7BFft3Gpx
	01mhc5nuscrLXIRR4VsgVn23Hm8guoaUHFLTrO75dTPLXIi2xUF8c68EjREXDPZDzcFtY0qYMyEHS
	VN1nN9wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy3e2-000000033da-3cSt;
	Mon, 15 Sep 2025 07:29:02 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy3dz-000000033c9-1ssZ;
	Mon, 15 Sep 2025 07:29:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757921337;
	bh=GXEPazfaV4yHZLRavKhdyKStvO3E/DjBkytTjtx7oYc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LfDSNl+VFT3HhTIWTMkRiyNe781kVDlIlyWFraoYz0tlEIfTvGX1/ULcCrKlXvOoh
	 Ywjaz2qMjH24AyXSe5b8qNWWgwHLvVUKC7WYG52ku74vFv7CtdYLj1uLsT3KBD+AHe
	 13xsGCqvephqcHESgMgHNU4Oie2mNy1bWPwfL9GTZKhE8FgwYyqoA34QzVbfsycetB
	 0dumOr/X9ie8215pyMubkphHrfjASAzvEOHm8udMCXST6Dh9HPTuS4Hyv+p0NS2o6H
	 r8eJuiZd3P/q1M5BAiJDssxFAcH6iY3al1w06QfezBf9zqtFQkuEDpwdMN3q7Q2Yz6
	 sGf99VFaO+3Qg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F36D317E0AC3;
	Mon, 15 Sep 2025 09:28:56 +0200 (CEST)
Message-ID: <7bacf8ca-4ec4-4b06-b989-52e287a812d8@collabora.com>
Date: Mon, 15 Sep 2025 09:28:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: pinctrl: mediatek: Document MT6878
 pin controller bindings
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250914-mt6878-pinctrl-support-v2-0-254731aa3fc2@mentallysanemainliners.org>
 <20250914-mt6878-pinctrl-support-v2-1-254731aa3fc2@mentallysanemainliners.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250914-mt6878-pinctrl-support-v2-1-254731aa3fc2@mentallysanemainliners.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_002859_643928_C84287E5 
X-CRM114-Status: GOOD (  15.60  )
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

Il 14/09/25 16:51, Igor Belwon ha scritto:
> Add device-tree bindings for the pin controller and the EINT controller
> found in the MediaTek MT6878 SoC.
> 
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
> ---
>   .../bindings/pinctrl/mediatek,mt6878-pinctrl.yaml  | 210 +++++++++++++++++++++
>   1 file changed, 210 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6878-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6878-pinctrl.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..f320d286ad2155bc4aa449c195ddff3a8686204c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6878-pinctrl.yaml
> @@ -0,0 +1,210 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/mediatek,mt6878-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6878 Pin Controller
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +  - Igor Belwon <igor.belwon@mentallysanemainliners.org>
> +
> +description:
> +  The MediaTek MT6878 Pin controller is used to control SoC pins.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6878-pinctrl
> +
> +  reg:
> +    items:
> +      - description: pin controller base
> +      - description: bl group IO
> +      - description: bm group IO
> +      - description: br group IO
> +      - description: bl1 group IO
> +      - description: br1 group IO
> +      - description: lm group IO
> +      - description: lt group IO
> +      - description: rm group IO
> +      - description: rt group IO
> +      - description: EINT controller E block
> +      - description: EINT controller S block
> +      - description: EINT controller W block
> +      - description: EINT controller C block
> +
> +  reg-names:
> +    items:
> +      - const: base
> +      - const: bl
> +      - const: bm
> +      - const: br
> +      - const: bl1
> +      - const: br1
> +      - const: lm
> +      - const: lt
> +      - const: rm
> +      - const: rt
> +      - const: eint-e
> +      - const: eint-s
> +      - const: eint-w
> +      - const: eint-c
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    description:
> +      Number of cells in GPIO specifier. Since the generic GPIO binding is used,
> +      the amount of cells must be specified as 2. See the below mentioned gpio
> +      binding representation for description of particular cells.
> +    const: 2
> +
> +  gpio-ranges:
> +    maxItems: 1
> +
> +  gpio-line-names: true

Krzysztof asked you to restrict the maximum number of gpio-line-names if I
remember correctly, you forgot to do so :-)

Cheers,
Angelo


