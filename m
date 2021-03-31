Return-Path: <SRS0=zLKe=I5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD8FC433C1
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 05:22:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28ED76191B
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 05:22:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28ED76191B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7LYAFCx11FNx2c6OGO2YP1VPfDmPguIMaF7GhknUZfA=; b=Ta0EJG4NRM+D8iZOUNyOf/LH2
	9IkG0LKbJdYVmeTtLLr2A/OCSk32Uguqy0sv3oqGcwKwVAgnNsBsT0+HZNOo1txly/atHxmeAlzJJ
	gsswRxY/5mn1GavoZ1e/mAZhvo2W82iFVLbiayKxnY2xIYMBnsdAeUoZhtfJTQhcvCcrux403KQGo
	MZG1rEhrtDRcfpKwLYHpX2mRSpLUtCviZFUOhJES0OCeGOcomFnFuCl5q9W8Iu+Lx7oLYtWwNVLZT
	wGCJ50+uad6KkJW4D1IUEWWyoqciH4mkv3TM6OlR16WPw2qlHxWw0ogXaWbLklYsB+VItZkNTduHD
	EL7V+Ir9Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRTIi-005Wxp-Er; Wed, 31 Mar 2021 05:21:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRTIc-005WxH-Qq; Wed, 31 Mar 2021 05:21:53 +0000
X-UUID: 4bafa93c127a427f879534a316b73e35-20210330
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=P6GvUFlICfK8CWPcfyF78CgxA+1D5pNq7t/IGPqn030=; 
 b=csi2Uz+94FDqrBShuWcL3bn5S5S/tJoJv43F2mPk1ySGWw9dEBw+0I4IK9UN1aZChMickv9tnvYAWvpSG+lvAS0sfDtOKi5cicYaSX5gPRGdEgFCfUryWPcoCxKfSs3YvaDqi/GcGRbOYH4cOBs9gQHZ4ginxjNdDqQh5SJ7jK4=;
X-UUID: 4bafa93c127a427f879534a316b73e35-20210330
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <andrew-sh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1378724415; Tue, 30 Mar 2021 22:21:42 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Mar 2021 22:21:41 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 31 Mar 2021 13:21:39 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 31 Mar 2021 13:21:39 +0800
Message-ID: <1617168099.18405.8.camel@mtksdaap41>
Subject: Re: [PATCH V8 2/8] cpufreq: mediatek: Enable clock and regulator
From: andrew-sh.cheng <andrew-sh.cheng@mediatek.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, "Rob
 Herring" <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <srv_heupstream@mediatek.com>
Date: Wed, 31 Mar 2021 13:21:39 +0800
In-Reply-To: <20210330043629.x62j2apv2nv4mw67@vireshk-i7>
References: <1616499241-4906-1-git-send-email-andrew-sh.cheng@mediatek.com>
 <1616499241-4906-3-git-send-email-andrew-sh.cheng@mediatek.com>
 <20210330043629.x62j2apv2nv4mw67@vireshk-i7>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_062151_626682_79A1B186 
X-CRM114-Status: GOOD (  20.36  )
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

On Tue, 2021-03-30 at 10:06 +0530, Viresh Kumar wrote:
> On 23-03-21, 19:33, Andrew-sh.Cheng wrote:
> > From: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>
> > 
> > Need to enable regulator,
> > so that the max/min requested value will be recorded
> > even it is not applied right away.
> > 
> > Intermediate clock is not always enabled by ccf in different projects,
> > so cpufreq should enable it by itself.
> > 
> > Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> > ---
> >  drivers/cpufreq/mediatek-cpufreq.c | 33 +++++++++++++++++++++++++++++----
> >  1 file changed, 29 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> > index f2e491b25b07..432368707ea6 100644
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
> Regulators are enabled by OPP core as well now, you sure this is
> required ?
> 
Hi Viresh,
Yes.
As you mentioned, it will be enable by OPP core.

Per discuss with hotplug owner and regulator owner,
they suggest that "users should not suppose other module, will enable
regulators for them".
They suggest to add enable_regulator here.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
