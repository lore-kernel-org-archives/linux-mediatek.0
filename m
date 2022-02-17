Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3B3C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 20:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oPQJA9OFnBCdkQ4tO/l1OSJV72FMUwSSkw4OomiMw8A=; b=VNCP8QMniVYAQG
	C0IoYkfYMwWna6eJi8lqwd+jlQN9D840Mc3GHHUYV6TzqIaauOxxVVGuLQp29bvtFNOVjEBxwqX8R
	nvmGVolMrcsSmv9PlmzCRULX4HjOqXANjlPuWzMC4fZ5j5+fenzFw+8mnugCeUkFdZASdrkLa2OJF
	plHQvs7mExoXGCYoxUlKxAbj6+T8+tq9BOX4u0kcm4R+UUjQ0IaloCFjbM7QCHLPNvTISi2yMdgOw
	4lmDcUhnnNYgv8ZDW7p9U5HIe6nKxB9RibB3hCoQf/y6cCZGH+BtGDFtRtiweTqpxEAunYV7XxPIT
	XIidtbhh59zMNZcCwE1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKnQP-00C6Tr-SC; Thu, 17 Feb 2022 20:30:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKnLd-00C4AC-Vq; Thu, 17 Feb 2022 20:25:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 80B1A61D7D;
 Thu, 17 Feb 2022 20:25:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D44F3C340E8;
 Thu, 17 Feb 2022 20:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645129552;
 bh=F56jf0lsMIV7JzWwGs9VyV/0PlxgQNzNy9P6DuyhSBc=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=h0pF0tnGV1u/PtVKkqfQivXmkANDsTzytkZMxqHRGb40wGnl7DH29txeynNMlLHCd
 65lQqZ1OIyYfC6/kdWiIWTHYrUytP+HQXAPYTXMEBigvLyhSKMDe7cRPSuTtTX1mS/
 yGk7BR6A51jnP0JohKs64enaO2FkUP+tOCRLUOlDthK1+1p4swsxmSuBbWeaNqGKAh
 6GOUiG8oklEUXJcOaxP4FNZ/Knk7lCq/pF1T9QhBmwkGf2p/wY27SZpl4nX2gsSyA6
 MSTSpeEi38FvfWNiAaKkAkyFEWJ8P6rAy0qsomJnvH2bLsFEcdS94choCdfDKfNomP
 drpPQQk3CDVNw==
MIME-Version: 1.0
In-Reply-To: <20220208124034.414635-16-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-16-wenst@chromium.org>
Subject: Re: [PATCH v3 15/31] clk: mediatek: Implement
 mtk_clk_unregister_fixed_clks() API
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
Date: Thu, 17 Feb 2022 12:25:51 -0800
User-Agent: alot/0.10
Message-Id: <20220217202552.D44F3C340E8@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_122554_105248_756FADA5 
X-CRM114-Status: GOOD (  10.90  )
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

Quoting Chen-Yu Tsai (2022-02-08 04:40:18)
> mtk_clk_register_fixed_clks(), as the name suggests, is used to register
> a given list of fixed rate clks. However it is lacking a counterpart
> unregister API.
> 
> Implement said unregister API so that the various clock platform drivers
> can utilize it to do proper unregistration, cleanup and removal.
> 
> In the header file, the register function's declaration is also
> reformatted to fit code style guidelines.
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
