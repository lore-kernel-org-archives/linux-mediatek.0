Return-Path: <SRS0=NOVl=GJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 265BEC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 11:17:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B29D52226A
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 11:17:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B29D52226A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IARapJSFx5Sev6feTBPn6h6+Jsg6lUtk5tDYc+6k5zM=; b=gpJ3+oH0tZJRiqZICLraM14Fh
	qnahTKVXLYVRRenC0P/ZGBeh7eak/K4TSlaEQeu+9eI6NtpfIhmFHBkmYcK+9n07DArG4ltpNTJEd
	u5SN7KI3U/bisRE4OxEQowMA7fnADu5T/+ip8Y/8u1z7HUNJvMlz3l5sr66aXBASb+8auDBhj6b0L
	byqdh9KdlrXkq9AC/9paqPg3NZzG39K9HrBLsp1zMskJ1sscKFfelLbxNkmOEF2+EZLW0BaMw1MbR
	C5mkn4tU0rmtqvKxAXtc536GY5CKx7zzjOkr48SL9jQXkmFpIkYRQ3fWZXGxbGKKfa+JmWwV1ZTwt
	nKnx1MQYQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kx6o4-0000la-4b; Wed, 06 Jan 2021 11:16:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kx6o1-0000l5-Id
 for linux-mediatek@lists.infradead.org; Wed, 06 Jan 2021 11:16:47 +0000
X-UUID: 6380dd5931ed4113b59db1246e0bc05d-20210106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=n9cbyTnLxMK+R+ro/xTvxzqRxwAZT51mv8Otnd9uK/Y=; 
 b=bbGPQgQpyjq4Ob11BULScowhutP2Mhwizlr41zt9cQTaIBr5NXgvgoshdLKJVAHxWcrcOBYXJNo9AljkOGx96Us/pNxVtVgpgLh3H3PVPfV7vfA0B8jXX+JOj8zYrnYJGA1OL909eux77UtV1FriViQvEtK/zb4SyGIsfXCEsU0=;
X-UUID: 6380dd5931ed4113b59db1246e0bc05d-20210106
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1980525580; Wed, 06 Jan 2021 03:16:40 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Jan 2021 03:06:38 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Jan 2021 19:06:36 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 6 Jan 2021 19:06:36 +0800
Message-ID: <1609931196.30620.3.camel@mtksdaap41>
Subject: Re: [PATCH v6 10/22] clk: mediatek: Add MT8192 basic clocks support
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Ikjoon Jang <ikjn@chromium.org>
Date: Wed, 6 Jan 2021 19:06:36 +0800
In-Reply-To: <CAATdQgBJ7EVRJW7iJG63yW89fh5skpe9-UCd4pdZystV_JrvCg@mail.gmail.com>
References: <1608642587-15634-1-git-send-email-weiyi.lu@mediatek.com>
 <1608642587-15634-11-git-send-email-weiyi.lu@mediatek.com>
 <CAATdQgC_BnZywDxaZgmF72VRoAZ-1vFGrPD9GL4uEBhsKQTxnQ@mail.gmail.com>
 <1609929721.7491.3.camel@mtksdaap41>
 <CAATdQgBJ7EVRJW7iJG63yW89fh5skpe9-UCd4pdZystV_JrvCg@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_061645_832650_2C7F3667 
X-CRM114-Status: GOOD (  20.02  )
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
 Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2021-01-06 at 18:52 +0800, Ikjoon Jang wrote:
> On Wed, Jan 6, 2021 at 6:42 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
> >
> > On Wed, 2021-01-06 at 18:25 +0800, Ikjoon Jang wrote:
> > > On Tue, Dec 22, 2020 at 9:14 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
> > > >
> > > > Add MT8192 basic clock providers, include topckgen, apmixedsys,
> > > > infracfg and pericfg.
> > > >
> > > > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> > > > ---
> > > >  drivers/clk/mediatek/Kconfig      |    8 +
> > > >  drivers/clk/mediatek/Makefile     |    1 +
> > > >  drivers/clk/mediatek/clk-mt8192.c | 1326 +++++++++++++++++++++++++++++++++++++
> > > >  drivers/clk/mediatek/clk-mux.h    |   15 +
> > > >  4 files changed, 1350 insertions(+)
> > > >  create mode 100644 drivers/clk/mediatek/clk-mt8192.c
> > > >
> > >
> > > <snip>
> > >
> > > > diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mux.h
> > > > index f5625f4..afbc7df 100644
> > > > --- a/drivers/clk/mediatek/clk-mux.h
> > > > +++ b/drivers/clk/mediatek/clk-mux.h
> > > > @@ -77,6 +77,21 @@ struct mtk_mux {
> > > >                         _width, _gate, _upd_ofs, _upd,                  \
> > > >                         CLK_SET_RATE_PARENT)
> > > >
> > > > +#define MUX_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,          \
> > > > +                       _mux_set_ofs, _mux_clr_ofs, _shift, _width,     \
> > > > +                       _upd_ofs, _upd, _flags)                         \
> > > > +               GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,  \
> > > > +                       _mux_set_ofs, _mux_clr_ofs, _shift, _width,     \
> > > > +                       0, _upd_ofs, _upd, _flags,                      \
> > > > +                       mtk_mux_clr_set_upd_ops)
> > > > +
> > > > +#define MUX_CLR_SET_UPD(_id, _name, _parents, _mux_ofs,                        \
> > > > +                       _mux_set_ofs, _mux_clr_ofs, _shift, _width,     \
> > > > +                       _upd_ofs, _upd)                                 \
> > > > +               MUX_CLR_SET_UPD_FLAGS(_id, _name, _parents,             \
> > > > +                       _mux_ofs, _mux_set_ofs, _mux_clr_ofs, _shift,   \
> > > > +                       _width, _upd_ofs, _upd, CLK_SET_RATE_PARENT)
> > > > +
> > >
> > > conflicts, these macros are already existed in upstream.
> >
> > really? These two macros don't show up in 5.11-rc1 yet.
> 
> yep, maybe this one: a3ae549917f1 "clk: mediatek: Add new clkmux register API"
> 

The new macros in this patch are for the clock MUX without gate control.
It's a little different from those mux macros with gate control in
a3ae549917f1 "clk: mediatek: Add new clkmux register API"

> >
> > > >  struct clk *mtk_clk_register_mux(const struct mtk_mux *mux,
> > > >                                  struct regmap *regmap,
> > > >                                  spinlock_t *lock);
> > > > --
> > > > 1.8.1.1.dirty
> > > > _______________________________________________
> > > > Linux-mediatek mailing list
> > > > Linux-mediatek@lists.infradead.org
> > > > http://lists.infradead.org/mailman/listinfo/linux-mediatek
> >
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
