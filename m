Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA39C4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Apr 2024 09:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lHRRkLsMlOwFWL+fphxzHAcv5DSo13fAAWpulDI4Li0=; b=lPF3jQV2Aeee8P7uufQtKQM5ut
	vAa3VjTwZLZQhPjIuCLKoFYH/J1u9nsAKDU4LhTFPFKIpD07JOuRxGaXQdiyckO0eqbpJqP8ElAln
	fvsvzU24pNafyo5/9fOWFMykIEt1xkJ079thPgRuYzFZw+K5NM2Bw8mGbl0wsu+ksAxZ1SU/58MYJ
	/iYenTdRbXmgESgQNCppJG67K5mZCC5ylURwSJdFuRMBcLoS2mUp59RFr/HIcBPbJcPG6mO2yN7i5
	dzv0ko+YtNQUbHDdW0Gch8cgDL1nftzLeXVEFybZ3ydiXuHfu8vnhQDPi2d9PrJ+BBTX2fa+shZ4Y
	ybJbCzLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxOCS-00000001e3V-1vNf;
	Thu, 18 Apr 2024 09:37:00 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxOCO-00000001e2p-2bDU;
	Thu, 18 Apr 2024 09:36:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7D026CE13A3;
	Thu, 18 Apr 2024 09:36:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78A51C2BD11;
	Thu, 18 Apr 2024 09:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713433013;
	bh=Qp9k4aU9c7AEiPS0ii/bSgM7Vml63g+4H5aHCfN6h24=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=hsG7NUQkfXYBpr62bEa0fDE+fRS17kSekv8vqSAjQ3UjaFhJ4gSG4evawt/1hg0qh
	 QNg4xQZ+92jFrtncFCYi+GQOKQPrEpcL6ck5kJlVbUszC/TrhfVAZJVSKEQSKrPkRi
	 vWzL52Suy1MXEAZ236Q8Rs9JmG4UzInyIINctH/LkIG0GLsVmlOp+n8rWiQ5uAnCad
	 t7Gj95Om40+vVsORrLwSzny4Ri2T/8+dapC12vgGaDYs670DI2/3B4f633Z+HPmKc6
	 VIR3zN1s1YRmkGM674StxAYLVC3M47HJcYDkWNNZUBeP5WypigY2XBYGftc77nUP4B
	 oxf8SduVO56lA==
Date: Thu, 18 Apr 2024 04:36:52 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: henryc.chen@mediatek.com, krzysztof.kozlowski+dt@linaro.org, 
 wenst@chromium.org, gustavoars@kernel.org, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, 
 conor+dt@kernel.org, kernel@collabora.com, amergnat@baylibre.com, 
 linux-pm@vger.kernel.org, keescook@chromium.org, 
 linux-arm-kernel@lists.infradead.org, lgirdwood@gmail.com, 
 djakov@kernel.org, broonie@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240418082812.152270-4-angelogioacchino.delregno@collabora.com>
References: <20240418082812.152270-1-angelogioacchino.delregno@collabora.com>
 <20240418082812.152270-4-angelogioacchino.delregno@collabora.com>
Message-Id: <171343301130.424721.10758711321868587171.robh@kernel.org>
Subject: Re: [PATCH v3 3/7] dt-bindings: soc: mediatek: Add DVFSRC bindings
 for MT8183 and MT8195
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_023657_060553_4B7EE1F9 
X-CRM114-Status: GOOD (  12.62  )
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


On Thu, 18 Apr 2024 10:28:08 +0200, AngeloGioacchino Del Regno wrote:
> Add bindings for the MediaTek Dynamic Voltage and Frequency Scaling
> Resource Collector (DVFSRC), a hardware module used to collect all the
> requests from both software and the various remote processors embedded
> into the SoC and decide about a minimum operating voltage and a minimum
> DRAM frequency to fulfill those requests in an effort to provide the
> best achievable performance per watt.
> 
> This hardware IP is capable of transparently performing direct register
> R/W on all of the DVFSRC-controlled regulators and SoC bandwidth knobs.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../soc/mediatek/mediatek,mt8183-dvfsrc.yaml  | 94 +++++++++++++++++++
>  1 file changed, 94 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.example.dtb: system-controller@10012000: regulators@0: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mt8183-dvfsrc.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.example.dtb: system-controller@10012000: interconnect@1: Unevaluated properties are not allowed ('reg' was unexpected)
	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mt8183-dvfsrc.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.example.dtb: regulators@0: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6873-dvfsrc-regulator.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.example.dtb: interconnect@1: Unevaluated properties are not allowed ('reg' was unexpected)
	from schema $id: http://devicetree.org/schemas/interconnect/mediatek,mt8183-emi.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240418082812.152270-4-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


