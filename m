Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D3F8C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 19:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0i6/yWgnZpZNuUqJmojEZK8uSlpcP5/lJMJhhUbQe/c=; b=JfQDPDojBs6syk
	Qjg5ZntQh7HtDHRMaeCENOIow1LxG1j4f4ql3G/7Jw9IBU9cXyYpGEaR4O2UICycI9RtTopZnT2ZS
	YO/686d1bwPYLrgepXG/0Ka0fca+6jmPJnPybAayNWIie5AYzxKE3Y2QBATDe+syfJ1oVUm2xhj56
	zHdMbrimbYA3b1AUzV6Xt5CmEoZnx4itCoeA4tJuU5xFQdp1USYinmvPK96qNdVBIXazH/pwdXzI7
	ucixhaTsUw1YIy4wYZAd+W0BUtYkEpGFt9RlT+RnNARXEuGvUQ9F4H0lfsmfYme8fT5my+OCQkkyL
	ZN51SHbxMMTdAa1+WNYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHWEi-00FQ9I-Gl; Tue, 08 Feb 2022 19:33:12 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHWEX-00FQ6d-Am; Tue, 08 Feb 2022 19:33:02 +0000
Received: by mail-lf1-x144.google.com with SMTP id i34so35372642lfv.2;
 Tue, 08 Feb 2022 11:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2W7DYXaGXAgPpoGJnP20s2qFgNTqr+6rJEgdlvW7zvU=;
 b=kMuwFDLTnWORZko26nLUM2LJzxS9SY1CLZqxNW0lzKCV/vmPTR3Xxlgd7np844KD7d
 PDXePM3TLBe+GmDPUt7xrACd2kmIO70YDoMm1aPRiV2ErFCVkrWWHtkzS0JpAMSI/J9F
 b1HCDX3RjvFI07siXqPUpvHwawW+3wxh6eZLpaUIBw8m6dR49x8ULFVcgPk3YjSiGD6F
 XfIR4JSlHIzWOrWZMZZTFswMUs7UMsOqFyM7CUfiKIxJ3ZGflcpYIcVXrr1luVIRPaAn
 jk/nDRueStbx9blKjvcgfJwL1Q9oLdHQ50vQFBvEklyrfbG1TFENepzWmMrwbrPexK/S
 NUKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2W7DYXaGXAgPpoGJnP20s2qFgNTqr+6rJEgdlvW7zvU=;
 b=eHzXWD1y1CmIoFK+ioEAQlr27fBShONGBxWF6kGvy1VslINdCz+dZYpz6pyhnC6B1C
 UvzPdsoOgbsd7tLc2Hj5oLPY8zficw5IvpZS/CiIs2gIjPSP4k8CoMY8jmKZwS6yo0t9
 zBmhtBbvO80Kt+LIn0RAtzohrESsuTxjMRkTaoO2Y77RtCrHKYwi1JsGhK4PxRpTw3X6
 3qdm8S1CllRnBixP3SoeFgZF9AnFB19i6N6Uq8bJG0oTL9zFOfLLrxbeQcyeXv2A9n6V
 RxsUR9m+YZREspRh0qT48VLTUXGG0VQGkNEVT2Np3pBc25JhMMvK5o7v/iC4Z3LW/7kQ
 uVJQ==
X-Gm-Message-State: AOAM530vir5oIAObuQmrLBW3ly2/E8p6fgtp4g9wXVeB1lNnhIN9w6tV
 eb9k1sz+SPeuZxPdtak141c=
X-Google-Smtp-Source: ABdhPJwSvHo/X4lCJo2ybTEfnU54vBadmQxXw1Ya2qxlVVCvTSRNJGNpXJNqaYUBwPhLY6F/IWv3+Q==
X-Received: by 2002:a05:6512:2302:: with SMTP id
 o2mr3932007lfu.159.1644348778629; 
 Tue, 08 Feb 2022 11:32:58 -0800 (PST)
Received: from pc ([185.108.107.99])
 by smtp.gmail.com with ESMTPSA id f22sm484707lfm.72.2022.02.08.11.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 11:32:58 -0800 (PST)
Date: Tue, 8 Feb 2022 22:32:52 +0300
From: Boris Lysov <arz65xx@gmail.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Miles Chen
 <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/31] clk: mediatek: Cleanups and Improvements - Part 1
Message-ID: <20220208223252.7f179c63@pc>
In-Reply-To: <20220208124034.414635-1-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_113301_412511_02D2DE43 
X-CRM114-Status: GOOD (  17.63  )
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

Hi, I couldn't find a particular patch to reply to so I'm replying cover
letter to give some input on the PLL subsystem.

On Tue,  8 Feb 2022 20:40:03 +0800
Chen-Yu Tsai <wenst@chromium.org> wrote:
>  drivers/clk/mediatek/clk-pll.c                | 100 +++++-
>  drivers/clk/mediatek/clk-pll.h                |  57 ++++

In clk-pll.c there is an mtk_clk_register_pll function which at some point
executes this:

> init.ops = &mtk_pll_ops;

In my opinion there should be a possibility to define a custom mtk_pll_ops for a
given SoC instead of using a hardcoded one because not all Mediatek SoCs share
the same PLL startup/powerdown flow. For example, the existing mtk_pll_prepare
implementation won't work for the entire Mediatek Cortex-A9 SoC family (this
includes but not limited to mt6515, mt6517, mt6575, and mt6577). 

> static int mtk_pll_prepare(struct clk_hw *hw)
> {
> 	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
> 	u32 r;
> 	u32 div_en_mask;
> 
> 	r = readl(pll->pwr_addr) | CON0_PWR_ON;
> 	writel(r, pll->pwr_addr);

This code sets a bit to 1 to start a PLL but the SoCs I mentioned above would
need to have that bit cleared (set to 0) [1] [2].

Another interesting thing in mtk_pll_prepare is
> 	udelay(20);
Is 20 ms a settle time for PLL? If yes then it would also be cool to specify an
arbitrary value easily as some PLLs have longer settle time [3] [4].

Worth noting the SoCs I mentioned aren't in mainline yet, and I think there are
more modern mainline-worthy Mediatek SoCs that might also need these changes in
the future.

Thanks.

[1] MT6577 HSPA Smartphone Application Processor Datasheet, pages 1212-1227
(*_CON0 registers).
[2] MT6515 GSM/EDGE Smartphone Application Processor Datasheet, pages
1202-1216 (*_CON0 registers).
[3] pages 1303-1306 of [1]
[4] MT6589 HSPA+ Smartphone Application Processor Datasheet, page 1344
(MDPLL1 & MDPLL2)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
