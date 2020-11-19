Return-Path: <SRS0=wQP+=EZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F8ACC2D0E4
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 13:43:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DFBD206D5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 13:43:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gsf4Wu4b";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IaY5ZYdl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DFBD206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Wog/WU88gvESBHew7KMJYpvyDfx1dxrFkjPLKdUwcmg=; b=Gsf4Wu4bGy1A2eB40EfRCe/Hq
	hyREQf+lBwW+UbNF/lsFDZOJJMd/E1WNB1I3NY4hXQwC7zrLezRFwpYZcIfkZSLol18AfdMB6KPtL
	6ePDQd5srDwQDhoPNukik3j8TAjNY6V3UcKxAKp5ed5ePYDnWllb5cVv4GArKmuenylDenIUg/NqK
	7cs7WvsaHoh7NPc+t0AR5FuyqLPiSG2MCFQyOgAyHQRb6by+4ycHdMMgtVl+X69dBEgwRuqmxynTJ
	hlknTNCaRSNBc+tpOkkHyLvVYe5503pMQMckrilt0sPRHuzT/M1rAp2kbx+npJhvxowwHy8G//dgA
	Qubp9hmrw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfkDY-0002A3-Dz; Thu, 19 Nov 2020 13:43:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfkDP-00026W-IU; Thu, 19 Nov 2020 13:43:12 +0000
X-UUID: 90f25ee3c8a14fa89136f597c95b4883-20201119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=f+40F60WpF0RZTPE/zrEdYD2XiyfhWpsYsOzRWiBkB8=; 
 b=IaY5ZYdlfEnGZ1UYxohbkFYvMeYXEsWBRo1RGp6SUtKGLiXoL1QhU5/kiZevF9mdakSzeBCF5Th7nC6W6lAG1znaoEkWhFgy7kzICYW9798X5Jw0Ws0XIQXD5Rk33UDMSG0/gczUt7+WrCUr7FLTF//1ejweY8NWg5aaMP3p9kM=;
X-UUID: 90f25ee3c8a14fa89136f597c95b4883-20201119
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 553868426; Thu, 19 Nov 2020 05:43:04 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 Nov 2020 05:40:32 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 Nov 2020 21:40:18 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 19 Nov 2020 21:40:18 +0800
Message-ID: <1605793218.20463.5.camel@mtkswgap22>
Subject: Re: [PATCH v8 1/3] cpufreq: mediatek-hw: Add support for CPUFREQ HW
From: Hector Yuan <hector.yuan@mediatek.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Date: Thu, 19 Nov 2020 21:40:18 +0800
In-Reply-To: <9382b917-f20d-c7b5-42e4-46d11465073f@arm.com>
References: <1603700349-5922-1-git-send-email-hector.yuan@mediatek.com>
 <1603700349-5922-2-git-send-email-hector.yuan@mediatek.com>
 <9382b917-f20d-c7b5-42e4-46d11465073f@arm.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_084311_770837_22E772F3 
X-CRM114-Status: GOOD (  21.25  )
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
 Santosh Shilimkar <ssantosh@kernel.org>, "Rafael
 J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Amit Kucheria <amit.kucheria@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-11-19 at 12:41 +0000, Lukasz Luba wrote:
> Hi Hector,
> 
> On 10/26/20 8:19 AM, Hector Yuan wrote:
> > From: "Hector.Yuan" <hector.yuan@mediatek.com>
> > 
> > Add cpufreq HW support.
> > 
> > Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
> 
> [snip]
> 
> > +
> > +static int mtk_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
> > +{
> > +	struct cpufreq_mtk *c;
> > +	struct device *cpu_dev;
> > +	struct em_data_callback em_cb = EM_DATA_CB(mtk_cpufreq_get_cpu_power);
> > +	struct pm_qos_request *qos_request;
> > +	int sig, pwr_hw = CPUFREQ_HW_STATUS | SVS_HW_STATUS;
> > +
> > +	qos_request = kzalloc(sizeof(*qos_request), GFP_KERNEL);
> > +	if (!qos_request)
> > +		return -ENOMEM;
> > +
> > +	cpu_dev = get_cpu_device(policy->cpu);
> > +	if (!cpu_dev) {
> > +		pr_err("failed to get cpu%d device\n", policy->cpu);
> > +		return -ENODEV;
> > +	}
> > +
> > +	c = mtk_freq_domain_map[policy->cpu];
> > +	if (!c) {
> > +		pr_err("No scaling support for CPU%d\n", policy->cpu);
> > +		return -ENODEV;
> > +	}
> > +
> > +	cpumask_copy(policy->cpus, &c->related_cpus);
> > +
> > +	policy->freq_table = c->table;
> > +	policy->driver_data = c;
> 
> To control frequency transition rate in schedutil, you might
> be interested in setting:
> 
> policy->cpuinfo.transition_latency = <mtk_value_here>;
> 
> Example, when this latency value comes from FW [1]
> 
OK, I will add it in v9.
> > +
> > +	/* Let CPUs leave idle-off state for SVS CPU initializing */
> > +	cpu_latency_qos_add_request(qos_request, 0);
> > +
> > +	/* HW should be in enabled state to proceed now */
> > +	writel_relaxed(0x1, c->reg_bases[REG_FREQ_ENABLE]);
> > +
> > +	if (readl_poll_timeout(c->reg_bases[REG_FREQ_HW_STATE], sig,
> > +			       (sig & pwr_hw) == pwr_hw, POLL_USEC,
> > +			       TIMEOUT_USEC)) {
> > +		if (!(sig & CPUFREQ_HW_STATUS)) {
> > +			pr_info("cpufreq hardware of CPU%d is not enabled\n",
> > +				policy->cpu);
> > +			return -ENODEV;
> > +		}
> > +
> > +		pr_info("SVS of CPU%d is not enabled\n", policy->cpu);
> > +	}
> > +
> > +	em_dev_register_perf_domain(cpu_dev, c->nr_opp, &em_cb, policy->cpus);
> 
> Please keep in mind that this is going to be changed soon with a new
> argument: 'milliwatts'. It's queued in pm/linux-next [2].
> 
OK, thanks for the remind.
> Regards,
> Lukasz
> 
> [1] 
> https://elixir.bootlin.com/linux/latest/source/drivers/cpufreq/scmi-cpufreq.c#L194
> [2] 
> https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/commit/?h=linux-next&id=c250d50fe2ce627ca9805d9c8ac11cbbf922a4a6
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
