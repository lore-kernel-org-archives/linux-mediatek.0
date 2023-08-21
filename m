Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D6EEE4993
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Aug 2023 07:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EjQzpmLeatj2IWSEVEqmjT65UvLg+N8jTIiui7Oe2w8=; b=m6TN6aOKVdOvU7s1QJPQZCTvwk
	jzcMb6udNEto3l7FWzNBQt7CpjGNJzVK15VmsW7Vplqdh+WfRtCckr9s+oU9INscYLZ+KMnRn7AFw
	7dcttZiqy/nA+8CUePJiAXMc8YaIGdjkA+IIFVpAKNt5jnL92+fqlsMisob0AX34Cro/QupmWXhNF
	Q1PhBRFxxkvgQ4klEokwuD+4zQ7jELgnqsZGES5hG4J2GGL3DB0rrsT66+l8Hlds7TUulpRZMVfXK
	0oQqpV6s29Q8x+dLEFy/ZeYt2pOqzFBPay2xoxtCdOGN8rVDTLTShnU++zuOz9a6A6O93vseyjRiK
	PfqQE5pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXznO-00DPhk-0F;
	Mon, 21 Aug 2023 07:57:54 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXznF-00DPb8-1O;
	Mon, 21 Aug 2023 07:57:47 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 274F6C0004;
	Mon, 21 Aug 2023 07:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692604661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EjQzpmLeatj2IWSEVEqmjT65UvLg+N8jTIiui7Oe2w8=;
	b=bPeVr3vMkvoX2FCglJ8GToHqugz07ra8A1nVMtMELprLejAB/r9UIVD5Kn9YfQ2mFmiuLM
	O/ygABt99KKf3IE6viIBSBdE8mpQHGR5mGG14SgrLjTkQVetw2rLTaTScyUPajqD9SgufP
	8e45/BF02146U2OwcLrCTT5zqDndkMhKTh0aCRBVqEAEKuTernH9z2TZ9IUhT+J/yjpGyP
	Y+KOR6IJyGreTkT7pmmefKeUmpFQxLOpK5jewWAsGZC08I1JqbEsaJqeeugUd5wZGQpb3f
	OSL+kKsEaJTf6wF4YNTrNO4TDPrSjCprjuXq6xuwgg4gAymOcC3c38kftPCKKQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Li Zetao <lizetao1@huawei.com>,
	miquel.raynal@bootlin.com
Cc: alexandre.torgue@foss.st.com,
	angelogioacchino.delregno@collabora.com,
	christophe.kerello@foss.st.com,
	christophe.leroy@csgroup.eu,
	dmitry.torokhov@gmail.com,
	frank.li@vivo.com,
	geert+renesas@glider.be,
	heiko@sntech.de,
	jernej.skrabec@gmail.com,
	jinpu.wang@ionos.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	martin.blumenstingl@googlemail.com,
	matthias.bgg@gmail.com,
	mcoquelin.stm32@gmail.com,
	michael@walle.cc,
	michal.simek@amd.com,
	paul@crapouillou.net,
	philmd@linaro.org,
	pratyush@kernel.org,
	richard@nod.at,
	robh@kernel.org,
	rogerq@kernel.org,
	samuel@sholland.org,
	stefan@agner.ch,
	tudor.ambarus@linaro.org,
	u.kleine-koenig@pengutronix.de,
	vigneshr@ti.com,
	vz@mleia.com,
	wens@csie.org,
	yangyingliang@huawei.com
Subject: Re: [PATCH -next v3 09/12] mtd: rawnand: sunxi: Use helper function devm_clk_get_enabled()
Date: Mon, 21 Aug 2023 09:57:35 +0200
Message-Id: <20230821075735.33158-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230821031737.1973183-10-lizetao1@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'a95da2721268e237eab6b2eeb9c6d117943d642f'
Content-Transfer-Encoding: 8bit
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_005745_598078_37673561 
X-CRM114-Status: UNSURE (   6.12  )
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

On Mon, 2023-08-21 at 03:17:34 UTC, Li Zetao wrote:
> Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
> and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be
> replaced by devm_clk_get_enabled() when driver enables (and possibly
> prepares) the clocks for the whole lifetime of the device. Moreover, it is
> no longer necessary to unprepare and disable the clocks explicitly, so drop
> the label "out_mod_clk_unprepare" and "out_ahb_clk_unprepare".
> 
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

