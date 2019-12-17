Return-Path: <SRS0=Z+8g=2H=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10BA3C43603
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Dec 2019 02:51:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D510E2176D
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Dec 2019 02:51:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hhqrcubk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nrIaNHV2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D510E2176D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A/vzlFvdUEn5mfNXvB9KBHxILQ4EOGX2jS5bz3vc0o4=; b=Hhqrcubkh+PNBz
	RN0mgyt3rKcswrO+SOQ0CtoPHFqcpK+pYlHGvlMz99b+QEKzpGh/NubWe40PGTsxKWUdBa/jvs0ZH
	QDYgX9mG98t7lvWXs22l1I7XP1n8irgPX1Cv3fPnfTBoDXFNP05Yecd+0N0OP/0Obxtfdu5Ok4r9H
	kF95JgMNJqSfrRLpd/dE+hJz4llvyDlqJNTW3BCTalE4OleVUA/VsdpFkyp+A3vYQPMv15JH3F2/h
	6i/RWOpl/KjWAKvt1E5VScGjJE83pT4+xzfahA8knnD4Vl5iPxnw0hpHsMp2gf3x6JOXKn18/Hv8H
	Jn7gWaThzSmuEAHhNImg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ih2wz-00036D-2D; Tue, 17 Dec 2019 02:51:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ih2ww-000359-74; Tue, 17 Dec 2019 02:51:03 +0000
X-UUID: 281cfac2fb784c84a880b023454453ff-20191216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=LX30lj8mLQVTtpAKiV/zXtanwXXaFbc1xBxLxcZmnMQ=; 
 b=nrIaNHV2yuAOhrQ9+Ghww+UVVXb5yvtWfuGMafMjUxEYhNf/Vb+/ZPwIF7LvutddoqIHvD66wo3YAWEVxBEP2Tj7AxyOvaTrTKRp6YUJyKEj421IwFXFTIHn4NNQ7yFZ7H1hlCzjNENgMHxu+RNApAy2HOdRADS2Q1nxa82GjTc=;
X-UUID: 281cfac2fb784c84a880b023454453ff-20191216
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2128832383; Mon, 16 Dec 2019 18:50:59 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 16 Dec 2019 18:51:16 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 17 Dec 2019 10:50:13 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 17 Dec 2019 10:49:57 +0800
Message-ID: <1576551044.14035.18.camel@mtksdaap41>
Subject: Re: [PATCH v9 3/9] soc: mediatek: Add basic_clk_id to scp_power_data
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 17 Dec 2019 10:50:44 +0800
In-Reply-To: <CANMq1KC4Qz8yKNTqfjYb335RCY8t5pdRa09Bvroo_BNXv19hWQ@mail.gmail.com>
References: <1575960413-6900-1-git-send-email-weiyi.lu@mediatek.com>
 <1575960413-6900-4-git-send-email-weiyi.lu@mediatek.com>
 <CANMq1KC4Qz8yKNTqfjYb335RCY8t5pdRa09Bvroo_BNXv19hWQ@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 642B78DF808E55FC0C5C4E033F841D60DDCD4CB0A219E378767E8FE960F53DE02000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191216_185102_264623_F50EC31C 
X-CRM114-Status: GOOD (  21.89  )
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
Cc: Rob Herring <robh@kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>,
 James Liao <jamesjj.liao@mediatek.com>, lkml <linux-kernel@vger.kernel.org>,
 Fan Chen <fan.chen@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yong Wu <yong.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2019-12-16 at 15:01 +0800, Nicolas Boichat wrote:
> On Tue, Dec 10, 2019 at 2:47 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
> >
> > Try to stop extending the clk_id or clk_names if there are
> > more and more new BASIC clocks. To get its own clocks by the
> > basic_clk_id of each power domain.
> 
> Looking at this a bit more, I'm not sure why we make this an option...
> 
> The easiest way to make this consistent with non-MT8183 scpsys drivers
> is to add your missing clocks to "enum clk_id" and clk_names, but I
> understand it's not desired (number of clocks would blow up).
> 
> Can we, instead, convert all existing scpsys drivers to use "char *"
> clock names instead?
> I made an attempt here and it seems simple enough:
> https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/1969103
> 

That's what we'd like to do in the future. But you're right! I should
complete it at one go.

> >
> > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> > ---
> >  drivers/soc/mediatek/mtk-scpsys.c | 29 +++++++++++++++++++++--------
> >  1 file changed, 21 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
> > index f669d37..915d635 100644
> > --- a/drivers/soc/mediatek/mtk-scpsys.c
> > +++ b/drivers/soc/mediatek/mtk-scpsys.c
> > @@ -117,6 +117,8 @@ enum clk_id {
> >   * @sram_pdn_ack_bits: The mask for sram power control acked bits.
> >   * @bus_prot_mask: The mask for single step bus protection.
> >   * @clk_id: The basic clocks required by this power domain.
> > + * @basic_clk_id: provide the same purpose with field "clk_id"
> > + *                by declaring basic clock prefix name rather than clk_id.
> 
> Actually, I prefer the name clk_name, not sure why I pushed you in
> that direction...
> 

OK, I'll fix it in next version. But I'd like to use "basic_clk_name"
because we will add "subsys_clk_prefix" in following patch.

> >   * @caps: The flag for active wake-up action.
> >   */
> >  struct scp_domain_data {
> > @@ -127,6 +129,7 @@ struct scp_domain_data {
> >         u32 sram_pdn_ack_bits;
> >         u32 bus_prot_mask;
> >         enum clk_id clk_id[MAX_CLKS];
> > +       const char *basic_clk_id[MAX_CLKS];
> >         u8 caps;
> >  };
> >
> > @@ -493,16 +496,26 @@ static struct scp *init_scp(struct platform_device *pdev,
> >
> >                 scpd->data = data;
> >
> > -               for (j = 0; j < MAX_CLKS && data->clk_id[j]; j++) {
> > -                       struct clk *c = clk[data->clk_id[j]];
> > +               if (data->clk_id[0]) {
> > +                       WARN_ON(data->basic_clk_id[0]);
> >
> > -                       if (IS_ERR(c)) {
> > -                               dev_err(&pdev->dev, "%s: clk unavailable\n",
> > -                                       data->name);
> > -                               return ERR_CAST(c);
> > -                       }
> > +                       for (j = 0; j < MAX_CLKS && data->clk_id[j]; j++) {
> > +                               struct clk *c = clk[data->clk_id[j]];
> > +
> > +                               if (IS_ERR(c)) {
> > +                                       dev_err(&pdev->dev,
> > +                                               "%s: clk unavailable\n",
> > +                                               data->name);
> > +                                       return ERR_CAST(c);
> > +                               }
> >
> > -                       scpd->clk[j] = c;
> > +                               scpd->clk[j] = c;
> > +                       }
> > +               } else if (data->basic_clk_id[0]) {
> > +                       for (j = 0; j < MAX_CLKS &&
> > +                                       data->basic_clk_id[j]; j++)
> > +                               scpd->clk[j] = devm_clk_get(&pdev->dev,
> > +                                               data->basic_clk_id[j]);
> >                 }
> >
> >                 genpd->name = data->name;
> > --
> > 1.8.1.1.dirty

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
