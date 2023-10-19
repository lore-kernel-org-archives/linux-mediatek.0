Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9493CDB484
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 01:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c/JyApc13y5twAwPFapbUHbj9jCE/KHWhQ+y/DCn/AM=; b=JCNTzitIm8uoaB6drKBCnl7mrM
	AEZsBmqgj4YKPn7m6BZxsbthiGLTQgegHIU6wAdicnus9lgpDqiQKXLtYP7g4oN1uEyqHgayJmZZ1
	3GTAvWb8vPc3kMVuLUJYxa1LiRRdBe0eUAtdxOcKOVoWcwUOZgJE2B+h1VerZVvDqHbciCG+ldxuP
	3XVMvMLoNUyFKSlQhm1XHcpGP7gU1CXUFvonEKgQJiFkGhkChTtUvHYde87FTghETkwagJvc+ralK
	6sYXNKOkZzVe80J3CH+SZmHuNIyDiQNGa9ELNgYnXaVQPJG5QQ1jlfuTQ9F22X/FzC35CUx4v4wu9
	Bf1KMxXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtHe5-00G2vp-27;
	Thu, 19 Oct 2023 01:16:17 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtHe0-00G2ta-01;
	Thu, 19 Oct 2023 01:16:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 62294CE286A;
	Thu, 19 Oct 2023 01:16:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88C68C433CA;
	Thu, 19 Oct 2023 01:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697678168;
	bh=c/JyApc13y5twAwPFapbUHbj9jCE/KHWhQ+y/DCn/AM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=lHWYwkNjlBiA8wJpDrH0MLWI3yBGF4Uu1fWPFyRcmUrN6ykv+nqQ+rfoSO6Z8z3r9
	 nCRn8Ll2MNi7Sj+IQiQy3byRAW7/4/94TjHK0SmmUZrSKfiMTc99vLyD/UPLSY9PH/
	 zh4o7Qsi9I3Bi8M6c2sWkXba3pG4Ox7jcO0pTapuF8pSeBU73pcNtOPdz6iy2uEkLz
	 TIS98jLBtlEqKTyWughwJVbaokyr3RoEeh6q9WchYM2yMkmczc+wrWn9HshVOHrM2Y
	 tLTIgI4ee1fkoedCWXQjVbSyPHjr3l3bgU96xMPNhdE9qDadlDcJ4y8RRIld0JIZo+
	 d3vU4ZIab3BHA==
Message-ID: <ff3136f73ea21e52e6ae0bfa5a496a82.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230912093407.21505-5-jiasheng@iscas.ac.cn>
References: <20230912093407.21505-1-jiasheng@iscas.ac.cn> <20230912093407.21505-5-jiasheng@iscas.ac.cn>
Subject: Re: [PATCH 5/5] clk: mediatek: clk-mt7629: Add check for mtk_alloc_clk_data
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Jiasheng Jiang <jiasheng@iscas.ac.cn>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, amergnat@baylibre.com, angelogioacchino.delregno@collabora.com, cw00.choi@samsung.com, frank.li@vivo.com, kevin-cw.chen@mediatek.com, luca.ceresoli@bootlin.com, macpaul.lin@mediatek.com, mars.cheng@mediatek.com, matthias.bgg@gmail.com, msp@baylibre.com, mturquette@baylibre.com, owen.chen@mediatek.com, robh@kernel.org, ryder.lee@mediatek.com, u.kleine-koenig@pengutronix.de, wendell.lin@mediatek.com, wenst@chromium.org, wenzhen.yu@mediatek.com
Date: Wed, 18 Oct 2023 18:16:06 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_181612_221508_27545815 
X-CRM114-Status: UNSURE (   7.42  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Jiasheng Jiang (2023-09-12 02:34:07)
> Add the check for the return value of mtk_alloc_clk_data() in order to
> avoid NULL pointer dereference.
>=20
> Fixes: 3b5e748615e7 ("clk: mediatek: add clock support for MT7629 SoC")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---

Applied to clk-next

