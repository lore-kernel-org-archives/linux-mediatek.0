Return-Path: <SRS0=bV6b=D6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F158C388F9
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 08:28:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C79B62192A
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 08:28:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IRhpJTu4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yHoBttqE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C79B62192A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=X3cvydwU+gsUzh1wDrwZ1WeCb+YZW3r6OrwbavDOdOo=; b=IRhpJTu4wN77GltKGwmxTamIo
	C1U1pGTEAE8PTCNk1HVni1CyWFPxdeXEXmcLtgp8zvcCWUoHYcd58FgmHjMt633U9s9HCjunTS+UQ
	AjHllm03aODOjRUU3T9rbH/5fCAO40aMQdAXbe4xKTHgkpufaX0AVZT232hWgustRVIa9uXV/n4N1
	ujl46Vt5gMNqk4osqYHlbAWR2C3l0/weKUdxPDuH947r5oUsLgTrRHjKNR3NRF12wdlIMQiQL19f6
	olvogymm8XicsCbM5X8wgwmlu9piHjM14lXxlqerfeRhkhxxQ0In1a4cfaaPspzJ6EOcc4X6u6kaQ
	ZbPjK6Yiw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVsQz-0000cE-W8; Fri, 23 Oct 2020 08:28:26 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVsQw-0000ag-LK
 for linux-mediatek@lists.infradead.org; Fri, 23 Oct 2020 08:28:24 +0000
Received: by mail-pg1-x543.google.com with SMTP id x13so646564pgp.7
 for <linux-mediatek@lists.infradead.org>; Fri, 23 Oct 2020 01:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=k3izNw2v4kNCe5ZYNTvutZlOv2UH0+nHDbicjBlj9uc=;
 b=yHoBttqE8x2QU44UU+LHl0eobVXFlsWymmVm6pqR/fZHusFGBfUaYXrA7WGWL+MLPf
 Dtn6AR4OggQNEJjozxBZPnrYiIw8OgcOJuxm+TmvgzTBw78eO7imUQa+L17yz3kAF7ft
 mI98t1g1ACkbXM0ORjMdJI8v2/FmHd7hHUZnB/l52gEm5OFFCoVqgPI7P/3sKbq4Kn2Y
 52f54SbVZJBz7/90/SQ8EoVDfQ0enXW9cz7cA1QhvfdO0hMd6NQZfOH0ohoJyzFRQl3r
 G+N10wq0zSXYWvqSDLRMU/OP61sz19DOa04Jg3g35J/iRvtKcA1TUgB/YvJyNFzO1GSR
 1KjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=k3izNw2v4kNCe5ZYNTvutZlOv2UH0+nHDbicjBlj9uc=;
 b=ryOp60uQKKv9H2blMvT6Tj/5bQAQS55VjGjc7PSVIFwA8VmeA5fSo+PWzDAj1IYiVN
 0Nw5GoM4cobVJvDcdGFfbXPixpzZDo3uUOQHTNdD1gyXglV2queHeRGHLSPloYGhqc2j
 Dm1LHYwEcEyX0NRdQ4mXhDu1SdEE3W2By5ZINQ2TXKlUU5XIEweBVCRYen7+2yM3rFSY
 rnR/Isix0fPmYpmZ4pJdsNBICe9qpvJ6pE1cU+ulpUSzFCCUjLyE1CUEyefyXUzEWvVK
 8aMbygjbOYQgjnLcDyXFLZyYrvS/jkFBbCy1aG49qFXchvN4A1VBowsLugR4mU1lRrVc
 Jfbw==
X-Gm-Message-State: AOAM533nXoNN2iq5X5d9Xu2g898cPv2Xna/sgPE/cRRuMQbqzu2ERE5R
 RyQM8/WPQkF34MJTETJuiJmetQ==
X-Google-Smtp-Source: ABdhPJwb3LtHbAXZ4Y7kg/mbb8L8VUhbg+LQwboJKeaKfya4Ves9OchlGmy9cpZTCjepfVo+4bxWRw==
X-Received: by 2002:a17:90a:c28d:: with SMTP id
 f13mr1195647pjt.145.1603441700402; 
 Fri, 23 Oct 2020 01:28:20 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id l82sm1266118pfd.102.2020.10.23.01.28.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Oct 2020 01:28:19 -0700 (PDT)
Date: Fri, 23 Oct 2020 13:58:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Hector Yuan <hector.yuan@mediatek.com>
Subject: Re: [PATCH v1] cpufreq: mediatek-hw: Add support for Mediatek
 cpufreq HW driver
Message-ID: <20201023082817.5vp4cvi2lmpaozcn@vireshk-i7>
References: <1603441493-18554-1-git-send-email-hector.yuan@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1603441493-18554-1-git-send-email-hector.yuan@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_042823_026849_41E38AE7 
X-CRM114-Status: GOOD (  13.16  )
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
 Dave Gerlach <d-gerlach@ti.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Amit Kucheria <amit.kucheria@linaro.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 23-10-20, 16:24, Hector Yuan wrote:
> This patchset includes 6 patches and depends on the MT6779 DTS patch[1] submitted by Hanks Chen.
> The first 3 patches are for CPUFREQ HW driver and device tree binding, which are already sent before separately [2][3]. For binding part, I add a new patch to add property in cpu schema.
> Besides, we add three more patches including EM power table, SVS CPU initialize, and cooling device.

And even after so many versions of these you chose to name this V1. It
is very difficult for reviewers to find time to review your stuff, and
they expect some sort of summary from you on what exactly changed from
last version and you also need to name the current version currently.

This should have been V8 and you should have added a "V7->V8 diff:"
section here, naming all the changes you did. Please send that as
reply to this email, so I can see what really changed.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
