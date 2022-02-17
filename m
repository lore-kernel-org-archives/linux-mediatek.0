Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1302DC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 20:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+FfG6tKtgmf+/MksDTbmwOpTFpavIZeLmNsl1r3eoF8=; b=e9A/YPiQLpnjZc
	k7lIeX1JD4FSFZLHAsz7laS9Rhl4MoNzw2jXy84jugfy2vgKjZ0qCbv+8X5AHD02+XMi6k30HuQe7
	0QaeIOBGpMxCnsmiZWzv33/6ivpQ+ZTBAYd4UmLqGa2shNYJ4lejLRj/zMSYP3pL9ytDsBpGV/2f8
	fzc4QFbncb2TLc93ZExBQnoP3nyg7x742ZEJ/JDAzEKDoYZyWMAY4j/2jm+I3fVZfGzIf29HdYOdQ
	ZrEYejfQqoShw8cM6lfQRy4ZX+XMUnDNM+2UndqRi8UkU93THBMiFeoCdcUTB+k6C2OJU8rGAIuPN
	10I2YytI51iWzwf5v7mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKnGs-00C1e8-G8; Thu, 17 Feb 2022 20:20:58 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKnGg-00C1ZY-1j; Thu, 17 Feb 2022 20:20:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 40513B821B1;
 Thu, 17 Feb 2022 20:20:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1D68C340E8;
 Thu, 17 Feb 2022 20:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645129243;
 bh=sx8mrhtZybxoA/xwGIindVNL5oiE54Uyr9+FkKocTuA=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=dBsuc10E9HHQ0xqa/0XRq9MtCU3Pk9Re+kV/JRIiSXh1y3Png2mNS/DXGUmCx02YG
 ULVwBZaBf5XhRbjnTVoRlrV6P3Z8IaKnthq4OkrI9/S54Lv8Ky1tIPN1i8DiWYU9pT
 2C/nsy8ML3cxCaDm1xrJbuCmKDAJ/ZtjUxEEhIc0q9f8uJzjPi+uuldVIYxJ21qjMx
 v06fnNvn98nUSEqh2XYwjsB11pS22npKW302AyA1+H/f1Dbv2oqJS+chwKI7AZGXAy
 ldB8yxRpX5ktnRnZFrxnqVtvWoiCBTdm7zNjGyGJM9hE2uzbgVed0BacVnavlTfuy3
 5fLHG12kegJgg==
MIME-Version: 1.0
In-Reply-To: <20220208124034.414635-3-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-3-wenst@chromium.org>
Subject: Re: [PATCH v3 02/31] clk: mediatek: gate: Consolidate gate type clk
 related code
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>
Date: Thu, 17 Feb 2022 12:20:41 -0800
User-Agent: alot/0.10
Message-Id: <20220217202042.F1D68C340E8@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_122046_255942_13D85248 
X-CRM114-Status: GOOD (  12.83  )
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

Quoting Chen-Yu Tsai (2022-02-08 04:40:05)
> Right now some bits of the gate type clk code are in clk-gate.[ch], but
> other bits are in clk-mtk.[ch]. This is different from the cpumux and
> mux type clks, for which all of the code are found in the same files.
> 
> Move the functions that register multiple clks from a given list,
> mtk_clk_register_gates_with_dev() and mtk_clk_register_gates(), to
> clk-gate.[ch] to consolidate all the code for the gate type clks.
> 
> This commit only moves code with minor whitespace fixups to correct
> the code style. Further improvements, such as internalizing various
> functions and structures will be done in later commits.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
