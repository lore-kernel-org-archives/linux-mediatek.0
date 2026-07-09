Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB159C43458
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2026 08:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qGKXad+qaD2BA/lKmpU05ZIRYpZt1CvqKR8CHqzJNMU=; b=hJkm31XuFI5HEPasDqoHWK8Qr0
	XCGcjt3N8ppkeXT1IjZ8ntTBhvKbW3zNPFhWbizTvbp3DwnWeyoWmswy638ruw7kfxfVBjkocqnSO
	xVj3IbsmIpS3yTWR3VCkM4IYbbSq0fxwmRPNWHimBKNUJz4fcruYkS1P47b3YPXZP10VQmU4yauqe
	fRLUjqOqsAkEppYnjDdaL23mBl73aZMG3v/nq+eHH/LbVslEh/pb6vNxR6rvKP3ugZgCTcaiwa384
	xvFegOBt5Bd6N5Pfd9n4dvaCzzQUmzx4BismY8UuL+0vsPJZa3I5TZ/cPwXg7pcGSvzVS4uLtfd4F
	vXRgQThw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whk3I-00000001PK7-2F2O;
	Thu, 09 Jul 2026 08:24:12 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whk3F-00000001PJP-2VFu
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Jul 2026 08:24:10 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-664dd23829eso1490899d50.3
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jul 2026 01:24:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783585448; cv=none;
        d=google.com; s=arc-20260327;
        b=eSnYHjAAdP3l4zPYQ/hpMqDlUxnUdzBvbyef9W2zSS3OBLNgbDSW+KcX1L/m4Qcapb
         pX7PXlkf14Qpcl8Y+qoFAJM7+tQgS4BcEVnzt9sySeshkWGticBSK0KfPfmbXaBrPLhd
         SaZuhDAhBLFS08hJCr0tmG1cvv1Mzu2JfH3iE10ckhn2rmqFddRpKkYvz6xTJ2+hPzSr
         cP616uXHTm+8P/Mg+aVuJmvextuXnjVCbwVnFXxqZ2n4o5LLkkHQNHy3aufYrYAomqp7
         aEdH4OeUmLkQp05AkQtYPgEjDKdwA3utwJt+d/IAs8RzsY3wB9QRE3pZU5CHQ9td5WbC
         48vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qGKXad+qaD2BA/lKmpU05ZIRYpZt1CvqKR8CHqzJNMU=;
        fh=4pc1SPMJXzO/PAOO11pXgaUabHoX1M1rBZ6fP2J2Y2g=;
        b=aAO/KZc8auw196fIA0AkMZtLUt71t2rHmGEHL5D6k6cbmBpjLAhB/sVCkExYz5XzDR
         8WNme679Y+4ijBbpB8V1JVZ7ITYyPMw/CIYBxtzAtm5L7c153Wl54jktpQqw+i+05mFb
         dwR0TfM9ak8R70f36354RmXtsuZIyKOLwBhxtDKTwluBn7LywfhzWRDd9tTdp3M4syTS
         ljLK46028/XttLbAcGAnGBMhYY5GubZ0kv7LFKE9kM5zJ+0vQexDLrchFbwcGTrhANzC
         NvUIayevHkFwZvsIJztZwbEUMW580U57V29x07VDLWSaZ87n030VW9Lt7GeTsWZyL+Zv
         ZkEw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783585448; x=1784190248; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qGKXad+qaD2BA/lKmpU05ZIRYpZt1CvqKR8CHqzJNMU=;
        b=RTS6ZzcNr/uvhWP8Nsu8NhC4kmfEC3XkAOYFZRyrRpE3zTIVM2lzmDXhxe097nQ7rU
         xUVS8LTOgHcx84Txp32gP5POIGmWgnr2leNudlVIn1Kb7sE/4pIUjRyLnnwm6/eRatMU
         ScQlo/2B52MPZhmcBtoW2IHPuMYYilOuSmi2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783585448; x=1784190248;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qGKXad+qaD2BA/lKmpU05ZIRYpZt1CvqKR8CHqzJNMU=;
        b=hu+iXiy7bEK6UxFf1uFCJJ1BrKogNaLw1vj6iqTTXcjx4dYoDt5iankSIfzneP+geu
         RENe7XtR4BQw5sRPcf7Q2DUpGBxK9K/RlS04YAKHpFL01lzFTaExBRvO7VrLCx9SRrcu
         zv9Mvv0NK/IwhSXML5nUXg6ynbQGo9p8ZM/ga9fN1e+R0l+nkD+qAamEBZexJIjeUnJe
         4OsqI6PINL4eyZZG0uJbA0dTZ2ZsggX37VQfAzHB4jhbILa8N85ibJIu5ZsgRHDYSJTb
         HhyQmn6zqAUlq13cWDxbMNpg99LCytrQaBA5I2DOqa2JFdCkSdD2d1dTqFdQgsI5Czmr
         AtXA==
X-Forwarded-Encrypted: i=1; AHgh+RoQ6c+uATDTPddv6BDOe8BK4MrV5/l+8LoUtelMjG7sIKc3WyDoYrAxc0YPI7rdqvjKyakQCgmIkcVUqPuEJA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9rpVwAPba/2+Ov+HpoyaMgSuhyut8iwWeAK4n7bB6iQ9gtadZ
	IIgb7x19/Ps+5Rot9r3WOsklrGKSV9amxFnfeaBnEr5o3ZiJ4eg1RDtk+u47yh2p46/KESoLP4N
	NYEfYKaLsm0EGH2GvIJqQ7KkbWY74nnsgQGkbTwmS
X-Gm-Gg: AfdE7ck3KTbv25qHbKOr1j4XEV7AbjXNKQuZfpeBN/JQHUvnmB2urdX1Y9Tykpp46v4
	sEOoFNksgKFul2G3Jg8wrhO7rIxkrHDsTomIiESmL/RWllF710Eg0DrE0V6sZenNZzvV9BtEEQJ
	N34YREFBO7TIR3w74QrKZs2D+v9Zyvsv/6JpiPIMtcxB0tSSsfLAkf/fu+ARPvX9GgxKnLxTxu/
	M55/5yRot/5gyq/Mlb42CV/jfhXh0D31iNpfh40jp3qvLaMiPLLBKeJqYtHxXotdKtRYSmNuOgI
	tMH7LjDnD6bs2jqi7og11qLSPvw=
X-Received: by 2002:a05:690e:1488:b0:667:b0e0:8291 with SMTP id
 956f58d0204a3-667b0e08d1cmr3225605d50.76.1783585448536; Thu, 09 Jul 2026
 01:24:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260709063450.1615041-1-justin.yeh@mediatek.com> <20260709063450.1615041-3-justin.yeh@mediatek.com>
In-Reply-To: <20260709063450.1615041-3-justin.yeh@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Jul 2026 16:23:57 +0800
X-Gm-Features: AVVi8CeFISWopYSxs7SQ18PIDav4QpRQGIlGdzLDlOUjsSH_QaMt2NFEbeix8RQ
Message-ID: <CAGXv+5GOgtOGrnpZkJTeLPwW1t3hop6tXirGmV6thqP1q9REUA@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] pinctrl: mediatek: allow common drivers to be
 built as modules
To: Justin Yeh <justin.yeh@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_012409_671370_92CA2C9F 
X-CRM114-Status: GOOD (  24.95  )
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

On Thu, Jul 9, 2026 at 2:35=E2=80=AFPM Justin Yeh <justin.yeh@mediatek.com>=
 wrote:
>
> The MediaTek SoC pinctrl drivers link against the shared implementations
> in pinctrl-mtk-common.c (v1), pinctrl-moore.c and pinctrl-mtmips.c. These
> were built-in only: their Kconfig symbols were bool, they did not export
> their entry points and they carried no MODULE_LICENSE().
>
> To let the individual SoC drivers be built as loadable modules (required
> for Android GKI + vendor_dlkm, where vendor drivers must live outside the
> GKI vmlinux), the shared code they depend on has to be modular too.
> Otherwise selecting a SoC driver as =3Dm forces the common symbol to =3Dy=
 and
> the resulting module fails to link against the unexported common entry
> points.
>
> Convert PINCTRL_MTK, PINCTRL_MTK_MOORE and PINCTRL_MTK_MTMIPS to
> tristate, export the entry points used by the SoC drivers, and add
> MODULE_DESCRIPTION()/MODULE_LICENSE() to the three common files.
>
> The v2 common code (PINCTRL_MTK_V2) is already modular, but mtk_rmw() was
> never exported. It is called directly by SoC drivers such as mt7623, so
> export it as well to keep those drivers linking once they are modular.
>
> Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
> ---
>  drivers/pinctrl/mediatek/Kconfig                 | 6 +++---
>  drivers/pinctrl/mediatek/pinctrl-moore.c         | 5 +++++
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 1 +
>  drivers/pinctrl/mediatek/pinctrl-mtk-common.c    | 8 ++++++++
>  drivers/pinctrl/mediatek/pinctrl-mtmips.c        | 4 ++++
>  5 files changed, 21 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/=
Kconfig
> index 97980cc28b9c..864e7ffc6044 100644
> --- a/drivers/pinctrl/mediatek/Kconfig
> +++ b/drivers/pinctrl/mediatek/Kconfig
> @@ -11,7 +11,7 @@ config EINT_MTK
>         default PINCTRL_MTK_PARIS
>
>  config PINCTRL_MTK
> -       bool
> +       tristate
>         depends on OF
>         select PINMUX
>         select GENERIC_PINCONF
> @@ -22,13 +22,13 @@ config PINCTRL_MTK_V2
>         tristate
>
>  config PINCTRL_MTK_MTMIPS
> -       bool
> +       tristate
>         depends on RALINK
>         select PINMUX
>         select GENERIC_PINCONF
>
>  config PINCTRL_MTK_MOORE
> -       bool
> +       tristate
>         depends on OF
>         select GENERIC_PINCONF
>         select GENERIC_PINCTRL_GROUPS
> diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/m=
ediatek/pinctrl-moore.c
> index 38f15dbe9a28..3247622911cd 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-moore.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
> @@ -10,6 +10,7 @@
>
>  #include <dt-bindings/pinctrl/mt65xx.h>
>  #include <linux/gpio/driver.h>
> +#include <linux/module.h>
>
>  #include <linux/pinctrl/consumer.h>
>
> @@ -743,3 +744,7 @@ int mtk_moore_pinctrl_probe(struct platform_device *p=
dev,
>
>         return 0;
>  }
> +EXPORT_SYMBOL_GPL(mtk_moore_pinctrl_probe);

Maybe use a separate namespace, like "MTK_PINCTRL"? (Use EXPORT_SYMBOL_NS()=
)

Otherwise seems correct.

> +
> +MODULE_DESCRIPTION("MediaTek Pinctrl Common Driver V2 Moore");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/p=
inctrl/mediatek/pinctrl-mtk-common-v2.c
> index 4918d38abfc2..3813dfb0fa7d 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -69,6 +69,7 @@ void mtk_rmw(struct mtk_pinctrl *pctl, u8 i, u32 reg, u=
32 mask, u32 set)
>
>         spin_unlock_irqrestore(&pctl->lock, flags);
>  }
> +EXPORT_SYMBOL_GPL(mtk_rmw);
>
>  static int mtk_hw_pin_field_lookup(struct mtk_pinctrl *hw,
>                                    const struct mtk_pin_desc *desc,
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinc=
trl/mediatek/pinctrl-mtk-common.c
> index 791eddd7a2c6..a58015b508af 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> @@ -7,6 +7,7 @@
>
>  #include <linux/io.h>
>  #include <linux/gpio/driver.h>
> +#include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_irq.h>
>  #include <linux/pinctrl/consumer.h>
> @@ -190,6 +191,7 @@ int mtk_pconf_spec_set_ies_smt_range(struct regmap *r=
egmap,
>         regmap_write(regmap, reg_addr, bit);
>         return 0;
>  }
> +EXPORT_SYMBOL_GPL(mtk_pconf_spec_set_ies_smt_range);
>
>  static const struct mtk_pin_drv_grp *mtk_find_pin_drv_grp_by_pin(
>                 struct mtk_pinctrl *pctl,  unsigned long pin) {
> @@ -297,6 +299,7 @@ int mtk_pctrl_spec_pull_set_samereg(struct regmap *re=
gmap,
>
>         return 0;
>  }
> +EXPORT_SYMBOL_GPL(mtk_pctrl_spec_pull_set_samereg);
>
>  static int mtk_pconf_set_pull_select(struct mtk_pinctrl *pctl,
>                 unsigned int pin, bool enable, bool isup, unsigned int ar=
g)
> @@ -1149,6 +1152,7 @@ int mtk_pctrl_init(struct platform_device *pdev,
>
>         return 0;
>  }
> +EXPORT_SYMBOL_GPL(mtk_pctrl_init);
>
>  int mtk_pctrl_common_probe(struct platform_device *pdev)
>  {
> @@ -1160,3 +1164,7 @@ int mtk_pctrl_common_probe(struct platform_device *=
pdev)
>
>         return mtk_pctrl_init(pdev, data, NULL);
>  }
> +EXPORT_SYMBOL_GPL(mtk_pctrl_common_probe);
> +
> +MODULE_DESCRIPTION("MediaTek Pinctrl Common Driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtmips.c b/drivers/pinctrl/=
mediatek/pinctrl-mtmips.c
> index efd77b6c56a1..c9d9de68e282 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtmips.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtmips.c
> @@ -349,3 +349,7 @@ int mtmips_pinctrl_init(struct platform_device *pdev,
>
>         return PTR_ERR_OR_ZERO(dev);
>  }
> +EXPORT_SYMBOL_GPL(mtmips_pinctrl_init);
> +
> +MODULE_DESCRIPTION("MediaTek MIPS Pinctrl Common Driver");
> +MODULE_LICENSE("GPL v2");
> --
> 2.45.2
>
>

