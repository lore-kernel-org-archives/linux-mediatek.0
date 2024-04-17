Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E4F6C4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 14:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cibZGXTOJWydSrp5g9OPR9vx3KfXG1TNCAJkgEkHfo8=; b=XnTvTBuXIinTe2QiLSNnJ5s85g
	xUQ9vbr3ZQ2lP8YYXRtvZZAimrx8YJdcSMV1Mic9gZzYbW3wnkyuuPtdtGQmKCECjbjyoCZW0f5t+
	8dtDfv0zEfHUJgzgU2lSLbyhy7mM+9JC/owGCbasz3Jsu75aRhSAA7g1Svb6tZE3MnsVMNN97MUuK
	CPBRNNERuxD5Y7zQTPjyW1PznFIQUbGnVKoAezJ3o77NDGc4DX6GJozM9qaC/fpB6mmI60+HF2L+/
	1SMXZ5ayUavTvbrHoopS8wTZAJDQwNiTvheL+2OzUfBfqlkC3hFwiozqRfsU5b43LGWtOqToijgLC
	RdLxlpjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx6eW-0000000GS0i-0NGr;
	Wed, 17 Apr 2024 14:52:48 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx6eS-0000000GRzF-2cpi;
	Wed, 17 Apr 2024 14:52:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 84715CE13B3;
	Wed, 17 Apr 2024 14:52:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 263C9C072AA;
	Wed, 17 Apr 2024 14:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713365560;
	bh=N/Kc5Ck+n/MV7oq1Wn9zhitTGVylQb+Utd6qvo1Q1h8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g49HwvnDCP5I3WlHXrUM9ilJmC/qjtLqO8tAWQY/bZuYUZ94xZPW9ZfDZpfbeWuMc
	 v5jixX2SwPc4JgOXF43vI8bkftCCt+Rjr5GuKq4hzSasSgfY2RLx/y+7yWD4xR6arl
	 ELlsthg5adF+JAciW1xRuF2DThehy6OYCIPkWuoJvkAZZlzFOByp7/PoISevfQBpWi
	 9ikMpLYwWiyaNPVFBjCvuDMMqWhOJW1WnF7xjcVg06G+s4ZLlxzp6on607hp9j6RAo
	 IpRweKiynWVjHsJ75Cye0CVyC/VJaZOwXO5jwi77a76C4WU7aK1OT1gEwmtG0qwZim
	 5kcb95YqrbUhw==
Date: Wed, 17 Apr 2024 09:52:38 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: djakov@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com, lgirdwood@gmail.com,
	broonie@kernel.org, keescook@chromium.org, gustavoars@kernel.org,
	henryc.chen@mediatek.com, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com,
	wenst@chromium.org, amergnat@baylibre.com
Subject: Re: [PATCH v2 1/7] dt-bindings: regulator: Add bindings for MediaTek
 DVFSRC Regulators
Message-ID: <20240417145238.GA2348962-robh@kernel.org>
References: <20240417091442.170505-1-angelogioacchino.delregno@collabora.com>
 <20240417091442.170505-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240417091442.170505-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_075245_059396_0D81F83C 
X-CRM114-Status: GOOD (  18.45  )
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

On Wed, Apr 17, 2024 at 11:14:36AM +0200, AngeloGioacchino Del Regno wrote:
> The Dynamic Voltage and Frequency Scaling Resource Collector Regulators
> are controlled with votes to the DVFSRC hardware.
> 
> This adds support for the regulators found in MT6873, MT8183, MT8192
> and MT8195 SoCs.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../mediatek,mt6873-dvfsrc-regulator.yaml     | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml
> 
> diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml
> new file mode 100644
> index 000000000000..446f1dab4d2e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/mediatek,mt6873-dvfsrc-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek DVFSRC-controlled Regulators
> +
> +description:
> +  The Dynamic Voltage and Frequency Scaling Resource Collector Regulators
> +  are controlled with votes to the DVFSRC hardware.
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt6873-dvfsrc-regulator
> +      - mediatek,mt8183-dvfsrc-regulator
> +      - mediatek,mt8192-dvfsrc-regulator
> +      - mediatek,mt8195-dvfsrc-regulator
> +
> +  reg:
> +    maxItems: 1
> +
> +  dvfsrc-vcore:
> +    description: DVFSRC-controlled SoC Vcore regulator
> +    $ref: regulator.yaml#

       unevaluatedProperties: false

> +
> +  dvfsrc-vscp:
> +    description: DVFSRC-controlled System Control Processor regulator
> +    $ref: regulator.yaml#

ditto

> +
> +required:
> +  - compatible

'reg' is never optional. And how is no regulators at all valid?

> +
> +additionalProperties: false
> +
> +examples:
> +  - |

Drop the example here. Just one complete example in the MFD doc.

> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        system-controller@10012000 {
> +            compatible = "mediatek,mt8195-dvfsrc";
> +            reg = <0 0x10012000 0 0x1000>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            regulators@0 {
> +                compatible = "mediatek,mt8195-dvfsrc-regulator";
> +                reg = <0>;

What does 'reg' value represent here? 0 and 1 seem pretty much made up.

> +
> +                dvfsrc_vcore: dvfsrc-vcore {
> +                        regulator-name = "dvfsrc-vcore";
> +                        regulator-min-microvolt = <550000>;
> +                        regulator-max-microvolt = <750000>;
> +                        regulator-always-on;
> +                };
> +
> +                dvfsrc_vscp: dvfsrc-vscp {
> +                        regulator-name = "dvfsrc-vscp";
> +                        regulator-min-microvolt = <550000>;
> +                        regulator-max-microvolt = <750000>;
> +                        regulator-always-on;
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.44.0
> 

