Return-Path: <SRS0=Fikf=MV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA17FC4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 03:43:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A22406103A
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 03:43:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A22406103A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tvdOm9C8YtVJYsocFKgOk8dYgy14fiU5OYDEl4d/pbQ=; b=P+OL+1JaNcGrr/
	pdkQvT1Un9YGddi0KmR/yrAGu7Rw4iFvk7PpDrPps36M9VKKxUn1S5O2RfKJoI8C/lVDg/icRWzoe
	1VYzNBaIY5yBvRxBXLAxw0893+iJG4pFjj+TEqHql3gnnsqkhkUurxIZx5n+q4toew57Kcf/TqBEi
	kks0hA6RiHIb6dl1sTv+DtU9qVVFkg+wxxuKc/lOsCtmlqHwDEPG09DjoP4z6rk/1OUqAQApbNyxY
	gPhslDtomeLlCqNhpcZzd7SY3OBXeZgzVKsoQgOWbsUg+CFlzg54cuHlppxa2p6O/+BIr1mYRNNs7
	zGSQNbkI1omXArHMhR/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8wwm-002yst-Ij; Thu, 29 Jul 2021 03:43:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8wwW-002ypu-Vl; Thu, 29 Jul 2021 03:42:46 +0000
X-UUID: 2a9693c54d85478eb8c692815c5b5b5c-20210728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=g/h6d5ht0Kz0+npXpy03sIdKmA8QrRfO6V6rBdcyB/E=; 
 b=rtc7fWTZ1a/NQaHEu0naUj1+QF6Q9N22WuGae/iTfkcWw71ghZrira85urEdjDYaesMBevS27+Hh1nngrxiwY4eAqqzzHkpimNTOmCC0cv39TZMfu/zfoStpXOSVNtGoQqMkKrL7giifII/fz0qZWEmnRKdrCybySgEctnFNJLM=;
X-UUID: 2a9693c54d85478eb8c692815c5b5b5c-20210728
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1254802963; Wed, 28 Jul 2021 20:42:41 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Jul 2021 20:42:39 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Jul 2021 11:42:31 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 29 Jul 2021 11:42:31 +0800
Message-ID: <1627530151.32756.9.camel@mtksdaap41>
Subject: Re: [PATCH] soc: mmsys: mediatek: add mask to mmsys routes
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
CC: Frank Wunderlich <linux@fw-web.de>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, lkml
 <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>, Frank Wunderlich
 <frank-w@public-files.de>
Date: Thu, 29 Jul 2021 11:42:31 +0800
In-Reply-To: <CAJMQK-g8g5QJbBkU-A6th1VSWafxVv2fGtym+enQa_hDVaVoBw@mail.gmail.com>
References: <20210727174025.10552-1-linux@fw-web.de>
 <CAJMQK-g8g5QJbBkU-A6th1VSWafxVv2fGtym+enQa_hDVaVoBw@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210728_204245_092137_9BD866DC 
X-CRM114-Status: GOOD (  26.51  )
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

Hi, Hsin-yi:

On Thu, 2021-07-29 at 11:15 +0800, Hsin-Yi Wang wrote:
> On Wed, Jul 28, 2021 at 1:41 AM Frank Wunderlich <linux@fw-web.de> wrote:
> >
> > From: CK Hu <ck.hu@mediatek.com>
> >
> > SOUT has many bits and need to be cleared before set new value.
> > Write only could do the clear, but for MOUT, it clears bits that
> > should not be cleared. So use a mask to reset only the needed bits.
> >
> > this fixes HDMI issues on MT7623/BPI-R2 since 5.13
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 440147639ac7 ("soc: mediatek: mmsys: Use an array for setting the routing registers")
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > Signed-off-by: CK Hu <ck.hu@mediatek.com>
> > ---
> > code is taken from here (upstreamed without mask part)
> > https://urldefense.com/v3/__https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/*/2345186/5__;Kw!!CTRNKA9wMg0ARbw!1ebx2FjrHnqvOqw3HdVyMMYcEUivNbxRIOi1_DXMWwfxJHx45NyKI-Dt4Mvo1g$ 
> > basicly CK Hu's code so i set him as author
> > ---
> >  drivers/soc/mediatek/mtk-mmsys.c |   7 +-
> >  drivers/soc/mediatek/mtk-mmsys.h | 133 +++++++++++++++++++++----------
> >  2 files changed, 98 insertions(+), 42 deletions(-)
> >
> > diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> > index 080660ef11bf..0f949896fd06 100644
> > --- a/drivers/soc/mediatek/mtk-mmsys.c
> > +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > @@ -68,7 +68,9 @@ void mtk_mmsys_ddp_connect(struct device *dev,
> >
> >         for (i = 0; i < mmsys->data->num_routes; i++)
> >                 if (cur == routes[i].from_comp && next == routes[i].to_comp) {
> > -                       reg = readl_relaxed(mmsys->regs + routes[i].addr) | routes[i].val;
> > +                       reg = readl_relaxed(mmsys->regs + routes[i].addr);
> > +                       reg &= ~routes[i].mask;
> > +                       reg |= routes[i].val;
> >                         writel_relaxed(reg, mmsys->regs + routes[i].addr);
> >                 }
> >  }
> > @@ -85,7 +87,8 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
> >
> >         for (i = 0; i < mmsys->data->num_routes; i++)
> >                 if (cur == routes[i].from_comp && next == routes[i].to_comp) {
> > -                       reg = readl_relaxed(mmsys->regs + routes[i].addr) & ~routes[i].val;
> > +                       reg = readl_relaxed(mmsys->regs + routes[i].addr);
> > +                       reg &= ~routes[i].mask;
> 
> This patch is breaking the mt8183 internal display. I think it's
> because  ~routes[i].val; is removed?
> Also what should the routes[i].mask be if it's not set in
> mmsys_mt8183_routing_table?

I'm not sure this problem is about MOUT or SOUT. But for MOUT, it's not
necessary to set mask because the value is equal to mask. To make thins
simple, the code could be

/* For MOUT,  value is equal to mask, so mask is 0 and clear the value
*/
reg &= ~routes[i].mask & ~routes[i].val;

Regards,
CK
> 
> >                         writel_relaxed(reg, mmsys->regs + routes[i].addr);
> >                 }
> >  }
> <snip>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
