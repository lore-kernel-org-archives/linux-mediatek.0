Return-Path: <SRS0=N3vC=BV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C21C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Aug 2020 06:42:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B48D820781
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Aug 2020 06:42:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dfYUkMR5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hkhy2iK7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B48D820781
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JzY+AeaNVg1M2YZTJlRwGAUxtdiZjRmFcBBDtVmO4LY=; b=dfYUkMR5fEJkU/APNFbwWpAa/
	vRO0aMtfMfj5efIOtV+4mnbs3JHPMFUFGaK/5yZ5dmXxOPVDK5dqpsLi9TkXR1jicCpkOYco6/TI6
	DLzCDIO1jEI5ND0z7+MD9LlqRy0giabe89sfFHMoXLajXgYY3HVASOiK7x8SbMJnvHI43RJK9CTPp
	ysVhl4C29ZJpb0WqdkWhPB3W1gUQjGNG2ErvCNxpqyq4u4oWsbFO/yRLMvA+gkka5iIJHCb9NWsFH
	prIQVnBBcFt20ztvnqQCuK4l4o+nP3Y09vd5SU/AUU0Tp1VdPvijt1/BnHRJtjmKfnDv+dD7ZKpeU
	geCSF3C7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5Nzj-0006HF-Ba; Tue, 11 Aug 2020 06:42:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5Nzg-0006GB-57; Tue, 11 Aug 2020 06:42:45 +0000
X-UUID: 39a2d9e53ecc4050bd5b451641cc75a3-20200810
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=HjTrZJUnmsbyXMddz+pAd0d3gGDoO/AnUi9tsFN7vvI=; 
 b=hkhy2iK7bxzjN/8wI2tM41ng+0J7E90mEj3QvoZJ8bOy3RTHYqZ8BJODlt9MZP0sBg95hd3FbyNHmMVCXYRTapbv4jcDRo4iMZ3ymn3bgwQbp0EG2FS4d2SDCYP2TIhWjgMigKHt+7M3KNMZL6Qnvc16hNWa035iLOlHzuyfHjk=;
X-UUID: 39a2d9e53ecc4050bd5b451641cc75a3-20200810
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1208973770; Mon, 10 Aug 2020 22:42:25 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 Aug 2020 23:34:54 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 11 Aug 2020 14:34:51 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 11 Aug 2020 14:34:45 +0800
Message-ID: <1597127686.20627.8.camel@mtksdaap41>
Subject: Re: [PATCH v2 3/5] clk: mediatek: Fix asymmetrical PLL enable and
 disable control
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 11 Aug 2020 14:34:46 +0800
In-Reply-To: <CANMq1KAYg2+RQiF0w7-2FKZj1QwoPDsXtmak-DHfserRjX-TWA@mail.gmail.com>
References: <1596012277-8448-1-git-send-email-weiyi.lu@mediatek.com>
 <1596012277-8448-4-git-send-email-weiyi.lu@mediatek.com>
 <CANMq1KBJ3QgpZ4EuSOWYTpOatsOte5sGkqtSZQs337x3fMFFYw@mail.gmail.com>
 <CANMq1KAYg2+RQiF0w7-2FKZj1QwoPDsXtmak-DHfserRjX-TWA@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2B190417C65371784B5F8095A8677560A8027995044ABD80DB753E33129969022000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200811_024244_436132_C3DB9559 
X-CRM114-Status: GOOD (  27.80  )
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
 James Liao <jamesjj.liao@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Wendell Lin <wendell.lin@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-07-29 at 19:02 +0800, Nicolas Boichat wrote:
> On Wed, Jul 29, 2020 at 6:51 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
> >
> > On Wed, Jul 29, 2020 at 4:44 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
> > >
> > > The en_mask actually is a combination of divider enable mask
> > > and pll enable bit(bit0).
> > > Before this patch, we enabled both divider mask and bit0 in prepare(),
> > > but only cleared the bit0 in unprepare().
> > > Now, setting the enable register(CON0) in 2 steps: first divider mask,
> > > then bit0 during prepare(), vice versa.
> > > Hence, en_mask will only be used as divider enable mask.
> > > Meanwhile, all the SoC PLL data are updated.
> >
> > I like this a lot better, most changes look fine, just a few nits.
> >
> > >
> > > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> > > ---
> > >  drivers/clk/mediatek/clk-mt2701.c | 26 ++++++++++++------------
> > >  drivers/clk/mediatek/clk-mt2712.c | 30 ++++++++++++++--------------
> > >  drivers/clk/mediatek/clk-mt6765.c | 20 +++++++++----------
> > >  drivers/clk/mediatek/clk-mt6779.c | 24 +++++++++++-----------
> > >  drivers/clk/mediatek/clk-mt6797.c | 20 +++++++++----------
> > >  drivers/clk/mediatek/clk-mt7622.c | 18 ++++++++---------
> > >  drivers/clk/mediatek/clk-mt7629.c | 12 +++++------
> > >  drivers/clk/mediatek/clk-mt8173.c | 42 ++++++++++++++++++++++++++-------------
> > >  drivers/clk/mediatek/clk-mt8183.c | 22 ++++++++++----------
> > >  drivers/clk/mediatek/clk-pll.c    | 10 ++++++++--
> > >  10 files changed, 122 insertions(+), 102 deletions(-)
> > >
> [snip]
> > > diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
> > > index f440f2cd..3c79e1a 100644
> > > --- a/drivers/clk/mediatek/clk-pll.c
> > > +++ b/drivers/clk/mediatek/clk-pll.c
> > > @@ -247,8 +247,10 @@ static int mtk_pll_prepare(struct clk_hw *hw)
> > >         writel(r, pll->pwr_addr);
> > >         udelay(1);
> > >
> > > -       r = readl(pll->base_addr + REG_CON0);
> > > -       r |= pll->data->en_mask;
> > > +       r = readl(pll->base_addr + REG_CON0) | CON0_BASE_EN;
> > > +       writel(r, pll->base_addr + REG_CON0);
> > > +
> > > +       r = readl(pll->base_addr + REG_CON0) | pll->data->en_mask;
> 
> One more question. I have the feeling that CON0_BASE_EN is what
> enables the clock for good (and pll->data->en_mask is just an
> additional setting/mask, since you could disable the clock by simply
> clearing CON0_BASE_EN). Shouldn't you set pll->data->en_mask _first_,
> then CON0_BASE_EN?
> 

Hi Nicolas,

Actually I had the same question when I first saw it.
But this is the recommended sequence in the PLL application notes.

preapre
{
    | CON0_BASE_EN;
    | pll->data->en_mask;
}

unprepare
{
    ~pll->data->en_mask;
    ~CON0_BASE_EN;
}

> > >         writel(r, pll->base_addr + REG_CON0);
> >
> > As a small optimization, you can do:
> >
> > if (pll->data->en_mask) {
> >    r = readl(pll->base_addr + REG_CON0) | pll->data->en_mask;
> >    writel(r, pll->base_addr + REG_CON0);
> > }
> >
> > >
> > >         __mtk_pll_tuner_enable(pll);
> > > @@ -278,6 +280,10 @@ static void mtk_pll_unprepare(struct clk_hw *hw)
> > >         __mtk_pll_tuner_disable(pll);
> > >
> > >         r = readl(pll->base_addr + REG_CON0);
> > > +       r &= ~pll->data->en_mask;
> >
> > Move this to one line? (so that the code looks symmetrical, too?)
> >
> > > +       writel(r, pll->base_addr + REG_CON0);
> > > +
> > > +       r = readl(pll->base_addr + REG_CON0);
> > >         r &= ~CON0_BASE_EN;
> 
> And ditto, ~CON0_BASE_EN then ~pll->data->en_mask?
> 
> >
> > ditto?
> >
> > >         writel(r, pll->base_addr + REG_CON0);
> > >
> > > --
> > > 1.8.1.1.dirty

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
