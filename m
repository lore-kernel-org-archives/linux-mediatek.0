Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9212C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 07:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p38T6ONsqJBB8I2gm+3GfIE7L5VBdCJB+JJt2osSVWs=; b=jBQbuP8cztm5r4
	+ARusP/UkNSb7ZAR9oGGIFF+qpj/LFzKKDJZrZvIgirXUEzS4mQOSrHDt4f9qCUet2GOZmnzrs9CO
	D69VFbJmasEDABQwwUaWI6fRp0Cyv3ZACi+RbCHJxBEmXQXM3Xz+K5pVRmULnOJBf7vTJMoYzDXda
	jFUXk4qT8s4JICbYwHbyUKlmRwyF/d6K23hOzlMMM4KSBgf3vfgAqrMAV5zvTG/WzqT5EasfSWeQU
	dPxlzPZjGlN3bCVzCZSlRvw/JYJGdIIq/+zD1/Pv5sXzAba/YfJHFRbxa5QNAU1simWxTcxZL/+l1
	WvEIMdyEXvFjKsAvW+PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhRcI-00CDGu-Oo; Thu, 21 Apr 2022 07:52:42 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhRcA-00CDC4-JE
 for linux-mediatek@lists.infradead.org; Thu, 21 Apr 2022 07:52:36 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id w133so4597200ybe.5
 for <linux-mediatek@lists.infradead.org>; Thu, 21 Apr 2022 00:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0TSxfaRJixCAUsy/W0YnBm1Z96qqxM5YEF3UUxdXL0A=;
 b=O0bAOrR/OPesc12k+60IKnlLJE0jrSTcj0YLI1lgEdQzMVoPfHycKJksCpEzUre3Zh
 /InYBrd5hhV6xPePuu2QRdt8JwSAbKQsDgrrFYwrEHp8xDaO7wwMfOx6nHbTCF3jOu3p
 1Znq/Unn8vgjnxqPqjWNrjk4NA8O1q5xMbI4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0TSxfaRJixCAUsy/W0YnBm1Z96qqxM5YEF3UUxdXL0A=;
 b=QIb3FZwW/bbTAmY0/wwmR9KrT+24qjXhhqbecGnc1MbBEBWTKw8AT920FpPBXpEjL6
 BWu6d7A9IUfK9+tlg7UoEt5DB06T0iCmGPtNWTaO6PNfb3pL4fjTxByCC9udokHAkfkZ
 q+o20KGOpRhKskAIG9sGOWB2qcaZB6UcSFcg2KGX2Fz2XdLJYM/dEj2c9sUpIUyHQ5KU
 bbvhbJTTj7LLQUA79hRwWQIw9I448EplVjHUBbWz3qlI6C+a23my3Cj8VRqMUlExqrQB
 0PiljTHa+AsYxy0iHeZ9U1CivpERLVZzkksD/8ay/V+u9tgfwNVTub4YMsXnRp+vnbus
 /Tng==
X-Gm-Message-State: AOAM533nF2dWahc9j2J/RTO3oEy4BeFR/ClGPFH7Ooe2yoOvNA4/AFcR
 jVXaZ/ZbdWtl2uV7f8MS0LAVl854dP70THQJy0qgxw==
X-Google-Smtp-Source: ABdhPJyqt6Fgg3AF7Jbew907+pTxsU4C3o4jAvQcqeSLeYvWEOQ70ahpJmDA890Baw5jr3SxUODlQxxwEQAVCXygbdw=
X-Received: by 2002:a25:30d:0:b0:640:df7f:74c4 with SMTP id
 13-20020a25030d000000b00640df7f74c4mr23042769ybd.278.1650527552381; Thu, 21
 Apr 2022 00:52:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220420130527.23200-1-rex-bc.chen@mediatek.com>
 <20220420130527.23200-3-rex-bc.chen@mediatek.com>
In-Reply-To: <20220420130527.23200-3-rex-bc.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 21 Apr 2022 15:52:21 +0800
Message-ID: <CAGXv+5FJBKYoEuazH9broYSM4uOy=e_3O-86tOOQrsp0xH=4wQ@mail.gmail.com>
Subject: Re: [PATCH V2 02/12] clk: mediatek: reset: Use simple reset operations
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
 p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com, 
 chun-jie.chen@mediatek.com, runyang.chen@mediatek.com, 
 linux-kernel@vger.kernel.org, allen-kh.cheng@mediatek.com, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_005234_719201_5CA9CFAC 
X-CRM114-Status: GOOD (  14.17  )
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

On Wed, Apr 20, 2022 at 9:05 PM Rex-BC Chen <rex-bc.chen@mediatek.com> wrote:
>
> There are two version for clock reset register control of MediaTek SoCs.
> The reset operations before MT8183 can use simple reset to cover.

I would go slightly into more detail, i.e.

    The old hardware is one bit per reset control, and does not have
    separate registers for bit set, clear and read-back operations. This
    matches the scheme supported by the simple reset driver. ...

> Therefore, we replace mtk_reset_ops with reset_simple_ops.

   ... to remove redundant code.

The "why" is more important than "what" in commit logs. "What" you did
is already visible in the diff.

> In addition, we also rename mtk_register_reset_controller to
> mtk_register_reset_controller_simple.
>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/Kconfig          |  1 +
>  drivers/clk/mediatek/clk-mt2701-eth.c |  2 +-
>  drivers/clk/mediatek/clk-mt2701-g3d.c |  2 +-
>  drivers/clk/mediatek/clk-mt2701-hif.c |  2 +-
>  drivers/clk/mediatek/clk-mt2701.c     |  4 +--
>  drivers/clk/mediatek/clk-mt2712.c     |  4 +--
>  drivers/clk/mediatek/clk-mt7622-eth.c |  2 +-
>  drivers/clk/mediatek/clk-mt7622-hif.c |  4 +--
>  drivers/clk/mediatek/clk-mt7622.c     |  4 +--
>  drivers/clk/mediatek/clk-mt7629-eth.c |  2 +-
>  drivers/clk/mediatek/clk-mt7629-hif.c |  4 +--
>  drivers/clk/mediatek/clk-mt8135.c     |  4 +--
>  drivers/clk/mediatek/clk-mt8173.c     |  4 +--
>  drivers/clk/mediatek/clk-mtk.h        |  6 ++--
>  drivers/clk/mediatek/reset.c          | 43 +++------------------------
>  15 files changed, 27 insertions(+), 61 deletions(-)

[...]

>  void mtk_register_reset_controller_set_clr(struct device_node *np,
>         unsigned int num_regs, int regofs)
>  {
>         mtk_register_reset_controller_common(np, num_regs, regofs,
> -               &mtk_reset_ops_set_clr);
> +                                            &mtk_reset_ops_set_clr);

This change is unrelated and should not be included.

ChenYu


>  }
>
>  MODULE_LICENSE("GPL");
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
