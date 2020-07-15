Return-Path: <SRS0=kQBs=A2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A99C433E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2020 03:38:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F3502072D
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2020 03:38:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vwlFSpxc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xCm6WtGg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F3502072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Nw3+ul9Mng1+j94PbqzhDqpAABCRHGlD9Uhp/mGK9/k=; b=vwlFSpxc7QlIqeJX4bCoezCS/
	VhG0arcQSykMqjoXHxnl4+iy8TDy5G0ZCFvnbeP+NMky5UEhiYxM6jPet3/7drMb1my9ClmhkLiXQ
	VqZO+fLtOXLCCYjvaXH50/fnCWcqJZu5QkcjtXTL22ap8ZOZHyuDWsytd2CKYTkdw37mDykqlA89z
	NGFZkYR07lIg5tW4GxlxbCWhTUxFPzI0Cd/5stn+vFR0BuF4QNZJzTJ0B6NsA1hKAIdHbH/hl6Ajj
	xHurKKd6hSccT9f4O6Bsg2LCgQ6FUAHRtfilrRahX4+2qF3ryomUnlQeRaNqytthroi6ty4ZULuia
	aJTS24JGw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvYFh-0007pO-Bd; Wed, 15 Jul 2020 03:38:37 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvYFc-0007o3-NO
 for linux-mediatek@lists.infradead.org; Wed, 15 Jul 2020 03:38:33 +0000
Received: by mail-pf1-x443.google.com with SMTP id z3so1294695pfn.12
 for <linux-mediatek@lists.infradead.org>; Tue, 14 Jul 2020 20:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DC+j4EVae4RnLgJTCnOM6IjTjMXDQK4HU4GWa3Ol4iw=;
 b=xCm6WtGghrzZIHVeAIpX3VeTjOAkwZB6Fpfm+5q+peTbvNwBqUgp7IbGuiU9enBs7U
 5uHg40id4ZeaRWExKahikfXjxTSRsayAf1OXtEwF2YY1M2ucllTGBKph8FxkHmFxe9vX
 O4cr4qQvAn05YFGyDunY/3YCeP+Fd45IrYqMrp7lpgFgs6OPtGQ7lBFkQN3WJMca2jI4
 weeg3jYtK8YO9eKuAFpTmBWVhXHH+aGK3hPDr8f7e7c8uRK7rQaD6SLQvBduNO269v1/
 EC7201KifvPXfG5MRO0gKp3lv2JdU7+45Diuj4RBonHUhLB9rEMeHspt+9KUb9i8jkQa
 FNSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DC+j4EVae4RnLgJTCnOM6IjTjMXDQK4HU4GWa3Ol4iw=;
 b=TXHqYwj7cNgk/PJgjCn2p+e7R4t0ehcrC//Oq6O04XkkHVwIeu5kv44qIpkRuCZWFo
 VILmy7qk8cj+Ub/VrudqLeSt6eguZR01qB6RvceK6vXTLPbIqSDLKlcyZsvIEx/447M8
 6PKYhrj4pAbGaFvXta7o9L7GKcNAGBpXhlFnmIpNXsN6r8EH9G8BKbuw4Dl/hZc4znP3
 uy1GRZPYZ5bDiwfLrmi303C52+7ZjpeFEOrhWx85OrJ0lk5uiNYUa2QFw7SQzfxt+1fL
 WYtxxV70GMvfRNpUguQOKNndMAptLLP0bwr3/RLgK4+JDWqqStPS784QQIgIU6tv/XdO
 SGQw==
X-Gm-Message-State: AOAM5309FuKMECB48f3eUnYDhATsM6T3lGVSy8jcPvqD0HueTwZzKa0v
 U7e9gjtp1GhaEC7zeidRItNxng==
X-Google-Smtp-Source: ABdhPJxrD9asMf+2w6YPcEVsiXhZteYoAJngfCjvTBomN8Y7B2D79FF9MwHPqmVmjskvbysGwmnbwQ==
X-Received: by 2002:aa7:858c:: with SMTP id w12mr7531416pfn.143.1594784310954; 
 Tue, 14 Jul 2020 20:38:30 -0700 (PDT)
Received: from localhost ([122.172.34.142])
 by smtp.gmail.com with ESMTPSA id m26sm302796pff.84.2020.07.14.20.38.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 Jul 2020 20:38:30 -0700 (PDT)
Date: Wed, 15 Jul 2020 09:08:28 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "andrew-sh.cheng" <andrew-sh.cheng@mediatek.com>
Subject: Re: [PATCH v7 2/8] cpufreq: mediatek: Enable clock and regulator
Message-ID: <20200715033828.zzjavbzg32dxkga4@vireshk-i7>
References: <1594348284-14199-1-git-send-email-andrew-sh.cheng@mediatek.com>
 <1594348284-14199-3-git-send-email-andrew-sh.cheng@mediatek.com>
 <20200713093909.676v7wxjzsz4vbxv@vireshk-i7>
 <1594732689.24540.4.camel@mtksdaap41>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1594732689.24540.4.camel@mtksdaap41>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_233832_793830_6CAC4FFF 
X-CRM114-Status: GOOD (  25.66  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>,
 srv_heupstream@mediatek.com, linux-pm@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Mark Brown <broonie@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 14-07-20, 21:18, andrew-sh.cheng wrote:
> On Mon, 2020-07-13 at 15:09 +0530, Viresh Kumar wrote:
> > On 10-07-20, 10:31, Andrew-sh.Cheng wrote:
> > > From: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>
> > > 
> > > Need to enable regulator,
> > > so that the max/min requested value will be recorded
> > > even it is not applied right away.
> > > 
> > > Intermediate clock is not always enabled by ccf in different projects,
> > > so cpufreq should enable it by itself.
> > > 
> > > Change-Id: I9f4c8b1ea793794f5f9cdc65427daad1393f5df8
> > 
> > You are on V7 right now, these should have been gone long back.
> 
> Hi Viresh, 
> Sorry for forgetting to remove the change-ID message.
> 
> > 
> > > Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> > > ---
> > >  drivers/cpufreq/mediatek-cpufreq.c | 33 +++++++++++++++++++++++++++++----
> > >  1 file changed, 29 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> > > index 0c98dd08273d..4b479c110cc9 100644
> > > --- a/drivers/cpufreq/mediatek-cpufreq.c
> > > +++ b/drivers/cpufreq/mediatek-cpufreq.c
> > > @@ -350,6 +350,11 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
> > >  		ret = PTR_ERR(proc_reg);
> > >  		goto out_free_resources;
> > >  	}
> > > +	ret = regulator_enable(proc_reg);
> > > +	if (ret) {
> > > +		pr_warn("enable vproc for cpu%d fail\n", cpu);
> > > +		goto out_free_resources;
> > > +	}
> > 
> > This is already done by the OPP core now.
> 
> Do you mean I can use dev_pm_opp_set_regulators() and
> dev_pm_opp_set_rate() to do dvfs?
> Due to mediatek-cpufreq may change Vproc and Vsram by special flow, that
> is not suitable.

Sorry about that. I completely missed that you aren't using
dev_pm_opp_set_rate().

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
