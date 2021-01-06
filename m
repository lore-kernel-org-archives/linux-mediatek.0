Return-Path: <SRS0=NOVl=GJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89866C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 10:42:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25FA72310E
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 10:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25FA72310E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PvOTPEFeZXPN1eM2Xlb3HTKOgDP4+meSduByq4hHD0k=; b=rRG6FQXFmE6NNv+xv66Q6Z4vW
	jB+/WJYDDqvw4iw0PfpOkN4Y0dgfLq34Gp1JTaKd0bvEapAFKhv4ePexLXUpY5tweN8EEaj7ou2WC
	kvTFOIS0k6NG2lcd0rM9saU5EN35T9RsCwP4B6xTEBPk1w5tWtxaYYeqGOaMzXNaVzaCIMP+OFelh
	36GagdASZhHY0j7R7ThAIsp3pGLtYoEjJGlyCz0/x2NyWNhE5iqdEij8B+YTiS9zt/9H4D4jcqBe9
	4gbtNcBDN/LwzA06vEQFOcYpVJesIaK87mCx/Wrwcv80BFh87ppJX7ofgXEmxS2xCCRfoNJoTXwO4
	FmfrUgvjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kx6Ge-0003iR-9f; Wed, 06 Jan 2021 10:42:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kx6GZ-0003gX-1u; Wed, 06 Jan 2021 10:42:13 +0000
X-UUID: 3cdae2c755244519ab717109e5956271-20210106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=obJsRp4li4LM696iejTA2k4GIuIA3Rb79c+L7Cz67Y0=; 
 b=JjRjcQVa6+UnP8ICTmfhswTOWraO55QqRqPYiYf0acUIE9eucS4La8NChCIA8pf+jVaaQ8WsqjnaWT9QESRbC7rYlg57wmIQcXEfz0aOChk+G+vFMCT5PDHWZPrp9tnpVx97k92ip7lFxXCiH04f8En7bzKrVm+W9WdBylGh14M=;
X-UUID: 3cdae2c755244519ab717109e5956271-20210106
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 931412808; Wed, 06 Jan 2021 02:42:04 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Jan 2021 02:42:02 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Jan 2021 18:42:01 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 6 Jan 2021 18:42:01 +0800
Message-ID: <1609929721.7491.3.camel@mtksdaap41>
Subject: Re: [PATCH v6 10/22] clk: mediatek: Add MT8192 basic clocks support
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Ikjoon Jang <ikjn@chromium.org>
Date: Wed, 6 Jan 2021 18:42:01 +0800
In-Reply-To: <CAATdQgC_BnZywDxaZgmF72VRoAZ-1vFGrPD9GL4uEBhsKQTxnQ@mail.gmail.com>
References: <1608642587-15634-1-git-send-email-weiyi.lu@mediatek.com>
 <1608642587-15634-11-git-send-email-weiyi.lu@mediatek.com>
 <CAATdQgC_BnZywDxaZgmF72VRoAZ-1vFGrPD9GL4uEBhsKQTxnQ@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_054211_922577_0614FC86 
X-CRM114-Status: GOOD (  17.31  )
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
 srv_heupstream <srv_heupstream@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2021-01-06 at 18:25 +0800, Ikjoon Jang wrote:
> On Tue, Dec 22, 2020 at 9:14 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
> >
> > Add MT8192 basic clock providers, include topckgen, apmixedsys,
> > infracfg and pericfg.
> >
> > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> > ---
> >  drivers/clk/mediatek/Kconfig      |    8 +
> >  drivers/clk/mediatek/Makefile     |    1 +
> >  drivers/clk/mediatek/clk-mt8192.c | 1326 +++++++++++++++++++++++++++++++++++++
> >  drivers/clk/mediatek/clk-mux.h    |   15 +
> >  4 files changed, 1350 insertions(+)
> >  create mode 100644 drivers/clk/mediatek/clk-mt8192.c
> >
> 
> <snip>
> 
> > diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mux.h
> > index f5625f4..afbc7df 100644
> > --- a/drivers/clk/mediatek/clk-mux.h
> > +++ b/drivers/clk/mediatek/clk-mux.h
> > @@ -77,6 +77,21 @@ struct mtk_mux {
> >                         _width, _gate, _upd_ofs, _upd,                  \
> >                         CLK_SET_RATE_PARENT)
> >
> > +#define MUX_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,          \
> > +                       _mux_set_ofs, _mux_clr_ofs, _shift, _width,     \
> > +                       _upd_ofs, _upd, _flags)                         \
> > +               GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,  \
> > +                       _mux_set_ofs, _mux_clr_ofs, _shift, _width,     \
> > +                       0, _upd_ofs, _upd, _flags,                      \
> > +                       mtk_mux_clr_set_upd_ops)
> > +
> > +#define MUX_CLR_SET_UPD(_id, _name, _parents, _mux_ofs,                        \
> > +                       _mux_set_ofs, _mux_clr_ofs, _shift, _width,     \
> > +                       _upd_ofs, _upd)                                 \
> > +               MUX_CLR_SET_UPD_FLAGS(_id, _name, _parents,             \
> > +                       _mux_ofs, _mux_set_ofs, _mux_clr_ofs, _shift,   \
> > +                       _width, _upd_ofs, _upd, CLK_SET_RATE_PARENT)
> > +
> 
> conflicts, these macros are already existed in upstream.

really? These two macros don't show up in 5.11-rc1 yet.

> >  struct clk *mtk_clk_register_mux(const struct mtk_mux *mux,
> >                                  struct regmap *regmap,
> >                                  spinlock_t *lock);
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
