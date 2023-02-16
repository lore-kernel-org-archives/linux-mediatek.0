Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E839C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 07:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xONmYBw6JTvrmLO+BA4K5ITh/kiXRq2fHlncM+ovzGs=; b=jMnUYeFFnlpV79g2Gqhfs3kRfw
	Eaxus06mWZ6mtYFNF5MB6YFGkvBh5I3LRrI8/4UAY8p6uBPUe8z3zzgPvsNcxQXkH++x6fKtLctOy
	uXd4NT0whNPb8DeX4Y2rVk4zGJWxEe6BPehOWGFG9oNBbwZxEnn59owcrL1hU+eh+XBLcDLnbZG1J
	+xODiuVj6kvJFH4KTB+nzslX7NrSIJkig14Rs4k/y3wh8WpuR1CIwqnLsdXeKSRi3wqKNRq+L14hl
	rpF3UzTTjBGGzj7AGjCw8+PAP4O8b7x0rViFtq2ne/aY6Y4xgznkV9PvOuQ6t1WnOaxhK0liZxC+D
	KgYIVKdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSZ6F-008shB-6r; Thu, 16 Feb 2023 07:54:39 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSZ6B-008sgC-Up
	for linux-mediatek@lists.infradead.org; Thu, 16 Feb 2023 07:54:37 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id f17so804167vkm.2
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Feb 2023 23:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xONmYBw6JTvrmLO+BA4K5ITh/kiXRq2fHlncM+ovzGs=;
        b=hjpwgbhflizIPQ8Ei73NkCuu8TvOmmoAobeCoLPA8SxjBaAmOI0B61L5Vu8/4mGSHs
         Lpj/DzyA7JzX3tlFL+FZC60MNAFU2i+wAXx0StOQFyjZ7YFVlfidBhpRZM5ZzF2NeYcC
         aQYiYAUH7/8kxnBUvc40ECxmm13ILwd5m0ZCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xONmYBw6JTvrmLO+BA4K5ITh/kiXRq2fHlncM+ovzGs=;
        b=IS0Lt1xkkA6KLavqiWD/l/6ukvC4gv1LG+qSOyc+LnlMZyjO7EMrZvU9xK/16XVxql
         oG40aWpxcx0nBZJ8iuyb7NN/x/ryFUs/SRJ6/Xxr/5mMneyTJTBdDkO44CeZt40F8YW7
         +ZhtDQanrRT30soRYER9xWVG3F4+9rsxkx7zGOH5k8wvhS1c+Q6R4xIrhtu0Dkbc+C5X
         Sal/dj15XZSxAd8yyHzuMSBoyGVbjCH/qmbEFWe8RoiXkliby7OtE21X9TB3bKky1o0D
         kgSwkMOPOcFuywyoOst4RDHEwvjMonA04HCfT2/lJM3qMYNNmK1WrqlcVR76mK/CVBI+
         45sA==
X-Gm-Message-State: AO0yUKXq/2gVnotDO5XL9vE7h7tL9VBZY0MNO0FkMFEDmASusekSzT1F
	zP3DXxNambrSdiQOvJ47G3qSWYOoym3uQ+7/QryeDw==
X-Google-Smtp-Source: AK7set/28STVRdRWXGf4bMCmP2aoX0xrfMB9bmkBz4FxvyVRel7OQwwriFZLqi7THD11no6OYGV4osSvAvDXEdCPURo=
X-Received: by 2002:a1f:a447:0:b0:3e8:66ce:a639 with SMTP id
 n68-20020a1fa447000000b003e866cea639mr780129vke.2.1676534074560; Wed, 15 Feb
 2023 23:54:34 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-12-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-12-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Feb 2023 15:54:23 +0800
Message-ID: <CAGXv+5HpWTTqrFKhkUDoZWa4h1wm=OuDHgFyMQsL-C4xKVfqOg@mail.gmail.com>
Subject: Re: [PATCH v2 11/47] clk: mediatek: mt8365: Convert simple_gate to
 mtk_gate clocks
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com, 
	msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com, 
	yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com, 
	sean.wang@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_235436_047122_E8B3E488 
X-CRM114-Status: GOOD (  10.41  )
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

On Tue, Feb 14, 2023 at 9:41 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On this SoC some clocks apparently don't have different offsets for
> set/clr/sta registers hence they can be set, cleared and status-read
> on one register: this means that it was possible to use simpler gate
> clocks instead of custom mtk_gate ones.
>
> In preparation for converting this clock driver to the common probe
> mechanism for MediaTek clocks, perform a conversion from simple_gate
> to mtk_gate clocks since the latter does provide implicit support
> for simple gate clocks as well.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

