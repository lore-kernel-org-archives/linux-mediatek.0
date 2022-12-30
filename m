Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E9B2C4167B
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Dec 2022 08:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=snPiKqnaiN1WiMwQdheLRI2dNEuAuVQ7rQXTqdJG2aY=; b=KTBppAAOzlELRd/Dt/meTaaYC8
	lGxm1a/nfZituvbJ4qHy+U5BJ2yNNBRu3NjgYXicVVIseO/oitoTc1vW4rRkeI/q8Z5eUG4OmUVca
	uDEu8vmK4yzqH278BttZAmNlgqnf/3Jcr4Jubnb1OIk6qbhqVmaDgmy0R7bRGClMuzfwmOWF5+EJ8
	sJrSLtdLGRFOBLILm7ImNDt3kdSfJQDjBrS1mJXmuZTdlM9uMbGzXZEIpchFNvldm5J3LKQzXB+Mb
	XhQHbk2gJczGAX66jsizRZt9Y+gObbWidwasJWW48+hd3e0caKO3nOgcTide7dY3hqZs1xXPbdsUm
	+xGAd23w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBAp3-007Jyc-9K; Fri, 30 Dec 2022 08:33:01 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBAbB-007Dp5-S2
	for linux-mediatek@lists.infradead.org; Fri, 30 Dec 2022 08:18:45 +0000
Received: by mail-vs1-xe33.google.com with SMTP id m129so14842848vsc.11
        for <linux-mediatek@lists.infradead.org>; Fri, 30 Dec 2022 00:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=snPiKqnaiN1WiMwQdheLRI2dNEuAuVQ7rQXTqdJG2aY=;
        b=jOmRVnnt+xickPH2XkTJztkw4Zi3hvRDUW1Z/bNDeaX/KxiBpbg/w+OqC5eYwzEGWa
         GE5WlyusMhcZshXyAKDY7DRT0Pd+InIwgp6eJMxiod2gxMAlfrcoUF7AWQzxWmeD6q6F
         N8nbJ3Y/8TtDzxqluZWAuxAOvDuq2Q2Ov7lr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=snPiKqnaiN1WiMwQdheLRI2dNEuAuVQ7rQXTqdJG2aY=;
        b=tIkFUgSdajPUzVAxITUcr4kr1FpxzqkVz8FPnR6KkO1sxwJ4i4C49hxlhnVVMDnQ2w
         vEua1fCsd2/KK+WZrhII1lW3PrphM+DSm4VpHh7RnunI2Z/KfXl04/YG4ttTzQxpsBi9
         4KVH5WHGJpw7kPCoJ5uvupumn+eC1Tg3ZL8AVX8yTlzbvE+xPSHq+14n+c9PoFVioQpC
         rDKp0p1mx8almiVqvLEgZ+LQXw6MaTxUV6Ym5/H32nDB+k1XEkRLsU7L/1MIRWt2ne4a
         r11cWLPassenThZbzR5s6EYW9WMO+3kpSqAkQP6idjzKRWlU+XeeXB12v2OxGdh9f5KY
         OCUw==
X-Gm-Message-State: AFqh2krPmbdL99QH8XDFugztf1vMAcpO8pAJzjHbGBMdrqCi17vlEWFd
	yTJqAKOHE8x3b1uaQdKrGal0mtv/iV82E+WVMA7ZJQ==
X-Google-Smtp-Source: AMrXdXvbPrrXMd2o6CdhgGa4mWDoeuZQzpLJ9wWmLbJ6KNXxRcDvEAw+MTtWhDWsPccnaAgosvj2akWxnseLI2V4qJo=
X-Received: by 2002:a05:6102:4427:b0:3b0:6da7:39ba with SMTP id
 df39-20020a056102442700b003b06da739bamr4341845vsb.26.1672388319884; Fri, 30
 Dec 2022 00:18:39 -0800 (PST)
MIME-Version: 1.0
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com> <20221223094259.87373-20-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221223094259.87373-20-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 30 Dec 2022 16:18:28 +0800
Message-ID: <CAGXv+5FzMe_W-p2NW2DWtcPY4KVUVucpc9iL322GOB4bY=w8jQ@mail.gmail.com>
Subject: Re: [PATCH v2 19/23] clk: mediatek: clk-mt8192: Migrate topckgen to mtk_clk_simple_probe()
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
X-CRM114-CacheID: sfid-20221230_001842_593769_8CA423DB 
X-CRM114-Status: UNSURE (   6.06  )
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
> Since the common simple probe function for MediaTek clock drivers can
> now register the MFG MUX notifier, it's possible to migrate MT8192's
> topckgen to that, allowing for some code size reduction.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

