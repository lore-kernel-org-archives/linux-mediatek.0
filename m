Return-Path: <SRS0=cnxW=N4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B124C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 02:18:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3918C60F46
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 02:18:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3918C60F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xECxWjgVc7hzFif07Xu5Kwf/ObTLPmOaByA7c5BEkeA=; b=bEPQrXp6hxbTVu
	iYmNNxzyAOQ7YQwEGKvECwQ+aFjzyc4NBwdxOj6siZPvz+ORgvQusJMg9GC6eMq2YB55QnNYWr76a
	h+aCZNs4KFxMimxL/1LyQWJoM9khHDgkg6c6Gu9OecckKodrKwIDVewK3RAhOo0J+215Bbyb+8qN1
	kToZO4U+i+vb3kdFEYaavpEzK6HvCC2/ltrVC5dg4Hi0UoZfutKShn1gCDZk7i60y8oEeiex7UGco
	UqW+FmFVqZIAA0UaLmRtyl+AubTy+sWr0/AgQY8KSm30P82nvl3TA3FYSrmJlmIDDvreM/quAg6dD
	k6bOrmK9i6xMLqI1JuWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mN4Ck-00H5a9-OY; Mon, 06 Sep 2021 02:17:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mN4Ci-00H5Zd-9q; Mon, 06 Sep 2021 02:17:49 +0000
X-UUID: 95b41e13e3674fe1b118d11ab18e0892-20210905
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=EXtYZoiDY1Hx81k3liJRQ0KMhRI64hwhmPGJueRfHcs=; 
 b=VcN4P1gTbBC/RNwT9lf6ARN2+DfAoUR3nUNP682rDOsv5GWAm/G1C0PJzP/QSuDCh9xebCxSnfOMm/GnkS8J7iYlTaCFEQGKwZ/LE7s8bkwmMCHhZUhvfZgoQ1G5mXStwrxj9RbtN5fd0diiJQVaD8pbAACUkY5dGWA4z39IOKY=;
X-UUID: 95b41e13e3674fe1b118d11ab18e0892-20210905
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1801341302; Sun, 05 Sep 2021 19:17:45 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 5 Sep 2021 19:07:43 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Sep 2021 10:07:41 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 6 Sep 2021 10:07:41 +0800
Message-ID: <91ef79906f328833a3b08de5af54b32df247edb4.camel@mediatek.com>
Subject: Re: [PATCH v4 10/17] soc: mediatek: mmsys: Add reset controller
 support for MT8195 vdosys1
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>, "Enric
 Balletbo i Serra" <enric.balletbo@collabora.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, "jason-jh . lin"
 <jason-jh.lin@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <singo.chang@mediatek.com>,
 <srv_heupstream@mediatek.com>
Date: Mon, 6 Sep 2021 10:07:41 +0800
In-Reply-To: <0cdce7a43a0b74fabc110730d2b2ec9dce5cbbff.camel@pengutronix.de>
References: <20210825100531.5653-1-nancy.lin@mediatek.com>
 <20210825100531.5653-11-nancy.lin@mediatek.com>
 <0cdce7a43a0b74fabc110730d2b2ec9dce5cbbff.camel@pengutronix.de>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210905_191748_375158_CFC868F3 
X-CRM114-Status: GOOD (  14.69  )
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

Hi Philipp,

Thanks for the review.
I will base on Enric's patchset in my next revision.

Regards,
Nancy

On Wed, 2021-08-25 at 12:46 +0200, Philipp Zabel wrote:
> Hi,
> 
> On Wed, 2021-08-25 at 18:05 +0800, Nancy.Lin wrote:
> > Among other features the mmsys driver should implement a reset
> > controller to be able to reset different bits from their space.
> > 
> > For MT8195 vdosys1, many async modules need to reset after
> > the display pipe stops and restart.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > ---
> >  drivers/soc/mediatek/mt8195-mmsys.h |  1 +
> >  drivers/soc/mediatek/mtk-mmsys.c    | 76
> > +++++++++++++++++++++++++++++
> 
> Cc: Enric - this patch clashes with [1], please coordinate.
> 
> [1] 
> https://urldefense.com/v3/__https://lore.kernel.org/linux-arm-kernel/20210825122613.v3.6.I15e2419141a69b2e5c7e700c34d92a69df47e04d@changeid/__;!!CTRNKA9wMg0ARbw!yhYDk3anhefxrYOCQBcUgiosJbqdIRCV2IfO2toZ3FZi4t-AcCNOcE5xeK-IV0MC$
>  
> 
> regards
> Philipp
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
