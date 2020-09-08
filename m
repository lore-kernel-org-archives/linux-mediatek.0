Return-Path: <SRS0=x1vn=CR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E050C43461
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 11:23:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 024DC2087D
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 11:23:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GVjfsm0h";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="fLsNaXlt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 024DC2087D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+mw91buoVamSGT4KzaJ+U4C+DnnBjz0eBAXMZqK66iE=; b=GVjfsm0hV1RlBQQCYESQEhJJ6
	efzyI4oULXdEcfIJSf1sf/02Q/2T0ftRgXpVvW4LqvNU2qyMdeZxzlPpVCIyzfX3NPiFq2qNJijTy
	P+H7fw/ZeqM422pFivd7HWfj+yu5Ev9mdkmFXxiTYUCoIgbUOod7qKJIBeC5TtuAdStZGs7C+OLXB
	v8z89UaKa/lYapQ/ppB/ioFsnDfMqKh+UsvyaevNehtmzqbrID0qAf4H0RmTtjnufPJjpw6Z9s+j5
	Llgo39SiIoHB2KTs/zMnjb28KaRhCGBeaFHXP+lGdgQLLjDnt0Y8I4Qq7XfrnuPNT7A2BrnAE3M8F
	td/xi9IRw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFbiI-00035c-OV; Tue, 08 Sep 2020 11:23:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFbiF-00035A-CU; Tue, 08 Sep 2020 11:23:01 +0000
X-UUID: fd4146e870314061ac587997b1abd192-20200908
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ztKPvKAMVkhiTfL7QF2uQAL3r+CYGYFg1GUnCHV48sk=; 
 b=fLsNaXltmAtUNqAVwUHk+txboogcoMPuZyCSqzDoIhfw458cFfN9C6L0YvbGTNIprLFugOLcU7skLMQjqazX3/ZB7d1IAJlNQ4aWfeC5bpWoBZqhAgfmLOiU09MhRVl451DgtVanSU2YizJOaY4XZVxf2RCgr27Tap5EzOKfyo0=;
X-UUID: fd4146e870314061ac587997b1abd192-20200908
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1268865258; Tue, 08 Sep 2020 03:22:55 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Sep 2020 04:12:53 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Sep 2020 19:12:51 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Sep 2020 19:12:52 +0800
Message-ID: <1599563572.2621.7.camel@mtkswgap22>
Subject: Re: [PATCH v4 2/2] dt-bindings: cpufreq: add bindings for MediaTek
 cpufreq HW
From: Hector Yuan <hector.yuan@mediatek.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Date: Tue, 8 Sep 2020 19:12:52 +0800
In-Reply-To: <20200908100733.pbizjorq3lmn7bew@vireshk-i7>
References: <1599550547-27767-1-git-send-email-hector.yuan@mediatek.com>
 <1599550547-27767-3-git-send-email-hector.yuan@mediatek.com>
 <20200908100733.pbizjorq3lmn7bew@vireshk-i7>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_072259_992736_F8913B95 
X-CRM114-Status: GOOD (  21.63  )
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
 linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, Rob
 Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-09-08 at 15:37 +0530, Viresh Kumar wrote:
> On 08-09-20, 15:35, Hector Yuan wrote:
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
> > index 0000000..5be5867
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
> > +    const: mediatek,cpufreq-hw
> 
> Missing "" here ?
> 
OK, will add it in v5.
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
> > +    description: |
> > +      Frequency domain name. i.e.
> > +      "freq-domain0", "freq-domain1".
> > +
> > +  "#freq-domain-cells":
> > +    const: 1
> > +    description: |
> > +      Number of cells in a freqency domain specifier.
> > +
> > +  mtk-freq-domain:
> > +    maxItems: 1
> > +    description: |
> > +      Define this cpu belongs to which frequency domain. i.e.
> > +      cpu0-3 belong to frequency domain0,
> > +      cpu4-6 belong to frequency domain1.
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
> 
> I would need Ack from Rob for this.
> 
OK, thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
