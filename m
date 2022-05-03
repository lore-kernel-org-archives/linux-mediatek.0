Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1756C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 11:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OQCsVpzCfBGOb7Oxo8l5mAzxvy8+rlvxJacCRS7rEmc=; b=KAbmSPmCjvjySe
	LNFwXhSXXrqgOOIXZr3nT+M3v0nVPdVRjL/IsAtfXgaxyQNGBJiYDEoVBftkVwgZA5jYiRs4i0Yew
	FcICF0d7jufTwCPWHwaQifmsN3EKkVumESLOZVp7DTrNXCkJZTAZTdqioBom+CsmZObk7SnBRO7FZ
	q5y9lNl0wEEC6xS6hvqonkswKnnRDLUlNR9+Vnd+zPUjV3dKycojm6QYk3qYnov3MukGaCEPf+HlY
	tcswmY52RhYYQtEebbSv8+Dg1e9dbLCmbKT8cR9fjYvp+szVV+OJI6V63ACnp7YEf3zgIEXtBozkP
	WwEkk3faT15X50Dh0G8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlqnE-005c1V-6l; Tue, 03 May 2022 11:34:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlqn3-005bxC-Bw; Tue, 03 May 2022 11:34:02 +0000
X-UUID: 14418056d4f44a919fda77560b9e659e-20220503
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:463017cc-d8c9-4baf-8752-4330694b39c5, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:280653c7-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 14418056d4f44a919fda77560b9e659e-20220503
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1551064936; Tue, 03 May 2022 04:33:52 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 May 2022 04:33:50 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 3 May 2022 19:33:49 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 3 May 2022 19:33:48 +0800
Message-ID: <27a5dddd91b3dcbd69f08c10108cdec808237ace.camel@mediatek.com>
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
Date: Tue, 3 May 2022 19:33:48 +0800
In-Reply-To: <20220428114835.3ktimyz2tzzqdcbg@vireshk-i7>
References: <20220422075239.16437-1-rex-bc.chen@mediatek.com>
 <20220422075239.16437-8-rex-bc.chen@mediatek.com>
 <20220425053548.72w2jh2g6lpzgz6g@vireshk-i7>
 <64c690e8edf493ec0a4a14e0fdaad2d8e88e6da7.camel@mediatek.com>
 <20220425100058.4kbvmpi63ygni6k5@vireshk-i7>
 <078b1f9b39690da98cbd3c4528ba28374a097083.camel@mediatek.com>
 <20220427031141.or2owu5wrh2cadfo@vireshk-i7>
 <346736a339bed576817179ded3795d61f71fa06a.camel@mediatek.com>
 <20220428114835.3ktimyz2tzzqdcbg@vireshk-i7>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_043401_504224_A2F0321D 
X-CRM114-Status: GOOD (  35.03  )
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

On Thu, 2022-04-28 at 17:18 +0530, Viresh Kumar wrote:
> On 28-04-22, 19:16, Rex-BC Chen wrote:
> > Yes, the call stack will eventually go to __cpufreq_driver_target.
> > However, we can observe the mismatch between target_freq and
> > policy-cur 
> > with a tiny difference.
> > e.g.
> > [ 553.065356] cpufreq: target for CPU 0: 500000 kHz, relation 0,
> > requested 500000 kHz
> > [ 553.066366] cpufreq: target_freq/policy->cur: 500000/499999 kHz
> 
> So you are trying to set the frequency to 500 MHz now, but policy-
> >cur says it
> is 499 MHz.
> 
Hello Viresh,

Yes.

> > We check the assignment of policy->cur could be either from
> > cpufreq_driver->get_intermediate or from cpufreq_driver->get.
> 
> policy->cur is set only at two places, in your case:
> - CPUFREQ_POSTCHANGE
> - cpufreq_online()
> 
> From what I understand, it is possible that cpufreq_online() is
> setting your
> frequency to 499999 (once at boot), but as soon as a frequency change
> has
> happened after that, policy->cur should be set to 500 MHz and you
> should see
> this problem only once.
> 

Our observation tells us cpufreq_online is setting only once at boot
for one cpu cluster.
But we can see the problem repeatly occurs once cpufreq_get is invoked.

e.g.
[ 71.154560] cpufreq: Warning: CPU frequency out of sync: cpufreq and
timing core thinks of 500000, is 499999 kHz
[ 71.155880] cpufreq: notification 0 of frequency transition to 499999
kHz
[ 71.156777] cpufreq: notification 1 of frequency transition to 499999
kHz
[ 71.187241] cpufreq: target for CPU 0: 500000 kHz, relation 0,
requested 500000 kHz
[ 71.188246] cpufreq: target_freq/policy->cur: 500000/499999 kHz

> From CPUFREQ_POSTCHANGE notifier, we always set policy->cur from the
> table
> itself, which should be 500000 MHz.
> 

Our observation tells me it can be either 499999 kHz or 500000 kHz.
This can be printed at the last line of CPUFREQ_POSTCHANGE within
'cpufreq_notify_transition'

> I wonder how you see policy->cur to be 499999 here. Does this happen
> only once ?
> Or repeatedly ?
> 

It repeatly happens.

> > But it is strange to have the frequency value like 499999 kHz.
> > Is the result of tiny frequency difference expected from your point
> > of
> > view?
> 
> Clock driver can give this value, that is fine.
> 

Thanks for your answer.

> > > What do you mean by "voltage pulse" here? What actually happens
> > > which
> > > you want to avoid.
> > > 
> > 
> > When cpufreq is fixed to lowest opp, "voltage pulse" is a quick
> > voltage
> > rising and falling phenomenon which can be observed if
> > 'cpufreq_get' is
> > invoked.
> 
> Do check if the call is reaching your driver's ->target_index(), it
> should be
> which it should not, ideally.
> 

Yes, 'cpufreq_get' will eventually go to '->target_index()' because of
inequality between target_freq and policy->cur.

And we realized that the "voltage pulse" is generated by quick
switching voltage from 500 MHz to intermediate voltage and back to 500
MHz in current mediatek-cpufreq.c.
To fix it, we think two possible ways to approach.
One is from cpufreq framework side. Is it expected to update the
cpufreq platform driver repeatly for this case?
If it is expected, then from platform driver side, mediatek-cpufreq
should handle a condition to avoid unnecessary intermediate voltage
switching.

BRs,
Rex

> > Thank you for sharing the correct information.
> > Is it possible to get frequency (API) a simple way, like get
> > current
> > opp frequency?
> 
> Lets dig/debug a bit further and fix this if a real problem exists.
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
