Return-Path: <SRS0=Y38d=MP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1A1AC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 23:14:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9268B60F23
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 23:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9268B60F23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jHN1whNVXa3u+b394qjsu5NijebkyQohzqjsnS62ZnY=; b=OSqomor0itcDpz
	FSx7Na+T2KMqUL6QYg1cd7FZKVdAvNSddA233iE82GDNfN94LoA0YKWoxFh52dONCaYK1XXiFYtVd
	d+5tC8i7crEumOVtgOXen8AMP+/JGVATbgcN2h4wTenQ5wi9OP5g5kZJDW0t8A/Qs+XVtdb+9lTju
	JBCwakjEkR7pnmdOnbo+qMiO1BaeOQVlwIqueZDQt5UwgXILih5CVNSLqHz+N1w94Z3jgVlLaXNCc
	qY0Vwthg5VAkAxg4GUnXqeER61uK1i9ZStXKWJypwdJ7+9XlgvI9GZEJ/+GZylAxuGB1r8+qczKvL
	Fm+MwEpDDrK/50xRjDlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m74Mk-006MtW-N8; Fri, 23 Jul 2021 23:14:02 +0000
Received: from mail-io1-f52.google.com ([209.85.166.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m74MW-006Mrq-Ve; Fri, 23 Jul 2021 23:13:51 +0000
Received: by mail-io1-f52.google.com with SMTP id m13so4386322iol.7;
 Fri, 23 Jul 2021 16:13:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZB00Ds6KoI5x1WT5XNdgK15EVg0jEG6uuHyKMdGNqQo=;
 b=IlkIvrA9kzx9aqNqlGcXoqJwQPND+l2sw+JMKGP/Vx/h1Ou4OWP7mGH5/PNX6lhY+s
 RLY2w2C18xMgLXPyLt58rnIb0N/jAdukfDsqg1BCClWwIc3ZiErCuAELIT6g5/pE0rFP
 qLNcM2Y1P9lYCiniEjQE2MD9mrMrOSvg1QXU6aK6+lgfYx2lj6sCGu61o5/x2ahGy16/
 w64PoN6HHnXfwcirSTdjT1m7mi2Jk6GmAUuoGfx//PZxkHk8+zlaGaTEqVWrEhAWOMEL
 wvb5UNyDXPaDw14v9EWuYaALrmN+IdsEw5+ObNleNID37eeG9oqfqp7IRy4e0W6oYA8q
 CARw==
X-Gm-Message-State: AOAM533EFYmBXDhg6ZdfaiBy19+QQ1GgIhPkkPNT1tI5igtUHvhwoyfX
 Kkj+iKKa+cDnKc0GZxd5cw==
X-Google-Smtp-Source: ABdhPJwpOJQwg2W6oneYH/cmi1cz+nE8ciUCHDeXvjP+egp/W9YCayfPoS3lAFKDKaSvEtYtgKg94A==
X-Received: by 2002:a02:c491:: with SMTP id t17mr6045273jam.56.1627082026261; 
 Fri, 23 Jul 2021 16:13:46 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id l5sm18750954ion.44.2021.07.23.16.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 16:13:45 -0700 (PDT)
Received: (nullmailer pid 2785859 invoked by uid 1000);
 Fri, 23 Jul 2021 23:13:43 -0000
Date: Fri, 23 Jul 2021 17:13:43 -0600
From: Rob Herring <robh@kernel.org>
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 daoyuan huang <daoyuan.huang@mediatek.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Rob Landley <rob@landley.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, tfiga@chromium.org, drinkcat@chromium.org,
 acourbot@chromium.org, pihsun@chromium.org, menghui.lin@mediatek.com,
 sj.huang@mediatek.com, ben.lok@mediatek.com, randy.wu@mediatek.com,
 srv_heupstream@mediatek.com
Subject: Re: [PATCH v5 1/3] dt-binding: mt8183: Add Mediatek MDP3 dt-bindings
Message-ID: <20210723231343.GA2773035@robh.at.kernel.org>
References: <20210719074640.25058-1-moudy.ho@mediatek.com>
 <20210719074640.25058-2-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210719074640.25058-2-moudy.ho@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_161349_063046_9606BF99 
X-CRM114-Status: GOOD (  26.81  )
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

On Mon, Jul 19, 2021 at 03:46:38PM +0800, Moudy Ho wrote:
> This patch adds DT binding document for Media Data Path 3 (MDP3)
> a unit in multimedia system used for scaling and color format convert.
> 
> Signed-off-by: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> Signed-off-by: daoyuan huang <daoyuan.huang@mediatek.com>
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  .../bindings/media/mediatek-mdp3.yaml         | 274 ++++++++++++++++++
>  1 file changed, 274 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-mdp3.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek-mdp3.yaml b/Documentation/devicetree/bindings/media/mediatek-mdp3.yaml
> new file mode 100644
> index 000000000000..e3e10f0544ba
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek-mdp3.yaml
> @@ -0,0 +1,274 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek Media Data Path 3 Device Tree Bindings
> +
> +maintainers:
> +  - Daoyuan Huang <daoyuan.huang@mediatek.com>
> +  - Moudy Ho <moudy.ho@mediatek.com>
> +
> +description: |
> +  Media Data Path 3 (MDP3) is used for scaling and color space conversion.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +        - enum:
> +          # controller node
> +          - mediatek,mt8183-mdp3
> +        - enum:
> +          - mediatek,mt8183-mdp3-rdma
> +
> +      - items:
> +        - enum:
> +          # read DMA
> +          - mediatek,mt8183-mdp3-rdma
> +          # frame resizer
> +          - mediatek,mt8183-mdp3-rsz
> +          # write DMA
> +          - mediatek,mt8183-mdp3-wdma
> +          # write DMA with frame rotation
> +          - mediatek,mt8183-mdp3-wrot
> +          # color correction with 3X3 matrix
> +          - mediatek,mt8183-mdp3-ccorr

These are all different h/w blocks, right? I think they should be 
separate schema files. 


> +
> +  mediatek,scp:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    maxItems: 1
> +    description: |
> +      The node of system control processor (SCP), using
> +      the remoteproc & rpmsg framework.
> +      $ref: /schemas/remoteproc/mtk,scp.yaml
> +
> +  mediatek,mdp3-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maxItems: 1
> +    description: |
> +      HW index to distinguish same functionality modules.

We generally don't do indices in DT, so explain why this is needed or 
come up with another way (and aliases is not it).

> +
> +  mdp3-comps:
> +    $ref: /schemas/types.yaml#/definitions/string-array
> +    description: |
> +      Subcomponent, the number aligns with
> +      mdp_sub_comp_dt_ids[] in mtk-mdp3-comp.c.
> +
> +  mdp3-comp-ids:
> +    maxItems: 1
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description: |
> +      Index of the modules, the number list in
> +      mdp_comp_matches[] in mtk-mdp3-comp.c.

Bindings describe h/w. Why is this referring to some driver file?

> +
> +  reg:
> +    description: |
> +      Physical base address and length of the function block
> +      register space, the number aligns with the component
> +      and its own subcomponent.
> +
> +  mediatek,gce-client-reg:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: |
> +      sub-system id corresponding to the global command engine (GCE)
> +      register address.
> +      $ref: /schemas/mailbox/mtk-gce.txt
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 6
> +
> +  iommus:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      Should point to the respective IOMMU block with master
> +      port as argument.
> +      $ref: /schemas/iommu/mediatek,iommu.yaml
> +
> +  mediatek,mmsys:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    maxItems: 1
> +    description: |
> +      The node of mux(multiplexer) controller for HW connections.
> +
> +  mediatek,mm-mutex:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    maxItems: 1
> +    description: |
> +      The node of sof(start of frame) signal controller.
> +
> +  mediatek,mailbox-gce:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      The node of global command engine (GCE), used to read/write
> +      registers with critical time limitation.
> +      $ref: /schemas/mailbox/mtk-gce.txt
> +
> +  mboxes:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: |
> +      $ref: /schemas/mailbox/mailbox.txt
> +
> +  gce-subsys:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: |
> +      sub-system id corresponding to the global command engine (GCE)
> +      register address.
> +      $ref: /schemas/mailbox/mtk-gce.txt
> +
> +  mediatek,gce-events:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description: |
> +      In use event IDs list, all IDs are defined in
> +      'dt-bindings/gce/mt8183-gce.h'.
> +      $ref: /schemas/mailbox/mtk-gce.txt
> +
> +if:
> +  properties:
> +    compatible:
> +      items:
> +        - enum:
> +          - mediatek,mt8183-mdp3
> +        - enum:
> +          - mediatek,mt8183-mdp3-rdma
> +
> +then:
> +  required:
> +    - mediatek,scp
> +    - mediatek,mmsys
> +    - mediatek,mm-mutex
> +    - mediatek,gce-events
> +    - mediatek,mailbox-gce
> +    - mboxes
> +    - gce-subsys
> +
> +required:
> +  - compatible
> +  - mediatek,mdp3-id
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
> +                   "mediatek,mt8183-mdp3-rdma";
> +      mediatek,scp = <&scp>;
> +      mediatek,mdp3-id = <0>;
> +      mdp3-comps = "mediatek,mt8183-mdp3-dl", "mediatek,mt8183-mdp3-dl1",
> +                   "mediatek,mt8183-mdp3-imgi", "mediatek,mt8183-mdp3-exto";
> +      mdp3-comp-ids = <0 1 0 1>;
> +      reg = <0x14001000 0x1000>,
> +            <0x14000000 0x1000>,
> +            <0x15020000 0x1000>;
> +      mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x1000 0x1000>,
> +                                <&gce SUBSYS_1400XXXX 0 0x1000>,
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
> +      mboxes = <&gce 20 CMDQ_THR_PRIO_LOWEST 0>,
> +               <&gce 21 CMDQ_THR_PRIO_LOWEST 0>,
> +               <&gce 22 CMDQ_THR_PRIO_LOWEST 0>,
> +               <&gce 23 CMDQ_THR_PRIO_LOWEST 0>;
> +      gce-subsys = <&gce 0x14000000 SUBSYS_1400XXXX>,
> +                   <&gce 0x14010000 SUBSYS_1401XXXX>,
> +                   <&gce 0x14020000 SUBSYS_1402XXXX>,
> +                   <&gce 0x15020000 SUBSYS_1502XXXX>;
> +      mediatek,gce-events = <CMDQ_EVENT_MDP_RDMA0_SOF>,
> +                            <CMDQ_EVENT_MDP_RDMA0_EOF>,
> +                            <CMDQ_EVENT_MDP_RSZ0_SOF>,
> +                            <CMDQ_EVENT_MDP_RSZ1_SOF>,
> +                            <CMDQ_EVENT_MDP_TDSHP_SOF>,
> +                            <CMDQ_EVENT_MDP_WROT0_SOF>,
> +                            <CMDQ_EVENT_MDP_WROT0_EOF>,
> +                            <CMDQ_EVENT_MDP_WDMA0_SOF>,
> +                            <CMDQ_EVENT_MDP_WDMA0_EOF>,
> +                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_0>,
> +                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_1>,
> +                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_2>,
> +                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_3>,
> +                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_4>,
> +                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_5>,
> +                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_6>,
> +                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_7>,
> +                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_8>,
> +                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_9>,
> +                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_10>,
> +                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_11>,
> +                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_12>,
> +                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_13>,
> +                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_14>,
> +                            <CMDQ_EVENT_WPE_A_DONE>,
> +                            <CMDQ_EVENT_SPE_B_DONE>;
> +    };
> +
> +    mdp3_rsz0: mdp3_rsz0@14003000 {
> +      compatible = "mediatek,mt8183-mdp3-rsz";
> +      mediatek,mdp3-id = <0>;
> +      reg = <0x14003000 0x1000>;
> +      mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x3000 0x1000>;
> +      clocks = <&mmsys CLK_MM_MDP_RSZ0>;
> +    };
> +
> +    mdp3_rsz1: mdp3_rsz1@14004000 {
> +      compatible = "mediatek,mt8183-mdp3-rsz";
> +      mediatek,mdp3-id = <1>;
> +      reg = <0x14004000 0x1000>;
> +      mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x4000 0x1000>;
> +      clocks = <&mmsys CLK_MM_MDP_RSZ1>;
> +    };
> +
> +    mdp3_wrot0: mdp3_wrot0@14005000 {
> +      compatible = "mediatek,mt8183-mdp3-wrot";
> +      mediatek,mdp3-id = <0>;
> +      mdp3-comps = "mediatek,mt8183-mdp3-path";
> +      mdp3-comp-ids = <0>;
> +      reg = <0x14005000 0x1000>;
> +      mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x5000 0x1000>;
> +      power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> +      clocks = <&mmsys CLK_MM_MDP_WROT0>;
> +      iommus = <&iommu>;
> +    };
> +
> +    mdp3_wdma: mdp3_wdma@14006000 {
> +      compatible = "mediatek,mt8183-mdp3-wdma";
> +      mediatek,mdp3-id = <0>;
> +      mdp3-comps = "mediatek,mt8183-mdp3-path";
> +      mdp3-comp-ids = <1>;
> +      reg = <0x14006000 0x1000>;
> +      mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x6000 0x1000>;
> +      power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> +      clocks = <&mmsys CLK_MM_MDP_WDMA0>;
> +      iommus = <&iommu>;
> +    };
> +
> +    mdp3_ccorr: mdp3_ccorr@1401c000 {
> +      compatible = "mediatek,mt8183-mdp3-ccorr";
> +      mediatek,mdp3-id = <0>;
> +      reg = <0x1401c000 0x1000>;
> +      mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0xc000 0x1000>;
> +      clocks = <&mmsys CLK_MM_MDP_CCORR>;
> +    };
> +
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
