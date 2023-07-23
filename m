Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA686C001DE
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Jul 2023 19:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0WjRfkrOZBE+bPp6Lr6v82ClIyq5fzCi+P9/0PDOFxw=; b=tIi+UkFdDgI2OYW7GdksFeY69E
	6VKD0ylhb3zEmQnXbwHSKH+rITV1uucBArPCRHv3AiO14dpg0SZg/3FzHCFdcGcSSlyJ0Woouc7uv
	S/2kUqkAXw/G4ctrDYwnpuzkjkx0GvKehRISPtueKfQmHNJvMtEuPD8fiZwgvkPs00cgJJDWrlxFY
	My1fLR/h1c7DzodvijNuEE9J8QjLnuYpGOEZNVOIWAazVwdIJIwb6wiK3HEE3VIEBk2F1skAxJvTe
	MlO/DHiWP9SxcOxfXYpjTqEevaso103kRqiGGmvAyB3qx52iLyqTcGVvN0WpgyM7PLRt21j4TFzIc
	0BNFM3VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNf5j-001jgI-2N;
	Sun, 23 Jul 2023 19:50:07 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNf5h-001jfk-0v
	for linux-mediatek@lists.infradead.org;
	Sun, 23 Jul 2023 19:50:06 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-d07c535377fso1685368276.1
        for <linux-mediatek@lists.infradead.org>; Sun, 23 Jul 2023 12:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690141804; x=1690746604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0WjRfkrOZBE+bPp6Lr6v82ClIyq5fzCi+P9/0PDOFxw=;
        b=FdzWlyMyVeJiJ2FYtIxqi+vl2/Zf0e8gZSkb9nFBsXXvc4kJ8iBcmTdtAfwIxspx6P
         Iuf9dQmNMNSM0ntvzPyDtGYVW+E9cfBopf/V87mfZqjM/VRra0tcq9+wGmtyGZ9kOtgk
         bHGfuhHK1N074Xk8zkRitL6usDnOTyQFUDKXd6sEPNRieoBFEhlijuRVrc+jnGf7lOmZ
         Mc2NODtL53zR/5Sio9N+4SSm5spfsoj9jL47ILKvJuCkQMjLsYuWmfJqalK3moy/obrS
         Sykz1TVh2X95CgyAelgXOsnVdOFqjSF5UB36Zrx+pieUsF1ZUCnASBNYtl5x0xsbJzFg
         Z2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690141804; x=1690746604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0WjRfkrOZBE+bPp6Lr6v82ClIyq5fzCi+P9/0PDOFxw=;
        b=PSjoP3IKltKOgZ+abl0jPLWz+73qJ/y/HtIC8ihNPMI+BhZFUIb+8MWRSNwSoGgrSy
         VHmYZl9u2WGHTNr/3gHVZzCCxejuWOYhChXW9IQQH2zJIc97U+qIRpHfuJ6639kGuVAC
         rjIEJbaB5HDn9/x1TNTiA7lEyI/aHHj0lIMkdTvmIa/lIjeaqDGinv1eIuxOjIQtP2n0
         7ivmAR6lQM6LtenuXnib86JHy9mX2TU50ZvMGf5ejtLOeoVBR2VSBlN/PTI/auK8ecxH
         B7XXzCpLUx9Rldlu1fLCwmRL7unxh2Fj8DABWyrxpfDry6Vj3aYeJRqsO/HIWumuQNYm
         dqVw==
X-Gm-Message-State: ABy/qLbH5zpkFjCVriz6LfHksx2EVVy6GjTBFC29xrBf4cgv9/xEsZNl
	wvO4IM5WcNoae5kuktQtU2uCu/jkqrfFqqZAS2Zi7Q==
X-Google-Smtp-Source: APBJJlHAFyizI2ckEJ9nB0m7g3DAdXb4Zznk/ltdZ+PB2It2UsgAzguNVS+hBnlB/Sq31qEL/qdnwqCcpuMVa7EVWzE=
X-Received: by 2002:a25:1957:0:b0:d09:ff7:79ed with SMTP id
 84-20020a251957000000b00d090ff779edmr2539324ybz.5.1690141803793; Sun, 23 Jul
 2023 12:50:03 -0700 (PDT)
MIME-Version: 1.0
References: <TYAP286MB0315FB4EAD83E36FA371F119BC38A@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM>
In-Reply-To: <TYAP286MB0315FB4EAD83E36FA371F119BC38A@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 23 Jul 2023 21:49:52 +0200
Message-ID: <CACRpkdYzytbM0sN7Q-Niwq2jUgbeVPpREmwUTbja86eGROOB+w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mtmips: do not log when repeating the same
 pinctrl request
To: Shiji Yang <yangshiji66@outlook.com>
Cc: linux-gpio@vger.kernel.org, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230723_125005_391567_87B230AE 
X-CRM114-Status: GOOD (  19.65  )
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

On Tue, Jul 18, 2023 at 5:16=E2=80=AFPM Shiji Yang <yangshiji66@outlook.com=
> wrote:

> Sometimes when driver fails to probe a device, the kernel will retry
> it later. However, this will result in duplicate requests for the
> same pinctrl configuration. In this case, we should not throw error
> logs. This patch adds extra check for the pin group function. Now the
> pinctrl driver only prints error log when attempting to configure the
> same group as different functions.
>
> Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
> ---
>  drivers/pinctrl/mediatek/pinctrl-mtmips.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtmips.c b/drivers/pinctrl/=
mediatek/pinctrl-mtmips.c
> index efd77b6c5..8f5493220 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtmips.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtmips.c
> @@ -125,8 +125,9 @@ static int mtmips_pmx_group_enable(struct pinctrl_dev=
 *pctrldev,
>
>         /* dont allow double use */
>         if (p->groups[group].enabled) {
> -               dev_err(p->dev, "%s is already enabled\n",
> -                       p->groups[group].name);
> +               if (!p->func[func]->enabled)
> +                       dev_err(p->dev, "%s is already enabled\n",
> +                               p->groups[group].name);

Why is the driver not backing out properly and setting this .enabled back
to false when probing fails for some requesting driver?

Or am I getting something wrong here?

Yours,
Linus Walleij

