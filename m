Return-Path: <SRS0=bV6b=D6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7698CC388F9
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 16:20:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00DE32192A
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 16:20:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nYbAVGYq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00DE32192A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=z8wmKLMxXQ7F05FLeSmzkqbtUyEYUXOmSZQl2GeJ+RY=; b=nYbAVGYqw6MXgR05Pi+XM1djF
	thZFGSP1rnGU7V+ceHO53AuE7oemgL+VYLbrXjJ+4G3+B0pzurygboika/RY3mGll0sodNsMlb2oF
	j7wpD+/ELowno7woHyXhsjqojhfm6+rpczW4eX9RfqJRDbXKyl27VGeU+E6KizKE2vyJ7239Pzdd7
	t8jIbJv8U4EKYi2tmP+env/HCCTzMPu7uJTl7+5GYkkgo2AFV2Yf59TrkRYFArJ7LG2hvp45z/7/t
	QUBe44gWQ4RlDgfkI6M85inOAlaPct6u62WTynYlE4aR4LV8mC6Z4pxK3V8p0yARZyy9rs1X84J86
	VG1ea4psg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVznT-0007nN-KM; Fri, 23 Oct 2020 16:20:07 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVznR-0007mx-F5; Fri, 23 Oct 2020 16:20:06 +0000
Received: by mail-ot1-f66.google.com with SMTP id f37so1844160otf.12;
 Fri, 23 Oct 2020 09:20:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eV+szdSSexm2eZbasYH32iY3/QUzNUO+3O5Yc7X4Akc=;
 b=ug3TK13HyXTWN2Wv/F4QKH+xWEOkEJNOYN9vyG+Hv7EfJSftkUzyi5aSQ7RKTCswap
 KF4o/r0BC229iU5kgmbdag0gTONuT30t7mSo6Pt5JMPxXKoizh4+gQc7WqfD7ilM9OqH
 B7j2x2R5C+HBzGqgsdRhClh0egsFso84670SSa6UV2FAzW+EkJSbWEDnPIG9tRel8rUk
 Ip/89nlbtw+D3bw+pmwVea2A3bZzC2eZ5s9zRFMIsUk0bSSfBFyHtzS566ssODWTLVg+
 DnP4m/OynZVu+Rq0v3ktRVQ/pxtub7C2w6rHy+tWkN+mVPMcR7jQVcHvLvavJ6lpaksL
 ScYQ==
X-Gm-Message-State: AOAM5308gKPrPXggFEHJJkRLObpA9vbE8p/tQukLr4wAeFQ1QYnL+kIy
 4GGYjoWBmidnfrFOn/JUe9oRUXlZug==
X-Google-Smtp-Source: ABdhPJy1uBpGC0Bl+8Rf9Nn2fxYXV5qIOleK+DNCPRip+n9QSQym8g8RThYOf3GIUtvEalTx/FJTXg==
X-Received: by 2002:a9d:2487:: with SMTP id z7mr2086163ota.133.1603470004848; 
 Fri, 23 Oct 2020 09:20:04 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f18sm489648otp.10.2020.10.23.09.20.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 09:20:04 -0700 (PDT)
Received: (nullmailer pid 2807869 invoked by uid 1000);
 Fri, 23 Oct 2020 16:20:03 -0000
Date: Fri, 23 Oct 2020 11:20:03 -0500
From: Rob Herring <robh@kernel.org>
To: Hector Yuan <hector.yuan@mediatek.com>
Subject: Re: [PATCH v1 2/6] dt-bindings: arm: cpus: Document
 'mtk,freq-domain' property
Message-ID: <20201023162003.GB2800310@bogus>
References: <1603441493-18554-1-git-send-email-hector.yuan@mediatek.com>
 <1603441493-18554-3-git-send-email-hector.yuan@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1603441493-18554-3-git-send-email-hector.yuan@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_122005_529306_CCDAF57D 
X-CRM114-Status: GOOD (  17.97  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>, wsd_upstream@mediatek.com,
 linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Dave Gerlach <d-gerlach@ti.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 linux-mediatek@lists.infradead.org, Amit Kucheria <amit.kucheria@linaro.org>,
 Santosh Shilimkar <ssantosh@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

+Sudeep

On Fri, Oct 23, 2020 at 04:24:49PM +0800, Hector Yuan wrote:
> From: "Hector.Yuan" <hector.yuan@mediatek.com>
> 
> Add devicetree documentation for 'mtk,freq-domain' property specific
> to Mediatek CPUs. This property is used to reference the CPUFREQ node
> along with the domain id.

Okay, now we've got the same thing being done for Mediatek, QCom, and 
SCMI. This needs to be a common binding.

> Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml |    6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
> index 1222bf1..06a6f5b 100644
> --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> @@ -255,6 +255,12 @@ properties:
>  
>        where voltage is in V, frequency is in MHz.
>  
> +  mtk-freq-domain:

I expect this to change, but still not right form: <vendor>,<prop name>

mtk is not the registered vendor.

> +    $ref: '/schemas/types.yaml#/definitions/phandle-array'
> +    description:
> +      CPUs supporting freq-domain must set their "mtk-freq-domain" property
> +      with phandle to a cpufreq_hw node followed by the domain id.
> +
>    power-domains:
>      $ref: '/schemas/types.yaml#/definitions/phandle-array'
>      description:
> -- 
> 1.7.9.5

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
