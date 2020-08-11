Return-Path: <SRS0=N3vC=BV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF19AC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Aug 2020 09:31:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5AAE20756
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Aug 2020 09:31:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M9V8/eY7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hgn0caVL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5AAE20756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=G/bYk6PhwJFhzVRWuM5+zEZeZN5TsQUCYeK6Dw6PMtQ=; b=M9V8/eY7uErwj6PlKJe2O7xfb
	8vifXVvkIEanwvjwMa95calGS2QluZt1IXA81niWMAnLV1Ct6Ayx6KFTg+mopgEQhnbkKY5t+NI+J
	GuXDZa7pc8uc3fzBDkPNMHQ58ZXTzcJ9HZHM6dSUs/2+K3ZU+kHMRmdpcY0Qqg28Wg2iwPUpEMET1
	Dpvt7vt8q+PJR62tmC6eS7HS0Z5wGRDJ7YwEzVLpfRYn5yT/HWPbhsbWSqqBH5r54kJQ0bnBcVOtl
	WeAfmH/XmFp6KXEo8DTQ4z/SgaATaxpEL+DOulyfwXggM750/DzlJ0PVRU/Ulyl2I5O5fpZ51VhTD
	QmMKidsCg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5Qcu-0007sB-Pd; Tue, 11 Aug 2020 09:31:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5Qcs-0007l7-P5; Tue, 11 Aug 2020 09:31:23 +0000
X-UUID: ec0a8e57a5e04c9c9edc3e239bda4b31-20200811
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=LWDEjtdpEZqIYB3lBtQtiTu+w5fRLhiQKXt5bfWHeOk=; 
 b=hgn0caVL0H9yorhFgwrm9TR6ii6nQFW45cj/ReZcDNUDCVHkN4IJpwoFkRZTYYKlEXCeC3t61efCk0PBpGhNAHPzZehtsqpOgq4t0BkZqjFnAslSVnAb1o7nEFjbDvmGYOByEH6/9IaYLRuj78lgmtH2dViukh9fpbyq8gobDQk=;
X-UUID: ec0a8e57a5e04c9c9edc3e239bda4b31-20200811
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1641908497; Tue, 11 Aug 2020 01:31:17 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 11 Aug 2020 02:31:15 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 11 Aug 2020 17:31:06 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 11 Aug 2020 17:31:06 +0800
Message-ID: <1597138267.20627.28.camel@mtksdaap41>
Subject: Re: [PATCH v2 4/5] clk: mediatek: Add configurable enable control
 to mtk_pll_data
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 11 Aug 2020 17:31:07 +0800
In-Reply-To: <CANMq1KDRwwFvR2v6ykpvV6Y72L+Ym+4NcZF0F7wYq2znKy4sqw@mail.gmail.com>
References: <1596012277-8448-1-git-send-email-weiyi.lu@mediatek.com>
 <1596012277-8448-5-git-send-email-weiyi.lu@mediatek.com>
 <CANMq1KCG1xUan5-=DBZewvTqmUH=p7=nxy0Va=pdYBhAfYhhjQ@mail.gmail.com>
 <1597128205.20627.14.camel@mtksdaap41>
 <CANMq1KDRwwFvR2v6ykpvV6Y72L+Ym+4NcZF0F7wYq2znKy4sqw@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: C318D15809A2BCF17A1D3E5347528148A4B325AC6D742D76ADABC327B94E44312000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200811_053122_952510_1BF41F1A 
X-CRM114-Status: GOOD (  16.88  )
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

On Tue, 2020-08-11 at 15:28 +0800, Nicolas Boichat wrote:
> On Tue, Aug 11, 2020 at 2:43 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
> > [...]
> > > > +       writel(r, pll->en_addr);
> > > >
> > > >         r = readl(pll->pwr_addr) | CON0_ISO_EN;
> > > >         writel(r, pll->pwr_addr);
> > > > @@ -327,6 +327,10 @@ static struct clk *mtk_clk_register_pll(const struct mtk_pll_data *data,
> > > >                 pll->tuner_addr = base + data->tuner_reg;
> > > >         if (data->tuner_en_reg)
> > > >                 pll->tuner_en_addr = base + data->tuner_en_reg;
> > > > +       if (data->en_reg)
> > > > +               pll->en_addr = base + data->en_reg;
> > > > +       else
> > > > +               pll->en_addr = pll->base_addr + REG_CON0;
> > >
> > > Don't you need to set pll->data->pll_en_bit to CON0_BASE_EN here?
> > > (which probably means that you need to add a pll->en_bit field to
> > > struct mtk_clk_pll)
> > >
> >
> > Because all mtk_clk_pll data are static variables, en_bit would be 0 if
> > NO value assigned.
> 
> Wow, you're right, but this is a little bit subtle. I wonder if it's
> worth adding a small comment? (either here or in struct mtk_pll_data)

OK, I'll add comment for en_bit

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
