Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166B2C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 09:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BVzyvotgAq4tXbWCQw0E0sDnbB5X+7wVkQ8cOCe/go4=; b=aCMsL+rc2Dt19u
	n/WjAN2/0cWoaigPoZY/M97mFYMdSlYb6O74p1Za1UjoPJeTIPJHUyIypGB6hTnUlDkNiwe4l3kzA
	RDlgfWIZTgETbBhdaDP4OBjMAbJ8ZVYjx/YviINs8Htptx/VTrPDG3nQHC2EROY3XslpKMNgtx9Ks
	HYV1yXYRI7vDLUP5LRNAX5BHNbYjlkNZCRlZ0y5DJCpjJU2FDgk3zDonnZZXGkaPceG2RWxAiqD4b
	9tljXqAEgfDsUwjhC3dJ9EZ3+tlqitDuB6HXi+SFBayt2TyTvOeDTpTgGCU8Pd/UoSqXhHW6r1ycH
	XMT5noG/4BBrDd+j0P2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nivFI-008xk9-IL; Mon, 25 Apr 2022 09:43:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nivFD-008xin-Fm; Mon, 25 Apr 2022 09:43:02 +0000
X-UUID: 73729233db9a4c27a9750582d01273df-20220425
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:8c77d986-e11e-433b-8e7e-cfb5a8ccd157, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:acfd04f0-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 73729233db9a4c27a9750582d01273df-20220425
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1957580758; Mon, 25 Apr 2022 02:42:51 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 25 Apr 2022 02:34:57 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 25 Apr 2022 17:34:50 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 25 Apr 2022 17:34:49 +0800
Message-ID: <64c690e8edf493ec0a4a14e0fdaad2d8e88e6da7.camel@mediatek.com>
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
Date: Mon, 25 Apr 2022 17:34:49 +0800
In-Reply-To: <20220425053548.72w2jh2g6lpzgz6g@vireshk-i7>
References: <20220422075239.16437-1-rex-bc.chen@mediatek.com>
 <20220422075239.16437-8-rex-bc.chen@mediatek.com>
 <20220425053548.72w2jh2g6lpzgz6g@vireshk-i7>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_024259_558752_26613A0C 
X-CRM114-Status: GOOD (  23.11  )
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

On Mon, 2022-04-25 at 11:05 +0530, Viresh Kumar wrote:
> On 22-04-22, 15:52, Rex-BC Chen wrote:
> > From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > 
> > We want to get opp frequency via opp table. Therefore, we add the
> > function
> > "mtk_cpufreq_get()" to do this.
> > 
> > Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >  drivers/cpufreq/mediatek-cpufreq.c | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/cpufreq/mediatek-cpufreq.c
> > b/drivers/cpufreq/mediatek-cpufreq.c
> > index e070a2619bcb..0b2ca0c8eddc 100644
> > --- a/drivers/cpufreq/mediatek-cpufreq.c
> > +++ b/drivers/cpufreq/mediatek-cpufreq.c
> > @@ -71,6 +71,15 @@ static struct mtk_cpu_dvfs_info
> > *mtk_cpu_dvfs_info_lookup(int cpu)
> >  	return NULL;
> >  }
> >  
> > +static unsigned int mtk_cpufreq_get(unsigned int cpu)
> > +{
> > +	struct mtk_cpu_dvfs_info *info;
> > +
> > +	info = mtk_cpu_dvfs_info_lookup(cpu);
> > +
> > +	return !info ? 0 : (info->opp_freq / 1000);
> > +}
> > +
> >  static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info
> > *info,
> >  					int new_vproc)
> >  {
> > @@ -588,7 +597,7 @@ static struct cpufreq_driver mtk_cpufreq_driver
> > = {
> >  		 CPUFREQ_IS_COOLING_DEV,
> >  	.verify = cpufreq_generic_frequency_table_verify,
> >  	.target_index = mtk_cpufreq_set_target,
> > -	.get = cpufreq_generic_get,
> > +	.get = mtk_cpufreq_get,
> 
> The .get callback should read the real frequency from hardware
> instead of
> fetching a cached freq value.
> 

Hello Viresh,

We found that the pulses of cpu voltage could be observed when
frequency is fixed (scaling_max_freq == scaling_min_freq) if using
cpufreq_generic_get as '.get' callback in MT8186.
cpufreq framework will constantly (~ 1 sec) call 'update' if the policy
frequency is NOT equal to hardware frequency in
cpufreq_verify_current_freq.
The problem is that there might be a tiny difference between the policy
frequency and the hardware frequency even they are very close.
e.g. policy frequency is 500,000,000 Hz however, hardware frequency is
499,999,726 Hz for MT8186 opp15.

To prevent the voltage pulses, we currently use the software cached
values as you pointed out.
I wonder is it possible to add a tolerence for checking difference
between policy frequency and hardware frequency in cpufreq framework so
that we can use cpufreq_generic_get as callback without pulse issue.
Or any suggestion would be appreciated.

Thanks.

BRs,
Rex
> >  	.init = mtk_cpufreq_init,
> >  	.exit = mtk_cpufreq_exit,
> >  	.register_em = cpufreq_register_em_with_opp,
> > -- 
> > 2.18.0
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
