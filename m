Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C648BC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Dec 2022 05:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=98nwyMJGkz5rxMgvlYxl5iF1bUd6Qz3cEnsFubCpd7U=; b=qz2tElhj3LpQrjTA/SgFuCMgNw
	is6flltZsBdDPoK12Fpnbwi26U8bQ+RCCEhe4ve49nXLK2RdHTQKFNIdXLnXQVi83hmPPEiwavVvi
	TLH3CkQkhJeuwVbIMK/3DtoJ6YH6MEKfnMMzStRX5U2rZ4+1JUWobPnLu6Fi4V5tZ41MLYfi3eV4Y
	5yIxV1mZE5TNGjix1ElIWjNk0+xjV6soT6w0iHPsSZU9/pwvumwMtq8MnobV+Qv3+2lKpYSpVxCWX
	HXdKQ7RD2gTVc3YUke0RHOn84zkgxfNVoTV7nOI4GZPtiEkKNk/0MHdagc8kEojFWs4yLKCO7nPgZ
	Fpb1zfRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pB7oH-005u8p-RE; Fri, 30 Dec 2022 05:20:01 +0000
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pB7np-005tvS-DK
	for linux-mediatek@lists.infradead.org; Fri, 30 Dec 2022 05:19:35 +0000
Received: by mail-vk1-xa29.google.com with SMTP id f24so9691904vkl.9
        for <linux-mediatek@lists.infradead.org>; Thu, 29 Dec 2022 21:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=98nwyMJGkz5rxMgvlYxl5iF1bUd6Qz3cEnsFubCpd7U=;
        b=YfZO23V/h0aXw03yMDj/5UL15JsM8Ea8pnINQmUS7PKYtvHzs5g9MScuXj0TaYkiFz
         fb/E3Gp/YAjq7otO6pq7w341FTDWo9kEt1CFbmfrnF2+YhRBSOBDNoYBfpHD3Z5kdyij
         XgFe/XcxqH6LE0ButXKMFb7b2Grnq5wF3zcas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=98nwyMJGkz5rxMgvlYxl5iF1bUd6Qz3cEnsFubCpd7U=;
        b=ZsFsMokBHpzb9KJXtV4GB+1hOhn4rvvE1gOA2nLhWPItsmSQ23dwflvI5rsO/9SZ7E
         yP2NX9Vc2mHD75flrry5RW0S0dXsbxQalJFffc+HJO+trIN34PGnJMgWoOqX7Z/oFfIG
         5rryMDGJ3AfcZK91kxe/6GunEd3Blkj/0eXOEBfrA3V9XajW6UufMihDVwnCLoUkEZ35
         kdW6JO2NL8Y1ZQLXt4ItAxPdOh3fvHqWoN08sAvyxWZSu1yVhH0XOEyP2eD2imNJh/Yu
         uK4X/J6/4IrkKpL7xljU2MIMEzS1RLko5s04lJOJTUcs2v3PZCskcd3kO0t0h7lInzHO
         Wfbg==
X-Gm-Message-State: AFqh2kp2T+wUGtIvqhjsTX54+aOQkfMhCqA9L+DoBM7/6HqBVVqZAN6A
	oEnGYfwok3FI8hBpxbrR+hvZ41F6uNHrOnfkzBYe3A==
X-Google-Smtp-Source: AMrXdXv51QytqQDxSQHVkwx8oHyCKoFvryaKDWDehNjS8o17nSfNUfoL6Xj2kxDqdcOvxqkWF3KV3YlrtDXDV21F6wo=
X-Received: by 2002:a1f:940a:0:b0:3bd:e439:84e4 with SMTP id
 w10-20020a1f940a000000b003bde43984e4mr3166517vkd.11.1672377571944; Thu, 29
 Dec 2022 21:19:31 -0800 (PST)
MIME-Version: 1.0
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com> <20221223094259.87373-8-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221223094259.87373-8-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 30 Dec 2022 13:19:21 +0800
Message-ID: <CAGXv+5H=eq0WRc=vvjD-xEKuc1tkM_t4GCHVwe8EZzSJPdEDOQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/23] clk: mediatek: clk-mtk: Add dummy clock ops
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, fparent@baylibre.com, 
	chun-jie.chen@mediatek.com, sam.shih@mediatek.com, y.oudjana@protonmail.com, 
	nfraprado@collabora.com, rex-bc.chen@mediatek.com, ryder.lee@kernel.org, 
	daniel@makrotopia.org, jose.exposito89@gmail.com, yangyingliang@huawei.com, 
	pablo.sun@mediatek.com, msp@baylibre.com, weiyi.lu@mediatek.com, 
	ikjn@chromium.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_211933_581884_1612287A 
X-CRM114-Status: GOOD (  20.37  )
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

On Fri, Dec 23, 2022 at 5:43 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> In order to migrate some (few) old clock drivers to the common
> mtk_clk_simple_probe() function, add dummy clock ops to be able
> to insert a dummy clock with ID 0 at the beginning of the list.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/clk/mediatek/clk-mtk.c | 15 +++++++++++++++
>  drivers/clk/mediatek/clk-mtk.h | 19 +++++++++++++++++++
>  2 files changed, 34 insertions(+)
>
> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
> index a1ab34305b95..d05364e17e95 100644
> --- a/drivers/clk/mediatek/clk-mtk.c
> +++ b/drivers/clk/mediatek/clk-mtk.c
> @@ -18,6 +18,21 @@
>  #include "clk-mtk.h"
>  #include "clk-gate.h"
>
> +const struct mtk_gate_regs cg_regs_dummy = { 0, 0, 0 };

You could probably just use an empty { }, since the contents don't matter.
It would make any possible future changes to |struct mtk_gate_regs| touch
one less place.

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> +
> +static int mtk_clk_dummy_enable(struct clk_hw *hw)
> +{
> +       return 0;
> +}
> +
> +static void mtk_clk_dummy_disable(struct clk_hw *hw) { }
> +
> +const struct clk_ops mtk_clk_dummy_ops = {
> +       .enable         = mtk_clk_dummy_enable,
> +       .disable        = mtk_clk_dummy_disable,
> +};
> +EXPORT_SYMBOL_GPL(mtk_clk_dummy_ops);
> +
>  static void mtk_init_clk_data(struct clk_hw_onecell_data *clk_data,
>                               unsigned int clk_num)
>  {
> diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
> index 15122504c02d..dd43235285db 100644
> --- a/drivers/clk/mediatek/clk-mtk.h
> +++ b/drivers/clk/mediatek/clk-mtk.h
> @@ -22,6 +22,25 @@
>
>  struct platform_device;
>
> +/*
> + * We need the clock IDs to start from zero but to maintain devicetree
> + * backwards compatibility we can't change bindings to start from zero.
> + * Only a few platforms are affected, so we solve issues given by the
> + * commonized MTK clocks probe function(s) by adding a dummy clock at
> + * the beginning where needed.
> + */
> +#define CLK_DUMMY              0
> +
> +extern const struct clk_ops mtk_clk_dummy_ops;
> +extern const struct mtk_gate_regs cg_regs_dummy;
> +
> +#define GATE_DUMMY(_id, _name) {                               \
> +               .id = _id,                                      \
> +               .name = _name,                                  \
> +               .regs = &cg_regs_dummy,                         \
> +               .ops = &mtk_clk_dummy_ops,                      \
> +       }
> +
>  struct mtk_fixed_clk {
>         int id;
>         const char *name;
> --
> 2.39.0
>

