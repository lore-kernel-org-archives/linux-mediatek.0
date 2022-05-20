Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBADC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 00:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cBNyyRxSttjdQWPXsdIZniaZIh85U7SIodshwa3ODJE=; b=pPsGxqSW3MUIeu
	WGGLHFdW3pVB71e1hgaETDJ/TJz9llebDVIHohwynGIVvItkc/UbTFSIFeAx/JuDc/k6LlwMQ8D1m
	0Y1Ob8Y77DcJ5/GYh49suqog/RGY6dBspv8g5knHhkNTLz9b/5wlQG5IdiMeKXsYQcD6vLp+y6WDm
	qGn7MfpOPPfdShaFNB2ei4FMdESzNBriRXl96TM97I7grD5LeQHihhZgUzFf7XmAD37Hf/1BraJLU
	Wg6Y92FAeQ+cOAT4SLcvlDvAupy0DxOOb1hlMs4OevozFMJcfVUbfetPxiqOAzVZA8gRpEU3VdP1p
	dDvcDst99dxYZWZ2HYeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrqeV-009pPm-Ci; Fri, 20 May 2022 00:37:59 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrqeG-009pFd-81; Fri, 20 May 2022 00:37:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DC461B82957;
 Fri, 20 May 2022 00:37:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94F74C385B8;
 Fri, 20 May 2022 00:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653007056;
 bh=cfMx9xFtIAJO7736VsoEPlGYeTJREVnvBIgxmigI54A=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=O8gZosYzIEowwpf2EtpzPc2U84kfm3L8OSTCsuAEAe4H/NAX1X9Ot1uRX4BAciU8c
 WLx7zikQDQkawO15TBPD2CtN+jqvU6K20CLdh9Aovc0gQ3ZNBUZQrSy/fZDBEPvU6i
 VcSOd5/i6vPh5WBLLxB/enHW1KGLKAbNlAizYoU6AAIHj1jFEUDntNo4R4hki+YlSt
 knB02pePOl8WupErdUrDBLkbqlofPY0D2ExjBBkDpbSGSM2wCdHANDjINUCL6s6XsH
 uuI3sBmnQdoBXPCQfqg13JIP7lIA6ddXJbAI6mRR/rnblqStOKXUowIn8dGcTI58pd
 +Iko1EtN74VVA==
MIME-Version: 1.0
In-Reply-To: <20220519071610.423372-5-wenst@chromium.org>
References: <20220519071610.423372-1-wenst@chromium.org>
 <20220519071610.423372-5-wenst@chromium.org>
Subject: Re: [PATCH v3 4/5] clk: mediatek: Switch to clk_hw provider APIs
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
Date: Thu, 19 May 2022 17:37:34 -0700
User-Agent: alot/0.10
Message-Id: <20220520003736.94F74C385B8@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_173744_624556_724EB33F 
X-CRM114-Status: GOOD (  20.95  )
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

Quoting Chen-Yu Tsai (2022-05-19 00:16:09)
> As part of the effort to improve the MediaTek clk drivers, the next step
> is to switch from the old 'struct clk' clk prodivder APIs to the new
> 'struct clk_hw' ones.
> 
> In a previous patch, 'struct clk_onecell_data' was replaced with
> 'struct clk_hw_onecell_data', with (struct clk_hw *)->clk and
> __clk_get_hw() bridging the new data structures and old code.
> 
> Now switch from the old 'clk_(un)?register*()' APIs to the new
> 'clk_hw_(un)?register*()' ones. This is done with the coccinelle script
> below.
> 
> Unfortunately this also leaves clk-mt8173.c with a compile error that
> would need a coccinelle script longer than the actual diff to fix. This
> last part is fixed up by hand.
> 
>     // Fix prototypes
>     @@
>     identifier F =~ "^mtk_clk_register_";
>     @@
>     - struct clk *
>     + struct clk_hw *
>       F(...);
> 
>     // Fix calls to mtk_clk_register_<singular>
>     @ reg @
>     identifier F =~ "^mtk_clk_register_";
>     identifier FS =~ "^mtk_clk_register_[a-z_]*s";
>     identifier I;
>     expression clk_data;
>     expression E;
>     @@
>       FS(...) {
>             ...
>     -   struct clk *I;
>     +   struct clk_hw *hw;
>             ...
>             for (...;...;...) {
>                     ...
>     (
>     -           I
>     +           hw
>                     =
>     -           clk_register_fixed_rate(
>     +           clk_hw_register_fixed_rate(
>                                             ...
>                     );
>     |
>     -           I
>     +           hw
>                     =
>     -           clk_register_fixed_factor(
>     +           clk_hw_register_fixed_factor(
>                                             ...
>                     );
>     |
>     -           I
>     +           hw
>                     =
>     -           clk_register_divider(
>     +           clk_hw_register_divider(
>                                             ...
>                     );
>     |
>     -           I
>     +           hw
>                     =
>                     F(...);
>     )
>                     ...
>                     if (
>     -               IS_ERR(I)
>     +               IS_ERR(hw)
>                        ) {
>                             pr_err(...,
>     -                          I
>     +                          hw
>                             ,...);
>                             ...
>                     }
> 
>     -           clk_data->hws[E] = __clk_get_hw(I);
>     +           clk_data->hws[E] = hw;
>             }
>             ...
>       }
> 
>     @ depends on reg @
>     identifier reg.I;
>     @@
>       return PTR_ERR(
>     - I
>     + hw
>       );
> 
>     // Fix mtk_clk_register_composite to return clk_hw instead of clk
>     @@
>     identifier I, R;
>     expression E;
>     @@
>     - struct clk *
>     + struct clk_hw *
>       mtk_clk_register_composite(...) {
>             ...
>     -   struct clk *I;
>     +   struct clk_hw *hw;
>             ...
>     -   I = clk_register_composite(
>     +   hw = clk_hw_register_composite(
>                     ...);
>             if (IS_ERR(
>     -              I
>     +              hw
>                        )) {
>                     ...
>                     R = PTR_ERR(
>     -                         I
>     +                         hw
>                                   );
>                     ...
>             }
> 
>             return
>     -           I
>     +           hw
>             ;
>             ...
>       }
> 
>     // Fix other mtk_clk_register_<singular> to return clk_hw instead of clk
>     @@
>     identifier F =~ "^mtk_clk_register_";
>     identifier I, D, C;
>     expression E;
>     @@
>     - struct clk *
>     + struct clk_hw *
>       F(...) {
>             ...
>     -   struct clk *I;
>     +   int ret;
>             ...
>     -   I = clk_register(D, E);
>     +   ret = clk_hw_register(D, E);
>             ...
>     (
>     -   if (IS_ERR(I))
>     +   if (ret) {
>                     kfree(C);
>     +           return ERR_PTR(ret);
>     +   }
>     |
>     -   if (IS_ERR(I))
>     +   if (ret)
>             {
>                     kfree(C);
>     -           return I;
>     +           return ERR_PTR(ret);
>             }
>     )
> 
>     -   return I;
>     +   return E;
>       }
> 
>     // Fix mtk_clk_unregister_<singular> to take clk_hw instead of clk
>     @@
>     identifier F =~ "^mtk_clk_unregister_";
>     identifier I, I2;
>     @@
>       static void F(
>     -   struct clk *I
>     +   struct clk_hw *I2
>       )
>       {
>             ...
>     -   struct clk_hw *I2;
>             ...
>     -   I2 = __clk_get_hw(I);
>             ...
>     (
>     -   clk_unregister(I);
>     +   clk_hw_unregister(I2);
>     |
>     -   clk_unregister_composite(I);
>     +   clk_hw_unregister_composite(I2);
>     )
>             ...
>       }
> 
>     // Fix calls to mtk_clk_unregister_*()
>     @@
>     identifier F =~ "^mtk_clk_unregister_";
>     expression I;
>     expression E;
>     @@
>     - F(I->hws[E]->clk);
>     + F(I->hws[E]);
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Tested-by: Miles Chen <miles.chen@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
