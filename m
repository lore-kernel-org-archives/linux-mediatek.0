Return-Path: <SRS0=7lD3=ED=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B1ADC388F7
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2020 15:09:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9120C247B1
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2020 15:09:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bv9bPcBw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9120C247B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=odPyLpR5YB71WyKg12wY7bTohl9M1/L8VMmImOF4yyU=; b=bv9bPcBwxBHVFNJmSn3g4SJw5
	rovwSEUq18qIBnARBM69r/Fw3p/rX2vVbdg9q2Siu+ukgE47zlvoCx20d/zSnXY4M+tj4HDnLUIY4
	TYoX79Q+SG+K6Zhh4OMrrK+LYZ6OVpMsv4gNuypL846IMc7QZbENVioTsBNq4ZCbJruKzicct6EbS
	qVKTR1yrIznVfVC71fYHVryq815ph7QFYSJ0FdLApeaBhXJ8l8972e9a6SDVDelzYLHUq5vJ9l+0f
	VFbUHeAWm/Q6mLH7csJlMG/K52pHPwlutCPNqrf8ya5n+YISi93frSOzDb5kANhcNVCpyTPXUP2Q9
	8k/HBE8oQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXn4R-0006fo-1V; Wed, 28 Oct 2020 15:09:03 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXn4P-0006fN-Al; Wed, 28 Oct 2020 15:09:02 +0000
Received: by mail-ot1-f66.google.com with SMTP id x7so4519971ota.0;
 Wed, 28 Oct 2020 08:09:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=U9i72jITznoyLWceCi4kjFUr4fNuDlp2txdWJ3Q79bE=;
 b=XQgtqcs1ZtmnBMM2ey3Http2FSw8ssyTsGPQSaXQL7OVJLeHrXm8x21YbxoMWyreP9
 baEKCCtcodQYutuI0XqctFK3ot8R5y9QPi/NQGthMYHYD+zkC1tvul7quKSOpqMxgRDb
 jVZuZdXd6ZwsTWlupBo1nW5FICSljmAVtN7JayHCyqCVd3RLL6jQGDs1wOzGegG/WVO/
 d1eYA6P2hIZBm+Sc2gS32iStgttoRfCc4juLHYpVFjDCL8eQCppalRGtpjBXGxN7NokF
 4+QQDzXs4JyClP51rI58p069YI1trdwcS7P4vc42lSFPQqA6k7qlyw5sd8wgIx6hEHUb
 0LYg==
X-Gm-Message-State: AOAM533UxUwr0h/c+kvCvPyI4P7SzqFRc4nY/Ewxk/rDY8a/JCYi389t
 cH4Pzr2LVBSwRsqWuWoTGA==
X-Google-Smtp-Source: ABdhPJxVfBAexzDeSfthE/C5FdehItFG5LcxBVZpHOboZx3jsIuqwOA58jPu7ZgCp/788T3Wo1UzIg==
X-Received: by 2002:a9d:7390:: with SMTP id j16mr5739710otk.144.1603897740272; 
 Wed, 28 Oct 2020 08:09:00 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id x13sm2134399otq.75.2020.10.28.08.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 08:08:59 -0700 (PDT)
Received: (nullmailer pid 4031254 invoked by uid 1000);
 Wed, 28 Oct 2020 15:08:58 -0000
Date: Wed, 28 Oct 2020 10:08:58 -0500
From: Rob Herring <robh@kernel.org>
To: Hector Yuan <hector.yuan@mediatek.com>
Subject: Re: [PATCH v8 2/3] dt-bindings: arm: cpus: Document
 'mediatek,freq-domain' property
Message-ID: <20201028150858.GA4029348@bogus>
References: <1603700349-5922-1-git-send-email-hector.yuan@mediatek.com>
 <1603700349-5922-3-git-send-email-hector.yuan@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1603700349-5922-3-git-send-email-hector.yuan@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_110901_386337_9E3709A4 
X-CRM114-Status: GOOD (  18.91  )
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
 Dave Gerlach <d-gerlach@ti.com>, linux-pm@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 linux-mediatek@lists.infradead.org, Amit Kucheria <amit.kucheria@linaro.org>,
 Sudeep Holla <sudeep.holla@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Oct 26, 2020 at 04:19:08PM +0800, Hector Yuan wrote:
> From: "Hector.Yuan" <hector.yuan@mediatek.com>
> 
> Add devicetree documentation for 'mediatek,freq-domain' property specific
> to Mediatek CPUs. This property is used to reference the CPUFREQ node
> along with the domain id.
> 
> Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml |    6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
> index 1222bf1..e995b26 100644
> --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> @@ -255,6 +255,12 @@ properties:
>  
>        where voltage is in V, frequency is in MHz.
>  
> +  mediatek,freq-domain:
> +    $ref: '/schemas/types.yaml#/definitions/phandle-array'
> +    description:
> +      CPUs supporting freq-domain must set their "mediatek,freq-domain" property
> +      with phandle to a cpufreq_hw node followed by the domain id.

This needs to be a common binding shared with SCMI domains.

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
