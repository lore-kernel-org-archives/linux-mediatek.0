Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9D2C4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 14:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ae3YD9extRLUaDTpgwINVaFTTzELZxvXwsm9g/3pe6c=; b=l7X+ABlg2sTvcWjCu7cgH+PxMB
	mQxTp/mbKUvy1ZyV0Hq3QntPXEkpEJoe17yn3EbhppDSVniZq3ybGkflO2r9JHoK9GX6gWwpLl6n8
	+3k+yQLDPl6L80VBoxeDIeeZnw8mYO4Fz9d6liorRuJpCJYXgXrNhYiXu104U3lv6JS0ALqxPWg0V
	nJTm1y6n2L1ifWXs4/RDiX1M4DxbLJ5v/7OfoyCOPMk90uZy6Rpox6WvNslPjZAarwxq2A3/f9om7
	aTGheVKaiPgn43sSS1wtYovqU4vtJHB9BtIOcFgzXgIINN5/YUxmZhqUzrRhE7sA+MRUuK+GvMSdr
	Pvr6WQ8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx6fq-0000000GSTJ-26WU;
	Wed, 17 Apr 2024 14:54:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx6fm-0000000GSRK-0Dde;
	Wed, 17 Apr 2024 14:54:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 77B92614FC;
	Wed, 17 Apr 2024 14:54:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F11EFC32781;
	Wed, 17 Apr 2024 14:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713365645;
	bh=7RPukjZeREzRQeYifxWz1+LP+GxBg1xWTJAJdsC2t/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WIwLMovJAc/KjZB0q7r91gFvQ9By8zffzDPKt2zIopXCNOgRS+z5UWF/60XkNHHGM
	 H2nXO4a4yZ1lVYPUhCFDyPsAUvNzLh1UB4gskJZweclhTriS6lf3PzDWgTuXezJRRH
	 5t2zTgpRu9ERroCtgr4/k2KrvkpOHRrG3sUsCKBXlnc7Vk7ZNJsCos+m+ArrUcRwVV
	 /z2WtMRpV8FZlk0Letk8YWc7WyzFhQTqZOVKCnVewE+PdOHE4BwKMxBDiHKToYtyhO
	 BnnTJH/4uxJtMcoeytc07olK4uqP3kzpHw22fFrPv4eo29IS9uKOSb4sX7nQwAGnA8
	 u7YNzxq6MEd9A==
Date: Wed, 17 Apr 2024 09:54:02 -0500
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
Subject: Re: [PATCH v2 2/7] dt-bindings: interconnect: Add MediaTek EMI
 Interconnect bindings
Message-ID: <20240417145402.GA2355631-robh@kernel.org>
References: <20240417091442.170505-1-angelogioacchino.delregno@collabora.com>
 <20240417091442.170505-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240417091442.170505-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_075406_214260_002987BE 
X-CRM114-Status: GOOD (  16.79  )
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

On Wed, Apr 17, 2024 at 11:14:37AM +0200, AngeloGioacchino Del Regno wrote:
> Add bindings for the MediaTek External Memory Interface Interconnect,
> which providers support system bandwidth requirements through Dynamic
> Voltage Frequency Scaling Resource Collector (DVFSRC) hardware.
> 
> This adds bindings for MediaTek MT8183 and MT8195 SoCs.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../interconnect/mediatek,mt8183-emi.yaml     | 76 +++++++++++++++++++
>  .../interconnect/mediatek,mt8183.h            | 23 ++++++
>  .../interconnect/mediatek,mt8195.h            | 44 +++++++++++
>  3 files changed, 143 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interconnect/mediatek,mt8183-emi.yaml
>  create mode 100644 include/dt-bindings/interconnect/mediatek,mt8183.h
>  create mode 100644 include/dt-bindings/interconnect/mediatek,mt8195.h
> 
> diff --git a/Documentation/devicetree/bindings/interconnect/mediatek,mt8183-emi.yaml b/Documentation/devicetree/bindings/interconnect/mediatek,mt8183-emi.yaml
> new file mode 100644
> index 000000000000..3ad60fd21f83
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interconnect/mediatek,mt8183-emi.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interconnect/mediatek,mt8183-emi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek External Memory Interface (EMI) Interconnect
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +
> +description: |
> +  EMI interconnect providers support system bandwidth requirements through
> +  Dynamic Voltage Frequency Scaling Resource Collector (DVFSRC) hardware.
> +  The provider is able to communicate with the DVFSRC through Secure Monitor
> +  Call (SMC).
> +
> +             ICC provider         ICC Nodes
> +                              ----          ----
> +             _________       |CPU |   |--- |VPU |
> +    _____   |         |-----  ----    |     ----
> +   |     |->|  DRAM   |       ----    |     ----
> +   |DRAM |->|scheduler|----- |GPU |   |--- |DISP|
> +   |     |->|  (EMI)  |       ----    |     ----
> +   |_____|->|_________|---.   -----   |     ----
> +               /|\         `-|MMSYS|--|--- |VDEC|
> +                |             -----   |     ----
> +                |                     |     ----
> +                | change DRAM freq    |--- |VENC|
> +             --------                 |     ----
> +    SMC --> | DVFSRC |                |     ----
> +             --------                 |--- |IMG |
> +                                      |     ----
> +                                      |     ----
> +                                      |--- |CAM |
> +                                            ----
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8183-emi
> +      - mediatek,mt8195-emi
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#interconnect-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - '#interconnect-cells'
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interconnect/mediatek,mt8195.h>
> +
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
> +            emi_icc: interconnect@1 {
> +                compatible = "mediatek,mt8195-emi";
> +                reg = <1>;
> +                #interconnect-cells = <1>;


There's not really any need for this node. Just put #interconnect-cells 
in the parent.

Rob

