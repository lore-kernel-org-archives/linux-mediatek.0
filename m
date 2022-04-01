Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BDFC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Apr 2022 13:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xC4DXTt7t+9dQUkzZ8rDHIr/DMIHebbyayGKlQ8+XS8=; b=LGQ2qj7K7FCXXs
	+m6AMv2UnhF7ZcowLfy3U7XPnU2r+FWwxSdpnES82Mzls6ybaDgLR7KW5WC5nnc8/4g5bz6uR8/e1
	some5gJw5w50g2za+JbAyfJNaxL8jsP38oYwhGtfScs0JOzmofQOfPvni8E2Swn8Wc5qwNLcyJBqE
	uFjApaoNZptBhwc57hacQsVi1f7qXDIX0Z9w+kO2JvwHJ5/4oHyOlcvfwdjnJMcfoB2V4Da7xwmr8
	BCsm4O8AO8XWb/SxI4EsyCMuG4t2l/Yfe6E6PH0DFW7GN16aNK8y+OrnEE2+UL6TNhL9tFrZET1Hx
	D6jxmNqE3WCrn4zbnz7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naHVd-005pKv-1F; Fri, 01 Apr 2022 13:40:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naHVS-005pH5-NK; Fri, 01 Apr 2022 13:40:04 +0000
X-UUID: e3dc32c41b224129a5636007df45bc50-20220401
X-UUID: e3dc32c41b224129a5636007df45bc50-20220401
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jia-wei.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 652078877; Fri, 01 Apr 2022 06:39:55 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 1 Apr 2022 06:39:23 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 1 Apr 2022 21:39:16 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 1 Apr 2022 21:39:15 +0800
Message-ID: <126e0905c2eb9f22a0be46dd7aa8ac891622346d.camel@mediatek.com>
Subject: Re: [PATCH 1/3] dt-bindings: devfreq: mediatek: add mtk cci devfreq
 dt-bindings
From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, MyungJoo Ham
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
Date: Fri, 1 Apr 2022 21:39:15 +0800
In-Reply-To: <aa34eccf-ef08-4a8f-7a6c-7fbd05bd54b6@kernel.org>
References: <20220307122513.11822-1-jia-wei.chang@mediatek.com>
 <20220307122513.11822-2-jia-wei.chang@mediatek.com>
 <bf418e08-2e32-5e61-abd8-abb0d8f5c080@canonical.com>
 <13482b1b4244df5c0c0a4d6a60cdb2a7ba88500a.camel@mediatek.com>
 <aa34eccf-ef08-4a8f-7a6c-7fbd05bd54b6@kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_064002_800079_554BB7A6 
X-CRM114-Status: GOOD (  40.66  )
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

On Thu, 2022-03-24 at 13:44 +0100, Krzysztof Kozlowski wrote:
> On 24/03/2022 13:11, Jia-Wei Chang wrote:
> > > 
> > > Remove "driver Device Tree Bindings". "Devfreq" is Linuxism, so
> > > this
> > > maybe "bus frequency scaling"? Although later you call the device
> > > node
> > > as cci.
> > 
> > Should I use "Binding for MediaTek's Cache Coherent Interconnect
> > (CCI)
> > frequency and voltage scaling" as new title?
> 
> I just suggested to remove word "bindings" so do not add it again.
> This
> should be a title for hardware.

Sure, I will remove the word "bindings" from title.

> 
> Now what exactly is it - you should know better than me. :)
> "MediaTek's Cache Coherent Interconnect (CCI) frequency and voltage
> scaling" sounds good to me, assuming that this is the hardware we
> talk
> here about. :)

Appreciate your comments.
It's a bit hard to do upstream at first time, thank you for
understanding.

> 
> > 
> > > 
> > > > +
> > > > +maintainers:
> > > > +  - Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > > > +
> > > > +description: |
> > > > +  This module is used to create CCI DEVFREQ.
> > > > +  The performance will depend on both CCI frequency and CPU
> > > > frequency.
> > > > +  For MT8186, CCI co-buck with Little core.
> > > > +  Contain CCI opp table for voltage and frequency scaling.
> > > 
> > > Half of this description (first and last sentence) does not
> > > describe
> > > the
> > > actual hardware. Please describe hardware, not driver.
> > 
> > Sure, I will fix it in the next version.
> > 
> > > 
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: "mediatek,mt8186-cci"
> > > 
> > > No need for quotes.
> > 
> > Sure, I will fix it in the next version.
> > 
> > > 
> > > > +
> > > > +  clocks:
> > > > +    items:
> > > > +      - description:
> > > > +          The first one is the multiplexer for clock input of
> > > > CPU
> > > > cluster.
> > > > +      - description:
> > > > +          The other is used as an intermediate clock source
> > > > when
> > > > the original
> > > > +          CPU is under transition and not stable yet.
> > > > +
> > > > +  clock-names:
> > > > +    items:
> > > > +      - const: "cci"
> > > > +      - const: "intermediate"
> > > 
> > > No need for quotes.
> > 
> > Sure, I will fix it in the next version.
> > 
> > > 
> > > > +
> > > > +  operating-points-v2:
> > > > +    description:
> > > > +      For details, please refer to
> > > > +      Documentation/devicetree/bindings/opp/opp-v2.yaml
> > > > +
> > > > +  opp-table: true
> > > 
> > > Same comments as your CPU freq bindings apply.
> > 
> > mtk-cci-devfreq is a new driver and its arch is same as mediatek-
> > cpufreq so that the properties of mtk-cci are refer to mediatek-
> > cpufreq 
> > bindings.
> > operating-point-v2 is used to determine the voltage and frequency
> > of
> > dvfs which is further utilized by mtk-cci-devfreq.
> 
> "operating-point-v2" is understood, but the same as in cpufreq
> bindings,
> I am questioning why do you have "opp-table: true". It's a bit
> confusing, so maybe I miss something?

Yes, you're correct.
"opp-table: true" should be removed.
I messed it up.

> 
> > 
> > > 
> > > > +
> > > > +  proc-supply:
> > > > +    description:
> > > > +      Phandle of the regulator for CCI that provides the
> > > > supply
> > > > voltage.
> > > > +
> > > > +  sram-supply:
> > > > +    description:
> > > > +      Phandle of the regulator for sram of CCI that provides
> > > > the
> > > > supply
> > > > +      voltage. When present, the cci devfreq driver needs to
> > > > do
> > > > +      "voltage tracking" to step by step scale up/down Vproc
> > > > and
> > > > Vsram to fit
> > > > +      SoC specific needs. When absent, the voltage scaling
> > > > flow is
> > > > handled by
> > > > +      hardware, hence no software "voltage tracking" is
> > > > needed.
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - clocks
> > > > +  - clock-names
> > > > +  - operating-points-v2
> > > > +  - proc-supply
> > > > +
> > > > +additionalProperties: false
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    #include <dt-bindings/clock/mt8186-clk.h>
> > > > +    cci: cci {
> > > 
> > > Node names should be generic and describe type of device. Are you
> > > sure
> > > this is a CCI? Maybe "interconnect" suits it better?
> > 
> > Yes, this is a CCI and it is generic type of device like CPU in my
> > opinion.
> > If my understanding is correct, CCI is more suitable.
> 
> OK.

:)

> 
> > 
> > > 
> > > > +      compatible = "mediatek,mt8186-cci";
> > > > +      clocks = <&mcusys CLK_MCU_ARMPLL_BUS_SEL>, <&apmixedsys
> > > > CLK_APMIXED_MAINPLL>;
> > > > +      clock-names = "cci", "intermediate";
> > > > +      operating-points-v2 = <&cci_opp>;
> > > > +      proc-supply = <&mt6358_vproc12_reg>;
> > > > +      sram-supply = <&mt6358_vsram_proc12_reg>;
> > > > +    };
> > > 
> > > 
> > > Best regards,
> > > Krzysztof
> 
> 
> Best regards,
> Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
