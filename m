Return-Path: <SRS0=zNLT=LW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C10D6C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jun 2021 09:11:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A1C26198E
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jun 2021 09:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A1C26198E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vVkFC4lwiM6sVlrpbcX+tlzdD5uVEZ8HblOWLUiBEIo=; b=RxaZAxZzJb0N+m
	iz3lHlqK9WIy8oCkWdVdpirXj1g6Oeq284A5bZjcBq3Umm0/QnfUlcPwKB3jJMCdJwZRJWwixHkoW
	ywQKC/l52uWVMEjFWay5kLTfh+5zN1hYSwjWOGmHL0r3rqpNHVJChoCHlQNZI5xRPCBfCB1q2mVxq
	0C2Dks7wl1h4s3DalXbdDnlI3iuV9Wk0xjBImTgWZ2L5nwFM9GVF4P/S7qf/1xlZV/tJObCGIvlb3
	tjR8Wnnao78/g32HuSXNRNuOeIou/m1TOJVOV82P+u1jgUVZJealxoU7tiXXeQsxFu8QZvVHtaZAZ
	K1NCVLFIidYd9V5wWomw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxnIB-007SfA-SD; Mon, 28 Jun 2021 09:10:59 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxnI0-007SdJ-7O; Mon, 28 Jun 2021 09:10:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC2611FB;
 Mon, 28 Jun 2021 02:10:43 -0700 (PDT)
Received: from bogus (unknown [10.57.78.75])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF5AE3F694;
 Mon, 28 Jun 2021 02:10:40 -0700 (PDT)
Date: Mon, 28 Jun 2021 10:09:56 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Hector Yuan <hector.yuan@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com
Subject: Re: [PATCH v12 1/2] cpufreq: mediatek-hw: Add support for CPUFREQ HW
Message-ID: <20210628090956.uwkrozdqvawsm3xp@bogus>
References: <1622307153-3639-1-git-send-email-hector.yuan@mediatek.com>
 <1622307153-3639-2-git-send-email-hector.yuan@mediatek.com>
 <20210614104058.jdwb7godqzhf7rgd@vireshk-i7>
 <1624781848.1958.16.camel@mtkswgap22>
 <20210628072641.amqk5d3svwolvhic@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210628072641.amqk5d3svwolvhic@vireshk-i7>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210628_021048_367475_4691F643 
X-CRM114-Status: GOOD (  18.40  )
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

On Mon, Jun 28, 2021 at 12:56:41PM +0530, Viresh Kumar wrote:
> On 27-06-21, 16:17, Hector Yuan wrote:
> > On Mon, 2021-06-14 at 16:10 +0530, Viresh Kumar wrote:
> > > On 30-05-21, 00:52, Hector Yuan wrote:
> > > > +static int mtk_get_related_cpus(int index, struct cpufreq_mtk *c)
> > > > +{
> > > > +	struct device_node *cpu_np;
> > > > +	struct of_phandle_args args;
> > > > +	int cpu, ret;
> > > > +
> > > > +	for_each_possible_cpu(cpu) {
> > > > +		cpu_np = of_cpu_device_node_get(cpu);
> > > > +		if (!cpu_np)
> > > > +			continue;
> > > > +
> > > > +		ret = of_parse_phandle_with_args(cpu_np, "performance-domains",
> > > > +						 "#performance-domain-cells", 0,
> > > > +						 &args);
> > > > +		of_node_put(cpu_np);
> > > > +		if (ret < 0)
> > > > +			continue;
> > > > +
> > > > +		if (index == args.args[0]) {
> > > > +			cpumask_set_cpu(cpu, &c->related_cpus);
> > > > +			mtk_freq_domain_map[cpu] = c;
> > > > +		}
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +}
> > >
> > > I really hope this can be moved to a common place as more than one
> > > drier should be required to parse this thing.
> > >
> >
> > Yes, this can be a common part for all performance domain users. But may
> > I know whats your suggestion? Put this API in another file or? Thanks
>
> Rob, Sudeep: You guys have a suggestion on where can we keep a routine for this
> ?

Probably in driver/cpufreq or some related headers if it needs to access
related_cpus and is more cpufreq related in that way ?

Orthogonal to that, I prefer to make the generic function take list_name
and cells_name as generic. I see we can reuse that qcom-cpufreq-hw.c
with "qcom,freq-domain" and "#freq-domain-cells".

--
Regards,
Sudeep

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
