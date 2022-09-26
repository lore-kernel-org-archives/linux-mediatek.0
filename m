Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14206C6FA82
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 08:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q89NyQ9b1PpoKXEkGp2ns+Ib3Shkz3cUPYaSufAXKUc=; b=YYOKVL984i3xg9qVZ7xF/n3iI6
	7ptTJRTutOjbP7JQGB3dTJlbVocEiOIgEX7s99yiAq66Y5aAJujUbtg+8looNHSrPE7esgCGi0cxR
	WY4ERyah9n4AUANRrICvxF6KrHcDPIJ1TnBfL1u/IbC4nPt+ThqjhAsN/yIG7ZttW+WJ69D/FXFwn
	MBAWhrfNv/fkCp/IxfA4YcxQNgp1NZiMrxItXRShUtJVhvP3dmUjnl9NFeiPsGRXjjt1ZzkU9Lkeh
	T5Y3ignoSX9mLnqTrKWiKUwxBaXbZHz4bQIT7l52T2xghlvzH9T4/bITg99daqi1QWHu03qB+DhH0
	gG5ANqVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocjvv-003NM0-A9; Mon, 26 Sep 2022 08:57:47 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocjvh-003NE7-EZ
	for linux-mediatek@lists.infradead.org; Mon, 26 Sep 2022 08:57:35 +0000
Received: by mail-ed1-x529.google.com with SMTP id z2so8065728edi.1
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Sep 2022 01:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=q89NyQ9b1PpoKXEkGp2ns+Ib3Shkz3cUPYaSufAXKUc=;
        b=n/ZXnZb952U5lWurVM94tkGD6ar7Ax0UfVipCAlGLuHtleFEQEIN8GHQ1RxzVtONhj
         In6/yRm/tdgCGv8hilqP8gcd7Oqi2ZwL3QVpyvlv8kYKqjGjKzLXsy+X0BGAE38HpLbD
         H/LXzx8uHjOrCBpNJnaINnVOmlDy+OhaZAJgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=q89NyQ9b1PpoKXEkGp2ns+Ib3Shkz3cUPYaSufAXKUc=;
        b=mzfXHQYeVUWE3gKQHlrKMJYP80nwqtYaO6xvoaRR2Vm9joeEnGooXNZtsAsPmTyYQE
         pkkH0j8sRBCtk38rV4wxXvVZUjyvvDNtLMykXzyYKR+v9Oh5zYJd4bPed5CXiysvUPtd
         qEDBHlm38Ul/e+PeFLndTkQT4JfU6jGDNv8SFp8W8zkfXgN3dYpYXD4FRsHEDHT6I5Lz
         h4Y68eW80O8mu5FZoZmmyGJ9Guo1x4vdTPNxTz+EkqkX3KbkIfkj2FcSRGpStUQ1FChc
         JgUco8ddylu4Mm+Z5punBuUSG3IcydgUFdxY0ildWjgfuPkp+LrSxizMxr5wLZ5Y3tKj
         PWXQ==
X-Gm-Message-State: ACrzQf3wFR4G/p/X9wSZnXZ8TQJlmUqvMmWmEH3B2TSphkNmTomvZMng
	XhYuPdBr9mSzu6i43zyZxBghF1PAF0IOm+OAkXT72Q==
X-Google-Smtp-Source: AMsMyM7HZwvp/a4tFxiTN7T+gF7HA3kkCdtKrxuJAFXrT6ZiR+YlsGYzpYjFqob4runlnShPtvtGPHUPzlbsMnmQ86Y=
X-Received: by 2002:a05:6402:90e:b0:443:ec4b:2b03 with SMTP id
 g14-20020a056402090e00b00443ec4b2b03mr20918608edz.71.1664182648982; Mon, 26
 Sep 2022 01:57:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220915072458.18232-1-angelogioacchino.delregno@collabora.com>
 <20220915072458.18232-6-angelogioacchino.delregno@collabora.com>
 <CAGXv+5HxEWPmLLi0zRrJ+T7bVcpoQoFt81+_ciXNDXRrGmfU6w@mail.gmail.com> <9f7d1eda-cdf3-5108-7e9d-a10937fe224e@collabora.com>
In-Reply-To: <9f7d1eda-cdf3-5108-7e9d-a10937fe224e@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 26 Sep 2022 16:57:17 +0800
Message-ID: <CAGXv+5HYKjDJALa6MAAE4XzRTMfE_vdEWg6XaWekUq7w8ko3BQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] clk: mediatek: clk-mt8195-mfg: Reparent mfg_bg3d
 and propagate rate changes
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	miles.chen@mediatek.com, rex-bc.chen@mediatek.com, nfraprado@collabora.com, 
	chun-jie.chen@mediatek.com, jose.exposito89@gmail.com, drinkcat@chromium.org, 
	weiyi.lu@mediatek.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_015733_496356_69E60C8A 
X-CRM114-Status: GOOD (  31.32  )
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

On Mon, Sep 26, 2022 at 4:36 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 26/09/22 05:27, Chen-Yu Tsai ha scritto:
> > On Thu, Sep 15, 2022 at 3:25 PM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> The MFG_BG3D is a gate to enable/disable clock output to the GPU,
> >> but the actual output is decided by multiple muxes; in particular:
> >> mfg_ck_fast_ref muxes between "slow" (top_mfg_core_tmp) and
> >> "fast" (MFGPLL) clock, while top_mfg_core_tmp muxes between the
> >> 26MHz clock and various system PLLs.
> >>
> >> This also implies that "top_mfg_core_tmp" is a parent of the
> >> "mfg_ck_fast_ref" mux (and not vice-versa), so reparent the
> >
> > I don't see where this was the case though? I think what you meant
> > was that the direct parent for "mfg_bg3d" is "mfg_ck_fast_ref, not
> > "top_mfg_core_tmp"?
> >
>
> MFG_BG3D's direct parent is mfg_ck_fast_ref - yes - but in the commit message
> I am explaining how the clock tree for MFG_BG3D really is and, in particular,
> I'm then explaining that:
> * parenting MFG_BG3D to "top_mfg_core_tmp" is wrong; because
> * "top_mfg_core_tmp" is a parent of "mfg_ck_fast_ref" (not the other way around).
>
> So, the question in your comment is addressed just a little later....
>
> >> MFG_BG3D gate to the latter and add the CLK_SET_RATE_PARENT
>
> ...here, where I say "reparent MFG_BG3D to the latter", where "the latter" is,
> exactly "mfg_ck_fast_ref".
>
> I hope you now understand what I am trying to communicate :-)
>
> However, if even after that you still think that the commit description should
> be rewritten in some less tangled and/or more understandable way, I definitely
> can do that.
>
> Please confirm :-)

I think

    This also implies that "top_mfg_core_tmp" is a parent of the
    "mfg_ck_fast_ref" mux (and not vice-versa)

actually confused me.

Maybe just say

    The clock gate comes after all the muxes, so its parent is
    mfg_ck_fast_ref, not top_mfg_core_tmp. Reparent mfg_bg3d to
    the latter to match the hardware ...

Since you are fixing the topology, could you also add a fixes tag?


Thanks
ChenYu


> >> flag to it: this way we ensure propagating rate changes that
> >> are requested on MFG_BG3D along its entire clock tree.
> >>
> >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> >
> > Otherwise,
> >
> > Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> >
> >
> >> ---
> >>   drivers/clk/mediatek/clk-mt8195-mfg.c | 6 ++++--
> >>   1 file changed, 4 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/clk/mediatek/clk-mt8195-mfg.c b/drivers/clk/mediatek/clk-mt8195-mfg.c
> >> index 9411c556a5a9..c94cb71bd9b9 100644
> >> --- a/drivers/clk/mediatek/clk-mt8195-mfg.c
> >> +++ b/drivers/clk/mediatek/clk-mt8195-mfg.c
> >> @@ -17,10 +17,12 @@ static const struct mtk_gate_regs mfg_cg_regs = {
> >>   };
> >>
> >>   #define GATE_MFG(_id, _name, _parent, _shift)                  \
> >> -       GATE_MTK(_id, _name, _parent, &mfg_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
> >> +       GATE_MTK_FLAGS(_id, _name, _parent, &mfg_cg_regs,       \
> >> +                      _shift, &mtk_clk_gate_ops_setclr,        \
> >> +                      CLK_SET_RATE_PARENT)
> >>
> >>   static const struct mtk_gate mfg_clks[] = {
> >> -       GATE_MFG(CLK_MFG_BG3D, "mfg_bg3d", "top_mfg_core_tmp", 0),
> >> +       GATE_MFG(CLK_MFG_BG3D, "mfg_bg3d", "mfg_ck_fast_ref", 0),
> >>   };
> >>
> >>   static const struct mtk_clk_desc mfg_desc = {
> >> --
> >> 2.37.2
> >>
>
>

