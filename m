Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F18DC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Mar 2022 09:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k7vYModPUCj29XlSmeh5cLvqlCd4wtE3un1klKKMjQg=; b=wc0AmM0Trxf9N7
	Jz+RwbSFVpRcsrOkQckr2xu52ChAKi4dvH4kWY/d5KDy8wqNxSyB0iLgItAdioJiAgJa5T2VRvL9v
	GJbGYvLvgbT6CKjxx5XzBcvQnoy8yXx+nL+bx4/fw2DZG2zZiGUfRW/heqysnhSpuH1HW3Emtpmz0
	CPQYQFNe/d0uvf2jQYz+uz4GaNZHw5ExMGzWXzLjrLzazc7ApQ8HCAe2ZRHE3Hml2LLTXFiFJC2+o
	Gv0ah9uaPOwBKw09ffl1F5O8N+Sgy+Uj28KAoAwLEWwNrN1cXHrAdegzMwI44BAQiKmY7HBxQ0GCk
	tpEXzg714o9m2NO0xgJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXfpg-001TUX-Jz; Fri, 25 Mar 2022 09:02:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXfpb-001TT3-AB; Fri, 25 Mar 2022 09:02:06 +0000
X-UUID: 707db267aec249969ab97cd6ae3b03a8-20220325
X-UUID: 707db267aec249969ab97cd6ae3b03a8-20220325
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 243992638; Fri, 25 Mar 2022 02:01:59 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Mar 2022 02:01:57 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 25 Mar 2022 17:01:56 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Mar 2022 17:01:56 +0800
Message-ID: <7bfdedeaf515405e92fcfaf1080eea7fb104b9a1.camel@mediatek.com>
Subject: Re: [PATCH] remoteproc: mediatek: enable cache for mt8186 SCP
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Tinghan Shen <tinghan.shen@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-remoteproc@vger.kernel.org>
Date: Fri, 25 Mar 2022 17:01:56 +0800
In-Reply-To: <20220324155628.GC3514576@p14s>
References: <20220322122845.4068-1-allen-kh.cheng@mediatek.com>
 <20220324155628.GC3514576@p14s>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_020203_390457_EAF3AAC0 
X-CRM114-Status: GOOD (  29.32  )
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

Hi Mathieu,

On Thu, 2022-03-24 at 09:56 -0600, Mathieu Poirier wrote:
> Hi Allen,
> 
> On Tue, Mar 22, 2022 at 08:28:45PM +0800, Allen-KH Cheng wrote:
> > 1. Set SCP cache size before loading SCP FW. (8KB+8KB)
> > 2. Adjust ipi_buf_offset from 0x7bdb0 to 0x3BDB0 for enableing
> > cache
> > 
> > SCP side
> >  - IPI Buffer: 0x3BDB0 <-> 0x3C000
> >  - Cache: 0x3C000 <-> 0x40000
> > 
> 
> I would also like to find in this changelog "why" this patch is
> needed and more
> importantly, how it remains compatible with existing
> implementation.  I am
> mostly worried about implemenations where the application processor
> is using
> caches while the SCP is not.
> 
> I will also need a couple of "Tested-by" tags before moving forward
> with this
> patch.
> 
> Thanks,
> Mathieu
> 

Sorry for the confusion.

This patch is for enableing cache in SCP.

In mt8186 SCP, we don't have enough SRAM so SCP will use DRAM as
execution space. 

The DRAM power and latency is much larger than SRAM, so cache is used
to slight these affects.

The cache support is designed in SCP bus Architecture.

We reserve 0x3C000 <-> 0x40000 in SRAM(SCP) to support cache and set
I-cache and D-cache size before loading SCP FW.

If there isn't no this patch, SCP is still working and would not
support cache when using DRAM.

This patch will not affect implemenations where the application
processor is using caches.

I will add more information in commit message for this PATCH
and Tested-by tags in next version.

Thanks,
Allen

> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > ---
> >  drivers/remoteproc/mtk_scp.c | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/remoteproc/mtk_scp.c
> > b/drivers/remoteproc/mtk_scp.c
> > index 38609153bf64..24065b6b4da8 100644
> > --- a/drivers/remoteproc/mtk_scp.c
> > +++ b/drivers/remoteproc/mtk_scp.c
> > @@ -401,6 +401,14 @@ static int mt8186_scp_before_load(struct
> > mtk_scp *scp)
> >  	writel(0x0, scp->reg_base + MT8186_SCP_L1_SRAM_PD_P1);
> >  	writel(0x0, scp->reg_base + MT8186_SCP_L1_SRAM_PD_p2);
> >  
> > +	/*
> > +	 * Set I-cache and D-cache size before loading SCP FW.
> > +	 * SCP SRAM logical address may change when cache size setting
> > differs.
> > +	 */
> > +	writel(MT8183_SCP_CACHE_CON_WAYEN | MT8183_SCP_CACHESIZE_8KB,
> > +	       scp->reg_base + MT8183_SCP_CACHE_CON);
> > +	writel(MT8183_SCP_CACHESIZE_8KB, scp->reg_base +
> > MT8183_SCP_DCACHE_CON);
> > +
> >  	return 0;
> >  }
> >  
> > @@ -905,7 +913,7 @@ static const struct mtk_scp_of_data
> > mt8186_of_data = {
> >  	.scp_da_to_va = mt8183_scp_da_to_va,
> >  	.host_to_scp_reg = MT8183_HOST_TO_SCP,
> >  	.host_to_scp_int_bit = MT8183_HOST_IPC_INT_BIT,
> > -	.ipi_buf_offset = 0x7bdb0,
> > +	.ipi_buf_offset = 0x3bdb0,
> >  };
> >  
> >  static const struct mtk_scp_of_data mt8192_of_data = {
> > -- 
> > 2.18.0
> > 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
