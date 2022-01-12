Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59779C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jan 2022 07:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RgyG78f57dpRdZMn4wdL6IKToWUWd0zV0VaE/1nYzD8=; b=vYtUcKJZx/Wmsq
	TP8vAZ/AIdRdLVp0LGtZkUgmahM2mlWdKD7+qLRetX0/YYoB0bfX2f/iXYmmR4GaFoq/RPw6u9cgN
	5I2DFw5uX+0pfvjfs6zQ1CK8ZmriObsmTZRuSWvA1w9TkiYxS70aOx6OgSCF+DlNwkXHOZLPITCqy
	Wkn++IvRvRck8S43sGeUH55KDaWiJwP6kmDuhbiq2lOxdNqro+dhwBezRwNBSe76mmbj+OqyXQcoI
	gXi4Kczwq8tQArjdSGqVXo5F/Xw85AOgSQuj7yIUT3zMZAS8w85aYTphCeCnW1iHKhtJfd8klJbzD
	xKtMTa1ja/G9tvdnU/Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7XeV-001Lmc-QJ; Wed, 12 Jan 2022 07:02:35 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7XeJ-001Lju-JA
 for linux-mediatek@lists.infradead.org; Wed, 12 Jan 2022 07:02:24 +0000
Received: by mail-lf1-x135.google.com with SMTP id d3so4657639lfv.13
 for <linux-mediatek@lists.infradead.org>; Tue, 11 Jan 2022 23:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qPlvZ7SgaEi0S0R2Ekpno8fmedH18d4jSr4icAzwWOE=;
 b=TdR+xGF+2F0wNO02bRUsRfwz/8CbD6jzJ4E9pT7NuZrDanOybqP6w47UXHAfz0mldv
 DJdsVkYfNjB+vP+swMqx0mViYs76MGXFC9VbWbnzG6BpTXEftkZp1rIhnSsw7LTMM85V
 YXOnBqnIVvIKLjqrJ7vMq6UiXZxw9GaIwvo7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qPlvZ7SgaEi0S0R2Ekpno8fmedH18d4jSr4icAzwWOE=;
 b=pmxeLT3Psd0NmlWFrQ346p9wlaDltNbHg/DkURDQc44MixXJAkStGy4HTivE5soEHb
 K68HyFEK3Ihq8FA34RhQGHexhDY2Qj4Eq+VAfJ4XilKOHwNzEneG7SxfYKCWu4v8LSrQ
 PGeM8bGouu6mxyRM1zhwPPMbr3wRQozB9q/hhAmHUKD4POlrgD6OSXji73v4W/n+1xdV
 9C0hLA0jojatngqWt1vEKj8/yZKcVo5aEXgsUBBPM+DA09SjfJl3s9ztCbvbfz2jvjnl
 lZiGqQfbclXzL4R/Oxg0mFMv9JsI8ynRS7njDd69bq57yDFBzbO5kvcBwxzJM/psZypW
 MAYg==
X-Gm-Message-State: AOAM532oCWEuFIXKgyA76MOI5owbNm+t2DpI7wjBoZAyV34OKDWj6fh+
 lHCFOd9BGNimvi9LMVJfsv6JcEEkLAkIMnpfKrfk/Q==
X-Google-Smtp-Source: ABdhPJxXvYqx3G6aIa/2DKUhp3bz33YZPpV3/zrmpMFnHua1Juqcg44GELc9DoNFmlb2euiiasfXIykUXtIFH0KZolk=
X-Received: by 2002:a05:6512:3093:: with SMTP id
 z19mr5945256lfd.670.1641970941956; 
 Tue, 11 Jan 2022 23:02:21 -0800 (PST)
MIME-Version: 1.0
References: <20220111112244.1483783-1-wenst@chromium.org>
 <20220111112244.1483783-2-wenst@chromium.org>
 <2dc957b1-300f-161c-edb6-efacf11942e0@collabora.com>
In-Reply-To: <2dc957b1-300f-161c-edb6-efacf11942e0@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 12 Jan 2022 15:02:10 +0800
Message-ID: <CAGXv+5HV+Ca74paF-L54owyCBtBwTNU0r2aT7drjmBxo2dV=uA@mail.gmail.com>
Subject: Re: [PATCH 1/7] pinctrl: pinconf-generic: Print arguments for
 bias-pull-*
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Zhiyong Tao <zhiyong.tao@mediatek.com>, 
 Guodong Liu <guodong.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_230223_672036_22B90F6C 
X-CRM114-Status: GOOD (  10.06  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jan 11, 2022 at 9:42 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 11/01/22 12:22, Chen-Yu Tsai ha scritto:
> > The bias-pull-* properties, or PIN_CONFIG_BIAS_PULL_* pin config
> > parameters, accept optional arguments in ohms denoting the strength of
> > the pin bias.
> >
> > Print these values out in debugfs as well.
> >
> > Fixes: eec450713e5c ("pinctrl: pinconf-generic: Add flag to print arguments")
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> Tested on qcom-SC7180 Trogdor, mtk-MT8173 Elm, and others;

Cool! I'll take that as a Tested-by tag.

> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
