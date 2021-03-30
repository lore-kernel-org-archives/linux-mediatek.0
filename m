Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F3A7C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 02:57:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E1CA60241
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 02:57:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E1CA60241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xLCYt/9xCgjlINHnmuZbKdsfX81l4C9q4vXgkC6iwxg=; b=hc1+sUMA2fFPuMbSPiOmmdzOg
	xhfPjdPfJuitO0ugIuGp2xIe8sX37ndtUvCH9+6s9zcWXe9QmbObeKmW9aQZfJPsS1UBWBSyDoJWO
	zFsa136bIJhD/qmhVJBfXAV0zddCRvBOXnwrbGYw2yYt0+6AN3tpz7nGNEt3LG5kvF9KETlfsWaYJ
	gQ3D+UQkb3YGEVGKkk3Xc7/uXg8I4Y5G+rE4FZIRuZizk/QV3Ukk7mDMG7AgUF7iPtm8FMvXs22vF
	rBvQTPWvuMba9PHJRvh+lzCgnyBDmVOUaF2IS/WOxIg4g0eGT4UdzgGRa6zzadt71EHfA5wt/x+PD
	ZLn2AuZkg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR4ZR-002WGd-BJ; Tue, 30 Mar 2021 02:57:34 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR4Yi-002WBu-KS
 for linux-mediatek@lists.infradead.org; Tue, 30 Mar 2021 02:56:52 +0000
Received: by mail-pg1-x532.google.com with SMTP id t140so3344904pgb.13
 for <linux-mediatek@lists.infradead.org>; Mon, 29 Mar 2021 19:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=N4ox6hkezLHWjxNYVVpdSocTF+1XS4hol0sirqGNz/g=;
 b=JZ5eCndFnrrfnD4KNKUw0b438JU3sqOZ6wuZBIs41Le9goAiM5U8AVu4/qgwKxHGbq
 DuO4raEm/NenMmyBDPTNCSruJ1Rug8bPWpWS5pwbjIcPU++eyPMW0HpMcPHDpPkmlGRA
 r45jiO9ruBMobQCvdzKccxck1NB3sFqhnCtLhQpkf5NbwL+qhQnZ75S2W7sw6HkBWsB7
 4pRb57MRT9bLNs2lLoR0EjFDeztYyNc91eKhLc3LnJiPvy3Pa4my2v/wC9n+KF8Ve4p2
 aYlFB+bw265ShnNr6svgI4kVvRxiyFeJdEbbSsJYk1k1bEdv/V1SqPLZPI6ct65mM0SB
 jvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=N4ox6hkezLHWjxNYVVpdSocTF+1XS4hol0sirqGNz/g=;
 b=G/SoE9Uvs9I+kIF7Hf1XTqF/Jt9DH6dOZz+8anVButrerCTTCz4wxynEHWuS2wiA23
 IgdBZCH4LRPR+PLzBb65/JH4ylBI034s/TfdtZ0bPcbtN0/lg4VbuHdDu+lHvPCcyoGm
 73STYThwkcpdk9cSgyER40rhyGwZnNmKYW+Vh9C7NXsJfnW935/0lV48iHv3Fp8OqGlT
 oQUdyfiIuNp8gEK8mqcB3CR6ioh/BSKtFhoXhywKAiPJNhRMiMAc1zTZnf3vUsHosHIn
 1+eSHsD/tRmUdCGcPxywXaCbRn+zPJ6QLFktcaaYb1FAL5SSSZzPpeaEdp9cfCGDkvzF
 WgMg==
X-Gm-Message-State: AOAM531weT942pyvOsiE/4XRm7/EJNvx/7Z6xQ5GNwnnMYl6TAjHe0bv
 GAL1gIdJ8a4t8rC29NtT8CAa5A==
X-Google-Smtp-Source: ABdhPJyUwzACESNCO5GlbYyNrf+gtvsiCo3ewiSUWrIX90siiyiZwleEGmhTowpYyzLtkp1LzsLPzg==
X-Received: by 2002:a63:d70e:: with SMTP id d14mr26039191pgg.291.1617073006035; 
 Mon, 29 Mar 2021 19:56:46 -0700 (PDT)
Received: from localhost ([136.185.154.93])
 by smtp.gmail.com with ESMTPSA id z4sm18286008pgv.73.2021.03.29.19.56.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Mar 2021 19:56:45 -0700 (PDT)
Date: Tue, 30 Mar 2021 08:26:43 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Herring <robh@kernel.org>, .Sudeep.Holla@arm.com
Cc: Hector Yuan <hector.yuan@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 wsd_upstream@mediatek.com
Subject: Re: [PATCH v11 2/2] dt-bindings: cpufreq: add bindings for MediaTek
 cpufreq HW
Message-ID: <20210330025643.mbeb7oqumv75o3y5@vireshk-i7>
References: <1615549235-27700-1-git-send-email-hector.yuan@mediatek.com>
 <1615549235-27700-3-git-send-email-hector.yuan@mediatek.com>
 <20210324160750.GA3154702@robh.at.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210324160750.GA3154702@robh.at.kernel.org>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_035648_907435_ED176623 
X-CRM114-Status: GOOD (  20.16  )
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

On 24-03-21, 10:07, Rob Herring wrote:
> On Fri, Mar 12, 2021 at 07:40:35PM +0800, Hector Yuan wrote:
> > From: "Hector.Yuan" <hector.yuan@mediatek.com>
> > 
> > Add devicetree bindings for MediaTek HW driver.
> > 
> > Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
> > ---
> >  .../bindings/cpufreq/cpufreq-mediatek-hw.yaml      |  127 ++++++++++++++++++++
> >  1 file changed, 127 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> > new file mode 100644
> > index 0000000..0f3ad47
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> > @@ -0,0 +1,127 @@
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
> 
> A common binding schema for this and 'performance-domains' needs to land 
> first.

Sudeep, what happened to the series you had on this ? This patchset
has been blocked for a long time now, can we get that merged soonish
somehow ?

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
