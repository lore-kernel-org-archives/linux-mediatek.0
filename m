Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2336C77B7E
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Apr 2023 12:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TJGhpZ04q0lSJf9msU73zyVVYvw2plkUpTOxo6iZDXU=; b=KVeSzAklJXObo9QM8PXoCGHQIM
	v8pfZLBJbKFe2bH2Vj5vzzajewfmm8UZYtjd8vqn6p9xWlzNJf2Na0/5FMyKWj9+uJciuMdUD+Q+/
	xTKnbW8oXSS2MYivCqF6uvfO3W1hVX5yVILwdWXdnCT1miiEuUpNJTbvS+Kr5BE/RuwBJx78UW2dR
	82m5/O5K4O+nXmRsmMjgJ20JLQm7fVd2N1z9wRvyY6e8tSHeRpyGXUnvMiCg4ggxjo9YVYg5x3Paq
	DbRihzml0Dvd8JktPrkMdQd1a3niEb43HNYg/0PhSxfdvrOwWeTSSHhImy9DSOA0BcNlb3TFIXBhe
	JemmbrRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjg21-001KCg-26;
	Tue, 04 Apr 2023 12:45:01 +0000
Received: from new3-smtp.messagingengine.com ([66.111.4.229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjg1w-001K7P-07;
	Tue, 04 Apr 2023 12:44:58 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailnew.nyi.internal (Postfix) with ESMTP id 642F3582178;
	Tue,  4 Apr 2023 08:44:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 04 Apr 2023 08:44:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1680612295; x=1680619495; bh=TJGhpZ04q0lSJf9msU73zyVVYvw2plkUpTO
	xo6iZDXU=; b=D+PZZTPaKYE20L6qAG2/+wOwasB7uQvE83JsxTGaY0yQpt6BpER
	9zXhooMiTEnPYGHKTb8V9HSgMOXpmOE60i6wyECBFpLhItlJJCsYCUWXmmMqb8F8
	zlu6lOXX2BnQxmhvrlJ0O3PyM+2w7JGTgCbWlRWnmpCGPkhZKDPsiavp+H4075DQ
	IOZKRwFfgtGpYILXpsl+Wq+zOv4RapkkhzUwhg7Nn1VM/xNAJF3xoX+gXg0gkv9A
	yUox0Z4gVWIEqJ7xb/D4tQg5IIQFw8pj4ekSIV97/8jbz/4YnsDqxCJ/BcDeEBxy
	7WChJQm5hFVuSLGz4Xn4No7J+gnewAMsbfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1680612295; x=1680619495; bh=TJGhpZ04q0lSJf9msU73zyVVYvw2plkUpTO
	xo6iZDXU=; b=XJtNlMXkwPFU0GzXi9UKEG/1336pFTjAB/Y1Eq1J3t1DnrtOWB6
	fejE/De1jwmve9x25L8p5qa+3iK/T1W5ldum2KUPDsbOApzXPPm9dPp108qpN9nv
	av4bDJCHtaGVFoAiuJOOY+1/weUKENq9fl6j+tZbXpdrw0171BrLPsB5OCTgY6rm
	36u/7CvM4XAw4DI+tBU3aXeLgpiz5JnP7TV5bpP4nwVABeIaWwC0WhhYZ5xtuocz
	ErT3I5KLLm8GyIP2mkt0PPWuGu1SQsgDNaGV7FzP46It7n/fF5PPS3FIGI60YTSl
	RLn6u78U2bd7/xhkPyTr+bdfFtQY3hUOJzQ==
X-ME-Sender: <xms:xxssZHjMIA00bVY0zF8SfPKaxwNtdYJRkaA1ZXFuRRXjuIAdvUAsrg>
    <xme:xxssZED7QOWGAmUeev_fDPcwWTFPpHCxBaCJgH5XvryPP5EBaZWYWlZHIqG2M1uFb
    TBnKekQVj5C3M47vzU>
X-ME-Received: <xmr:xxssZHHSxhRqBHaY_dlkWH_mzD7EcRMZD32v9LHjXJOTOcdZ2xfQN_tzZt94hFOdVTNkyep_rSt8QK11HAge0PrIruv4DRg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:xxssZESMyLxOrIdmShjgyTxv-hJsXwdkdHOVCC_rC-DlADGFpJHjBA>
    <xmx:xxssZEyVXBI6pThcNpg8u5XDARgakHyixvKKZY3YmhAqoejIpzn9_w>
    <xmx:xxssZK51hAqkDjhyS6woSiCM5Jq9LFYg5H3Xsknf2EL-EzpvU4-HOQ>
    <xmx:xxssZE_7ohhTU_9dMNsBLCu0SMH69OxnSHrkLCmD6-2qu8KNlYf6_Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 08:44:53 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 04 Apr 2023 12:11:18 +0200
Subject: [PATCH v3 28/65] clk: renesas: r9a06g032: Add a determine_rate
 hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-28-9a1358472d52@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2415; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=lzzmo3CIZrxJ4IrRMcofRv5U2kHlQ6j45JzEY7cK2ps=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37dxNO0QPM/7jbliSxi7SN/uHwoTbCzvxc/9arr5q+rG
 42fmdZSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAiQmmMDMtMHuz2TbRTn1a8dst/X9
 X6VmPd3Xcq2Z75KIvIdnLemcrwP0e78t4zhgAejVm3Lm/gPHWu6scJvZuvu785fW05wC2fzwUA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_054456_183198_D4D94E7C 
X-CRM114-Status: GOOD (  18.34  )
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

The Renesas r9a06g032 bitselect clock implements a mux with a set_parent
hook, but doesn't provide a determine_rate implementation.

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
 drivers/clk/renesas/r9a06g032-clocks.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index 40828616f723..56108b37f94e 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -1121,6 +1121,7 @@ static int r9a06g032_clk_mux_set_parent(struct clk_hw *hw, u8 index)
 }
 
 static const struct clk_ops clk_bitselect_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.get_parent = r9a06g032_clk_mux_get_parent,
 	.set_parent = r9a06g032_clk_mux_set_parent,
 };
@@ -1145,7 +1146,7 @@ r9a06g032_register_bitsel(struct r9a06g032_priv *clocks,
 
 	init.name = desc->name;
 	init.ops = &clk_bitselect_ops;
-	init.flags = CLK_SET_RATE_PARENT;
+	init.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT;
 	init.parent_names = names;
 	init.num_parents = 2;
 

-- 
2.39.2


