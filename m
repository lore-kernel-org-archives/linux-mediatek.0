Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D85C4167B
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Dec 2022 08:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PPMh1bx7p+RWszUWsYNnjB1z/mUzp7J0r3Un1hyV3Yg=; b=xBCfxJ+mqF8dKc0m9z9eO8teqq
	r2dseoaVuC2BY69DkrW5/CubqmtKYu7gaf+G6z3x3TA3CJlP1g3qlTHAi2klGDWbwTPebZqmwBry9
	YN/7jI7OpPgeBbClVv6w1XMBtYXdaxMdjUPQ4gHF1idKvCeTg/zyYrHKMj7F6d4nI4e1kJ7/g0BdL
	lx2oI4xgZQWtzBY5FmJKBLPwR+oa3wDDx43zucU1qGx2UVlMZyT7WsmYQqGVfw82y1lZQSySAiKVi
	QnB8VvtFrI9+7siIC/b1q8AFY4oruJzco+ZHYaov3/l3DtR/jVhYZspPnsBgrLxIuDdfsYMjAVoMF
	9kznx0ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBAqo-007KjY-FL; Fri, 30 Dec 2022 08:34:50 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBAem-007Fbr-Dx
	for linux-mediatek@lists.infradead.org; Fri, 30 Dec 2022 08:22:26 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id o63so15835556vsc.10
        for <linux-mediatek@lists.infradead.org>; Fri, 30 Dec 2022 00:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PPMh1bx7p+RWszUWsYNnjB1z/mUzp7J0r3Un1hyV3Yg=;
        b=ChHCyeXa9C49zHneJZHTToGD050rLQoMOGL1Lt/Rd7kfXVQC+SosxVz7CrUpTLdzTj
         3SsTVQD1ytTaph5osVDToCNpZog3wDsTWbuiRTLQVNrQOO0EpiYSIMhbbGipgpHpcZvY
         +Um7mpYegGA+xy2MrNrvT0WQmzf6ixi9Eff6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PPMh1bx7p+RWszUWsYNnjB1z/mUzp7J0r3Un1hyV3Yg=;
        b=cKDQqn3XpiPjCdhP1FJHin1sJ/QogxaOHoTKFCWravbiPpUkjxEqZaD7StqdvKulo7
         Zcgah/UT2BRBD0PY+C5RhgdJi3qiQ0tXPhLzyiIpqFJy1MrFJ6Opa3iOl2CrZW0wAVM4
         MCqt5op1BtDLg+kuo7qmtGcqhGn420dqLp2Eb9WwiYXyU8lK7+Z+EuLl4iN9JP4hDl27
         clGp+1RFHhpmJrHcowwhi7jidBDQrhuDXn8gqrfgF+G8yNLmpFX7159uvU9X1ugdBIQ9
         9y9gaDhpXEnoiu5gLVYbQ8EJMFif/S437ARAmyQUXLEejiKKmor72+BDzpOuPOxH0+9U
         eGRA==
X-Gm-Message-State: AFqh2kpa5g9Z+gkgr5nqhIeVWy+gGaTZcJBI3kAmBvkd1VJ/ox4o628g
	TdVT728Wax2aJm3XQgiP9laU1uDKXterulwRFE4xUA==
X-Google-Smtp-Source: AMrXdXtILSSp544twEvhbZAOHBZZSqyPKdwHftg430OofTjYalRaCuf+LT9O+Osuk/hg1h3mWuLbqx+qbQQ3Y50n/v4=
X-Received: by 2002:a05:6102:3d9f:b0:3c4:4918:80c with SMTP id
 h31-20020a0561023d9f00b003c44918080cmr2677891vsv.9.1672388543279; Fri, 30 Dec
 2022 00:22:23 -0800 (PST)
MIME-Version: 1.0
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com> <20221223094259.87373-9-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221223094259.87373-9-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 30 Dec 2022 16:22:12 +0800
Message-ID: <CAGXv+5FGJhkhHHoyx8S7v6KzBJ+ifSXU+X1EUVqpkydrRVHGMw@mail.gmail.com>
Subject: Re: [PATCH v2 08/23] clk: mediatek: mt8173: Migrate to platform
 driver and common probe
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
X-CRM114-CacheID: sfid-20221230_002224_687756_946AB91B 
X-CRM114-Status: GOOD (  10.08  )
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
> This driver is using CLK_OF_DECLARE() for all clocks: while this
> definitely works, it's not preferred as this makes it impossible
> to compile non boot critical clock drivers as modules and to take
> advantage of clock controller Runtime PM.
>
> As a preparation for a larger cleanup, migrate all of the clock
> controller drivers for MT8173 to platform_driver and use the
> common mtk_clk_simple_probe() where possible.

Should also mention that proper error handling was added. Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

