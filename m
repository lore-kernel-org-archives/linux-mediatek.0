Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F332BC433E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 03:48:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAA422145D
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 03:48:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RetTSqwB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="TWtYHWM+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAA422145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C3N3g/x6GfLQ0ioRTEgoTl7Qsg0LCs8uwxcP5oSCpMo=; b=RetTSqwBOTIjd1TZ3eIgC3LE6
	IbwwVle3HwmMLa1TsWkq3DeL39Zg0Ww0r8xSzktKJLfeTd5GXEymUAarx4/siXkxZfLWOHm+n0Ano
	b1SQhRA7d8PkdGd58wcvvRqEEKe2aEiLTGgL7/PVuhygaGHFsKwhfld+el2MITql6Mt/3990d/NDZ
	WezPUxhMwOud1DCMtGT/ghNrO7099xX12Y8FUfCnWor/aayU/e08z8oFUKzOOdN7/bJkhsSxdbsm8
	1MR6mSTJVMxpSm8uPNASbwXvq7VEKPtvJllZ3B0TBN03WE4kCQTSaB9roVfhGPGlOZtNWcjVYnbqi
	PXeMNVkBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGDZZ-0007cC-Uz; Thu, 10 Sep 2020 03:48:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGDZX-0007a9-83; Thu, 10 Sep 2020 03:48:33 +0000
X-UUID: c384ed859469456d97a29ad17d17ce7c-20200909
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=h4KTk5shQrSyQDIxPJZftxCwDg7ngCtftlyh+RM3c1o=; 
 b=TWtYHWM+f2I2op8pMxtixr3wdhqoFJJr9dvWVQBh0Fp+CtK87F3Bhu4kFBd2fXNoYTiLTUQG9VbLClJ04eRvkkosGnHB4H6sG8U2rEdSFs4+LvPJXgEzSz0mD+GdX8nGaL9bEgC8CtnPIR1XWAHyvwEZbfpABlX6KoR7WOhyX2A=;
X-UUID: c384ed859469456d97a29ad17d17ce7c-20200909
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1473506733; Wed, 09 Sep 2020 19:48:29 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Sep 2020 20:48:26 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Sep 2020 11:48:21 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Sep 2020 11:48:22 +0800
Message-ID: <1599709702.7042.1.camel@mtkswgap22>
Subject: Re: [PATCH v6 1/2] cpufreq: mediatek-hw: Add support for Mediatek
 cpufreq HW driver
From: Hector Yuan <hector.yuan@mediatek.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Date: Thu, 10 Sep 2020 11:48:22 +0800
In-Reply-To: <20200910034245.eqya625p7la33dkc@vireshk-i7>
References: <1599658476-16562-1-git-send-email-hector.yuan@mediatek.com>
 <1599658476-16562-2-git-send-email-hector.yuan@mediatek.com>
 <20200910034245.eqya625p7la33dkc@vireshk-i7>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: A78FA5853F92044C4771A9B1C8BF1BDA2274661E2593E21FCABB848E93EDED232000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_234831_429147_85241045 
X-CRM114-Status: GOOD (  16.78  )
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
 linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, Rob
 Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-09-10 at 09:12 +0530, Viresh Kumar wrote:
> On 09-09-20, 21:34, Hector Yuan wrote:
> > +static unsigned int mtk_cpufreq_hw_get(unsigned int cpu)
> > +{
> > +	struct cpufreq_mtk *c;
> > +	struct cpufreq_policy *policy;
> > +	unsigned int index;
> > +
> > +	policy = cpufreq_cpu_get_raw(cpu);
> > +	if (!policy)
> > +		return 0;
> 
> Why didn't you drop policy as we discussed in previous version ?
> 
Sorry I missed that. Thank you.
> > +	c = mtk_freq_domain_map[cpu];
> > +
> > +	index = readl_relaxed(c->reg_bases[REG_PERF_STATE]);
> > +	index = min(index, LUT_MAX_ENTRIES - 1);
> > +
> > +	return policy->freq_table[index].frequency;
> 
> policy->freq_table and c->table are same, isn't it ?
> 
Yes, you are right.
> > +}
> > +
> > +static struct platform_driver mtk_cpufreq_hw_driver = {
> > +	.probe = mtk_cpufreq_hw_driver_probe,
> > +	.remove = mtk_cpufreq_hw_driver_remove,
> > +	.driver = {
> > +		.name = "mtk-cpufreq-hw",
> > +		.of_match_table = mtk_cpufreq_hw_match,
> > +	},
> > +};
> > +
> 
> Remove this blank line.
> 
OK
> > +module_platform_driver(mtk_cpufreq_hw_driver);
> > +
> > +MODULE_DESCRIPTION("mtk CPUFREQ HW Driver");
> 
> Maybe write this is "Mediatek cpufreq-hw driver" ?
> 
OK
> > +MODULE_LICENSE("GPL v2");
> > -- 
> > 1.7.9.5
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
