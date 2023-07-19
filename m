Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F62EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 08:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SMiqDw7X7t0YrSOOzvan9lAW+Fd4IqCvmMQSBgwW2RU=; b=h06pJFzxaFb49YiVuqNwmb/6G0
	mddi/BJUL4y+P0AED8/F2ERa4xXLDH8vcfJfYIPHbqwR2u4b3fDx3w5hsAwEVqm/bGLKSnAjPkGBh
	qoVMSZ7wv9pXFPx/ahMjFQkPyFSBM50tvVdeDdUbFHThDmhYiNM5VEuzp+dDN+C2JA7NcrHKdSmEW
	j6hxnnXkUJMIaE9me6g0SGfd3ZGNeb9xfhfDIRY4ME1R/8KSon/ncgFwSG5A8VXrYnXDh4I9NQiIE
	P63uVQ2ISeQa4TkcR6qro9aoax4QKOYgdF9rHsCOvKeY+QbmENvdB5caZYR/gTz4DKkP+9Pea5T4r
	dRjL9uaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2vX-006SVB-2T;
	Wed, 19 Jul 2023 08:52:55 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2vU-006STu-1F
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Jul 2023 08:52:54 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id ada2fe7eead31-440b54708f2so2330504137.0
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Jul 2023 01:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689756770; x=1690361570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SMiqDw7X7t0YrSOOzvan9lAW+Fd4IqCvmMQSBgwW2RU=;
        b=n+QWAsjwEYrhOL660gbbzKYpPFBdtY/VRGDpk3zAR6D3OrchbXWU+3Rrhk/8HnroPz
         2A/lfOsc4NwsLmiBopMXoDu4BzqbEL+LkBibDmm1tfKSBIMB2GAVJi/VQJxAYQxZegpA
         /6GuiB4id+r4oKFChsW0y+qMYpiZHC4/Tq1MY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689756770; x=1690361570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SMiqDw7X7t0YrSOOzvan9lAW+Fd4IqCvmMQSBgwW2RU=;
        b=iVSKbSJ0C+mqdV3vhiMzGVM/OYx6wsi6pLWnTKHl6Dg3lnce4UggzT5zhVOXBUlVzq
         uN4UTB4UWOkVCy6+bNTLe6DlL3MnKTrZDBswhpZUHy4GC4VK6kK0+/jVgOxz0OvlOiCP
         wRyaNVWQTez3Whl1xQ7GfcxeM+Y1w8G0lN0skantQqf1FpTPx9BvgBBCYiUW2jjn85gr
         4tdJLIwk9HuoZZ9dnnxIA5zFr7//XZRJb0xTk//nkKszDfnzfBc2k3bPjEdJ1foJghkj
         FThurVLP5FhkxMAC5Ne8YqeBwLBg6ozv6ypxyWloiP75bSCr1qmI8cB+2+XDfe8ZBiH7
         P3Lg==
X-Gm-Message-State: ABy/qLbzsLiEP7yxnUbB5NaekQf0MzbxIPzg7PHyazg3pPYT4qTHd/Mh
	DJOkiVVoWS+VWZLSMsEi8bj79/ziiiYJLy1BNKqXBA==
X-Google-Smtp-Source: APBJJlFMB/51phMKvUpHT3Rcml2q3l4gVhVhjiZDDgMbXw9h+TT8DiP7jHpkQfpm9gOT379kwzlpBCyQqBRLcLnf03Q=
X-Received: by 2002:a67:fd59:0:b0:443:873a:16b8 with SMTP id
 g25-20020a67fd59000000b00443873a16b8mr9329375vsr.30.1689756770172; Wed, 19
 Jul 2023 01:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230719082033.1229277-1-wenst@chromium.org> <a63ffedd-8637-8161-2317-bd36be2867ae@collabora.com>
In-Reply-To: <a63ffedd-8637-8161-2317-bd36be2867ae@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 19 Jul 2023 16:52:39 +0800
Message-ID: <CAGXv+5GimZNPo6QDmCN7o4-qU-iPni=e1vPH5v0Z-Opn_0QjFg@mail.gmail.com>
Subject: Re: [PATCH] clk: mediatek: Check if clock ID is larger than
 clk_hw_onecell_data size
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_015252_461226_7E0EAD3A 
X-CRM114-Status: GOOD (  34.73  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jul 19, 2023 at 4:36=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 19/07/23 10:20, Chen-Yu Tsai ha scritto:
> > The MediaTek clock driver library's simple-probe mechanism allocates
> > clk_hw_onecell_data based on how many clocks are defined. If there's a
> > mismatch between that and the actual number of clocks defined in the DT
> > binding, such that a clock ID exceeds the number, then an out-of-bounds
> > write will occur. This silently corrupts memory, maybe causing a crash
> > later on that seems unrelated. KASAN can detect this if turned on.
> >
> > To avoid getting into said scenario, check if the to be registered
> > clock's ID will fit in the allocated clk_hw_onecell_data. If not, put
> > out a big warning and skip the clock.
> >
> > One could argue that the proper fix is to let the drivers specify the
> > number of clocks (based on a DT binding macro) instead. However even
> > the DT binding macro could be wrong. And having code to catch errors
> > and give out warnings is better than having silent corruption.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > This one is less urgent.
> >
> > Angelo, do you think we should add a field to struct mtk_clk_desc and
> > assign CLK_XXX_NR_CLK to it?
> >
>
> I get the point... but I don't know if it is a good idea to add checks fo=
r
> *bad code* in the first place, as bad code shall not happen at all.
> Validating whether a developer wrote the right thing is something that sh=
ould
> be done in code reviews, and such mistakes shouldn't be allowed to happen=
.

In theory, yeah. In practice, well, we already have such an error in tree. =
:p

> Besides, if you really want to go this route... In that case I disagree a=
bout
> the `continue`, as I would be inflexible: if your code is bad, I will ref=
use
> to register your clocks entirely.
> That'll force the developer to actually fix it, as parts of the SoC and/o=
r
> platform will *not work at all* :-)
>
> So, in that case...
>
>         if (rc->id >=3D clk_data->num) {
>                 hw =3D PTR_ERR(-EINVAL);
>                 goto err;
>         }
>
> Thoughts?

That works for me as well. This was more my debug code cleaned up.
I assume we still want the warning / error message though?

The other choice would be adding .num_clks for CLK_XXX_NR_CLKS to
mtk_clk_desc. What are your thoughts on that?

ChenYu

> Cheers!
> Angelo
>
> >   drivers/clk/mediatek/clk-gate.c | 11 +++++++++
> >   drivers/clk/mediatek/clk-mtk.c  | 43 ++++++++++++++++++++++++++++++++=
+
> >   2 files changed, 54 insertions(+)
> >
> > diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk=
-gate.c
> > index 67d9e741c5e7..bb7c536ef60f 100644
> > --- a/drivers/clk/mediatek/clk-gate.c
> > +++ b/drivers/clk/mediatek/clk-gate.c
> > @@ -222,6 +222,11 @@ int mtk_clk_register_gates(struct device *dev, str=
uct device_node *node,
> >       for (i =3D 0; i < num; i++) {
> >               const struct mtk_gate *gate =3D &clks[i];
> >
> > +             if (WARN(gate->id >=3D clk_data->num,
> > +                      "%pOF: gateclock ID (%d)larger than expected (%d=
)\n",
> > +                      node, gate->id, clk_data->num))
> > +                     continue;
> > +
> >               if (!IS_ERR_OR_NULL(clk_data->hws[gate->id])) {
> >                       pr_warn("%pOF: Trying to register duplicate clock=
 ID: %d\n",
> >                               node, gate->id);
> > @@ -251,6 +256,9 @@ int mtk_clk_register_gates(struct device *dev, stru=
ct device_node *node,
> >       while (--i >=3D 0) {
> >               const struct mtk_gate *gate =3D &clks[i];
> >
> > +             if (gate->id >=3D clk_data->num)
> > +                     continue;
> > +
> >               if (IS_ERR_OR_NULL(clk_data->hws[gate->id]))
> >                       continue;
> >
> > @@ -273,6 +281,9 @@ void mtk_clk_unregister_gates(const struct mtk_gate=
 *clks, int num,
> >       for (i =3D num; i > 0; i--) {
> >               const struct mtk_gate *gate =3D &clks[i - 1];
> >
> > +             if (gate->id >=3D clk_data->num)
> > +                     continue;
> > +
> >               if (IS_ERR_OR_NULL(clk_data->hws[gate->id]))
> >                       continue;
> >
> > diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-=
mtk.c
> > index 2e55368dc4d8..09d50a15db77 100644
> > --- a/drivers/clk/mediatek/clk-mtk.c
> > +++ b/drivers/clk/mediatek/clk-mtk.c
> > @@ -94,6 +94,10 @@ int mtk_clk_register_fixed_clks(const struct mtk_fix=
ed_clk *clks, int num,
> >       for (i =3D 0; i < num; i++) {
> >               const struct mtk_fixed_clk *rc =3D &clks[i];
> >
> > +             if (WARN(rc->id >=3D clk_data->num,
> > +                      "Fixed clock ID (%d) larger than expected (%d)\n=
", rc->id, clk_data->num))
> > +                     continue;
> > +
> >               if (!IS_ERR_OR_NULL(clk_data->hws[rc->id])) {
> >                       pr_warn("Trying to register duplicate clock ID: %=
d\n", rc->id);
> >                       continue;
> > @@ -117,6 +121,9 @@ int mtk_clk_register_fixed_clks(const struct mtk_fi=
xed_clk *clks, int num,
> >       while (--i >=3D 0) {
> >               const struct mtk_fixed_clk *rc =3D &clks[i];
> >
> > +             if (rc->id >=3D clk_data->num)
> > +                     continue;
> > +
> >               if (IS_ERR_OR_NULL(clk_data->hws[rc->id]))
> >                       continue;
> >
> > @@ -139,6 +146,9 @@ void mtk_clk_unregister_fixed_clks(const struct mtk=
_fixed_clk *clks, int num,
> >       for (i =3D num; i > 0; i--) {
> >               const struct mtk_fixed_clk *rc =3D &clks[i - 1];
> >
> > +             if (rc->id >=3D clk_data->num)
> > +                     continue;
> > +
> >               if (IS_ERR_OR_NULL(clk_data->hws[rc->id]))
> >                       continue;
> >
> > @@ -160,6 +170,11 @@ int mtk_clk_register_factors(const struct mtk_fixe=
d_factor *clks, int num,
> >       for (i =3D 0; i < num; i++) {
> >               const struct mtk_fixed_factor *ff =3D &clks[i];
> >
> > +             if (WARN(ff->id >=3D clk_data->num,
> > +                      "Fixed factor clock ID (%d) larger than expected=
 (%d)\n",
> > +                      ff->id, clk_data->num))
> > +                     continue;
> > +
> >               if (!IS_ERR_OR_NULL(clk_data->hws[ff->id])) {
> >                       pr_warn("Trying to register duplicate clock ID: %=
d\n", ff->id);
> >                       continue;
> > @@ -183,6 +198,9 @@ int mtk_clk_register_factors(const struct mtk_fixed=
_factor *clks, int num,
> >       while (--i >=3D 0) {
> >               const struct mtk_fixed_factor *ff =3D &clks[i];
> >
> > +             if (ff->id >=3D clk_data->num)
> > +                     continue;
> > +
> >               if (IS_ERR_OR_NULL(clk_data->hws[ff->id]))
> >                       continue;
> >
> > @@ -205,6 +223,9 @@ void mtk_clk_unregister_factors(const struct mtk_fi=
xed_factor *clks, int num,
> >       for (i =3D num; i > 0; i--) {
> >               const struct mtk_fixed_factor *ff =3D &clks[i - 1];
> >
> > +             if (ff->id >=3D clk_data->num)
> > +                     continue;
> > +
> >               if (IS_ERR_OR_NULL(clk_data->hws[ff->id]))
> >                       continue;
> >
> > @@ -339,6 +360,11 @@ int mtk_clk_register_composites(struct device *dev=
,
> >       for (i =3D 0; i < num; i++) {
> >               const struct mtk_composite *mc =3D &mcs[i];
> >
> > +             if (WARN(mc->id >=3D clk_data->num,
> > +                      "Composite clock ID (%d) larger than expected (%=
d)\n",
> > +                      mc->id, clk_data->num))
> > +                     continue;
> > +
> >               if (!IS_ERR_OR_NULL(clk_data->hws[mc->id])) {
> >                       pr_warn("Trying to register duplicate clock ID: %=
d\n",
> >                               mc->id);
> > @@ -362,6 +388,9 @@ int mtk_clk_register_composites(struct device *dev,
> >       while (--i >=3D 0) {
> >               const struct mtk_composite *mc =3D &mcs[i];
> >
> > +             if (mc->id >=3D clk_data->num)
> > +                     continue;
> > +
> >               if (IS_ERR_OR_NULL(clk_data->hws[mcs->id]))
> >                       continue;
> >
> > @@ -384,6 +413,9 @@ void mtk_clk_unregister_composites(const struct mtk=
_composite *mcs, int num,
> >       for (i =3D num; i > 0; i--) {
> >               const struct mtk_composite *mc =3D &mcs[i - 1];
> >
> > +             if (mc->id >=3D clk_data->num)
> > +                     continue;
> > +
> >               if (IS_ERR_OR_NULL(clk_data->hws[mc->id]))
> >                       continue;
> >
> > @@ -407,6 +439,11 @@ int mtk_clk_register_dividers(struct device *dev,
> >       for (i =3D 0; i <  num; i++) {
> >               const struct mtk_clk_divider *mcd =3D &mcds[i];
> >
> > +             if (WARN(mcd->id >=3D clk_data->num,
> > +                      "Divider clock ID (%d) larger than expected (%d)=
\n",
> > +                      mcd->id, clk_data->num))
> > +                     continue;
> > +
> >               if (!IS_ERR_OR_NULL(clk_data->hws[mcd->id])) {
> >                       pr_warn("Trying to register duplicate clock ID: %=
d\n",
> >                               mcd->id);
> > @@ -432,6 +469,9 @@ int mtk_clk_register_dividers(struct device *dev,
> >       while (--i >=3D 0) {
> >               const struct mtk_clk_divider *mcd =3D &mcds[i];
> >
> > +             if (mcd->id >=3D clk_data->num)
> > +                     continue;
> > +
> >               if (IS_ERR_OR_NULL(clk_data->hws[mcd->id]))
> >                       continue;
> >
> > @@ -454,6 +494,9 @@ void mtk_clk_unregister_dividers(const struct mtk_c=
lk_divider *mcds, int num,
> >       for (i =3D num; i > 0; i--) {
> >               const struct mtk_clk_divider *mcd =3D &mcds[i - 1];
> >
> > +             if (mcd->id >=3D clk_data->num)
> > +                     continue;
> > +
> >               if (IS_ERR_OR_NULL(clk_data->hws[mcd->id]))
> >                       continue;
> >
>

