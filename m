Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA533C433E5
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 02:57:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76ABF206F4
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 02:57:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ntPpEkWh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ntRWEgnE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76ABF206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xjEyLgcjf2camyGe3+6dRQE31cY73VD44cXP8vOJNcM=; b=ntPpEkWhN3/odJ0+y6ztCAeZw
	hzvSGHG6fDWgPOCS1CC4N0lG9aXk2jvAbq5tJm4z+xT5dS7MaUXujGc/I23ZLl8Dhr0IrfPQ9Zgya
	vnSw5f+T6apZBWd+nDVMLHsb8qWItPRXoAFAq+UbfeZpEoaTrpcImdnyXEcnoc6vG6jjP6iQhqA2W
	V2DUSWhATsfBu6x/Ci1izHfExnvEqqD+rjr1CqyaOFqpE5AcZWZFmeNypPixgt7uOXfIv7CnrQ7vj
	JFfp6hckVhQCrBa/dViMubmHKC05q8e/xCdK5l3ipTckefFMe90D+k258wIlTVrz3mfwWNoUeA47j
	8xXs4DosQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyRQO-0000XI-FI; Thu, 23 Jul 2020 02:57:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyRQJ-0000Vu-5c; Thu, 23 Jul 2020 02:57:32 +0000
X-UUID: f3bb05642bc347b3a075ed409544dd4d-20200722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=WYDT42K+eq1n1qjiZfhiWIQP4kra/i2foem6eG/vJw8=; 
 b=ntRWEgnEt6sFOWGQluImQ8Cg78J98/5814elObibCbBHvut8WppImk0+MIMAXHQST2bHgMkrYFDl2K3HvaHkrAS0UZ4J8Rn64iU3jbtEL9KkgdsBPBtAXPGqO7Z3+UiBxxA5KFSLFHSxG7m+DwLc4gjgp1JlzShucFLIJdmQBkg=;
X-UUID: f3bb05642bc347b3a075ed409544dd4d-20200722
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1201510519; Wed, 22 Jul 2020 18:57:26 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 19:57:24 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 10:57:23 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 10:57:23 +0800
Message-ID: <1595473043.5077.8.camel@mtksdaap41>
Subject: Re: [PATCH 3/4] clk: mediatek: Add configurable enable control to
 mtk_pll_data
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Date: Thu, 23 Jul 2020 10:57:23 +0800
In-Reply-To: <CANMq1KC5i8GU2zMxk+NvY5hF7Qvd-Jx-+pvY2cXfqzb=X-BWRQ@mail.gmail.com>
References: <1595400601-26220-1-git-send-email-weiyi.lu@mediatek.com>
 <1595400601-26220-4-git-send-email-weiyi.lu@mediatek.com>
 <CANMq1KC5i8GU2zMxk+NvY5hF7Qvd-Jx-+pvY2cXfqzb=X-BWRQ@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_225731_429655_3B832143 
X-CRM114-Status: GOOD (  29.96  )
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
 lkml <linux-kernel@vger.kernel.org>, Ikjoon Jang <ikjn@chromium.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Wendell Lin <wendell.lin@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-07-22 at 16:51 +0800, Nicolas Boichat wrote:
> On Wed, Jul 22, 2020 at 2:50 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
> >
> > In all MediaTek PLL design, bit 0 of CON0 register is always
> > the enable bit.
> > However, there's a special case of usbpll on MT8192.
> > The enable bit of usbpll is moved to bit 2 of other register.
> > Add configurable en_reg and base_en_bit for enable control or
> > using the default if without setting in pll data.
> >
> > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> > ---
> >  drivers/clk/mediatek/clk-mtk.h |  2 ++
> >  drivers/clk/mediatek/clk-pll.c | 26 ++++++++++++++++++++++----
> >  2 files changed, 24 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
> > index c3d6756..8bb0b3d 100644
> > --- a/drivers/clk/mediatek/clk-mtk.h
> > +++ b/drivers/clk/mediatek/clk-mtk.h
> > @@ -233,6 +233,8 @@ struct mtk_pll_data {
> >         uint32_t pcw_chg_reg;
> >         const struct mtk_pll_div_table *div_table;
> >         const char *parent_name;
> > +       uint32_t en_reg;
> > +       uint8_t base_en_bit;
> >  };
> >
> >  void mtk_clk_register_plls(struct device_node *node,
> > diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
> > index f440f2cd..b8ccd42 100644
> > --- a/drivers/clk/mediatek/clk-pll.c
> > +++ b/drivers/clk/mediatek/clk-pll.c
> > @@ -44,6 +44,7 @@ struct mtk_clk_pll {
> >         void __iomem    *tuner_en_addr;
> >         void __iomem    *pcw_addr;
> >         void __iomem    *pcw_chg_addr;
> > +       void __iomem    *en_addr;
> >         const struct mtk_pll_data *data;
> >  };
> >
> > @@ -56,7 +57,10 @@ static int mtk_pll_is_prepared(struct clk_hw *hw)
> >  {
> >         struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
> >
> > -       return (readl(pll->base_addr + REG_CON0) & CON0_BASE_EN) != 0;
> > +       if (pll->en_addr)
> > +               return (readl(pll->en_addr) & BIT(pll->data->base_en_bit)) != 0;
> > +       else
> > +               return (readl(pll->base_addr + REG_CON0) & CON0_BASE_EN) != 0;
> >  }
> >
> >  static unsigned long __mtk_pll_recalc_rate(struct mtk_clk_pll *pll, u32 fin,
> > @@ -251,6 +255,12 @@ static int mtk_pll_prepare(struct clk_hw *hw)
> >         r |= pll->data->en_mask;
> >         writel(r, pll->base_addr + REG_CON0);
> >
> 
> This is not a new change, but I'm wondering if the asymmetry is
> intentional here, that is, prepare sets bit pll->data->en_mask of
> REG_CON0; unprepare clears CON0_BASE_EN of REG_CON0.
> 
> With this patch, if pll->en_addr is set, you set both
> pll->data->en_mask _and_ pll->data->base_en_bit, and clear only
> pll->data->base_en_bit.
> 

Hi Nicolas,

AFAIK, the asymmetry was intentional.
en_mask is actually a combination of divider enable mask and the pll
enable bit(CON0_BASE_EN).
Even without my patch, it still sets divider enable mask and en_bit, and
only clears en_bit.
You could see the pll_data in clk-mt8192.c of patch [4/4]
Take mainpll as an example,
the enable mask of mainpll is 0xff000001, where 0xff000000 is the
divider enable mask and 0x1 is the en_bit

For usbpll in special case, usbpll doesn't have divider enable mask on
MT8192 so I give nothing(0x00000000) in the en_mask field.
However, the main reason why I don't skip setting the en_mask of MT8192
usbpll is that I'd just like to reserve the divider enable mask for any
special plls with divider enable mask in near future.

> > +       if (pll->en_addr) {
> > +               r = readl(pll->en_addr);
> > +               r |= BIT(pll->data->base_en_bit);
> > +               writel(r, pll->en_addr);
> > +       }
> > +
> >         __mtk_pll_tuner_enable(pll);
> >
> >         udelay(20);
> > @@ -277,9 +287,15 @@ static void mtk_pll_unprepare(struct clk_hw *hw)
> >
> >         __mtk_pll_tuner_disable(pll);
> >
> > -       r = readl(pll->base_addr + REG_CON0);
> > -       r &= ~CON0_BASE_EN;
> > -       writel(r, pll->base_addr + REG_CON0);
> > +       if (pll->en_addr) {
> > +               r = readl(pll->en_addr);
> > +               r &= ~BIT(pll->data->base_en_bit);
> > +               writel(r, pll->en_addr);
> > +       } else {
> > +               r = readl(pll->base_addr + REG_CON0);
> > +               r &= ~CON0_BASE_EN;
> > +               writel(r, pll->base_addr + REG_CON0);
> > +       }
> >
> >         r = readl(pll->pwr_addr) | CON0_ISO_EN;
> >         writel(r, pll->pwr_addr);
> > @@ -321,6 +337,8 @@ static struct clk *mtk_clk_register_pll(const struct mtk_pll_data *data,
> >                 pll->tuner_addr = base + data->tuner_reg;
> >         if (data->tuner_en_reg)
> >                 pll->tuner_en_addr = base + data->tuner_en_reg;
> > +       if (data->en_reg)
> > +               pll->en_addr = base + data->en_reg;
> 
> If the answer to my question above holds (asymmetry is not
> intentional), this patch/the code could be simplified a lot if you
> also added a pll->en_bit member, and, here, did this:
> 
> if (pll->en_reg) {
>    pll->en_addr = base + data->en_reg;
>    pll->end_bit = data->en_bit;
> } else {
>    pll->en_addr = pll->base_addr + REG_CON0;
>    pll->en_bit = CON0_BASE_EN;
> }
> 
> >         pll->hw.init = &init;
> >         pll->data = data;
> >
> > --
> > 1.8.1.1.dirty

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
