Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E21D0C07E9D
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 04:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hCIr6ggWP7k5r3nMA/IQLk+9jq0v0zrFpIbWh0QT22o=; b=TU3D51+GTZ5V4o4AvYT++aL1XQ
	QHmw2wkg1RaJ/ZBdHZP5vHQbsgby+Jj3X2BFuKefOpqn9GxBYhP8ZUoIXgLZE5t5ZO4LFaBcz12Sy
	h38phMutG9d0kHqJ1xDJFbyFY4r8xMpNWzp9bvTAli15Zt36y9nX1oUn7t4GDn3+EfWh8J/k8+utd
	7Lt69/h3DO8ZAc+cvEu3XbaW9DAcGRMTC+/NUvdBMF+rZ6x6sOyC2zv+B4Gkb2cG0LsdUIg4D5nR7
	W7X527EHFk3pTJwZ96JIdT5FM72P+rumD5kn84243WRea2VeNK3UBFAbqcXVIvbbVrPwu+q8R5qfs
	3VhzO5Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odlIY-001BTz-K9; Thu, 29 Sep 2022 04:37:22 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odlIO-001BRX-0g
	for linux-mediatek@lists.infradead.org; Thu, 29 Sep 2022 04:37:13 +0000
Received: by mail-ej1-x634.google.com with SMTP id l14so326389eja.7
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Sep 2022 21:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=hCIr6ggWP7k5r3nMA/IQLk+9jq0v0zrFpIbWh0QT22o=;
        b=TR9E4YYcWtROuWGCseBJ1Nn/qTofn8Gd6wa7GsL307BVMqtJP7MrZqakH3Ev6A1VuQ
         6B8V4rsybpf7FKF9lu2f1fSGvfkjsIQJTRydxE4CA1gkhLx5AD+5w+GfffJ36QKRxDGU
         lETxu5SOf2snTa+ovV89JdmA+sHU4titFehnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=hCIr6ggWP7k5r3nMA/IQLk+9jq0v0zrFpIbWh0QT22o=;
        b=C2TKMMic16pZYITkwvijnVZvm0Vm4rc7ak+YcteFV4l5VLxgXaEx9XgEhaFdrKlQi5
         RBqmbODptpDOfNVpCfSjvFe0UropZ2YhDcoz8GzGOEH4QW8cxno2ZyQkGpyPb+SzqCXm
         AY0uIo9JeBbEzp56YiNqaZF8cscqJMT1NFJseKVka0HZRUMwuhDD97LZmIpkoHqqCKIL
         p4QvrGVpoIswdn9dG9klI6dOOKslIuDSOdb0uT514oKAuPkTfFXTPWVXtEI06RVI3ZPs
         p+h985HiGlW0XzEyQ8Fl/UXWT8VOTxxs5oje19vhhaB5bSIvUPeBOF5DZgY7QYmfDRQd
         YkkA==
X-Gm-Message-State: ACrzQf1PBNCUR5yGjWBTEkjXeEnagzUChGqOz7NTLzZDmt+sUiJI7XQQ
	oeQ9IdoTrdqjHYvCTrnxd8XPL43NG6bYem0Mzznz0g==
X-Google-Smtp-Source: AMsMyM42xVrO9Sdosyvdwfr6CiAqqADoCZ5aeLBLftNjRzyuLAYvUGMUJADYo2U+hcbm0qWMjh4oR+ebBSwFXSkk/9k=
X-Received: by 2002:a17:906:8455:b0:773:c45b:d970 with SMTP id
 e21-20020a170906845500b00773c45bd970mr1070628ejy.46.1664426229162; Wed, 28
 Sep 2022 21:37:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220926102523.2367530-1-wenst@chromium.org>
In-Reply-To: <20220926102523.2367530-1-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 29 Sep 2022 12:36:57 +0800
Message-ID: <CAGXv+5GC28RHAj=PQyUFyZGwEOuoa3TnT3RxUEmP3SMvYCVEuw@mail.gmail.com>
Subject: Re: [PATCH 0/6] clk: mediatek: More cleanups
To: Stephen Boyd <sboyd@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_213712_067092_BA7D211B 
X-CRM114-Status: GOOD (  15.44  )
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

On Mon, Sep 26, 2022 at 6:25 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> Here's some more cleanups for the MedaiTek clk drivers.
>
> Patches 1 and 2 fixes and cleans up some parts that were missed in the
> previous clk_hw conversion series.
>
> Patch 3 drops the duplicate registration of the top_early_divs clks for
> MT8192. Currently this only contains a fixed divider.
>
> Patch 4 prevents having a duplicate OF clk provider for the topckgen
> controller, but removing the previously registered instance.
>
> Patch 5 deduplicates the parent clock lists for MT8192.
>
> Patch 6 adds proper error handling to the clock probe functions for
> MT8192.
>
>
> Please have a look.
>
>
> Thanks
> ChenYu
>
>
> Chen-Yu Tsai (6):
>   clk: mediatek: fix unregister function in mtk_clk_register_dividers
>     cleanup
>   clk: mediatek: Migrate remaining clk_unregister_*() to
>     clk_hw_unregister_*()
>   clk: mediatek: mt8192: Do not re-register top_early_divs in probe
>     function
>   clk: mediatek: mt8192: Avoid duplicate OF clk provider for topckgen
>   clk: mediatek: mt8192: deduplicate parent clock lists
>   clk: mediatek: mt8192: Implement error handling in probe functions

I've queued patches 1, 2 and 5 up here [1] and will send a pull request
to the clock maintainer later this week.

The remaining three are related and still under discussion.


ChenYu

[1] https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git/log/?h=clk-mtk-for-6.1

