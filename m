Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2744C636D4
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 09:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UKAmol5TEfreTL5fKdpmvKgwo5MvEZ/OuY/L64/Fn9E=; b=BGErRFV7efdBCPDcH+ll2N/c7g
	8o/+JpnKjEHDoT0Kb7qHpKAbyXM4oYvi2UNMLxADXtsn2/f0kKzak5bFXQ8QroVAPuVSG2zbufXYm
	4Uv3/pkSKbVyn78jj2yLrLjcJKUepxGwQnVxb0Eh80DncSR7usWGCeEkNY6bT9wpmxvS7uEMOnVyV
	DHG4jKGZ8RN3UqfxTYM7/v2JYG3jHYdFJ2dvNzd8GX3Mqpcgb+DnpcM1GrRw6QndIlyNFqsLtyVYS
	ZD2i4PTPmaqF0480zHyjgqEZ5ccDVWCB2mreQPef1dWL/5rfjJ7UND2UbjflhyatsM0h7rjfzLLrj
	JTVSDr0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPKkg-00Bc4w-FN; Tue, 07 Feb 2023 09:59:02 +0000
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPKkc-00Bc3e-Us
	for linux-mediatek@lists.infradead.org; Tue, 07 Feb 2023 09:59:00 +0000
Received: by mail-ua1-x932.google.com with SMTP id g12so2668086uae.6
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Feb 2023 01:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UKAmol5TEfreTL5fKdpmvKgwo5MvEZ/OuY/L64/Fn9E=;
        b=AZV4fMKX+dB8v9gtL3/NQ3H33vsLvwVLIdCYSUSfg1+f1LloGk9pSR5kh1LstZgzw+
         GQGd0uIxU6CK77aZHfjUqB/nR9M3KuOtmYZnodL5zZGUpNVUa96WkGYbHZGZd1IVjBU6
         vAj7/ZL9+vTMdvnot/sbpUuYnRnhYk+YlPU1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UKAmol5TEfreTL5fKdpmvKgwo5MvEZ/OuY/L64/Fn9E=;
        b=g0FHCSz5HbAQfmmFTuuN1mYs7kJsmoeMu9wz7l5HYbLrm7d3iU0d6oG4NR0ukrE3tD
         VsQPaQSEBKzAv7QoNP6DrNuDJfKVY8O0/u9XCXVjsOes4CDgVgEebk03X/Wrbnn/0pkC
         K9bd3vXxMbL81hOwVS5TwZkhb1hzghdsdQ2zNKKGooMGxmJ379Eu4JJbzgNYSSTA/8H0
         zMyr6SWR4eg1ljBSxRm5wc0/QlZUsgPHx93xQ1/ogPP/XjZNZ1rZt9yUO5L+535liozd
         CoYq7SwdSYnSIJ63/OS/q45X1f7fmS87LfVqj0h/SFd6e2szfdSkZ10fFhlCj9MXwtPu
         X30g==
X-Gm-Message-State: AO0yUKV4I/Tg+Ov/GlBi9jt7uKe5XSUx7OOkF6memHP6nUEdJvBRQ5Cp
	K3RcGjNp+VvKmngct2A6bXAbvO9wmdYI10+Nc/K01w==
X-Google-Smtp-Source: AK7set8wPm+MBZbJ1SW1ybEspzYBJqRZjEkamn0E1uxwefeZPiIVj7iCo/N7wDPzLvH1BFASR6ba2PJiEhF8i5UizQ4=
X-Received: by 2002:ab0:76c4:0:b0:5f0:4676:e4f1 with SMTP id
 w4-20020ab076c4000000b005f04676e4f1mr501137uaq.44.1675763936243; Tue, 07 Feb
 2023 01:58:56 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com> <20230206152928.918562-20-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230206152928.918562-20-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Feb 2023 17:58:45 +0800
Message-ID: <CAGXv+5G0ksgGMXUGk-=CXUANtGQa2M5RLY+wG7c-0cMSKS5DJQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230207_015859_033204_BF30C26D 
X-CRM114-Status: GOOD (  18.20  )
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

On Mon, Feb 6, 2023 at 11:30 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Switch to mtk_clk_simple_{probe,remove}() for infracfg and topckgen
> clocks on MT8183 to allow full module build for clock drivers.
> In order to do this, like done for other MediaTek clock drivers, it
> was necessary to join top_early_divs with top_divs and to stop
> registering the `clk13m` clock early.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/clk/mediatek/clk-mt8183.c | 160 ++++++------------------------
>  1 file changed, 28 insertions(+), 132 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-mt8183.c b/drivers/clk/mediatek/clk-mt8183.c
> index 0fad2cf7f41b..035fdd02f0be 100644
> --- a/drivers/clk/mediatek/clk-mt8183.c
> +++ b/drivers/clk/mediatek/clk-mt8183.c
> @@ -25,11 +25,8 @@ static const struct mtk_fixed_clk top_fixed_clks[] = {
>         FIXED_CLK(CLK_TOP_UNIVP_192M, "univpll_192m", "univpll", 192000000),
>  };
>
> -static const struct mtk_fixed_factor top_early_divs[] = {
> -       FACTOR(CLK_TOP_CLK13M, "clk13m", "clk26m", 1, 2),
> -};
> -
>  static const struct mtk_fixed_factor top_divs[] = {
> +       FACTOR(CLK_TOP_CLK13M, "clk13m", "clk26m", 1, 2),

A clock with the same name is now present in the DT, and so this clock
would fail to register. We should drop this one completely and point
any references to it internally to "csw_f26m_ck_d2".

>         FACTOR(CLK_TOP_F26M_CK_D2, "csw_f26m_ck_d2", "clk26m", 1, 2),

MT8192 and MT8195 aren't affected because they only have "csw_f26m_ck_d2",
which systimer was referencing.

>         FACTOR_FLAGS(CLK_TOP_SYSPLL_CK, "syspll_ck", "mainpll", 1, 1, 0),
>         FACTOR_FLAGS(CLK_TOP_SYSPLL_D2, "syspll_d2", "syspll_ck", 1, 2, 0),
> @@ -809,26 +806,6 @@ static const struct mtk_clk_rst_desc clk_rst_desc = {
>         .rst_bank_nr = ARRAY_SIZE(infra_rst_ofs),
>  };
>
> -static struct clk_hw_onecell_data *top_clk_data;
> -
> -static void clk_mt8183_top_init_early(struct device_node *node)
> -{
> -       int i;
> -
> -       top_clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
> -
> -       for (i = 0; i < CLK_TOP_NR_CLK; i++)
> -               top_clk_data->hws[i] = ERR_PTR(-EPROBE_DEFER);
> -
> -       mtk_clk_register_factors(top_early_divs, ARRAY_SIZE(top_early_divs),
> -                       top_clk_data);

And since we used to not do error checking, the name conflict was OK.
With the new common probe, it's not.

ChenYu

