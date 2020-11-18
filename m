Return-Path: <SRS0=HQvY=EY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B28C5519F
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 05:25:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B35D24654
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 05:25:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0ilil+Xk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="OYZ6bTBv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B35D24654
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+S0zboBZ8WwLXsPhE/juAfJh/errQAO5Yj6F7w7VL74=; b=0ilil+XkG+DnZu+Mt/vLudMkk
	5njMnfVwTlW20X9eFJq6YVutG5AhesiCxSUeeJdB0cCk9iJaQR3k69jfdnYwjUveT5e8ZccyAPrLP
	SUTFDg9xbMPhasVUwxlvigRq2lAkpdKltAquPVudfr6KgLrcO9pxKs4TZzbHYRTTrHeycSa0lponl
	UZlOAjCnC3mo7H6/u4FLKUX50svrMDy+r4exD1kPJYt08mRlpTsHGHZ8RvhfpDUboqkQU1qy8wYaH
	OlHaeB9exPe88gCGeHXpJjLerfWKZV9K1qnyr22mFRv6QklRnpg8/Jzm8YtmIzwSgq3/el3Q+3kto
	NYYWNFxSA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfFyR-0006QA-7U; Wed, 18 Nov 2020 05:25:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfFyM-0006PJ-Dy; Wed, 18 Nov 2020 05:25:40 +0000
X-UUID: e516ba72867e4879a7a54b832209cae8-20201117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=+7P9mBeoEEXeFr17rEhjdhoY8h80YhME3cFw6QX94Yo=; 
 b=OYZ6bTBvthc3CVK4qpWDbtD4SluNHm7XEYq4AdgvRvnjQSP4xy9zNowdX6go8bhTrWnk2e6sN1N/Dy1G8S9Zn+axwbUJrDC/SfjRJDn4KpiEl4hJzlaKuGt9oUl9oiZbtB4dIlWsvx5qEVIuvhHLW/Fgl4eS6olGodkxiE/GgGA=;
X-UUID: e516ba72867e4879a7a54b832209cae8-20201117
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 747873400; Tue, 17 Nov 2020 21:25:32 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 Nov 2020 21:21:41 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Nov 2020 13:21:41 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 18 Nov 2020 13:21:40 +0800
Message-ID: <1605676900.25459.2.camel@mtksdaap41>
Subject: Re: [PATCH v5 07/24] clk: mediatek: Fix asymmetrical PLL enable and
 disable control
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Ikjoon Jang <ikjn@chromium.org>
Date: Wed, 18 Nov 2020 13:21:40 +0800
In-Reply-To: <20201118035502.GB1049148@chromium.org>
References: <1604887429-29445-1-git-send-email-weiyi.lu@mediatek.com>
 <1604887429-29445-8-git-send-email-weiyi.lu@mediatek.com>
 <20201118035502.GB1049148@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_002538_625470_04ADB11F 
X-CRM114-Status: GOOD (  27.56  )
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
Cc: Rob Herring <robh@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream@mediatek.com, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-11-18 at 11:55 +0800, Ikjoon Jang wrote:
> On Mon, Nov 09, 2020 at 10:03:32AM +0800, Weiyi Lu wrote:
> > In fact, the en_mask is a combination of divider enable mask
> > and pll enable bit(bit0).
> > Before this patch, we enabled both divider mask and bit0 in prepare(),
> > but only cleared the bit0 in unprepare().
> > In the future, we hope en_mask will only be used as divider enable mask.
> > The enable register(CON0) will be set in 2 steps:
> > first is divider mask, and then bit0 during prepare(), and vice versa.
> > But considering backward compatibility, at this stage we allow en_mask
> > to be a combination or a pure divider enable mask.
> > And then we will make en_mask a pure divider enable mask in another
> > following patch series.
> 
> I have a question on this: Are there any possible problems on controlling
> divider_en and bit0 at the same time? Or is this only for cleanups?
> 

Yes, this is only for cleanups and controlling divider_en and bit0 at
the same time will not cause any problem.

> If mtk_pll_data::en_mask is not allowed to control with bit0 together,
> I guess register_pll() also needs to check en_mask::bit0 is cleared?
> 
> > 
> > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> > ---
> >  drivers/clk/mediatek/clk-pll.c | 20 ++++++++++++++++----
> >  1 file changed, 16 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
> > index f440f2cd..11ed5d1 100644
> > --- a/drivers/clk/mediatek/clk-pll.c
> > +++ b/drivers/clk/mediatek/clk-pll.c
> > @@ -238,6 +238,7 @@ static int mtk_pll_prepare(struct clk_hw *hw)
> >  {
> >  	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
> >  	u32 r;
> > +	u32 div_en_mask;
> >  
> >  	r = readl(pll->pwr_addr) | CON0_PWR_ON;
> >  	writel(r, pll->pwr_addr);
> > @@ -247,10 +248,15 @@ static int mtk_pll_prepare(struct clk_hw *hw)
> >  	writel(r, pll->pwr_addr);
> >  	udelay(1);
> >  
> > -	r = readl(pll->base_addr + REG_CON0);
> > -	r |= pll->data->en_mask;
> > +	r = readl(pll->base_addr + REG_CON0) | CON0_BASE_EN;
> >  	writel(r, pll->base_addr + REG_CON0);
> >  
> > +	div_en_mask = pll->data->en_mask & ~CON0_BASE_EN;
> > +	if (div_en_mask) {
> > +		r = readl(pll->base_addr + REG_CON0) | div_en_mask;
> > +		writel(r, pll->base_addr + REG_CON0);
> > +	}
> > +
> >  	__mtk_pll_tuner_enable(pll);
> >  
> >  	udelay(20);
> > @@ -268,6 +274,7 @@ static void mtk_pll_unprepare(struct clk_hw *hw)
> >  {
> >  	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
> >  	u32 r;
> > +	u32 div_en_mask;
> >  
> >  	if (pll->data->flags & HAVE_RST_BAR) {
> >  		r = readl(pll->base_addr + REG_CON0);
> > @@ -277,8 +284,13 @@ static void mtk_pll_unprepare(struct clk_hw *hw)
> >  
> >  	__mtk_pll_tuner_disable(pll);
> >  
> > -	r = readl(pll->base_addr + REG_CON0);
> > -	r &= ~CON0_BASE_EN;
> > +	div_en_mask = pll->data->en_mask & ~CON0_BASE_EN;
> > +	if (div_en_mask) {
> > +		r = readl(pll->base_addr + REG_CON0) & ~div_en_mask;
> > +		writel(r, pll->base_addr + REG_CON0);
> > +	}
> > +
> > +	r = readl(pll->base_addr + REG_CON0) & ~CON0_BASE_EN;
> >  	writel(r, pll->base_addr + REG_CON0);
> >  
> >  	r = readl(pll->pwr_addr) | CON0_ISO_EN;
> > -- 
> > 1.8.1.1.dirty
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
