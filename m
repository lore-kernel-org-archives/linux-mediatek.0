Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D30C28D13
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 02:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wZxzkHRZSIGCUiGfmWqljtPv8MGyBl4BFXZjr0xyNCw=; b=gAtFz6cfACfqtD4vao0pd4KR8F
	HCT0rLzNCCXCPtqqhThgwnOzFU9dNrjeyJbDQpagy92L8tVZxHzikpMYI7dBQ52QCmvq7Bv5Nnpd6
	2UoBx55eEe4zWI8D7ZDpg4kKvZAm7nkbGXxFX9lYmNrtrl2EmBnklkzOiP3tefZeYJSxl/bUqZ/aB
	R1ChaYuPDfsTrZ+im/fFWJfxaJKtl0P4WZum1sAD9gcYw7xd1GqvMkrImwr9nQF3jwEoDHUYBpMhl
	opk9hR3w0P1Jcu5NEGWWBZLcdTblL9uYQRO7IcQSrwAeUosFYaGaOSodTCreMcGaaEctzGehbqIvg
	lXMe7Xsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQK4h-000yMn-Q5; Tue, 23 Aug 2022 02:55:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQK46-000xqG-KF; Tue, 23 Aug 2022 02:54:57 +0000
X-UUID: 9011187747f547398dee83da9928d7af-20220822
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=wZxzkHRZSIGCUiGfmWqljtPv8MGyBl4BFXZjr0xyNCw=;
	b=IJp/wOnJP4DarPoHpUDn4HVp5We6JY1qN9cc2GfVPWBoEzz4+u7iEhqHsHHMxKVUaAxHV51N0PVxdw3xPV97oYauZsC8bF1QOFC3g3GpMTggEMMpmkhVwmtIYdc8e27KJ+4uaT84ry6ExIx/UeTcOBYp9cp+6f9CmZqaPiwWQeo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:d744e8b2-cff3-4a03-bdf6-8b5346cc6a73,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:9f16fd67-a9d9-4672-a3c8-12721739a220,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 9011187747f547398dee83da9928d7af-20220822
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 408161878; Mon, 22 Aug 2022 19:50:34 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 23 Aug 2022 10:19:58 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 23 Aug 2022 10:19:58 +0800
Message-ID: <a8095bc498a3412c429c22cbcbdd0ef44e6eb257.camel@mediatek.com>
Subject: Re: [PATCH v25 2/4] dt-binding: mediatek: add bindings for MediaTek
 CCORR and WDMA
From: moudy ho <moudy.ho@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Landley <rob@landley.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Alexandre Courbot
	<acourbot@chromium.org>, <tfiga@chromium.org>, <drinkcat@chromium.org>,
	<pihsun@chromium.org>, <hsinyi@google.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<cellopoint.kai@gmail.com>
Date: Tue, 23 Aug 2022 10:19:58 +0800
In-Reply-To: <19c4e6ec-8252-1b25-6999-a0b24bbf7dbb@gmail.com>
References: <20220817095629.29911-1-moudy.ho@mediatek.com>
	 <20220817095629.29911-3-moudy.ho@mediatek.com>
	 <19c4e6ec-8252-1b25-6999-a0b24bbf7dbb@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_195454_997159_76E47BBE 
X-CRM114-Status: GOOD (  24.95  )
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

Hi Matthias,

On Mon, 2022-08-22 at 16:32 +0200, Matthias Brugger wrote:
> 
> On 17/08/2022 11:56, Moudy Ho wrote:
> > This patch adds DT binding documentation for MediaTek's CCORR and
> > WDMA components.
> > These components exist in both MediaTek's Media Data Path 3(MDP3)
> > and DRM,
> > and the bindings are placed under the folder "./soc/mediatek" to
> > prevent
> > duplicate builds.
> > 
> > Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >   .../bindings/soc/mediatek/mediatek,ccorr.yaml | 68
> > ++++++++++++++++
> >   .../bindings/soc/mediatek/mediatek,wdma.yaml  | 81
> > +++++++++++++++++++
> >   2 files changed, 149 insertions(+)
> >   create mode 100644
> > Documentation/devicetree/bindings/soc/mediatek/mediatek,ccorr.yaml
> >   create mode 100644
> > Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/soc/mediatek/mediatek,ccorr.yam
> > l
> > b/Documentation/devicetree/bindings/soc/mediatek/mediatek,ccorr.yam
> > l
> > new file mode 100644
> > index 000000000000..10786d769750
> > --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/soc/mediatek/mediatek,ccorr.yam
> > l
> > @@ -0,0 +1,68 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/soc/mediatek/mediatek,ccorr.yaml*__;Iw!!CTRNKA9wMg0ARbw!3h7qYnjiwvN90iwxMZCIpxo-QWZqllWu4mMpB6NSjDHPKnuM4mITblmweAeVniXJ$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!3h7qYnjiwvN90iwxMZCIpxo-QWZqllWu4mMpB6NSjDHPKnuM4mITblmweCOWt0j9$
> >  
> > +
> > +title: MediaTek color correction
> > +
> > +maintainers:
> > +  - Matthias Brugger <matthias.bgg@gmail.com>
> > +  - Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> 
> Same here.
> 
> Regards,
> Matthias
> 

Thanks for the reminder, I'll deal with it together with the previous
patch

Regards,
Moudy

> > +
> > +description: |
> > +  MediaTek color correction with 3X3 matrix.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - mediatek,mt8183-mdp3-ccorr
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  mediatek,gce-client-reg:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    items:
> > +      items:
> > +        - description: phandle of GCE
> > +        - description: GCE subsys id
> > +        - description: register offset
> > +        - description: register size
> > +    description: The register of client driver can be configured
> > by gce with
> > +      4 arguments defined in this property. Each GCE subsys id is
> > mapping to
> > +      a client defined in the header include/dt-
> > bindings/gce/<chip>-gce.h.
> > +
> > +  mediatek,gce-events:
> > +    description:
> > +      The event id which is mapping to the specific hardware event
> > signal
> > +      to gce. The event id is defined in the gce header
> > +      include/dt-bindings/gce/<chip>-gce.h of each chips.
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +
> > +  clocks:
> > +    minItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - mediatek,gce-client-reg
> > +  - mediatek,gce-events
> > +  - clocks
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/mt8183-clk.h>
> > +    #include <dt-bindings/gce/mt8183-gce.h>
> > +
> > +    mdp3_ccorr: mdp3-ccorr@1401c000 {
> > +      compatible = "mediatek,mt8183-mdp3-ccorr";
> > +      reg = <0x1401c000 0x1000>;
> > +      mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0xc000
> > 0x1000>;
> > +      mediatek,gce-events = <CMDQ_EVENT_MDP_CCORR_SOF>,
> > +                            <CMDQ_EVENT_MDP_CCORR_EOF>;
> > +      clocks = <&mmsys CLK_MM_MDP_CCORR>;
> > +    };
> > diff --git
> > a/Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml
> > b/Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml
> > new file mode 100644
> > index 000000000000..95ec19543945
> > --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml
> > @@ -0,0 +1,81 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/soc/mediatek/mediatek,wdma.yaml*__;Iw!!CTRNKA9wMg0ARbw!3h7qYnjiwvN90iwxMZCIpxo-QWZqllWu4mMpB6NSjDHPKnuM4mITblmweNEpTeKs$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!3h7qYnjiwvN90iwxMZCIpxo-QWZqllWu4mMpB6NSjDHPKnuM4mITblmweCOWt0j9$
> >  
> > +
> > +title: MediaTek Write Direct Memory Access
> > +
> > +maintainers:
> > +  - Matthias Brugger <matthias.bgg@gmail.com>
> > +  - Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> > +
> > +description: |
> > +  MediaTek Write Direct Memory Access(WDMA) component used to
> > write
> > +  the data into DMA.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - mediatek,mt8183-mdp3-wdma
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  mediatek,gce-client-reg:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    items:
> > +      items:
> > +        - description: phandle of GCE
> > +        - description: GCE subsys id
> > +        - description: register offset
> > +        - description: register size
> > +    description: The register of client driver can be configured
> > by gce with
> > +      4 arguments defined in this property. Each GCE subsys id is
> > mapping to
> > +      a client defined in the header include/dt-
> > bindings/gce/<chip>-gce.h.
> > +
> > +  mediatek,gce-events:
> > +    description:
> > +      The event id which is mapping to the specific hardware event
> > signal
> > +      to gce. The event id is defined in the gce header
> > +      include/dt-bindings/gce/<chip>-gce.h of each chips.
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 1
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - mediatek,gce-client-reg
> > +  - mediatek,gce-events
> > +  - power-domains
> > +  - clocks
> > +  - iommus
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/mt8183-clk.h>
> > +    #include <dt-bindings/gce/mt8183-gce.h>
> > +    #include <dt-bindings/power/mt8183-power.h>
> > +    #include <dt-bindings/memory/mt8183-larb-port.h>
> > +
> > +    mdp3_wdma: mdp3-wdma@14006000 {
> > +      compatible = "mediatek,mt8183-mdp3-wdma";
> > +      reg = <0x14006000 0x1000>;
> > +      mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x6000
> > 0x1000>;
> > +      mediatek,gce-events = <CMDQ_EVENT_MDP_WDMA0_SOF>,
> > +                            <CMDQ_EVENT_MDP_WDMA0_EOF>;
> > +      power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> > +      clocks = <&mmsys CLK_MM_MDP_WDMA0>;
> > +      iommus = <&iommu>;
> > +    };


