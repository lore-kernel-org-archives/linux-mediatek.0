Return-Path: <SRS0=N3vC=BV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B43DC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Aug 2020 06:43:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A96E207DE
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Aug 2020 06:43:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m/BwFprp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Rm/6FLc0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A96E207DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ku1eBzA+PXnJydjGUrovGbVLIA01HGDRhybBkKy5knU=; b=m/BwFprp3XITRIh4YphhE9kwI
	XrnSUYbfQoEiUeVcqqcPzbk3DNMTk/R4Z8rq7FvnDxv40OZToPLBW9wCwXw3VlwlQefIwcD9IoCcc
	lu4/lFJqwiirpMbYrPCh9ltoloCM8Tzr+dk1YNhhUdYCizV+xOLtdHfG0ZJGJSUpLSablXQfYofMh
	RUWjIXmGCoZd7RM3tdQ7TWsOhNFbcSvnoUks/xBLABaY0CSbtoJHqMYblDcRwjnSDzdNhjEenYc5b
	pTnJt87pfnyjEQHsNX4iDipOulJ3ajkMPsFy6hzKDQrnzHzjfjxH7ynhyYWItxOKBmj/ko7yucM9D
	E43dxBLGQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5O0Z-0006TP-R4; Tue, 11 Aug 2020 06:43:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5O0X-0006SL-9T; Tue, 11 Aug 2020 06:43:38 +0000
X-UUID: b2afcfa6881649139a3a167eb903c5c1-20200810
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=IwFjIoBMs4hG3mm1jnyEzvP2yfokZU6BNDof81MOmbQ=; 
 b=Rm/6FLc06lk0ABvWubi2UgHn1uwVkJE4twzSHJ9hFVHhG805KyBmqp0cS2HR/gwbiZe1zgGmExNIWa6HjsZyxsZgwS/jbDLJGrO1rNQNk/lA93yyM2M8Y3pFhwsXCCMGFLUOHh0ItU9bBQu+idtw0q3yL+MOpu9MdTNoS2w3mZs=;
X-UUID: b2afcfa6881649139a3a167eb903c5c1-20200810
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 890675574; Mon, 10 Aug 2020 22:43:34 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 Aug 2020 23:43:32 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 11 Aug 2020 14:43:24 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 11 Aug 2020 14:43:24 +0800
Message-ID: <1597128205.20627.14.camel@mtksdaap41>
Subject: Re: [PATCH v2 4/5] clk: mediatek: Add configurable enable control
 to mtk_pll_data
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 11 Aug 2020 14:43:25 +0800
In-Reply-To: <CANMq1KCG1xUan5-=DBZewvTqmUH=p7=nxy0Va=pdYBhAfYhhjQ@mail.gmail.com>
References: <1596012277-8448-1-git-send-email-weiyi.lu@mediatek.com>
 <1596012277-8448-5-git-send-email-weiyi.lu@mediatek.com>
 <CANMq1KCG1xUan5-=DBZewvTqmUH=p7=nxy0Va=pdYBhAfYhhjQ@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: E7F37730596799C3F49018D181AD9A3F682732CFE65456F2E376CEB7F0DDFEE32000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200811_024337_506059_3EE9F928 
X-CRM114-Status: GOOD (  32.52  )
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

On Wed, 2020-07-29 at 18:58 +0800, Nicolas Boichat wrote:
> On Wed, Jul 29, 2020 at 4:44 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
> >
> > In all MediaTek PLL design, bit0 of CON0 register is always
> > the enable bit.
> > However, there's a special case of usbpll on MT8192.
> > The enable bit of usbpll is moved to bit2 of other register.
> > Add configurable en_reg and pll_en_bit for enable control or
> > default 0 where pll data are static variables.
> > Hence, CON0_BASE_EN could also be removed.
> > And there might have another special case on other chips,
> > the enable bit is still on CON0 register but not at bit0.
> >
> > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> > ---
> >  drivers/clk/mediatek/clk-mtk.h |  2 ++
> >  drivers/clk/mediatek/clk-pll.c | 18 +++++++++++-------
> >  2 files changed, 13 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
> > index c3d6756..810eb97 100644
> > --- a/drivers/clk/mediatek/clk-mtk.h
> > +++ b/drivers/clk/mediatek/clk-mtk.h
> > @@ -233,6 +233,8 @@ struct mtk_pll_data {
> >         uint32_t pcw_chg_reg;
> >         const struct mtk_pll_div_table *div_table;
> >         const char *parent_name;
> > +       uint32_t en_reg;
> > +       uint8_t pll_en_bit;
> >  };
> >
> >  void mtk_clk_register_plls(struct device_node *node,
> > diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
> > index 3c79e1a..1434e99 100644
> > --- a/drivers/clk/mediatek/clk-pll.c
> > +++ b/drivers/clk/mediatek/clk-pll.c
> > @@ -16,7 +16,6 @@
> >  #define REG_CON0               0
> >  #define REG_CON1               4
> >
> > -#define CON0_BASE_EN           BIT(0)
> >  #define CON0_PWR_ON            BIT(0)
> >  #define CON0_ISO_EN            BIT(1)
> >  #define PCW_CHG_MASK           BIT(31)
> > @@ -44,6 +43,7 @@ struct mtk_clk_pll {
> >         void __iomem    *tuner_en_addr;
> >         void __iomem    *pcw_addr;
> >         void __iomem    *pcw_chg_addr;
> > +       void __iomem    *en_addr;
> >         const struct mtk_pll_data *data;
> >  };
> >
> > @@ -56,7 +56,7 @@ static int mtk_pll_is_prepared(struct clk_hw *hw)
> >  {
> >         struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
> >
> > -       return (readl(pll->base_addr + REG_CON0) & CON0_BASE_EN) != 0;
> > +       return (readl(pll->en_addr) & BIT(pll->data->pll_en_bit)) != 0;
> >  }
> >
> >  static unsigned long __mtk_pll_recalc_rate(struct mtk_clk_pll *pll, u32 fin,
> > @@ -247,8 +247,8 @@ static int mtk_pll_prepare(struct clk_hw *hw)
> >         writel(r, pll->pwr_addr);
> >         udelay(1);
> >
> > -       r = readl(pll->base_addr + REG_CON0) | CON0_BASE_EN;
> > -       writel(r, pll->base_addr + REG_CON0);
> > +       r = readl(pll->en_addr) | BIT(pll->data->pll_en_bit);
> > +       writel(r, pll->en_addr);
> >
> >         r = readl(pll->base_addr + REG_CON0) | pll->data->en_mask;
> >         writel(r, pll->base_addr + REG_CON0);
> > @@ -283,9 +283,9 @@ static void mtk_pll_unprepare(struct clk_hw *hw)
> >         r &= ~pll->data->en_mask;
> >         writel(r, pll->base_addr + REG_CON0);
> >
> > -       r = readl(pll->base_addr + REG_CON0);
> > -       r &= ~CON0_BASE_EN;
> > -       writel(r, pll->base_addr + REG_CON0);
> > +       r = readl(pll->en_addr);
> > +       r &= ~BIT(pll->data->pll_en_bit);
> 
> 1 line, but that'll come naturally from the change I requested in the
> previous patch.
> 

OK, I'll put it into one line in previous patch.

> > +       writel(r, pll->en_addr);
> >
> >         r = readl(pll->pwr_addr) | CON0_ISO_EN;
> >         writel(r, pll->pwr_addr);
> > @@ -327,6 +327,10 @@ static struct clk *mtk_clk_register_pll(const struct mtk_pll_data *data,
> >                 pll->tuner_addr = base + data->tuner_reg;
> >         if (data->tuner_en_reg)
> >                 pll->tuner_en_addr = base + data->tuner_en_reg;
> > +       if (data->en_reg)
> > +               pll->en_addr = base + data->en_reg;
> > +       else
> > +               pll->en_addr = pll->base_addr + REG_CON0;
> 
> Don't you need to set pll->data->pll_en_bit to CON0_BASE_EN here?
> (which probably means that you need to add a pll->en_bit field to
> struct mtk_clk_pll)
> 

Because all mtk_clk_pll data are static variables, en_bit would be 0 if
NO value assigned.

r = readl(pll->en_addr) | BIT(pll->data->pll_en_bit);
writel(r, pll->en_addr);


> >         pll->hw.init = &init;
> >         pll->data = data;
> >
> > --
> > 1.8.1.1.dirty
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> https://urldefense.com/v3/__http://lists.infradead.org/mailman/listinfo/linux-mediatek__;!!CTRNKA9wMg0ARbw!2XvAXZuAJJjXV1jAxEzu0cYVZCD7vQmuOtJtwHeW_npFbEIwVSZMMXsTkEXJEAXv$ 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
