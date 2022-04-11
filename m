Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25987C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 11:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rGgCpw3yLbGR2PvjILSklqamm4/u6DH96UWhScUoC04=; b=tL2YW04xlsoEFy
	sjzv6dVTi+GZmxAzQf5gQQEJmzjwpfMuH5Fbpldz+EOOpZYtL9kwtFR3dpiKYJd7+294GJgLM1hdT
	KPXNx9V0JpnQLt4bqP5tcGGdfS6sUd9hiPF7IPO9+1D2jj7+NgiEVDwtDoaIe2nIzFvufOmUstrvQ
	h7/KfzB/lEh4MytknP4sMmW3h6nDF0fUqZDqaMV9Tq1t43G+E1BK9fkxjl263pHkzCQZt6pu9IG8b
	UmMdtj0fMtfsokEaEIOz3vnTVM/VeYuAN1CV3yI49wjpHT6s466H13H0s2RW667dCL0QBsXlcBrjI
	ePZmXm8sdfa2OQwn7JSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nds5u-008cug-Hz; Mon, 11 Apr 2022 11:20:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nds5L-008cZm-PK; Mon, 11 Apr 2022 11:19:57 +0000
X-UUID: 15046bf2216642b798aaa4457d52807d-20220411
X-UUID: 15046bf2216642b798aaa4457d52807d-20220411
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 23273460; Mon, 11 Apr 2022 04:19:49 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Apr 2022 04:18:26 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Apr 2022 19:18:25 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Apr 2022 19:18:25 +0800
Message-ID: <371c9a96e80faa26719e00b694e45d176105b6dc.camel@mediatek.com>
Subject: Re: [PATCH V2 08/15] cpufreq: mediatek: Move voltage limits to
 platform data
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <rafael@kernel.org>, <viresh.kumar@linaro.org>, <robh+dt@kernel.org>,
 <krzk+dt@kernel.org>
CC: <matthias.bgg@gmail.com>, <jia-wei.chang@mediatek.com>,
 <roger.lu@mediatek.com>, <hsinyi@google.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 11 Apr 2022 19:18:25 +0800
In-Reply-To: <3dade32c-4b46-351a-b3f9-d1fec16b603c@collabora.com>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-9-rex-bc.chen@mediatek.com>
 <3dade32c-4b46-351a-b3f9-d1fec16b603c@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_041955_851854_0A7BB0AD 
X-CRM114-Status: GOOD (  21.34  )
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

On Fri, 2022-04-08 at 15:36 +0200, AngeloGioacchino Del Regno wrote:
> Il 08/04/22 06:59, Rex-BC Chen ha scritto:
> > From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > 
> > Voltages and shifts are defined as macros originally.
> > There are different requirements of these values for each MediaTek
> > SoCs.
> > Therefore, we add the platform data and move these values into it.
> > 
> > Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >   drivers/cpufreq/mediatek-cpufreq.c | 90 ++++++++++++++++++++-----
> > -----
> >   1 file changed, 61 insertions(+), 29 deletions(-)
> > 
> > diff --git a/drivers/cpufreq/mediatek-cpufreq.c
> > b/drivers/cpufreq/mediatek-cpufreq.c
> > index 1369da62780a..0be5609ee82e 100644
> > --- a/drivers/cpufreq/mediatek-cpufreq.c
> > +++ b/drivers/cpufreq/mediatek-cpufreq.c
> 
> ..snip..
> 
> > @@ -625,20 +649,27 @@ static struct platform_driver
> > mtk_cpufreq_platdrv = {
> >   	.probe		= mtk_cpufreq_probe,
> >   };
> >   
> > +static const struct mtk_cpufreq_platform_data mtk_platform_data =
> > {
> 
> I would prefer if you name this after the oldest SoC that is
> supported in this
> driver, or after the IP version.
> 
> Example: if the oldest one is mt7622, then this should be
> mt7622_platform_data;
>           if newer SoCs have got a different cpu frequency control
> IP, then we
>           should have here something like
>           mtk_v1_platform_data, mtk_v1_3_platform_data.
> 
> Please note that I didn't check release dates, so my reference to
> mt7622 is
> purely casual.
> 
> Regards,
> Angelo

Hello Angelo,

Thanks for your review.
I will rename it as mt2701_platform_data.

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
