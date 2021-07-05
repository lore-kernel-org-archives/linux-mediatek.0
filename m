Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B670CC07E98
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 07:07:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76D7F613D1
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 07:07:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76D7F613D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AyDfLPgIF9qU7P4Hi6Hx1Arkh0ulD1utEO6ZXjjd0AA=; b=KfB1LezmMuVEw/
	FIwGHgSTUcCe3eNDZveffy5zVbRMtzo3+8jHvD8TC7wTz0bmpTqSiKuIAPV8+GquyMCEoco1thPpy
	MCyIGkfGLCYKV/0/xehpcXYPytECWrwEyzw3ciDpPt8U1QAuiPU5dDUkXu0ukkuiah/jVCUlJJSlD
	vnePpN5hYZ0tEX/pci+qYVQKWJJvBoSMgSZiIBRVoxk1wC/K/C6nUZASgIFQXLu5RjGKkSSkoio36
	KB8XFDB8+Ae/hteFlRf2PyPwjcxLUhDjynOnd1UymfPnNb/vTT4bLGRbAgSJ92xqJ8ExcTMCwFG5Q
	TfRZG4lbSCpRcgnBPfTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0Iha-0083RD-He; Mon, 05 Jul 2021 07:07:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0IhM-0083Oo-Cp; Mon, 05 Jul 2021 07:07:23 +0000
X-UUID: 0f688825c2564ad586ddb11430e8a3b9-20210705
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Ffu2+2e8K8rLiLzSe6GK67Bnstv0QBadhkV+Dm8eln4=; 
 b=YyERo1YVOiRVqCDHiMNDpz+yfeIz4H7CYEuDkMY9UTZh/12ukRjkA4IPnSNPWtCZXTKrFK9GgaPeot6SLHX+8r9OyVMjUSvhUmTuK2ZZC2ZxhlL84lpHPh6tCvWXMTYBCe9075EYG7jP/+4TOvSm6l0tape4dKFVhF2ndqe0poc=;
X-UUID: 0f688825c2564ad586ddb11430e8a3b9-20210705
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1192927531; Mon, 05 Jul 2021 00:07:16 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Jul 2021 00:01:28 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Jul 2021 15:01:27 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 5 Jul 2021 15:01:26 +0800
Message-ID: <52d6aada4b48cc3b72bc5beb1bb5ca6acf5e91aa.camel@mediatek.com>
Subject: Re: [PATCH v2 6/8] dt-bindings: mediatek: mt8195: add audio afe
 document
From: Trevor Wu <trevor.wu@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>,
 <alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <bicycle.tsai@mediatek.com>,
 <jiaxin.yu@mediatek.com>, <cychiang@google.com>, <aaronyu@google.com>
Date: Mon, 5 Jul 2021 15:01:26 +0800
In-Reply-To: <20210701201846.GA2783836@robh.at.kernel.org>
References: <20210629014736.31153-1-trevor.wu@mediatek.com>
 <20210629014736.31153-7-trevor.wu@mediatek.com>
 <20210701201846.GA2783836@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_000720_472435_2CE32041 
X-CRM114-Status: GOOD (  25.78  )
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

On Thu, 2021-07-01 at 14:18 -0600, Rob Herring wrote:
> On Tue, Jun 29, 2021 at 09:47:34AM +0800, Trevor Wu wrote:
> > This patch adds mt8195 audio afe document.
> > 
> > Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> > ---
> > This patch depends on the following series that have not been
> > accepted.
> > 
> > [1] Mediatek MT8195 clock support
> > 
https://patchwork.kernel.org/project/linux-mediatek/list/?series=501923
> > (dt-bindings/clock/mt8195-clk.h is included)
> > 
> > [2] Mediatek MT8195 power domain support
> > 
https://patchwork.kernel.org/project/linux-mediatek/list/?series=500709
> > (dt-bindings/power/mt8195-power.h is included)
> > ---
> >  .../bindings/sound/mt8195-afe-pcm.yaml        | 136
> > ++++++++++++++++++
> >  1 file changed, 136 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/mt8195-
> > afe-pcm.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/mt8195-afe-
> > pcm.yaml b/Documentation/devicetree/bindings/sound/mt8195-afe-
> > pcm.yaml
> > new file mode 100644
> > index 000000000000..a4fb5c7dd022
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml
> > @@ -0,0 +1,136 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/mt8195-afe-pcm.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Mediatek AFE PCM controller for mt8195
> > +
> > +maintainers:
> > +  - Trevor Wu <trevor.wu@mediatek.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt8195-audio
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  mediatek,topckgen:
> > +    $ref: "/schemas/types.yaml#/definitions/phandle"
> > +    description: The phandle of the mediatek topckgen controller
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: audio 26M clock
> > +      - description: AFE clock
> > +      - description: audio infra sys clock
> > +      - description: audio infra 26M clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: clk26m
> > +      - const: aud_afe
> > +      - const: infra_ao_audio
> > +      - const: infra_ao_audio_26m_b
> > +
> > +  etdm-in1-chn-disabled:
> 
> Needs a vendor prefix.
> 
> > +    $ref: /schemas/types.yaml#/definitions/uint8-array
> > +    maxItems: 24
> > +    description: Specify which input channel should be disabled.
> > +
> > +  etdm-in2-chn-disabled:
> 
> Needs a vendor prefix.
> 
> > +    $ref: /schemas/types.yaml#/definitions/uint8-array
> > +    maxItems: 16
> > +    description: Specify which input channel should be disabled.
> > +
> > +patternProperties:
> > +  "^etdm-in[1-2]-mclk-source$":
> 
> And all these need a vendor prefix.
> 
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Specify etdm in mclk source clock.
> > +    enum:
> > +      - 0 # xtal_26m_ck
> > +      - 1 # apll1_ck
> > +      - 2 # apll2_ck
> > +      - 3 # apll3_ck
> > +      - 4 # apll4_ck
> > +      - 5 # apll5_ck
> > +      - 6 # hdmirx_apll_ck
> > +
> > +  "^etdm-out[1-3]-mclk-source$":
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Specify etdm out mclk source clock.
> > +
> > +  "^etdm-in[1-2]-mclk-alwasys-on-rate$":
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Specify etdm in mclk output rate for always on
> > case.
> 
> Hz? If so, '-hz' unit suffix and drop the type ref.
> 

Yes, it's Hz.
I will add unit suffix and drop the type.

> > +
> > +  "^etdm-out[1-3]-mclk-alwasys-on-rate$":
> 
> typo: alwasys
> 
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Specify etdm out mclk output rate for always on
> > case.
> 
> Hz?
> 
> > +
> > +  "^etdm-in[1-2]-data-mode$":
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Specify etdm in data mode.
> > +    enum:
> > +      - 0 # one pin (TDM)
> > +      - 1 # multi pin (I2S)
> 
> Can be boolean?
> 
Yes, becasue only two options can be configured for data mode.
I will replace it with a bool property like "mediatek,etdm-in[1-2]-
multi-pin-mode".

> > +
> > +  "^etdm-out[1-3]-data-mode$":
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Specify etdm out data mode.
> 
> Constraints on values?
> 
> > +
> > +  "^etdm-in[1-2]-cowork-source$":
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: |
> > +      etdm modules can share the same external clock pin. Specify
> > +      which etdm clock source is required by this etdm in moudule.
> > +    enum:
> > +      - 0 # etdm1_in
> > +      - 1 # etdm2_in
> > +      - 2 # etdm1_out
> > +      - 3 # etdm2_out
> > +      - 4 # etdm3_out
> > +
> > +  "^etdm-out[1-3]-cowork-source$":
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: |
> > +      etdm modules can share the same external clock pin. Specify
> > +      which etdm clock source is required by this etdm out
> > moudule.
> 
> Constraints?
> 
> > +
> > +required:
> > +  - compatible
> > +  - interrupts
> > +  - mediatek,topckgen
> > +  - power-domains
> > +  - clocks
> > +  - clock-names
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/mt8195-clk.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/power/mt8195-power.h>
> > +
> > +    afe: mt8195-afe-pcm {
> > +        compatible = "mediatek,mt8195-audio";
> > +        interrupts = <GIC_SPI 822 IRQ_TYPE_LEVEL_HIGH 0>;
> > +        mediatek,topckgen = <&topckgen>;
> > +        power-domains = <&spm MT8195_POWER_DOMAIN_AUDIO>;
> > +        clocks = <&clk26m>,
> > +                 <&audsys CLK_AUD_AFE>,
> > +                 <&infracfg_ao CLK_INFRA_AO_AUDIO>,
> > +                 <&infracfg_ao CLK_INFRA_AO_AUDIO_26M_B>;
> > +        clock-names = "clk26m",
> > +                      "aud_afe",
> > +                      "infra_ao_audio",
> > +                      "infra_ao_audio_26m_b";
> > +    };
> > +
> > +...
> > -- 
> > 2.18.0
> > 

Thanks for your reviewing.
I will correct all problems on v3.

Thanks,
Trevor
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
