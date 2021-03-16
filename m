Return-Path: <SRS0=yOeO=IO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78970C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 06:10:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E2BF65124
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 06:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E2BF65124
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VImcAmaBgTEIzApO9AG9I2fX3LPQVjZjDfKR2upKsoI=; b=Kqee8MUWdiEfTsmjqOdqrpn3b
	z53OF6C3DxvZnZJKdGPV5wmzODvCP5X8F8HEHLR87leCaaSFquDuh8GQTb9p4yQVp5JtN5OP7SbgZ
	NekxM9TVZKK6UwuWV1Dz8ErSUAXZnrcn/lPNazRo2yR+sMRqfz8AAH75WbZqTmLXLhGj91JD5Mkfw
	CArx8i3Buw2QhY+oJE5UV4hrOvpP/0q9Y6KtVbO8JJioEV8c8YnuBQkBY7k1MptA43ReB3tC2vshv
	tYY068/PaD3cSjfmKohi/cEGdCeUInBY891fYnmzVUgZKEeO7/qP1HSlXKOUQR44BW/bDuYM1qrKD
	jpHUMw5pg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lM2uj-00HVQz-1t; Tue, 16 Mar 2021 06:10:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lM2ub-00HVQ8-FO; Tue, 16 Mar 2021 06:10:42 +0000
X-UUID: ae33b5eb7778413688196c98052ff433-20210315
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=FkZGHytsgs955UTmW2uQrKqZUSuzH4HOG79H2hLEryo=; 
 b=U4Dq/ykytFoenN+pMHFn8saj375x3DSjizQYGrFYWAuKY/wWrgZWZWNboIO3GNJHcorJEtNCXS0gGheY2Sb457Cxg0jqxzmnYpX41II1Lpc/a5iIjh1EUtEiSgqPpS02bJfAbzl0eJ/duianOC//ux46w3CRgKnTBi1fIkMGR00=;
X-UUID: ae33b5eb7778413688196c98052ff433-20210315
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1785197024; Mon, 15 Mar 2021 22:10:27 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Mar 2021 23:10:25 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 16 Mar 2021 14:10:21 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 16 Mar 2021 14:10:20 +0800
Message-ID: <1615875020.11060.1.camel@mhfsdcap03>
Subject: Re: [PATCH] pinctrl: add lock in mtk_rmw function.
From: zhiyong tao <zhiyong.tao@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, srv_heupstream
 <srv_heupstream@mediatek.com>, <hui.liu@mediatek.com>, Eddie Huang
 =?UTF-8?Q?=28=E9=BB=83=E6=99=BA=E5=82=91=29?= <eddie.huang@mediatek.com>,
 <jg_poxu@mediatek.com>, Biao Huang <biao.huang@mediatek.com>, Hongzhou Yang
 <hongzhou.yang@mediatek.com>, Erin Lo
 =?UTF-8?Q?=28=E7=BE=85=E9=9B=85=E9=BD=A1=29?= <erin.lo@mediatek.com>, "Sean
 Wang =?UTF-8?Q?=28=E7=8E=8B=E5=BF=97=E4=BA=98=29?=" <sean.wang@mediatek.com>, 
 <seiya.wang@mediatek.com>, <sj.huang@mediatek.com>, "open list:OPEN FIRMWARE
 AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, lkml
 <linux-kernel@vger.kernel.org>, linux-arm Mailing List
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, "open list:GPIO SUBSYSTEM"
 <linux-gpio@vger.kernel.org>
Date: Tue, 16 Mar 2021 14:10:20 +0800
In-Reply-To: <CAGp9Lzq+NQhguSoc5DE4kyUgi2uSNOkURuAeAFpGuizcaXUXew@mail.gmail.com>
References: <20210312063502.3685-1-zhiyong.tao@mediatek.com>
 <20210312063502.3685-2-zhiyong.tao@mediatek.com>
 <CAGp9Lzq+NQhguSoc5DE4kyUgi2uSNOkURuAeAFpGuizcaXUXew@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 214DA13DA4340811ED1F8D29BF8856DE9D759CE9D7346FA589D3BCD2733CB6912000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_061038_857963_169BD40E 
X-CRM114-Status: GOOD (  22.43  )
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

On Tue, 2021-03-16 at 13:05 +0800, Sean Wang wrote:
> Hi Zhiyong,
> 
> On Fri, Mar 12, 2021 at 2:35 PM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
> >
> > When multiple threads operate on the same register resource
> > which include multiple pin, It will make the register resource
> > wrong to control. So we add lock to avoid the case.
> >
> > Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> > ---
> >  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 4 ++++
> >  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h | 2 ++
> >  drivers/pinctrl/mediatek/pinctrl-paris.c         | 2 ++
> >  3 files changed, 8 insertions(+)
> >
> > diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > index 72f17f26acd8..fcf7c3eeee4a 100644
> > --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > @@ -58,10 +58,14 @@ void mtk_rmw(struct mtk_pinctrl *pctl, u8 i, u32 reg, u32 mask, u32 set)
> >  {
> >         u32 val;
> >
> > +       mutex_lock(&pctl->lock);
> > +
> >         val = mtk_r32(pctl, i, reg);
> >         val &= ~mask;
> >         val |= set;
> >         mtk_w32(pctl, i, reg, val);
> > +
> > +       mutex_unlock(&pctl->lock);
> >  }
> >
> >  static int mtk_hw_pin_field_lookup(struct mtk_pinctrl *hw,
> > diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> > index e2aae285b5fc..65eac708a3b3 100644
> > --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> > +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> > @@ -251,6 +251,8 @@ struct mtk_pinctrl {
> >         struct mtk_eint                 *eint;
> >         struct mtk_pinctrl_group        *groups;
> >         const char          **grp_names;
> > +       /* lock pin's register resource to avoid multiple threads issue*/
> > +       struct mutex lock;
> >  };
> >
> >  void mtk_rmw(struct mtk_pinctrl *pctl, u8 i, u32 reg, u32 mask, u32 set);
> > diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> > index da1f19288aa6..48e823f6d293 100644
> > --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> > +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> > @@ -970,6 +970,8 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev,
> >
> >         hw->nbase = hw->soc->nbase_names;
> >
> > +       mutex_init(&hw->lock);
> > +
> 
> Could you help add the mutex initialization into pinctrl-moore.c too?
> and then the patch would look good to me.

==>Hi sean,
We will add add the mutex initialization into pinctrl-moore.c too in v2.

Thanks.
> 
> >         err = mtk_pctrl_build_state(pdev);
> >         if (err) {
> >                 dev_err(&pdev->dev, "build state failed: %d\n", err);
> > --
> > 2.18.0
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
