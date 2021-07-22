Return-Path: <SRS0=Khw4=MO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAA50C6377D
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 06:38:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2BCC61279
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 06:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2BCC61279
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/7Ux0o/+zUKH0u70Wm3PrfQNttq7xDDCPpC5SYqXheg=; b=klGJ4JGG5uVCOa
	t2koTyofzARNKzzlkfEVNgePq0d9U34/TiO90DjB4QPkVSmioZPgPCWNY5g4pkNcqSjQ7YP9ACZuk
	tQkdtpwtbkTD1CtJgwk27M6/hAgZY806ml3KKqk1j7ARi6ksuph8EOKtfwAW4zKYTmegR/bXIJ1gu
	Vn74+XsspZvSG0DVJE8199b25ncmhbAFOr3Lfd25L0BlMX8AAuCb5FmnvaQncKtasRr2WeRepXTLd
	8LtojGtbjL52MLoFsnocMNRemwNe9FeYwdkNW36w2yuqbMqYWihA9iqCWQmGYSr0+pTfXfFlzv3YU
	GWb8a6AtdwJetz1Qhkeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6SLn-000Pit-Nd; Thu, 22 Jul 2021 06:38:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6SLi-000Pga-Uy; Thu, 22 Jul 2021 06:38:29 +0000
X-UUID: 79d036bbabd849378cd73901db3c4ade-20210721
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=oaxYxn3IILWuJbREf8SCmDPb7cFpjJSu+Lb7BiUbx7g=; 
 b=XysRMbWJ8wjQ0Y3UXTNNFa/3mPg/H/hhOL1RrKpA3cZspA0ZB1jUfflXXqC2ToTCCZBkCoqqieXJFH7o0jkRBYdv14RQpeYSXiknWg1xTAHWWgwESewWoIVZKBADmI8S2Z4jUgVgsOpEeO9rW81EdFw5UbdE0AXRHYcEE37HDnY=;
X-UUID: 79d036bbabd849378cd73901db3c4ade-20210721
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1917419345; Wed, 21 Jul 2021 23:38:24 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 21 Jul 2021 23:38:22 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 22 Jul 2021 14:38:15 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 22 Jul 2021 14:38:14 +0800
Message-ID: <1626935894.27875.6.camel@mhfsdcap03>
Subject: Re: [PATCH v2 07/11] memory: mtk-smi: Add smi sub common support
From: Yong Wu <yong.wu@mediatek.com>
To: Ikjoon Jang <ikjn@chromium.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>, Will Deacon
 <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Tomasz Figa
 <tfiga@chromium.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, srv_heupstream
 <srv_heupstream@mediatek.com>, open list <linux-kernel@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 <youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
 <ming-fan.chen@mediatek.com>, <yi.kuo@mediatek.com>,
 <anthony.huang@mediatek.com>
Date: Thu, 22 Jul 2021 14:38:14 +0800
In-Reply-To: <CAATdQgBDsPHcuPYd=a+fjjTuqwXdJ-1GuSkj47cH1Ju5geqSLg@mail.gmail.com>
References: <20210715121209.31024-1-yong.wu@mediatek.com>
 <20210715121209.31024-8-yong.wu@mediatek.com>
 <CAATdQgBDsPHcuPYd=a+fjjTuqwXdJ-1GuSkj47cH1Ju5geqSLg@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8C9462D89BEED59F465508FE8E285B0DAFEB43CE951A7B5CDA310B4B06BC23302000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_233827_049056_ECCE341A 
X-CRM114-Status: GOOD (  23.40  )
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

Hi Ikjoon,

Thanks very much for your help reviewing..

On Wed, 2021-07-21 at 19:43 +0800, Ikjoon Jang wrote:
> On Thu, Jul 15, 2021 at 8:25 PM Yong Wu <yong.wu@mediatek.com> wrote:
> >
> > In mt8195, there are some larbs connect with the smi-sub-common, then
> > connect with smi-common.
> 
> Not critical but I suggest to describe what is smi-sub-common.
> e.g. "some larbs are not directly connected to smi-common,
> they are connected to smi-sub-common which is a bridge(?) interface to..."

OK. I will add some brief description about this sub-common in next
version.

> 
> >
> > Before we create device link between smi-larb with smi-common. If we have
> > sub-common, we should use device link the smi-larb and smi-sub-common,
> > then use device link between the smi-sub-common with smi-common. This is
> > for enabling clock/power automatically.
> >
> > Move the device link code to a new interface for reusing.
> >
> > There is no SW extra setting for smi-sub-common.
> >
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> 
> Reviewed-by: Ikjoon Jang <ikjn@chromium.org>

Thanks.

> 
> > ---
> >  drivers/memory/mtk-smi.c | 75 +++++++++++++++++++++++++++-------------
> >  1 file changed, 51 insertions(+), 24 deletions(-)
> >
> > diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> > index e68cbb51dd12..ee49bb50f5f5 100644
> > --- a/drivers/memory/mtk-smi.c
> > +++ b/drivers/memory/mtk-smi.c
> > @@ -60,7 +60,8 @@

[snip..]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
