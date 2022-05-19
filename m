Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F1BDC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 08:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4f29PO2+StOj0Br/bbzJ6Alj2Y100GwFklzAeXwTEh0=; b=ctif1fjbAs8v7Y
	2J+zyHLWiPXjEBCzp2+FFkWRb8KgbFcMhhWs7gQWNdEaN933ncoYYn8rI/hXn/26gsc3cI1UxacFj
	ckA495NhZou9JcFv2F1f8o/gmRHh9zbb5GpzmGCoOicU3c1a6Eq2eqO6zPA10KwucIXGyBC7iqoks
	3QLwOGMjY0BEQOxoojs3uMboQjw4IJ+ernnjdgz6KmQY97BPVEsSzizPwVR77kjvORDnQvu2K7pbP
	U0qWOFJM+vnWHKMFASeIJQleyqkgbv8N3wGhMs1925uAYMtJ1fUs9vvK0IXlxNfN56u6FjBxTe+aV
	vBxE253CN3uz1Mogo1/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrbnM-005xCf-Qp; Thu, 19 May 2022 08:46:08 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrbnJ-005xB3-7Z
 for linux-mediatek@lists.infradead.org; Thu, 19 May 2022 08:46:07 +0000
Received: by mail-ej1-x62b.google.com with SMTP id gi33so54628ejc.3
 for <linux-mediatek@lists.infradead.org>; Thu, 19 May 2022 01:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R1UJqj/pkW+UdftCSNcz+tgzAZ+j9Z8JSlJihPFE/pE=;
 b=Kz0T+20kWI33J+8FREY+GO/jU52aA83gMmXXey3+lFJzzs4O6V55QaiqvIstUHyQp1
 LFOpLQVAvfwww80/2wWjU8Nyrn998ft8ttoPN5yHiU1mLAAlea+LeHO6AH/hpitrWFdo
 M7LdSSJ+y6US+7h0GY5q/D+fqR/XPO74W2AaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R1UJqj/pkW+UdftCSNcz+tgzAZ+j9Z8JSlJihPFE/pE=;
 b=5y+lE0EIM5dQ/W4YmEs/fgLlYJFBQKeh9RP60D9qx2JhJezzogtRDsmwss3vyPHZLo
 ppm6jT+0rx7g+9VDXvodaZBoPC6OHNAROvIqHMXmam3588Csxj368g2sdiPzCWC3Ttu6
 Hp78M2YWpiiim3v7MMfVPQto1D4Klp6L1LOMCdXmnD1GrSOKk2QGtuAbjbvo7LKXLfUt
 2N5+J99XOEghndmPg9m4pUlIy61Fj1G5MSO6sXYQPCFiBcXaKHinEm4K3n6HusI9wgs9
 GYOa+LoIUWcnZoo2fw438KAIz0jH/AYqbwe/ODTRbRuPb0ZlycK0IXmMxLXZrUMgIqzo
 MWJg==
X-Gm-Message-State: AOAM5316JBS6T+XWojEPOmdJeLoJJkkCihKYPY3WpVI6+gWXiiyRnPpS
 QBAle5qpK5eMumgvMzDBYn5PJNAH+4Yj1AehETlksQ==
X-Google-Smtp-Source: ABdhPJzhCok9mwoNFwX8hp+iq4r0zfazXJkBtazp/ZX0YjRO6MxlH2JwTaSCzcg8S2ZUKdpfU7r0yMDH869rIqV1Gh8=
X-Received: by 2002:a17:906:a10e:b0:6f3:e70b:b572 with SMTP id
 t14-20020a170906a10e00b006f3e70bb572mr3104969ejy.546.1652949963623; Thu, 19
 May 2022 01:46:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220518111652.223727-7-angelogioacchino.delregno@collabora.com>
 <20220519044153.11078-1-miles.chen@mediatek.com>
 <7e60b63c-2bf7-a77e-fe0f-a891efa77a47@collabora.com>
 <CAGXv+5FiteAu7in-CnmVUkDKy=ub1X6etyK1--PHPYKO3FPa=w@mail.gmail.com>
 <3981552b-2153-1b87-f345-2b1f9be6c56f@collabora.com>
In-Reply-To: <3981552b-2153-1b87-f345-2b1f9be6c56f@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 19 May 2022 16:45:52 +0800
Message-ID: <CAGXv+5GwqLKvM3yReZMW92ZC3nDwdbD+_x8ROBOjppgnsgGkyw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220519_014605_335710_0C4EDA2D 
X-CRM114-Status: GOOD (  28.48  )
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

On Thu, May 19, 2022 at 4:26 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
> Il 19/05/22 10:15, Chen-Yu Tsai ha scritto:
> > On Thu, May 19, 2022 at 4:05 PM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Il 19/05/22 06:41, Miles Chen ha scritto:
> >>>
> >>> Hi Angelo,
> >>>
> >>>> In order to compile the clock drivers for various MediaTek SoCs as
> >>>> modules, it is necessary to export a few functions from the MediaTek
> >>>> specific clocks (and reset) libraries.
> >>>>
> >>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> >>>> ---
> >>>> drivers/clk/mediatek/clk-apmixed.c | 1 +
> >>>> drivers/clk/mediatek/clk-cpumux.c  | 2 ++
> >>>> drivers/clk/mediatek/clk-mtk.c     | 2 ++
> >>>> drivers/clk/mediatek/reset.c       | 1 +
> >>>> 4 files changed, 6 insertions(+)
> >>>>
> >>>> diff --git a/drivers/clk/mediatek/clk-apmixed.c b/drivers/clk/mediatek/clk-apmixed.c
> >>>> index 6b0ab0a346e8..f126da693a7f 100644
> >>>> --- a/drivers/clk/mediatek/clk-apmixed.c
> >>>> +++ b/drivers/clk/mediatek/clk-apmixed.c
> >>>> @@ -98,5 +98,6 @@ struct clk_hw *mtk_clk_register_ref2usb_tx(const char *name,
> >>>>
> >>>>       return &tx->hw;
> >>>> }
> >>>> +EXPORT_SYMBOL_GPL(mtk_clk_register_ref2usb_tx);
> >>>>
> >>>> MODULE_LICENSE("GPL");
> >>>> diff --git a/drivers/clk/mediatek/clk-cpumux.c b/drivers/clk/mediatek/clk-cpumux.c
> >>>> index 2b5d48591738..25618eff6f2a 100644
> >>>> --- a/drivers/clk/mediatek/clk-cpumux.c
> >>>> +++ b/drivers/clk/mediatek/clk-cpumux.c
> >>>> @@ -150,6 +150,7 @@ int mtk_clk_register_cpumuxes(struct device_node *node,
> >>>>
> >>>>       return PTR_ERR(hw);
> >>>> }
> >>>> +EXPORT_SYMBOL_GPL(mtk_clk_register_cpumuxes);
> >>>>
> >>>> void mtk_clk_unregister_cpumuxes(const struct mtk_composite *clks, int num,
> >>>>                                struct clk_hw_onecell_data *clk_data)
> >>>> @@ -166,5 +167,6 @@ void mtk_clk_unregister_cpumuxes(const struct mtk_composite *clks, int num,
> >>>>               clk_data->hws[mux->id] = ERR_PTR(-ENOENT);
> >>>>       }
> >>>> }
> >>>> +EXPORT_SYMBOL_GPL(mtk_clk_unregister_cpumuxes);
> >>>>
> >>>> MODULE_LICENSE("GPL");
> >>>> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
> >>>> index 05a188c62119..41e60a7e8ff9 100644
> >>>> --- a/drivers/clk/mediatek/clk-mtk.c
> >>>> +++ b/drivers/clk/mediatek/clk-mtk.c
> >>>> @@ -459,6 +459,7 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
> >>>>       mtk_free_clk_data(clk_data);
> >>>>       return r;
> >>>> }
> >>>> +EXPORT_SYMBOL_GPL(mtk_clk_simple_probe);
> >>>>
> >>>> int mtk_clk_simple_remove(struct platform_device *pdev)
> >>>> {
> >>>> @@ -472,5 +473,6 @@ int mtk_clk_simple_remove(struct platform_device *pdev)
> >>>>
> >>>>       return 0;
> >>>> }
> >>>> +EXPORT_SYMBOL_GPL(mtk_clk_simple_remove);
> >>>
> >>> Thanks, I need this too. I am preparing a patch to use mtk_clk_simple_remove/mtk_clk_simple_probe
> >>> for MT6779 clks first and maybe I can apply this to all MediaTek clk drivers.
> >>>
> >>> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> >>
> >> Hello Miles,
> >>
> >> thanks for telling me, because my next step would have been exactly what
> >> you're doing, for all MediaTek clk drivers... otherwise we'd be doing
> >> redundant work going afterwards.
> >
> > Should we consider using symbol namespaces (EXPORT_SYMBOL_NS)?
> >
>
> I don't think we should... I don't know if any module in the common clock
> framework is doing that, but if we want some symbol namespace separation,
> we would want that "at least" on the entire MediaTek framework, right? :-)

The sunxi-ng clk driver recently started doing this. See:

    http://git.kernel.org/torvalds/c/551b62b1e4cb64d3b42da0fbfdcd26a5fcd684be

And it's being done for all kinds of common driver libraries.

I agree that it would be done for the entire MediaTek framework.

> In that case, we can simply keep using EXPORT_SYMBOL_GPL() and change the
> Makefile in this directory to add:
>
>         ccflags-y += -DDEFAULT_SYMBOL_NAMESPACE=COMMON_CLK_MEDIATEK

Oh, I didn't know of this trick. Nice. :D

I think we still need to add MODULE_IMPORT_NS() statements, right?

> ...but that's surely out of scope for this specific patch series.
>
> What do you think?

It's definitely out of scope, but nice to have, to reduce the size of the
default symbol table, and limit the usage of the symbols the driver exports.

Regards
ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
