Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51536C55184
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2026 02:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RF3fTD6VniiBpbG6B64SSlFMt6UnvATMppDDhdm47VI=; b=Ps1yM8WdL3JGurP47+PUfMQ40w
	l/F3nsui9+6qfpQORK+Bq98jzGdVSpqAl/UQW3BtJesltI83iXwZ1cbDoExh511YW02+wy866bW7T
	hRwbmIP5uKC9KkekeHKqsf/Zjx/etFnNbtTO9mvQlK+e4CY8+wH+UXRoTCbLya29iT3lmrc3e8O0r
	+lM6i5BqePkTkk5Tq7xLRjENUOHfaVKYIWWsvnQXKukdaz4p/iZusl43Mgc2W5mCPDOYhTwYpSmkn
	r97R5yjpGZ7HD1OUHuqOxJe0md7PkAHrxR2X9nTm2+B217fnWE35lxr/u+y8PKcvxdrbdiXWEmpU3
	2I5LTlnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr57j-00000000rFz-2SY6;
	Tue, 04 Aug 2026 02:43:23 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr57g-00000000rEv-08ov
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Aug 2026 02:43:22 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-81f3b227a4aso61747377b3.1
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Aug 2026 19:43:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785811399; cv=none;
        d=google.com; s=arc-20260327;
        b=lZ5SzKEB+FYGLIlFY/cfd+qOrAEwI5WDjDtch4DPoBB6z89GIIZ7EENBTyOGQUfr8b
         Z3c+L8HnfZQIJoq0RvlCz+JoShGyYSU82bVhBpOgxSJObp+B5CUzXLAGK3LzyBoye+Iq
         zzAjjJJbBfubEkGeKl0oCIV3f5xcBhP+8E6Q1k6Qyz32kO0abWpfQkb5/SAYz8uyyJYm
         quQAKqkq9k8xptr62rrWMSfes5KwU4JIdykbAiIIXLWtohtAV+WEcwUWe79hNt1lVM5j
         dIXTimLw6aduAl6Cy9cV4hZ00MA/V/ae5wa72AncDWX17utsgWf4DaTy9yqZZ8ZWkDsJ
         K5lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RF3fTD6VniiBpbG6B64SSlFMt6UnvATMppDDhdm47VI=;
        fh=+96KBtX93KqM0QZqueKJv9tzd+0OKIsp8qiK6NVcvl0=;
        b=SLzKs04r4z5BMXmRRFMd1QA4ALUD2qrrLYn4pHqoM+pVRq18PR0hDBbHvFjRw6ntbw
         qIDr6Gs5jWHNymoTLST/gRaauK4mz+uci8bq9AFFacmkdZEEVsdjye1XBnTc+ra2Gv0v
         +333wrMwFOSm3s1zbKYWExN4x/tMlQ/O8JWNeaOxs8KO4xpBMrVi8FxE0dv3iE4IAWIl
         en4kl23QCO265QGVQgXppOKW/vyW9pCNWgUhyBYE1JJb4LIpapZfQw0OGRCr81ei2edg
         Sk7fWl2xibWc+EEirhDOla6dvCgzp9tex1wfO46PuR6T7pdY84MtiuNUYgbzjodPOQzr
         63Iw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785811399; x=1786416199; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RF3fTD6VniiBpbG6B64SSlFMt6UnvATMppDDhdm47VI=;
        b=ZshOk35AjzSAJSzJLKWVWxJQ/GcfAfU+PNCx3QdmgxRZpvY9bojatB2blM9nDpkFVt
         bJVMV7Oy0aitFDMUB6xN0s9myGpC2AGpxhislFOtS30IICFzWhtZKfLk/4hDwtBROuWC
         HgMgOcTUfBQ/jI/Xxd9ZyG0bOnnw9F0jAE53s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785811399; x=1786416199;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RF3fTD6VniiBpbG6B64SSlFMt6UnvATMppDDhdm47VI=;
        b=PMRmZ3PvLad53ED1xRqUy2lsPWUQIrTV0qzcbtuJY5wK2D+4ml0u4ix8B2I5GMdm7K
         KS6PPiiduNB/Oj26pJQCDmsXZkpZsSFSZ6ujuPoHQBlaL8Gp6wueoahpY4n02dD2CuEw
         Py9Xr55+aZTjjrCf1i6bOpubLApk470kYzZWUUfNb9ztiVcZ6v1RfWydz4F5R0SBhKJ7
         KFUciGXNyA9XHN/TjuVTsV8dSLAGOtOTyHDqUL6kbUwiOlsqcQNaudEsnmqUKiw19xPo
         BYJWxGLW2eAuHcmYHwwCoYX/+ZaAI2SIFEN6BbuwZd3C7Px8JCNXpx2DUVMw3xPKJU4Q
         7DyQ==
X-Forwarded-Encrypted: i=1; AHgh+RrxXiw7rKpNYfChpYcXWDI37+g55lGKtCY7k3pjQ8zbmNFI7mtTc676vOgkqnZswZz5dLz4szZpT/Yrxwi6FA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyL5usuA0SX85+mDA8i3hiTCZY5jViM1KLBPuoJcACUNkMnFJ0s
	uvrh2fIfKirYHlaJjhHl2sg3kuRqRPm7Z194pkXeS5KcrLDgQLeFrnRefl1sfvirBWhpUmAKGGY
	vjiV9HcrJjfnT7aZl5C7MctaoUB9wbyi7g5RS7MoT
X-Gm-Gg: AR+sD13n8THo6/jGxsjt+dld+7rVdW7MFSrG7U+QlFm6dxcWUa+iBoFSlJM/PQDq0mI
	hT/PrIRhup+PumY3cEduGhQbsEceAI3bxROo5fdc069pA4XhLBL5zPBKLsj4V/4g1qhgaL82bpG
	/olzkCR2csgvNbTow9wAbG2KYBWq26CXIr0hNWJExWmvW1nyFHrXk9qdZDyDxmEQBJ0XbM+h6vR
	nX7n98+27AYKNaqACYWLsWkQ8pFygDxqF9tFX1cmAErUdbCntY8uyHvnLStx9lWbFKMWUNj9Bk8
	LsAivsfDoXTxHZFDNEimF9R0SYh0NTOkNTYfvT+fxwshYZ8=
X-Received: by 2002:a05:690c:6984:b0:81e:a425:fe88 with SMTP id
 00721157ae682-81fd4bf523fmr168290117b3.33.1785811398719; Mon, 03 Aug 2026
 19:43:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260803141659.559129-1-akkun11.open@gmail.com> <20260803141659.559129-12-akkun11.open@gmail.com>
In-Reply-To: <20260803141659.559129-12-akkun11.open@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 4 Aug 2026 10:43:08 +0800
X-Gm-Features: AUfX_mw0ODj1uLGkUiNOBLIVs6yIxP-U-M-JHW0wgLxFKYiXjICIFii0-d42exg
Message-ID: <CAGXv+5FHSNH5SLiCiXyHDieO2rUDypAQBi5-nbTFKFzb+3ZWRA@mail.gmail.com>
Subject: Re: [PATCH 11/32] clk: mediatek: Add auto-population of sub-devices
 support in simple probe
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, Richard Cochran <richardcochran@gmail.com>, 
	Laura Nao <laura.nao@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Danilo Krummrich <dakr@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Takashi Sakamoto <o-takashi@sakamocchi.jp>, Haotian Zhang <vulab@iscas.ac.cn>, Kees Cook <kees@kernel.org>, 
	Miles Chen <miles.chen@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, 
	Sam Shih <sam.shih@mediatek.com>, 
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	"open list:PTP HARDWARE CLOCK SUPPORT:Keyword:(?:b|_)ptp(?:b|_)" <netdev@vger.kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_194320_985334_41FA5D00 
X-CRM114-Status: GOOD (  19.59  )
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

On Mon, Aug 3, 2026 at 10:18=E2=80=AFPM Akari Tsuyukusa <akkun11.open@gmail=
.com> wrote:
>
> MediaTek audio clock drivers call devm_of_platform_populate() after
> mtk_clk_simple_probe(). Extend __mtk_clk_simple_probe() to run
> devm_of_platform_populate() when the new 'populate_children' flag is
> set, reducing boilerplate.
>
> Note that explicit of_platform_depopulate() calls in remove functions
> are unnecessary because devm_of_platform_populate() is managed by
> devres and cleans up automatically.
>
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> ---
>  drivers/clk/mediatek/clk-mtk.c | 7 +++++++
>  drivers/clk/mediatek/clk-mtk.h | 1 +
>  2 files changed, 8 insertions(+)
>
> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mt=
k.c
> index c3369a04cdec..71d70b5a9990 100644
> --- a/drivers/clk/mediatek/clk-mtk.c
> +++ b/drivers/clk/mediatek/clk-mtk.c
> @@ -12,6 +12,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> +#include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/slab.h>
> @@ -609,6 +610,12 @@ static int __mtk_clk_simple_probe(struct platform_de=
vice *pdev,
>         if (mcd->need_runtime_pm)
>                 pm_runtime_put(&pdev->dev);
>
> +       if (mcd->populate_children) {
> +               r =3D devm_of_platform_populate(&pdev->dev);
> +               if (r)
> +                       goto unregister_clks;

You cannot use devm_* here, as they get unrolled _after_ the probe function
returns an error or after the remove function returns. A child could be
referencing a clock that got tore down in the error path below.

All devm_* functions need to happen before anything that requires manual
tear down. You can't mix the two together.


ChenYu

> +       }
> +
>         return r;
>
>  unregister_clks:
> diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mt=
k.h
> index b6504b3e77ed..11939e3e0b38 100644
> --- a/drivers/clk/mediatek/clk-mtk.h
> +++ b/drivers/clk/mediatek/clk-mtk.h
> @@ -265,6 +265,7 @@ struct mtk_clk_desc {
>         unsigned int mfg_clk_idx;
>
>         bool need_runtime_pm;
> +       bool populate_children;
>  };
>
>  int mtk_clk_pdev_probe(struct platform_device *pdev);
> --
> 2.55.0
>

