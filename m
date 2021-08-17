Return-Path: <SRS0=tEpm=NI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F218C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 03:45:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F13C060EE0
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 03:45:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F13C060EE0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ObYOrRzhIDVfxgZknYg6flR2rBE68Bzm1jlMzxNpsiY=; b=UoMTeBU64QlHn9
	unyTsQOiIVNzmVTUerKUJTHQ+q90Ti2DoRTFv3Sa4eWE6w4RjKVbQOWh0tVzTzC7LDm59pBucoKbq
	sDVVc/SHqEqFTFEGaTqH9L0NVcNuT23h8ycQLEsiSd4vBahjGhNZ/5QdjWS9ZkGNXRXF8XB2J2te8
	Mt3RVYjVBx26VtDzUJ4LSrLnSkRjm7iaab8d9gnCkzK/Mg9TqfTC6HjsYRsxpgqsX80HDzZ7ON7og
	BU+5Z/UlkLrSKHzrkXnychb9J7lgrKDTMBujVBgqZv2dfh8ZAxru/UnBsDG4vbBRwp3Ag+Iy2y02z
	aGVH+KSMsuNnKPqJao1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFq29-0010Aa-Fr; Tue, 17 Aug 2021 03:45:01 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFpzS-000zYw-Ty
 for linux-mediatek@lists.infradead.org; Tue, 17 Aug 2021 03:42:19 +0000
Received: by mail-pj1-x1034.google.com with SMTP id
 hv22-20020a17090ae416b0290178c579e424so3983636pjb.3
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Aug 2021 20:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=JCOFQBT2H8r+cJYdeiAd3yX79xIHiz7jSYTg79TH8Rw=;
 b=NlkUBJq6j28D7GK7CAAupxV+5tfzRl1Ucoc41Ew3cXEWi2jH4mjRk1YkvUYoUx7zez
 J0qtw4OHsY3c4vNj2606aEZntzQqv/UaLZyu6hLnklVZKhU+oMnc7Ht4GSF4whS6IKrR
 31XqyQNn3IuLIbGBJpd9QB3j2Q6KlxF9Sft+ZArDUu+WcQ46nLWTs4vYwcmCQckS+qUK
 axU8ZcYkgr6+ZL9nIlAvD9ulIlSkcO+IRsvRYlu9jpErze9Xy+AIyS3CXvTLE8m4jtRu
 9TgyjNx4fM6pAoIHI3//UPctkkHXBxmaclE4UZR7tRjsM4ECzBvQT6mZCCMyWhNdQ5ua
 qyVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JCOFQBT2H8r+cJYdeiAd3yX79xIHiz7jSYTg79TH8Rw=;
 b=qraTr0Krc7g4tp5dkSCOCdQOo9fhclar5Sz4Nq+24+3QD4Y7hMBFK5tc3lqUnO5tl6
 Br+aUPlAmj0TH7t0ylVmG11dIyuwTRuQ2SJ9B0xEyZiZB/uANIIjyTey+F7nZRs/eegF
 uTJMBM+BN3Iw6Hrj9bUubwSehdwj4oYr4XaFLuL7lZPyeI3xuh/lYAZNzVWsntLGCSoV
 CaeQRE6Conp0QGPzmyEDSYQl91oMfL5sVa9BQezndWcTJRC5m9jjCreG0UwDDGOJlyG+
 Y3hMbXHflfivGfgjam1p6g4vaS0lTWft5S1IwBFEaLmRjK2iOCzs1Y74MywGI2vpWEcm
 Wv4w==
X-Gm-Message-State: AOAM531vZYaOOkgrqsbtgvvx25wtfPlPnHMFZ7XNPLhV8ZtB16C1c0n9
 Iue4ZI7eYizdlrvbBFI0J1Ebzg==
X-Google-Smtp-Source: ABdhPJyBcs3PMQO6TNBu95yHIEU0AGNrEDxs8TdvoQSKr14DVGi5d/593wOkeOBqc07k1cdbKSyiZw==
X-Received: by 2002:a05:6a00:24c1:b0:3e2:1171:34dd with SMTP id
 d1-20020a056a0024c100b003e2117134ddmr1484836pfv.27.1629171732105; 
 Mon, 16 Aug 2021 20:42:12 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id h17sm601338pfh.192.2021.08.16.20.42.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 20:42:11 -0700 (PDT)
Date: Tue, 17 Aug 2021 09:12:06 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Hector Yuan <hector.yuan@mediatek.com>
Cc: linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com
Subject: Re: [PATCH v13 2/2] cpufreq: mediatek-hw: Add support for CPUFREQ HW
Message-ID: <20210817034206.hmpjdz4bqvwxfn3c@vireshk-i7>
References: <1627574891-26514-1-git-send-email-hector.yuan@mediatek.com>
 <1627574891-26514-3-git-send-email-hector.yuan@mediatek.com>
 <20210803071302.b4ttoqgqdq4dfmwe@vireshk-i7>
 <1629118594.3246.13.camel@mtkswgap22>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1629118594.3246.13.camel@mtkswgap22>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_204215_084299_29AE8549 
X-CRM114-Status: GOOD (  17.22  )
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

On 16-08-21, 20:56, Hector Yuan wrote:
> On Tue, 2021-08-03 at 12:43 +0530, Viresh Kumar wrote:
> > On 30-07-21, 00:08, Hector Yuan wrote:
> > > +	for (i = REG_FREQ_LUT_TABLE; i < REG_ARRAY_SIZE; i++)
> > > +		c->reg_bases[i] = base + offsets[i];
> > > +
> > > +	ret = of_perf_domain_get_sharing_cpumask(index, "performance-domains",
> > 
> > Instead of parsing parsing "performance-domains" twice, I would rather
> > pass a CPU number here instead of index.
> > 
> Sorry, could you give me more details? For now, will use index to parse
> per-cpu to related cpus.You mean pass policy->cpu or? Thanks.

Yes, pass the cpu number from policy->cpu instead.

> > > +	latency = readl_relaxed(c->reg_bases[REG_FREQ_LATENCY]);
> > > +	if (!latency)
> > > +		latency = CPUFREQ_ETERNAL;
> > > +
> > > +	/* us convert to ns */
> > > +	policy->cpuinfo.transition_latency = latency * 1000;
> > 
> > You want to multiple CPUFREQ_ETERNAL too ?

s/multiple/multiply/

Sorry about this.

> Yes, may be different power domain with different transition latency.
> > > +
> > > +	policy->fast_switch_possible = true;
> > > +
> > > +	qos_request = kzalloc(sizeof(*qos_request), GFP_KERNEL);
> > 
> > This is a small structure, why not allocate it on stack instead ?
> > 
> For qos part, we'd like to take more time to re-consider the SW flow and
> put this to another patch set.Is this okay to you?

So you will drop entire qos stuff ? Fine by me.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
