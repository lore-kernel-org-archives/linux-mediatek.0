Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6F1C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 13:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GEk0cXkwWj7GwB3kKU1L9BAm4YgwjPGroGTVGOJMILI=; b=sRmm06W2euDMaB
	iHy09im4NBXcFprldtL7VrwIT4Zi+gHzk2Xy7SkQGf68qwugqlj3nGK/0MjHv2ONG708kNrSP+BYv
	MjWuzI16nuHLP3EOu3nOHkVMS2b6OB8PcjOjTMqNwhSm2/Lx8wYKp4IMrEJ2R9I7xP+b1dsBlApxZ
	dRTy9Mbq0U6seMnxNFGmfUvXtKAacYKDvjMtg0nKizdZsrtzflwJ7F+YB6HuhHCqhpVu83uxc5sFI
	PZzi73T0g3miZiHdOvBlNH9hFsRmDuW90ciCMBNWd0FH9QZkR/e41ybHtF4hgHS/6/EfJveaoJ0ol
	L0wxMMvvrG+iVpOshbmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhtQS-000cB8-Qx; Fri, 22 Apr 2022 13:34:20 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhtQG-000c8E-PI; Fri, 22 Apr 2022 13:34:11 +0000
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-e2afb80550so8644550fac.1; 
 Fri, 22 Apr 2022 06:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=C/kEgilXqSPnl31WC9xkPRIgVKYXDf7XdIRD44Vf08M=;
 b=Iojf9/wY5FV0vaAmBwPbKZio0zlgG24wE/LxuzLRir1mX/LiczDehU89kErHgmiAN2
 zN/KtA6Knuj7LTdX02qnroVH+TcvKzkYd6ygw3UDyHYDs/0yYDp0LE9lLsonL5OUvV0w
 TzLU4tEyCMM9EOML/BrrOn3Oxhgj9iSam20IeQcQIs6CyLkLP6OU5jP1Xcr48RYv4xpq
 Xst67NwOWfvp2n4tf5SZSWZmeiO8C2PQemmERN1HQ3SGSPxEa6A2SCeB4NgUgQ41qbxq
 BR0rjNQtmlU7YjjkBiYRN/SoV/Y9H6QxhonyNSF/RdtTTCBkc0x7C2aqXU4WekKt5NJq
 YSHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=C/kEgilXqSPnl31WC9xkPRIgVKYXDf7XdIRD44Vf08M=;
 b=Yn6gvxNxjf1+/jUFdau34Muva78apHoRzKy3VhuRnMiLtKkvzDCagTucyX/Re+l3a5
 3VfDYCr5NIbTGeeeXN+0KksLwDowjfk4rdhwQD6j3wiP26Viyln3UoPlosZrvB96+W0D
 mITn3JnSfMF6unPOde3RVDV3Fdpw3dlNQl7MludryJSVmnBgsVhJyaWSIeWsXAXbkknS
 Z/q45185/yGgptOTtroeaCeZ5m451SXvzWqPXStvxnI3OIXf9olCjGOJZtyLho+RqkZw
 TuRtNBW38V2a8mZKHCaD0Eojeo1eJEUqbma3Bxs/OuQSQPrQkW3fd9rw10og9Z1HArRc
 DBaw==
X-Gm-Message-State: AOAM5313B4e548cvxEJptDm9dJR7Lof1plLL9G8uOH8H7Tdwp7qUzz4s
 1PVPxH6aAXNFXsIidd7I6QI=
X-Google-Smtp-Source: ABdhPJzV6lm2vsSvTsKyCqLOZ0mya3UL2jr8em9qifDFe9rTXQEeyobtwqp+7fxnEjkLp3vYbZ7k2A==
X-Received: by 2002:a05:6870:80cf:b0:e9:b4b:6c72 with SMTP id
 r15-20020a05687080cf00b000e90b4b6c72mr505300oab.227.1650634444785; 
 Fri, 22 Apr 2022 06:34:04 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 5-20020a9d0105000000b005fbe5093eb0sm728270otu.54.2022.04.22.06.33.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 06:34:03 -0700 (PDT)
Message-ID: <99525d08-3263-d490-c962-1f5886a74e8b@gmail.com>
Date: Fri, 22 Apr 2022 15:33:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Landley <rob@landley.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@chromium.org>,
 tfiga@chromium.org, drinkcat@chromium.org, pihsun@chromium.org,
 hsinyi@google.com, Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 daoyuan huang <daoyuan.huang@mediatek.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, allen-kh.cheng@mediatek.com,
 xiandong.wang@mediatek.com, randy.wu@mediatek.com,
 jason-jh.lin@mediatek.com, roy-cw.yeh@mediatek.com,
 river.cheng@mediatek.com, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220418022213.23826-1-moudy.ho@mediatek.com>
 <20220418022213.23826-2-moudy.ho@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v13 1/3] dt-binding: mt8183: add Mediatek MDP3 dt-bindings
In-Reply-To: <20220418022213.23826-2-moudy.ho@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_063408_888917_69A93A9D 
X-CRM114-Status: GOOD (  27.89  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 18/04/2022 04:22, Moudy Ho wrote:
> This patch adds DT binding documents for Media Data Path 3 (MDP3)
> a unit in multimedia system combined with several components and
> used for scaling and color format convert.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>   .../bindings/media/mediatek,mdp3-rdma.yaml    | 166 ++++++++++++++++++
>   .../bindings/media/mediatek,mdp3-rsz.yaml     |  54 ++++++
>   .../bindings/media/mediatek,mdp3-wrot.yaml    |  57 ++++++
>   .../bindings/soc/mediatek/mediatek,ccorr.yaml |  47 +++++
>   .../bindings/soc/mediatek/mediatek,wdma.yaml  |  58 ++++++
>   5 files changed, 382 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
>   create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
>   create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
>   create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,ccorr.yaml
>   create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> new file mode 100644
> index 000000000000..45b7c075ebf5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> @@ -0,0 +1,166 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek Read Direct Memory Access
> +
> +maintainers:
> +  - Matthias Brugger <matthias.bgg@gmail.com>

Please add a maintainer that takes care of the driver bits. For example 
"Ping-Hsun Wu <ping-hsun.wu@mediatek.com>" as mentioned in the driver.

That holds for the other yaml files as well.

Regards,
Matthias

> +
> +description: |
> +  Mediatek Read Direct Memory Access(RDMA) component used to do read DMA.
> +  It contains one line buffer to store the sufficient pixel data, and
> +  must be siblings to the central MMSYS_CONFIG node.
> +  For a description of the MMSYS_CONFIG binding, see
> +  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +  for details.
> +  The 1st RDMA is also used to be a controller node in Media Data Path 3(MDP3)
> +  that containing MMSYS, MUTEX, GCE and SCP settings.
> +
> +properties:
> +  compatible:
> +    items:
> +      # MDP3 controller node
> +      - const: mediatek,mt8183-mdp3
> +      - const: mediatek,mt8183-mdp3-rdma
> +
> +  mediatek,scp:
> +    description: |
> +      The node of system control processor (SCP), using
> +      the remoteproc & rpmsg framework.
> +    $ref: '/schemas/types.yaml#/definitions/phandle'
> +    maxItems: 1
> +
> +  mediatek,mdp3-comps:
> +    description: |
> +      MDP subsystem which has direct-link from Image Signal Processor(ISP).
> +      When using the camera, the DMA of ISP PASS (DIP) module will directly
> +      trigger MDP3 without other control (such as V4L2 M2M) to create
> +      corresponding HW path.
> +      The MDP3 controller must set up a series of registers at the beginning of
> +      path creation which covering MMSYS, IMGSYS, and MDP3's components,
> +      so that data flow can pass through MDP3.
> +      The entire path is briefly described as follows
> +      ISP --+
> +            |
> +            +-> DIP --+
> +      ................|..............................................
> +      (MDP3)          +->IMGI -+-> DL1 ->  RSZ -+-> PATH1 -> WROT
> +                               |            ^   |
> +                               |            |   |
> +                               +-> DL2 -----+   +-> PATH2 -> WDMA
> +                               |
> +                               +---------------------------> EXTO
> +    $ref: '/schemas/types.yaml#/definitions/string-array'
> +    items:
> +      enum:
> +        # MDP direct-link input path selection, create a
> +        # component for path connectedness of HW pipe control
> +        - mediatek,mt8183-mdp3-dl1
> +        - mediatek,mt8183-mdp3-dl2
> +        # MDP direct-link output path selection, create a
> +        # component for path connectedness of HW pipe control
> +        - mediatek,mt8183-mdp3-path1
> +        - mediatek,mt8183-mdp3-path2
> +        # Input DMA of ISP PASS2 (DIP) module for raw image input
> +        - mediatek,mt8183-mdp3-imgi
> +        # Output DMA of ISP PASS2 (DIP) module for YUV image output
> +        - mediatek,mt8183-mdp3-exto
> +
> +  reg:
> +    items:
> +      - description: basic RDMA HW address
> +      - description: MDP direct-link 1st and 2nd input
> +      - description: MDP direct-link 1st output
> +      - description: MDP direct-link 2nd output
> +      - description: ISP input and output
> +
> +  mediatek,gce-client-reg:
> +    $ref: '/schemas/types.yaml#/definitions/phandle-array'
> +    minItems: 1
> +    items:
> +      - description: GCE client for RDMA
> +      - description: GCE client for dl1 and dl2
> +      - description: GCE client for path1
> +      - description: GCE client for path2
> +      - description: GCE client for imgi and exto
> +    description: |
> +      The register of client driver can be configured by gce with
> +      4 arguments defined in this property, such as phandle of gce, subsys id,
> +      register offset and size. Each GCE subsys id is mapping to a client
> +      defined in the header include/dt-bindings/gce/<chip>-gce.h.
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: RDMA clock
> +      - description: RSZ clock
> +      - description: direck-link TX clock in MDP side
> +      - description: direck-link RX clock in MDP side
> +      - description: direck-link TX clock in ISP side
> +      - description: direck-link RX clock in ISP side
> +
> +  iommus:
> +    maxItems: 1
> +
> +  mboxes:
> +    items:
> +      - description: used for 1st data pipe from RDMA
> +      - description: used for 2nd data pipe from RDMA
> +      - description: used for 3rd data pipe from Direct-Link
> +      - description: used for 4th data pipe from Direct-Link
> +
> +required:
> +  - compatible
> +  - mediatek,scp
> +  - reg
> +  - clocks
> +  - mediatek,gce-client-reg
> +  - mboxes
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8183-clk.h>
> +    #include <dt-bindings/gce/mt8183-gce.h>
> +    #include <dt-bindings/power/mt8183-power.h>
> +    #include <dt-bindings/memory/mt8183-larb-port.h>
> +
> +    mdp3_rdma0: mdp3_rdma0@14001000 {
> +      compatible = "mediatek,mt8183-mdp3",
> +                   "mediatek,mt8183-mdp3-rdma";
> +      mediatek,scp = <&scp>;
> +      mediatek,mdp3-comps = "mediatek,mt8183-mdp3-dl1",
> +                            "mediatek,mt8183-mdp3-dl2",
> +                            "mediatek,mt8183-mdp3-path1",
> +                            "mediatek,mt8183-mdp3-path2",
> +                            "mediatek,mt8183-mdp3-imgi",
> +                            "mediatek,mt8183-mdp3-exto";
> +      reg = <0x14001000 0x1000>,
> +            <0x14000000 0x1000>,
> +            <0x14005000 0x1000>,
> +            <0x14006000 0x1000>,
> +            <0x15020000 0x1000>;
> +      mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x1000 0x1000>,
> +                                <&gce SUBSYS_1400XXXX 0 0x1000>,
> +                                <&gce SUBSYS_1400XXXX 0x5000 0x1000>,
> +                                <&gce SUBSYS_1400XXXX 0x6000 0x1000>,
> +                                <&gce SUBSYS_1502XXXX 0 0x1000>;
> +      power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> +      clocks = <&mmsys CLK_MM_MDP_RDMA0>,
> +               <&mmsys CLK_MM_MDP_RSZ1>,
> +               <&mmsys CLK_MM_MDP_DL_TXCK>,
> +               <&mmsys CLK_MM_MDP_DL_RX>,
> +               <&mmsys CLK_MM_IPU_DL_TXCK>,
> +               <&mmsys CLK_MM_IPU_DL_RX>;
> +      iommus = <&iommu>;
> +      mboxes = <&gce 20 CMDQ_THR_PRIO_LOWEST>,
> +               <&gce 21 CMDQ_THR_PRIO_LOWEST>,
> +               <&gce 22 CMDQ_THR_PRIO_LOWEST>,
> +               <&gce 23 CMDQ_THR_PRIO_LOWEST>;
> +    };
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
> new file mode 100644
> index 000000000000..0dcb1a883a8e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek Resizer
> +
> +maintainers:
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +
> +description: |
> +  One of Media Data Path 3 (MDP3) components used to do frame resizing.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt8183-mdp3-rsz
> +
> +  reg:
> +    maxItems: 1
> +
> +  mediatek,gce-client-reg:
> +    description: The register of client driver can be configured by gce with
> +      4 arguments defined in this property, such as phandle of gce, subsys id,
> +      register offset and size. Each GCE subsys id is mapping to a client
> +      defined in the header include/dt-bindings/gce/<chip>-gce.h.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8183-clk.h>
> +    #include <dt-bindings/gce/mt8183-gce.h>
> +
> +    mdp3_rsz0: mdp3_rsz0@14003000 {
> +      compatible = "mediatek,mt8183-mdp3-rsz";
> +      reg = <0x14003000 0x1000>;
> +      mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x3000 0x1000>;
> +      clocks = <&mmsys CLK_MM_MDP_RSZ0>;
> +    };
> +
> +    mdp3_rsz1: mdp3_rsz1@14004000 {
> +      compatible = "mediatek,mt8183-mdp3-rsz";
> +      reg = <0x14004000 0x1000>;
> +      mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x4000 0x1000>;
> +      clocks = <&mmsys CLK_MM_MDP_RSZ1>;
> +    };
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
> new file mode 100644
> index 000000000000..f2c38a9b187d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek Write DMA with Rotation
> +
> +maintainers:
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +
> +description: |
> +  One of Media Data Path 3 (MDP3) components used to write DMA with frame rotation.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt8183-mdp3-wrot
> +
> +  reg:
> +    maxItems: 1
> +
> +  mediatek,gce-client-reg:
> +    description: The register of client driver can be configured by gce with
> +      4 arguments defined in this property, such as phandle of gce, subsys id,
> +      register offset and size. Each GCE subsys id is mapping to a client
> +      defined in the header include/dt-bindings/gce/<chip>-gce.h.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +
> +  iommus:
> +    maxItems: 1
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8183-clk.h>
> +    #include <dt-bindings/gce/mt8183-gce.h>
> +    #include <dt-bindings/power/mt8183-power.h>
> +    #include <dt-bindings/memory/mt8183-larb-port.h>
> +
> +    mdp3_wrot0: mdp3_wrot0@14005000 {
> +      compatible = "mediatek,mt8183-mdp3-wrot";
> +      reg = <0x14005000 0x1000>;
> +      mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x5000 0x1000>;
> +      power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> +      clocks = <&mmsys CLK_MM_MDP_WROT0>;
> +      iommus = <&iommu>;
> +    };
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,ccorr.yaml
> new file mode 100644
> index 000000000000..cf23f4f5bd69
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,ccorr.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/mediatek/mediatek,ccorr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek color correction
> +
> +maintainers:
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +
> +description: |
> +  Mediatek color correction with 3X3 matrix.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt8183-mdp3-ccorr
> +
> +  reg:
> +    maxItems: 1
> +
> +  mediatek,gce-client-reg:
> +    description: The register of client driver can be configured by gce with
> +      4 arguments defined in this property, such as phandle of gce, subsys id,
> +      register offset and size. Each GCE subsys id is mapping to a client
> +      defined in the header include/dt-bindings/gce/<chip>-gce.h.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8183-clk.h>
> +    #include <dt-bindings/gce/mt8183-gce.h>
> +
> +    mdp3_ccorr: mdp3_ccorr@1401c000 {
> +      compatible = "mediatek,mt8183-mdp3-ccorr";
> +      reg = <0x1401c000 0x1000>;
> +      mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0xc000 0x1000>;
> +      clocks = <&mmsys CLK_MM_MDP_CCORR>;
> +    };
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml
> new file mode 100644
> index 000000000000..4057b5232e45
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/mediatek/mediatek,wdma.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek Write Direct Memory Access
> +
> +maintainers:
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +
> +description: |
> +  Mediatek Write Direct Memory Access(WDMA) component used to write
> +  the data into DMA.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt8183-mdp3-wdma
> +
> +  reg:
> +    maxItems: 1
> +
> +  mediatek,gce-client-reg:
> +    description: The register of client driver can be configured by gce with
> +      4 arguments defined in this property, such as phandle of gce, subsys id,
> +      register offset and size. Each GCE subsys id is mapping to a client
> +      defined in the header include/dt-bindings/gce/<chip>-gce.h.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +
> +  iommus:
> +    maxItems: 1
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8183-clk.h>
> +    #include <dt-bindings/gce/mt8183-gce.h>
> +    #include <dt-bindings/power/mt8183-power.h>
> +    #include <dt-bindings/memory/mt8183-larb-port.h>
> +
> +    mdp3_wdma: mdp3_wdma@14006000 {
> +      compatible = "mediatek,mt8183-mdp3-wdma";
> +      reg = <0x14006000 0x1000>;
> +      mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x6000 0x1000>;
> +      power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> +      clocks = <&mmsys CLK_MM_MDP_WDMA0>;
> +      iommus = <&iommu>;
> +    };

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
