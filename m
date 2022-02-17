Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D202C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 20:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oViCIE5P+GIw5OuuyD43RN/gDnwmUxqOGSm5AazVzIw=; b=ik+inc8gOtYs0M
	tkQe3PtJ8ZjA7+W9SswfFkK9WIAgcojl24fGPfCzn/8L7oBgNZXtmyXuMck+nbjkri7CH3im+cNBt
	r46Lm2Rs3Lt6R7Y2Odhtoj4UzbQXqSUYB5+CuzXj1LlG+lSW53Qy7TNCQnoWRSt/jmd/w4KzfVlkH
	W8sapBQMWdGSd+tibSwTiVc2ApRKYk1z+oAEaNQdyb7gneYOJ8LXvvZH9j0Y0bDF59PVLaQr3xvL8
	BWBsQWKzbEK5By9Pm6bKBn+Hkr0NmjS77fDg2LUnsfLMQaow4IfZK51WQh6ZbtgkJf7viIiMyXsTO
	dmF6zfqHR1WZ4MS6ZXdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKnIa-00C2gZ-58; Thu, 17 Feb 2022 20:22:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKnHW-00C1yp-IQ; Thu, 17 Feb 2022 20:21:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BA24461D80;
 Thu, 17 Feb 2022 20:21:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19A2CC340E8;
 Thu, 17 Feb 2022 20:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645129297;
 bh=rjFKmucc+DAtHD3oHlBzYPq2Ot0rubSN96z3IT6lx90=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Z6TkMDzm8T95QmTmyb6g8wYp8IdqR4ThI6qvPUDQGpkNHq81Cx3z0SMqPFORJ8i2+
 FS8LBJ1MbtMZFEsshmUzDaXLEx1IhnsVRHTIy5CPbKZaCfiIAC+AvxZNLL9qjtIzL6
 5PHbETnppVeaLPtExpbhlG66VJPnLFYufVFtCJ2GK0Bp46rhVXjoEUDpvgXZkvonxs
 BF9PLfS0ntgKFKaQ54dfR3cCTv69opGs2nSEITxV0kq7aiASiTtQKNaWp1kWD8eYMg
 NTrfGRWa3AZdwwfV+kowwlTcaIHLRjHYHuQ+3cOrl94MMNuYLZxV24TEgjFx129JM8
 2KnTmgLWe42zA==
MIME-Version: 1.0
In-Reply-To: <20220208124034.414635-8-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-8-wenst@chromium.org>
Subject: Re: [PATCH v3 07/31] clk: mediatek: cpumux: Internalize struct
 mtk_clk_cpumux
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
Date: Thu, 17 Feb 2022 12:21:35 -0800
User-Agent: alot/0.10
Message-Id: <20220217202137.19A2CC340E8@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_122138_700935_D1DCA793 
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

Quoting Chen-Yu Tsai (2022-02-08 04:40:10)
> struct mtk_clk_cpumux is an implementation detail of the cpumux clk
> type, and is not used outside of the implementation.
> 
> Internalize the definition to minimize leakage of details and shrink
> the header file.
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
