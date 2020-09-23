Return-Path: <SRS0=E7TL=DA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07484C2D0A8
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Sep 2020 13:20:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D8C120708
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Sep 2020 13:20:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0SoyYozy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="MqX6GD1B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D8C120708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z8VYf1fQ5OmwrEl1N1T2eZMp/3wm2j8+5yPMl5ZMzp0=; b=0SoyYozyiuoYu1B7NYzcgonr9
	+mEyikctqp64Y0HHRTDh3G6IQDuFI+12D+vZAPJZJDwfz3iyW7mA7mnB9XdypIRZiU2pt26RR8uL4
	vz5GD6jC1vqpgnY++OMADgfBc4dYvVPPYzq4f6iz2Vz6uQjCGjn4oUZjIW9ECTqXs6d4TXSxOxazG
	HmabmMK9UyVHBM3Yf/7wIG6vuuh/4UfYYl7eZ3qRgP4JwQzrx3VoUdnQuCMo9YKfzVEWi5iNhVJLx
	nOHAl3uiEvo+OCdyejJ0T7pqvxHaUF/JyfGRi2wewNOypplHhuAwtbo0RrCjgwa+VqtW2E2Ya2mfV
	w9VU7ErdQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kL4hC-0007LZ-GH; Wed, 23 Sep 2020 13:20:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kL4h9-0007KE-7f; Wed, 23 Sep 2020 13:20:28 +0000
X-UUID: 20ca65702d6342f89537bde20f0db99d-20200923
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=mpPxPVgxCZpCrk8Jwn9XJZZGEhRTSxcze8SQEO384I0=; 
 b=MqX6GD1BQBRAvXfbWR8T6L5LX1DRyp8Pw1M7tcsOf2WnQ/UCvXdFat2qpxDIPGimQOKyn/R81gVm7+FZ1XF6UnVPhe0ITWtLAESIS/wifzpOyHCoNH8TGpW8u1CqniILcoAmuU62REDkuCm4gK4q7LVNoPOg2e25yWCNblK6q/w=;
X-UUID: 20ca65702d6342f89537bde20f0db99d-20200923
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 478932768; Wed, 23 Sep 2020 05:20:18 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Sep 2020 06:10:15 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Sep 2020 21:10:13 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Sep 2020 21:10:12 +0800
Message-ID: <1600866614.21446.18.camel@mtkswgap22>
Subject: Re: [PATCH v7 2/2] dt-bindings: cpufreq: add bindings for MediaTek
 cpufreq HW
From: Hector Yuan <hector.yuan@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Wed, 23 Sep 2020 21:10:14 +0800
In-Reply-To: <20200922202852.GA3134161@bogus>
References: <1599712262-8819-1-git-send-email-hector.yuan@mediatek.com>
 <1599712262-8819-3-git-send-email-hector.yuan@mediatek.com>
 <20200922202852.GA3134161@bogus>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200923_092027_482552_B212B1CC 
X-CRM114-Status: GOOD (  30.58  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-pm@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-09-22 at 14:28 -0600, Rob Herring wrote:
> On Thu, Sep 10, 2020 at 12:31:02PM +0800, Hector Yuan wrote:
> > From: "Hector.Yuan" <hector.yuan@mediatek.com>
> > 
> > Add devicetree bindings for MediaTek HW driver.
> > 
> > Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
> > ---
> >  .../bindings/cpufreq/cpufreq-mediatek-hw.yaml      |  141 ++++++++++++++++++++
> >  1 file changed, 141 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> > new file mode 100644
> > index 0000000..118a163
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> > @@ -0,0 +1,141 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/cpufreq/cpufreq-mediatek-hw.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek's CPUFREQ Bindings
> > +
> > +maintainers:
> > +  - Hector Yuan <hector.yuan@mediatek.com>
> > +
> > +description:
> > +  CPUFREQ HW is a hardware engine used by MediaTek
> > +  SoCs to manage frequency in hardware. It is capable of controlling frequency
> > +  for multiple clusters.
> > +
> > +properties:
> > +  compatible:
> > +    const: "mediatek,cpufreq-hw"
> 
> Needs to be SoC specific. This stuff is never constant from one SoC to 
> the next. 'cpufreq' is a Linuxism. What's the block called in the 
> datasheet? Use that.
> 
OK, will use mediatek,sspm-dvfs-mt6779 instead.
> Don't need quotes either.
> 
OK, will remove it.
> > +
> > +  reg:
> > +    minItems: 1
> > +    maxItems: 2
> > +    description: |
> > +      Addresses and sizes for the memory of the HW bases in each frequency domain.
> > +
> > +  reg-names:
> > +    items:
> > +      - const: "freq-domain0"
> > +      - const: "freq-domain1"
> 
> Kind of pointless to have names based on the index. Drop 'reg-names'.
> 
OK, will drop it.
> > +    description: |
> > +      Frequency domain name. i.e.
> > +      "freq-domain0", "freq-domain1".
> > +
> > +  "#freq-domain-cells":
> > +    const: 1
> > +    description: |
> > +      Number of cells in a freqency domain specifier.
> 
> You don't need this. It's not a common binding that's going to vary.
> 
OK, will remove it.
> > +
> > +  mtk-freq-domain:
> > +    maxItems: 1
> > +    description: |
> > +      Define this cpu belongs to which frequency domain. i.e.
> > +      cpu0-3 belong to frequency domain0,
> > +      cpu4-6 belong to frequency domain1.
> 
> This property doesn't go in the 'mediatek,cpufreq-hw' node. You would 
> need a separate schema. However, I think the easiest thing to do here is 
> something like this:
> 
> mediatek,freq-domain-0 = <&cpu0>, <&cpu1>;
> 
Sorry, may I know the reason and the details about how to separate
schema? Thank you very much.

The numbers of frequency domain may be vary from different projects. If
I do the easier way, I may need to implement extra loop to check how
many frequency domain.
> Or you could just re-use the OPP binding with just 0 entries:
> 
> opp-table-0 {
>   compatible = "mediatek,hw-operating-points", "operating-points-v2";
> };
> opp-table-1 {
>   compatible = "mediatek,hw-operating-points", "operating-points-v2";
> };
> 
In previous review stage, already abandon OPP framework in driver code.
Will check with Viresh to see if its OK to add OPP back.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - "#freq-domain-cells"
> > +
> > +examples:
> > +  - |
> > +    cpus {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +
> > +            cpu0: cpu@0 {
> > +                device_type = "cpu";
> > +                compatible = "arm,cortex-a55";
> > +                enable-method = "psci";
> > +                mtk-freq-domain = <&cpufreq_hw 0>;
> > +                reg = <0x000>;
> > +            };
> > +
> > +            cpu1: cpu@1 {
> 
> Unit address is wrong.
> 
OK, will modify to "cpu1 : cpu@100" if we still decide to put
freq_domain in CPU node.
> > +                device_type = "cpu";
> > +                compatible = "arm,cortex-a55";
> > +                enable-method = "psci";
> > +                mtk-freq-domain = <&cpufreq_hw 0>;
> > +                reg = <0x100>;
> > +            };
> > +
> > +            cpu2: cpu@2 {
> > +                device_type = "cpu";
> > +                compatible = "arm,cortex-a55";
> > +                enable-method = "psci";
> > +                mtk-freq-domain = <&cpufreq_hw 0>;
> > +                reg = <0x200>;
> > +            };
> > +
> > +            cpu3: cpu@3 {
> > +                device_type = "cpu";
> > +                compatible = "arm,cortex-a55";
> > +                enable-method = "psci";
> > +                mtk-freq-domain = <&cpufreq_hw 0>;
> > +                reg = <0x300>;
> > +            };
> > +
> > +            cpu4: cpu@4 {
> > +                device_type = "cpu";
> > +                compatible = "arm,cortex-a55";
> > +                enable-method = "psci";
> > +                mtk-freq-domain = <&cpufreq_hw 1>;
> > +                reg = <0x400>;
> > +            };
> > +
> > +            cpu5: cpu@5 {
> > +                device_type = "cpu";
> > +                compatible = "arm,cortex-a55";
> > +                enable-method = "psci";
> > +                mtk-freq-domain = <&cpufreq_hw 1>;
> > +                reg = <0x500>;
> > +            };
> > +
> > +            cpu6: cpu@6 {
> > +                device_type = "cpu";
> > +                compatible = "arm,cortex-a75";
> > +                enable-method = "psci";
> > +                mtk-freq-domain = <&cpufreq_hw 1>;
> > +                reg = <0x600>;
> > +            };
> > +
> > +            cpu7: cpu@7 {
> > +                device_type = "cpu";
> > +                compatible = "arm,cortex-a75";
> > +                enable-method = "psci";
> > +                mtk-freq-domain = <&cpufreq_hw 1>;
> > +                reg = <0x700>;
> > +            };
> > +    };
> > +
> > +    /* ... */
> > +
> > +    soc {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        cpufreq_hw: cpufreq@11bc00 {
> > +            compatible = "mediatek,cpufreq-hw";
> > +            reg = <0 0x11bc10 0 0x8c>,
> > +               <0 0x11bca0 0 0x8c>;
> > +            reg-names = "freq-domain0", "freq-domain1";
> > +            #freq-domain-cells = <1>;
> > +        };
> > +    };
> > +
> > +
> > +
> > +
> > -- 
> > 1.7.9.5

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
