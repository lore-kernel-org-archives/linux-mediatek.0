Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFDBC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Dec 2022 05:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dEYbMSY9mT2OK2c114me8utvLFZz2JqIKXFmopSmQiw=; b=P/ZLFKZX354Bz1UXh1xu5T33mE
	qs6/ttC8bVdZw6GBxqT1RVMYM41JTWcC1xwZlfCihEioda2vJS7JGvIclqeQvHRQgXIQjSlN3NSuK
	c+OVfXOge5ezn/sAXQrHefYGUdOj2lvdOpdZU/sLMFYO7VHD7/rNbkqkcld1WBxwgaThz/ptSrJ9e
	g5Hi2abO9CEQjzro56+/CCGJDoUmV5CdFtF902Bn/bF6LA9kdBes0FibsreAJ/2EA6MqKAt/1pCAJ
	tFuyfUWjVqJ8WdqXMVZm5NOXJaoMb/I68Nk4mZec4ku17gjdwvY/g1VPU9M0Prgx/zhxb8o+s1oWV
	T6vvl7uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pB7ll-005sly-Hg; Fri, 30 Dec 2022 05:17:25 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pB7lj-005skA-AH
	for linux-mediatek@lists.infradead.org; Fri, 30 Dec 2022 05:17:24 +0000
Received: by mail-vs1-xe33.google.com with SMTP id d185so20438884vsd.0
        for <linux-mediatek@lists.infradead.org>; Thu, 29 Dec 2022 21:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dEYbMSY9mT2OK2c114me8utvLFZz2JqIKXFmopSmQiw=;
        b=RKih9fLMpxINT80ky9qXSQ53n2p/gq4DqtkictxoVB6aWfa9UX7D6geobbaZRNdi9V
         cD0zg7UKY1wl5gpbFTbIxiJlMqwsZOqM7dtq2O2aTqKYFqeoSA4YkrNJktTS7P3yDmJW
         NVl1tmtgJy8t3YgObj5WvVVF6dgavhZvjCHDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dEYbMSY9mT2OK2c114me8utvLFZz2JqIKXFmopSmQiw=;
        b=Vr9+m031ywF6+0N+2rBKei+cGQqiThozk0QhjgL45ZX/iu/LXUtSoayWoGLx8gDeIO
         q66gtPg8WdeeuHGV3jKoz3fpXatjKl/jPmO74eAWOakCCxkMPGZVs45vOVWuzQZIju3g
         Sse/Kdd+fiOpXNkmXddJgeysbGZL9u1vqTvyNwA4t4h3Nh9w18LkiDI7BxljLwgYlKCO
         rE0AWjvNnQ3n2pHmmAv+hFeubg5PjoiVjbkuhwgaf4+eTcZHX+jiHcf+9Kpk5NtN9oDX
         SlU29QM2erxjc10LLyFzRVjnLf7pV1PB5qKmLNq5xP0+N4K7SVp9NFoNkRnzICc5q4eL
         mH4g==
X-Gm-Message-State: AFqh2kq554Ofu0eQRhe9zq0kwEgLXSF4MxflyYILe1EoxvOVFYTclnaE
	0d6w1UBLhEw24h3M+GunKy6jLBk837NzosHml5zfpQ==
X-Google-Smtp-Source: AMrXdXtbyCSpMJ4eNW7yhoCCnZ4ewGuLOy71q3P5g49tLuLwFTAwiq8BtlKIVACuyhU5eRY9Mp/AdemXnMQUi2cYMbk=
X-Received: by 2002:a67:f985:0:b0:3b3:7477:5aa2 with SMTP id
 b5-20020a67f985000000b003b374775aa2mr3636972vsq.65.1672377442038; Thu, 29 Dec
 2022 21:17:22 -0800 (PST)
MIME-Version: 1.0
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com> <20221223094259.87373-15-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221223094259.87373-15-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 30 Dec 2022 13:17:11 +0800
Message-ID: <CAGXv+5H26DA6McV_6XJiquM44MkrhYh1HmGQr+sB-82EOGvinQ@mail.gmail.com>
Subject: Re: [PATCH v2 14/23] clk: mediatek: clk-mt8192: Move
 CLK_TOP_CSW_F26M_D2 in top_divs
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
X-CRM114-CacheID: sfid-20221229_211723_384050_2FF96D5A 
X-CRM114-Status: GOOD (  12.60  )
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
> This driver is registered early in clk_mt8192_top_init_early() and
> then again in clk_mt8192_top_probe(): the difference between the
> two is that the early one is probed with CLK_OF_DECLARE_DRIVER and
> the latter is regularly probed as a platform_driver.
>
> Knowing that it is not necessary for this platform to register the
> TOP_CSW_F26M_D2 clock that early, move it to top_divs and register
> it with the others during platform_driver probe for topckgen;
>
> While at it, since the only reason why the early probe existed was
> to register that clock, remove that entirely - leaving this driver
> to use only platform_driver.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

I had some other changes dealing with this, but since the systimer DT
fixes have been merged, and this is cleaner,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

