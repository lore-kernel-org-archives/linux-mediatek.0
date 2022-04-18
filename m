Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E0DC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Apr 2022 01:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iokdpgraFrpn5Nj8REh0d1TMilSqlCx8ydt/3tyRa30=; b=HuZJy2r7zV9/bG
	oc2Hl1Suc2ooSNEEamYacE2RKNO42keL6Oog1GqoTLQMYSSU9xNXel9WZ4xTjzFeWwKbIlk3sU7dI
	SgEEYwAi2oeGs7fyrmh+ng+pERG0zyRkIQxBlRFi3VTOcFEuzToWPJiCYFZGq/N6/nexN8veWzxib
	x3u607obomVDlwnso7yigym6gex1E26+I0DAEFMwaxSSnZhixbmlQ54awvfbA1oQPCuF+fzibugzP
	BPr5EINDPA2WD4g6qGyns6lmcCnXAaWyJ/IGCmg0a2hRcGvPuUkeWCaIbxURUtuisnpAHCmlDScFh
	oycudwIashdMvUg1CPQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngGXy-00FHCw-L7; Mon, 18 Apr 2022 01:51:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngGXe-00FH84-La; Mon, 18 Apr 2022 01:51:04 +0000
X-UUID: c4f5cbba95a646688b8439c273a06f2e-20220417
X-UUID: c4f5cbba95a646688b8439c273a06f2e-20220417
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 244658406; Sun, 17 Apr 2022 18:50:58 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 17 Apr 2022 18:40:56 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 18 Apr 2022 09:40:52 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 18 Apr 2022 09:40:51 +0800
Message-ID: <8eee483694bf93197b441eb7deab31c95f68288c.camel@mediatek.com>
Subject: Re: [PATCH V3 10/15] cpufreq: mediatek: Add counter to prevent
 infinite loop when tracking voltage
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hsin-Yi Wang <hsinyi@google.com>
CC: <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, <krzk+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tim Chang <jia-wei.chang@mediatek.com>,
 <roger.lu@mediatek.com>, Kevin Hilman <khilman@baylibre.com>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 18 Apr 2022 09:40:51 +0800
In-Reply-To: <cfde61f1-5581-23b8-bd5b-f2a1875ec4ae@collabora.com>
References: <20220415055916.28350-1-rex-bc.chen@mediatek.com>
 <20220415055916.28350-11-rex-bc.chen@mediatek.com>
 <CACb=7PXykpUgZ+QG93Bd-vWstq2V-k6G0zTg+D1q2WchJHPbig@mail.gmail.com>
 <cfde61f1-5581-23b8-bd5b-f2a1875ec4ae@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220417_185102_740197_1F0F8640 
X-CRM114-Status: GOOD (  28.17  )
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

On Fri, 2022-04-15 at 14:24 +0200, AngeloGioacchino Del Regno wrote:
> Il 15/04/22 08:14, Hsin-Yi Wang ha scritto:
> > On Fri, Apr 15, 2022 at 1:59 PM Rex-BC Chen <
> > rex-bc.chen@mediatek.com> wrote:
> > > 
> > > To prevent infinite loop when tracking voltage, we calculate the
> > > maximum
> > > value for each platform data.
> > > We assume min voltage is 0 and tracking target voltage using
> > > min_volt_shift for each iteration.
> > > The retry_max is 3 times of expeted iteration count.
> > > 
> > > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> 
> I'm sorry Rex, but this commit has to be squashed with 09/15, as the
> logic is
> that each commit has to be acceptable, and 09/15 is not, without this
> fix.
> 
> Besides, as Hsin-Yi suggested, calculating this every time may hit
> performance,
> but at the same time I don't want to lose this explicit
> calculation...
> 

Hello Angelo,

I will squash thius patch into 9/15 and will use info->vtrack_max to
record the value in probe function.

Thanks!

BRs,
Rex

> > > ---
> > >   drivers/cpufreq/mediatek-cpufreq.c | 16 ++++++++++++++++
> > >   1 file changed, 16 insertions(+)
> > > 
> > > diff --git a/drivers/cpufreq/mediatek-cpufreq.c
> > > b/drivers/cpufreq/mediatek-cpufreq.c
> > > index cc44a7a9427a..d4c00237e862 100644
> > > --- a/drivers/cpufreq/mediatek-cpufreq.c
> > > +++ b/drivers/cpufreq/mediatek-cpufreq.c
> > > @@ -86,6 +86,16 @@ static int mtk_cpufreq_voltage_tracking(struct
> > > mtk_cpu_dvfs_info *info,
> > >          struct regulator *proc_reg = info->proc_reg;
> > >          struct regulator *sram_reg = info->sram_reg;
> > >          int pre_vproc, pre_vsram, new_vsram, vsram, vproc, ret;
> > > +       int retry_max;
> > > +
> > > +       /*
> > > +        * We assume min voltage is 0 and tracking target voltage
> > > using
> > > +        * min_volt_shift for each iteration.
> > > +        * The retry_max is 3 times of expeted iteration count.
> > > +        */
> > > +       retry_max = 3 * DIV_ROUND_UP(max(info->soc_data-
> > > >sram_max_volt,
> > > +                                        info->soc_data-
> > > >proc_max_volt),
> > > +                                    info->soc_data-
> > > >min_volt_shift);
> > 
> > mtk_cpufreq_voltage_tracking() will be called very frequently.
> > retry_max is the same every time mtk_cpufreq_voltage_tracking() is
> > called. Is it better to calculate before and store in
> > mtk_cpu_dvfs_info?
> > 
> 
> ...so I agree with this solution: perhaps you can add a "vtrack_max"
> variable to
> mtk_cpu_dvfs_info as suggested, and fill in that one in function
> mtk_cpu_dvfs_info_init(), where we effectively initialize all-the-
> things.
> 
> Cheers,
> Angelo


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
