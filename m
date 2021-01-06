Return-Path: <SRS0=NOVl=GJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 232E3C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 10:53:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEC7523105
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 10:53:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEC7523105
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5nmHbPgcoSyf6Sh9Nl7dlrIuCrd4OuwK12hBHNRsPc0=; b=wjd4rDEPvnh9+P77NaAhaKL2f
	bLPwnYcSilYq1fAUTom2yNFtZXPGTuX6+heMz8TkGun5ipJPZaHoC64RvT1yY/EP2Q3SZyrFZhEuA
	igJcncPHLHXocDeImlarMuVZtaoKIdpHafgH/MFNgmJUqIL61g/psy37NJrxKe0LhMJE0fFn3ES10
	H/UHkv/vOTL57i0oZgV+o5ekU7YZ3XZ5XWbuS08Iz3U/CYgeHDpAvvos50xPsU43j913Wo0Iag45j
	xSwX+fj5yXlAbd78E9v70geZXHDaN4Nz//Zi8ozr2Gf9llAtORvxSnlGNDsUjl+rRAm89b0lac/SI
	+37Mv0PLg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kx6R2-0005Gl-Oo; Wed, 06 Jan 2021 10:53:00 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kx6R0-0005G8-Ds
 for linux-mediatek@lists.infradead.org; Wed, 06 Jan 2021 10:52:59 +0000
Received: by mail-pf1-x432.google.com with SMTP id s21so1474486pfu.13
 for <linux-mediatek@lists.infradead.org>; Wed, 06 Jan 2021 02:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RdSuS4O3pgsSJDubp0Sdbb5PmZnWqekG9GBR9kGQ6Ms=;
 b=Kkk0SFcPdHzsvopRV3ywd32zskF+b41A2+GSBLD4vIOcmgLkZq+LhQnas7D7pNccPA
 /1e13dclIvT7koa2EYcOwCp3M+2hoQ/Ip+uJEvlMJVRGMZXDiR6BZk1aKoyVtqLb/TD9
 2TBQlUSZzI3D8atLNOZsK6C/cs0dXMUwF2pDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RdSuS4O3pgsSJDubp0Sdbb5PmZnWqekG9GBR9kGQ6Ms=;
 b=uMlo5LiYkpEvlAXnPZTpBckdM6q+hQy9Lqff3RdfZFlJxh1vqq9yB/Ysjh4SFfAS+i
 ao7NcZTDaB15gpjm9T8Sivsrny5FQ6jPPDsMsZhA064C4t1q7CeZK3ap+c9kGuuYPNBq
 cf6o/y1RQOB3y+En8YN0ST7j+ZLZ+gI/vw7wPQ3Tdr5p+QyOHaoi6Ro7yqjh6Uj/dqCm
 pFC4OqwhP5ZoPw+NK4E6/sx3L0oMXajeN/8dnU+8wvn92wQxhDAVR85PFIyf0GagbkxO
 7Mvrxjyixq57YjsVjBDUU1OgDAGCkPXMXZDGK1fWczCV+SsFXCMpHbImVZXGoS/6qX/E
 AZXg==
X-Gm-Message-State: AOAM5310cq91zX6CHGf7FXlKDPdK34rC0Apf5unb/3P35TTvq/9oSGFe
 1Lg1L73BC0qKr7jGZvI0jB9V5ReURnD+MUbwn8mGCA==
X-Google-Smtp-Source: ABdhPJxV68VpE5c0N4JWMEzUiOtNfP5BS+xplG/O+2joyxL835C9qEqKNNOFQejs7OTi68aJybpnHBGk4DGiAN9ODWo=
X-Received: by 2002:a63:1a10:: with SMTP id a16mr3806685pga.317.1609930375833; 
 Wed, 06 Jan 2021 02:52:55 -0800 (PST)
MIME-Version: 1.0
References: <1608642587-15634-1-git-send-email-weiyi.lu@mediatek.com>
 <1608642587-15634-11-git-send-email-weiyi.lu@mediatek.com>
 <CAATdQgC_BnZywDxaZgmF72VRoAZ-1vFGrPD9GL4uEBhsKQTxnQ@mail.gmail.com>
 <1609929721.7491.3.camel@mtksdaap41>
In-Reply-To: <1609929721.7491.3.camel@mtksdaap41>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Wed, 6 Jan 2021 18:52:45 +0800
Message-ID: <CAATdQgBJ7EVRJW7iJG63yW89fh5skpe9-UCd4pdZystV_JrvCg@mail.gmail.com>
Subject: Re: [PATCH v6 10/22] clk: mediatek: Add MT8192 basic clocks support
To: Weiyi Lu <weiyi.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_055258_493921_F546987E 
X-CRM114-Status: GOOD (  18.47  )
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
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jan 6, 2021 at 6:42 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
>
> On Wed, 2021-01-06 at 18:25 +0800, Ikjoon Jang wrote:
> > On Tue, Dec 22, 2020 at 9:14 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
> > >
> > > Add MT8192 basic clock providers, include topckgen, apmixedsys,
> > > infracfg and pericfg.
> > >
> > > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> > > ---
> > >  drivers/clk/mediatek/Kconfig      |    8 +
> > >  drivers/clk/mediatek/Makefile     |    1 +
> > >  drivers/clk/mediatek/clk-mt8192.c | 1326 +++++++++++++++++++++++++++++++++++++
> > >  drivers/clk/mediatek/clk-mux.h    |   15 +
> > >  4 files changed, 1350 insertions(+)
> > >  create mode 100644 drivers/clk/mediatek/clk-mt8192.c
> > >
> >
> > <snip>
> >
> > > diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mux.h
> > > index f5625f4..afbc7df 100644
> > > --- a/drivers/clk/mediatek/clk-mux.h
> > > +++ b/drivers/clk/mediatek/clk-mux.h
> > > @@ -77,6 +77,21 @@ struct mtk_mux {
> > >                         _width, _gate, _upd_ofs, _upd,                  \
> > >                         CLK_SET_RATE_PARENT)
> > >
> > > +#define MUX_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,          \
> > > +                       _mux_set_ofs, _mux_clr_ofs, _shift, _width,     \
> > > +                       _upd_ofs, _upd, _flags)                         \
> > > +               GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,  \
> > > +                       _mux_set_ofs, _mux_clr_ofs, _shift, _width,     \
> > > +                       0, _upd_ofs, _upd, _flags,                      \
> > > +                       mtk_mux_clr_set_upd_ops)
> > > +
> > > +#define MUX_CLR_SET_UPD(_id, _name, _parents, _mux_ofs,                        \
> > > +                       _mux_set_ofs, _mux_clr_ofs, _shift, _width,     \
> > > +                       _upd_ofs, _upd)                                 \
> > > +               MUX_CLR_SET_UPD_FLAGS(_id, _name, _parents,             \
> > > +                       _mux_ofs, _mux_set_ofs, _mux_clr_ofs, _shift,   \
> > > +                       _width, _upd_ofs, _upd, CLK_SET_RATE_PARENT)
> > > +
> >
> > conflicts, these macros are already existed in upstream.
>
> really? These two macros don't show up in 5.11-rc1 yet.

yep, maybe this one: a3ae549917f1 "clk: mediatek: Add new clkmux register API"

>
> > >  struct clk *mtk_clk_register_mux(const struct mtk_mux *mux,
> > >                                  struct regmap *regmap,
> > >                                  spinlock_t *lock);
> > > --
> > > 1.8.1.1.dirty
> > > _______________________________________________
> > > Linux-mediatek mailing list
> > > Linux-mediatek@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-mediatek
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
