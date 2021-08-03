Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CC51C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 19:17:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FBFD61037
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 19:17:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2FBFD61037
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=883Vc+EIUbYP05SuwUNFxshtZiPfF1bL+Adw4bqftjw=; b=5FR6/twe/SSjZW
	g6JaAslaJLx/ODHvzqhGUK8hq9AmU0v3X4pjDSX4h+5E7EDUAa6hMn0h8u2yknJIMA/dgUPwAM6uE
	FcwKWuqvDdJykWku3h6J8VMKX40R9sT/xHb07syKqCD8Xq0nNBx/+wyMP2Pj7Ucd20AoHhipuarQQ
	N2AyI3gd8eWeRK6JDxKv7I8KrBR4aHeo3oetnUOipuxRgEX/OSPXDmfKaO9Eu1TQ5dka11Bdqgqlw
	JRSkobZkYBaq9DMVw8qRIMf7JWAYWnU9ymMI9F13zQxxlaHu18NfbBGRUlSSm77DO2OXDRrXxP6KJ
	PaHk5fAAnBozrwKSdYFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAzuz-0041by-2u; Tue, 03 Aug 2021 19:17:37 +0000
Received: from mail-il1-f179.google.com ([209.85.166.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAzuw-0041b3-5C; Tue, 03 Aug 2021 19:17:35 +0000
Received: by mail-il1-f179.google.com with SMTP id c3so20486054ilh.3;
 Tue, 03 Aug 2021 12:17:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=X1PN+FXcllZposMsv/wBmiMU+F0yrr+LYFew9Nm0w9I=;
 b=slliwmHQK4nFGx+XZHeky/PmPLv2bnXml4l8oubFZBakL8tIs470sW1y+lRKQJ2jBn
 1wGUx2bouVTAA1ep/C++gf+w7GAOfX9N3EplBpPAc2182ONSQgIRTZEN4qdeSjWp0zrt
 K/VNiWnn4DTPMwQzqfkdfFrTFv5iXGLV4yCz3TPhXrFv30xWoAPQY6h/64NI9j/0nIod
 54zHXN9IpXmLsTietoE89Z2ESa9K8DQliqT+cAeHi02eTgu8KOSbbjY/Coy2LIk8qtTx
 GBnoijY9N2zeyPjaiOD8D/CcggGyvdIX1VJswlbKIulrhMnDF8t6kYHBs1PcL9fXnAfi
 Fbaw==
X-Gm-Message-State: AOAM530GsEWqsTiJTtw0AH8xPNYVvWTtt2nW+yBDLMdUdUI5X9GYxE/j
 9CKRntQlz/QQxkMMe4FdMg==
X-Google-Smtp-Source: ABdhPJzhu2esfDB7VNUpLzlnS6yiTNM/VUqJ7WfIVheAbGPrU6X0bxACS+OMP9w+D/qBxhD93aOWZQ==
X-Received: by 2002:a92:de07:: with SMTP id x7mr1911620ilm.293.1628018253359; 
 Tue, 03 Aug 2021 12:17:33 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id s195sm10469384ios.38.2021.08.03.12.17.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 12:17:32 -0700 (PDT)
Received: (nullmailer pid 3587156 invoked by uid 1000);
 Tue, 03 Aug 2021 19:17:30 -0000
Date: Tue, 3 Aug 2021 13:17:30 -0600
From: Rob Herring <robh@kernel.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Hector Yuan <hector.yuan@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com
Subject: Re: [PATCH v13 1/2] dt-bindings: cpufreq: add bindings for MediaTek
 cpufreq HW
Message-ID: <YQmWSj0g9ZcZGHtg@robh.at.kernel.org>
References: <1627574891-26514-1-git-send-email-hector.yuan@mediatek.com>
 <1627574891-26514-2-git-send-email-hector.yuan@mediatek.com>
 <20210803050538.g6aj2zsep735ywqv@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210803050538.g6aj2zsep735ywqv@vireshk-i7>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_121734_249030_E82D4A45 
X-CRM114-Status: GOOD (  27.41  )
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

On Tue, Aug 03, 2021 at 10:35:38AM +0530, Viresh Kumar wrote:
> On 30-07-21, 00:08, Hector Yuan wrote:
> > From: "Hector.Yuan" <hector.yuan@mediatek.com>
> > 
> > Add devicetree bindings for MediaTek HW driver.
> > 
> > Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
> > ---
> >  .../bindings/cpufreq/cpufreq-mediatek-hw.yaml      |   70 ++++++++++++++++++++
> >  1 file changed, 70 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> > new file mode 100644
> > index 0000000..6bb2c97
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> > @@ -0,0 +1,70 @@
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
> 
> Should this somewhere have a reference to
> Documentation/devicetree/bindings/dvfs/performance-domain.yaml ?
> 
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
> > +      Number of cells in a performance domain specifier. Typically 1 for nodes
> > +      providing multiple performance domains (e.g. performance controllers),
> > +      but can be any value as specified by device tree binding documentation
> > +      of particular provider.
> 
> You say this can have any value, 1 or more, but then ...
> 
> > +    const: 1
> 
> You fix it to 1 ?
> 
> Perhaps you should add a reference to the performance-domain.yaml here
> as well, and say const 1 here and describe how the parameter is going
> to be used. You should only explain it in respect to your SoC.

Correct in terms of what should be described, but no need to reference 
performance-domain.yaml.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
