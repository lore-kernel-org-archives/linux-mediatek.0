Return-Path: <SRS0=SIUT=F3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC5DC433E6
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 00:43:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B388207D2
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 00:43:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B388207D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O9j5M9snsoMHK0NSS6o/CEOL+ZAfSTc8/Y8oWtbzExE=; b=SUK085PcHnwrSrGpWQxCYenq4c
	9VchYmQTK8hk2Tv3lR3pZhfKIItiz5xRRWVhad+aIMT7IG1HzZdNj6eCfDw39ZoENMmIg7uPgGBZ5
	Zi3d5iA2oVE3utnrvC7pnp2muT3Ud96MQw2F/G7Issd8RP/mAYtShMPlWLqfjaoNYHmgOOYcrX/dA
	2loABTKXm6l4vDb+qkcVLYpizoLB/Jcr66vyMzJrt/R2G/xs2Uw9dby6FkWVcLqNNIAJr5Uxf9lEf
	zaONhS5thjNvl1nWl+o7lrJGETu7YcW4v2g2GM2fHbC2KhIEVsU2uZoF1b1JE7tKxKMVBJD5kThJy
	yuNWKZYQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krsFh-0005ZF-SJ; Wed, 23 Dec 2020 00:43:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krsFa-0005X2-Cy; Wed, 23 Dec 2020 00:43:35 +0000
X-UUID: 6a7119a572a94df6b95c299ae9161179-20201222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=nFTEuMzoRWG8Gam4dwBb/ELgnkKPHK0rpDb9IHH32fw=; 
 b=Nnh9/B15F7H9REEscR21dw2UKihYFkAqzS/mkSjTSzTuLGUHF5m+1GqAtYwSb+bO2kbTvpzXKHRH3utfVxNWe9nAALA011aeUph5ZveRFxe64O5zswWKj/oaAbfeQMbQF71B4IiasEaFVGcvuAOBdUgx0XkWZBJQiK4Bd+Fwqzw=;
X-UUID: 6a7119a572a94df6b95c299ae9161179-20201222
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 960175119; Tue, 22 Dec 2020 16:43:20 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Dec 2020 16:33:18 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs07n1.mediatek.inc
 (172.21.101.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 23 Dec 2020 08:33:17 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Dec 2020 08:33:11 +0800
Message-ID: <1608683595.18252.0.camel@mhfsdcap03>
Subject: Re: [PATCH v1, 3/5] mailbox: mediatek: add control_by_sw private data
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Date: Wed, 23 Dec 2020 08:33:15 +0800
In-Reply-To: <CANMq1KDWwfijinZq0b8BVqvYBj1fOHFpfMPLbzj0JR8z9LKypw@mail.gmail.com>
References: <1607141728-17307-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607141728-17307-4-git-send-email-yongqiang.niu@mediatek.com>
 <CANMq1KDWwfijinZq0b8BVqvYBj1fOHFpfMPLbzj0JR8z9LKypw@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_194334_613056_5714E652 
X-CRM114-Status: GOOD (  19.41  )
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
Reply-To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, lkml <linux-kernel@vger.kernel.org>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 2020-12-05 at 15:35 +0800, Nicolas Boichat wrote:
> On Sat, Dec 5, 2020 at 12:18 PM Yongqiang Niu
> <yongqiang.niu@mediatek.com> wrote:
> >
> > add control_by_sw private data
> 
> Can you describe in a bit more details what this means?

gce works well without this patch, and it will be removed in
next version
> 
> >
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > ---
> >  drivers/mailbox/mtk-cmdq-mailbox.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> > index 5665b6e..1c01fe0 100644
> > --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> > +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> > @@ -36,6 +36,8 @@
> >  #define CMDQ_THR_WAIT_TOKEN            0x30
> >  #define CMDQ_THR_PRIORITY              0x40
> >
> > +#define GCE_GCTL_VALUE                 0x48
> > +
> >  #define CMDQ_THR_ACTIVE_SLOT_CYCLES    0x3200
> >  #define CMDQ_THR_ENABLED               0x1
> >  #define CMDQ_THR_DISABLED              0x0
> > @@ -76,11 +78,13 @@ struct cmdq {
> >         struct clk              *clock;
> >         bool                    suspended;
> >         u8                      shift_pa;
> > +       bool                    control_by_sw;
> >  };
> >
> >  struct gce_plat {
> >         u32 thread_nr;
> >         u8 shift;
> > +       bool control_by_sw;
> >  };
> >
> >  u8 cmdq_get_shift_pa(struct mbox_chan *chan)
> > @@ -121,6 +125,8 @@ static void cmdq_init(struct cmdq *cmdq)
> >         int i;
> >
> >         WARN_ON(clk_enable(cmdq->clock) < 0);
> > +       if (cmdq->control_by_sw)
> > +               writel(0x7, cmdq->base + GCE_GCTL_VALUE);
> 
> What is 0x7? Define a macro for these bits?
> 
> >         writel(CMDQ_THR_ACTIVE_SLOT_CYCLES, cmdq->base + CMDQ_THR_SLOT_CYCLES);
> >         for (i = 0; i <= CMDQ_MAX_EVENT; i++)
> >                 writel(i, cmdq->base + CMDQ_SYNC_TOKEN_UPDATE);
> > @@ -536,6 +542,7 @@ static int cmdq_probe(struct platform_device *pdev)
> >
> >         cmdq->thread_nr = plat_data->thread_nr;
> >         cmdq->shift_pa = plat_data->shift;
> > +       cmdq->control_by_sw = plat_data->control_by_sw;
> >         cmdq->irq_mask = GENMASK(cmdq->thread_nr - 1, 0);
> >         err = devm_request_irq(dev, cmdq->irq, cmdq_irq_handler, IRQF_SHARED,
> >                                "mtk_cmdq", cmdq);
> > --
> > 1.8.1.1.dirty
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
