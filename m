Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FF62C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 14:00:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8754619C5
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 14:00:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8754619C5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OQ58fOefNIg4/3bJ7/8WoicIBJvd5I+/D/9ImHOJenc=; b=qJDBJcajx3gKGzIvuC6vC1o0O
	dUmjTi0kX/0JWDrZze5eUTjIM8M+k7g9122t3N9tyE12mJ+3pWX6+BhtLKG2XFGAqWgQh+NryIBX/
	UR3A4ItqChocn8Q8KL5UdZA1iCu6NYj1HWVOcuVETZlnWIDQfb+KXjNhWBLXBAOMAh1Eo47pAP6JS
	yAb8SXGEAoApmiJny8PdwzS5tGNLLY18aCT0ix1j0MqC8XBXoxRlIkfDVEQRK+Bn3Xe8gy+SiiCMh
	RyZ4WUyjFLtyz47j8yIeDkTBlNFDsog0ITeWJTIzvazXsv2ddESFk18cAOTlRMT1I6wI0eDkq1iEc
	Mo79DvRAg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lREuX-003uDF-7m; Tue, 30 Mar 2021 14:00:01 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lREss-003tiI-6u; Tue, 30 Mar 2021 13:59:37 +0000
Received: by mail-ot1-f53.google.com with SMTP id
 v24-20020a9d69d80000b02901b9aec33371so15647277oto.2; 
 Tue, 30 Mar 2021 06:58:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oE0RHINGOkrAhMuN+EDn+2x2x/JU6fqWc3MSjm6Mpgg=;
 b=FI2Cv8Ti0tRMota1lwjKJJjHYfiyfCWv6gvi/oW+T1g1B1GbumTckM4EEjqHzx3ZPX
 bWE9eVh06fuZmExh2BXLGUqDn/0y46h0AV7s2nD8J8zGTQogfWft1K27fsjf0C73qWSL
 JDfldS84G45Nzju+yxbakvEUDGg8C2uQNbMB91l3cp30Z7E8AGUbhwuWDT3NICrdQj8L
 U0ZaDQTw7qpS8klYLK6u7Ye8o7UdEPN/gXO1O/jc/UmaRhj9az2yRz6NdTtid5aI1nrI
 DV7t3xepFmL4pHkUq9a7Wixv7QYZ1oCibcuDi8sn8O2HVXq+Eb9L492IkiYE6FTLUFNa
 yveQ==
X-Gm-Message-State: AOAM533bsvdtNCJ0ieRbIH+HyOsGxoxST3Z3x2z607xPJJzj5FwBGdij
 dzKlkxsPEnPZC/m/NVuAww==
X-Google-Smtp-Source: ABdhPJwdk3X0YnGo9PphS+OE9pC3LG6IUB4vf009cllFj5x/3WRr6jQQnkKvfu5mxBrMwEaDbVTseQ==
X-Received: by 2002:a05:6830:1e14:: with SMTP id
 s20mr28670725otr.199.1617112697070; 
 Tue, 30 Mar 2021 06:58:17 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h18sm4432750oov.43.2021.03.30.06.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 06:58:15 -0700 (PDT)
Received: (nullmailer pid 238595 invoked by uid 1000);
 Tue, 30 Mar 2021 13:58:14 -0000
Date: Tue, 30 Mar 2021 08:58:14 -0500
From: Rob Herring <robh@kernel.org>
To: Po-Kai Chi <pk.chi@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 CC Hwang <cc.hwang@mediatek.com>, Loda Chou <loda.chou@mediatek.com>
Subject: Re: [PATCH v1 1/4] dt-bindings: memory: Add binding for MediaTek
 Common DRAM Controller
Message-ID: <20210330135814.GA224111@robh.at.kernel.org>
References: <1617081731-7408-1-git-send-email-pk.chi@mediatek.com>
 <1617081731-7408-2-git-send-email-pk.chi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1617081731-7408-2-git-send-email-pk.chi@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_145931_438680_7C9EBEE1 
X-CRM114-Status: GOOD (  23.97  )
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

On Tue, Mar 30, 2021 at 01:22:08PM +0800, Po-Kai Chi wrote:
> This patch adds the documentation of the device-tree binding for
> MediaTek Common DRAM Controller.
> 
> Signed-off-by: Po-Kai Chi <pk.chi@mediatek.com>
> ---
>  .../memory-controllers/mediatek,dramc.yaml         |  155 ++++++++++++++++++++
>  1 file changed, 155 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,dramc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,dramc.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,dramc.yaml
> new file mode 100644
> index 0000000..0217ce0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,dramc.yaml
> @@ -0,0 +1,155 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2021 MediaTek Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/memory-controllers/mediatek,dramc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek DRAM Controller
> +
> +maintainers:
> +  - Po-Kai Chi <pk.chi@mediatek.com>
> +
> +description: |
> +  MediaTek DRAM controller (DRAMC) provides an interface to query information
> +  about DRAM which collected from bootloader and device tree.
> +  This is mainly used by MediaTek Extended Memory Interface (EMI) and DVFS Resource
> +  Control (DVFSRC).
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt6779-dramc
> +
> +  reg:
> +    description:
> +      Base address of MediaTek DRAM related hardware modules, each channel has
> +      its own base address in order of
> +      DRAMC_AO_{CH}, DRAMC_NAO_{CH}, DDRPHY_AO_{CH}.
> +    minItems: 3            # 3 * N channels
> +    maxItems: 6
> +
> +  dram_type:

These need to be either common or have a vendor prefix.

Also, s/_/-/

> +    description:
> +      The DRAM type of current DRAM chip.
> +      This property is filled in by bootloader according to the board hardware
> +      configuration.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 7
> +
> +  support_channel_cnt:
> +    description:
> +      The maximum DRAM channel count supported by SoC.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    maximum: 4
> +
> +  channel_cnt:
> +    description:
> +      The DRAM channel count of current DRAM chip.
> +      This property is filled in by bootloader according to the board hardware
> +      configuration.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    maximum: 4
> +
> +  rank_cnt:
> +    description:
> +      The DRAM rank count of current DRAM chip.
> +      This property is filled in by bootloader according to the board hardware
> +      configuration.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    maximum: 2
> +
> +  rank_size:
> +    description:
> +      The size of each DRAM rank.
> +      This property is filled in by bootloader according to the board hardware
> +      configuration.
> +    $ref: /schemas/types.yaml#/definitions/uint64
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      minimum: 0x0
> +      maximum: 0x100000000    # support up to 4GB in single rank
> +
> +  mr_cnt:
> +    description:
> +      Specifies how many sets of DRAM mode register information to provide.
> +      This property is filled in by bootloader according to the board hardware
> +      configuration.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maximum: 40    # total 40 MRs for JEDEC LPDDR4X
> +
> +  mr:
> +    description:
> +      Pair of DRAM mode register information.
> +      This property is filled in by bootloader according to the board hardware
> +      configuration.
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +    maxItems: 40    # align with mr_cnt
> +    items:
> +      items:
> +        - description:
> +            Mode register index
> +        - description:
> +            Mode register value
> +
> +  freq_cnt:
> +    description:
> +      Specifies how many sets of DRAM data clock rate supported by SoC.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  freq_step:
> +    description:
> +      The DRAM data clock rate may be slightly different from those defined
> +      by the specification due to errors in multiples of the base frequency.
> +      This describe the mapping from real data clock rate measured by
> +      frequency meter to JEDEC data clock rate.
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +    items:
> +      items:
> +        - description:
> +            Real data rate
> +        - description:
> +            Spec data rate

Looks like an OPP table.

> +
> +required:
> +  - compatible
> +  - reg
> +  - dram_type
> +  - support_channel_cnt
> +  - channel_cnt
> +  - rank_cnt
> +  - mr_cnt
> +  - freq_cnt
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dramc@10230000 {
> +        compatible = "mediatek,mt6779-dramc";
> +        reg = <0 0x10230000 0 0x2000>, /* DRAMC AO CHA */
> +            <0 0x10240000 0 0x2000>,   /* DRAMC AO CHB */
> +            <0 0x10234000 0 0x1000>,   /* DRAMC NAO CHA */
> +            <0 0x10244000 0 0x1000>,   /* DRAMC NAO CHB */
> +            <0 0x10238000 0 0x2000>,   /* DDRPHY AO CHA */
> +            <0 0x10248000 0 0x2000>;   /* DDRPHY AO CHB */
> +        dram_type = <0>;
> +        support_channel_cnt = <2>;
> +        channel_cnt = <2>;
> +        rank_cnt = <2>;
> +        rank_size = <0x40000000 0x40000000>;

You defined this as 64-bit, so this is a single value?

> +        mr_cnt = <1>;
> +        mr = <0x5 0xff>;
> +        freq_cnt = <6>;
> +        freq_step = <3718 3733>,
> +                <3094 3200>,
> +                <2392 2400>,
> +                <1534 1600>,
> +                <1196 1200>,
> +                <754 800>;
> +    };
> -- 
> 1.7.9.5
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
