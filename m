Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFEA9C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 12:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AYb32BRP9p9PjbZH6SqEkoraLbJSQQ/pjHg3reg8LSQ=; b=sdRlB5HOY4/PCj
	EoXjJmmjPk8f4ujNjGuQLYFApu+h0kZ31xcfLWhEn9YoioyNMGZoKEyjxNo9X4Cv6C7Dk6iZ3yMx0
	XfYHvJb2GCkO6wCTgTXI7wFU/zs/IgMSqPulCjZtP28T7DI0fu+RTo2xzogobZ12jG8kAhUoRgozY
	3lFdybyo+VS7K1wp1ryMzt84HATTGC5bpGZP0QvCxNHwboQBFClSzka1ZDxb7sXxI5rttV4MLJKWw
	8l7iNl3HSjGvPLApOK2eY/om4Op1iJKRucmkVX8tfLo5+FI7ZiTw0kxblK28LYI/tfuQb8wi3Eknj
	9w2ZyIag74bNNm+hL1ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXMPX-00GSE5-7R; Thu, 24 Mar 2022 12:17:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXMPJ-00GSAF-K2; Thu, 24 Mar 2022 12:17:39 +0000
X-UUID: ecccac4a59a44cd88a9cac45e601c3ad-20220324
X-UUID: ecccac4a59a44cd88a9cac45e601c3ad-20220324
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jia-wei.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1645543411; Thu, 24 Mar 2022 05:17:31 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Mar 2022 05:11:16 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 24 Mar 2022 20:11:08 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 24 Mar 2022 20:11:08 +0800
Message-ID: <13482b1b4244df5c0c0a4d6a60cdb2a7ba88500a.camel@mediatek.com>
Subject: Re: [PATCH 1/3] dt-bindings: devfreq: mediatek: add mtk cci devfreq
 dt-bindings
From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <fan.chen@mediatek.com>,
 <louis.yu@mediatek.com>, <roger.lu@mediatek.com>,
 <Allen-yy.Lin@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <hsinyi@google.com>,
 Jia-Wei Chang <jia-wei.chang@mediatek.corp-partner.google.com>
Date: Thu, 24 Mar 2022 20:11:08 +0800
In-Reply-To: <bf418e08-2e32-5e61-abd8-abb0d8f5c080@canonical.com>
References: <20220307122513.11822-1-jia-wei.chang@mediatek.com>
 <20220307122513.11822-2-jia-wei.chang@mediatek.com>
 <bf418e08-2e32-5e61-abd8-abb0d8f5c080@canonical.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_051737_680098_5876E832 
X-CRM114-Status: GOOD (  34.58  )
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

Dear Krzysztof,

Thanks for your comments.
Pardon me for my late reply.

On Mon, 2022-03-07 at 22:42 +0100, Krzysztof Kozlowski wrote:
> On 07/03/2022 13:25, Tim Chang wrote:
> > add devicetree binding of mtk cci devfreq on MediaTek SoC.
> 
> Start with capital letter.

Sure, I will update it for the whole series in next version.

> 
> > 
> > Signed-off-by: Jia-Wei Chang <
> > jia-wei.chang@mediatek.corp-partner.google.com>
> 
> This does not match your From. Please fix this in all your
> submissions.

Sure, I will update it for the whole series in next version.

> 
> > ---
> >  .../devicetree/bindings/devfreq/mtk-cci.yaml  | 73
> > +++++++++++++++++++
> >  1 file changed, 73 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/devfreq/mtk-
> > cci.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/devfreq/mtk-cci.yaml 
> > b/Documentation/devicetree/bindings/devfreq/mtk-cci.yaml
> > new file mode 100644
> > index 000000000000..e64ac4c56758
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/devfreq/mtk-cci.yaml
> > @@ -0,0 +1,73 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/devfreq/mtk-cci.yaml*__;Iw!!CTRNKA9wMg0ARbw!2apx_16V_XMrl28ae1aDO3-2WFga3xJiACU_40mgGydrumBmFuHcQFpW_LnX6DHny5Zpig$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!2apx_16V_XMrl28ae1aDO3-2WFga3xJiACU_40mgGydrumBmFuHcQFpW_LnX6DEPqkDN4g$
> >  
> > +
> > +title: Mediatek Cache Coherent Interconnect (CCI) Devfreq driver
> > Device Tree Bindings
> 
> Similarly to your other patches - the title describes hardware.
> Please
> fix it in all your submissions of all your series.

Sure, I will fix them in the next version.

> 
> Remove "driver Device Tree Bindings". "Devfreq" is Linuxism, so this
> maybe "bus frequency scaling"? Although later you call the device
> node
> as cci.

Should I use "Binding for MediaTek's Cache Coherent Interconnect (CCI)
frequency and voltage scaling" as new title?

> 
> > +
> > +maintainers:
> > +  - Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > +
> > +description: |
> > +  This module is used to create CCI DEVFREQ.
> > +  The performance will depend on both CCI frequency and CPU
> > frequency.
> > +  For MT8186, CCI co-buck with Little core.
> > +  Contain CCI opp table for voltage and frequency scaling.
> 
> Half of this description (first and last sentence) does not describe
> the
> actual hardware. Please describe hardware, not driver.

Sure, I will fix it in the next version.

> 
> > +
> > +properties:
> > +  compatible:
> > +    const: "mediatek,mt8186-cci"
> 
> No need for quotes.

Sure, I will fix it in the next version.

> 
> > +
> > +  clocks:
> > +    items:
> > +      - description:
> > +          The first one is the multiplexer for clock input of CPU
> > cluster.
> > +      - description:
> > +          The other is used as an intermediate clock source when
> > the original
> > +          CPU is under transition and not stable yet.
> > +
> > +  clock-names:
> > +    items:
> > +      - const: "cci"
> > +      - const: "intermediate"
> 
> No need for quotes.

Sure, I will fix it in the next version.

> 
> > +
> > +  operating-points-v2:
> > +    description:
> > +      For details, please refer to
> > +      Documentation/devicetree/bindings/opp/opp-v2.yaml
> > +
> > +  opp-table: true
> 
> Same comments as your CPU freq bindings apply.

mtk-cci-devfreq is a new driver and its arch is same as mediatek-
cpufreq so that the properties of mtk-cci are refer to mediatek-cpufreq 
bindings.
operating-point-v2 is used to determine the voltage and frequency of
dvfs which is further utilized by mtk-cci-devfreq.

> 
> > +
> > +  proc-supply:
> > +    description:
> > +      Phandle of the regulator for CCI that provides the supply
> > voltage.
> > +
> > +  sram-supply:
> > +    description:
> > +      Phandle of the regulator for sram of CCI that provides the
> > supply
> > +      voltage. When present, the cci devfreq driver needs to do
> > +      "voltage tracking" to step by step scale up/down Vproc and
> > Vsram to fit
> > +      SoC specific needs. When absent, the voltage scaling flow is
> > handled by
> > +      hardware, hence no software "voltage tracking" is needed.
> > +
> > +required:
> > +  - compatible
> > +  - clocks
> > +  - clock-names
> > +  - operating-points-v2
> > +  - proc-supply
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/mt8186-clk.h>
> > +    cci: cci {
> 
> Node names should be generic and describe type of device. Are you
> sure
> this is a CCI? Maybe "interconnect" suits it better?

Yes, this is a CCI and it is generic type of device like CPU in my
opinion.
If my understanding is correct, CCI is more suitable.

> 
> > +      compatible = "mediatek,mt8186-cci";
> > +      clocks = <&mcusys CLK_MCU_ARMPLL_BUS_SEL>, <&apmixedsys
> > CLK_APMIXED_MAINPLL>;
> > +      clock-names = "cci", "intermediate";
> > +      operating-points-v2 = <&cci_opp>;
> > +      proc-supply = <&mt6358_vproc12_reg>;
> > +      sram-supply = <&mt6358_vsram_proc12_reg>;
> > +    };
> 
> 
> Best regards,
> Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
