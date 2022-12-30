Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565D7C4167B
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Dec 2022 08:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/23SH/RDubUwtPhGDvvJ5R7dhk7aa2Q9znGGjv9398=; b=SvFewcpmxXLSyXa6FaJwGqL0h+
	32h0LxU5mKwLlXWNZb4oHJZLCO6nZZeLh8HSXhWFl7tojnd6uzcL0BsO9j7asYFd1qPUSikwrHDZP
	jYO2g14TTTTR0XE4te/q6/8kqeCIG1zs/XqWpjmWc+KfAUSaXwI8ehpnm5ZeCecdVTkl+WPrirHBD
	GTLCUghHENgUR5OvqCxE7oXpqx4voS+dkhUajbUTIeihbRgNhnirOrb8ZcMf2HJI5ZoTp4GpupSox
	WbSLFahazulMBjvFKAd12CmUDwCx95yQlqGvvG57M+E0zdYLqWDR+ZajN+CpEAr0BfDguOIcN5rBw
	5a/Cgo1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBAcE-007EJv-6K; Fri, 30 Dec 2022 08:19:46 +0000
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBAXE-007Bsk-P1
	for linux-mediatek@lists.infradead.org; Fri, 30 Dec 2022 08:14:44 +0000
Received: by mail-vk1-xa2b.google.com with SMTP id f24so9808738vkl.9
        for <linux-mediatek@lists.infradead.org>; Fri, 30 Dec 2022 00:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h/23SH/RDubUwtPhGDvvJ5R7dhk7aa2Q9znGGjv9398=;
        b=hQL750/SptDyM5zC9SONd1+yKhS6sU/IIgcEppsoQ+cTBrkG0dJKYth3P6vkDRv1m2
         rZSgt08UXmchg3fKG/2gV4l20jzUYuaKZ802nmCM+vwvC7x/OzXK0f1aVK4YC3dm/OYJ
         +vLtcMX04P3A/R8rugf17ELK3VwPbMxjI21wI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h/23SH/RDubUwtPhGDvvJ5R7dhk7aa2Q9znGGjv9398=;
        b=yTHelKcprg6Sl2TCR4HbFtaN9eRyugGrrc0+O3cCvm5gbSsWMgEzKLV1Wx6LgF1l9W
         PtTawwaRocBb0wtCpQjJjLAZnaBMx9t4B82Vvs1gIf4Bo8+g039jgZ80ot0jWTb1Zfjp
         YXVcqPoErMq4QBjfuaDpyBaDWd3045L2xIm7Zs4bTdcfSIo2DwUa+fkBJ6TQhhmBZ+y6
         LnWvpEfI3whM8U29p2p9M8bX/oetJSrduoM+81bDCtDXLhveYjhsYOU5xnN/mgo56mRH
         JZewZmUJG82lSS7nPwqBjPUNChEVRP2hUm4g4rwO3c740XgH2wcm89LsJbXrAVdQOxha
         JHQw==
X-Gm-Message-State: AFqh2koq0tEI06tuZuCdDCKgd0M0IYgKcxMWu0PsAb1xxp2hcUoWGmp9
	f/tSOVPXV/1ivHGhudb4eave+Opjwm7gh+C0iyM4+Q==
X-Google-Smtp-Source: AMrXdXv+RCjAisIysYzOgTd+TZASYGjgYmh6pgy5c7q3H14gY+3IMCe6R4lmwzLkmBOTPRmsWJgPiOASnjVqpAniq1Y=
X-Received: by 2002:a1f:940a:0:b0:3bd:e439:84e4 with SMTP id
 w10-20020a1f940a000000b003bde43984e4mr3202746vkd.11.1672388075447; Fri, 30
 Dec 2022 00:14:35 -0800 (PST)
MIME-Version: 1.0
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com> <20221223094259.87373-24-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221223094259.87373-24-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 30 Dec 2022 16:14:24 +0800
Message-ID: <CAGXv+5HtEE_1wFOHwXLe+gJrcEgs63g-UpiiRXoSqh+fZW=N+Q@mail.gmail.com>
Subject: Re: [PATCH v2 23/23] clk: mediatek: clk-mt7986-topckgen: Migrate to mtk_clk_simple_probe()
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
X-CRM114-CacheID: sfid-20221230_001438_139792_0E1B63B2 
X-CRM114-Status: UNSURE (   6.94  )
X-CRM114-Notice: Please train this message.
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
> There are no more non-common calls in clk_mt7986_topckgen_probe():
> migrate this driver to mtk_clk_simple_probe().
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

