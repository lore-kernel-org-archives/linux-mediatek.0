Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F7C7C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 19:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3owa3QEQEX0olI8tJ0gWI5pJche49UsDnZVuzpKQpaU=; b=xpCs9BEkdOJe2T
	BgZiHEW4L7WRiPWppWSMqnYBqm/eaLcGDgo0NzLfiMViRRVm2YjwtWXUkKT9q4WPY3s8DfLB9pURs
	RQZoBz60GscS9CIKS/yO7grlyXkNN+tB+023oPWoP/uzc0/6CGzxtID6LRz4ZwrmBWCVMiX7rPLYc
	IT2C98wodaSYm9x/v9QBWlBP2NFHkuZE+b6fuWjxI+Dflw5kfmtFzK2R38ZPql69eavaI/HjFruK3
	1ESkGPL38oMgvx3dO4BUtScC0XYiX5Dr2kVDLKa1i90Jv1lyl9s5+RXleRkYzaTy71phsVEDUbjhv
	7BsHWgV3BiLid+L+hVvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9XWu-00GBsL-80; Mon, 17 Jan 2022 19:19:00 +0000
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9XWq-00GBrI-Sr
 for linux-mediatek@lists.infradead.org; Mon, 17 Jan 2022 19:18:58 +0000
Received: by mail-ua1-x92b.google.com with SMTP id w21so22854595uan.7
 for <linux-mediatek@lists.infradead.org>; Mon, 17 Jan 2022 11:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vjIp+UiqOSyx1wj8+g5PpQdrfx2cigslZ1HN9GuuKpo=;
 b=k0CQ2BuChSX3ouSjKHcFaRNDMkbsOesrlL29L5az9lJ9/1ktY84vG3+v/Lakm4jKNU
 RliGgEg4I/c0G7Bug565ulDJPXP7R7FM/LLuzVJ2HigfhjyaIYIPO23tPUZhLS5abj+p
 fTblXAD6q3hh7vYlCJefU4J56xQD0qNNeebT56o4fGsz4t6gUaftpaHUYTb6oTQMrePc
 tEgxcPmTMeqJXBMA7mRlpLUiprlfkPN3tyOlDVmxHXQiluax8S7Mh9bU+9gJ+wDZOMmc
 3XV3wJgaxlujBi9H/Eikg8Jl5eztQ5mz4dM6XJ6GTFF93WjRIvY7NdjA75RPK6mDBG/J
 ABcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vjIp+UiqOSyx1wj8+g5PpQdrfx2cigslZ1HN9GuuKpo=;
 b=Lb2z+NUKqF8ASO/mAZajnllRol1dJMakyR4uUkeogRmw+mdu0RDOUWzjoLolTs3+3o
 zHRJhtfbVmBlAaOE/1AOhcCnzKrtNrDvkRMGwQScholkmh4D9U6l5UGhqOfX3xEd/Bxf
 ydiW2ZHKCBV2IiI8RnLpzUNV/O3FQNfmImhvj79QcIb4GsYQ1Hut4WC3fgxbHp1Em9RV
 DW7jujYQjh/Cyl/c/Jf94QvNuDprooBCjFefShCTZx5+xuRDeAZ+xk4bzM9MY6tx38qC
 dMhDFzph/P88BUCMbp8iNzb5X/s5VvUD6xg6sZfkB0ynar9KtYCPx0vadVZ1NcHer0Y+
 qOOQ==
X-Gm-Message-State: AOAM531qzAp50HGe06zg3fnV64c2VntskGoz+CsUS6YPrWlKG/JmZUpj
 oQdyINduGUMm2XUhJOjKpu6DZaijEEojiSSSUj81bQ==
X-Google-Smtp-Source: ABdhPJz+X5MWtFkAgJasTOUIrA63AKIAhp56lHfcVLzDXVRUTOiKujTw8cigGH8PWhBTGZvMxIIzXHwASWHW+A1Toz4=
X-Received: by 2002:a67:dd90:: with SMTP id i16mr8097549vsk.86.1642447134814; 
 Mon, 17 Jan 2022 11:18:54 -0800 (PST)
MIME-Version: 1.0
References: <20220117165853.1470420-1-sashal@kernel.org>
 <20220117165853.1470420-2-sashal@kernel.org>
 <b75a0bc9-0423-83cc-11e1-d5e08952cc93@canonical.com>
In-Reply-To: <b75a0bc9-0423-83cc-11e1-d5e08952cc93@canonical.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Mon, 17 Jan 2022 21:18:43 +0200
Message-ID: <CAPLW+4mPnktJTBeokhbmSGTZTqOa3-rkpThYHZ-Y0=_40bbLtA@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 5.16 02/52] clk: samsung: exynos850: Register
 clocks early
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, tomasz.figa@gmail.com,
 cw00.choi@samsung.com, 
 mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_111856_976559_D23933DC 
X-CRM114-Status: GOOD (  24.05  )
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

On Mon, 17 Jan 2022 at 19:11, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 17/01/2022 17:58, Sasha Levin wrote:
> > From: Sam Protsenko <semen.protsenko@linaro.org>
> >
> > [ Upstream commit bcda841f9bf2cddcf2f000cba96f2e27f6f2bdbf ]
> >
> > Some clocks must be registered before init calls. For example MCT clock
> > (from CMU_PERI) is needed for MCT timer driver, which is registered
> > with TIMER_OF_DECLARE(). By the time we get to core_initcall() used for
> > clk-exynos850 platform driver init, it's already too late. Inability to
> > get "mct" clock in MCT driver leads to kernel panic, as functions
> > registered with *_OF_DECLARE() can't do deferred calls. MCT timer driver
> > can't be fixed either, as it's acting as a clock source and it's
> > essential to register it in start_kernel() -> time_init().
> >
> > Let's register CMU_PERI clocks early, using CLK_OF_DECLARE(). CMU_TOP
> > generates clocks needed for CMU_PERI, but it's already registered early.
> >
> > While at it, let's cleanup the code a bit, by extracting everything
> > related to CMU initialization and registration to the separate function.
> >
> > Similar issue was discussed at [1] and addressed in commit 1f7db7bbf031
> > ("clk: renesas: cpg-mssr: Add early clock support"), as well as in
> > drivers/clk/mediatek/clk-mt2712.c.
> >
> > [1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20180829132954.64862-2-chris.brandt@renesas.com/
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> > Link: https://lore.kernel.org/r/20211122144206.23134-1-semen.protsenko@linaro.org
> > Signed-off-by: Sasha Levin <sashal@kernel.org>
> > ---
> >  drivers/clk/samsung/clk-exynos850.c | 70 ++++++++++++++++++++---------
> >  1 file changed, 49 insertions(+), 21 deletions(-)
> >
>
> I propose to skip this one.
>
> Backporting it to v5.16 does not hurt but also does not bring any
> benefits for the upstream kernel users. There is no support for
> mentioned Exynos850 in v5.16.
>
> It could have only meaning for some downstream, out-of-tree kernels
> which apply Exynos850 support on top of v5.16, but then they can just
> take this patch as well.
>

Agreed. DTS patches will be merged only in v5.17, hopefully. Till that
time the whole clock driver is floating with no users. That's
historical thing -- I didn't have "Ack" to submit board dts at the
time, and SoC dts couldn't be applied without users (board dts). So I
focused on driver work, isolated. Not much sense to backport something
without having real users.

>
> Best regards,
> Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
