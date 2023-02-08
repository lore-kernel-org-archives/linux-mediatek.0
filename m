Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BEC7C05027
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 08:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+tHCOo8sJZFp5flt13By50o4tNKKdblBZ0IURhBoSow=; b=Ka3QfzvOoPPTLNF8YyvyxzN5VV
	HMgrj6IhsHWvxHLopNpsztADLK/wL4K2IjPHx6BdtqDqpqK/RlxZR4FB6+jsGcCFdJJtkALlpKQ5R
	Cl9HnuEEve4BrLZfWXbXT1ndOcH1mmwZijzBH0qi460Q3RtCgjHgymcmdFCKgxCtQJbdEcXp60rbM
	kdMdtsvaWplSWPvynrkpJubqHSvjHx2nyDz0GDR3/es8d2n2+oypBMlpM3+l7LzBXg2WtsBFDpiUe
	EvMkglqxBnTERNEUMluq4ZJW6USNozfD4NtEqJ5NYM9eTeaAdCP6EAW6sdH+NakWdUELRjujexYxl
	1hyBJL8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPfel-00EZRF-Jj; Wed, 08 Feb 2023 08:18:19 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPfeZ-00EZLq-TH
	for linux-mediatek@lists.infradead.org; Wed, 08 Feb 2023 08:18:10 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id d66so19001122vsd.9
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Feb 2023 00:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+tHCOo8sJZFp5flt13By50o4tNKKdblBZ0IURhBoSow=;
        b=DWoNKb7tfi9icZU4oIKLPqnab+Sj0mZeDxOTR23zSyVv7NUeoHIV9jah/FfcehBZT3
         IvIRbnr6y0oAMomfg/Vi3ZeAh9tQS087u25cYyphjBfXSXgI1shgp9tVmT72JbqiP0dp
         l87j3oZbJaWOEfU9eE25Kttipo2uV6TJwUUHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+tHCOo8sJZFp5flt13By50o4tNKKdblBZ0IURhBoSow=;
        b=v4+gIGp9GkXAaMCcNKGuFUCY2g4YwU+3yre09EjMOcyZXE8vn7jK/Z5y8susgisMFx
         6LOidVfe3FUaKrUky4gtB3pXPF7v2AtMKHQm0r9opKBAuk1/hU5d6fzZMDkUQG4iQA4U
         s8RwxEFCten1TOnoyKemKNYIEQ0WxS4l9OtN3He7miomrhw7/XwITYxVnXFyskopqx+8
         4P0i6ZLqxZRur8B5yiFnxaYbGRexUX70djoBZoD1n03B0unjtYdD89UGa3p0T3jfspVE
         09YdL43PIZy9QZg4gfm6x4pi3AMIRFN0C6MkGGNzaswmyzNHgtShzCUgbixKqd05D5ZA
         yzaQ==
X-Gm-Message-State: AO0yUKUv4U3QuS9NSF2+jzyNpfI6YrJ0wcslndp1YLZEgJPSxITL6Lwb
	HiM2C0M5i9tG2KdiSw9g0pmMnBykwS+wGHCjhOzknA==
X-Google-Smtp-Source: AK7set/N9Zr6zqMMbyyTI+mcr75A04f7/sCiIHNtPyBlQMz3Kxdbrzdom/HO0bm0zxky0AHBLxotaH+PXfBWROHsdto=
X-Received: by 2002:a67:1904:0:b0:3e8:d5a8:3fbe with SMTP id
 4-20020a671904000000b003e8d5a83fbemr1650981vsz.9.1675844280469; Wed, 08 Feb
 2023 00:18:00 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com>
 <20230206152928.918562-20-angelogioacchino.delregno@collabora.com>
 <CAGXv+5G0ksgGMXUGk-=CXUANtGQa2M5RLY+wG7c-0cMSKS5DJQ@mail.gmail.com> <7adadf24-c14f-6eb4-edfd-265dca93e907@collabora.com>
In-Reply-To: <7adadf24-c14f-6eb4-edfd-265dca93e907@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 8 Feb 2023 16:17:49 +0800
Message-ID: <CAGXv+5Ftq6RfAHkF3KxZNPx17MMFBtpDWqg=DLVDWo1pJwVijg@mail.gmail.com>
Subject: Re: [PATCH v1 19/45] clk: mediatek: mt8183: Convert all remaining
 clocks to common probe
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
X-CRM114-CacheID: sfid-20230208_001807_969004_E791F20E 
X-CRM114-Status: GOOD (  29.14  )
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

On Tue, Feb 7, 2023 at 8:14 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
> Il 07/02/23 10:58, Chen-Yu Tsai ha scritto:
> > On Mon, Feb 6, 2023 at 11:30 PM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Switch to mtk_clk_simple_{probe,remove}() for infracfg and topckgen
> >> clocks on MT8183 to allow full module build for clock drivers.
> >> In order to do this, like done for other MediaTek clock drivers, it
> >> was necessary to join top_early_divs with top_divs and to stop
> >> registering the `clk13m` clock early.
> >>
> >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> >> ---
> >>   drivers/clk/mediatek/clk-mt8183.c | 160 ++++++------------------------
> >>   1 file changed, 28 insertions(+), 132 deletions(-)
> >>
> >> diff --git a/drivers/clk/mediatek/clk-mt8183.c b/drivers/clk/mediatek/clk-mt8183.c
> >> index 0fad2cf7f41b..035fdd02f0be 100644
> >> --- a/drivers/clk/mediatek/clk-mt8183.c
> >> +++ b/drivers/clk/mediatek/clk-mt8183.c
> >> @@ -25,11 +25,8 @@ static const struct mtk_fixed_clk top_fixed_clks[] = {
> >>          FIXED_CLK(CLK_TOP_UNIVP_192M, "univpll_192m", "univpll", 192000000),
> >>   };
> >>
> >> -static const struct mtk_fixed_factor top_early_divs[] = {
> >> -       FACTOR(CLK_TOP_CLK13M, "clk13m", "clk26m", 1, 2),
> >> -};
> >> -
> >>   static const struct mtk_fixed_factor top_divs[] = {
> >> +       FACTOR(CLK_TOP_CLK13M, "clk13m", "clk26m", 1, 2),
> >
> > A clock with the same name is now present in the DT, and so this clock
> > would fail to register. We should drop this one completely and point
> > any references to it internally to "csw_f26m_ck_d2".
> >
> >>          FACTOR(CLK_TOP_F26M_CK_D2, "csw_f26m_ck_d2", "clk26m", 1, 2),
> >
> > MT8192 and MT8195 aren't affected because they only have "csw_f26m_ck_d2",
> > which systimer was referencing.
> >
> >>          FACTOR_FLAGS(CLK_TOP_SYSPLL_CK, "syspll_ck", "mainpll", 1, 1, 0),
> >>          FACTOR_FLAGS(CLK_TOP_SYSPLL_D2, "syspll_d2", "syspll_ck", 1, 2, 0),
> >> @@ -809,26 +806,6 @@ static const struct mtk_clk_rst_desc clk_rst_desc = {
> >>          .rst_bank_nr = ARRAY_SIZE(infra_rst_ofs),
> >>   };
> >>
> >> -static struct clk_hw_onecell_data *top_clk_data;
> >> -
> >> -static void clk_mt8183_top_init_early(struct device_node *node)
> >> -{
> >> -       int i;
> >> -
> >> -       top_clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
> >> -
> >> -       for (i = 0; i < CLK_TOP_NR_CLK; i++)
> >> -               top_clk_data->hws[i] = ERR_PTR(-EPROBE_DEFER);
> >> -
> >> -       mtk_clk_register_factors(top_early_divs, ARRAY_SIZE(top_early_divs),
> >> -                       top_clk_data);
> >
> > And since we used to not do error checking, the name conflict was OK.
> > With the new common probe, it's not.
> >
>
> That makes me proud of my changes to extend the new common probe mechanism,
> as this is one of (hopefully not) many wrongs that slipped through without
> any apparent issue.
> Anyway, there was no reference to this clk13m (nor CLK_TOP_CLK13M) anywhere
> so I changed this commit to just "forget about this clock" (advertising the
> reason in the commit description, of course).

I think I should send this as a separate patch as a follow-up to the systimer
changes. And we should keep the CLK_TOP_CLK13M entry valid, since that's
the entry referenced in old DTs, but change its name to "csw_f26m_ck_d2".

In short we are actually merging CLK_TOP_CLK13M and CLK_TOP_F26M_CK_D2,
with the former surviving but with a name change. CLK_TOP_F26M_CK_D2
is only referenced internally in TOPCKGEN.

> Is MT8183's cpufreq working after this change, or is it still not behaving?

Yes it's back.

ChenYu

