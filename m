Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5060FC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 00:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9FqZE90InMEK+SuqI/zFUoseRxLVSmdi+4sgssPx1Xk=; b=eQsCk31sF9UdO4
	9zukOFf4OqIvGzlA0rdJ1F0WtqjdJy7ri2u2/vCUPLL1kDqgx1PpuYUHPEm5Y5Sc51PYS14WLtl+d
	BlK3XTBuj3hT2gni1YloPWN/5qivVRuO2jCMqwlf80MAgKHMDlPKC7M2giWwzbFRZQP3X5Hzfzzze
	3Vx/DQ/eUW0yEttafoMYyMtyO6bwBfXRlm2cfgr5Oqb4SL7EEUr2NBu66nlW/Oxx21ZJRqxuzVNMI
	CFwyNMOnjxVcHMQHIZ/JcKx5fVuI++Vu/f2H2qmYMgp+PZwA2YGZZJMwy0x+h08DvI/U/HtM/r6+Z
	8Xk+F3Tb5YZE3ypaFQ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrqeB-009pFx-Q2; Fri, 20 May 2022 00:37:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrqdz-009pAy-Tm; Fri, 20 May 2022 00:37:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 88B0A61AB8;
 Fri, 20 May 2022 00:37:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD88EC385AA;
 Fri, 20 May 2022 00:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653007045;
 bh=LTTQowMe5fIFG76ASzuMYoCSU9Z8TH3Z9IDQ21ShTMo=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=V+pWojR87D4Tdluo1EBAh/3o6oMjRUB/uTPjQ+4keHDYRbuqZQ+p4ifk5Q+RIUK1R
 O+CxyOOkdDTSE+TkInjzZykmJAU1wqMSacAnpO2vn7h/smTwGNCs6PWwAV0eINw6Up
 5xfm/htovEfTgONomyG2vhCsTGv1FW1J46IrNtht9IXXHjYI9ggNOY/NSVFnc7P+BB
 hZA9Ns/kuKaqPE79DrCZUo8mC6NhhUPpYwYNMZd8jyuoTVQzO1/zB5hqrig4WX3mgL
 i0L5eu1ZX87w2lDBBMvPbyOBA8rhCEmt9BLHVfhlCzzpHLbkoDPxrij+NRFMxlYCvl
 0PE0hZobAiSvg==
MIME-Version: 1.0
In-Reply-To: <20220519071610.423372-4-wenst@chromium.org>
References: <20220519071610.423372-1-wenst@chromium.org>
 <20220519071610.423372-4-wenst@chromium.org>
Subject: Re: [PATCH v3 3/5] clk: mediatek: Replace 'struct clk' with 'struct
 clk_hw'
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Chen-Yu Tsai <wenst@chromium.org>,
 Michael Turquette <mturquette@baylibre.com>
Date: Thu, 19 May 2022 17:37:21 -0700
User-Agent: alot/0.10
Message-Id: <20220520003724.DD88EC385AA@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_173728_119910_EFBB9124 
X-CRM114-Status: GOOD (  17.22  )
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

Quoting Chen-Yu Tsai (2022-05-19 00:16:08)
> As part of the effort to improve the MediaTek clk drivers, the next step
> is to switch from the old 'struct clk' clk prodivder APIs to the new
> 'struct clk_hw' ones.
> 
> Instead of adding new APIs to the MediaTek clk driver library mirroring
> the existing ones, moving all drivers to the new APIs, and then removing
> the old ones, just migrate everything at the same time. This involves
> replacing 'struct clk' with 'struct clk_hw', and 'struct clk_onecell_data'
> with 'struct clk_hw_onecell_data', and fixing up all usages.
> 
> For now, the clk_register() and co. usage is retained, with __clk_get_hw()
> and (struct clk_hw *)->clk used to bridge the difference between the APIs.
> These will be replaced in subsequent patches.
> 
> Fix up mtk_{alloc,free}_clk_data to use 'struct clk_hw' by hand. Fix up
> all other affected call sites with the following coccinelle script.
> 
>     // Replace type
>     @@
>     @@
>     - struct clk_onecell_data
>     + struct clk_hw_onecell_data
> 
>     // Replace of_clk_add_provider() & of_clk_src_simple_get()
>     @@
>     expression NP, DATA;
>     symbol of_clk_src_onecell_get;
>     @@
>     - of_clk_add_provider(
>     + of_clk_add_hw_provider(
>             NP,
>     -   of_clk_src_onecell_get,
>     +   of_clk_hw_onecell_get,
>             DATA
>       )
> 
>     // Fix register/unregister
>     @@
>     identifier CD;
>     expression E;
>     identifier fn =~ "unregister";
>     @@
>       fn(...,
>     -    CD->clks[E]
>     +    CD->hws[E]->clk
>          ,...
>         );
> 
>     // Fix calls to clk_prepare_enable()
>     @@
>     identifier CD;
>     expression E;
>     @@
>       clk_prepare_enable(
>     -                CD->clks[E]
>     +                CD->hws[E]->clk
>       );
> 
>     // Fix pointer assignment
>     @@
>     identifier CD;
>     identifier CLK;
>     expression E;
>     @@
>     - CD->clks[E]
>     + CD->hws[E]
>       =
>     (
>     - CLK
>     + __clk_get_hw(CLK)
>     |
>       ERR_PTR(...)
>     )
>       ;
> 
>     // Fix pointer usage
>     @@
>     identifier CD;
>     expression E;
>     @@
>     - CD->clks[E]
>     + CD->hws[E]
> 
>     // Fix mtk_clk_pll_get_base()
>     @@
>     symbol clk, hw, data;
>     @@
>       mtk_clk_pll_get_base(
>     -                  struct clk *clk,
>     +                  struct clk_hw *hw,
>                            const struct mtk_pll_data *data
>       ) {
>     - struct clk_hw *hw = __clk_get_hw(clk);
>       ...
>       }
> 
>     // Fix mtk_clk_pll_get_base() usage
>     @@
>     identifier CD;
>     expression E;
>     @@
>       mtk_clk_pll_get_base(
>     -    CD->clks[E]
>     +    CD->hws[E]->clk
>          ,...
>       );
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Tested-by: Miles Chen <miles.chen@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
