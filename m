Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2AEC25B77
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 May 2024 21:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7+97L3pJ0jNczy11HE4Q5PE0VvBXT51LXzmUqQ8MUek=; b=QOlRa2mDyhBXBrMYaam/1ar9Dm
	apw//EiyuzB5l7bLR+EpD/xr0VrtMVWcFsAJd19fwTN09p9vGcL9oM8kCkpKaTvjv7bPiapR7tGgD
	/lFpKpJW936l4p5RW+KpBVLl/1jLXg1PvLNAgoRxFlJoTvvF0VMt4ZuiIV/XRXywdB+Ff+LteUHZP
	r59WqMxfYNeS8OjbRElSqVJKt7MDuJ+TQ8azA1XTjZpMxGcIM/vLIFQMquEPeMNDTkQ4DDiglDxVi
	mOmXMTdaI7v36puTxAkjLIlDKTrX4ildbTFqoxyDn7R1UUKensuXRa+7zHsY5X217VlCPAlupmSKW
	zeVObdlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9AEK-0000000FYUO-1CFO;
	Mon, 20 May 2024 21:07:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9AEG-0000000FYTG-1FrJ;
	Mon, 20 May 2024 21:07:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6944461DED;
	Mon, 20 May 2024 21:07:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D44D8C2BD10;
	Mon, 20 May 2024 21:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716239251;
	bh=X/NsTjluZhFUIdDleKVBp6yB9DdSZqAO99eq3Zz04l8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=COcLBCX11lfP8lavHY9s/toyqvSg0NurL5PdVAePq5mib/NEy463Muej/HOax+eLx
	 y8tUmti4dWfu3xUUT+aiN0V10wxnYLZfqx9/Kzft/yecuvlfWMcGGJS7dDETp4Nnj8
	 oVse2C/FFlqR3oqzMmYrRH5KxPD0iQV2czPJvL620Ch4JyYAVSibMURUAhvbSqboem
	 Ci/mnOigC+B/TR0Xqkvbdt19uMeQ6aXidSreVnfpI5Mh6mgKokpZxSIwcqp9pzYgBH
	 cl3QgPwYIGSdITwSDB8ClhtRg2cjspJ3W6Rfg7htOz20Qct3H+qHF4S504N971qnHD
	 yhFPwYQzEcTGw==
Date: Mon, 20 May 2024 16:07:29 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com, Nishanth Menon <nm@ti.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 3/8] dt-bindings: soc: intel: lgm-syscon: Move to
 dedicated schema
Message-ID: <20240520210729.GA1509114-robh@kernel.org>
References: <20240519-dt-bindings-mfd-syscon-split-v1-0-aaf996e2313a@linaro.org>
 <20240519-dt-bindings-mfd-syscon-split-v1-3-aaf996e2313a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240519-dt-bindings-mfd-syscon-split-v1-3-aaf996e2313a@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_140732_451540_488E348F 
X-CRM114-Status: GOOD (  19.68  )
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

On Sun, May 19, 2024 at 08:42:18PM +0200, Krzysztof Kozlowski wrote:
> intel,lgm-syscon is not a simple syscon device - it has children - thus
> it should be fully documented in its own binding.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Context might depend on
> https://lore.kernel.org/r/20240510123018.3902184-1-robh@kernel.org
> and also further patches here depend on this one.
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml  |  1 -
>  .../bindings/soc/intel/intel,lgm-syscon.yaml       | 53 ++++++++++++++++++++++
>  2 files changed, 53 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
> index 622ea0f1b08e..5a0aeae24a50 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -77,7 +77,6 @@ properties:
>                - hisilicon,pcie-sas-subctrl
>                - hisilicon,peri-subctrl
>                - hpe,gxp-sysreg
> -              - intel,lgm-syscon
>                - loongson,ls1b-syscon
>                - loongson,ls1c-syscon
>                - lsi,axxia-syscon
> diff --git a/Documentation/devicetree/bindings/soc/intel/intel,lgm-syscon.yaml b/Documentation/devicetree/bindings/soc/intel/intel,lgm-syscon.yaml
> new file mode 100644
> index 000000000000..aa8d24074fd7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/intel/intel,lgm-syscon.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/intel/intel,lgm-syscon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Intel Lightning Mountain(LGM) Syscon
> +
> +maintainers:
> +  - Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: intel,lgm-syscon
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1

Should have ranges.

> +
> +patternProperties:
> +  "^emmc-phy@[0-9a-f]+$":
> +    $ref: /schemas/phy/intel,lgm-emmc-phy.yaml#
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    chiptop@e0200000 {
> +        compatible = "intel,lgm-syscon", "syscon";
> +        reg = <0xe0200000 0x100>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        emmc-phy@a8 {
> +            compatible = "intel,lgm-emmc-phy";
> +            reg = <0x00a8 0x10>;
> +            clocks = <&emmc>;
> +            #phy-cells = <0>;
> +        };
> +    };
> 
> -- 
> 2.43.0
> 

