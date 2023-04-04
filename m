Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 572EEC77B62
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Apr 2023 12:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/1om0xYzO8ZjZhid2rmaGkQVzAF3rMwgKbtkKsnWWL0=; b=WExW0beybH0DcV2sn0BkhPorRS
	A+fr9X/aA7nMKRnrPAo39P7phl/xASUIZL9iPKXuf16aY8uBsJC3m/WjpfcgpFnBQHZNoTNYNepdN
	aWp7sNosTxbCXT0LtRjqadHFpCCzS72gOcT0Vfr6j8zmjIhFrGcD1lADHBcpLaYbsv5M6AYVO7zKW
	toWK3F+85uOJGtyxemRn9jNcEjS7QEVh6Ocn/YzgzEBjkFMWxu/07iuTX0gcauLSsVYwSKlk0ThMd
	dT2sxXpp+cygjxhrf2HABYcJQI5mLkwvBf4cPDO387PWIhF1rAOCWeCFSzstFm/6IzMN9/YccwkVQ
	8hIU/7IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjfrq-001Hjm-1K;
	Tue, 04 Apr 2023 12:34:30 +0000
Received: from new3-smtp.messagingengine.com ([66.111.4.229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjfrk-001HeA-36;
	Tue, 04 Apr 2023 12:34:27 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailnew.nyi.internal (Postfix) with ESMTP id 592A2582196;
	Tue,  4 Apr 2023 08:34:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 04 Apr 2023 08:34:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1680611664; x=1680618864; bh=/1om0xYzO8ZjZhid2rmaGkQVzAF3rMwgKbt
	kKsnWWL0=; b=dGhC1vGiotUN2shxcHfYnJgZ1ZK5VCPc0eNF6kd/bzyJ7P15owK
	GBihU/Ivmf2OXHokNj3Ksn04O6iw6bJQ0JR29u2DyXwkxOMFqo8BMVV0QwQiUzV/
	8Trzpu1cEcscVy1yKHNZ1/cQuzX3tAU28PFarRuDd4C7Dn3U8DiN5+fP+tdiR+XQ
	kTeFhyiuI41EOhQaQFkjZ9g4gltIdhNIs/7igLXb6sUUVq7i7WhQW7gzmxu7qmwP
	NtH0kpzrUOTkFcyOkGMBbb7NhJBsuAfHR94fr5yCsjWjEkOmZhFpaQslzrnLb5z6
	D9SkOp6QSaJBY3UolWmxDFw6ik3iKRjsE3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1680611664; x=1680618864; bh=/1om0xYzO8ZjZhid2rmaGkQVzAF3rMwgKbt
	kKsnWWL0=; b=ok01Ekxs9SCefkNSChZEgGq66xwwKE6OzZUb3CNhnZfWq1PTNUV
	cdgM94IGgPM2wXdhS6CnvlitrGqTNKo3WkmwdMKdWMtBAxefjBuJW8iwMp9FGA1+
	2NF1uZTgZZvxzLW49cyI5IbMnlmsEiFvvLmSN2nHqoBTzMakE/d8RrWVixeUVCVx
	FHrzgc2/EL1bCDsjtTaGCUwzSYgjr4+84p768L6bvFCdLr/CtSdbXD6GNF8ZGVHk
	iUOtbWEd6sxELiHUurLyi4WcFFwh/VpHSOmh7OXam66ckKLHa0/spSv+uz+DUvsg
	f6Bgv1UoMn7LkMfvpzYfmeRtX4pbpSUTCtQ==
X-ME-Sender: <xms:TxksZCWkXyVhuhcmvZwPI5su_ZWLzCvM1Em8LC5mKDksVjpr8xXQrA>
    <xme:TxksZOk9RIeJLRPZbOU9PsfdgjgLkQ4u1q_bWXrrWYqIj1gO424QcoWHmqspeOCHq
    pQO6RC8IHfXzji6wgc>
X-ME-Received: <xmr:TxksZGYK2v_dmNxWvEkZmYhTRUHtJWQz1anINTlJqaJ8439zhA_33ie8AiA1EFTtw_kSjE220iik0PvuHQtNbSEDITdSNvY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:TxksZJV9GSSiYSZ4ikCgm2YgFQH6Eyt0w5blznvljrYdpjA89OeqmA>
    <xmx:TxksZMkaTn0I3J4oVsgM5zwMSWwAQ6a4vklnPrfxJU4EffnFXymXPQ>
    <xmx:TxksZOeZhAY57vHH9BW7FHw7HKNGjI0Dm52uh1k_F28T37Joz9o3kw>
    <xmx:UBksZJQ3Z2YurifuUEjjkNz5WNyxKV0mAZM0oZRE3nc_0CpvFDfRMA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 08:34:21 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:08 +0200
Subject: [PATCH v3 18/65] clk: vc5: mux: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-18-9a1358472d52@cerno.tech>
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
To: Michael Turquette <mturquette@baylibre.com>,
  Stephen Boyd <sboyd@kernel.org>,
  =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
  Manivannan Sadhasivam <mani@kernel.org>,
  Nicolas Ferre <nicolas.ferre@microchip.com>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,
  Claudiu Beznea <claudiu.beznea@microchip.com>,
  Max Filippov <jcmvbkbc@gmail.com>,
  Charles Keepax <ckeepax@opensource.cirrus.com>,
  Richard Fitzgerald <rf@opensource.cirrus.com>,
  Maxime Coquelin <mcoquelin.stm32@gmail.com>,
  Alexandre Torgue <alexandre.torgue@foss.st.com>,
  Luca Ceresoli <luca.ceresoli@bootlin.com>,
  David Lechner <david@lechnology.com>, Sekhar Nori <nsekhar@ti.com>,
  Abel Vesa <abelvesa@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,
  Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
  Matthias Brugger <matthias.bgg@gmail.com>,
  Geert Uytterhoeven <geert+renesas@glider.be>,
  Dinh Nguyen <dinguyen@kernel.org>,
  Peter De Schrijver <pdeschrijver@nvidia.com>,
  Prashant Gaikwad <pgaikwad@nvidia.com>,
  Thierry Reding <thierry.reding@gmail.com>,
  Jonathan Hunter <jonathanh@nvidia.com>,
  Ulf Hansson <ulf.hansson@linaro.org>,
  Linus Walleij <linus.walleij@linaro.org>,
 David Airlie <airlied@gmail.com>,  Daniel Vetter <daniel@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>,
  Kishon Vijay Abraham I <kishon@kernel.org>,
  Alessandro Zummo <a.zummo@towertech.it>, Chen-Yu Tsai <wens@csie.org>,
  Jernej Skrabec <jernej.skrabec@gmail.com>,
  Samuel Holland <samuel@sholland.org>,
 Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>,
 Paul Cercueil <paul@crapouillou.net>,  Orson Zhai <orsonzhai@gmail.com>,
  Baolin Wang <baolin.wang@linux.alibaba.com>,
  Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
 patches@opensource.cirrus.com, linux-stm32@st-md-mailman.stormreply.com, 
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-phy@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, alsa-devel@alsa-project.org, 
 linux-mips@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2379; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=oIkYxgEW1wSmTdA1zKexM85xcN8RdOO0qAcZnxlJQ4o=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37fKFxzRlAvcr8i/dIsg07lVerccJ7GYbfCo079cvrp+
 zr+kjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEzE8izDX7kZkxk/cqw+8mDFO54A3R
 MiGiscFO4+bnHL0HlYLPXg/FlGhpn1/3z8tmcdXOs9OT72neQLRVexc4aH9z7dIfo2naVmAh8A
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_053425_084965_76238957 
X-CRM114-Status: GOOD (  18.36  )
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

The Versaclock5 mux clock implements a mux with a set_parent hook, but
doesn't provide a determine_rate implementation.

This is a bit odd, since set_parent() is there to, as its name implies,
change the parent of a clock. However, the most likely candidate to
trigger that parent change is a call to clk_set_rate(), with
determine_rate() figuring out which parent is the best suited for a
given rate.

The other trigger would be a call to clk_set_parent(), but it's far less
used, and it doesn't look like there's any obvious user for that clock.

So, the set_parent hook is effectively unused, possibly because of an
oversight. However, it could also be an explicit decision by the
original author to avoid any reparenting but through an explicit call to
clk_set_parent().

The latter case would be equivalent to setting the flag
CLK_SET_RATE_NO_REPARENT, together with setting our determine_rate hook
to __clk_mux_determine_rate(). Indeed, if no determine_rate
implementation is provided, clk_round_rate() (through
clk_core_round_rate_nolock()) will call itself on the parent if
CLK_SET_RATE_PARENT is set, and will not change the clock rate
otherwise. __clk_mux_determine_rate() has the exact same behavior when
CLK_SET_RATE_NO_REPARENT is set.

And if it was an oversight, then we are at least explicit about our
behavior now and it can be further refined down the line.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk-versaclock5.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index fa71a57875ce..4b68d919f75b 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -281,6 +281,7 @@ static int vc5_mux_set_parent(struct clk_hw *hw, u8 index)
 }
 
 static const struct clk_ops vc5_mux_ops = {
+	.determine_rate	= __clk_mux_determine_rate,
 	.set_parent	= vc5_mux_set_parent,
 	.get_parent	= vc5_mux_get_parent,
 };
@@ -1029,7 +1030,7 @@ static int vc5_probe(struct i2c_client *client)
 
 	init.name = kasprintf(GFP_KERNEL, "%pOFn.mux", client->dev.of_node);
 	init.ops = &vc5_mux_ops;
-	init.flags = 0;
+	init.flags = CLK_SET_RATE_NO_REPARENT;
 	init.parent_names = parent_names;
 	vc5->clk_mux.init = &init;
 	ret = devm_clk_hw_register(&client->dev, &vc5->clk_mux);

-- 
2.39.2


