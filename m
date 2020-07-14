Return-Path: <SRS0=0yQJ=AZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 570A0C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 13:18:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22710224B2
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 13:18:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sRJyQS1d";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="h/yN9V+M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22710224B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=H/DN7fuBStdLyrPTSLL6QgZNCxIIgD3/S2IL1y8UsDE=; b=sRJyQS1doOlN6q9RLg0KaSQDP
	9BgWBYiYZ8Ke2sBFtvuSZBAYWSGxCX3fUQlia1EIDg1LmogA3YsAonrFWLR2aASex03SPI8J+XufN
	MvQ4Z/CG2eIG+Nm6Iy13AUt09AzMhcnx4djwpQC7FkZVamUG+u7ehKM8P//j9dAjxyRjIbkGxE5Pk
	HCKaIsMGIhbQJ2MX6qzGvPbzWri7kBl51eyXEhUaArh3QOuh8rkWppal/n6X43MwstLO4j5zy5WqH
	adqaYzREumutFxq5fu/mbR6Z4RpZWzC9YpUb3dMSg/DOUm48GatZQgyfprbpSWaX7Z5Pr+bw58iYr
	UhHi3re+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvKpA-0000tT-7i; Tue, 14 Jul 2020 13:18:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvKp7-0000sm-Nh; Tue, 14 Jul 2020 13:18:19 +0000
X-UUID: 64413be891dd470ea4979aa5fb5edaa5-20200714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=DUBxxzB743wO4qbS7htbu6zjx8J9N8Ntr+L49qQZfyw=; 
 b=h/yN9V+ME2xwJhMplUO/+5QeXK9tBPiF7sDc7Oozjue3kRGNAW1Ernlh7LObfq3O8DYLOdcOxwar+SO5h1LOxl2gWz59jijXF+CYOofzQWlUAoc058Xup1g7Bn/IewGragSL/TmuMYfAJ3ZtuIPC/sX81f8NeBDOdz7McfUVnK4=;
X-UUID: 64413be891dd470ea4979aa5fb5edaa5-20200714
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <andrew-sh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 512671997; Tue, 14 Jul 2020 05:18:14 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jul 2020 06:18:08 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jul 2020 21:18:07 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 14 Jul 2020 21:18:07 +0800
Message-ID: <1594732689.24540.4.camel@mtksdaap41>
Subject: Re: [PATCH v7 2/8] cpufreq: mediatek: Enable clock and regulator
From: andrew-sh.cheng <andrew-sh.cheng@mediatek.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Date: Tue, 14 Jul 2020 21:18:09 +0800
In-Reply-To: <20200713093909.676v7wxjzsz4vbxv@vireshk-i7>
References: <1594348284-14199-1-git-send-email-andrew-sh.cheng@mediatek.com>
 <1594348284-14199-3-git-send-email-andrew-sh.cheng@mediatek.com>
 <20200713093909.676v7wxjzsz4vbxv@vireshk-i7>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_091818_002992_8492A6CC 
X-CRM114-Status: GOOD (  21.99  )
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
 linux-arm-kernel@lists.infradead.org, Matthias
 Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-07-13 at 15:09 +0530, Viresh Kumar wrote:
> On 10-07-20, 10:31, Andrew-sh.Cheng wrote:
> > From: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>
> > 
> > Need to enable regulator,
> > so that the max/min requested value will be recorded
> > even it is not applied right away.
> > 
> > Intermediate clock is not always enabled by ccf in different projects,
> > so cpufreq should enable it by itself.
> > 
> > Change-Id: I9f4c8b1ea793794f5f9cdc65427daad1393f5df8
> 
> You are on V7 right now, these should have been gone long back.

Hi Viresh, 
Sorry for forgetting to remove the change-ID message.

> 
> > Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> > ---
> >  drivers/cpufreq/mediatek-cpufreq.c | 33 +++++++++++++++++++++++++++++----
> >  1 file changed, 29 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> > index 0c98dd08273d..4b479c110cc9 100644
> > --- a/drivers/cpufreq/mediatek-cpufreq.c
> > +++ b/drivers/cpufreq/mediatek-cpufreq.c
> > @@ -350,6 +350,11 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
> >  		ret = PTR_ERR(proc_reg);
> >  		goto out_free_resources;
> >  	}
> > +	ret = regulator_enable(proc_reg);
> > +	if (ret) {
> > +		pr_warn("enable vproc for cpu%d fail\n", cpu);
> > +		goto out_free_resources;
> > +	}
> 
> This is already done by the OPP core now.

Do you mean I can use dev_pm_opp_set_regulators() and
dev_pm_opp_set_rate() to do dvfs?
Due to mediatek-cpufreq may change Vproc and Vsram by special flow, that
is not suitable.

> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
