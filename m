Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7126C32771
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 03:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1z+K3iZ5edH9Wvs3sWpMytE5kCGm2zb+7oEAH+Nf3iQ=; b=iB1V8sQs1t6pL2Ct24Cv3MOJZC
	7YU4MLZuaATYeQ4uTcXlLGnVf9VRoCN7jd2qAOWMMsEbXeTR6I2hVrhyxnWZnNBuGfdBRK5YXy4dh
	Ch1c2AlwG0gVt26hsyplyU0tET0CkKSGFraHMaX4eyFunadRH/x8m0097nQ0e4KKT6Zmox63cSIV7
	8/IZbjf9IW+kLvdBrAROp5KqggsJGmZZECG8GfGYP8r99TprP5iRFtZRzI0u6DwvuQDcJ2EIjxHBx
	F3KXSmcR6vqn9pmQMR1VD7mfgA28Yrh5US1DGoC5GakbxZHWgxH4Z2MeM7+2QNjG5SMDmiLhUSRhr
	3s5tfZDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocemz-001NNO-BC; Mon, 26 Sep 2022 03:28:13 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocemZ-001NEo-H4
	for linux-mediatek@lists.infradead.org; Mon, 26 Sep 2022 03:27:49 +0000
Received: by mail-ed1-x52c.google.com with SMTP id y8so7227931edc.10
        for <linux-mediatek@lists.infradead.org>; Sun, 25 Sep 2022 20:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=1z+K3iZ5edH9Wvs3sWpMytE5kCGm2zb+7oEAH+Nf3iQ=;
        b=eJhq7Fc27wKeinfDqhvMNOiJ/Gb1/og0KmVp3G+UnwXEDuClmgZJTTtEdniYEEOZTu
         PkHeKnkfj5Nz22Ox5Hm6qKfgc47pn/rMMFS/mdiS+DoqM4BTAKvibBmdiJ5XQLJZrvMQ
         qyrnEu2NdvfYAGMs7Cl67PsiuzyzFdl8K592U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=1z+K3iZ5edH9Wvs3sWpMytE5kCGm2zb+7oEAH+Nf3iQ=;
        b=u3hl61vI8bx0+ZVLXysJ9SzU/xgjCzs4cvUxgiUVijPi2gknAIMjnckelJi5E3Ekj6
         zWw97I76Og0AcQqlKGmyKvNOuOK+IViXQkRH4Y2syfaa5M3x6OD64VX7W6KGG40exkDe
         yF3I0TyIY8OAQzQVQLY//ZEFKv7uTbXhT7sKx8B0kDYX2Vrv7xcuHFHCL4qxa3AMrAB9
         j3sZ22u/zmjYxvRNap/cY3y31M1Nf5BIAkgQoWnNiH0LnRXsPdcpp9c4On2M0Y+0uRmc
         RnR7/zLF2nFgMizYbQJ26VMVfkCCY4ybS5CrHqfKk9daZlv9xdGnv50zCwKWgYeozpEI
         gOOQ==
X-Gm-Message-State: ACrzQf1sTehI0oZQolw7c2MVGZklbhzKrpIO20NDOnRtSkxEfgfHvbgf
	qGMzmParB/xlcsVU+5LZ2MYpy4RwvDBcaQE+9aCAmw==
X-Google-Smtp-Source: AMsMyM5D3keac5HMYAnwObUUepcFX4Nc0uJR6fxSr+8PfMtKkHus/shERelQElMbLNntt0PEAz4+xxwiFElIWC2rDqQ=
X-Received: by 2002:a05:6402:3549:b0:454:414e:a7fd with SMTP id
 f9-20020a056402354900b00454414ea7fdmr21116157edd.69.1664162864997; Sun, 25
 Sep 2022 20:27:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220915072458.18232-1-angelogioacchino.delregno@collabora.com> <20220915072458.18232-6-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220915072458.18232-6-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 26 Sep 2022 11:27:33 +0800
Message-ID: <CAGXv+5HxEWPmLLi0zRrJ+T7bVcpoQoFt81+_ciXNDXRrGmfU6w@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220925_202747_601946_EE9A6684 
X-CRM114-Status: GOOD (  18.75  )
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

On Thu, Sep 15, 2022 at 3:25 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The MFG_BG3D is a gate to enable/disable clock output to the GPU,
> but the actual output is decided by multiple muxes; in particular:
> mfg_ck_fast_ref muxes between "slow" (top_mfg_core_tmp) and
> "fast" (MFGPLL) clock, while top_mfg_core_tmp muxes between the
> 26MHz clock and various system PLLs.
>
> This also implies that "top_mfg_core_tmp" is a parent of the
> "mfg_ck_fast_ref" mux (and not vice-versa), so reparent the

I don't see where this was the case though? I think what you meant
was that the direct parent for "mfg_bg3d" is "mfg_ck_fast_ref, not
"top_mfg_core_tmp"?

> MFG_BG3D gate to the latter and add the CLK_SET_RATE_PARENT
> flag to it: this way we ensure propagating rate changes that
> are requested on MFG_BG3D along its entire clock tree.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>


> ---
>  drivers/clk/mediatek/clk-mt8195-mfg.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-mt8195-mfg.c b/drivers/clk/mediatek/clk-mt8195-mfg.c
> index 9411c556a5a9..c94cb71bd9b9 100644
> --- a/drivers/clk/mediatek/clk-mt8195-mfg.c
> +++ b/drivers/clk/mediatek/clk-mt8195-mfg.c
> @@ -17,10 +17,12 @@ static const struct mtk_gate_regs mfg_cg_regs = {
>  };
>
>  #define GATE_MFG(_id, _name, _parent, _shift)                  \
> -       GATE_MTK(_id, _name, _parent, &mfg_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
> +       GATE_MTK_FLAGS(_id, _name, _parent, &mfg_cg_regs,       \
> +                      _shift, &mtk_clk_gate_ops_setclr,        \
> +                      CLK_SET_RATE_PARENT)
>
>  static const struct mtk_gate mfg_clks[] = {
> -       GATE_MFG(CLK_MFG_BG3D, "mfg_bg3d", "top_mfg_core_tmp", 0),
> +       GATE_MFG(CLK_MFG_BG3D, "mfg_bg3d", "mfg_ck_fast_ref", 0),
>  };
>
>  static const struct mtk_clk_desc mfg_desc = {
> --
> 2.37.2
>

