Return-Path: <SRS0=iOJY=LV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D441C48BC2
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Jun 2021 08:01:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9474D6194B
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Jun 2021 08:01:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9474D6194B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WM4c8ynczVkKLPjiIkTfq/k+9Y0g9GMSTO8jaN3EeOI=; b=MLHU4oPeu1O98N
	sFFN0c74An4cRpSOPt4fXg20b8sK7k159IwuV9W0SoQdb+jcSdytGfAlPfsoV9FYCJKBtKuwbAL/v
	moJY1RiPyp2Q9VPmLB5skha0Eg2nejLxhoy4AIwzaaEeMaKBEsTiR7delw04lvcyjQKWD4cM4RaNF
	EYd4EGypXPuP/XgsSRJ+UHoEw620JSURbgU/pFhABNLWedGbcDP1BRWRoQ+lxr/rrDDT+kI6W6RRV
	gAOVcxm2/XLQzKLfIZzBGSXidL/C9MijRg7zdAhZRrMwNRtjQ5Tpvu07rYOv6aB+x2JeRA7d2hosW
	Ukj4zBhAQ5O5OC+Emf1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxPj5-005JzD-EE; Sun, 27 Jun 2021 08:01:11 +0000
Received: from [216.200.240.184] (helo=mailgw01.mediatek.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxPj2-005JyA-2i; Sun, 27 Jun 2021 08:01:09 +0000
X-UUID: 236fbc9b46384994a3d90e7a6d1e14a8-20210627
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=6TSr5TS0E7uuhhXK7oCAhWahR2YqxhAPByhuMU0eWFQ=; 
 b=ISGSo8j5gsAbxZjjM/6Xdqm3XzCIIbsEayzKNP2vvmglBf/ovC6FIj4wOJPECy9IpJPie3WWGBnrmClkSZbFPQOtWvEnztnrjzLcFcsQuyvs3gqp6jKj5ZHv4Op4Gd0qww59H+QAvIR3VEgQhj2LzJJ5cG7pkD8IABdJOuYRX1A=;
X-UUID: 236fbc9b46384994a3d90e7a6d1e14a8-20210627
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 72112965; Sun, 27 Jun 2021 01:01:04 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 27 Jun 2021 00:56:20 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 27 Jun 2021 15:56:12 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 27 Jun 2021 15:56:12 +0800
Message-ID: <1624780572.1958.2.camel@mtkswgap22>
Subject: Re: [PATCH v12 2/2] dt-bindings: cpufreq: add bindings for MediaTek
 cpufreq HW
From: Hector Yuan <hector.yuan@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>, "Rafael
 J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <wsd_upstream@mediatek.com>
Date: Sun, 27 Jun 2021 15:56:12 +0800
In-Reply-To: <20210602165827.GA3558170@robh.at.kernel.org>
References: <1622307153-3639-1-git-send-email-hector.yuan@mediatek.com>
 <1622307153-3639-3-git-send-email-hector.yuan@mediatek.com>
 <20210602165827.GA3558170@robh.at.kernel.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210627_010108_174644_333BCC9C 
X-CRM114-Status: GOOD (  27.61  )
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

On Wed, 2021-06-02 at 11:58 -0500, Rob Herring wrote:
> On Sun, May 30, 2021 at 12:52:33AM +0800, Hector Yuan wrote:
> > From: "Hector.Yuan" <hector.yuan@mediatek.com>
> > 
> > Add devicetree bindings for MediaTek HW driver.
> > 
> > Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
> > ---
> >  .../bindings/cpufreq/cpufreq-mediatek-hw.yaml      |   71 ++++++++++++++++++++
> >  1 file changed, 71 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> > new file mode 100644
> > index 0000000..1aa4d54
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> > @@ -0,0 +1,71 @@
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
> > +
> > +  reg:
> > +    minItems: 1
> > +    maxItems: 2
> > +    description: |
> > +      Addresses and sizes for the memory of the
> > +      HW bases in each frequency domain.
> > +
> > +  "#performance-domain-cells":
> > +    description:
> > +      Number of cells in a performance domain specifier. Typically 0 for nodes
> > +      representing a single performance domain and 1 for nodes providing
> > +      multiple performance domains (e.g. performance controllers), but can be
> > +      any value as specified by device tree binding documentation of particular
> > +      provider.
> > +    enum: [ 0, 1 ]
> 
> Can't you restrict this to be 1 for Mediatek h/w? Even if you sometimes 
> have a single domain, it's probably more simple for the driver if this 
> is fixed.
> 
OK, I will restrict this as 1 in next version.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - "#performance-domain-cells"
> > +
> > +additionalProperties: true
> 
> Should be false.
> 
OK, thanks
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
> > +                performance-domains = <&performance 0>;
> > +                reg = <0x000>;
> > +            };
> > +    };
> > +
> > +    /* ... */
> > +
> > +    soc {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        performance: performance-controller@11bc00 {
> > +            compatible = "mediatek,cpufreq-hw";
> > +            reg = <0 0x0011bc10 0 0x120>, <0 0x0011bd30 0 0x120>;
> > +
> > +            #performance-domain-cells = <1>;
> > +        };
> > +    };
> > -- 
> > 1.7.9.5

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
