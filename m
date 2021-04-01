Return-Path: <SRS0=qM2e=I6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32793C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 08:53:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB49A6023B
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 08:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB49A6023B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pjmU3rOXg8tfemyHD6EPi6yN6Pc/3a/z8OLpeD4yqGY=; b=SF6hJWOuUSJ2Uup8/vN34P4zy
	eHGCSAYYUXlOOerwqjPBuHFBoOGPk0su7xEh7a5X9aSDL70vAOOMGCYjonty11PGVclVTSC3/kN6Y
	yymSJMJNqepkThLU79uYt2+L8eOgRjKmhqhZeW3b7U8JmSqLCYcudJNlvsJ7PXBkYJ66JflzKWNPo
	dAJ2RRrfHXq0MLTQ/I41GSqa93+Mf1OmbFas84KmQYHJs+MgXzjtDm/Vf6E9mArgPQfEB0nnPKrx8
	vDuPusoiDx//Dhg3wqqylc6qDAHQYH93VRb6pfaLbKiy2JmkjwQv4AFPN9LtgojkHcg0CE1lad32e
	pMjbbkCrA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRt4e-008zRF-I2; Thu, 01 Apr 2021 08:53:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRt4P-008zN1-9z; Thu, 01 Apr 2021 08:52:58 +0000
X-UUID: 5c8ccaf0e74541ff89b7577681b9428b-20210401
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=+mRdvQcG1sPr7mh+7iiojmT5jqkB3QQNIqmNYJMfcWU=; 
 b=s13nbaCiZbPjlROJveniDscxa3/ZdQMOwIj77pP+fz9BXuKsp+6flFbW8MjmmlRo1Jqf13lTDVbcvt53eYDUHMhoCPYiFzMnNzXMvfC5GjAnLWRbOuQObviVBbMdso3I+F0y8KPbJhPqnSsH29nUhk8aWMYt0LTnHmpQaejbSKo=;
X-UUID: 5c8ccaf0e74541ff89b7577681b9428b-20210401
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <pk.chi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 995591999; Thu, 01 Apr 2021 01:52:45 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 1 Apr 2021 01:52:43 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 1 Apr 2021 16:52:42 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 1 Apr 2021 16:52:42 +0800
Message-ID: <1617267162.24434.31.camel@mtkswgap22>
Subject: Re: [PATCH v1 1/4] dt-bindings: memory: Add binding for MediaTek
 Common DRAM Controller
From: Po-Kai Chi <pk.chi@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, wsd_upstream <wsd_upstream@mediatek.com>, "CC
 Hwang =?UTF-8?Q?=28=E9=BB=83=E8=87=B4=E9=8A=93=29?=" <cc.hwang@mediatek.com>, 
 Loda Chou =?UTF-8?Q?=28=E5=91=A8=E5=AE=8F=E9=9C=96=29?=
 <Loda.Chou@mediatek.com>
Date: Thu, 1 Apr 2021 16:52:42 +0800
In-Reply-To: <20210330135814.GA224111@robh.at.kernel.org>
References: <1617081731-7408-1-git-send-email-pk.chi@mediatek.com>
 <1617081731-7408-2-git-send-email-pk.chi@mediatek.com>
 <20210330135814.GA224111@robh.at.kernel.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_095255_496479_90925DC3 
X-CRM114-Status: GOOD (  31.55  )
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

Hello Rob,

Thanks for the remind about dt_binding_check fail and the comments, my
reply is as follows and will fix it in the next version (v2).


Po-Kai

On Tue, 2021-03-30 at 21:58 +0800, Rob Herring wrote:
> On Tue, Mar 30, 2021 at 01:22:08PM +0800, Po-Kai Chi wrote:
> > This patch adds the documentation of the device-tree binding for
> > MediaTek Common DRAM Controller.
> > 
> > Signed-off-by: Po-Kai Chi <pk.chi@mediatek.com>
> > ---
> >  .../memory-controllers/mediatek,dramc.yaml         |  155 ++++++++++++++++++++
> >  1 file changed, 155 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,dramc.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,dramc.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,dramc.yaml
> > new file mode 100644
> > index 0000000..0217ce0
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,dramc.yaml
> > @@ -0,0 +1,155 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Copyright (c) 2021 MediaTek Inc.
> > +%YAML 1.2
> > +---
> > +$id: https://urldefense.com/v3/__http://devicetree.org/schemas/memory-controllers/mediatek,dramc.yaml*__;Iw!!CTRNKA9wMg0ARbw!y9zM5d-aNLK99Y_ag2yvqq3TI1Xvm6TV_Vu03VVD3Qbe69N1qZXFFk2DUFb6CG0$ 
> > +$schema: https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!y9zM5d-aNLK99Y_ag2yvqq3TI1Xvm6TV_Vu03VVD3Qbe69N1qZXFFk2DiMad89A$ 
> > +
> > +title: MediaTek DRAM Controller
> > +
> > +maintainers:
> > +  - Po-Kai Chi <pk.chi@mediatek.com>
> > +
> > +description: |
> > +  MediaTek DRAM controller (DRAMC) provides an interface to query information
> > +  about DRAM which collected from bootloader and device tree.
> > +  This is mainly used by MediaTek Extended Memory Interface (EMI) and DVFS Resource
> > +  Control (DVFSRC).
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - mediatek,mt6779-dramc
> > +
> > +  reg:
> > +    description:
> > +      Base address of MediaTek DRAM related hardware modules, each channel has
> > +      its own base address in order of
> > +      DRAMC_AO_{CH}, DRAMC_NAO_{CH}, DDRPHY_AO_{CH}.
> > +    minItems: 3            # 3 * N channels
> > +    maxItems: 6
> > +
> > +  dram_type:
> 
> These need to be either common or have a vendor prefix.
> 
> Also, s/_/-/

Okay, I have revised the naming rule according to writing-schema.rst.

> > +    description:
> > +      The DRAM type of current DRAM chip.
> > +      This property is filled in by bootloader according to the board hardware
> > +      configuration.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 7
> > +
> > +  support_channel_cnt:
> > +    description:
> > +      The maximum DRAM channel count supported by SoC.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 1
> > +    maximum: 4
> > +
> > +  channel_cnt:
> > +    description:
> > +      The DRAM channel count of current DRAM chip.
> > +      This property is filled in by bootloader according to the board hardware
> > +      configuration.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 1
> > +    maximum: 4
> > +
> > +  rank_cnt:
> > +    description:
> > +      The DRAM rank count of current DRAM chip.
> > +      This property is filled in by bootloader according to the board hardware
> > +      configuration.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 1
> > +    maximum: 2
> > +
> > +  rank_size:
> > +    description:
> > +      The size of each DRAM rank.
> > +      This property is filled in by bootloader according to the board hardware
> > +      configuration.
> > +    $ref: /schemas/types.yaml#/definitions/uint64

There may be some misunderstanding.
rank_size uses the full 64 bits to describe the size of each DRAM rank.
So the type of rank_size should be uint64-array, instead of uint64.

> > +    minItems: 1
> > +    maxItems: 2
> > +    items:
> > +      minimum: 0x0
> > +      maximum: 0x100000000    # support up to 4GB in single rank
> > +
> > +  mr_cnt:
> > +    description:
> > +      Specifies how many sets of DRAM mode register information to provide.
> > +      This property is filled in by bootloader according to the board hardware
> > +      configuration.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    maximum: 40    # total 40 MRs for JEDEC LPDDR4X
> > +
> > +  mr:
> > +    description:
> > +      Pair of DRAM mode register information.
> > +      This property is filled in by bootloader according to the board hardware
> > +      configuration.
> > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > +    maxItems: 40    # align with mr_cnt
> > +    items:
> > +      items:
> > +        - description:
> > +            Mode register index
> > +        - description:
> > +            Mode register value
> > +
> > +  freq_cnt:
> > +    description:
> > +      Specifies how many sets of DRAM data clock rate supported by SoC.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +  freq_step:
> > +    description:
> > +      The DRAM data clock rate may be slightly different from those defined
> > +      by the specification due to errors in multiples of the base frequency.
> > +      This describe the mapping from real data clock rate measured by
> > +      frequency meter to JEDEC data clock rate.
> > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > +    items:
> > +      items:
> > +        - description:
> > +            Real data rate
> > +        - description:
> > +            Spec data rate
> 
> Looks like an OPP table.

Yes, It's essentially an OPP table, but also records the relationship
between real data rate and spec data rate.

> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - dram_type
> > +  - support_channel_cnt
> > +  - channel_cnt
> > +  - rank_cnt
> > +  - mr_cnt
> > +  - freq_cnt
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    dramc@10230000 {
> > +        compatible = "mediatek,mt6779-dramc";
> > +        reg = <0 0x10230000 0 0x2000>, /* DRAMC AO CHA */
> > +            <0 0x10240000 0 0x2000>,   /* DRAMC AO CHB */
> > +            <0 0x10234000 0 0x1000>,   /* DRAMC NAO CHA */
> > +            <0 0x10244000 0 0x1000>,   /* DRAMC NAO CHB */
> > +            <0 0x10238000 0 0x2000>,   /* DDRPHY AO CHA */
> > +            <0 0x10248000 0 0x2000>;   /* DDRPHY AO CHB */
> > +        dram_type = <0>;
> > +        support_channel_cnt = <2>;
> > +        channel_cnt = <2>;
> > +        rank_cnt = <2>;
> > +        rank_size = <0x40000000 0x40000000>;
> 
> You defined this as 64-bit, so this is a single value?

No, these are independent values.I have updated the description of this
property in the previous paragraph.

And the sample will be updated to
mediatek,rank-size = <0x40000000>, <0x40000000>;

> 
> > +        mr_cnt = <1>;
> > +        mr = <0x5 0xff>;
> > +        freq_cnt = <6>;
> > +        freq_step = <3718 3733>,
> > +                <3094 3200>,
> > +                <2392 2400>,
> > +                <1534 1600>,
> > +                <1196 1200>,
> > +                <754 800>;
> > +    };
> > -- 
> > 1.7.9.5
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
