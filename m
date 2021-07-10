Return-Path: <SRS0=Fd5v=MC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B705EC07E95
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Jul 2021 07:08:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AB60613C3
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Jul 2021 07:08:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AB60613C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YBexxkfMnVUPkaa1kAAdJO1N8ScJ7fdSHvKGHtmPCxE=; b=BQdVK5gjT30fpv
	eHr6mwTUR9WopAgIU05253vB10QzrKo6jiyvIC9MmgkJ4k7nx7dzJwJQqKNwiXVOBvashD0FTtbQr
	jhQdPzYXNkp0TdyynawktbOpuUgTcEV7cPMv0U/d+VUTYZanF8JBN6vSFfPUCrAAL1ladtuZB7lqe
	mwxBhMiSy6oVxFz+czJc3se4P4RgKmOg8oi8ZIo4nJKXlYzYyDc2PqK1f9ObkYXIAnBr+NEgaqFos
	Y3pcftxmRMO5OcVQT8EcpkoAtX/I61jNCi7c7beDChQ4lKAHf0fRx/kaFdYEWk33JQhEYUpN4BjLF
	V+hV90w79qCaPcogOnog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m275k-003C89-7P; Sat, 10 Jul 2021 07:08:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m275Y-003C6Y-94; Sat, 10 Jul 2021 07:07:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=8dsRT+CtBAF8IManycrdROXqXDtH6eBTTgK4DAfMq2Y=; b=Wf8Kf7S137AvV08JU7y3Pwf9xU
 u1n+sQzlfoNAgKcb1I0RkyNaVMS5cY2SDHjGrMQpyh41qyYDl28H40oNHtC2JPoaPjYJpQfHY+avt
 G1YOcgNc4qMLzZsKv2w1tEZ9Wdb/HQJzfFjbMzskr25wtLky2iTFREraiJhe3AdcuQWT+hJmqd8dC
 NOa0Poxf3w5xItVPajr0f4r199vL7egPntvFp2Veb2HQtaxHjUsLnwwv61C2u9KNu0wEWH7e11T7O
 mJwtuibjajYRQ7cL/mXU+pv4YZYfXbjzbhPGQF4o3Q37x2yljbJOQ8jMp9RNVLHl1aypm4LVydOHm
 eBCW5rWA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m275T-00GJ77-Dx; Sat, 10 Jul 2021 07:07:46 +0000
X-UUID: 14827621e32242ad8675d5525a26b553-20210710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=8dsRT+CtBAF8IManycrdROXqXDtH6eBTTgK4DAfMq2Y=; 
 b=Mij4zjC13V0npJDdhfDnBcfDiVFuCu50V0/pSXgySSuOdG7F5NHDGdeVyFYmpnVHU9QvtAHXeSy1u4G4JUAvmUUscF3SlbQk3A5iopu+B6p1X143DajuH27lFSvyDYsTZX7LGyXoaMh7NqpbW0+oMhJnnBCjD/1Z8GtDC0wRxJU=;
X-UUID: 14827621e32242ad8675d5525a26b553-20210710
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 91244643; Sat, 10 Jul 2021 00:06:35 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Jul 2021 00:06:34 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Jul 2021 15:06:32 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 10 Jul 2021 15:06:32 +0800
Message-ID: <5d3266c07bcde1b32d21d69445696126e7476b9d.camel@mediatek.com>
Subject: Re: [PATCH v1 08/17] drm/mediatek: Add component_del in OVL remove
 function
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
CC: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fshao@google.com>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>
Date: Sat, 10 Jul 2021 15:06:32 +0800
In-Reply-To: <1625634728.7824.17.camel@mtksdaap41>
References: <20210707041249.29816-1-jason-jh.lin@mediatek.com>
 <20210707041249.29816-9-jason-jh.lin@mediatek.com>
 <1625634728.7824.17.camel@mtksdaap41>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210710_080744_017698_8E07E42C 
X-CRM114-Status: GOOD (  21.40  )
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

On Wed, 2021-07-07 at 13:12 +0800, CK Hu wrote:
> Hi, Jason:
> 
> On Wed, 2021-07-07 at 12:12 +0800, jason-jh.lin wrote:
> > Add component_del in OVL remove function.
> > 
> > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > index 99c39487026d..7504e86b167a 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > @@ -158,7 +158,6 @@ void mtk_ovl_stop(struct device *dev)
> >  		reg = reg & ~OVL_LAYER_SMI_ID_EN;
> >  		writel_relaxed(reg, ovl->regs +
> > DISP_REG_OVL_DATAPATH_CON);
> >  	}
> > -
> 
> This modification is not related to this patch, so move out of this
> patch.
> 
Hi CK,

OK, I'll remove this patch at the next version.

Regard,
Jason-JH.Lin
> >  }
> >  
> >  void mtk_ovl_config(struct device *dev, unsigned int w,
> > @@ -424,6 +423,8 @@ static int mtk_disp_ovl_probe(struct
> > platform_device *pdev)
> >  
> >  static int mtk_disp_ovl_remove(struct platform_device *pdev)
> >  {
> > +	component_del(&pdev->dev, &mtk_disp_ovl_component_ops);
> > +
> 
> This is a fix-up of patch [1]. Change this patch to fix all sub
> drivers,
> add Fixes tag, and move this patch out of this series. (This fix-up
> is
> not related to mt8195, so send this patch independently).
> 
> [1]
> 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.13&id=ff1395609e20c1cd98b3ec65d16dc18f0471dca3
> 
> Regards,
> CK
> 
> >  	return 0;
> >  }
> >  
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
