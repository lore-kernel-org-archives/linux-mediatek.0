Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CFEC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 00:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pe9VNh9DSYW2+8zw+18xsvijqkSJvDSyk8ZNRJldc4A=; b=Vc8bBjh9+oEY1f
	NSvFEQYgWVDGoeC4h3irxr7Nz6X8OkoOPxeurkjr/L4w2Ns2Rl6nMwwj4yVaVhJRypYceF9eDyMsS
	eUkcRdEa6Hyd0RiMeatS7Gxe88gY0FxFZ6AXDBbDvyzbCQHnYT1pECXLMKOZkXf0zhY344wo2N6s4
	30BMbhVSkvtOnJqd4lS3XtY3nb5zdUc/LzES4hjl14wjnqZtDaY3Q8S5iG14n1fAOknNYJ3VhjfOa
	dqLIYt5NyFA0bB4gFgFpcGxjSPuteVbyeSGSQhswS3AiCRwt+Q/nzT/9DoELNSWyHNqTySmoabX8t
	etziYLqRZ0seAqhj0u8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrqdm-009p7U-VE; Fri, 20 May 2022 00:37:14 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrqdb-009p58-O0; Fri, 20 May 2022 00:37:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 30B7FB8293E;
 Fri, 20 May 2022 00:37:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5182C385AA;
 Fri, 20 May 2022 00:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653007021;
 bh=gvgyiR4nm40hdy8JYiEAaMyY8X8o/o9DlmkPBGAkQUU=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=WudWJUfXP+mktm9kZee6vsDLSvX5C1a5PoJCzx2p/xCfk27AqCC9Ay/qZU/6sTHk3
 Cmyje746N9XWWFpxjVbRPERDRCAhDIu0TDTbHyhjI1g1FjealQZ/170sPl0JpHokwL
 x/S98/tyrueVqzyT5cseyROcdRZ7DSEWWypejkQazOBVQQowQfW0GliUMZwTvzxem3
 jQF6t3xm6z6iebvvreCki2OY+PzazDYHEqXadJtkMCIWSEBe9O5Pt9sOeS/cdqvXcb
 cgUtCHizBZr9TZR3wK92CjCV0/fstJEeeI/4mmrrFSfJFX4OcmCBkwMaa6X7BpJiDH
 tn1wdx7RepjNg==
MIME-Version: 1.0
In-Reply-To: <20220519071610.423372-2-wenst@chromium.org>
References: <20220519071610.423372-1-wenst@chromium.org>
 <20220519071610.423372-2-wenst@chromium.org>
Subject: Re: [PATCH v3 1/5] clk: mediatek: Make mtk_clk_register_composite()
 static
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
Date: Thu, 19 May 2022 17:36:58 -0700
User-Agent: alot/0.10
Message-Id: <20220520003700.E5182C385AA@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_173703_968548_09C67654 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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

Quoting Chen-Yu Tsai (2022-05-19 00:16:06)
> mtk_clk_register_composite() is not used anywhere outside of the file it
> is defined.
> 
> Make it static.
> 
> Fixes: 9741b1a68035 ("clk: mediatek: Add initial common clock support for Mediatek SoCs.")
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
