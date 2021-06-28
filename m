Return-Path: <SRS0=zNLT=LW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 608A4C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jun 2021 07:27:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C0D361AC0
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jun 2021 07:27:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C0D361AC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v8oULLuJcnmGCsV61gMWSUTKZtrJOMNURRgWzVo29uc=; b=xMCCg0Nh8qYB4x
	c8YJ7tnKEZE1q2nWDEasi2dWVWzFmFjhJIpt0sa2r/5z03cZE5fLemHSxobAxieWa9F7qpAlCAA0J
	5v1QcLYRo7ZAvxVZRuqupkwNT1I3X79lw2GFkp9FqjqmG/xqrYRF7knr1cdZEya34fVeBszz5qz+S
	Sa/gd6M7JMGFPSjv6vWN/XkzGZ+SP0GHKk9FdppAR9wJiuQdiKO8ZFpF3U1+KoMgAga9d7sYt1D2B
	cB8F7RmkjjJYFE7oQtUfmFaBKxal/IEiPv4fW+Ehnb5dSOSkvJ/1tGF8Lj64lOknDDrY1ZP/93rGM
	0YmZyt67L2rMF5l1qvaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxlfW-007Edx-LC; Mon, 28 Jun 2021 07:26:58 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxlfJ-007EcF-Ry
 for linux-mediatek@lists.infradead.org; Mon, 28 Jun 2021 07:26:47 +0000
Received: by mail-pl1-x62a.google.com with SMTP id u19so2712588plc.3
 for <linux-mediatek@lists.infradead.org>; Mon, 28 Jun 2021 00:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=CsEyi+ba8SRVvbqYHH4jH1LVCacUh7q5WrGtZYt+9O0=;
 b=uS/PWnJw9EEYCs7oPju6zEF2huhjziG/Ai+HwVvEbygzN696DD0hR6oCRnY0utpird
 l9wslKvhoYQmH3iJmab+T+Abuj0VG2uHXJ9E1cksWc5ROkYG7zacDj2Peh0eUfzvmiEN
 eSN+PgeDf0S2LYqlfaPzDTZidl7eXk4EjAFOtxV9aVje/oMACppZDyKCtPC0LKToHhRR
 sljfjg637WIkilO3gLVuBmugZcTJ708YnXxdyXL0L+FhYYL/8DPeCjzi+mgSup2ZvXSq
 PTZpWbv2FeE6I+50oVZTLZg3O6aCsSsH3/rmgRjl0jxwKsJIbaZxsQdx4DYZLE0oVFmj
 Vc4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CsEyi+ba8SRVvbqYHH4jH1LVCacUh7q5WrGtZYt+9O0=;
 b=O5UrGyQi/4djeeXp2Kt1VVDEbmOmOgcDohNh0/yR3q5beq3PaK7cs6BW3lnTT2o+Za
 cMObz0FpwHxKV1FVUfu8TPmRslbhS9aumcOt9IJrIPyjZQ2JFh+4lW0ZPe2SKFjscP2t
 OoihJ2Dls1ztF3beJInRfVqnS6RsSRQStnPgAxtcfvcqOM73ekIyyQ8xJozd5SKTmCQ/
 J/0LWenng1CzrvwCqqlKlDbZRF+wj1RmYDZWj9D8AiOYwpzfdCrxsqKZiglXS6RT93Wx
 GzC0GuSwOjgiU9ikOh5YDVIg/IxSHX7PmA2hpzoDhGBBioyn0yxymDh+9uqYCP7gECEK
 ggLA==
X-Gm-Message-State: AOAM531P1cr5F050E+W7rL0McyJlS4wWPI5WmFYS6a49tYlJJHarYAIG
 5G240BqdqCq5Qr5wWjYNZLxM9Q==
X-Google-Smtp-Source: ABdhPJzvj3RyJoV/06Ww25nVFOFF8bC770v05nPHwgY/XXaIshX/WE20M/moTS6WjQFUX7/ZSyTbWg==
X-Received: by 2002:a17:90a:4d4e:: with SMTP id
 l14mr26329436pjh.129.1624865204126; 
 Mon, 28 Jun 2021 00:26:44 -0700 (PDT)
Received: from localhost ([136.185.134.182])
 by smtp.gmail.com with ESMTPSA id h24sm13522053pfn.180.2021.06.28.00.26.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 00:26:43 -0700 (PDT)
Date: Mon, 28 Jun 2021 12:56:41 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Hector Yuan <hector.yuan@mediatek.com>, Sudeep.Holla@arm.com
Cc: linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com
Subject: Re: [PATCH v12 1/2] cpufreq: mediatek-hw: Add support for CPUFREQ HW
Message-ID: <20210628072641.amqk5d3svwolvhic@vireshk-i7>
References: <1622307153-3639-1-git-send-email-hector.yuan@mediatek.com>
 <1622307153-3639-2-git-send-email-hector.yuan@mediatek.com>
 <20210614104058.jdwb7godqzhf7rgd@vireshk-i7>
 <1624781848.1958.16.camel@mtkswgap22>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1624781848.1958.16.camel@mtkswgap22>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210628_002645_984386_4E080EEF 
X-CRM114-Status: GOOD (  16.94  )
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

On 27-06-21, 16:17, Hector Yuan wrote:
> On Mon, 2021-06-14 at 16:10 +0530, Viresh Kumar wrote:
> > On 30-05-21, 00:52, Hector Yuan wrote:
> > > +static int mtk_get_related_cpus(int index, struct cpufreq_mtk *c)
> > > +{
> > > +	struct device_node *cpu_np;
> > > +	struct of_phandle_args args;
> > > +	int cpu, ret;
> > > +
> > > +	for_each_possible_cpu(cpu) {
> > > +		cpu_np = of_cpu_device_node_get(cpu);
> > > +		if (!cpu_np)
> > > +			continue;
> > > +
> > > +		ret = of_parse_phandle_with_args(cpu_np, "performance-domains",
> > > +						 "#performance-domain-cells", 0,
> > > +						 &args);
> > > +		of_node_put(cpu_np);
> > > +		if (ret < 0)
> > > +			continue;
> > > +
> > > +		if (index == args.args[0]) {
> > > +			cpumask_set_cpu(cpu, &c->related_cpus);
> > > +			mtk_freq_domain_map[cpu] = c;
> > > +		}
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > 
> > I really hope this can be moved to a common place as more than one
> > drier should be required to parse this thing.
> > 
> 
> Yes, this can be a common part for all performance domain users. But may
> I know whats your suggestion? Put this API in another file or? Thanks

Rob, Sudeep: You guys have a suggestion on where can we keep a routine for this
?

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
