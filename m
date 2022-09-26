Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2AB1C07E9D
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 04:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=inQx/B+myoBQVAF3vsFN8D/0R7rZQjwNrUieRpG8clU=; b=OBFdzpO1AP1LsqJH4ITiST4hv8
	P3bjeGQoWaNq71XcPd5gM+YlMy6NbhvAH0wZlKJrEfn6JkGe26BigIw73+xGwZmwxeoqCJY4W8ZMH
	CBHP3q1J3c0PjwSOu7tTR61O9TNibwoqmoilr08eW7kr3bqaOmoN65wRKLsU+7vR+eqp1EJ5btzoC
	olxjOp10cb7tdwnC9dcOnNX7s9PtKEXSeAD9KzktPkP8zqBxa6aRuGmTFreFlkgi45bpdDCbmdYr2
	YsZ+2MBwS/AVMrkFoseScQx/rkn8+/TKVdAzdyedqa9YSh4G7rNuOEaJ5T2Mp1tQSh8s5cjlem0zk
	FhqM4n+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocg04-001kX1-8x; Mon, 26 Sep 2022 04:45:48 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocg01-001kTv-8D
	for linux-mediatek@lists.infradead.org; Mon, 26 Sep 2022 04:45:47 +0000
Received: by mail-ej1-x632.google.com with SMTP id r18so11478217eja.11
        for <linux-mediatek@lists.infradead.org>; Sun, 25 Sep 2022 21:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=inQx/B+myoBQVAF3vsFN8D/0R7rZQjwNrUieRpG8clU=;
        b=j/uFU1KOCRqduTJlrlEoIn6ttforECuEoaRHf2Jkb1/p00FI72BhA+ja0+iw0yrlSt
         PyWtg1GZTi4rAHzt4bV8b93gt95RdcPppHsOHk7Sj0JJB63rSc1AZSvmj5mmHrUTV55b
         9Srf43HDAj1z8qqOrmCkboDh9b2nghcIx73IA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=inQx/B+myoBQVAF3vsFN8D/0R7rZQjwNrUieRpG8clU=;
        b=oNoaE12kxyKhbrxT7JXwLOOxFWMIgG6nZycLBeGHemVmqIwhxT8azTVQFQGH3Cbyuj
         kUIS+DPz1jZ4pyqnZqUH8Cbqfsjwwji9SNn0T/hU7FL98lyAsOttf5pqVe/tqQysNEZg
         ANclyeYf+DK0HJsr9BVpsihwV0V50QFZqLCS12UU/50aNUG4s0pMbHYIx9obPnceY9De
         UD9OEMqYEqia50v/LMQGRDcOqG6RQKkI1ELyXcuhUKCRF0RvMjI+6AphbH8oGa2WtwVf
         OEMQj1sK3AO4xBBq3h73E6BxOnX/viCpPhqqvjZ55USYN7GsKELXo5yrwn3ULed7hrcN
         L7AA==
X-Gm-Message-State: ACrzQf0Ccu27DaniwQHOPOW4ZArAsn9H6E4WXjHL5Nv2QnaLP0P4UzOw
	7s9cUHQK3uAAqaUXfBreZB5WKHqzAfn99kmKOgsvNA==
X-Google-Smtp-Source: AMsMyM50baM0xEgY1j/hLICZS6Ro1n/Ox33rLV2Rl1Yb22kNPgKw8xFU3i402SgQ5Dfectw+su70alxJjafTx80ETlM=
X-Received: by 2002:a17:906:8455:b0:773:c45b:d970 with SMTP id
 e21-20020a170906845500b00773c45bd970mr16452870ejy.46.1664167542843; Sun, 25
 Sep 2022 21:45:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220921091455.41327-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220921091455.41327-1-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 26 Sep 2022 12:45:31 +0800
Message-ID: <CAGXv+5HayW7XFcPJyV4xWvndmLau5T068nc_XYEbyiFX=pMzVQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v6 0/8] MediaTek Helio X10 MT6795 - Clock drivers
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, 
	p.zabel@pengutronix.de, y.oudjana@protonmail.com, jason-jh.lin@mediatek.com, 
	ck.hu@mediatek.com, fparent@baylibre.com, rex-bc.chen@mediatek.com, 
	tinghan.shen@mediatek.com, ikjn@chromium.org, miles.chen@mediatek.com, 
	sam.shih@mediatek.com, bgolaszewski@baylibre.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, 
	konrad.dybcio@somainline.org, marijn.suijten@somainline.org, 
	martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220925_214545_352377_DD01D1C8 
X-CRM114-Status: GOOD (  11.01  )
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

On Wed, Sep 21, 2022 at 5:15 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> In an effort to give some love to the apparently forgotten MT6795 SoC,
> I am upstreaming more components that are necessary to support platforms
> powered by this one apart from a simple boot to serial console.
>
> This (very big) series introduces system clock, multimedia clock drivers
> (including resets) for this SoC.
>
> Tested on a MT6795 Sony Xperia M5 (codename "Holly") smartphone.
>
> AngeloGioacchino Del Regno (8):
>   dt-bindings: mediatek: Document MT6795 system controllers bindings
>   dt-bindings: clock: Add MediaTek Helio X10 MT6795 clock bindings
>   dt-bindings: reset: Add bindings for MT6795 Helio X10 reset
>     controllers
>   dt-bindings: clock: mediatek: Add clock driver bindings for MT6795
>   clk: mediatek: clk-apmixed: Remove unneeded __init annotation
>   clk: mediatek: Export required symbols to compile clk drivers as
>     module
>   clk: mediatek: clk-apmixed: Add helper function to unregister
>     ref2usb_tx
>   clk: mediatek: Add MediaTek Helio X10 MT6795 clock drivers

I've queued this series up here [1] and will send a pull request to
the clock maintainer later this week.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git/log/?h=clk-mtk-for-6.1

