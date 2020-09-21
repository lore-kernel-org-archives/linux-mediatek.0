Return-Path: <SRS0=GXkz=C6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84F91C43465
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 02:32:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05E482078E
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 02:32:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j0vNZsow";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="MwhDKhGA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05E482078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xr4fXOriS93Wz4oSF0VGin7X3C3qoTsF/m5l2047LR8=; b=j0vNZsowDw3x2SJhpgnoekEuS
	cXUrweBrNo0bcskQ7JuRfsrNWLp/C45f0bgaYw6bdLu5AdH/Ptk0HahTMhG+96r4aJIqMbLXNU3zI
	LhVA593b38eKolaOkpTDYgHmxqreuIoocOG+u5tm9FlKZZoTIfs6sKKA1LAMucr+0N9jcNXwpj/wr
	uHDxlVcI+Ut8njfi6l/tjcxafJ2Q2ScsJYETk6Cc7mGHNh5J+LbGfxfzlqNI/rIN1Qq0PXbsk1Qev
	vmK+ieSEpZNacPtJkZfNThb21cdsYEn6CmAaV5vS4INaU5othlTXJ3KzQlH6BDxH1aqlZbq0nhNXh
	Pow5ELqNA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKBch-0000wW-Pb; Mon, 21 Sep 2020 02:32:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKBcb-0000u7-Sc; Mon, 21 Sep 2020 02:32:09 +0000
X-UUID: 73e0ff07871b4155ab45d76b373f3f58-20200920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=A8DmZOGo3w7wTbOR1VzHdmyQYxcVW5Y/nrnEgYO45L8=; 
 b=MwhDKhGA7VGnztLDPxhQkBE8dJJPmwE3YsiGRvD34ajNoswPA/emve3sQggGTNE6lCdzCto5Eudl2MCJneHCyIAuUpyKBm/Diu1pAtofhfFbW60H98fuEz14obl0vHy1vMu1Xf+yJJMK3gluKHk+j0hjQuWN04qZcwLO4Fm5CVU=;
X-UUID: 73e0ff07871b4155ab45d76b373f3f58-20200920
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1508333011; Sun, 20 Sep 2020 18:31:58 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 20 Sep 2020 19:23:58 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Sep 2020 10:23:54 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 21 Sep 2020 10:23:54 +0800
Message-ID: <1600655037.3787.1.camel@mtkswgap22>
Subject: Re: [PATCH v7 2/2] dt-bindings: cpufreq: add bindings for MediaTek
 cpufreq HW
From: Hector Yuan <hector.yuan@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>
Date: Mon, 21 Sep 2020 10:23:57 +0800
In-Reply-To: <1599712262-8819-3-git-send-email-hector.yuan@mediatek.com>
References: <1599712262-8819-1-git-send-email-hector.yuan@mediatek.com>
 <1599712262-8819-3-git-send-email-hector.yuan@mediatek.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200920_223206_106304_56271D46 
X-CRM114-Status: GOOD (  19.73  )
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

Hi, Rob sir:

Sorry to bother you, may I have your review comment for the binding
part?
Appreciated.

On Thu, 2020-09-10 at 12:31 +0800, Hector Yuan wrote:
> From: "Hector.Yuan" <hector.yuan@mediatek.com>
> 
> Add devicetree bindings for MediaTek HW driver.
> 
> Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
> ---
>  .../bindings/cpufreq/cpufreq-mediatek-hw.yaml      |  141 ++++++++++++++++++++
>  1 file changed, 141 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> new file mode 100644
> index 0000000..118a163
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> @@ -0,0 +1,141 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/cpufreq/cpufreq-mediatek-hw.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek's CPUFREQ Bindings
> +
> +maintainers:
> +  - Hector Yuan <hector.yuan@mediatek.com>
> +
> +description:
> +  CPUFREQ HW is a hardware engine used by MediaTek
> +  SoCs to manage frequency in hardware. It is capable of controlling frequency
> +  for multiple clusters.
> +
> +properties:
> +  compatible:
> +    const: "mediatek,cpufreq-hw"
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 2
> +    description: |
> +      Addresses and sizes for the memory of the HW bases in each frequency domain.
> +
> +  reg-names:
> +    items:
> +      - const: "freq-domain0"
> +      - const: "freq-domain1"
> +    description: |
> +      Frequency domain name. i.e.
> +      "freq-domain0", "freq-domain1".
> +
> +  "#freq-domain-cells":
> +    const: 1
> +    description: |
> +      Number of cells in a freqency domain specifier.
> +
> +  mtk-freq-domain:
> +    maxItems: 1
> +    description: |
> +      Define this cpu belongs to which frequency domain. i.e.
> +      cpu0-3 belong to frequency domain0,
> +      cpu4-6 belong to frequency domain1.
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - "#freq-domain-cells"
> +
> +examples:
> +  - |
> +    cpus {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            cpu0: cpu@0 {
> +                device_type = "cpu";
> +                compatible = "arm,cortex-a55";
> +                enable-method = "psci";
> +                mtk-freq-domain = <&cpufreq_hw 0>;
> +                reg = <0x000>;
> +            };
> +
> +            cpu1: cpu@1 {
> +                device_type = "cpu";
> +                compatible = "arm,cortex-a55";
> +                enable-method = "psci";
> +                mtk-freq-domain = <&cpufreq_hw 0>;
> +                reg = <0x100>;
> +            };
> +
> +            cpu2: cpu@2 {
> +                device_type = "cpu";
> +                compatible = "arm,cortex-a55";
> +                enable-method = "psci";
> +                mtk-freq-domain = <&cpufreq_hw 0>;
> +                reg = <0x200>;
> +            };
> +
> +            cpu3: cpu@3 {
> +                device_type = "cpu";
> +                compatible = "arm,cortex-a55";
> +                enable-method = "psci";
> +                mtk-freq-domain = <&cpufreq_hw 0>;
> +                reg = <0x300>;
> +            };
> +
> +            cpu4: cpu@4 {
> +                device_type = "cpu";
> +                compatible = "arm,cortex-a55";
> +                enable-method = "psci";
> +                mtk-freq-domain = <&cpufreq_hw 1>;
> +                reg = <0x400>;
> +            };
> +
> +            cpu5: cpu@5 {
> +                device_type = "cpu";
> +                compatible = "arm,cortex-a55";
> +                enable-method = "psci";
> +                mtk-freq-domain = <&cpufreq_hw 1>;
> +                reg = <0x500>;
> +            };
> +
> +            cpu6: cpu@6 {
> +                device_type = "cpu";
> +                compatible = "arm,cortex-a75";
> +                enable-method = "psci";
> +                mtk-freq-domain = <&cpufreq_hw 1>;
> +                reg = <0x600>;
> +            };
> +
> +            cpu7: cpu@7 {
> +                device_type = "cpu";
> +                compatible = "arm,cortex-a75";
> +                enable-method = "psci";
> +                mtk-freq-domain = <&cpufreq_hw 1>;
> +                reg = <0x700>;
> +            };
> +    };
> +
> +    /* ... */
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        cpufreq_hw: cpufreq@11bc00 {
> +            compatible = "mediatek,cpufreq-hw";
> +            reg = <0 0x11bc10 0 0x8c>,
> +               <0 0x11bca0 0 0x8c>;
> +            reg-names = "freq-domain0", "freq-domain1";
> +            #freq-domain-cells = <1>;
> +        };
> +    };
> +
> +
> +
> +

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
