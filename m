Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C3DC7EE23
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 May 2023 09:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HB7f37LXePkyFUtjAk45Qj1wKMY3NzYnUo7vHT+8i8k=; b=d3tjpYp4jxWFLv2iXt83Pml3Kg
	ObQ6j4Mn/oGWQG6i9sU/r00/QiAuZfd3bSiLeR4gJeO3l5tbM6ZtcJsJlYqR41VlRrNYEm7Wo2+MM
	ih/CvM/+0cI1Er0czQCn7OnvKvAO0p5T1tZiyEfruZjCICG2zgQpll+TnVc+qlm4BQ4188NwcdUHF
	BTZ4KUKg3GS8cnTpdNWqFF0yrR9s1rVBQx6OoZVqKQGQTitK8SPSbLYkOMhJl/KwPCf/NRlRHKOAm
	2iNSe/zk2aYBQrNv3W5RzEM4ntCGdwbeEys/eiCleKjZs/HyadSgns93yhIOTxIudevtCuIWQ3U2/
	Tsah4FvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1l3q-00D1CA-2J;
	Wed, 24 May 2023 09:45:38 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1l3n-00D1B3-0h;
	Wed, 24 May 2023 09:45:36 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 82C6866021E6;
	Wed, 24 May 2023 10:45:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684921533;
	bh=gnyIrp2NNSRQPz2LUIGtdI9gWB+xhLZRVzKNi1Mfmz0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ajMypXEfpgCDo9i3QTk3N7jns/KFaeEfe6BICsgwzlRyG0F6rAVQQNWBoitvA5mfb
	 Nlopld6omkSMKi/deYelf6NsxLHS8C09xTk4FdUOp9brM2ggV1WNvsH9shK1Q7Sht6
	 A3xgFnmix9Dxa9MJPwCKG6iebdIZFOhqEWyU7nNTHEDlnPph/C9IY1ubPYMT11fpAZ
	 yFeC5r8EFx6leNcUFFfft6DQ0ly8btochdeWAyrT28YBoSojyLjknLjB8+UaMyk3Ws
	 kseGEU59hBJHN4jY1zYGtT+tEeZ7/0gCvgw+5uBmZLQn6wHgTE2qKu2yoPOTvvWhL3
	 IK/LOvX4S5YrQ==
Message-ID: <f92c39c8-177a-e18d-c3b0-79e7349ea4db@collabora.com>
Date: Wed, 24 May 2023 11:45:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 2/3] dt-bindings: phy: add mediatek MIPI CD-PHY module
 v0.5
Content-Language: en-US
To: Julien Stephan <jstephan@baylibre.com>
Cc: mkorpershoek@baylibre.com, khilman@baylibre.com,
 Florian Sylvestre <fsylvestre@baylibre.com>,
 Andy Hsieh <andy.hsieh@mediatek.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>
References: <20230524083033.486490-1-jstephan@baylibre.com>
 <20230524083033.486490-3-jstephan@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230524083033.486490-3-jstephan@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_024535_388404_C68F3294 
X-CRM114-Status: GOOD (  18.30  )
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

Il 24/05/23 10:30, Julien Stephan ha scritto:
> From: Florian Sylvestre <fsylvestre@baylibre.com>
> 
> This adds the bindings, for the MIPI CD-PHY module v0.5 embedded in
> some Mediatek soc, such as the mt8365
> 
> Signed-off-by: Florian Sylvestre <fsylvestre@baylibre.com>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>   .../bindings/phy/mediatek,mt8365-csi-rx.yaml  | 67 +++++++++++++++++++
>   MAINTAINERS                                   |  6 ++
>   2 files changed, 73 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml b/Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml
> new file mode 100644
> index 000000000000..a1bd96a98051
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2023 MediaTek, BayLibre
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/mediatek,mt8365-csi-rx.yaml#
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
> +  Depending on the SoC model, each PHYs can be either CD-PHY or D-PHY only
> +  capable.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8365-csi-rx
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#phy-cells':
> +    const: 0
> +
> +  mediatek,phy-type:

Instead of declaring a phy-type here like this, can't we instead declare that in
the phy cells, like we're doing with MTK TPHY and like other non-MediaTek PHYs are
already doing?

device {
	...
	phys = <&csi0_rx PHY_TYPE_CDPHY>;
	...
}

Regards,
Angelo



