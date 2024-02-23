Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB675C54798
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Feb 2024 04:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oBx7MOkn9wW9DxztfWR4DG5bZ9dZsBTrKJsnaVTaV5I=; b=NhE6RAp9lAoAIZbHu6oYUu/l9f
	wgpm8yCr899c28wtpsNmaVJ6/8bPLKKTFUwzZwNpP2KHHrkj+6eSM1I2DmPk0mcS7yXTDgcIvq+Sk
	XjYJq+y8nbImN3rgQBaKaCibdyfT1dx5ggdpi679WpxZPlTTN+I81MFsGZHUoKexWXJBfy7kTVJ06
	MCMgzFXSRW+GoF6+mbmE+3A9Yk92YRSjA7ZQ+xrGy9nnWj0r5LZn6beuH+69AJtzly/YPe+voVEsl
	y9BLVoqHP1Xo9uZmeSZ1w2K9y/3IopLfctmV6x75PtaRrH9hZcVg0cSO5np2+G+AI/b4nbHKv1yRH
	sTf1IMtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdNPz-00000007tpP-1V9L;
	Fri, 23 Feb 2024 04:44:15 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdNPd-00000007tkb-03w3
	for linux-mediatek@lists.infradead.org;
	Fri, 23 Feb 2024 04:44:12 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-512dfa097b1so625478e87.1
        for <linux-mediatek@lists.infradead.org>; Thu, 22 Feb 2024 20:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708663430; x=1709268230; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oBx7MOkn9wW9DxztfWR4DG5bZ9dZsBTrKJsnaVTaV5I=;
        b=Qve8x4UOsAJcnLIT2a3/jBnQqvI8OEIPgvAj5lM3pNrp35cunI06GbbotFEDZOgXYp
         pgzbBCKQNE81IiuS1AUy/yrYGytucbovGe3QtbXyJehl9Hx3Jd7v86a0mqM/Czu9/Fdj
         iwKqHJjH9QHdGwxtmVc7Y96AqJ42qud55OpXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708663430; x=1709268230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oBx7MOkn9wW9DxztfWR4DG5bZ9dZsBTrKJsnaVTaV5I=;
        b=JxbAKoj73vIUTv8+8b6Rdz4pQWhKvQ1jOf6PruETc/whgFMdfeiSVqshfU3QCt8uCg
         Zpf4rhK+1JketNsehI50prrM/XWHpW0gob7kOwsc8+UY467IAQkIdPZsZ76px69j/a1q
         bnzGEUbJ4hJeX6dcYj8MxTRw6e1o6/z47G3qJ+yPMtkNWihzUR/bgDzsSeRGgJwGMrVm
         DmOjHvIm1PCLQr4kgQ0igL0EGZ3Ne5ZwdKkbBMHnBb1liJ25UuUCWQcdHuJGpUsv2ZB7
         UO69Oa82Cg0lKAUFX5EaScXjLy9r/Tk1BZ5xokkeUFD2244qxqegtDAXJEKhwVuCrcfl
         /+XA==
X-Forwarded-Encrypted: i=1; AJvYcCUpvqh/svH+R2LuggHqBmeqeQBwVNufUCeVPcnWUD4hps+94Wo4Ex7NvlDiekkDC0BFNWuqFUlTqBCetd8SwJGcWMPPrI7tggI5Cf/BSQUBOeoK
X-Gm-Message-State: AOJu0YxAJCTlp2/agHhV8zHxCG6mSc6tAE5l5vmOvFF2VyylZfAP/jBk
	cylkE0PJH6pc8LhnmoKRgTn3GvaU2fvfoaGDfvDNGqnRJaZxU+y/IMkAvGw9EWkkbjFrw/+PA2L
	ArENXQanfwmYbtD0pmLaeguwqAPNzgXHw4pdm
X-Google-Smtp-Source: AGHT+IF5QOowQOFza4xh4jiRjjWLNuX1rVomW/9NM2WmASfwoESsVYQHmb/UIiIOu30QnLkqolbWhZLkQamy3+pnN3M=
X-Received: by 2002:ac2:5984:0:b0:512:e091:cb1b with SMTP id
 w4-20020ac25984000000b00512e091cb1bmr566669lfn.13.1708663430207; Thu, 22 Feb
 2024 20:43:50 -0800 (PST)
MIME-Version: 1.0
References: <20240108081834.408403-1-treapking@chromium.org> <20240108081834.408403-2-treapking@chromium.org>
In-Reply-To: <20240108081834.408403-2-treapking@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 23 Feb 2024 12:43:39 +0800
Message-ID: <CAGXv+5GoAauw77wVXx6SXsSma9zP_A1vXLRo=GH2ptjvY=kLgA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] clk: mediatek: mt8183: Enable need_runtime_pm on mt8183-mfgcfg
To: Pin-yen Lin <treapking@chromium.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Weiyi Lu <weiyi.lu@mediatek.com>, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_204358_415902_57C17BC3 
X-CRM114-Status: GOOD (  15.33  )
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

On Mon, Jan 8, 2024 at 4:18=E2=80=AFPM Pin-yen Lin <treapking@chromium.org>=
 wrote:
>
> mt8183-mfgcfg has a mutual dependency with genpd during the probing
> stage, so enable need_runtim_pm to prevent a deadlock in the following
> call stack:
>
> CPU0:  genpd_lock --> clk_prepare_lock
> genpd_power_off_work_fn()
>  genpd_lock()
>  generic_pm_domain::power_off()
>     clk_unprepare()
>       clk_prepare_lock()
>
> CPU1: clk_prepare_lock --> genpd_lock
> clk_register()
>   __clk_core_init()
>     clk_prepare_lock()
>     clk_pm_runtime_get()
>       genpd_lock()
>
> Do a runtime PM get at the probe function to make sure clk_register()
> won't acquire the genpd lock.
>
> Fixes: acddfc2c261b ("clk: mediatek: Add MT8183 clock support")
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Note that this compliments a patch [1] adding the power domain for the mfgc=
fg
clock controller node, which has been floating around for almost 3 years.

[1] https://lore.kernel.org/linux-mediatek/20210414073108.3899082-1-ikjn@ch=
romium.org/

> ---
>
> (no changes since v1)
>
>  drivers/clk/mediatek/clk-mt8183-mfgcfg.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/mediatek/clk-mt8183-mfgcfg.c b/drivers/clk/media=
tek/clk-mt8183-mfgcfg.c
> index ba504e19d420..62d876e150e1 100644
> --- a/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
> +++ b/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
> @@ -29,6 +29,7 @@ static const struct mtk_gate mfg_clks[] =3D {
>  static const struct mtk_clk_desc mfg_desc =3D {
>         .clks =3D mfg_clks,
>         .num_clks =3D ARRAY_SIZE(mfg_clks),
> +       .need_runtime_pm =3D true,
>  };
>
>  static const struct of_device_id of_match_clk_mt8183_mfg[] =3D {
> --
> 2.43.0.472.g3155946c3a-goog
>

