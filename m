Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8187CC38A2D
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Oct 2022 22:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EcRp0GH5Esc6snP7VZR4xY25U16N2wvcVl6BzgZRJeE=; b=bqq9V8scRS4bOgltz2PLGKd5W3
	jJd8F5X2lq3o0a16orrt9Og3aivmP3NFgaPzGhXisBuY+e11EJqeXDNWjacv4O3YOGa/1Vq3hNlKO
	aHFt/iKJy7jdTkPlNw1azrxGzQNwQvhkpvThSh/ddD7F0yPVAhmTGxN6Cr8TWR/zwlc9qUziaoH+2
	Bl6+C7H1ipDzaHbH/W6SO6zhQOp/XpZi8hhD09+5bwHRbj5Hz5FEDSl0xpUJWLVMbtCGGbbLB0Yg8
	VMzCbIuRsOz/L7sF5bIZA6scm7gUbD8o49HoACI44JCPvPOehJZYzcd0ReiyqXTAO0Rs1fs30o7Fm
	fKOKyUIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on5b6-003D6M-Kl; Mon, 24 Oct 2022 22:07:04 +0000
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on5aq-003Czx-8c
	for linux-mediatek@lists.infradead.org; Mon, 24 Oct 2022 22:06:49 +0000
Received: by mail-vs1-xe2f.google.com with SMTP id o5so7714620vsc.0
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Oct 2022 15:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EcRp0GH5Esc6snP7VZR4xY25U16N2wvcVl6BzgZRJeE=;
        b=Rz792NgLGIt9O6goUOd/iW8LTGXrspz73YCmrZB+Up47bT7wDV4ZlERoSGu76oNU91
         aAI62iK++sU/HWObuMN2cxyUGpi0j8izoltf4IvsqM/IkAKGo2W4rjmqAeLlWi9mOcMf
         KfYrNN2PONwPUxRs/qenV6Mjka7riMeSpwBag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EcRp0GH5Esc6snP7VZR4xY25U16N2wvcVl6BzgZRJeE=;
        b=AHb8E8lK6QBuEknTPV9UqR4Of62d2uhMUXmq1mFFeUanSdLSD98E9XCZBeggEjGQAx
         dJa34HFft1jk31pf+79FswpQD7lepdh5yCjBFcL7bTP0ka9EL76cmayhcAZ47w+0j3WO
         HD7osZHI93F+u3u7uJm9xNqe+IVCoXn5Pkxf8P8Fj7UR/2804htH4RtYjMGcm9wEs8eO
         oR1iO2A4xVM0QuPkyt16cbyWpbHAabU7Lo5XQ/kJ3ElFqcYZaBwnGO64puxt+y9MPSuz
         d0uHEJdnqNNiIwpIC90VGc9JOYx9y8ZQGmc/EqJSMYUCTlxgwUE6hc9jRtMDC1HpoQaA
         Z1JQ==
X-Gm-Message-State: ACrzQf2dhF95NFn+6eBkX+Vp/xS7Eirnev1OF2uYdOONk0WLAHihvdeT
	LKBhbdwRdJgAr6gWzeollncTMM//6XJAiJpau0DhsA==
X-Google-Smtp-Source: AMsMyM7cxOfeBextqdk7aBE5SgrcTfc1CGSj3S0ktMl8h7EY71ngkdmETifGxNNJtvu+TcnOV/yL86UlEA0UACMkihI=
X-Received: by 2002:a05:6102:3ed5:b0:386:91a5:a246 with SMTP id
 n21-20020a0561023ed500b0038691a5a246mr20273302vsv.26.1666649206639; Mon, 24
 Oct 2022 15:06:46 -0700 (PDT)
MIME-Version: 1.0
References: <20221024102307.33722-1-angelogioacchino.delregno@collabora.com> <20221024102307.33722-6-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221024102307.33722-6-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 24 Oct 2022 15:06:35 -0700
Message-ID: <CAGXv+5EwrRqNuqunzLHtRyZ+AMyO1DDwP01TC9CjbxHnRxbH0g@mail.gmail.com>
Subject: Re: [PATCH 05/10] clk: mediatek: mt8173: Drop flags for
 main/sys/univpll fixed factors
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sboyd@kernel.org, mturquette@baylibre.com, matthias.bgg@gmail.com, 
	miles.chen@mediatek.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, jose.exposito89@gmail.com, 
	yangyingliang@huawei.com, msp@baylibre.com, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_150648_324458_D79A628E 
X-CRM114-Status: GOOD (  11.12  )
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

On Mon, Oct 24, 2022 at 3:23 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The main/sys/univpll clocks are used as clock sources for multiple
> peripherals of different kind, some of which are critical (like AXIs);
> a rate change on any of these two will produce a rate change on many
> devices and that's likely to produce system instability if not done
> correctly: this is the reason why we have (a lot of) "fixed factor"
> main/sys/univpll divider clocks, used by MUX clocks to provide
> different rates based on PLL output dividers.
>
> Following what was done on clk-mt8186-topckgen and also preventing the
> same GPU DVFS issue, drop CLK_SET_RATE_PARENT from the aforementioned
> clocks.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

