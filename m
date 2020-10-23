Return-Path: <SRS0=bV6b=D6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E761C4363A
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 16:15:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25C312192A
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 16:15:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MvRPo8Pi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25C312192A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AHyA1R4xJtjAmiw4XZZa8VsCqdbKarKBjZjYPCktR80=; b=MvRPo8PiJT1TQMg7BVblt8edu
	DKKD3QDXMkHi42EvAhTQvvcXF2VgaizabIHuAxe7XPNilmc1m+TOg3dT7Gz3obShVYnw3E6gP0KZV
	4kS5hlJIDgTCmWUF9YuC0MbeNHxukG7ZwoCTBhJG9XGkEzuwkNAWli5wmhaN/uNScq+cO6rz5rXec
	jYTwMEk19+CMfqT5eF4XKHhUnIzPg5us1apUah3zkV495qTBNyyXVYpvGWo81e0/2cT4ko7Dx56Ti
	+YF6ZCsschBGiITL1PevyFBWbbfcWFkqEAXM8dS/nmfQZuEZCFRXCOgCe6/hTHRsq/nAF6uFFWVkh
	OK/a18Ngg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVzic-0007Mu-Pm; Fri, 23 Oct 2020 16:15:06 +0000
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVziZ-0007M9-1Y; Fri, 23 Oct 2020 16:15:04 +0000
Received: by mail-oi1-f195.google.com with SMTP id n3so2446287oie.1;
 Fri, 23 Oct 2020 09:15:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FvCVkpNgTNIbURGGw2woJK1FfE+oLd1yKdhTrG3ufOA=;
 b=c32WPnUI3ULUTsTz8aE0XnC2Mb2sybtW1JNNJfLkQ9eIopugNLqqpD7SZUEikdTh1x
 aqaK0asloU3LpjCp2wtfW8adiTiEYF7Ykj3YBFq83b9OGYe9rTHOJN80Xww/uB4LiIhl
 xrOqv6jzPqv6lrdz9lDGeCtzzoP0U9w6QC2Dy+deciayuTDm3oUixzK7UoUoeKB6DrE7
 2dn11gikavbAo3Qxm795uCMW7NSTQ9//AwxYemNk67MeVYXOL24699wLre+BRAHqDi/B
 bLCtXafR3aIrzPi1iFSuMSKHMY7EdMU6FroYMOAz1ARndyyrah7yEedC7JLNOyH1xqXN
 qItg==
X-Gm-Message-State: AOAM530u8t+aS8u2UWTbcljtHgmSnVQcjJlP+VXSbaBQq4fnqkP+RJvQ
 CMgNa54gR8w/pwRz/Zz0tw==
X-Google-Smtp-Source: ABdhPJyYeCMsL52JQAqym6VgKty0inwrQaF/J8jiig+S215ihWN6sR4ZPDJA9lEOshnTKG5zylY9Vg==
X-Received: by 2002:aca:ab54:: with SMTP id u81mr2114700oie.90.1603469702099; 
 Fri, 23 Oct 2020 09:15:02 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id b139sm558165oii.19.2020.10.23.09.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 09:15:01 -0700 (PDT)
Received: (nullmailer pid 2801225 invoked by uid 1000);
 Fri, 23 Oct 2020 16:15:00 -0000
Date: Fri, 23 Oct 2020 11:15:00 -0500
From: Rob Herring <robh@kernel.org>
To: Hector Yuan <hector.yuan@mediatek.com>
Subject: Re: [PATCH v1 3/6] dt-bindings: cpufreq: add bindings for MediaTek
 cpufreq HW
Message-ID: <20201023161500.GA2800310@bogus>
References: <1603441493-18554-1-git-send-email-hector.yuan@mediatek.com>
 <1603441493-18554-4-git-send-email-hector.yuan@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1603441493-18554-4-git-send-email-hector.yuan@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_121503_325003_2304AFDA 
X-CRM114-Status: GOOD (  12.61  )
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
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, wsd_upstream@mediatek.com,
 linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Dave Gerlach <d-gerlach@ti.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Amit Kucheria <amit.kucheria@linaro.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 23 Oct 2020 16:24:50 +0800, Hector Yuan wrote:
> From: "Hector.Yuan" <hector.yuan@mediatek.com>
> 
> Add devicetree bindings for MediaTek HW driver.
> 
> Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
> ---
>  .../bindings/cpufreq/cpufreq-mediatek-hw.yaml      |   46 ++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml:46:1: [warning] too many blank lines (4 > 1) (empty-lines)

dtschema/dtc warnings/errors:


See https://patchwork.ozlabs.org/patch/1386572

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
