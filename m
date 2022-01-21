Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9390C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jan 2022 21:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nonSsSJPdtAZ6Nmhs0iJuOUn/3TJ9RccTzsmG3sAW8Y=; b=AW8Zm0NRbREYs8
	cXclfUwP0h3fKcrk5AjH/Ci/8B6BQDjya3/PJZRH1C1n/nIec0Lx2ppGEAq3hcSNqMsDsxrdjQsWs
	6kbh25lPAqd4HM9mDCCQVOlCLyrQoEGYY+D/IoM6ASZ7JxJzx5m1yOYPepd88v3PVe4FpaMowVwBO
	WR8U0uUSf2oe1Z6hRBC01OT9ZTTU6Etj0ewLi8rdqiLpv5dJAJusUoD4wRHPpXnArvt68xImLy0ej
	PqyPDQg8C025jkp9HaKyrKOYZ8cIaKqhRLhFC+xhZ/PG+SJQrlP2hGzEi/unl4hEFRDwYyH71+Hfa
	w2yZnuLwza3Lt7WanonQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nB1HV-00G6hP-Gf; Fri, 21 Jan 2022 21:17:13 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nB1HB-00G6br-8f; Fri, 21 Jan 2022 21:16:55 +0000
Received: by mail-oi1-f182.google.com with SMTP id y14so15347189oia.9;
 Fri, 21 Jan 2022 13:16:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UkKQ+uvaFRCpFhQDtOTqlolW1EA9Wz1GB/WpekfepzU=;
 b=w9TvMl5ecz27Ao6AUUxzgt/hRib6BX9puW/LvHW3ZDkG584xxix8Kv9qdtUHGioxIW
 +mWH0ZZmeMFRrcM1LjyYA1ueaEDwKwAVJHXqsMYE5IKX+ykWrgxt2676C/mNMqlmpHn5
 jNQRph3JbqXuu2gASOe/bfhwG44RUOjTns25KgZd4rB+RBgjWbX6dNzh2bw2kqKchJmO
 gOlxBBy7yzATkYyhOTDtIW+NekW5+Dj99xGFfi7GnqP/u5kElIkWa0CHpkkevnqsR0cg
 uaglde1cJalMM8HPvsRsI9Jc8WsuGax2zfGnhBJ3ZK5+ifF2kn+BK+0OFz91qH/+JqM1
 he8A==
X-Gm-Message-State: AOAM531FBymZ2F0aq+TeSBcmy+SDStopXrx1bJlQEqeTwxAru9j0fzU3
 QlJSUFoVIzciNfkhb7aJMg==
X-Google-Smtp-Source: ABdhPJySWOEM64BEXqzyb8qGKsCjLH/03NMbnor1U5lQcIhESJKxnYEWlDkS6GjjmVnlm4i2bDOa4Q==
X-Received: by 2002:a05:6808:b38:: with SMTP id
 t24mr2100209oij.25.1642799811386; 
 Fri, 21 Jan 2022 13:16:51 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id c9sm1442652oog.43.2022.01.21.13.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 13:16:50 -0800 (PST)
Received: (nullmailer pid 1597994 invoked by uid 1000);
 Fri, 21 Jan 2022 21:16:49 -0000
Date: Fri, 21 Jan 2022 15:16:49 -0600
From: Rob Herring <robh@kernel.org>
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Jernej Skrabec <jernej.skrabec@siol.net>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Rob Landley <rob@landley.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@chromium.org>,
 tfiga@chromium.org, 
 drinkcat@chromium.org, pihsun@chromium.org, hsinyi@google.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Maoguang Meng <maoguang.meng@mediatek.com>,
 daoyuan huang <daoyuan.huang@mediatek.com>, 
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, menghui.lin@mediatek.com,
 sj.huang@mediatek.com, 
 allen-kh.cheng@mediatek.com, randy.wu@mediatek.com, jason-jh.lin@mediatek.com, 
 roy-cw.yeh@mediatek.com, river.cheng@mediatek.com, 
 srv_heupstream@mediatek.com
Subject: Re: [PATCH v11 1/3] dt-binding: mt8183: add Mediatek MDP3 dt-bindings
Message-ID: <YesiwTSxa9HJ1lxG@robh.at.kernel.org>
References: <20220105093758.6850-1-moudy.ho@mediatek.com>
 <20220105093758.6850-2-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220105093758.6850-2-moudy.ho@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_131653_375397_1DD537FE 
X-CRM114-Status: GOOD (  30.01  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jan 05, 2022 at 05:37:56PM +0800, Moudy Ho wrote:
> This patch adds DT binding document for Media Data Path 3 (MDP3)
> a unit in multimedia system used for scaling and color format convert.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  .../bindings/media/mediatek,mdp3-rdma.yaml    | 193 ++++++++++++++++++
>  .../bindings/media/mediatek,mdp3-rsz.yaml     |  55 +++++
>  .../bindings/media/mediatek,mdp3-wrot.yaml    |  57 ++++++
>  .../bindings/soc/mediatek/mediatek,ccorr.yaml |  47 +++++
>  .../bindings/soc/mediatek/mediatek,wdma.yaml  |  58 ++++++
>  5 files changed, 410 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,ccorr.yaml
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> new file mode 100644
> index 000000000000..002503383934
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> @@ -0,0 +1,193 @@
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
> +    oneOf:
> +      - items:
> +          # MDP3 controller node
> +          - const: mediatek,mt8183-mdp3

How is this more specific than this:

> +          - const: mediatek,mt8183-mdp3-rdma0

> +      - items:
> +          # normal RDMA conponent
> +          - const: mediatek,mt8183-mdp3-rdma0
> +
> +  mediatek,scp:
> +    description: The node of system control processor (SCP), using
> +      the remoteproc & rpmsg framework.
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    maxItems: 1
> +
> +  mediatek,mdp3-comps:
> +    description: MTK sub-system of direct-link or DIP

This needs a better description. What is DIP? What is direct-link?

> +    $ref: /schemas/types.yaml#/definitions/string-array
> +    items:
> +      - enum:
> +          # MDP direct-link input path selection, create a
> +          # component for path connectedness of HW pipe control
> +          - mediatek,mt8183-mdp3-dl1
> +      - enum:
> +          - mediatek,mt8183-mdp3-dl2
> +      - enum:
> +          # MDP direct-link output path selection, create a
> +          # component for path connectedness of HW pipe control
> +          - mediatek,mt8183-mdp3-path1
> +      - enum:
> +          - mediatek,mt8183-mdp3-path2
> +      - enum:
> +          # Input DMA of ISP PASS2 (DIP) module for raw image input
> +          - mediatek,mt8183-mdp3-imgi
> +      - enum:
> +          # Output DMA of ISP PASS2 (DIP) module for YUV image output
> +          - mediatek,mt8183-mdp3-exto

There's only 1 possible value for mediatek,mdp3-comps, so why does it 
need to be in DT? 

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
> +    description: The register of client driver can be configured by gce with
> +      4 arguments defined in this property, such as phandle of gce, subsys id,
> +      register offset and size. Each GCE subsys id is mapping to a client
> +      defined in the header include/dt-bindings/gce/<chip>-gce.h.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - description: GCE client for RDMA
> +      - description: GCR client for MDP direct-link 1st and 2nd input
> +      - description: GCR client for MDP direct-link 1st output
> +      - description: GCR client for MDP direct-link 2nd output
> +      - description: GCR client for ISP input and output
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
> +  mediatek,mmsys:
> +    description: The node of mux(multiplexer) controller for HW connections.
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +  mediatek,mm-mutex:

Is this some sort of h/w lock? We have a standard binding for that.

> +    description: The node of sof(start of frame) signal controller.
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    maxItems: 1
> +
> +  mediatek,mailbox-gce:
> +    description: The node of global command engine (GCE), used to read/write
> +      registers with critical time limitation.
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +  mboxes:
> +    items:
> +      - description: used for 1st data pipe from RDMA
> +      - description: used for 2nd data pipe from RDMA
> +      - description: used for 3rd data pipe from Direct-Link
> +      - description: used for 4th data pipe from Direct-Link
> +
> +  gce-subsys:
> +    description: sub-system id corresponding to the global command engine (GCE)
> +      register address.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: mediatek,mt8183-mdp3
> +
> +then:
> +  required:
> +    - mediatek,scp
> +    - mediatek,mmsys
> +    - mediatek,mm-mutex
> +    - mediatek,mailbox-gce
> +    - mboxes
> +    - gce-subsys
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - mediatek,gce-client-reg
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
> +                   "mediatek,mt8183-mdp3-rdma0";
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
> +      mediatek,mmsys = <&mmsys>;
> +      mediatek,mm-mutex = <&mutex>;
> +      mediatek,mailbox-gce = <&gce>;
> +      mboxes = <&gce 20 CMDQ_THR_PRIO_LOWEST>,
> +               <&gce 21 CMDQ_THR_PRIO_LOWEST>,
> +               <&gce 22 CMDQ_THR_PRIO_LOWEST>,
> +               <&gce 23 CMDQ_THR_PRIO_LOWEST>;
> +      gce-subsys = <&gce 0x14000000 SUBSYS_1400XXXX>,
> +                   <&gce 0x14010000 SUBSYS_1401XXXX>,
> +                   <&gce 0x14020000 SUBSYS_1402XXXX>,
> +                   <&gce 0x15020000 SUBSYS_1502XXXX>;
> +    };
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
> new file mode 100644
> index 000000000000..cd4cf1531535
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
> @@ -0,0 +1,55 @@
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
> +          - mediatek,mt8183-mdp3-rsz0
> +          - mediatek,mt8183-mdp3-rsz1

Again, what's the difference between 0 and 1?

I've probably asked that before, but without a sufficient reasoning 
here in the schema I'm just going to keep asking the same question.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
