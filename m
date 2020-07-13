Return-Path: <SRS0=TL3J=AY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C7E1C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 07:03:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8DD72075D
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 07:03:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2U91Sy9T";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tazfVTMo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8DD72075D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r3rxCH6fnwtcfbim5q4AhXwVvgD3U22s+lL58TMk1Kc=; b=2U91Sy9T4t6W8E28gn6s68jAj
	BelNVyHNfksTGwZShC4plkfF8LeGoYohcw4dUovUVpgR8X3RNU/selNydb6+c8x0ZMvkKtt95kqz3
	VkuttpDWZVr+SSdB5kOtg4YdWVOaj6OxbAK7i0sPkhqQ3/+IYdehum/CB5qUbvQ6FQS2gOTC1YRTN
	fAUpoJNW7ONmB9aEZ1rqnh76X/2a7R4uIVDZ7II85GLHWLFqKqhKa/DvdFA2utawEjBY2Ly9YAgm2
	oTmDFWglULplq2+t2d6w1+u6d9XROEsJpmhW2C+wrxsG+ccxWUNh3TrQxV/Xps4T5N+ABBcmWVY3e
	IDUh9VFFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jusUX-0001Au-1o; Mon, 13 Jul 2020 07:03:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jusUU-00019l-OO; Mon, 13 Jul 2020 07:03:07 +0000
X-UUID: 38c1948cd2f44691aa73d77a69321973-20200712
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=/O8b95ILqstFIgFUi/t1yv/IWDQZ/y0hmoi2/61jPNE=; 
 b=tazfVTMoxJwQJTvjOgvO4uioWpxAwnCQ5+ALKUiHFj9bdm24eHffVCv4l+TXQ3Np0xHiG7AtrkU/+HuK+ZkJU1ykYQpuwjZW63pEaUWG+L9yWoDANNDz0wn5YfHX0SPL4GEwL04W+4Vt/u5mNPWR2QNBdZ1HFyRSJcoDA6T3i+Y=;
X-UUID: 38c1948cd2f44691aa73d77a69321973-20200712
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1383150533; Sun, 12 Jul 2020 23:03:00 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 12 Jul 2020 23:52:57 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 13 Jul 2020 14:52:55 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 13 Jul 2020 14:52:54 +0800
Message-ID: <1594623128.16172.27.camel@mhfsdcap03>
Subject: Re: [PATCH 06/21] iommu/io-pgtable-arm-v7s: Use ias to check the
 valid iova in unmap
From: Yong Wu <yong.wu@mediatek.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Date: Mon, 13 Jul 2020 14:52:08 +0800
In-Reply-To: <CANMq1KAhFCWfywV=OiHgW00pof8K8TdwC6Hzgyj=QWSiWBf1ag@mail.gmail.com>
References: <20200711064846.16007-1-yong.wu@mediatek.com>
 <20200711064846.16007-7-yong.wu@mediatek.com>
 <CANMq1KAhFCWfywV=OiHgW00pof8K8TdwC6Hzgyj=QWSiWBf1ag@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: F3CF35EF42678060759801117619B4C940E2D810BF19205DF4368001F842ACB22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_030307_063966_01578F13 
X-CRM114-Status: GOOD (  18.87  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: youlin.pei@mediatek.com, Devicetree List <devicetree@vger.kernel.org>,
 cui.zhang@mediatek.com, srv_heupstream <srv_heupstream@mediatek.com>,
 chao.hao@mediatek.com, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, lkml <linux-kernel@vger.kernel.org>,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, ming-fan.chen@mediatek.com,
 anan.sun@mediatek.com, Will Deacon <will@kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-07-13 at 08:38 +0800, Nicolas Boichat wrote:
> On Sat, Jul 11, 2020 at 2:50 PM Yong Wu <yong.wu@mediatek.com> wrote:
> >
> > As title.
> >
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >  drivers/iommu/io-pgtable-arm-v7s.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
> > index 4272fe4e17f4..01f2a8876808 100644
> > --- a/drivers/iommu/io-pgtable-arm-v7s.c
> > +++ b/drivers/iommu/io-pgtable-arm-v7s.c
> > @@ -717,7 +717,7 @@ static size_t arm_v7s_unmap(struct io_pgtable_ops *ops, unsigned long iova,
> >  {
> >         struct arm_v7s_io_pgtable *data = io_pgtable_ops_to_data(ops);
> >
> > -       if (WARN_ON(upper_32_bits(iova)))
> > +       if (WARN_ON(iova >= (1ULL << data->iop.cfg.ias)))
> 
> This is a little odd as iova is unsigned long and 1ULL is unsigned long long.
> 
> Would it be better to keep the spirit of the previous test and do
> something like:
>  if (WARN_ON(iova >> data->iop.cfg.ias)) ?

Yes. Thanks. I will change it like this in next version.

Also change this in arm_v7s_map by the way.

> 
> >                 return 0;
> >
> >         return __arm_v7s_unmap(data, gather, iova, size, 1, data->pgd);
> > --
> > 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
