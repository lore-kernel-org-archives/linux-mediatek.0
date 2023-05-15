Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 321CBC7EE22
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 May 2023 12:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F3/PQcy/agecsZ21Fzu7R6/6c5dSh0tx/Kos12b66FE=; b=O6pIPHbaS5utpmAX0tI/jKiFhu
	IGdlW5pWo6L09fOlKdAk/T9nyTj/Gr2Xz/ArLtiss4xgMCUpIaSr+CaHxLiZk30BZ0c6xbJ8ljRAU
	NlUoKnPosdJ5HkO1NIbW8ESMTChhbhmAfK873zSffqecU5xMWcFKV+lquIrzylyylTSbU/gmTqUTI
	inQ9tRF5pfhrG7d9UNAkjeM+dQLyWNjRJcESZEQCkLTND4+Sem71ya+pOCu9LqgJQqJxL2I14fFWn
	mtHFZDK3SnmKIOU4nLd4p47dvyIxN7BflUEDCuCn+al0nVRXNBBdefTznLJIPC5job28Qy1zNkV1m
	FtSJZDsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyXGo-002798-1R;
	Mon, 15 May 2023 12:25:42 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyXGk-00277P-2S;
	Mon, 15 May 2023 12:25:40 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 830EB66031DA;
	Mon, 15 May 2023 13:25:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684153537;
	bh=Rl/jN3uyJpuesLYqs5+0/hmh5nAfzeWPHpb4ipmQ1nU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kap+61MDpii8Ol4UUwUo3Es7XYvHv0eY8dkzOCI9GNudoOfzvnO0AvU7ohyHgS29d
	 3OHVSbifF1xrxx2Yg/gxUB0ovoCTqJ+eVAqsKvRIn7c2oqfaXewWH/gx63v9H86q2q
	 MEUkcpmstAk8tiDYtQlsPG3UGXKBzNgZ1FeS8B905iGklIVCZmrHsItqkxIyjiaaZn
	 slTD+ZY3rdZUqWHnw4ZUwhY7QIRPcpw3681xVe9KmV54uIvx3EmR/Iz8spk+NXSz8P
	 3FRX9MsaUH0Z05TLp/9GpnoaiBKWnQlxNhA9UkAwZaDqaNtWmuAv6FH57HPB8EIPfy
	 Q+7xbpmw+5RiQ==
Message-ID: <f96c6809-d7d4-4030-5805-ca79f87715ce@collabora.com>
Date: Mon, 15 May 2023 14:25:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: add mediatek mipi csi driver v
 0.5
Content-Language: en-US
To: Julien Stephan <jstephan@baylibre.com>
Cc: krzysztof.kozlowski@linaro.org, robh@kernel.org, chunkuang.hu@kernel.org,
 linux-mediatek@lists.infradead.org,
 Florian Sylvestre <fsylvestre@baylibre.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Andy Hsieh <andy.hsieh@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek USB3 PHY DRIVER"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20230515090551.1251389-1-jstephan@baylibre.com>
 <20230515090551.1251389-2-jstephan@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230515090551.1251389-2-jstephan@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_052538_924055_6B4D0817 
X-CRM114-Status: GOOD (  19.00  )
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

Il 15/05/23 11:05, Julien Stephan ha scritto:
> From: Florian Sylvestre <fsylvestre@baylibre.com>
> 
> This adds the bindings, for the MIPI CD-PHY module v 0.5 embedded in
> some Mediatek soc, such as the mt8365
> 
> Signed-off-by: Florian Sylvestre <fsylvestre@baylibre.com>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>   .../phy/mediatek,phy-mipi-csi-0-5.yaml        | 62 +++++++++++++++++++
>   MAINTAINERS                                   |  6 ++
>   2 files changed, 68 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/phy/mediatek,phy-mipi-csi-0-5.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,phy-mipi-csi-0-5.yaml b/Documentation/devicetree/bindings/phy/mediatek,phy-mipi-csi-0-5.yaml
> new file mode 100644
> index 000000000000..5aa8c0b41cdf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/mediatek,phy-mipi-csi-0-5.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0-Only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/mediatek,phy-mipi-csi-0-5.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek Sensor Interface MIPI CSI CD-PHY
> +
> +maintainers:
> +  - Julien Stephan <jstephan@baylibre.com>
> +  - Andy Hsieh <andy.hsieh@mediatek.com>
> +
> +description:
> +  The SENINF CD-PHY is a set of CD-PHY connected to the SENINF CSI-2
> +  receivers. The number of PHYs depends on the SoC model.
> +  Depending on the soc model, each PHYs can support CDPHY or DPHY only
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,phy-mipi-csi-0-5

mediatek,mtXXXX-csi-rx sounds great, doesn't it?

> +
> +  reg:
> +    maxItems: 1
> +
> +  '#phy-cells':
> +    const: 0
> +
> +  mediatek,is_cdphy:

No underscores please: mediatek,is-cdphy

> +    description:
> +      Specify if the current phy support CDPHY configuration

Description fits in one line.

     description: Specify if the current phy support CDPHY configuration

> +    type: boolean
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#phy-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      mipi_rx_csi0: mipi_rx_csi0@11c10000 {

csi0_rx: phy@11c10000

> +        compatible = "mediatek,phy-mipi-csi-0-5";
> +        reg = <0 0x11C10000 0 0x2000>;
> +        status = "okay";
> +        mediatek,is_cdphy;
> +        #phy-cells = <0>;
> +      };
> +
> +      mipi_rx_csi1: mipi-rx-csi1@11c12000 {

csi1_rx: phy@11c20000

> +        compatible = "mediatek,phy-mipi-csi-0-5";
> +        reg = <0 0x11C12000 0 0x2000>;
> +        status = "disabled";
> +        #phy-cells = <0>;
> +      };
> +    };
> +...

Regards,
Angelo


