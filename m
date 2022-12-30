Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4A9C4167B
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Dec 2022 08:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6m26YMbks5w9j7aA1kyB8fHaCoQJomo7rPAPrntLOog=; b=AqlA0u5nR2zlCVSf2UQoi1NVKk
	Oud7uNvJcLIij0MwIZtAem2YAhvHeNROjLAj6XuhlHkWcnZ4LUtBg8sGSsEh8Jp5pQQE8p5KLImfj
	JFlfZA5o0sdwYWmR55BfvEGmVYpm+XzJJNEwjnT2TD2JvP9LgHHLqw4K/YhzMq8gUjdMHfw5KKeef
	wM7ek4dxnJJVz5xMkdrDCgrKYuZdxT+Dvasvf2CXnkFqnGCOC1f2L0t9QRbsalTCnP8r4xsAuZy4Y
	9ehrixePlpGx44DybVaHTm7ixXeYPOd1VwytLbLkXtgIFwkxQVFr7HQk2pkGiBcgu5Uk8qIpRkqLN
	S7InNqsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBAXg-007C8z-5L; Fri, 30 Dec 2022 08:15:04 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBASx-007AF0-TB
	for linux-mediatek@lists.infradead.org; Fri, 30 Dec 2022 08:10:16 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id p30so15006190vsr.1
        for <linux-mediatek@lists.infradead.org>; Fri, 30 Dec 2022 00:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6m26YMbks5w9j7aA1kyB8fHaCoQJomo7rPAPrntLOog=;
        b=da0u9H3i2xBt3fWJah+Dv2qxTKOgSPA3AOzUFkMKqyZBIZZP1P0UGdJuaICzOxt4fH
         Mm1wEa0yAJTOmV4DWB4J14oTVDAi63M5Vz3MP/SaMgYICVkVtF/81mtEBJvcpGuYIkY9
         crEd8lqVWmWgaSLClDuFEAsKqpu5aflcbck8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6m26YMbks5w9j7aA1kyB8fHaCoQJomo7rPAPrntLOog=;
        b=y4yZVvF4zXRXcNnh2d8f13iLqibZl5BMTSjA8jRP8wMWGvXEVNLHpDmhOMQI2u6uUT
         Ttul1u49XZfmz5127EtownYckwhkL5wWHrj8Tg+KV90lw/3E7At4aRGbGYz7gDMjKXrI
         kbULENyVW3eqXnAm44BOxx2q5e5EDkogy6+UkiL+2DTU8FZ+gIqR+cc72I8Qdgv6zcqR
         4EVQapFOXrwl0/1QX+wa+TfaLE6wOmTPaXmMNV5x36H8Kul30SWSe8vMCGg/9wUAUyd8
         BA3mag5nydTw8kVSUm5CsFWlqkSMS2b+mpFLTwgC1OPs/+sztvvm65o9EbC3o2q3fzvC
         Df4Q==
X-Gm-Message-State: AFqh2krEVhFEh2O5Og8SM62IKF5+lTZxvb/xnOpbCmFP4CiQdWSPpO6W
	X09Q21SjlvWDsLW+sytLHP1SfjOWbqvYHsBc88Q66Q==
X-Google-Smtp-Source: AMrXdXu42OIXcFU1BSE54ydAcv7zw3Gqh5WM+YiUnvG/dZqYgZpVZP5X5dL1GmIq2Knsf9WEE8McGyC3+t2WX/bbKjs=
X-Received: by 2002:a67:fbc2:0:b0:3cc:fb59:8c71 with SMTP id
 o2-20020a67fbc2000000b003ccfb598c71mr21878vsr.65.1672387810048; Fri, 30 Dec
 2022 00:10:10 -0800 (PST)
MIME-Version: 1.0
References: <20221223094259.87373-16-angelogioacchino.delregno@collabora.com> <20221228083123.15298-1-miles.chen@mediatek.com>
In-Reply-To: <20221228083123.15298-1-miles.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 30 Dec 2022 16:09:59 +0800
Message-ID: <CAGXv+5Hp3MFjLcP5z0t6QnYHN3VvVg_Og_HhvWNxm5o1q20B=g@mail.gmail.com>
Subject: Re: [PATCH v2 15/23] clk: mediatek: mt8192: Join top_adj_divs and top_muxes
To: Miles Chen <miles.chen@mediatek.com>
Cc: angelogioacchino.delregno@collabora.com, chun-jie.chen@mediatek.com, 
	daniel@makrotopia.org, devicetree@vger.kernel.org, fparent@baylibre.com, 
	ikjn@chromium.org, johnson.wang@mediatek.com, jose.exposito89@gmail.com, 
	kernel@collabora.com, krzysztof.kozlowski+dt@linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	matthias.bgg@gmail.com, msp@baylibre.com, mturquette@baylibre.com, 
	nfraprado@collabora.com, pablo.sun@mediatek.com, rex-bc.chen@mediatek.com, 
	robh+dt@kernel.org, ryder.lee@kernel.org, sam.shih@mediatek.com, 
	sboyd@kernel.org, weiyi.lu@mediatek.com, y.oudjana@protonmail.com, 
	yangyingliang@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221230_001012_886344_7495898A 
X-CRM114-Status: GOOD (  16.33  )
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

On Wed, Dec 28, 2022 at 4:31 PM Miles Chen <miles.chen@mediatek.com> wrote:
>
> Hi,
>
> > These two are both mtk_composite arrays, one dependent on another, but
> > that's something that the clock framework is supposed to sort out and
> > anyway registering them separately isn't going to ease the framework's
> > job in checking dependencies.
> >
> > Put the contents of top_adj_divs in top_muxes to join them together
> > and register them in one shot.
> >
>
> In mt8192, we can join top_adj_divs and top_muxes:
>
> mtk_clk_register_composites(top_muxes, ARRAY_SIZE(top_muxes), base, &mt8192_clk_lock,
>                 top_clk_data);
> mtk_clk_register_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), base, &mt8192_clk_lock,
>                 top_clk_data);
>
> However, there are other top_adj_divs[] and top_muxes[] in different types so
> we cannot join them.
>
> For example:
> in drivers/clk/mediatek/clk-mt8167.c:mtk_topckgen_init():
>
> mtk_clk_register_composites(top_muxes, ARRAY_SIZE(top_muxes), base,
>                 &mt8167_clk_lock, clk_data);
> mtk_clk_register_dividers(top_adj_divs, ARRAY_SIZE(top_adj_divs),
>                 base, &mt8167_clk_lock, clk_data);
>
> So we can join top_adj_divs and top_muxes in some platforms, but we
> cannot join top_adj_divs and top_muxes in some other platforms.
>
> I'm afraid that this will confuses people.

I think the confusion comes from the macro names. It's not exactly clear that
DIV_GATE is for composite clocks, while DIV_ADJ is for divider clocks.
Doubly so for the mux related types.

Either way, using the wrong macro or the wrong type will cause the compiler
to complain, so I think it's something we can live with. If it's still not
working out, maybe we should rethink the naming.

ChenYu

