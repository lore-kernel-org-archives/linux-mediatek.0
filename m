Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EB5C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Nov 2022 13:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hhP29jEeBfRvzuLV/5grZHmqUXnMc+kegKMNYrrgAHI=; b=zuc17CqThPChBgyvL8sSe6m6gM
	c8rNvJZKrXUQ4ncuwufB51C37lAGMuqM/GpjeFAmjTLfphw4lsY/zwPC6YtgPc1FMS88GFzrWcZH2
	pmszeWsHtoBs4Jo891ha+DXOyDqBqBaG4oHRTVPoSQpta6DLQ8nGlylvQ58I38qnz6mMx2Z6dHmUU
	MbnQUaLGV0jbDFnS4EX3c3JnJ64Pf9N4IhLUvPpKFKv5/mwe/feeXtz1yxE09AoRhWIrsrToccAHS
	jzlRuBWfkoCtg9EgLasdVyufo76+UX7yRRfHM79ptBdX1hbgbz/BwR/Isvw2YF3odw73PW77rpuoV
	0BCu8GGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqwdE-003eia-46; Fri, 04 Nov 2022 13:21:12 +0000
Received: from new1-smtp.messagingengine.com ([66.111.4.221])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqwb9-003d9r-83; Fri, 04 Nov 2022 13:19:05 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.nyi.internal (Postfix) with ESMTP id 8E6E1580564;
	Fri,  4 Nov 2022 09:19:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 04 Nov 2022 09:19:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1667567942; x=
	1667575142; bh=hhP29jEeBfRvzuLV/5grZHmqUXnMc+kegKMNYrrgAHI=; b=V
	jvcfM9nj9GzEUwML8i0RWhLmpPgguA4VVeDPo3mpJMAwqKY2gUGf0ZNET1MmeJ8w
	axhLXzSnlwbck0udyyDdRT3wOfZMZck8s1lsego0su8vyK8Q9/jUqyIXDAYoI7xR
	NiVGnZaXvuTfgKKihUia4Vee8cMxaYFXjabKdjGTJoUoLV1gNYzMEahJcIJZcrfO
	U7qQW7mn9BAH5gRN+LMpWwt5+kEe4NAI77BtBBYRShU219E7XseOfb9BA0N6HArz
	spo3xuJUu9v77jfn8/6Z6JxH1zummUH8caTVrALB5PABEJTQie8WJSM1fdnVSOzS
	2kWN6fOnd2iq7iOxD7cDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667567942; x=
	1667575142; bh=hhP29jEeBfRvzuLV/5grZHmqUXnMc+kegKMNYrrgAHI=; b=R
	uGgbqTxzTUoc6LjVuqwzn1P7/NClCKa8APdk664rYH79Ggc3G0K8RwtjzAcun7q4
	4EPE8IjUb5Y06cBowmzaV9zRYCbTRsAsHBLbtyGCs65w//CPgR76uPY5dNiOEpYC
	9+MBBlFcC1x76g4fFx04EEbXn2TQqjdWiOus5zIlnx3TmT+eZ4tolYp+OhREZSN5
	RUgwss73bjI0fkfMHpoVKbfy5C81bsV8SEicV9V3a7XNNKrmUkTVsvug93J3UjCJ
	RVK/wiK3c3OT+aALghXK1e2ZtsHI6yIwZ+UYeCwIzVX6XQyVbiVQIfeZLh8q4xmr
	iTLDy1wgba5+abYj+Scxg==
X-ME-Sender: <xms:RhFlYyCjMISDwOzdtYmnCG_priYwnHzp157RLpyzrODaUC2rPc8PdA>
    <xme:RhFlY8hQumQE38gTGbMXdMzu_1NlwidqeZ5twahybW8zrGBQ2TuaSMg83XdmxbcpR
    6JOSq_9ntBPc8kRuGg>
X-ME-Received: <xmr:RhFlY1ltqCeugLi83HF0LdFap1lCLRykMWomOWsOtlmYkXi5iZMaC5_viwyleQjPQ8m_hR2gQBfDO3Lid4B-HIE-lEdUhqDwYpHq9l39TsS7hQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdegkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
    ledtveenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:RhFlYwzx43UF66P5oNlf7iVrCg94t5XUT9S_IHanjX6nanR5-Cy4Iw>
    <xmx:RhFlY3Qu8tflQ0oJakJ9e25u_GTFr_AV43hW1SziC7CF6sahjN1NNw>
    <xmx:RhFlY7absHNj-45Nh9Mu7UIUgtfEjRoH16Iatjkhh10ydaFWVWy7CA>
    <xmx:RhFlY1DhKg12YXfVE_5076tNfja__Mj7EJLSbfFdDT8fDc8K6-9Y6Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:19:00 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:47 +0100
Subject: [PATCH v2 30/65] clk: stm32: core: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-30-f6736dec138e@cerno.tech>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
To: Stephen Boyd <sboyd@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Daniel Vetter <daniel@ffwll.ch>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Andreas Färber <afaerber@suse.de>,
 Jonathan Hunter <jonathanh@nvidia.com>, Abel Vesa <abelvesa@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Orson Zhai <orsonzhai@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Samuel Holland <samuel@sholland.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Vinod Koul <vkoul@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Sekhar Nori <nsekhar@ti.com>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Takashi Iwai <tiwai@suse.com>,
 David Airlie <airlied@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 David Lechner <david@lechnology.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Mark Brown <broonie@kernel.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-stm32@st-md-mailman.stormreply.com, alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-mips@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
 linux-renesas-soc@vger.kernel.org, linux-actions@lists.infradead.org, linux-clk@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, patches@opensource.cirrus.com,
 linux-tegra@vger.kernel.org, linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=2135; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=Eu7Y9hu9fu4KEW6frLW2ZrjpgTapsHsdiRdYuhVIur8=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAl+mGnq9vZuX01usJ/UqulT/gX36ycL9uR7ypy7fvCCf
 vMG5o5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABcpZPjDo94ypz/949U1O9Z/KY7OEd
 vtHdTUaVXSIuzyp8yLv6mW4Q9nvmvE15hoJX1L/q9F6wr67x3fn8Uida2z6Dp76WPnVSwA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_061903_453733_371E74F0 
X-CRM114-Status: GOOD (  17.29  )
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

The STM32 mux clock implements a mux with a set_parent hook, but
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

Since the CLK_SET_RATE_NO_REPARENT flag was already set though, it seems
unlikely.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/stm32/clk-stm32-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/stm32/clk-stm32-core.c b/drivers/clk/stm32/clk-stm32-core.c
index 45a279e73779..3247539683c9 100644
--- a/drivers/clk/stm32/clk-stm32-core.c
+++ b/drivers/clk/stm32/clk-stm32-core.c
@@ -275,6 +275,7 @@ static int clk_stm32_mux_set_parent(struct clk_hw *hw, u8 index)
 }
 
 const struct clk_ops clk_stm32_mux_ops = {
+	.determine_rate	= __clk_mux_determine_rate,
 	.get_parent	= clk_stm32_mux_get_parent,
 	.set_parent	= clk_stm32_mux_set_parent,
 };

-- 
b4 0.11.0-dev-99e3a

