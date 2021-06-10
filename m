Return-Path: <SRS0=J0kT=LE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C3EC48BCD
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jun 2021 02:56:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0105C60D07
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jun 2021 02:56:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0105C60D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c7h62KwEekpgMnzuoxJQo7/yIofZAu6l9JNN2rzub+A=; b=WT282VdbugrYnJ
	xgxtQ+3Ur2bBgHROL6eDCphcqkeFYYWr2uZ8bMcyz82UTsFUxWx8eRxZRT23Hwi5vvgA1vD/SIYPT
	GdkzvypoxYKXcWxvvGUAD2OKyp1w4PbGV4+UXZ1BD/WZiIybigckoUeLncFopV+1jOBNqxU0LLVS1
	dBhMz9vdGkLpK1NkyuMLroweWplx4mE516oGDrHTPzd2CScmuXVgJHjDaCviCsJFTIFTI0sx5domA
	UvV4x1Ihus2AcBf3NM95Nd6ruqKXBO8GmVl6yiqmKJg0xtb7YYg4XAXyUXPNqHV8agP/nIIi1cTBM
	ropd1yXFQksKbQZRuyJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrApk-00GZ9L-VQ; Thu, 10 Jun 2021 02:54:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrApS-00GZ5J-8o; Thu, 10 Jun 2021 02:53:59 +0000
X-UUID: 5d36d9481b4546d79df3b2800b9fc54a-20210609
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=5vOS/Pawx2igF/OjJqE41kmDlZ4xFVZV9zAtz+OMj9U=; 
 b=egw/okHwtRyMn7wM/Ksfw3mYbZCqr3TYKsNgb+CtzNNDPizLeXvuvu/H/Sgt1u23kPW6XIdloQW9COn0D5nk1strAcSgHsfr2YsckBpFfwBN0YioqBC6Vt5W2Tdp4I7FdDg4W2amMp8hNdG17XAlKmnZPhgdRwDeWcNArHzH4XQ=;
X-UUID: 5d36d9481b4546d79df3b2800b9fc54a-20210609
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <james.lo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 961521324; Wed, 09 Jun 2021 19:53:53 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Jun 2021 19:44:14 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Jun 2021 10:44:12 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Jun 2021 10:44:12 +0800
Message-ID: <2a117e5fe9fe0ece39e9165a463082ef42be973f.camel@mediatek.com>
Subject: Re: [PATCH 2/2] soc: mediatek: pwrap: add pwrap driver for MT8195 SoC
From: James Lo <james.lo@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Fei Shao <fshao@chromium.org>
CC: Sascha Hauer <s.hauer@pengutronix.de>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Henry Chen <henryc.chen@mediatek.com>
Date: Thu, 10 Jun 2021 10:44:12 +0800
In-Reply-To: <87ab50ff-bae3-b2a3-1e54-642cdce3600d@gmail.com>
References: <20210602112050.12338-1-james.lo@mediatek.com>
 <20210602112050.12338-3-james.lo@mediatek.com>
 <CAC=S1nhUB=6y1SXUvAuhdj69S36FQnp9nr9V65TtS72pxuoRTg@mail.gmail.com>
 <87ab50ff-bae3-b2a3-1e54-642cdce3600d@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_195358_339133_AAE4B8A8 
X-CRM114-Status: GOOD (  22.93  )
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

On Wed, 2021-06-09 at 10:06 +0200, Matthias Brugger wrote:
> 
> On 09/06/2021 09:51, Fei Shao wrote:
> > On Wed, Jun 2, 2021 at 7:21 PM James Lo <james.lo@mediatek.com>
> > wrote:
> > > 
> > > From: Henry Chen <henryc.chen@mediatek.com>
> > > 
> > > MT8195 are highly integrated SoC and use PMIC_MT6359 for
> > > power management. This patch adds pwrap master driver to
> > > access PMIC_MT6359.
> > > 
> > > Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
> > > ---
> > >  drivers/soc/mediatek/mtk-pmic-wrap.c | 35
> > > ++++++++++++++++++++++++++++
> > >  1 file changed, 35 insertions(+)
> > > 
> > > diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c
> > > b/drivers/soc/mediatek/mtk-pmic-wrap.c
> > > index e4de75f35c33..952bc554f443 100644
> > > --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> > > +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> > > @@ -961,6 +961,23 @@ static int mt8183_regs[] = {
> > >         [PWRAP_WACS2_VLDCLR] =                  0xC28,
> > >  };
> > > 
> > > +static int mt8195_regs[] = {
> > > +       [PWRAP_INIT_DONE2] =            0x0,
> > > +       [PWRAP_STAUPD_CTRL] =           0x4C,
> > > +       [PWRAP_TIMER_EN] =              0x3E4,
> > > +       [PWRAP_INT_EN] =                0x420,
> > > +       [PWRAP_INT_FLG] =               0x428,
> > > +       [PWRAP_INT_CLR] =               0x42C,
> > > +       [PWRAP_INT1_EN] =               0x450,
> > > +       [PWRAP_INT1_FLG] =              0x458,
> > > +       [PWRAP_INT1_CLR] =              0x45C,
> > > +       [PWRAP_WACS2_CMD] =             0x880,
> > > +       [PWRAP_SWINF_2_WDATA_31_0] =    0x884,
> > > +       [PWRAP_SWINF_2_RDATA_31_0] =    0x894,
> > > +       [PWRAP_WACS2_VLDCLR] =          0x8A4,
> > > +       [PWRAP_WACS2_RDATA] =           0x8A8,
> > > +};
> > > +
> > >  static int mt8516_regs[] = {
> > >         [PWRAP_MUX_SEL] =               0x0,
> > >         [PWRAP_WRAP_EN] =               0x4,
> > > @@ -1066,6 +1083,7 @@ enum pwrap_type {
> > >         PWRAP_MT8135,
> > >         PWRAP_MT8173,
> > >         PWRAP_MT8183,
> > > +       PWRAP_MT8195,
> > >         PWRAP_MT8516,
> > >  };
> > > 
> > > @@ -1525,6 +1543,7 @@ static int pwrap_init_cipher(struct
> > > pmic_wrapper *wrp)
> > >                 break;
> > >         case PWRAP_MT6873:
> > >         case PWRAP_MT8183:
> > > +       case PWRAP_MT8195:
> > >                 break;
> > >         }
> > > 
> > > @@ -2025,6 +2044,19 @@ static const struct pmic_wrapper_type
> > > pwrap_mt8183 = {
> > >         .init_soc_specific = pwrap_mt8183_init_soc_specific,
> > >  };
> > > 
> > > +static struct pmic_wrapper_type pwrap_mt8195 = {
> > > +       .regs = mt8195_regs,
> > > +       .type = PWRAP_MT8195,
> > > +       .arb_en_all = 0x777f, /* NEED CONFIRM */
> > > +       .int_en_all = 0x180000, /* NEED CONFIRM */
> > 
> > Please get the confirmative values here then send the next patch,
> > thanks.
> > 
> 
> Yes please. You can send this as a follow-up patch, otherwise I'd
> need to remove
> this from my queue, as I have overseen the fact that not all values
> are confirmed.
> 
> Regards,
> Matthias

All values are confirmed and sorry for I forget to remove those
comments. Could you please help us to remove those comments ?

Before :
.arb_en_all = 0x777f, /* NEED CONFIRM */
.int_en_all = 0x180000, /* NEED CONFIRM */

After :
.arb_en_all = 0x777f,
.int_en_all = 0x180000,

Many thanks
James Lo
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
