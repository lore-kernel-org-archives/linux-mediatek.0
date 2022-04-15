Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C514C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 06:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8lSVe4k1WWsRLegJqEd/RzHc6o50IKSu/Ro3CKm8X/Y=; b=bLWtI/Y40+oWqe
	E3rZLq9tJbAxqFHPZFlb+OrkmpkDR+KurBda/0PzdDkJrtAkdvKN3ut+flmuD9ZmY8lk2ojeoA5IQ
	xsg9Gmgi6MO3rrbD1wp+sxBcQky0PFF8v+VzSyZCTant2ayOHCyV0yDrkFPKIGqcH0OTXhNv69R2U
	+GtAHQSq4ZbnVqUI9Tu0xy+8EP0bxb6HHgnfWvfsxlSZTU5qrrno05L/73rY/KSrW8r5OZIcWOBJd
	EG6G1/DplV6H1FKDHPvJNulRDTDe+y8jO6L5uV6iyTW1/KpiI4TM9iCKJlDNnxpCSmtzdPa42GxjR
	xPvNbpkmLvQkgybd9yYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfFcK-0093Tc-81; Fri, 15 Apr 2022 06:39:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfFSD-008zmQ-Cc; Fri, 15 Apr 2022 06:29:14 +0000
X-UUID: 2d63f354419c489dae72e7bde71a808f-20220414
X-UUID: 2d63f354419c489dae72e7bde71a808f-20220414
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1035414394; Thu, 14 Apr 2022 23:29:07 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 Apr 2022 23:29:05 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 15 Apr 2022 14:29:03 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 15 Apr 2022 14:29:03 +0800
Message-ID: <e1be95ddcdd01cf859e4d18bea95f8f55cd9ed1d.camel@mediatek.com>
Subject: Re: [PATCH V3 10/15] cpufreq: mediatek: Add counter to prevent
 infinite loop when tracking voltage
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Hsin-Yi Wang <hsinyi@google.com>
CC: <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, <krzk+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tim Chang <jia-wei.chang@mediatek.com>,
 <roger.lu@mediatek.com>, Kevin Hilman <khilman@baylibre.com>,
 <angelogioacchino.delregno@collabora.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 15 Apr 2022 14:29:03 +0800
In-Reply-To: <CACb=7PXykpUgZ+QG93Bd-vWstq2V-k6G0zTg+D1q2WchJHPbig@mail.gmail.com>
References: <20220415055916.28350-1-rex-bc.chen@mediatek.com>
 <20220415055916.28350-11-rex-bc.chen@mediatek.com>
 <CACb=7PXykpUgZ+QG93Bd-vWstq2V-k6G0zTg+D1q2WchJHPbig@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_232913_480585_7962427E 
X-CRM114-Status: GOOD (  23.71  )
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

On Fri, 2022-04-15 at 14:14 +0800, Hsin-Yi Wang wrote:
> On Fri, Apr 15, 2022 at 1:59 PM Rex-BC Chen <rex-bc.chen@mediatek.com
> > wrote:
> > 
> > To prevent infinite loop when tracking voltage, we calculate the
> > maximum
> > value for each platform data.
> > We assume min voltage is 0 and tracking target voltage using
> > min_volt_shift for each iteration.
> > The retry_max is 3 times of expeted iteration count.
> > 
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >  drivers/cpufreq/mediatek-cpufreq.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> > 
> > diff --git a/drivers/cpufreq/mediatek-cpufreq.c
> > b/drivers/cpufreq/mediatek-cpufreq.c
> > index cc44a7a9427a..d4c00237e862 100644
> > --- a/drivers/cpufreq/mediatek-cpufreq.c
> > +++ b/drivers/cpufreq/mediatek-cpufreq.c
> > @@ -86,6 +86,16 @@ static int mtk_cpufreq_voltage_tracking(struct
> > mtk_cpu_dvfs_info *info,
> >         struct regulator *proc_reg = info->proc_reg;
> >         struct regulator *sram_reg = info->sram_reg;
> >         int pre_vproc, pre_vsram, new_vsram, vsram, vproc, ret;
> > +       int retry_max;
> > +
> > +       /*
> > +        * We assume min voltage is 0 and tracking target voltage
> > using
> > +        * min_volt_shift for each iteration.
> > +        * The retry_max is 3 times of expeted iteration count.
> > +        */
> > +       retry_max = 3 * DIV_ROUND_UP(max(info->soc_data-
> > >sram_max_volt,
> > +                                        info->soc_data-
> > >proc_max_volt),
> > +                                    info->soc_data-
> > >min_volt_shift);
> 
> mtk_cpufreq_voltage_tracking() will be called very frequently.
> retry_max is the same every time mtk_cpufreq_voltage_tracking() is
> called. Is it better to calculate before and store in
> mtk_cpu_dvfs_info?
> 

Hello Hsin-Yi,

Thanks for your reviwew.
I will do this in next version.

BRs,
Rex

> > 
> >         pre_vproc = regulator_get_voltage(proc_reg);
> >         if (pre_vproc < 0) {
> > @@ -151,6 +161,12 @@ static int mtk_cpufreq_voltage_tracking(struct
> > mtk_cpu_dvfs_info *info,
> > 
> >                 pre_vproc = vproc;
> >                 pre_vsram = vsram;
> > +
> > +               if (--retry_max < 0) {
> > +                       dev_err(info->cpu_dev,
> > +                               "over loop count, failed to set
> > voltage\n");
> > +                       return -EINVAL;
> > +               }
> >         } while (vproc != new_vproc || vsram != new_vsram);
> > 
> >         return 0;
> > --
> > 2.18.0
> > 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
