Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1CD0C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 09:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AKGcDz2zCteO4hjkVNjOFpl6hBfkcAmjRqnXAqDUMgQ=; b=iqPx4EE74dxfsF
	kyhpIIIDXc/u7/DNSW3WxvrkjidRKMIWT+hrfh1sRHH3sGKkTjczOiaNWQCDuG7tk5edKa4Uo2t3E
	dqRe+gHJPqtPhq8JWcnBGKLNgubdppOy3YGVrYtdEFIDY+TcOcx/Oy2yh6YwNslu0a9YB8HAFZbkh
	7vOmrlrHGho3tWJt5TBtsV68hLiyLroxxn5onJemg8YE+OraXP65J16hBeUf6Iv+bgE6enl4MV/Rf
	f4VE957ZqEfu7zV3s3ex2nJ43x5Am694ENOjLkbkGnTiVIzq6fUNrIwweTB8NesTSf0TB5DFGloh7
	1zf4b4z0nres0qqk2l2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXJvY-00G975-N7; Thu, 24 Mar 2022 09:38:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXJvC-00G90a-Dx; Thu, 24 Mar 2022 09:38:24 +0000
X-UUID: 264886e9f4984ff695d7e40945a2946c-20220324
X-UUID: 264886e9f4984ff695d7e40945a2946c-20220324
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <jia-wei.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 688593176; Thu, 24 Mar 2022 02:38:13 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Mar 2022 02:38:11 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 24 Mar 2022 17:38:09 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 24 Mar 2022 17:38:09 +0800
Message-ID: <2cf526d400c011b5172ba4fc2c3f03b4a4f371dc.camel@mediatek.com>
Subject: Re: [PATCH 1/4] dt-bindings: cpufreq: mediatek: transform
 cpufreq-mediatek into yaml
From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, "Rob
 Herring" <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, "Mark
 Brown" <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <fan.chen@mediatek.com>,
 <louis.yu@mediatek.com>, <roger.lu@mediatek.com>,
 <Allen-yy.Lin@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <hsinyi@google.com>,
 Jia-Wei Chang <jia-wei.chang@mediatek.corp-partner.google.com>
Date: Thu, 24 Mar 2022 17:38:09 +0800
In-Reply-To: <ee98d248-b2cd-e975-84df-448917a79287@canonical.com>
References: <20220307122151.11666-1-jia-wei.chang@mediatek.com>
 <20220307122151.11666-2-jia-wei.chang@mediatek.com>
 <ee98d248-b2cd-e975-84df-448917a79287@canonical.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_023822_514213_A73C9CFD 
X-CRM114-Status: GOOD (  34.00  )
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
Pardon me for not being familiar with upstream rules and my late reply.
I was supposed to have an internal review before submission and I will.

On Mon, 2022-03-07 at 19:57 +0100, Krzysztof Kozlowski wrote:
> On 07/03/2022 13:21, Tim Chang wrote:
> > convert Mediatek cpufreq devicetree binding to YAML.
> 
> Start with capital letter please.

Sure, I will update it in the next version.

> > 
> > Signed-off-by: Jia-Wei Chang <
> > jia-wei.chang@mediatek.corp-partner.google.com>
> > ---
> >  .../bindings/cpufreq/cpufreq-mediatek.yaml    | 131
> > ++++++++++++++++++
> >  1 file changed, 131 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.yaml
> 
> You wrote "convert" but where is the removal of TXT?

Sorry, I missed it and I will fix it in the next version.

> 
> > 
> > diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-
> > mediatek.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-
> > mediatek.yaml
> > new file mode 100644
> > index 000000000000..584946eb3790
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-
> > mediatek.yaml
> > @@ -0,0 +1,131 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/cpufreq/cpufreq-mediatek.yaml*__;Iw!!CTRNKA9wMg0ARbw!xbKG4TgD0MRpMLyGJVBZEGpZFrNOclrcxOCx_APKo5Nmg8nF2x5PcBdE0unvL2NdpChkMA$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!xbKG4TgD0MRpMLyGJVBZEGpZFrNOclrcxOCx_APKo5Nmg8nF2x5PcBdE0unvL2O8T_oxCQ$
> >  
> > +
> > +title: Mediatek CPUFREQ driver Device Tree Bindings
> 
> Please remove "driver Device Tree Bindings" because the title should
> describe the hardware. Therefore it could be something like "Mediatek
> SoC CPU frequency and voltage scaling".

Thanks for your suggestion of title.
Or should I use the origin title "Binding for MediaTek's CPUFreq
driver"?

> 
> How is it related to cpufreq-mediatek-hw.yaml? The names/title look
> unfortunately too similar.

No, mediatek-cpufreq is performing in kernel driver rather than on
hardware.
On the other hand, mediatek-cpufreq-hw is performing on hardware.
That's why "hw" is present in its name.

> 
> In general this does not look like proper bindings (see also below
> lack
> of compatible). Bindings describe the hardware, so what is exactly
> the
> hardware here?

Except for SoC, there's no requirement of hardware binding for
mediatek-cpufreq.
mediatek-cpufreq recognizes the compatible of Mediatek SoC while
probing.

> 
> > +
> > +maintainers:
> > +  - Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > +
> > +description: |
> > +  CPUFREQ is used for scaling clock frequency of CPUs.
> > +  The module cooperates with CCI DEVFREQ to manage frequency for
> > some Mediatek
> > +  SoCs.
> > +
> > +properties:
> 
> How is this schema going to be applied? I don't see here select
> neither
> compatible.

As mentioned above, only compatible of SoC is required for mediatek-
cpufreq.

> 
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
> > +      - const: "cpu"
> > +      - const: "intermediate"
> > +
> > +  operating-points-v2:
> > +    description:
> > +      For details, please refer to
> > +      Documentation/devicetree/bindings/opp/opp-v2.yaml
> > +
> > +  opp-table: true
> 
> You have operating-points-v2. What is this for? Did it exist in
> original
> bindings?

Yes, all of these properties exist in the original bindings.
operating-point-v2 is used to determine the voltage and frequency of
dvfs which is further utilized by mediatek-cpufreq here.

> 
> > +
> > +  proc-supply:
> > +    description:
> > +      Phandle of the regulator for CPU cluster that provides the
> > supply
> > +      voltage.
> > +
> > +  sram-supply:
> > +    description:
> > +      Phandle of the regulator for sram of CPU cluster that
> > provides the supply
> > +      voltage. When present, the cpufreq driver needs to do
> > "voltage tracking"
> > +      to step by step scale up/down Vproc and Vsram to fit SoC
> > specific needs.
> > +      When absent, the voltage scaling flow is handled by
> > hardware, hence no
> > +      software "voltage tracking" is needed.
> > +
> > +  "#cooling-cells":
> > +    description:
> > +      For details, please refer to
> > +      Documentation/devicetree/bindings/thermal/thermal-cooling-
> > devices.yaml
> 
> Skip description, it's obvious. Instead add here const with value.

Sure, I'll remove description and add const value in the next version.

> 
> 
> Best regards,
> Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
