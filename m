Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73DE1C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 11:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FmKoWSceBLzs/uvR4Z+K6dCXmIgg8MYTyDXxnb9KV50=; b=wG5NwFMaqz5dIs
	Zg4M4eU1gF1jrzBIl/k3rk4GJ3y+zojURZJcG/fU5IQSjWMD/NK71U9UvTYkXtxBq8tgu688v0Dbe
	s7mPDPM+5QWsKk0wF90vSbhqmh7NsnBq7amNTj9V+JEbBv7S7FKXlrRcSfSyYw7OJf/fdh+Wt1wtL
	/PeuemGatJpKrYq2aw1SA+2NsaqC/6Ok4gUFeq0J5AM3sZu0Iswt4Gj5xbeOYhoh2L74lDQmSDTR1
	gVjNeWcAOgXc8DmPUGgTI1DcNq2jMc40OaRUvpDzle9dEHIBDr7PiHGYoI76X0sXur3tvtQm9V7CY
	6nh+de7zbOp6kz/f0/VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njJ8k-00E3Pr-JV; Tue, 26 Apr 2022 11:13:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njJ8i-00E3Mn-6a; Tue, 26 Apr 2022 11:13:53 +0000
X-UUID: 9a4f2aa70c5b4d60a5fc44b45b37a44e-20220426
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:bd43a924-3618-47cd-9079-bfb3fd88766e, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:2017c12e-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 9a4f2aa70c5b4d60a5fc44b45b37a44e-20220426
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 295747050; Tue, 26 Apr 2022 04:13:42 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Apr 2022 04:13:40 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 26 Apr 2022 19:13:26 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 26 Apr 2022 19:13:26 +0800
Message-ID: <078b1f9b39690da98cbd3c4528ba28374a097083.camel@mediatek.com>
Subject: Re: [PATCH V4 07/14] cpufreq: mediatek: Add .get function
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <rafael@kernel.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
 <matthias.bgg@gmail.com>, <jia-wei.chang@mediatek.com>,
 <roger.lu@mediatek.com>, <hsinyi@google.com>, <khilman@baylibre.com>,
 <angelogioacchino.delregno@collabora.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 26 Apr 2022 19:13:26 +0800
In-Reply-To: <20220425100058.4kbvmpi63ygni6k5@vireshk-i7>
References: <20220422075239.16437-1-rex-bc.chen@mediatek.com>
 <20220422075239.16437-8-rex-bc.chen@mediatek.com>
 <20220425053548.72w2jh2g6lpzgz6g@vireshk-i7>
 <64c690e8edf493ec0a4a14e0fdaad2d8e88e6da7.camel@mediatek.com>
 <20220425100058.4kbvmpi63ygni6k5@vireshk-i7>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_041352_284760_DADF96AC 
X-CRM114-Status: GOOD (  24.31  )
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

On Mon, 2022-04-25 at 15:30 +0530, Viresh Kumar wrote:
> On 25-04-22, 17:34, Rex-BC Chen wrote:
> > We found that the pulses of cpu voltage could be observed when
> > frequency is fixed (scaling_max_freq == scaling_min_freq) if using
> > cpufreq_generic_get as '.get' callback in MT8186.
> > cpufreq framework will constantly (~ 1 sec) call 'update' if the
> > policy
> 
> Which function gets called here in that case ? I would expect
> cpufreq_driver_target() to not make a call to MTK driver in that
> case, after it
> finds that new and old frequency are same (it will check the
> corresponding freq
> from cpufreq table).
> 
> > frequency is NOT equal to hardware frequency in
> > cpufreq_verify_current_freq.
> > The problem is that there might be a tiny difference between the
> > policy
> > frequency and the hardware frequency even they are very close.
> > e.g. policy frequency is 500,000,000 Hz however, hardware frequency
> > is
> > 499,999,726 Hz for MT8186 opp15.
> > 
> > To prevent the voltage pulses, we currently use the software cached
> > values as you pointed out.
> > I wonder is it possible to add a tolerence for checking difference
> > between policy frequency and hardware frequency in cpufreq
> > framework so
> > that we can use cpufreq_generic_get as callback without pulse
> > issue.
> > Or any suggestion would be appreciated.
> 
> 

Hello Viresh,

We have a non-upstream driver which tries to get frequency by
'cpufreq_get'.
When we use that non-upstream driver, 'cpufreq_verify_current_freq'
will be further invoked by 'cpufreq_get' and it would cause voltage
pulse issue as I described previously.
Therefore, we apply the solution in this series.

Recently, we found that using 'cpufreq_generic_get' directly in our
non-upstream driver can do the same thing without pulse issue.
It can meet your request as well.

So here, for cpufreq, I think it is proper to drop this patch and I
will do it in the next version.

Thanks for your review.

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
