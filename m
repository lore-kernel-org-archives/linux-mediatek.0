Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC67FCDB47E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 10:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h9FCmbWGl+OlYTAXdMG/3CqMMFt/CGx3iCVE20i1C4E=; b=qAEThJUubX+KjlniN78wvXlr2S
	Z26JNzgzL/WEiDzu/w7+auySo1bgzOl7QdO0insLRZsmhfl8HzB+vSzRXIE6xYUDy8z1kInKn3Lgv
	1A8xo+nyl4ZFA5zT3kPb0sJ0gX9qJmhfUWgNySKzBYIXBygAjiE6AsSqlwog1mff+pEGc5fB4DGnt
	bpbSNx3tfA4h4HgSG/2lxiALJyQgjofgh8RM0BYHnD5tDfNj7UiEiUyR0NkEzW21DHPNdj4lRPN17
	vwILSqWx8TYd+F7nc2/usaeHEecuscKxORKbqDb5ofeRBj3ORnL994Ei5rJY6HNoQuy9ua4CMaZhN
	Wtf6/x2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqskF-000cL6-2K;
	Thu, 12 Oct 2023 10:16:43 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqskB-000cHp-2O;
	Thu, 12 Oct 2023 10:16:41 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 73141660730F;
	Thu, 12 Oct 2023 11:16:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697105798;
	bh=MFJlXKeKRmyYe1sPRy0ZgHvR7phe/lPTFJSLRKVgehQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bPLnqHRx+HA5+shhLcXQRXhbX6Bp0T7ND4nULJuFnv9s4KHUOdYfFl4oiXOXFNAC2
	 BPGInDS5rRla7xD9rMgO1JKGxrAUKF6CvuCtISS8IgtVhxKFcHqTHHfIR2GIeNGluw
	 Dr0kEOG3uHW2z0AF3HOCEfmyeq9eou+8TrYjuvAw53zt60wzoJZhzhYTIvApVGwxrX
	 WYjVSSQllKwXXXn+4EcNm0hlHPrCmfFRcMRluHRCQabUg3ZMxPI7CsTSAG4WFE5FcU
	 tZYvZIH8HuPMniMWZNvBB64HS0dGIUN5Jkmw5UBhBykKRV/G4AndalNf5qjwaRz1oH
	 K+Pvz5vsqq7CA==
Message-ID: <ad91458c-8345-577e-b081-17e02fefac68@collabora.com>
Date: Thu, 12 Oct 2023 12:16:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v7 10/16] dt-bindings: media: mediatek: mdp3: add
 component TDSHP for MT8195
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20231012084037.19376-1-moudy.ho@mediatek.com>
 <20231012084037.19376-11-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231012084037.19376-11-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_031639_909284_F566B2D1 
X-CRM114-Status: GOOD (  19.01  )
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

Il 12/10/23 10:40, Moudy Ho ha scritto:
> Add the fundamental hardware configuration of component TDSHP,
> which is controlled by MDP3 on MT8195.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>   .../bindings/media/mediatek,mdp3-tdshp.yaml   | 61 +++++++++++++++++++
>   1 file changed, 61 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml
> new file mode 100644
> index 000000000000..92e1547e7c7f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mdp3-tdshp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Media Data Path 3 TDSHP

Please unroll it....

MediaTek Media Data Path 3 Two-Dimensional Sharpness

> +
> +maintainers:
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +  - Moudy Ho <moudy.ho@mediatek.com>
> +
> +description:
> +  One of Media Data Path 3 (MDP3) components used to improve image
> +  sharpness and contrast.

Two-Dimensional Sharpness (TDSHP) is a MDP3 component used to perform
image edge sharpening and enhance vividness and contrast.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8195-mdp3-tdshp
> +
> +  reg:
> +    maxItems: 1
> +
> +  mediatek,gce-client-reg:
> +    description:
> +      The register of display function block to be set by gce. There are 4 arguments,
> +      such as gce node, subsys id, offset and register size. The subsys id that is
> +      mapping to the register of display function blocks is defined in the gce header
> +      include/dt-bindings/gce/<chip>-gce.h of each chips.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      items:
> +        - description: phandle of GCE
> +        - description: GCE subsys id
> +        - description: register offset
> +        - description: register size
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - mediatek,gce-client-reg
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8195-clk.h>
> +    #include <dt-bindings/gce/mt8195-gce.h>
> +
> +    display@14007000 {
> +        compatible = "mediatek,mt8195-mdp3-tdshp";
> +        reg = <0x14007000 0x1000>;
> +        mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x7000 0x1000>;
> +        clocks = <&vppsys0 CLK_VPP0_MDP_TDSHP>;
> +    };



