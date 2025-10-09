Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31984CCA470
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Oct 2025 07:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VrEMSIgPZk1KeuuGhcj52P085Zkq+6alNWoGna9Zc/w=; b=fpnn5TrzZjb47ASAplTr2ZgBWb
	ADgc/Bccy3lba31bUA1benaXcEj4HPiSN/e12vJvjJFssHWVBpi2P6NlXntsL4/89BYrVVso3alyX
	FKUxxE3GPmg8t5CR7/sdxF8iU+pp7MZAda8iQhkRvyVzY4GYYf6YmWzOwqXqvHiBaZ/y2iA/DU0Le
	7LO6XLIfLwZAkG+clLimlaFI+ykMNunW6XKaKF/BNuizq/BUC/q9+w+0jVwKLtULjQpCSdZFQfNXm
	GiJ9Ph2YaUjwhw6FzcGV5uSvPNu/tzJpYbfGcxc8tq58Y7mGc50RyRw7nbdpg8kwTGQhvcwRzk4TH
	57KJscBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6kl1-00000005K6V-34k4;
	Thu, 09 Oct 2025 07:08:11 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6kky-00000005K4f-44ve
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Oct 2025 07:08:10 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-36a6a39752bso5441411fa.0
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Oct 2025 00:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759993687; x=1760598487; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VrEMSIgPZk1KeuuGhcj52P085Zkq+6alNWoGna9Zc/w=;
        b=U70uHxyG1UUN7UQV4JYgm7dTbCC7xi2GH42zIghgQAfS/7YY0qPBg9JWD9MRrwF2Nv
         SWu+xHPA0ktqMIvukjSg8T7JJ4OO3bzWwaKYxq+0TpmvbPH3kXMK+9r4L0wEThHDYPf1
         EE2URCNONzcRq3EUnGMWxvwLHU6zyjTdZzrfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759993687; x=1760598487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VrEMSIgPZk1KeuuGhcj52P085Zkq+6alNWoGna9Zc/w=;
        b=dsh3KHabA8vELOBu9W1fSB+ZEDvW1PB+vkPXLmlot4hgCgnBt/CZjYnJ9KmZK/loLg
         COOSLqdPDsIet3wPpvCEayAuKdpARjh0L+w0p2jokjcs2Yun5K04QCQ02BYOop4r3Tyu
         wROkV8Cjr7YZS2seXEhsERk2TKZraC2CSTgswMkv7gv3jtIGvRaGJs2vMzeyO8Y/0sKm
         hFLiHAbRxEZBzszkJWQykj3+GVtb3V/zOhpPtAc36R2d3HwzdrKUJbXOJhUMeY0QdHLF
         My+m4TPQhJ9+uc51U/YllKj7n7IJXFbAPpE0/cSpqdTUUlsj+uWJ7q+m1sX1ubNGy7S9
         siCA==
X-Forwarded-Encrypted: i=1; AJvYcCWCj6WC19KiydZXZcpc7ENK5KGh4YbEoTKiNDtV4GPBJ7CvB5Qr3aOWX6ZJy++CSM4lrjyvMJ59rTam/BMsKA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3j0wF5jjo27ycGdcUpgMUGwAwOFz7O1x6XJbne5GIA7JI4BDO
	HX39a0UqstdIC3qQ1wOwFli3RSqZjTNwHxXEpv0u+WZ5Av5n8AIyeSoRs3/bapOMVi5xJejOGhh
	Xf1th5BwyPmVx/eFJixGvTMe+Ku0TpCGnWOk7efQf
X-Gm-Gg: ASbGncvYt4gsBg351banqJoZfzS1Uw8dNZhDjQe0vMqp6fNzqAqE8QiLkP6A2fTBsa0
	KVwGCi2O5tx5xxNGMR5wum0al4SrjbPzo1xn0J/74TNJj2Gyxr7oTJ4DD+BiWa4vlin1K7y8qbv
	7Qx4aGjwwUhxJtiO9HCXVONr/AnGnDoJaax/O8JaldV9aC9m2MaylELKqlnSg8cgW60p6stfOWF
	+iasJCzO6QYv+4HKy7naCvKONVd6Nnznlv/18ek01PfLfrUIoK8fSSNM+NiyQ==
X-Google-Smtp-Source: AGHT+IHRoD8fUFYarUIhK/FMKZGr2CwU3Gj3Lvi6h5d/Em4hrbue6QlrL7H+4NXmnHM+zo7hkW3w3oPsj8Dawmy7Yjk=
X-Received: by 2002:a2e:be26:0:b0:365:6b40:8687 with SMTP id
 38308e7fff4ca-37609e0ea58mr13923031fa.22.1759993686781; Thu, 09 Oct 2025
 00:08:06 -0700 (PDT)
MIME-Version: 1.0
References: <20251008-mtk-pll-rpm-v2-0-170ed0698560@collabora.com> <20251008-mtk-pll-rpm-v2-1-170ed0698560@collabora.com>
In-Reply-To: <20251008-mtk-pll-rpm-v2-1-170ed0698560@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Oct 2025 15:07:55 +0800
X-Gm-Features: AS18NWBxQ-yW1drBobxZE5-xVOr4CwQCIc293oxeKqSrQOU5dPVPYMgKJ9ACvWg
Message-ID: <CAGXv+5F_xeC_sGNB9Aev4CQbC_8Vo4YA1u7K60oKu8PseL=Qhw@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] clk: Respect CLK_OPS_PARENT_ENABLE during recalc
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, Laura Nao <laura.nao@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Chia-I Wu <olvaffe@gmail.com>, kernel@collabora.com, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Stephen Boyd <sboyd@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_000809_066243_23C3318E 
X-CRM114-Status: GOOD (  18.76  )
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

On Thu, Oct 9, 2025 at 12:07=E2=80=AFAM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> When CLK_OPS_PARENT_ENABLE was introduced, it guarded various clock
> operations, such as setting the rate or switching parents. However,
> another operation that can and often does touch actual hardware state is
> recalc_rate, which may also be affected by such a dependency.
>
> Add parent enables/disables where the recalc_rate op is called directly.
>
> Fixes: fc8726a2c021 ("clk: core: support clocks which requires parents en=
able (part 2)")
> Fixes: a4b3518d146f ("clk: core: support clocks which requires parents en=
able (part 1)")
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  drivers/clk/clk.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 85d2f2481acf360f0618a4a382fb51250e9c2fc4..1b0f9d567f48e003497afc98d=
f0c0d2ad244eb90 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1921,7 +1921,14 @@ static unsigned long clk_recalc(struct clk_core *c=
ore,
>         unsigned long rate =3D parent_rate;
>
>         if (core->ops->recalc_rate && !clk_pm_runtime_get(core)) {
> +               if (core->flags & CLK_OPS_PARENT_ENABLE)
> +                       clk_core_prepare_enable(core->parent);
> +
>                 rate =3D core->ops->recalc_rate(core->hw, parent_rate);
> +
> +               if (core->flags & CLK_OPS_PARENT_ENABLE)
> +                       clk_core_disable_unprepare(core->parent);
> +
>                 clk_pm_runtime_put(core);
>         }
>         return rate;
> @@ -4031,6 +4038,9 @@ static int __clk_core_init(struct clk_core *core)
>          */
>         clk_core_update_duty_cycle_nolock(core);
>
> +       if (core->flags & CLK_OPS_PARENT_ENABLE)
> +               clk_core_prepare_enable(core->parent);
> +
>         /*
>          * Set clk's rate.  The preferred method is to use .recalc_rate. =
 For
>          * simple clocks and lazy developers the default fallback is to u=
se the
> @@ -4046,6 +4056,9 @@ static int __clk_core_init(struct clk_core *core)
>                 rate =3D 0;
>         core->rate =3D core->req_rate =3D rate;
>
> +       if (core->flags & CLK_OPS_PARENT_ENABLE)
> +               clk_core_disable_unprepare(core->parent);
> +
>         /*
>          * Enable CLK_IS_CRITICAL clocks so newly added critical clocks
>          * don't get accidentally disabled when walking the orphan tree a=
nd
>
> --
> 2.51.0
>
>

