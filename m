Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFE0C77B7A
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 08:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rrXV2pSkwAI+QAXUpRLRnlNnNfkWLFknVTLvl7bQmX8=; b=ikluMY9mZwMGrqE3teUzWkrtuM
	i4OmHF+KrQgCV7Mo0is/QiFMNTODCjBCRAooftVzaUtvnoSrylOkE6/kDvmxG9R24EYlj4HZ76ycs
	3HIwss6q8WmcaGgOSFj0WjB4rzOGTf+UJzP9R+C3sEd+Fa0gQrG9M9FJGiridrj1a+7t6oNcq1u7R
	ileBYKO5oU+DEMEqz33Lu3Eq6DCR/LsNEMpGTRTZlslKNiLfmIeESJy8hhqtnRccatXCPNK5oCnpk
	EA3Y4HSqks7KnZlun8KG2OzYZMwxyhesNu6aUDPjpOi15awqcZT+5q5jzjSWyikdTK+HugRaxQm2v
	hprmP1BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3ujA-00Cw9n-0A;
	Tue, 30 May 2023 08:29:12 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3uj7-00Cw8U-2H
	for linux-mediatek@lists.infradead.org;
	Tue, 30 May 2023 08:29:11 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5148e4a2f17so6210306a12.1
        for <linux-mediatek@lists.infradead.org>; Tue, 30 May 2023 01:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685435344; x=1688027344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrXV2pSkwAI+QAXUpRLRnlNnNfkWLFknVTLvl7bQmX8=;
        b=lD3LAqKUXnALaMMaXaoS9HvK65/b60q5KOMPNJKXq4x/yjBc62HmKwf3o9Ek9/zvHQ
         nSej9wJvmbV3bfAgAXlJTPbSihgkBsaVaLZWW84ogmPbszEAkkyRAsbDxX7QkaaR05wm
         Atu6SSxV+a1M+hAEsIrb1SZCYFf9sbuljS8M8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685435344; x=1688027344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rrXV2pSkwAI+QAXUpRLRnlNnNfkWLFknVTLvl7bQmX8=;
        b=dSIwXePqmxZrGka8rvA1LHzsaOJ2Ktai02AXR3gUATxCxnK32rlGPr17IXaM0VO8Ba
         ZLOtQ4ZTxKyZi9Bx51tdMM5mANerBRkRGKl2sN6xkzM5KLYqF615AXfBjXhRd/hudbtB
         kW0xZtvKhWOsDo7pZ96JtcohiKzgrUr8kCyIaYa/51gyJu1SIVESk5uy4FxR17hWz3eW
         o738ndWbGJzacUrBxOFR8hulXlYjFDlF8wDB1EMOTPw4DZ8aleY1oMRHeeS8faRO41A9
         cXFHj1+bOwxdj4Jt/jPTOF16oqEKpDR1sbjMc48tpl5XLItwvY71VZ44O43NCbXj6i5E
         dFnw==
X-Gm-Message-State: AC+VfDyY/Xmn39Qfea01e256aK7FR6cbztJvUytKN6XzeWH8D9h1OmGr
	fhU65a9u+h9zcsDNUWXOeV6M8Hq9cYZxWa0Cvcc=
X-Google-Smtp-Source: ACHHUZ69Ad+hY7Rex+pqrip0SqSsz6cCQwOkQMf+85L5hzEOtzi6+evcNbaNDCM7fbERKu6aLWJ4gA==
X-Received: by 2002:a17:907:6d23:b0:974:1ca9:836e with SMTP id sa35-20020a1709076d2300b009741ca9836emr1807248ejc.6.1685435343716;
        Tue, 30 May 2023 01:29:03 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id h27-20020a170906111b00b00969cbd5718asm6951471eja.48.2023.05.30.01.29.01
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 01:29:01 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3f6094cb2ebso28148395e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 30 May 2023 01:29:01 -0700 (PDT)
X-Received: by 2002:a05:600c:3787:b0:3f6:1e6:d5a2 with SMTP id
 o7-20020a05600c378700b003f601e6d5a2mr946577wmr.4.1685435341339; Tue, 30 May
 2023 01:29:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230518115258.14320-1-shuijing.li@mediatek.com> <0ff74fff-9e48-e2a6-617c-13d4cfc2e157@gmail.com>
In-Reply-To: <0ff74fff-9e48-e2a6-617c-13d4cfc2e157@gmail.com>
From: Fei Shao <fshao@chromium.org>
Date: Tue, 30 May 2023 16:28:24 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhVrbaAh2u7rG-=-RubsxTZvMBRZO-t0NA8jG7M8187EA@mail.gmail.com>
Message-ID: <CAC=S1nhVrbaAh2u7rG-=-RubsxTZvMBRZO-t0NA8jG7M8187EA@mail.gmail.com>
Subject: Re: [PATCH v2] pwm: mtk_disp: Fix the disable flow of disp_pwm
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Shuijing Li <shuijing.li@mediatek.com>, thierry.reding@gmail.com, 
	u.kleine-koenig@pengutronix.de, angelogioacchino.delregno@collabora.com, 
	devicetree@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, jitao.shi@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_012909_748567_D1759AA6 
X-CRM114-Status: GOOD (  23.04  )
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

On Mon, May 29, 2023 at 6:43=E2=80=AFPM Matthias Brugger <matthias.bgg@gmai=
l.com> wrote:
>
>
>
> On 18/05/2023 13:52, Shuijing Li wrote:
> > There is a flow error in the original mtk_disp_pwm_apply() function.
> > If this function is called when the clock is disabled, there will be a
> > chance to operate the disp_pwm register, resulting in disp_pwm exceptio=
n.
> > Fix this accordingly.
> >
> > Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
>
> We are missing a fixes tag here.
> Fixes: 888a623db5d0 ("pwm: mtk-disp: Implement atomic API .apply()")
>
>
> with that:
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

Tested-by: Fei Shao <fshao@chromium.org>

>
> > ---
> > Changes in v2:
> > Use
> > if (A && B) {
> >       something();
> > }
> > instead of
> > if (A) {
> >       if (B) {
> >               something();
> >       }
> > }
> > per suggestion from the previous thread:
> > https://lore.kernel.org/lkml/20230515140346.bxeu6xewi6a446nd@pengutroni=
x.de/
> > ---
> >   drivers/pwm/pwm-mtk-disp.c | 13 +++++--------
> >   1 file changed, 5 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
> > index 79e321e96f56..2401b6733241 100644
> > --- a/drivers/pwm/pwm-mtk-disp.c
> > +++ b/drivers/pwm/pwm-mtk-disp.c
> > @@ -79,14 +79,11 @@ static int mtk_disp_pwm_apply(struct pwm_chip *chip=
, struct pwm_device *pwm,
> >       if (state->polarity !=3D PWM_POLARITY_NORMAL)
> >               return -EINVAL;
> >
> > -     if (!state->enabled) {
> > -             mtk_disp_pwm_update_bits(mdp, DISP_PWM_EN, mdp->data->ena=
ble_mask,
> > -                                      0x0);
> > -
> > -             if (mdp->enabled) {
> > -                     clk_disable_unprepare(mdp->clk_mm);
> > -                     clk_disable_unprepare(mdp->clk_main);
> > -             }
> > +     if (!state->enabled && mdp->enabled) {
> > +             mtk_disp_pwm_update_bits(mdp, DISP_PWM_EN,
> > +                                      mdp->data->enable_mask, 0x0);
> > +             clk_disable_unprepare(mdp->clk_mm);
> > +             clk_disable_unprepare(mdp->clk_main);
> >
> >               mdp->enabled =3D false;
> >               return 0;
>

