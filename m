Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F84C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 08:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HWutFtMTg1X9lvFmA3vO0YEAlyYWqxQHK2ZQZBFxfQw=; b=hqOqigHRvtQiB0
	txps2SgzjiYqNmurrjOLIa17HoBEOEPuLgv4ttmyqi41kOupUw0ttdWt3hj7gjjnNeMdsclUFVlGH
	DncJpUmi+y3r7Wi4PQP/zay/18sv7C7vmLQ3YmpdAmEzzHlVnBRplu+AjV53erAfAV7yOr5HrgSr/
	FcJSGikKIJwXHsy2NNw/wr/UGdo849E86YPnrvMYAxLZp+rJaBs7ELPErm7wgDDwFuW6uy1ZC9OWB
	nFNckRPYfVZH9Jr3u9fZpL+P5oHqx71GbAmcO5MHrLIrCJr6z7uFAWLwD5pPgkPKPhD+HZZPd8kuC
	XGwUV/1kMjhD2QLkV8iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrbJX-005jVr-9h; Thu, 19 May 2022 08:15:19 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrbJU-005jUf-BA
 for linux-mediatek@lists.infradead.org; Thu, 19 May 2022 08:15:17 +0000
Received: by mail-ej1-x631.google.com with SMTP id ck4so4131478ejb.8
 for <linux-mediatek@lists.infradead.org>; Thu, 19 May 2022 01:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X/HlVYPwgofRxaTk6imTwB8PcUSbOstLV3YcDOYZEJw=;
 b=C3vj2wbP2x4bbj09+r76aN1AxNcBgryPCLNUzVfK9ssr5gwZFqmrgH6+KqAd2w4HyN
 lA2wyg3zoygVXPCj8pR3usPUaatLUlbBniZSF8pjBnJdH98Lwewl3yWT71aSs1Jw/Hz+
 PHPhyVleyj1rCb20psivjpiqMuwfK+FD1pBQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X/HlVYPwgofRxaTk6imTwB8PcUSbOstLV3YcDOYZEJw=;
 b=yfRf6LyJKKvbxQMI6qPZ7e23Nc0AfyJ36A5aMu00W7ZBGMuprSC/AaJ78lP19rdo8Q
 azNrevMjmoinzmsqVuKB70MuazRXIj/xct/ymDPkHbdIUykLuCMgr+JCsV9FVA+7aR6C
 Zl1jXFkpXpWICPgEcSM8QNiBWPKex7W9b92M5432feAIGnEdY9zUkh89aJ8JkGK0xLs0
 dO3XPoBR38iQwcVVkP9+1odpuFP/xmphYNGVacEIvmlQ4gAny3qz00qNNn8dRMJ3liPN
 DwA739cB2CWD1IfRcqgutxz+G1FHE1/dxPADTxZbpYigrBUkTM8dWbqHBvOF6/UpJIAF
 gDnA==
X-Gm-Message-State: AOAM530y4SXHraCfKyS58ksYXvgJoZMXrIwWDrMFGUsEv5KnqOYw6Cbb
 xeoQYgfs0klVV2+g0nQDtj2CHYIyvgnFtdjvvEEnkA==
X-Google-Smtp-Source: ABdhPJyq1UEZvSBP5DeREc22IsYZ7V5DeEyqmra4f8ewtbbNU+RcW98uM0dpOvj+yTS2WcylmOX0KhE9hY8on/dkFNk=
X-Received: by 2002:a17:907:1b14:b0:6ef:a5c8:afbd with SMTP id
 mp20-20020a1709071b1400b006efa5c8afbdmr3221451ejc.151.1652948114080; Thu, 19
 May 2022 01:15:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220518111652.223727-7-angelogioacchino.delregno@collabora.com>
 <20220519044153.11078-1-miles.chen@mediatek.com>
 <7e60b63c-2bf7-a77e-fe0f-a891efa77a47@collabora.com>
In-Reply-To: <7e60b63c-2bf7-a77e-fe0f-a891efa77a47@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 19 May 2022 16:15:03 +0800
Message-ID: <CAGXv+5FiteAu7in-CnmVUkDKy=ub1X6etyK1--PHPYKO3FPa=w@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] clk: mediatek: Export required symbols to compile
 clk drivers as module
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Miles Chen <miles.chen@mediatek.com>, bgolaszewski@baylibre.com, 
 chun-jie.chen@mediatek.com, ck.hu@mediatek.com, devicetree@vger.kernel.org, 
 fparent@baylibre.com, ikjn@chromium.org, jason-jh.lin@mediatek.com, 
 kernel@collabora.com, konrad.dybcio@somainline.org, 
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, marijn.suijten@somainline.org, 
 martin.botka@somainline.org, matthias.bgg@gmail.com, mturquette@baylibre.com, 
 p.zabel@pengutronix.de, paul.bouchara@somainline.org, 
 phone-devel@vger.kernel.org, rex-bc.chen@mediatek.com, robh+dt@kernel.org, 
 sam.shih@mediatek.com, sboyd@kernel.org, tinghan.shen@mediatek.com, 
 weiyi.lu@mediatek.com, y.oudjana@protonmail.com, 
 ~postmarketos/upstreaming@lists.sr.ht
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_011516_442279_B096A238 
X-CRM114-Status: GOOD (  20.07  )
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

On Thu, May 19, 2022 at 4:05 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 19/05/22 06:41, Miles Chen ha scritto:
> >
> > Hi Angelo,
> >
> >> In order to compile the clock drivers for various MediaTek SoCs as
> >> modules, it is necessary to export a few functions from the MediaTek
> >> specific clocks (and reset) libraries.
> >>
> >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> >> ---
> >> drivers/clk/mediatek/clk-apmixed.c | 1 +
> >> drivers/clk/mediatek/clk-cpumux.c  | 2 ++
> >> drivers/clk/mediatek/clk-mtk.c     | 2 ++
> >> drivers/clk/mediatek/reset.c       | 1 +
> >> 4 files changed, 6 insertions(+)
> >>
> >> diff --git a/drivers/clk/mediatek/clk-apmixed.c b/drivers/clk/mediatek/clk-apmixed.c
> >> index 6b0ab0a346e8..f126da693a7f 100644
> >> --- a/drivers/clk/mediatek/clk-apmixed.c
> >> +++ b/drivers/clk/mediatek/clk-apmixed.c
> >> @@ -98,5 +98,6 @@ struct clk_hw *mtk_clk_register_ref2usb_tx(const char *name,
> >>
> >>      return &tx->hw;
> >> }
> >> +EXPORT_SYMBOL_GPL(mtk_clk_register_ref2usb_tx);
> >>
> >> MODULE_LICENSE("GPL");
> >> diff --git a/drivers/clk/mediatek/clk-cpumux.c b/drivers/clk/mediatek/clk-cpumux.c
> >> index 2b5d48591738..25618eff6f2a 100644
> >> --- a/drivers/clk/mediatek/clk-cpumux.c
> >> +++ b/drivers/clk/mediatek/clk-cpumux.c
> >> @@ -150,6 +150,7 @@ int mtk_clk_register_cpumuxes(struct device_node *node,
> >>
> >>      return PTR_ERR(hw);
> >> }
> >> +EXPORT_SYMBOL_GPL(mtk_clk_register_cpumuxes);
> >>
> >> void mtk_clk_unregister_cpumuxes(const struct mtk_composite *clks, int num,
> >>                               struct clk_hw_onecell_data *clk_data)
> >> @@ -166,5 +167,6 @@ void mtk_clk_unregister_cpumuxes(const struct mtk_composite *clks, int num,
> >>              clk_data->hws[mux->id] = ERR_PTR(-ENOENT);
> >>      }
> >> }
> >> +EXPORT_SYMBOL_GPL(mtk_clk_unregister_cpumuxes);
> >>
> >> MODULE_LICENSE("GPL");
> >> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
> >> index 05a188c62119..41e60a7e8ff9 100644
> >> --- a/drivers/clk/mediatek/clk-mtk.c
> >> +++ b/drivers/clk/mediatek/clk-mtk.c
> >> @@ -459,6 +459,7 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
> >>      mtk_free_clk_data(clk_data);
> >>      return r;
> >> }
> >> +EXPORT_SYMBOL_GPL(mtk_clk_simple_probe);
> >>
> >> int mtk_clk_simple_remove(struct platform_device *pdev)
> >> {
> >> @@ -472,5 +473,6 @@ int mtk_clk_simple_remove(struct platform_device *pdev)
> >>
> >>      return 0;
> >> }
> >> +EXPORT_SYMBOL_GPL(mtk_clk_simple_remove);
> >
> > Thanks, I need this too. I am preparing a patch to use mtk_clk_simple_remove/mtk_clk_simple_probe
> > for MT6779 clks first and maybe I can apply this to all MediaTek clk drivers.
> >
> > Reviewed-by: Miles Chen <miles.chen@mediatek.com>
>
> Hello Miles,
>
> thanks for telling me, because my next step would have been exactly what
> you're doing, for all MediaTek clk drivers... otherwise we'd be doing
> redundant work going afterwards.

Should we consider using symbol namespaces (EXPORT_SYMBOL_NS)?

ChenYu

> Regards,
> Angelo
>
> >
> > thanks,
> > Miles
> >>
> >> MODULE_LICENSE("GPL");
> >> diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
> >> index 179505549a7c..290ceda84ce4 100644
> >> --- a/drivers/clk/mediatek/reset.c
> >> +++ b/drivers/clk/mediatek/reset.c
> >> @@ -228,5 +228,6 @@ int mtk_register_reset_controller_with_dev(struct device *dev,
> >>
> >>      return 0;
> >> }
> >> +EXPORT_SYMBOL_GPL(mtk_register_reset_controller_with_dev);
> >>
> >> MODULE_LICENSE("GPL");
> >> --
> >> 2.35.1
> >>
> >>
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
