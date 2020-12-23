Return-Path: <SRS0=SIUT=F3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBFA1C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 01:48:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F1E422571
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 01:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F1E422571
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RlcD2aCvvNcAyOwnMjbxoUWp8Xi5Kaov/tXpJP7xRuE=; b=YBZ00W2HebQjdUUviJI80TOKGd
	m+PjQDmXGuIgBmJ572+22lg6tjsyUEZcllEeo67kQ2zHTA1v+CdAsR7yB92dKf/twNJW7qvjVPuIy
	VueNDUZypU5exjid5w91Fdd/Y7wff4A02YDV6lEn9ZL1LqB+ytsx4R9RyroKagsNMKydXBvdza5wC
	ywGzCA/H+kdBIo/3vLFEyLWV3sFLP+nIb4PPfiFtNCiMMmdaU2z2Cgb0NM3Yju2I4qAtdDIrW6r18
	ob4v+mYQxG9crLR8d3B/TBCEfPx9CRnyWRPX2Pc3o7K08PSReAbNFsBGz4LGgCy/8sDIW5RKqaMD2
	nGoc8g+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krtG7-00044D-OH; Wed, 23 Dec 2020 01:48:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krtFz-00041r-PQ; Wed, 23 Dec 2020 01:48:05 +0000
X-UUID: 46144d789f8c442793b12ff1314ac93f-20201222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=bCO1MdnugxBGFYFW+IFPDqIJhWdsGZS/W2S81orE9VU=; 
 b=igIWUGCuSIo6X6qExWvY69gTOyBvdiIJGiz30XNEQXCUi8PjAxjA/MwWjVHsmdS1SNap6MCa9STHwIkxZ8er/yGuN9rR9gyKAzBysFamABmu/1loGq2fUZaBr8xIHylcPXccGPygGg2mpKkYDRerUsIjeMh0H04J7FrRltK1rHo=;
X-UUID: 46144d789f8c442793b12ff1314ac93f-20201222
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 647606505; Tue, 22 Dec 2020 17:47:56 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Dec 2020 17:41:19 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n1.mediatek.inc
 (172.21.101.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 23 Dec 2020 09:41:14 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Dec 2020 09:41:16 +0800
Message-ID: <1608687676.18252.11.camel@mhfsdcap03>
Subject: Re: [PATCH v2, 14/17] soc: mediatek: mmsys: Use function call for
 setting mmsys ovl mout register
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Date: Wed, 23 Dec 2020 09:41:16 +0800
In-Reply-To: <CANMq1KBu4Ft49CUgGMxYdsv6ymWzVWK+eNBhn1t+oEN0ZwP0YA@mail.gmail.com>
References: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607746317-4696-15-git-send-email-yongqiang.niu@mediatek.com>
 <CANMq1KBu4Ft49CUgGMxYdsv6ymWzVWK+eNBhn1t+oEN0ZwP0YA@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_204804_091672_4C1D83ED 
X-CRM114-Status: GOOD (  26.29  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob
 Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-12-15 at 21:42 +0800, Nicolas Boichat wrote:
> On Sat, Dec 12, 2020 at 12:13 PM Yongqiang Niu
> <yongqiang.niu@mediatek.com> wrote:
> >
> > Use function call for setting mmsys ovl mout register
> >
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > ---
> >  drivers/soc/mediatek/mmsys/mtk-mmsys.c | 18 ++++++++++++++++++
> >  include/linux/soc/mediatek/mtk-mmsys.h |  3 +++
> >  2 files changed, 21 insertions(+)
> >
> > diff --git a/drivers/soc/mediatek/mmsys/mtk-mmsys.c b/drivers/soc/mediatek/mmsys/mtk-mmsys.c
> > index cb76e64..2558b42 100644
> > --- a/drivers/soc/mediatek/mmsys/mtk-mmsys.c
> > +++ b/drivers/soc/mediatek/mmsys/mtk-mmsys.c
> > @@ -78,6 +78,15 @@ void mtk_mmsys_ddp_connect(struct device *dev,
> >                 reg = readl_relaxed(mmsys->regs + addr) | value;
> >                 writel_relaxed(reg, mmsys->regs + addr);
> >         }
> > +
> > +       if (!funcs->ovl_mout_en)
> > +               return;
> > +
> > +       value = funcs->ovl_mout_en(cur, next, &addr);
> > +       if (value) {
> > +               reg = readl_relaxed(mmsys->regs + addr) | value;
> > +               writel_relaxed(reg, mmsys->regs + addr);
> > +       }
> 
> This is technically correct, but I'm afraid this may become and issue
> later if we have another function like ovl_mout_en.
> 
> So maybe it's better to do:
> if (funcs->ovl_mout_en) {
>   value = funcs->ovl_mout_en(cur, next, &addr);
>   ...
> }

will be improved like this in next version
> 
> Or another option: Create a new function
> static unsigned int mtk_mmsys_ovl_mout_en(...) {
>    if (!funcs->ovl_mout_en)
>       return 0;
> }
> 
> and call that, following the same pattern as
> mtk_mmsys_ddp_mout_en/mtk_mmsys_ddp_sel_in?
> 
> >  }
> >  EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_connect);
> >
> > @@ -103,6 +112,15 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
> >                 reg = readl_relaxed(mmsys->regs + addr) & ~value;
> >                 writel_relaxed(reg, mmsys->regs + addr);
> >         }
> > +
> > +       if (!funcs->ovl_mout_en)
> > +               return;
> > +
> > +       value = funcs->ovl_mout_en(cur, next, &addr);
> > +       if (value) {
> > +               reg = readl_relaxed(mmsys->regs + addr) & ~value;
> > +               writel_relaxed(reg, mmsys->regs + addr);
> > +       }
> >  }
> >  EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
> >
> > diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
> > index aa4f60e..220203d 100644
> > --- a/include/linux/soc/mediatek/mtk-mmsys.h
> > +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> > @@ -49,6 +49,9 @@ struct mtk_mmsys_conn_funcs {
> >         u32 (*mout_en)(enum mtk_ddp_comp_id cur,
> >                        enum mtk_ddp_comp_id next,
> >                        unsigned int *addr);
> > +       u32 (*ovl_mout_en)(enum mtk_ddp_comp_id cur,
> > +                          enum mtk_ddp_comp_id next,
> > +                          unsigned int *addr);
> >         u32 (*sel_in)(enum mtk_ddp_comp_id cur,
> >                       enum mtk_ddp_comp_id next,
> >                       unsigned int *addr);
> > --
> > 1.8.1.1.dirty
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
