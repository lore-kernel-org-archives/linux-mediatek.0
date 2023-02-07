Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B14C636CD
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 08:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bJGUTHNzVk0CrDLPjREXJzjqiBi2pjaUdCgiLmgCaNE=; b=pTFtbSMu5UdQd4PGl7A1M1REZV
	zZeR7cVij9D+FS16uA/XoyqioQhmoUfZTGJeaUoi0dS4kwSxczb+K5gulD1numfGuDfb4vbQ1K7/5
	h9n5FfjJsRGvNXVlq/Rr+zwssdJ8bRY7xT0GsdiRTW68Scl6K2f/I/N4I7m+Y9jVDj5hXEzRdDhMh
	1LUFwCjnhfpfJQ4PR/CjersdAVytML7mJqOKjf5iELAVNN4F7ay/9iyACtSxglnxrytDn2WEgCi+4
	nRolAHq9i1/LqWIG/IXkN6B0MFIy18s3ZXPqTcU6T0GOlR32gJ5heStCOJw8tg50gH/II8mlHDs70
	vJmf6RNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPJo4-00BLVp-Sh; Tue, 07 Feb 2023 08:58:28 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPJnu-00BLTG-HJ
	for linux-mediatek@lists.infradead.org; Tue, 07 Feb 2023 08:58:19 +0000
Received: by mail-vs1-xe33.google.com with SMTP id k6so15533002vsk.1
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Feb 2023 00:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bJGUTHNzVk0CrDLPjREXJzjqiBi2pjaUdCgiLmgCaNE=;
        b=YsQ1SJKp9ric8eetL2Txcs9f3CUPHJidqRiInmtOn+W9Sgc4ANb5a4fPTp8NepJeK2
         d0BVtGtvFURucArLag7vF2lXxRRWEoM7QgEVoqkRdxp48E1/ZmvL0r9EtyNWyktyUKlT
         TDiqxW9IlaHadd8ZnNM+qtf7gED6kJrCCdDyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bJGUTHNzVk0CrDLPjREXJzjqiBi2pjaUdCgiLmgCaNE=;
        b=nBOh52rL5wnet21iwqr0UzdJCRorJdXcHJFaYfyXeQMWWAKbHHXpldE2Y4GAeUTQ1f
         PIVoBYRaO2Hk/xKj7TcOynFnVimzj5gdv16cevFUjx6EvbByGcgQB+QkUJhHRTSXT99k
         eTLMGPB+au0z2uaTVukNMPmJYZx7Tcz/3RmI/4FSh6hakDfoYqAChI0C+L62OpZYJGjH
         8ZwFagpLJhWl4yeEMYYa1+vtg3ZAtVan6aC/qlDfem5o/Ihn0PeBRwzjgm3fgp/Pg9Ra
         1tUE6KWjIWtymdW0Yyezl9LasvSPdMfrAwKaw1peSCgEjJUFJ74hQOMi27o/M2I36n/L
         F5Jw==
X-Gm-Message-State: AO0yUKW7fCdriQKYDW/skec7li+OnTa9GdR6+g/qg7Tmv5b7XS2Nwm+J
	p/DiK9fwOUu49uvjfY79leGHLPEUK2n2Xf3VynFwHA==
X-Google-Smtp-Source: AK7set8q/Np50pceKj/VI+JvmP79bjSmnUhKoBbzRgRnOhvnmB0W3alAQiNAxbYLsMfSSntXfkhvFzvLcr3TP50xUVc=
X-Received: by 2002:a05:6102:4b8:b0:3fe:ae88:d22 with SMTP id
 r24-20020a05610204b800b003feae880d22mr515509vsa.65.1675760294338; Tue, 07 Feb
 2023 00:58:14 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com>
 <20230206152928.918562-6-angelogioacchino.delregno@collabora.com>
 <CAGXv+5Gg60-4B29V9cYUw7b1OVcZvU+w9qdiiBbt10LJsAJiCA@mail.gmail.com> <93d95309-84eb-16c6-b64e-b0c43d784900@collabora.com>
In-Reply-To: <93d95309-84eb-16c6-b64e-b0c43d784900@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Feb 2023 16:58:03 +0800
Message-ID: <CAGXv+5HYLOuqzgepTbaT+3bAeDp3Ofa_JWLPqQ7M6e0dQrof4A@mail.gmail.com>
Subject: Re: [PATCH v1 05/45] clk: mediatek: mt2712: Migrate topckgen/mcucfg
 to mtk_clk_simple_probe()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com, 
	msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com, 
	yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com, 
	sean.wang@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_005818_613731_FA8337C4 
X-CRM114-Status: GOOD (  18.92  )
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

On Tue, Feb 7, 2023 at 4:45 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 07/02/23 07:15, Chen-Yu Tsai ha scritto:
> > On Mon, Feb 6, 2023 at 11:29 PM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Now that the common mtk_clk_simple_{probe,remove}() functions can deal
> >> with divider clocks it is possible to migrate more clock drivers to it:
> >> in this case, it's about topckgen.
> >> While at it, also perform a fast migration for mcucfg.
> >>
> >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> >
> > Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> >
> >> ---
> >>   drivers/clk/mediatek/clk-mt2712.c | 127 +++++-------------------------
> >>   1 file changed, 21 insertions(+), 106 deletions(-)
> >>
>
> ..snip..
>                       __func__, r);
> >> +static const struct mtk_clk_desc topck_desc = {
> >> +       .clks = top_clks,
> >> +       .num_clks = ARRAY_SIZE(top_clks),
> >> +       .fixed_clks = top_fixed_clks,
> >> +       .num_fixed_clks = ARRAY_SIZE(top_fixed_clks),
> >> +       .factor_clks = top_divs,
> >> +       .num_factor_clks = ARRAY_SIZE(top_divs),
> >> +       .composite_clks = top_muxes,
> >> +       .num_composite_clks = ARRAY_SIZE(top_muxes),
> >> +       .divider_clks = top_adj_divs,
> >> +       .num_divider_clks = ARRAY_SIZE(top_adj_divs),
> >> +       .clk_lock = &mt2712_clk_lock,
> >
> > At some point maybe we should look into splitting up the locks to one
> > per block, or converting everything to regmap.
> >
>
> I was thinking the same about the locks... but about regmap, that would
> actually add up some overhead at every R/W operation and I would really
> like to measure that precisely before doing any kind of regmap conversion
> for the MediaTek clocks.
>
> Perhaps I'll even find a way to avoid any kind of (even if small) overhead
> while doing that sometime in the future, which wouldn't be benefitting only
> MediaTek, but also other users like Qualcomm (as they have practically all
> clocks on regmap!).

Stephen would likely appreciate a unified regmap clock library :D

